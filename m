Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D508D1DFDE
	for <platform-driver-x86@vger.kernel.org>; Sun, 19 May 2024 16:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716134993; cv=none; b=fmRSnEdrIPXCSjONvYIIfYdFPd5hRNORP6zdjpntrKQF89eW1i/+cf7Xe4B+Cm4chsIjv+s2y9Wg3RLuuNM5KOWV0SXohqjGVODhMP8N1LdP1dB+o23Jfjjb9cIritP6gLyd7EJvJWsIffguEAxk+nsULR++lsa5Y7k54wDHIAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716134993; c=relaxed/simple;
	bh=aqYIUeI3a2d80AGMXr3NB6dX0OSg7p7Hw+O5MKXwtng=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g6BbevZhoyDL7UoDeRJ2saO7TTwaAo+AVIqTMYlk/M3ecv7kppjLPkidksCUQCiPw3mDBNg9MoIKAsxaKsjXdKn+0/eKT+CWTiFNo4/bdU5WLsTsQLUDqdi/VEeHB/fSfvGxU/+VMz+z/EUX3gryNAV5uu1/FtVMhzPuCYhWsbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=czcmAd7M; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="czcmAd7M"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4200ee78e56so12776575e9.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 19 May 2024 09:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716134990; x=1716739790; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UoMU9f/HWy7zqFR10qL1adpE9k5DzmT24M5tuiYh4Gs=;
        b=czcmAd7MPRPoGl57HIvuU7HLi6U8QhpgVi80PKnn7y2l1yb5b2ZzU5K6sNntz+s38J
         m2gBQbCDuY7QgRg/0VOmPZD4RptxxxQEKpNJu7IV92eeFZo4Ekq/QcKke0b1Pu1bdzFt
         5DjCvm4Cce1LK26Tqo1Hm11ngCtNbdpA1O9ZAHnK3RhC8Xemu80hJGi9mj53pfIxzPVq
         iKCJ57ohBffvhB/FncEKzYToo/7SA3sbSABccgr/UZQsHy8sVcvBLsBarGCHcX3tQFRw
         yODPOctD41fU2oF3bZlxO5mIDvracnafFeg9vODO34Ou8gUmNMY8y8d+LWt2uierXhlw
         7m3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716134990; x=1716739790;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UoMU9f/HWy7zqFR10qL1adpE9k5DzmT24M5tuiYh4Gs=;
        b=k1b+uAfQZ/ehVLS3erk44r35oQyxrMZk/vnSdePNxhEXT0/n1uh/wWZeuEQOnJLKUG
         oB5o8leQMY+Psg8gvQH+CuCqEyl8kVTYo8Z0liZNNAYPzPK8uZh3FtVLN1uqLvct7RIs
         Sb0fLuMtEML7tXO6GacfCtxXJvO2/z966Di7u+o+r0ERp+eikb2gH4Dzshn50BuXZfGr
         F3A1OLAgtGlp7yGl6iePXznu4WPGaw8HlCpZc/VlNkSRrHdg4qlR+J07aJh5w9Ozn4qC
         k6EvbPEQrFvyXJlo7u082mlFVr6qATmOo0x4cbnKbwyU7R6+b3V/x7T4Ph8B7YY2vcR0
         T0EQ==
X-Gm-Message-State: AOJu0Yz6TxxKmWqA+0cdTgtflwk7EXsjYvelDyJs49aRK2drklW0z7mn
	OEVu73rBwmhlDh0WeCuEfqLaxZUeZK/pCSyhZKmJNWeemkSu4EjL
X-Google-Smtp-Source: AGHT+IFwj6gFNC0SWWPnQwqB1jFl1cU/IKJK5d6eC8AGESiSP/h+x9OJGuq2uFiA5fTcUPEi9w4Yag==
X-Received: by 2002:a05:600c:3b8c:b0:418:2a57:380c with SMTP id 5b1f17b1804b1-41feac59eb6mr210157395e9.26.1716134989760;
        Sun, 19 May 2024 09:09:49 -0700 (PDT)
