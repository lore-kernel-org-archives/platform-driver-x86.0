From: Frans Klaver <fransklaver@gmail.com>
Subject: [PATCH 01/13] eeepc-laptop: coding style: fix indentation
Date: Sat, 13 Sep 2014 01:06:40 +0200
Message-ID: <1410563212-31565-2-git-send-email-fransklaver@gmail.com>
References: <1410563212-31565-1-git-send-email-fransklaver@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1410563212-31565-1-git-send-email-fransklaver@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Frans Klaver <fransklaver@gmail.com>, Corentin Chary <corentin.chary@gmail.com>, Rafael Wysocki <rafael.j.wysocki@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/platform/x86/eeepc-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/eeepc-laptop.c b/drivers/platform/x86/eeepc-laptop.c
index 90be993..982778f 100644
--- a/drivers/platform/x86/eeepc-laptop.c
+++ b/drivers/platform/x86/eeepc-laptop.c
@@ -544,7 +544,7 @@ static int eeepc_led_init(struct eeepc_laptop *eeepc)
 	eeepc->tpd_led.name = "eeepc::touchpad";
 	eeepc->tpd_led.brightness_set = tpd_led_set;
 	if (get_acpi(eeepc, CM_ASL_TPD) >= 0) /* if method is available */
-	  eeepc->tpd_led.brightness_get = tpd_led_get;
+		eeepc->tpd_led.brightness_get = tpd_led_get;
 	eeepc->tpd_led.max_brightness = 1;
 
 	rv = led_classdev_register(&eeepc->platform_device->dev,
-- 
2.1.0
