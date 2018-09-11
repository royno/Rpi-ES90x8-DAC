/*
 * es9018k2m.h  --  es9018k2m Soc Audio driver
 *
 * Copyright 2005 Openedhand Ltd.
 *
 * Author: Richard Purdie <richard@openedhand.com>
 *
 * Based on es9018k2m.h
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 */

#ifndef _ES9038Q2M_H
#define _ES9038Q2M_H

#include <linux/regmap.h>
#include <linux/regulator/consumer.h>
#include <linux/of_device.h>
#include <sound/soc.h>
#include <linux/mutex.h>

/* ES9038Q2M register space */

#define ES9038Q2M_SYSTEM_SETTING    			0x00
#define ES9038Q2M_INPUT_CONFIG   			0x01
#define ES9038Q2M_DEEMPHASIS_DOP   			0x06
#define ES9038Q2M_FLT_BW_MUTE   			0x07
#define ES9038Q2M_SOFT_START	   			0x0E
#define ES9038Q2M_VOLUME1	   			0x0F
#define ES9038Q2M_VOLUME2	   			0x10

#endif
