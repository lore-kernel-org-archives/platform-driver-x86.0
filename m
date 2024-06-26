Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9127E18FC9D
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jun 2024 22:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719439446; cv=none; b=lBm0ASgRIjBhcjOipiE4PrbpBNtlSzFCDAF9pJwMWwLCOpFv5Tv4J+dBzzd4zsZ2tdudn1icOI6V22cpkfhsjBrgrMng9ptBBJjt5up3wjeScWWSaLt+rwB0kgBPJYHUjAHgNk9qJwR7nfakuMAzEsS0Ga779sSnXiUyIA6g2qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719439446; c=relaxed/simple;
	bh=WBGlwk47Fi+VMDTGl5DXwHJAsQZH6mdsd/Yw4qSLoRM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NVEM5s3sxNQ1M1I7wAzSwCMUYKG4VWNXglsPd82RiL62sqL+Kq+sYiLlZNnaC8mkHVOouxwUivWkUKhRomXi5biwu/RmJjWpNYuS66eus0dNCHPsc5DQpIBEg7zzq5vmf9fLj1+8DemCwrHNHg5sETjfZxUDzwxooC2Z836Oquw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cmd4bTBF; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cmd4bTBF"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-361785bfa71so5498833f8f.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jun 2024 15:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719439443; x=1720044243; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B5YOhQt6DIo6l4yTwCxidkmhvxk18DENRAWyosnYRDk=;
        b=Cmd4bTBFGCD61lqjXmNuHvjR9Llewnztfv3rZ9YlbBosY11WrkKlCmf1LPEjK4DyFs
         Zzg0Mig/sQT9W6GACXQwlP0sMZrStsmFUYZGdsVf1KN8xCv5f433U1FMCoB7SAgpZhX1
         4BY0ISgoPpDmySGnSs0qubHqOB9uS7L7oM6zggd5lX8eiNIP4KlDkNaWG49Sg+EYxuHJ
         9QBgEBpu1s4fPsMMluRBqnFJG2QYOeEyyand0jpcGirmtfDTUB1HmtjgGqvs1zdoUt1z
         pcMkuGc6N/QiuCMPC90w43POklUoQUuiHpUr2Why5afU3cn0lYQjFzAV6W6VXzJTJCsJ
         28/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719439443; x=1720044243;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B5YOhQt6DIo6l4yTwCxidkmhvxk18DENRAWyosnYRDk=;
        b=XJlq2cD2C6JHrdKVFBdBnit5GYqJTDgqlpVy7XoV2JmB+3ZqkTbld/e3doMQTBOLe8
         qqYJ5y3iudaFgEWlwhhrDtf28fZc51gIQvVqSl+pt9UYS2U2PSjgHUa8icCa008lOoBg
         +rKZV+HD8LSGdrzb2XOOacBsn8D4AwfpsTxnNLOolqgK7hXKeGsGS+ewn9Y4vdYZSuG5
         UA6gE/Re1Hanp4VGmdJHhR0V9RdtofJG291D8wCDjfoQ1pIoj9ihhxQ9qfix/2ApMoKr
         QMXDVI7t2GDOvelabG+2TXxDxvzyUYkUI2GXLSY1iga5CU4DqCqtS/cD1FcwJvz02668
         Qewg==
X-Gm-Message-State: AOJu0YxvrKWjheopz2N0kHV5Zq1s0kwzBRBg15idHQEsvosiiS7ZOotY
	KSNLd6Y8jOcSIV7Rd6jlIczHUILUDvHlhKf9S8DJlnl8ArdmPpeP
X-Google-Smtp-Source: AGHT+IGppF0G8dYaz3O4sTvS8TdzNq7qzo5S5J6XtQRr6cX3jdK6cxx+RqE+MN5jmXCY8lts0rL2KQ==
X-Received: by 2002:a05:6000:1ac7:b0:366:e838:f5d4 with SMTP id ffacd0b85a97d-366e8390b2dmr10501572f8f.3.1719439442392;
        Wed, 26 Jun 2024 15:04:02 -0700 (PDT)