Received: from alexis-pc (cust-west-par-46-193-0-235.cust.wifirst.net. [46.193.0.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccfe15b6sm376646875e9.47.2024.05.19.09.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 09:09:49 -0700 (PDT)
Date: Sun, 19 May 2024 18:09:47 +0200
From: Alexis Belmonte <alexbelm48@gmail.com>
To: ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: hp-wmi: Fix platform profile option switch bug
 on Omen and Victus laptops
Message-ID: <ZkokSy2hKU8xysQJ@alexis-pc>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix a platform profile option switch/getter bug on some Omen and Victus laptops
dismissing userspace choice when selecting performance mode in inadequate
conditions (e.g. by being disconnected from the AC power plug) by

   -  hooking an ACPI notify handler which listens to the \\_SB.ADP1
      node that propagates battery status events

   -  keeping an intermediate active_platform_profile variable that is
      set when userspace changes the platform profile setting

   -  restoring the selected platform profile kept in
      active_platform_profile when AC power is plugged back into the
      laptop (handled through omen_powersource_notify_handler)

This ensures that the driver follows the principles defined in the Platform
Profile Selection page of the Kernel documentation on those kind of
laptops; which is to not "(...) let userspace know about any sub-optimal
conditions which are impeding reaching the requested performance level".

Since the Omen and Victus laptops share the same embedded controller
system, the fix is applicable to both categories of laptops.

Signed-off-by: Alexis Belmonte <alexbelm48@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 162 ++++++++++++++++++++++++++++++-
 1 file changed, 158 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 630519c08617..2b3b9851e898 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -38,6 +38,7 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45E9-BE91-3D44E2C707E4");
 #define HPWMI_EVENT_GUID "95F24279-4D7B-4334-9387-ACCDC67EF61C"
 #define HPWMI_BIOS_GUID "5FB7F034-2C63-45E9-BE91-3D44E2C707E4"
 
+#define HP_OMEN_EC_POWER_STATUS 0x40
 #define HP_OMEN_EC_THERMAL_PROFILE_FLAGS_OFFSET 0x62
 #define HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET 0x63
 #define HP_OMEN_EC_THERMAL_PROFILE_OFFSET 0x95
@@ -83,6 +84,13 @@ static const char * const victus_thermal_profile_boards[] = {
 	"8A25"
 };
 
+static const char HPWMI_ACPOWER_NODE[] = "\\_SB.ADP1";
+
+enum hp_wmi_powersource_flags {
+	HPWMI_POWERSOURCE_AC_OFFLINE	= 0x02,
+	HPWMI_POWERSOURCE_AC_ONLINE	= 0x0b
+};
+
 enum hp_wmi_radio {
 	HPWMI_WIFI	= 0x0,
 	HPWMI_BLUETOOTH	= 0x1,
@@ -263,6 +271,7 @@ static struct input_dev *hp_wmi_input_dev;
 static struct input_dev *camera_shutter_input_dev;
 static struct platform_device *hp_wmi_platform_dev;
 static struct platform_profile_handler platform_profile_handler;
+static enum platform_profile_option active_platform_profile;
 static bool platform_profile_support;
 static bool zero_insize_support;
 
@@ -1194,8 +1203,7 @@ static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
 	return err;
 }
 
-static int platform_profile_omen_get(struct platform_profile_handler *pprof,
-				     enum platform_profile_option *profile)
+static int platform_profile_omen_get_ec(enum platform_profile_option *profile)
 {
 	int tp;
 
@@ -1223,6 +1231,24 @@ static int platform_profile_omen_get(struct platform_profile_handler *pprof,
 	return 0;
 }
 
+static int platform_profile_omen_get(struct platform_profile_handler *pprof,
+				     enum platform_profile_option *profile)
+{
+	/*
+	 * We directly return the stored platform profile, as the embedded
+	 * controller will not accept switching to the performance option when
+	 * the conditions are not met (e.g. the laptop is not plugged in).
+	 *
+	 * If we directly return what the EC reports, the platform profile will
+	 * immediately "switch back" to normal mode, which is against the
+	 * expected behaviour from a userspace point of view, as described in
+	 * the Platform Profile Section page of the kernel documentation.
+	 *
+	 * See also omen_powersource_notify_handler.
+	 */
+	return active_platform_profile;
+}
+
 static bool has_omen_thermal_profile_ec_timer(void)
 {
 	const char *board_name = dmi_get_system_info(DMI_BOARD_NAME);
@@ -1297,6 +1323,8 @@ static int platform_profile_omen_set(struct platform_profile_handler *pprof,
 			return err;
 	}
 
+	active_platform_profile = profile;
+
 	return 0;
 }
 
@@ -1381,8 +1409,8 @@ static bool is_victus_thermal_profile(void)
 			    board_name) >= 0;
 }
 
-static int platform_profile_victus_get(struct platform_profile_handler *pprof,
-				     enum platform_profile_option *profile)
+static int platform_profile_victus_get_ec(
+	enum platform_profile_option *profile)
 {
 	int tp;
 
@@ -1407,6 +1435,13 @@ static int platform_profile_victus_get(struct platform_profile_handler *pprof,
 	return 0;
 }
 
+static int platform_profile_victus_get(struct platform_profile_handler *pprof,
+				     enum platform_profile_option *profile)
+{
+	/* Same as for platform_profile_omen_get */
+	return active_platform_profile;
+}
+
 static int platform_profile_victus_set(struct platform_profile_handler *pprof,
 				     enum platform_profile_option profile)
 {
@@ -1430,9 +1465,113 @@ static int platform_profile_victus_set(struct platform_profile_handler *pprof,
 	if (err < 0)
 		return err;
 
+	active_platform_profile = profile;
+
 	return 0;
 }
 
+
+static void omen_powersource_notify_handler(acpi_handle handle, u32 event,
+					    void *context)
+{
+	enum platform_profile_option *active_profile = context;
+	enum platform_profile_option actual_profile;
+	u8 state;
+	int err;
+
+	if (event != 0x80)
+		return;
+
+	pr_debug("Received power source device event\n");
+
+	err = ec_read(HP_OMEN_EC_POWER_STATUS, &state);
+	if (err < 0) {
+		pr_warn("Failed to read power source state (%d)\n", err);
+		return;
+	}
+
+	if (is_omen_thermal_profile())
+		err = platform_profile_omen_get_ec(&actual_profile);
+	else if (is_victus_thermal_profile())
+		err = platform_profile_victus_get_ec(&actual_profile);
+
+	if (err < 0) {
+		pr_warn("Failed to read current platform profile (%d)\n", err);
+		return;
+	}
+
+	if (!(state & HPWMI_POWERSOURCE_AC_ONLINE) ||
+	    *active_profile == PLATFORM_PROFILE_PERFORMANCE)
+		return;
+
+	err = platform_profile_handler.profile_set(&platform_profile_handler,
+						   active_platform_profile);
+	if (err < 0)
+		pr_warn("Failed to restore platform profile (%d)\n", err);
+}
+
+static void omen_register_powersource_notify_handler(void)
+{
+	int err;
+	acpi_status status;
+	acpi_handle handle;
+
+	if (is_omen_thermal_profile())
+		err = platform_profile_omen_get_ec(&active_platform_profile);
+	else if (is_victus_thermal_profile())
+		err = platform_profile_victus_get_ec(&active_platform_profile);
+
+	if (err < 0) {
+		pr_warn("Failed to retrieve active platform profile (%d)\n",
+			err);
+		active_platform_profile = PLATFORM_PROFILE_BALANCED;
+	}
+
+	status = acpi_get_handle(NULL, HPWMI_ACPOWER_NODE, &handle);
+
+	/*
+	 * It's preferrable to use pr_debug() here, as most machines allow to
+	 * set the performance power profile anyway, even if the AC adapter is
+	 * not plugged in.
+	 *
+	 * However, some Omen/Victus configurations may not allow to set the
+	 * performance power profile in such conditions. In the event that this
+	 * fails, we'll ask the bug reporter to load the module with dyndbg=+p.
+	 */
+	if (ACPI_FAILURE(status)) {
+		pr_debug("Cannot find ACPI handle for '%s', won't be able to restore the power profile\n",
+			 HPWMI_ACPOWER_NODE);
+		return;
+	}
+
+	status = acpi_install_notify_handler(handle,
+					     ACPI_DEVICE_NOTIFY,
+					     omen_powersource_notify_handler,
+					     &active_platform_profile);
+
+	if (ACPI_FAILURE(status))
+		pr_warn("Failed to install ACPI notify handler for '%s'\n",
+			HPWMI_ACPOWER_NODE);
+}
+
+static void hp_wmi_unregister_powersource_notify_handler(void)
+{
+	acpi_status status;
+	acpi_handle handle;
+
+	status = acpi_get_handle(NULL, HPWMI_ACPOWER_NODE, &handle);
+
+	if (ACPI_FAILURE(status))
+		return;
+
+	status = acpi_remove_notify_handler(handle,
+					    ACPI_DEVICE_NOTIFY,
+					    omen_powersource_notify_handler);
+
+	if (ACPI_FAILURE(status))
+		pr_err("Failed to remove ACPI notify handler for '%s'\n",
+		       HPWMI_ACPOWER_NODE);
+}
 static int thermal_profile_setup(void)
 {
 	int err, tp;
@@ -1534,6 +1673,15 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
 
 	thermal_profile_setup();
 
+	/*
+	 * Query the platform profile once to know which last power profile
+	 * was set.
+	 */
+	err = platform_profile_handler.profile_get(&platform_profile_handler,
+						   &active_platform_profile);
+	if (err < 0)
+		return err;
+
 	return 0;
 }
 
@@ -1758,6 +1906,9 @@ static int __init hp_wmi_init(void)
 			goto err_unregister_device;
 	}
 
+	if (is_omen_thermal_profile() || is_victus_thermal_profile())
+		omen_register_powersource_notify_handler();
+
 	return 0;
 
 err_unregister_device:
@@ -1772,6 +1923,9 @@ module_init(hp_wmi_init);
 
 static void __exit hp_wmi_exit(void)
 {
+	if (is_omen_thermal_profile() || is_victus_thermal_profile())
+		hp_wmi_unregister_powersource_notify_handler();
+
 	if (wmi_has_guid(HPWMI_EVENT_GUID))
 		hp_wmi_input_destroy();
 
-- 
2.45.1

