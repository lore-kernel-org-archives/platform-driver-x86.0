From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 1/2] platform/x86: GPD pocket fan: Use default values when wrong modparams are given
Date: Mon,  6 Jan 2020 15:42:18 +0100
Message-ID: <20200106144219.525215-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Jason Anderson <jasona.594@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Use our default values when wrong module-parameters are given, instead of
refusing to load. Refusing to load leaves the fan at the BIOS default
setting, which is "Off". The CPU's thermal throttling should protect the
system from damage, but not-loading is really not the best fallback in th=
is
case.

This commit fixes this by re-setting module-parameter values to their
defaults if they are out of range, instead of failing the probe with
-EINVAL.

Cc: stable@vger.kernel.org
Cc: Jason Anderson <jasona.594@gmail.com>
Reported-by: Jason Anderson <jasona.594@gmail.com>
Fixes: 594ce6db326e ("platform/x86: GPD pocket fan: Use a min-speed of 2 =
while charging")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/gpd-pocket-fan.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/gpd-pocket-fan.c b/drivers/platform/x86=
/gpd-pocket-fan.c
index be85ed966bf3..1e6a42f2ea8a 100644
--- a/drivers/platform/x86/gpd-pocket-fan.c
+++ b/drivers/platform/x86/gpd-pocket-fan.c
@@ -16,17 +16,26 @@
=20
 #define MAX_SPEED 3
=20
-static int temp_limits[3] =3D { 55000, 60000, 65000 };
+#define TEMP_LIMIT0_DEFAULT	55000
+#define TEMP_LIMIT1_DEFAULT	60000
+#define TEMP_LIMIT2_DEFAULT	65000
+
+#define HYSTERESIS_DEFAULT	3000
+
+#define SPEED_ON_AC_DEFAULT	2
+
+static int temp_limits[3] =3D {
+	TEMP_LIMIT0_DEFAULT, TEMP_LIMIT1_DEFAULT, TEMP_LIMIT2_DEFAULT };
 module_param_array(temp_limits, int, NULL, 0444);
 MODULE_PARM_DESC(temp_limits,
 		 "Millicelsius values above which the fan speed increases");
=20
-static int hysteresis =3D 3000;
+static int hysteresis =3D HYSTERESIS_DEFAULT;
 module_param(hysteresis, int, 0444);
 MODULE_PARM_DESC(hysteresis,
 		 "Hysteresis in millicelsius before lowering the fan speed");
=20
-static int speed_on_ac =3D 2;
+static int speed_on_ac =3D SPEED_ON_AC_DEFAULT;
 module_param(speed_on_ac, int, 0444);
 MODULE_PARM_DESC(speed_on_ac,
 		 "minimum fan speed to allow when system is powered by AC");
@@ -120,18 +129,21 @@ static int gpd_pocket_fan_probe(struct platform_dev=
ice *pdev)
 		if (temp_limits[i] < 40000 || temp_limits[i] > 70000) {
 			dev_err(&pdev->dev, "Invalid temp-limit %d (must be between 40000 and=
 70000)\n",
 				temp_limits[i]);
-			return -EINVAL;
+			temp_limits[0] =3D TEMP_LIMIT0_DEFAULT;
+			temp_limits[1] =3D TEMP_LIMIT1_DEFAULT;
+			temp_limits[2] =3D TEMP_LIMIT2_DEFAULT;
+			break;
 		}
 	}
 	if (hysteresis < 1000 || hysteresis > 10000) {
 		dev_err(&pdev->dev, "Invalid hysteresis %d (must be between 1000 and 1=
0000)\n",
 			hysteresis);
-		return -EINVAL;
+		hysteresis =3D HYSTERESIS_DEFAULT;
 	}
 	if (speed_on_ac < 0 || speed_on_ac > MAX_SPEED) {
 		dev_err(&pdev->dev, "Invalid speed_on_ac %d (must be between 0 and 3)\=
n",
 			speed_on_ac);
-		return -EINVAL;
+		speed_on_ac =3D SPEED_ON_AC_DEFAULT;
 	}
=20
 	fan =3D devm_kzalloc(&pdev->dev, sizeof(*fan), GFP_KERNEL);
--=20
2.24.1
