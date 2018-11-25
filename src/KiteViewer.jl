__precompile__(false)

module KiteViewer

using Makie
using GeometryTypes

export init, show3d

global scene

greet() = print("Hello World!")

function init()
    global scene
    x = Vec3f0(0); baselen = 0.2f0; dirlen = 1f0
    # create an array of differently colored boxes in the direction of the 3 axes
    rectangles = [
        (HyperRectangle(Vec3f0(x), Vec3f0(dirlen, baselen, baselen)), RGBAf0(1,0,0,1)),
        (HyperRectangle(Vec3f0(x), Vec3f0(baselen, dirlen, baselen)), RGBAf0(0,1,0,1)),
        (HyperRectangle(Vec3f0(x), Vec3f0(baselen, baselen, dirlen)), RGBAf0(0,0,1,1))
    ]
    meshes = map(GLNormalMesh, rectangles)
    scene=mesh(merge(meshes))
    nothing
end

show3d()=display(Makie.Screen(), scene)

end # module