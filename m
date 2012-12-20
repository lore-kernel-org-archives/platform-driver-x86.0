From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 3/4] sony-laptop: allow reading the status of gfx switch
Date: Fri, 21 Dec 2012 07:21:10 +0900
Message-ID: <1356042071-8903-4-git-send-email-malattia@linux.it>
References: <1356042071-8903-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:37696 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751555Ab2LTW2E (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 20 Dec 2012 17:28:04 -0500
In-Reply-To: <1356042071-8903-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c |  121 +++++++++++++++++++++++++++++++++---
 1 file changed, 112 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 0fe987f..385835d 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -158,6 +158,11 @@ static void sony_nc_thermal_cleanup(struct platform_device *pd);
 static int sony_nc_lid_resume_setup(struct platform_device *pd);
 static void sony_nc_lid_resume_cleanup(struct platform_device *pd);
 
+static int sony_nc_gfx_switch_setup(struct platform_device *pd,
+		unsigned int handle);
+static void sony_nc_gfx_switch_cleanup(struct platform_device *pd);
+static int __sony_nc_gfx_switch_status_get(void);
+
 static int sony_nc_highspeed_charging_setup(struct platform_device *pd);
 static void sony_nc_highspeed_charging_cleanup(struct platform_device *pd);
 
@@ -1241,17 +1246,13 @@ static void sony_nc_notify(struct acpi_device *device, u32 event)
 			/* Hybrid GFX switching */
 			sony_call_snc_handle(handle, 0x0000, &result);
 			dprintk("GFX switch event received (reason: %s)\n",
-					(result & 0x01) ?
-					"switch change" : "unknown");
-
-			/* verify the switch state
-			 * 1: discrete GFX
-			 * 0: integrated GFX
-			 */
-			sony_call_snc_handle(handle, 0x0100, &result);
+					(result == 0x1) ? "switch change" :
+					(result == 0x2) ? "output switch" :
+					(result == 0x3) ? "output switch" :
+					"");
 
 			ev_type = GFX_SWITCH;
-			real_ev = result & 0xff;
+			real_ev = __sony_nc_gfx_switch_status_get();
 			break;
 
 		default:
@@ -1350,6 +1351,13 @@ static void sony_nc_function_setup(struct acpi_device *device,
 				pr_err("couldn't set up thermal profile function (%d)\n",
 						result);
 			break;
+		case 0x0128:
+		case 0x0146:
+			result = sony_nc_gfx_switch_setup(pf_device, handle);
+			if (result)
+				pr_err("couldn't set up GFX Switch status (%d)\n",
+						result);
+			break;
 		case 0x0131:
 			result = sony_nc_highspeed_charging_setup(pf_device);
 			if (result)
@@ -1414,6 +1422,10 @@ static void sony_nc_function_cleanup(struct platform_device *pd)
 		case 0x0122:
 			sony_nc_thermal_cleanup(pd);
 			break;
+		case 0x0128:
+		case 0x0146:
+			sony_nc_gfx_switch_cleanup(pd);
+			break;
 		case 0x0131:
 			sony_nc_highspeed_charging_cleanup(pd);
 			break;
@@ -2355,6 +2367,97 @@ static void sony_nc_lid_resume_cleanup(struct platform_device *pd)
 	}
 }
 
+/* GFX Switch position */
+enum gfx_switch {
+	SPEED,
+	STAMINA,
+	AUTO
+};
+struct snc_gfx_switch_control {
+	struct device_attribute attr;
+	unsigned int handle;
+};
+static struct snc_gfx_switch_control *gfxs_ctl;
+
+/* returns 0 for speed, 1 for stamina */
+static int __sony_nc_gfx_switch_status_get(void)
+{
+	unsigned int result;
+
+	if (sony_call_snc_handle(gfxs_ctl->handle, 0x0100, &result))
+		return -EIO;
+
+	switch (gfxs_ctl->handle) {
+	case 0x0146:
+		/* 1: discrete GFX (speed)
+		 * 0: integrated GFX (stamina)
+		 */
+		return result & 0x1 ? SPEED : STAMINA;
+		break;
+	case 0x0128:
+		/* it's a more elaborated bitmask, for now:
+		 * 2: integrated GFX (stamina)
+		 * 0: discrete GFX (speed)
+		 */
+		dprintk("GFX Status: 0x%x\n", result);
+		return result & 0x80 ? AUTO :
+			result & 0x02 ? STAMINA : SPEED;
+		break;
+	}
+	return -EINVAL;
+}
+
+static ssize_t sony_nc_gfx_switch_status_show(struct device *dev,
+				       struct device_attribute *attr,
+				       char *buffer)
+{
+	int pos = __sony_nc_gfx_switch_status_get();
+
+	if (pos < 0)
+		return pos;
+
+	return snprintf(buffer, PAGE_SIZE, "%s\n", pos ? "speed" : "stamina");
+}
+
+static int sony_nc_gfx_switch_setup(struct platform_device *pd,
+		unsigned int handle)
+{
+	unsigned int result;
+
+	gfxs_ctl = kzalloc(sizeof(struct snc_gfx_switch_control), GFP_KERNEL);
+	if (!gfxs_ctl)
+		return -ENOMEM;
+
+	gfxs_ctl->handle = handle;
+
+	sysfs_attr_init(&gfxs_ctl->attr.attr);
+	gfxs_ctl->attr.attr.name = "gfx_switch_status";
+	gfxs_ctl->attr.attr.mode = S_IRUGO;
+	gfxs_ctl->attr.show = sony_nc_gfx_switch_status_show;
+
+	result = device_create_file(&pd->dev, &gfxs_ctl->attr);
+	if (result)
+		goto gfxerror;
+
+	return 0;
+
+gfxerror:
+	kfree(gfxs_ctl);
+	gfxs_ctl = NULL;
+
+	return result;
+}
+
+static void sony_nc_gfx_switch_cleanup(struct platform_device *pd)
+{
+	if (gfxs_ctl) {
+		device_remove_file(&pd->dev, &gfxs_ctl->attr);
+
+		kfree(gfxs_ctl);
+		gfxs_ctl = NULL;
+	}
+}
+
 /* High speed charging function */
 static struct device_attribute *hsc_handle;
 
-- 
1.7.10.4
