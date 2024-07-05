Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153A2147C76
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jul 2024 10:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720177099; cv=none; b=ZXBjjGk+rIKwYQXLwx+xWGRV/7jlUuMAL4zljXZcpHUZYqtjTIH3RfntPNSDztCaJ2v/dYTIA8W5tUFsVGjEp77b3c67//sNQS1MRwf6F2uoF4ofF5PyQ3wzGpH6bty2+jwwuk63wVmD36nlM8uUlXbupT/O9iZ5DeioIjwlw0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720177099; c=relaxed/simple;
	bh=KZTGflbwU2LcKX3WFLiE9V7Ru5F8qfisPvzHGig0mBY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jTMFjrLM1AIQxsZRpcfRc6UrPjuP79SX1mMZiGx4qdPxXktE9PXCrtbvP6ioCeeSuUwT5blPV1c6XBad8Y9pI8VGIxSEvkOi/3w+ZlVpMWuDY69ePDkG1JJ9lAzBwyQv4KOCh+pOaXqy2bPF9D7K42xl+Y9MB+B8mb3Uywh9nRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q0lZW+k/; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q0lZW+k/"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52ea5dc3c79so845189e87.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 05 Jul 2024 03:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720177095; x=1720781895; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qtrnVRJXBUhHXpn4ff4oCsLzzEe9JHeNRY1NhHBoWPg=;
        b=Q0lZW+k/LBFlkCUODdq2DR04Kkxhjw5hKdCh17X2r5bIegHhqmfB69Gqq0osy8Hlt4
         Vu3ZRgux31q/1qvImMnEt704TKTljD0s0DzDCMis77kvEJUyQI46tuF1tq00Z5g/AC9M
         qmnwZvQ6WP3GCHB5aeV9LLCoUidFVc/pwZ9dn0zT/lGPdMHZX/GbVqhVFgR/l2LxljFL
         6Es9PBJhmmooakur6Rden9l4lgP+kOQKMveRbZPLPY5AhNXG3s2XHvB9nwxqxecGH8Os
         GGps1NkYPYdr/d14ziggmh/9zMwwzwFYycfW/QibP8i0YOXaWENZYydh6eQEPhHCooZq
         BFYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720177095; x=1720781895;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qtrnVRJXBUhHXpn4ff4oCsLzzEe9JHeNRY1NhHBoWPg=;
        b=NuCA4oWnW0ryalsA3bSs0FvsPUZfR7Kpeg/6KKHoNeSn5B8BdXipJBpytOyt+8RIDT
         k34ZLchx6MoAk2SYBvyNcSAmBYrQfaKuEYSBFSzy3kqjWoIFppMhrnJ1k/h+NSAzZTBb
         mBqcNRfgZUvMsJw68vYFONisKgMo1EF1Y+kxSJxjV+7qLGQTzIaL7ccAzkcFt3d0q8Zz
         oI36yueFqrTF13jjBuR3CPqZeJvZwXYq831YTQAhOwg5ldvUYDEA6B9UB38oL2NvkE7O
         IYcH+jKRoE9BXJQTfw1FVmPnhxj4K+TLsnD/YBnREO6Z6nUpEAllAe6U2rZYAG8ZzxnD
         kmdA==
X-Gm-Message-State: AOJu0Yz1uQHTxfUtXN5E1WHhcFJzZJx8cJQtEVHXY+HYrT8OaEZ5Es+0
	X3fg3WmHGuDFvtS6id75Bu2y+fzkmcjZiyim2r5io9a6E8KxNiU4
X-Google-Smtp-Source: AGHT+IGbjJUBMRFrvhCkMm2UyZKwhRdGHeU9eFr955FuYi52wSBDcOpT5Ev9bquVW/fI9pwPSYd9jQ==
X-Received: by 2002:ac2:5490:0:b0:52e:9d6b:2691 with SMTP id 2adb3069b0e04-52ea064c1d2mr2808910e87.20.1720177094838;
        Fri, 05 Jul 2024 03:58:14 -0700 (PDT)
Received: from alexis-pc ([163.5.23.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a188edasm56761985e9.0.2024.07.05.03.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 03:58:14 -0700 (PDT)
Date: Fri, 5 Jul 2024 12:58:12 +0200
From: Alexis Belmonte <alexbelm48@gmail.com>
To: W_Armin@gmx.de, ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org
Subject: [PATCHv9] platform/x86: hp-wmi: Fix platform profile option switch
 bug on Omen and Victus laptops
Message-ID: <ZofRxNfk-ExL5VnN@alexis-pc>
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
V8 -> V9: - Add missing mutex_lock call in omen_powersource_event read
            failure code branch
---
 drivers/platform/x86/hp/Kconfig  |   1 +
 drivers/platform/x86/hp/hp-wmi.c | 209 ++++++++++++++++++++++++++++---
 2 files changed, 193 insertions(+), 17 deletions(-)

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
index 5fa553023842..910bc5195f8f 100644
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
 
@@ -1433,21 +1490,130 @@ static int platform_profile_victus_set(struct platform_profile_handler *pprof,
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
+		mutex_unlock(&active_platform_profile_lock);
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
 
@@ -1456,15 +1622,15 @@ static int thermal_profile_setup(void)
 
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
 
@@ -1758,6 +1924,12 @@ static int __init hp_wmi_init(void)
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
@@ -1772,6 +1944,9 @@ module_init(hp_wmi_init);
 
 static void __exit hp_wmi_exit(void)
 {
+	if (is_omen_thermal_profile() || is_victus_thermal_profile())
+		omen_unregister_powersource_event_handler();
+
 	if (wmi_has_guid(HPWMI_EVENT_GUID))
 		hp_wmi_input_destroy();
 
-- 
2.45.2

