Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5003E155736
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jul 2024 18:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719857914; cv=none; b=jKVuHVVocotm4rKhaYBZkOw6hnZBcgCz0/xzMZQRVattMGGB2l10cAl2mlWLs568k9m1+VV0X6Wr0KyUeTqefKS4Dq6O5dKbGZ2r5q0nNOOcLGhzBe0Tt9UXQk0mtI8xMaMBkDuHF50iXlT1kLJtPv7Mw2r0tgFr+UOS67DTmoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719857914; c=relaxed/simple;
	bh=G/gHYBvR6nYaY0WFZmObNCggosZHFpWs0tZUJKDIPNs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d0nCD+iBGwDVAs8hr/QuK11oR+pkzTIV6FZaGZMMkOY4fkjYMuO4bo3z7HM3HWn9d8sV+cfcQcqssM00bUW6EFUDAJYfmMHx5e5oIsprrka3uUuU7/xd4QY/Xu6MT5+wtU5celAnk7pZq8uJEPyeOqW27M+CI8PP3VBlmUOak3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fxMEog9v; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fxMEog9v"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52ce01403f6so3745528e87.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 01 Jul 2024 11:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719857910; x=1720462710; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fVaUbgN2xm1gGwCqm9nkLbf39iaKTmkyyP3p9/wJKdE=;
        b=fxMEog9vfoB2D659Ki5QmgRoT5IlvXIR1g6+PpP7YNYkWCVBSuHlGwsUaRNbbQQBJC
         Ah2f4afrCYr6H2OcU/ebfPNx0wlx14S73wfHCBwASij6uB3XN03ilnE/F/4wVsvirIJx
         6SvXqY1HlddK2gUky8y3AvOe5uU/18zW6K3NRVIyyIdJjR67fXgTlqg1k2u/cjx8m5qa
         BeXEDCsDpH8xsBnN39O61bK5YCwbV2ilI+WvWs6YV/CILO1zcrT42QXLq4o1UUawEXcN
         Ito/akzR8bacExe0/ApldUowAKfUack9uLltFL6L620oXj/B0FWarCY5F9kABpwRa7WN
         6pMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719857910; x=1720462710;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fVaUbgN2xm1gGwCqm9nkLbf39iaKTmkyyP3p9/wJKdE=;
        b=p+yxE7t78Eq/eAvRestQXXv595PqVx7X2rJ+aVbpr/uZg5ef+KJ3RXP6hbhnTZk6Gy
         H2rT7k5KPUPM+9yezPWcEzgxy1EB/M2KZ24VPMP0aPbulCDhLyCNtV4sNgu4PW9Pfwxa
         T0U3KFG88rP4WnBB3eXJxwZZTE4PpeVWvSN2AApj+iza+Wg2AOIq1hCuIgFeLlEg0qb/
         8R4PyuGz0PTsyVLGBS9jn/QOWYvG35xORTY0EJVhW6JjuGKGfrvwjw4O57Ew+ANv/sj7
         ntCnj7KmpNuiZIxW43399lL60adfqzBoRUm1qt7WPqjzyRa2a4fXtxLbJqIrU2HH/+Sd
         8zyA==
X-Gm-Message-State: AOJu0YxozAYUhZQG5DHFq75bdCr+SsyeF5TUO0HN6cQy6uiRbg5dMW3R
	4QwthFYRMk5wGFQj00Jzsbp8n/xBjzrtJR6HWnhl8UE410WWu/3x
X-Google-Smtp-Source: AGHT+IE/XUIU6Wp5a2i1qNufCKIFszVZbfqNXs1znq2OAL3yoWhtbsdO/0TtJqSbfQlGqE7mve4DCg==
X-Received: by 2002:a05:6512:3d8e:b0:52c:9421:2739 with SMTP id 2adb3069b0e04-52e8264dff6mr4632900e87.9.1719857909865;
        Mon, 01 Jul 2024 11:18:29 -0700 (PDT)
