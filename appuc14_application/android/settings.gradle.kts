pluginManagement {
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        google()
        mavenCentral()
    }
}

rootProject.name = "SeuProjeto"
include(":app")

// ====== Correção do buildDirectory ======

val newBuildDir = layout.buildDirectory.dir("../../build").get()
layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir = newBuildDir.dir(name)
    layout.buildDirectory.value(newSubprojectBuildDir)
}
