# Creating a new ASP.NET Core project with React and Authentication

## Prerequisites
1. Install Visual Studio Code
2. Install NuGet Package Manager
3. Install `dotnet-ef`
```
dotnet tool install --global dotnet-ef
```

## Creating a new project
https://docs.microsoft.com/en-us/aspnet/core/client-side/spa/react?view=aspnetcore-5.0&tabs=visual-studio  
https://docs.microsoft.com/en-us/aspnet/core/security/authentication/identity-api-authorization?view=aspnetcore-5.0

1. Create a new dotnet app
```
dotnet new react -o my-new-app -au Individual
cd my-new-app
```

2. Set environment
```
$Env:ASPNETCORE_ENVIRONMENT = "Development"
```

3. Run the creat-react-app (CRA) server independently
- Add a `.env` file to the ClientApp subdirectory with the following setting:
```
BROWSER=none
```

- Start CRA 
```
cd ./ClientApp/
npm start
```

- In `Startup.cs`, replace `spa.UseReactDevelopmentServer(...)` with this
```
spa.UseProxyToSpaDevelopmentServer("http://localhost:3000");
```

4. Update `Microsoft.AspNetCore.SpaServices` (if needed)
```
cd ./ClientApp/
npx browserslist@latest --update-db
```

5. Update default packages as needed via `my-new-app.csproj`.  These should all have the same version number.
- Microsoft.AspNetCore.SpaServices.Extensions
- Microsoft.AspNetCore.ApiAuthorization.IdentityServer
- Microsoft.AspNetCore.Diagnostics.EntityFrameworkCore
- Microsoft.AspNetCore.Identity.EntityFrameworkCore
- Microsoft.AspNetCore.Identity.UI
- Microsoft.EntityFrameworkCore.Relational
- Microsoft.EntityFrameworkCore.Tools
- Microsoft.EntityFrameworkCore.SqlServer
- Remove Microsoft.EntityFrameworkCore.Sqlite

6. Create a database `my_new_db`
- Create user `my_new_db_user` with some password
- Give the user access to the database
- Add the connection string to `appsettings.Development.json`
```
"ConnectionStrings": {
  "DefaultConnection": "Server=my-server;Database=my_new_db;User Id=my_new_db_user;Password=my-password"
},
```

- Update `Startup.cs`, `ConfigureServices()` to use SqlServer (instead of SQLite)
```
services.AddDbContext<ApplicationDbContext>(options =>
	options.UseSqlServer(
		Configuration.GetConnectionString("DefaultConnection")));
```

- Remove existing migration files (because they're meant for SQLite)
   - /Data/Migrations/00000000000000_CreateIdentitySchema.cs
   - /Data/Migrations/00000000000000_CreateIdentitySchema.Designer.cs
   - /Data/Migrations/ApplicationDbContextModelSnapshot.cs
- Regenerate the migration files for SQL Server (optionally rename the generated files to have `00000000000000_` prefix)
```
dotnet ef migrations add CreateIdentitySchema --output-dir "Data/Migrations"
```

- Run EF Migration to set up the initial database
```
dotnet ef database update 
```

7. Build and run the project
```
dotnet build
dotnet run
```

8. Load the site via https://localhost:5001


## Running locally
Each time you want to start a new development session, do the following 

1. Set environment
```
$Env:ASPNETCORE_ENVIRONMENT = "Development"
```

2. Start React
```
cd ./src/xe-ideas/ClientApp/
npm start
```

3. Build backend code
```
dotnet build
```

4. Start backend server
```
dotnet run
```
