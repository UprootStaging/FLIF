CXXFLAGS := $(shell pkg-config --cflags zlib libpng)
LDFLAGS := $(shell pkg-config --libs zlib libpng)

flif: maniac/*.h maniac/*.cpp image/*.h image/*.cpp transform/*.h transform/*.cpp flif.cpp flif-enc.cpp flif-dec.cpp common.cpp flif.h flif-enc.h flif-dec.h common.h flif_config.h fileio.h
	$(CXX) -std=gnu++11 $(CXXFLAGS) -DNDEBUG -O3 -g0 -Wall -Werror maniac/util.cpp maniac/chance.cpp image/crc32k.cpp image/image.cpp image/image-png.cpp image/image-pnm.cpp image/image-pam.cpp image/color_range.cpp transform/factory.cpp flif.cpp common.cpp flif-enc.cpp flif-dec.cpp -o flif $(LDFLAGS)

flif.prof: maniac/*.h maniac/*.cpp image/*.h image/*.cpp transform/*.h transform/*.cpp flif.cpp flif.h flif_config.h
	$(CXX) -std=gnu++11 $(CXXFLAGS) -DNDEBUG -O3 -g0 -pg -Wall -Werror maniac/util.cpp maniac/chance.cpp image/crc32k.cpp image/image.cpp image/image-png.cpp image/image-pnm.cpp image/image-pam.cpp image/color_range.cpp transform/factory.cpp flif.cpp common.cpp flif-enc.cpp flif-dec.cpp -o flif.prof $(LDFLAGS)

flif.dbg: maniac/*.h maniac/*.cpp image/*.h image/*.cpp transform/*.h transform/*.cpp flif.cpp flif.h flif_config.h
	$(CXX) -std=gnu++11 $(CXXFLAGS) -O0 -ggdb3 -Wall -Werror maniac/util.cpp maniac/chance.cpp image/crc32k.cpp image/image.cpp image/image-png.cpp image/image-pnm.cpp image/image-pam.cpp image/color_range.cpp transform/factory.cpp flif.cpp common.cpp flif-enc.cpp flif-dec.cpp -o flif.dbg $(LDFLAGS)

test: flif
	mkdir -p testFiles
	./tools/test-roundtrip.sh benchmark/input/webp_gallery/2_webp_ll.png testFiles/2_webp_ll.flif testFiles/decoded_2_webp_ll.png
	./tools/test-roundtrip.sh benchmark/input/kodak/kodim01.png testFiles/kodim01.flif testFiles/decoded_kodim01.png

