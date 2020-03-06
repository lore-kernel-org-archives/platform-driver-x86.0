From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] platform/x86: GPD pocket fan: Fix error message when temp-limits are out of range
Date: Fri,  6 Mar 2020 10:17:24 +0100
Message-ID: <20200306091724.55347-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Pavel Machek <pavel@denx.de>
List-Id: platform-driver-x86.vger.kernel.org

Commit 1f27dbd8265d ("platform/x86: GPD pocket fan: Allow somewhat
lower/higher temperature limits") changed the module-param sanity check
to accept temperature limits between 20 and 90 degrees celcius.

But the error message printed when the module params are outside this
range was not updated. This commit updates the error message to match
the new min and max value for the temp-limits.

Reported-by: Pavel Machek <pavel@denx.de>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/gpd-pocket-fan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/gpd-pocket-fan.c b/drivers/platform/x86=
/gpd-pocket-fan.c
index b471b86c28fe..5b516e4c2bfb 100644
--- a/drivers/platform/x86/gpd-pocket-fan.c
+++ b/drivers/platform/x86/gpd-pocket-fan.c
@@ -128,7 +128,7 @@ static int gpd_pocket_fan_probe(struct platform_devic=
e *pdev)
=20
 	for (i =3D 0; i < ARRAY_SIZE(temp_limits); i++) {
 		if (temp_limits[i] < 20000 || temp_limits[i] > 90000) {
-			dev_err(&pdev->dev, "Invalid temp-limit %d (must be between 40000 and=
 70000)\n",
+			dev_err(&pdev->dev, "Invalid temp-limit %d (must be between 20000 and=
 90000)\n",
 				temp_limits[i]);
 			temp_limits[0] =3D TEMP_LIMIT0_DEFAULT;
 			temp_limits[1] =3D TEMP_LIMIT1_DEFAULT;
--=20
2.25.1
