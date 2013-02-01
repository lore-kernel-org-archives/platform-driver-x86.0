From: Benson Leung <bleung@chromium.org>
Subject: [PATCH 2/4] Platform: x86: chromeos_laptop - Add Acer C7 trackpad
Date: Fri,  1 Feb 2013 14:34:44 -0800
Message-ID: <1359758086-2320-3-git-send-email-bleung@chromium.org>
References: <1359758086-2320-1-git-send-email-bleung@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1359758086-2320-1-git-send-email-bleung@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: matthew.garrett@nebula.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: bleung@chromium.org, olofj@chromium.org, olof@lixom.net
List-Id: platform-driver-x86.vger.kernel.org

Add support for the Acer C7's trackpad, which is a reuse
of the Samsung Series 5 550 trackpad.

Signed-off-by: Benson Leung <bleung@chromium.org>
---
 drivers/platform/x86/chromeos_laptop.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/chromeos_laptop.c b/drivers/platform/x86/chromeos_laptop.c
index 6440d22..9293c66 100644
--- a/drivers/platform/x86/chromeos_laptop.c
+++ b/drivers/platform/x86/chromeos_laptop.c
@@ -176,6 +176,13 @@ static struct dmi_system_id __initdata chromeos_laptop_dmi_table[] = {
 		},
 		.callback = setup_isl29018_als,
 	},
+	{
+		.ident = "Acer C7 Chromebook - Touchpad",
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_NAME, "Parrot"),
+		},
+		.callback = setup_cyapa_smbus_tp,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(dmi, chromeos_laptop_dmi_table);
-- 
1.8.1
