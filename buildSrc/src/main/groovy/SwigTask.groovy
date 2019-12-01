import org.gradle.api.DefaultTask
import org.gradle.api.tasks.Input
import org.gradle.api.tasks.InputDirectory
import org.gradle.api.tasks.InputFile
import org.gradle.api.tasks.OutputDirectory
import org.gradle.api.tasks.TaskAction
import org.apache.commons.io.FileUtils

class SwigTask extends DefaultTask {

    @Input
    String javaPackageName

    @InputDirectory
    def inputDir

    @InputFile
    def inputFile

    @OutputDirectory
    File javaOutDir = project.file("${project.buildDir.absolutePath}/generated/swig/java")

    @OutputDirectory
    File cppOutDir = project.file("${project.buildDir.absolutePath}/generated/swig/cpp")

    @TaskAction
    def doAction() {
        FileUtils.cleanDirectory(javaOutDir)
        FileUtils.cleanDirectory(cppOutDir)

        def javaPackagePath = javaPackageName.replaceAll("\\.", "/")
        def javaPackageDir = "${javaOutDir.absolutePath}/$javaPackagePath"
        new File(javaPackageDir).mkdirs()
        def cppOutputFile = "$cppOutDir/${inputFile.name.split("\\.").first()}.cc"

        project.exec {
            workingDir inputDir
            commandLine "swig"
            args(
                    "-v",
                    "-java",
                    "-c++",
                    "-doxygen",
                    "-package", "$javaPackageName",
                    "-Iinclude",
                    "-outdir", "$javaPackageDir",
                    "-o", cppOutputFile,
                    inputFile
            )
        }
    }
}