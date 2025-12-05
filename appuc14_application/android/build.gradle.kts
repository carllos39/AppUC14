buildscript {
    repositories {
        google()
        mavenCentral()
    }
}
tasks.register<Delete>("clean") {
    delete(layout.buildDirectory)
}
plugins {
    id("com.google.gms.google-services") version "4.4.4" apply false
    
}