Received: from alexis-pc (cust-west-par-46-193-0-235.cust.wifirst.net. [46.193.0.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a103e5esm10705720f8f.108.2024.07.01.11.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 11:18:29 -0700 (PDT)
Date: Mon, 1 Jul 2024 20:18:27 +0200
From: Alexis Belmonte <alexbelm48@gmail.com>
To: W_Armin@gmx.de, ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org
Subject: [PATCHv8] platform/x86: hp-wmi: Fix platform profile option switch
 bug on Omen and Victus laptops
Message-ID: <ZoLy85rtVTAVZnPI@alexis-pc>
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

This patch thus introduces a new dependency to the POWER_SUPPLY subsystem
for this module.

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
V7 -> V8: - Pass profile as a value instead of a pointer for
            platform_profile_omen_set & platform_profile_victus_set as these
            functions no longer alter the parameter
          - Initialize active_platform_profile during
            thermal_profile_setup by reading the current platform profile from
            the embedded controller
          - Drop vestigial active_platform_profile initialization code
          - Add module dependency (select) to POWER_SUPPLY in Kconfig
          - Simplify thermal profile getter check in omen_powersource_event
          - Substitute omen_thermal_profile_get/omen_thermal_profile_set
            with platform_profile_omen_get_ec/platform_profile_omen_set_ec and
            platform_profile_victus_get_ec/platform_profile_victus_set_ec to
            simplify thermal_profile_setup
---
 drivers/platform/x86/hp/Kconfig  |   1 +
 drivers/platform/x86/hp/hp-wmi.c | 207 ++++++++++++++++++++++++++++---
 2 files changed, 191 insertions(+), 17 deletions(-)

diff --git a/drivers/platform/x86/hp/Kconfig b/drivers/platform/x86/hp/Kconfig
index 7fef4f12e498..d776761cd5fd 100644
--- a/drivers/platform/x86/hp/Kconfig
+++ b/drivers/platform/x86/hp/Kconfig
@@ -40,6 +40,7 @@ config HP_WMI
 	depends on ACPI_WMI
 	depends on INPUT
 	depends on RFKILL || RFKILL = n
+	select POWER_SUPPLY
 	select INPUT_SPARSEKMAP
 	select ACPI_PLATFORM_PROFILE
 	select HWMON
diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 5fa553023842..9210cbe0351d 100644
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
+static int platform_profile_omen_set_ec(enum platform_profile_option profile)
 {
 	int err, tp, tp_version;
 	enum hp_thermal_profile_omen_flags flags = 0;
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
+	err = platform_profile_omen_set_ec(profile);
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
 
@@ -1407,8 +1458,14 @@ static int platform_profile_victus_get(struct platform_profile_handler *pprof,
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
+static int platform_profile_victus_set_ec(enum platform_profile_option profile)
 {
 	int err, tp;
 
@@ -1433,21 +1490,128 @@ static int platform_profile_victus_set(struct platform_profile_handler *pprof,
 	return 0;
 }
 
+static int platform_profile_victus_set(struct platform_profile_handler *pprof,
+				       enum platform_profile_option profile)
+{
+	int err;
+
+	mutex_lock(&active_platform_profile_lock);
+
+	err = platform_profile_victus_set_ec(profile);
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
+	/*
+	 * This handler can only be called on Omen and Victus models, so
+	 * there's no need to call is_victus_thermal_profile() here.
+	 */
+	if (is_omen_thermal_profile())
+		err = platform_profile_omen_get_ec(&actual_profile);
+	else
+		err = platform_profile_victus_get_ec(&actual_profile);
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
+	if (is_omen_thermal_profile())
+		err = platform_profile_omen_set_ec(active_platform_profile);
+	else
+		err = platform_profile_victus_set_ec(active_platform_profile);
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
 
 	if (is_omen_thermal_profile()) {
-		tp = omen_thermal_profile_get();
-		if (tp < 0)
-			return tp;
+		err = platform_profile_omen_get_ec(&active_platform_profile);
+		if (err < 0)
+			return err;
 
 		/*
 		 * call thermal profile write command to ensure that the
 		 * firmware correctly sets the OEM variables
 		 */
-
-		err = omen_thermal_profile_set(tp);
+		err = platform_profile_omen_set_ec(active_platform_profile);
 		if (err < 0)
 			return err;
 
@@ -1456,15 +1620,15 @@ static int thermal_profile_setup(void)
 
 		set_bit(PLATFORM_PROFILE_COOL, platform_profile_handler.choices);
 	} else if (is_victus_thermal_profile()) {
-		tp = omen_thermal_profile_get();
-		if (tp < 0)
-			return tp;
+		err = platform_profile_victus_get_ec(&active_platform_profile);
+		if (err < 0)
+			return err;
 
 		/*
 		 * call thermal profile write command to ensure that the
 		 * firmware correctly sets the OEM variables
 		 */
-		err = omen_thermal_profile_set(tp);
+		err = platform_profile_victus_set_ec(active_platform_profile);
 		if (err < 0)
 			return err;
 
@@ -1758,6 +1922,12 @@ static int __init hp_wmi_init(void)
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
@@ -1772,6 +1942,9 @@ module_init(hp_wmi_init);
 
 static void __exit hp_wmi_exit(void)
 {
+	if (is_omen_thermal_profile() || is_victus_thermal_profile())
+		omen_unregister_powersource_event_handler();
+
 	if (wmi_has_guid(HPWMI_EVENT_GUID))
 		hp_wmi_input_destroy();
 
-- 
2.45.2

