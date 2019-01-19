# How to publish a package on nuget.org

## Visual Studio
- Right click on the project
- Select "Properties"
- Make sure all the values are properly set
- Specifically under "Package"
  - Check "Generate NuGet package on build"
  - Fill out the information
- Build the project with "Release" configuration
- Verify that this file exist: `{project-folder}\bin\Release\{project-name}.{version-number}.nupkg`

## NuGet.org
- Sign into nuget.org
- Click on your username on top right of the page
- Click "Upload Package"
- Upload the `.nupkg` file from above
- Verify the package information is correct
