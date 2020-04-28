From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 03/11] iio: light: cm32181: Add some extra register defines
Date: Tue, 28 Apr 2020 19:29:15 +0200
Message-ID: <20200428172923.567806-3-hdegoede@redhat.com>
References: <20200428172923.567806-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200428172923.567806-1-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Rafael J . Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Len Brown <lenb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-acpi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

These come from a newer version of cm32181.c, which is floating around
the net, with a copyright of:

 * Copyright (C) 2014 Capella Microsystems Inc.
 * Author: Kevin Tsai <ktsai-GubuWUlQtMwciDkP5Hr2oA@public.gmane.org>
 *
 * This program is free software; you can redistribute it and/or modify i=
t
 * under the terms of the GNU General Public License version 2, as publis=
hed
 * by the Free Software Foundation.

Note that this removes the bogus CM32181_CMD_ALS_ENABLE define, there
is no enable bit, only a disable bit and enabled is the absence of
being disabled.

This is a preparation patch for adding support for the older
CM3218 model of the light sensor.

Reviewed-by: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/iio/light/cm32181.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/light/cm32181.c b/drivers/iio/light/cm32181.c
index 5ca8bbf6667c..6fc0a753c499 100644
--- a/drivers/iio/light/cm32181.c
+++ b/drivers/iio/light/cm32181.c
@@ -18,6 +18,9 @@
=20
 /* Registers Address */
 #define CM32181_REG_ADDR_CMD		0x00
+#define CM32181_REG_ADDR_WH		0x01
+#define CM32181_REG_ADDR_WL		0x02
+#define CM32181_REG_ADDR_TEST		0x03
 #define CM32181_REG_ADDR_ALS		0x04
 #define CM32181_REG_ADDR_STATUS		0x06
 #define CM32181_REG_ADDR_ID		0x07
@@ -26,9 +29,13 @@
 #define CM32181_CONF_REG_NUM		0x01
=20
 /* CMD register */
-#define CM32181_CMD_ALS_ENABLE		0x00
-#define CM32181_CMD_ALS_DISABLE		0x01
-#define CM32181_CMD_ALS_INT_EN		0x02
+#define CM32181_CMD_ALS_DISABLE		BIT(0)
+#define CM32181_CMD_ALS_INT_EN		BIT(1)
+#define CM32181_CMD_ALS_THRES_WINDOW	BIT(2)
+
+#define CM32181_CMD_ALS_PERS_SHIFT	4
+#define CM32181_CMD_ALS_PERS_MASK	(0x03 << CM32181_CMD_ALS_PERS_SHIFT)
+#define CM32181_CMD_ALS_PERS_DEFAULT	(0x01 << CM32181_CMD_ALS_PERS_SHIFT=
)
=20
 #define CM32181_CMD_ALS_IT_SHIFT	6
 #define CM32181_CMD_ALS_IT_MASK		(0x0F << CM32181_CMD_ALS_IT_SHIFT)
@@ -82,7 +89,7 @@ static int cm32181_reg_init(struct cm32181_chip *cm3218=
1)
 		return -ENODEV;
=20
 	/* Default Values */
-	cm32181->conf_regs[CM32181_REG_ADDR_CMD] =3D CM32181_CMD_ALS_ENABLE |
+	cm32181->conf_regs[CM32181_REG_ADDR_CMD] =3D
 			CM32181_CMD_ALS_IT_DEFAULT | CM32181_CMD_ALS_SM_DEFAULT;
 	cm32181->calibscale =3D CM32181_CALIBSCALE_DEFAULT;
=20
--=20
2.26.0
