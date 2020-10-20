FROM mcr.microsoft.com/dotnet/core-nightly/sdk:5.0
# AS build-env

EXPOSE 5000/tcp
EXPOSE 5001/tcp
EXPOSE 80/tcp

ARG BUILD_CONFIGURATION=Debug
ENV ASPNETCORE_ENVIRONMENT=Development
ENV DOTNET_USE_POLLING_FILE_WATCHER=true  
ENV ASPNETCORE_URLS=http://+:5000 

WORKDIR /app

# Copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore

# Copy everything else and build
COPY . ./
CMD dotnet run --server.urls http://*:5000
# RUN dotnet publish -c Release -o out

# # Build runtime image
# FROM mcr.microsoft.com/dotnet/core-nightly/aspnet:5.0
# EXPOSE 80
# WORKDIR /app
# COPY --from=build-env /app/out .
# ENTRYPOINT ["dotnet", "api.dll"]
