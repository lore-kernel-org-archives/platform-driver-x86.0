Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9496914BF8F
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jul 2024 15:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719846052; cv=none; b=vCsvu+fC5lDzuOP7EsNZ7F/ic7NU5xzzm5UU5ngd66pDUe69sYJU0m8G+2/HLsM7nud4bgLBLqT3+jF9f8gQXdjNuDMXUtbMMPXwzuo3/R0MOtIPZ+zSnkaIYilLn+YWQEBSTcakCBQq6e7g25QHqbehIWMYoAC9xmpwWq1fgIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719846052; c=relaxed/simple;
	bh=QZhc7aU44C5fle2tkfQDVegOQP0AwftrH5F2LLLjW88=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZLBcrswVnMYd/CE5qM+lwuj55Pne6U83lnKM9YfCnPSZ+IOuHF2ekOSQRvT1ETJYX2N+r2qY/R/Ia88rPL5bY6xdaGfaQxADPTFGZfJ4ENK5L+niWyIt8AQfFWa04tyTjUCVfOS3sXfxQZ3bv2ssRUDlj7uRpxjOxcFOy5hEl5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GdKXSJOX; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GdKXSJOX"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52ccc40e72eso2307269e87.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 01 Jul 2024 08:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719846049; x=1720450849; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pYm/I+2gAYb1HGCqEvHny3u9rdhjzQcNirZjP8+uDyw=;
        b=GdKXSJOXnffFb2tKshphIYXC2GL94hZEJMKaHh6id057wWCzwOqQXV4Bkm68Td5h/9
         5yzd3m4ANMV6vb+UL4iSKnJQ/hBmv4PU+dMtkHwcuuDkcF7zCDHabSLm+3Ng8xtuQXC6
         eKGNtBV/LjTFi1BMSxC4oXeQA7spwJlQHU+nppBePkm8PBNW40w+uMSEFO5VQfPQ0x/j
         vAhWfyoD7D3x9ZZt0VS4YkkrcuCyMUMBbKfxb2j6JM/iKXo7cR48NubFwsK7JSHjbDaE
         mNFpuL5D3gc1R9JjlbKIQWF9xJf5kKZf9bknYr+wWWWyYc5WBAlQDjlshTde1oq0CLzK
         85uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719846049; x=1720450849;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pYm/I+2gAYb1HGCqEvHny3u9rdhjzQcNirZjP8+uDyw=;
        b=ssYNdQQafZSWCx1weizC59pIQOkQ4iddaA4tSiOKPxWmX8NWXfZCb17EVFjBy/h+Op
         G9DKe3MigMryz5V92Cz+SQsHx7Y5UEMrozwL9NGVns3jO4DmkO3ZdU7ycQ12D/atAcol
         Mb8SMKZ8CXCy5k37yaSJlJJUcinUx4mQuJHZ8vZcedMG4XfzNxwRLF4ZJO2IZNePr9y7
         RuK06950QK4TU8BzufU9GCr6g22zIcTlAEDJwKUaZ+HmXxXlzWYp+LSxpOg9Ie4WBCjH
         1LEk5tb+dv2Je0pnipAmU8qK0tepen9WL2OFCAAur9ifR/BQS6+lRtiuTaRgiWaVGtoC
         l3pQ==
X-Gm-Message-State: AOJu0YxxIoMRfsAJRGsf6NPqs6iisxsBMCRteYoggPFZMv1zMsohI4bl
	BRqU9+6oNz7k0DTAyv8fze1SQBOA4lA0waynNZfxcqMro+jjnC/Q
X-Google-Smtp-Source: AGHT+IESQumzsM/CvH4UrEATgLPSMGO9Di1Ea9xaP94EqvGbCOmwJAFP6bL03yqQ8yilKtJ/Ih22rg==
X-Received: by 2002:a05:6512:b9b:b0:52e:7f09:aaae with SMTP id 2adb3069b0e04-52e82671991mr5165578e87.27.1719846048231;
        Mon, 01 Jul 2024 08:00:48 -0700 (PDT)
