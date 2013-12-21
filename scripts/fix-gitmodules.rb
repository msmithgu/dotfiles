puts "*** Fix gitmodules ***"

my_gms = `grep '=' .gitmodules | awk '{print $3}'`.split()

def process_gms(gms)
  if gms.count >= 2
    gm = gms.take(2)
    path = gm.first
    url = gm.last
    cmd = "git submodule add #{url} #{path}"
    `#{cmd}`
    if gms.count >= 4
      process_gms(gms[2..gms.count])
    end
  end
end

process_gms(my_gms)
