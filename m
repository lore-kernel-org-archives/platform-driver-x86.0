From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] surface pro 3: add a warning when switching to tablet mode
Date: Tue, 10 May 2016 14:49:55 +0300
Message-ID: <1462880995-66192-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:44068 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751767AbcEJLuA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 10 May 2016 07:50:00 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Chen Yu <yu.c.chen@intel.com>, Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Microsoft Surface Book has a tablet mode button. Print another message once on
this even instead of a bit annoying repetition of "Unknown event...".

Unfortunately we can't right now to implement the proper support of this since
_DSM method is very likely owned by Microsoft and it's not too easy to just run
it. Thus print a warning for now.

One may consider to evaluate GGIV method which seems responsible to return
current mode in use.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/surfacepro3_button.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/surfacepro3_button.c b/drivers/platform/x86/surfacepro3_button.c
index 700e0fa..6505c97 100644
--- a/drivers/platform/x86/surfacepro3_button.c
+++ b/drivers/platform/x86/surfacepro3_button.c
@@ -24,6 +24,8 @@
 #define SURFACE_BUTTON_OBJ_NAME		"VGBI"
 #define SURFACE_BUTTON_DEVICE_NAME	"Surface Pro 3/4 Buttons"
 
+#define SURFACE_BUTTON_NOTIFY_TABLET_MODE	0xc8
+
 #define SURFACE_BUTTON_NOTIFY_PRESS_POWER	0xc6
 #define SURFACE_BUTTON_NOTIFY_RELEASE_POWER	0xc7
 
@@ -33,7 +35,7 @@
 #define SURFACE_BUTTON_NOTIFY_PRESS_VOLUME_UP	0xc0
 #define SURFACE_BUTTON_NOTIFY_RELEASE_VOLUME_UP	0xc1
 
-#define SURFACE_BUTTON_NOTIFY_PRESS_VOLUME_DOWN	0xc2
+#define SURFACE_BUTTON_NOTIFY_PRESS_VOLUME_DOWN		0xc2
 #define SURFACE_BUTTON_NOTIFY_RELEASE_VOLUME_DOWN	0xc3
 
 ACPI_MODULE_NAME("surface pro 3 button");
@@ -105,9 +107,12 @@ static void surface_button_notify(struct acpi_device *device, u32 event)
 	case SURFACE_BUTTON_NOTIFY_RELEASE_VOLUME_DOWN:
 		key_code = KEY_VOLUMEDOWN;
 		break;
+	case SURFACE_BUTTON_NOTIFY_TABLET_MODE:
+		dev_warn_once(&device->dev, "Tablet mode is not supported\n");
+		break;
 	default:
 		dev_info_ratelimited(&device->dev,
-				  "Unsupported event [0x%x]\n", event);
+				     "Unsupported event [0x%x]\n", event);
 		break;
 	}
 	input = button->input;
-- 
2.8.1
