class Scene
  @@scenes = {}

  @@current_scene_name = nil

  def self.add_scene(scene_obj, scene_name)
    @@scenes[scene_name.to_sym] = scene_obj
  end


  def self.set_current_scene(scene_name)
    if @@scenes[@@current_scene_name]
      if @@scenes[@@current_scene_name].respond_to?(:stop)
        @@scenes[@@current_scene_name].stop
      end
    end
    @@current_scene_name = scene_name.to_sym
  end


  def self.play_scene
    @@scenes[@@current_scene_name].play
  end
end