Received: from alexis-pc (cust-west-par-46-193-0-235.cust.wifirst.net. [46.193.0.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3674357c1d8sm21526f8f.8.2024.06.26.15.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 15:04:02 -0700 (PDT)
Date: Thu, 27 Jun 2024 00:04:00 +0200
From: Alexis Belmonte <alexbelm48@gmail.com>
To: W_Armin@gmx.de, ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org
Subject: [PATCHv4] platform/x86: hp-wmi: Fix platform profile option switch
 bug on Omen and Victus laptops
Message-ID: <ZnyQUCcVOCAfRypJ@alexis-pc>
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

   -  hooking an ACPI notify handler through the
      omen_register_powersource_notifier_handler method that listens to AC
      power source changes (plugging in/out the AC power plug)

   -  keeping an intermediate active_platform_profile variable that is
      set when userspace changes the platform profile setting

   -  restoring the selected platform profile kept in
      active_platform_profile when AC power is plugged back into the
      laptop, unless if the user decided to alter the platform profile mid-way

This ensures that the driver follows the principles defined in the Platform
Profile Selection page of the Kernel documentation on those kind of laptops;
which is to not "(...) let userspace know about any sub-optimal conditions
which are impeding reaching the requested performance level".

Since the Omen and Victus laptops share the same embedded controller system,
the fix is applicable to both categories of laptops.

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
---
 drivers/platform/x86/hp/hp-wmi.c | 184 +++++++++++++++++++++++++++++--
 1 file changed, 172 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 5fa553023842..2f57dfe6ab9c 100644
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
@@ -261,8 +262,12 @@ static const struct key_entry hp_wmi_keymap[] = {
 
 static struct input_dev *hp_wmi_input_dev;
 static struct input_dev *camera_shutter_input_dev;
+
 static struct platform_device *hp_wmi_platform_dev;
 static struct platform_profile_handler platform_profile_handler;
+static struct notifier_block platform_power_source_nb;
+DEFINE_MUTEX(active_platform_profile_lock);
+static enum platform_profile_option active_platform_profile;
 static bool platform_profile_support;
 static bool zero_insize_support;
 
@@ -1194,8 +1199,7 @@ static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
 	return err;
 }
 
-static int platform_profile_omen_get(struct platform_profile_handler *pprof,
-				     enum platform_profile_option *profile)
+static int platform_profile_omen_get_ec(enum platform_profile_option *profile)
 {
 	int tp;
 
@@ -1223,6 +1227,30 @@ static int platform_profile_omen_get(struct platform_profile_handler *pprof,
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
@@ -1248,7 +1276,7 @@ inline int omen_thermal_profile_ec_timer_set(u8 value)
 static int platform_profile_omen_set(struct platform_profile_handler *pprof,
 				     enum platform_profile_option profile)
 {
-	int err, tp, tp_version;
+	int err = 0, tp, tp_version;
 	enum hp_thermal_profile_omen_flags flags = 0;
 
 	tp_version = omen_get_thermal_policy_version();
@@ -1279,14 +1307,16 @@ static int platform_profile_omen_set(struct platform_profile_handler *pprof,
 		return -EOPNOTSUPP;
 	}
 
+	mutex_lock(&active_platform_profile_lock);
+
 	err = omen_thermal_profile_set(tp);
 	if (err < 0)
-		return err;
+		goto unlock_and_return;
 
 	if (has_omen_thermal_profile_ec_timer()) {
 		err = omen_thermal_profile_ec_timer_set(0);
 		if (err < 0)
-			return err;
+			goto unlock_and_return;
 
 		if (profile == PLATFORM_PROFILE_PERFORMANCE)
 			flags = HP_OMEN_EC_FLAGS_NOTIMER |
@@ -1294,10 +1324,15 @@ static int platform_profile_omen_set(struct platform_profile_handler *pprof,
 
 		err = omen_thermal_profile_ec_flags_set(flags);
 		if (err < 0)
-			return err;
+			goto unlock_and_return;
 	}
 
-	return 0;
+	active_platform_profile = profile;
+
+unlock_and_return:
+	mutex_unlock(&active_platform_profile_lock);
+
+	return err;
 }
 
 static int thermal_profile_get(void)
@@ -1381,8 +1416,8 @@ static bool is_victus_thermal_profile(void)
 			    board_name) >= 0;
 }
 
-static int platform_profile_victus_get(struct platform_profile_handler *pprof,
-				     enum platform_profile_option *profile)
+static int platform_profile_victus_get_ec(
+	enum platform_profile_option *profile)
 {
 	int tp;
 
@@ -1407,10 +1442,27 @@ static int platform_profile_victus_get(struct platform_profile_handler *pprof,
 	return 0;
 }
 
+static int platform_profile_victus_get(struct platform_profile_handler *pprof,
+				       enum platform_profile_option *profile)
+{
+	enum platform_profile_option selected_platform_profile;
+
+	/*
+	 * Same as for platform_profile_omen_get -- I still decided to keep
+	 * it as a separate implementation if we need to add Victus-specific
+	 * behaviour/logic in the future
+	 */
+	mutex_lock(&active_platform_profile_lock);
+	selected_platform_profile = active_platform_profile;
+	mutex_unlock(&active_platform_profile_lock);
+
+	return selected_platform_profile;
+}
+
 static int platform_profile_victus_set(struct platform_profile_handler *pprof,
-				     enum platform_profile_option profile)
+				       enum platform_profile_option profile)
 {
-	int err, tp;
+	int err = 0, tp;
 
 	switch (profile) {
 	case PLATFORM_PROFILE_PERFORMANCE:
@@ -1426,13 +1478,106 @@ static int platform_profile_victus_set(struct platform_profile_handler *pprof,
 		return -EOPNOTSUPP;
 	}
 
+	mutex_lock(&active_platform_profile_lock);
+
 	err = omen_thermal_profile_set(tp);
 	if (err < 0)
-		return err;
+		goto unlock_and_return;
+
+	active_platform_profile = profile;
+
+unlock_and_return:
+	mutex_unlock(&active_platform_profile_lock);
 
 	return 0;
 }
 
+static int omen_powersource_event(struct notifier_block *nb,
+					   unsigned long value,
+					   void *data)
+{
+	struct acpi_bus_event *event_entry = data;
+	enum platform_profile_option selected_platform_profile;
+	enum platform_profile_option actual_profile;
+	int err;
+
+	if (strcmp(event_entry->device_class, "ac_adapter") != 0)
+		return NOTIFY_DONE;
+
+	pr_debug("Received power source device event\n");
+
+	if (is_omen_thermal_profile())
+		err = platform_profile_omen_get_ec(&actual_profile);
+	else if (is_victus_thermal_profile())
+		err = platform_profile_victus_get_ec(&actual_profile);
+
+	if (err < 0) {
+		pr_warn("Failed to read current platform profile (%d)\n", err);
+		return NOTIFY_BAD;
+	}
+
+	/*
+	 * We don't want the handler to overwrite the newly set platform
+	 * profile if the user has changed it in the meantime (thanks Armin!)
+	 */
+	if (!mutex_trylock(&active_platform_profile_lock))
+		return NOTIFY_DONE;
+
+	selected_platform_profile = active_platform_profile;
+	mutex_unlock(&active_platform_profile_lock);
+
+	/*
+	 * If we're back on AC and that the user-chosen power profile is
+	 * different from what the EC reports, we restore the user-chosen
+	 * one.
+	 */
+	if (power_supply_is_system_supplied() >= 0 ||
+	    selected_platform_profile == actual_profile)
+		return NOTIFY_DONE;
+
+	err = platform_profile_handler.profile_set(&platform_profile_handler,
+						   active_platform_profile);
+	if (err < 0) {
+		pr_warn("Failed to restore platform profile (%d)\n", err);
+		return NOTIFY_BAD;
+	}
+
+	return NOTIFY_OK;
+}
+
+static void omen_register_powersource_event_handler(void)
+{
+	int err;
+	acpi_status status;
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
+	platform_power_source_nb.notifier_call = omen_powersource_event;
+	status = register_acpi_notifier(&platform_power_source_nb);
+
+	if (ACPI_FAILURE(status))
+		pr_warn("Failed to install ACPI power source notify handler\n");
+}
+
+static void omen_unregister_powersource_event_handler(void)
+{
+	acpi_status status;
+
+	status = unregister_acpi_notifier(&platform_power_source_nb);
+
+	if (ACPI_FAILURE(status))
+		pr_err("Failed to remove ACPI power source notify handler\n");
+}
+
 static int thermal_profile_setup(void)
 {
 	int err, tp;
@@ -1534,6 +1679,15 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
 
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
 
@@ -1758,6 +1912,9 @@ static int __init hp_wmi_init(void)
 			goto err_unregister_device;
 	}
 
+	if (is_omen_thermal_profile() || is_victus_thermal_profile())
+		omen_register_powersource_event_handler();
+
 	return 0;
 
 err_unregister_device:
@@ -1772,6 +1929,9 @@ module_init(hp_wmi_init);
 
 static void __exit hp_wmi_exit(void)
 {
+	if (is_omen_thermal_profile() || is_victus_thermal_profile())
+		omen_unregister_powersource_event_handler();
+
 	if (wmi_has_guid(HPWMI_EVENT_GUID))
 		hp_wmi_input_destroy();
 
-- 
2.45.2

