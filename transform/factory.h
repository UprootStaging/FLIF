#ifndef _TRANSFORM_FACTORY_H_
#define _TRANSFORM_FACTORY_H_

#include "transform.h"
#include <string>

template <typename IO>
Transform<IO> *create_transform(std::string desc);

#endif
