From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 2/2] platform/x86: GPD pocket fan: Allow somewhat lower/higher temperature limits
Date: Mon,  6 Jan 2020 15:42:19 +0100
Message-ID: <20200106144219.525215-2-hdegoede@redhat.com>
References: <20200106144219.525215-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200106144219.525215-1-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Anderson <jasona.594@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Allow the user to configure the fan to turn on / speed-up at lower
thresholds then before (20 degrees Celcius as minimum instead of 40) and
likewise also allow the user to delay the fan speeding-up till the
temperature hits 90 degrees Celcius (was 70).

Cc: Jason Anderson <jasona.594@gmail.com>
Reported-by: Jason Anderson <jasona.594@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/gpd-pocket-fan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/gpd-pocket-fan.c b/drivers/platform/x86=
/gpd-pocket-fan.c
index 1e6a42f2ea8a..0ffcbf9bc18e 100644
--- a/drivers/platform/x86/gpd-pocket-fan.c
+++ b/drivers/platform/x86/gpd-pocket-fan.c
@@ -126,7 +126,7 @@ static int gpd_pocket_fan_probe(struct platform_devic=
e *pdev)
 	int i;
=20
 	for (i =3D 0; i < ARRAY_SIZE(temp_limits); i++) {
-		if (temp_limits[i] < 40000 || temp_limits[i] > 70000) {
+		if (temp_limits[i] < 20000 || temp_limits[i] > 90000) {
 			dev_err(&pdev->dev, "Invalid temp-limit %d (must be between 40000 and=
 70000)\n",
 				temp_limits[i]);
 			temp_limits[0] =3D TEMP_LIMIT0_DEFAULT;
--=20
2.24.1