Received: from alexis-pc (cust-west-par-46-193-0-235.cust.wifirst.net. [46.193.0.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af38a0asm160277155e9.1.2024.07.01.08.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 08:00:47 -0700 (PDT)
Date: Mon, 1 Jul 2024 17:00:46 +0200
From: Alexis Belmonte <alexbelm48@gmail.com>
To: W_Armin@gmx.de, ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org
Subject: [PATCHv7] platform/x86: hp-wmi: Fix platform profile option switch
 bug on Omen and Victus laptops
Message-ID: <ZoLEnl9y99fff4xp@alexis-pc>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix a platform profile option switch/getter bug on some Omen and Victus
laptops dismissing userspace choice when selecting performance mode in
inadequate conditions (e.g. by being disconnected from the AC power plug)
by

   -  hooking an ACPI notify handler through the
      omen_register_powersource_notifier_handler method that listens to AC
      power source changes (plugging in/out the AC power plug)

   -  keeping an intermediate active_platform_profile variable that is
      set when userspace changes the platform profile setting

   -  restoring the selected platform profile kept in
      active_platform_profile when AC power is plugged back into the
      laptop, unless if the user decided to alter the platform profile
      mid-way

This ensures that the driver follows the principles defined in the
Platform Profile Selection page of the Kernel documentation on those kind
of laptops; which is to not "(...) let userspace know about any
sub-optimal conditions which are impeding reaching the requested
performance level".

Since the Omen and Victus laptops share the same embedded controller
system, the fix is applicable to both categories of laptops.

This patch also provides improvements to how the driver sets/gets the
platform profile through the embedded controller, by introducing
intermediary functions to leverage code from platform_profile_omen_set and
callers.

Signed-off-by: Alexis Belmonte <alexbelm48@gmail.com>
---
V1 -> V2: - Use register_acpi_notifier and unregister_acpi_notifier instead of
            hooking straight through ACPI node \\_SB.ADP1
V2 -> V3: - Rely on power_supply_is_system_supplied() instead of an EC-specific
            field to determine if the laptop is plugged in
          - Refactor omen_powersource_notify_handler to omen_powersource_event
          - Refactor omen_powersource_register_notifier_handler to
            omen_register_powersource_event_handler
          - Use a mutex to protect the active_platform_profile variable from
            being altered while the handler is executed
V3 -> V4: - Remove the unnecessary enum declaration remains from the initial
            implementation
V4 -> V5: - Drop unnecessary modifications from the patch
          - Call platform_profile_omen_get in platform_profile_victus_get to
            avoid code duplication
          - Give-up module initialization if we fail to register the ACPI
            notifier handler
          - Fix code style issues reported by checkpatch.pl --strict
          - Add intermediary/helper platform_profile_omen_set_ec and
            platform_profile_victus_set_ec functions to leverage code from
            platform_profile_omen_set and callers, thus simplifying
            omen_powersource_event
          - Fix dead-lock when restoring active_platform_profile when the AC
            power is plugged back into the laptop
V5 -> V6: - Drop unnecessary modifications from the patch
V6 -> V7: - Drop EC platform profile readback after set
          - Lock the active_platform_profile mutex unconditionally
          - Drop the usage of ACPI_FAILURE in favor of a simpler error check
            when registering/unregistering the ACPI notifier
          - Initialize active_platform_profile in thermal_profile_setup
---
 drivers/platform/x86/hp/hp-wmi.c | 211 +++++++++++++++++++++++++++++--
 1 file changed, 200 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 5fa553023842..6ffc9d7ad8c1 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -24,6 +24,7 @@
 #include <linux/platform_profile.h>
 #include <linux/hwmon.h>
 #include <linux/acpi.h>
+#include <linux/power_supply.h>
 #include <linux/rfkill.h>
 #include <linux/string.h>
 #include <linux/dmi.h>
@@ -42,6 +43,8 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45E9-BE91-3D44E2C707E4");
 #define HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET 0x63
 #define HP_OMEN_EC_THERMAL_PROFILE_OFFSET 0x95
 
+#define ACPI_AC_CLASS "ac_adapter"
+
 #define zero_if_sup(tmp) (zero_insize_support?0:sizeof(tmp)) // use when zero insize is required
 
 /* DMI board names of devices that should use the omen specific path for
@@ -259,10 +262,18 @@ static const struct key_entry hp_wmi_keymap[] = {
 	{ KE_END, 0 }
 };
 
+/*
+ * Mutex for the active_platform_profile variable,
+ * see omen_powersource_event.
+ */
+DEFINE_MUTEX(active_platform_profile_lock);
+
 static struct input_dev *hp_wmi_input_dev;
 static struct input_dev *camera_shutter_input_dev;
 static struct platform_device *hp_wmi_platform_dev;
 static struct platform_profile_handler platform_profile_handler;
+static struct notifier_block platform_power_source_nb;
+static enum platform_profile_option active_platform_profile;
 static bool platform_profile_support;
 static bool zero_insize_support;
 
@@ -1194,8 +1205,7 @@ static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
 	return err;
 }
 
-static int platform_profile_omen_get(struct platform_profile_handler *pprof,
-				     enum platform_profile_option *profile)
+static int platform_profile_omen_get_ec(enum platform_profile_option *profile)
 {
 	int tp;
 
@@ -1223,6 +1233,30 @@ static int platform_profile_omen_get(struct platform_profile_handler *pprof,
 	return 0;
 }
 
+static int platform_profile_omen_get(struct platform_profile_handler *pprof,
+				     enum platform_profile_option *profile)
+{
+	enum platform_profile_option selected_platform_profile;
+
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
+	 * See also omen_powersource_event.
+	 */
+	mutex_lock(&active_platform_profile_lock);
+	selected_platform_profile = active_platform_profile;
+	mutex_unlock(&active_platform_profile_lock);
+
+	return selected_platform_profile;
+}
+
 static bool has_omen_thermal_profile_ec_timer(void)
 {
 	const char *board_name = dmi_get_system_info(DMI_BOARD_NAME);
@@ -1245,8 +1279,7 @@ inline int omen_thermal_profile_ec_timer_set(u8 value)
 	return ec_write(HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET, value);
 }
 
-static int platform_profile_omen_set(struct platform_profile_handler *pprof,
-				     enum platform_profile_option profile)
+static int platform_profile_omen_set_ec(enum platform_profile_option *profile)
 {
 	int err, tp, tp_version;
 	enum hp_thermal_profile_omen_flags flags = 0;
@@ -1256,7 +1289,7 @@ static int platform_profile_omen_set(struct platform_profile_handler *pprof,
 	if (tp_version < 0 || tp_version > 1)
 		return -EOPNOTSUPP;
 
-	switch (profile) {
+	switch (*profile) {
 	case PLATFORM_PROFILE_PERFORMANCE:
 		if (tp_version == 0)
 			tp = HP_OMEN_V0_THERMAL_PROFILE_PERFORMANCE;
@@ -1288,7 +1321,7 @@ static int platform_profile_omen_set(struct platform_profile_handler *pprof,
 		if (err < 0)
 			return err;
 
-		if (profile == PLATFORM_PROFILE_PERFORMANCE)
+		if (*profile == PLATFORM_PROFILE_PERFORMANCE)
 			flags = HP_OMEN_EC_FLAGS_NOTIMER |
 				HP_OMEN_EC_FLAGS_TURBO;
 
@@ -1300,6 +1333,25 @@ static int platform_profile_omen_set(struct platform_profile_handler *pprof,
 	return 0;
 }
 
+static int platform_profile_omen_set(struct platform_profile_handler *pprof,
+				     enum platform_profile_option profile)
+{
+	int err;
+
+	mutex_lock(&active_platform_profile_lock);
+
+	err = platform_profile_omen_set_ec(&profile);
+	if (err < 0) {
+		mutex_unlock(&active_platform_profile_lock);
+		return err;
+	}
+
+	active_platform_profile = profile;
+	mutex_unlock(&active_platform_profile_lock);
+
+	return 0;
+}
+
 static int thermal_profile_get(void)
 {
 	return hp_wmi_read_int(HPWMI_THERMAL_PROFILE_QUERY);
@@ -1381,8 +1433,7 @@ static bool is_victus_thermal_profile(void)
 			    board_name) >= 0;
 }
 
-static int platform_profile_victus_get(struct platform_profile_handler *pprof,
-				     enum platform_profile_option *profile)
+static int platform_profile_victus_get_ec(enum platform_profile_option *profile)
 {
 	int tp;
 
@@ -1407,12 +1458,18 @@ static int platform_profile_victus_get(struct platform_profile_handler *pprof,
 	return 0;
 }
 
-static int platform_profile_victus_set(struct platform_profile_handler *pprof,
-				     enum platform_profile_option profile)
+static int platform_profile_victus_get(struct platform_profile_handler *pprof,
+				       enum platform_profile_option *profile)
+{
+	/* Same behaviour as platform_profile_omen_get */
+	return platform_profile_omen_get(pprof, profile);
+}
+
+static int platform_profile_victus_set_ec(enum platform_profile_option *profile)
 {
 	int err, tp;
 
-	switch (profile) {
+	switch (*profile) {
 	case PLATFORM_PROFILE_PERFORMANCE:
 		tp = HP_VICTUS_THERMAL_PROFILE_PERFORMANCE;
 		break;
@@ -1433,10 +1490,124 @@ static int platform_profile_victus_set(struct platform_profile_handler *pprof,
 	return 0;
 }
 
+static int platform_profile_victus_set(struct platform_profile_handler *pprof,
+				       enum platform_profile_option profile)
+{
+	int err;
+
+	mutex_lock(&active_platform_profile_lock);
+
+	err = platform_profile_victus_set_ec(&profile);
+	if (err < 0) {
+		mutex_unlock(&active_platform_profile_lock);
+		return err;
+	}
+
+	active_platform_profile = profile;
+	mutex_unlock(&active_platform_profile_lock);
+
+	return 0;
+}
+
+static int omen_powersource_event(struct notifier_block *nb,
+				  unsigned long value,
+				  void *data)
+{
+	struct acpi_bus_event *event_entry = data;
+	enum platform_profile_option actual_profile;
+	int err;
+
+	if (strcmp(event_entry->device_class, ACPI_AC_CLASS) != 0)
+		return NOTIFY_DONE;
+
+	pr_debug("Received power source device event\n");
+
+	mutex_lock(&active_platform_profile_lock);
+
+	if (is_omen_thermal_profile()) {
+		err = platform_profile_omen_get_ec(&actual_profile);
+	} else if (is_victus_thermal_profile()) {
+		err = platform_profile_victus_get_ec(&actual_profile);
+	}
+
+	if (err < 0) {
+		pr_warn("Failed to read current platform profile (%d)\n", err);
+
+		/*
+		 * Although we failed to get the current platform profile, we
+		 * still want the other event consumers to process it.
+		 */
+		return NOTIFY_DONE;
+	}
+
+	/*
+	 * If we're back on AC and that the user-chosen power profile is
+	 * different from what the EC reports, we restore the user-chosen
+	 * one.
+	 */
+	if (power_supply_is_system_supplied() >= 0 ||
+	    active_platform_profile != actual_profile) {
+		mutex_unlock(&active_platform_profile_lock);
+
+		pr_debug("EC reports same platform profile, no platform profile update required\n");
+		return NOTIFY_DONE;
+	}
+
+	if (is_omen_thermal_profile()) {
+		err = platform_profile_omen_set_ec(&active_platform_profile);
+	} else if (is_victus_thermal_profile()) {
+		err = platform_profile_victus_set_ec(&active_platform_profile);
+	}
+
+	if (err < 0) {
+		mutex_unlock(&active_platform_profile_lock);
+
+		pr_warn("Failed to restore platform profile (%d)\n", err);
+		return NOTIFY_DONE;
+	}
+
+	mutex_unlock(&active_platform_profile_lock);
+
+	return NOTIFY_OK;
+}
+
+static int omen_register_powersource_event_handler(void)
+{
+	int err;
+
+	if (is_omen_thermal_profile())
+		err = platform_profile_omen_get_ec(&active_platform_profile);
+	else if (is_victus_thermal_profile())
+		err = platform_profile_victus_get_ec(&active_platform_profile);
+
+	platform_power_source_nb.notifier_call = omen_powersource_event;
+	err = register_acpi_notifier(&platform_power_source_nb);
+
+	if (err < 0) {
+		pr_warn("Failed to install ACPI power source notify handler\n");
+		return err;
+	}
+
+	return 0;
+}
+
+static void omen_unregister_powersource_event_handler(void)
+{
+	int err;
+
+	err = unregister_acpi_notifier(&platform_power_source_nb);
+
+	if (err < 0)
+		pr_err("Failed to remove ACPI power source notify handler\n");
+}
+
 static int thermal_profile_setup(void)
 {
 	int err, tp;
 
+	if (is_omen_thermal_profile() || is_victus_thermal_profile())
+		active_platform_profile = PLATFORM_PROFILE_BALANCED;
+
 	if (is_omen_thermal_profile()) {
 		tp = omen_thermal_profile_get();
 		if (tp < 0)
@@ -1534,6 +1705,15 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
 
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
 
@@ -1758,6 +1938,12 @@ static int __init hp_wmi_init(void)
 			goto err_unregister_device;
 	}
 
+	if (is_omen_thermal_profile() || is_victus_thermal_profile()) {
+		err = omen_register_powersource_event_handler();
+		if (err)
+			goto err_unregister_device;
+	}
+
 	return 0;
 
 err_unregister_device:
@@ -1772,6 +1958,9 @@ module_init(hp_wmi_init);
 
 static void __exit hp_wmi_exit(void)
 {
+	if (is_omen_thermal_profile() || is_victus_thermal_profile())
+		omen_unregister_powersource_event_handler();
+
 	if (wmi_has_guid(HPWMI_EVENT_GUID))
 		hp_wmi_input_destroy();
 
-- 
2.45.2

