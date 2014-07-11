# renderer
renderer = new THREE.WebGLRenderer()
renderer.setSize($(window).width(),$(window).height())

# scene
scene = new THREE.Scene()

# camera
camera = new THREE.PerspectiveCamera( 60,$(window).width() / $(window).height(), 1, 10000 )
camera.position.z = 1000

# light
light = new THREE.AmbientLight(0x555555)
directionallight = new THREE.DirectionalLight(0xffaaaa)
directionallight.position.set(50000,0,0)

# object
earth = new THREE.Object3D()
geometry = new THREE.SphereGeometry( 500, 50, 50 )
material = new THREE.MeshLambertMaterial({overdraw: 0.5 })
mesh = new THREE.Mesh( geometry, material)
earth.add(mesh)


$ ->
  scene.add( earth )
  scene.add( light )
  scene.add( directionallight )

  # container
  container = $('#container')[0]


  # set to container
  container.appendChild( renderer.domElement )

  ################
  # animation
  ################
  animate = () ->
    requestAnimationFrame(animate)
    render()

  ################
  # render
  ################
  render = () ->
    renderer.render( scene, camera )

  animate()

