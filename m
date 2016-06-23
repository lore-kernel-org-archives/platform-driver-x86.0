From: Stefan Seidel <lkml@stefanseidel.info>
Subject: [PATCH] sony-laptop: add new thermal control handle
Date: Thu, 23 Jun 2016 20:21:22 +0200
Message-ID: <20160623202122.Horde.TxvrWAneTMWnwZqVFW5oO0g@horde.stefanseidel.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.teration.net ([213.136.64.78]:47723 "EHLO
	mail.teration.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751476AbcFWS3e (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 23 Jun 2016 14:29:34 -0400
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: platform-driver-x86@vger.kernel.org

Hi,

this patch enables thermal control options on my VAIO Duo 11. I hope I  
have not made too many mistakes with it.

On at least the SVD11 there is an additional thermal control setting that
is found at a different handle address but otherwise behaves the same as
the other one.

Signed-off-by: Stefan Seidel <lkml@stefanseidel.info>
---
  drivers/platform/x86/sony-laptop.c | 29 ++++++++++++++++++-----------
  1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c  
b/drivers/platform/x86/sony-laptop.c
index 1dba359..550e8fa 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -148,7 +148,8 @@ static int sony_nc_battery_care_setup(struct  
platform_device *pd,
  		unsigned int handle);
  static void sony_nc_battery_care_cleanup(struct platform_device *pd);

-static int sony_nc_thermal_setup(struct platform_device *pd);
+static int sony_nc_thermal_setup(struct platform_device *pd,
+				 unsigned int handle);
  static void sony_nc_thermal_cleanup(struct platform_device *pd);

  static int sony_nc_lid_resume_setup(struct platform_device *pd,
@@ -1363,7 +1364,8 @@ static void sony_nc_function_setup(struct  
acpi_device *device,
  						result);
  			break;
  		case 0x0122:
-			result = sony_nc_thermal_setup(pf_device);
+		case 0x015F:
+			result = sony_nc_thermal_setup(pf_device, handle);
  			if (result)
  				pr_err("couldn't set up thermal profile function (%d)\n",
  						result);
@@ -1446,9 +1448,6 @@ static void sony_nc_function_cleanup(struct  
platform_device *pd)
  {
  	unsigned int i, result, bitmask, handle;

-	if (!handles)
-		return;
-
  	/* get enabled events and disable them */
  	sony_nc_int_call(sony_nc_acpi_handle, "SN01", NULL, &bitmask);
  	sony_nc_int_call(sony_nc_acpi_handle, "SN03", &bitmask, &result);
@@ -1476,6 +1475,7 @@ static void sony_nc_function_cleanup(struct  
platform_device *pd)
  			sony_nc_lid_resume_cleanup(pd);
  			break;
  		case 0x0122:
+		case 0x015F:
  			sony_nc_thermal_cleanup(pd);
  			break;
  		case 0x0128:
@@ -1547,6 +1547,7 @@ static void sony_nc_function_resume(void)
  			sony_call_snc_handle(handle, 0x100, &result);
  			break;
  		case 0x0122:
+		case 0x015F:
  			sony_nc_thermal_resume();
  			break;
  		case 0x0124:
@@ -2150,14 +2151,16 @@ struct snc_thermal_ctrl {
  	unsigned int profiles;
  	struct device_attribute mode_attr;
  	struct device_attribute profiles_attr;
+	unsigned int handle;
  };
  static struct snc_thermal_ctrl *th_handle;

-#define THM_PROFILE_MAX 3
+#define THM_PROFILE_MAX 4
  static const char * const snc_thermal_profiles[] = {
  	"balanced",
  	"silent",
-	"performance"
+	"performance",
+	"cooling"
  };

  static int sony_nc_thermal_mode_set(unsigned short mode)
@@ -2173,7 +2176,8 @@ static int sony_nc_thermal_mode_set(unsigned short mode)
  	if ((mode && !(th_handle->profiles & mode)) || mode >= THM_PROFILE_MAX)
  		return -EINVAL;

-	if (sony_call_snc_handle(0x0122, mode << 0x10 | 0x0200, &result))
+	if (sony_call_snc_handle(th_handle->handle, mode << 0x10 | 0x0200,
+				 &result))
  		return -EIO;

  	th_handle->mode = mode;
@@ -2185,7 +2189,7 @@ static int sony_nc_thermal_mode_get(void)
  {
  	unsigned int result;

-	if (sony_call_snc_handle(0x0122, 0x0100, &result))
+	if (sony_call_snc_handle(th_handle->handle, 0x0100, &result))
  		return -EIO;

  	return result & 0xff;
@@ -2245,14 +2249,17 @@ static ssize_t  
sony_nc_thermal_mode_show(struct device *dev,
  	return count;
  }

-static int sony_nc_thermal_setup(struct platform_device *pd)
+static int sony_nc_thermal_setup(struct platform_device *pd,
+				 unsigned int handle)
  {
  	int ret = 0;
  	th_handle = kzalloc(sizeof(struct snc_thermal_ctrl), GFP_KERNEL);
  	if (!th_handle)
  		return -ENOMEM;

-	ret = sony_call_snc_handle(0x0122, 0x0000, &th_handle->profiles);
+	th_handle->handle = handle;
+
+	ret = sony_call_snc_handle(handle, 0x0000, &th_handle->profiles);
  	if (ret) {
  		pr_warn("couldn't to read the thermal profiles\n");
  		goto outkzalloc;
-- 
2.8.3
