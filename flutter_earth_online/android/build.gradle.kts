import java.io.File

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// 使用绝对路径设置构建目录
val projectRoot = rootProject.projectDir.parentFile
val newBuildDir = File(projectRoot, "build")

rootProject.layout.buildDirectory.set(newBuildDir)

subprojects {
    project.layout.buildDirectory.set(File(newBuildDir, project.name))
}

subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
