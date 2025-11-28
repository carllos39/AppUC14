buildscript {
    repositories {
        google()
        mavenCentral()
    }
}

plugins {
    id("com.google.gms.google-services") version "4.4.4" apply false
}

tasks.register<Delete>("clean") {
    delete(layout.buildDirectory)
}

