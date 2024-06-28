Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EB282869
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Jun 2024 20:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719608105; cv=none; b=At7rMQxiHR7yq9dgMMQwtAsA5SMQ2OMy8MRqjC+Jsw15JDWFLEM0sTYE6/UUQQJmiCYrRLx9hALgsTXdFeJOPmvvH9vs9qV24Cr01oQQ6UkqLEI8czzXUV9eZQy7xtuqlyUi8DehY6tJBC+fFQw7HmBDeDYAWLjWAUFrEbmD62M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719608105; c=relaxed/simple;
	bh=BlhD2OhU0YCvNNRTQSQY9FSJZ+Hx81ccHpqnX7sweVc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kehAyZCECbXm67UQCi2ecdHb6YiOwA3Pv3Ya3+/wqqi6M3aYxzGNe7PBJJYS449eLcOiUL9PJZfSIEcrFVLMTO612Dm9nTECrOSU49NfvTSnVtBIFGZhkLBCoe9WMBSERyFOlQJDNLeZ7u868fOhWf1Mqy3ykk6wZ+O19PZIfJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d95SsgKp; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d95SsgKp"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-366de090da9so567405f8f.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 28 Jun 2024 13:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719608101; x=1720212901; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NJDkmnaH0OkIDz0utn8bqXco2KDeYcw9py3d/vLbaOc=;
        b=d95SsgKpsHVcNXlWqTJDBcr0bcDeXEWmB2LyW4uO538OomCIl1oGdioLkt32FL8eL5
         G7wmYFRh2bBV9047LLrIA9/pjUwTdUndYfjHOToNtY+WHAdSFxOz3l94p1ZwMh00HMTH
         /IXPI+aef+VusTXUZiB9MGPPPu/tCL0EbcCc39p12GwzJ2pOz5SPUxipv/Opyk0elEjE
         hCSb0DwJFyTj+W/OseMo0jj6G0VHEJhC8IvHanZs8eslyqNJAiauT5/C4v36e8rUoogc
         fbDdZrqVZ0qA1eTRxyyV2FDcD6+ndm0qnNpyODIfEIN6ihVhE8yLcELK6QpzHxPCE9h9
         UYAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719608101; x=1720212901;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NJDkmnaH0OkIDz0utn8bqXco2KDeYcw9py3d/vLbaOc=;
        b=j4loK50Nn3ffTOop59ffLtQhMeb+RHUlQ6uy/O8BvyX/041dr2ME8wqQkbxlaAHd3m
         QVARachlK5ubxTDId36DAgPyh95j24HZjyyj5XbJcRCANPikpK7aJhNa5fH58mnzU2s1
         yEaTbMThlCpcO4rv9K3XzpU7ZTbJ1jagVMMSfJgsJYaaTHCtKlNPkKvap6a3s6uVbx2I
         Um1iHtDLw0DwGnLw+fkL/mXqt3MtJgsHPeY4tvMCoMlABiWmpwi2l0nlT2wSt/dENzBJ
         R2lxxf6Tat5EdWkLRqFVlkd5KJAgMsSMM0QpKmJ/MjwNmFSJvglqoAgkoWA/Pqwb2dey
         1OFw==
X-Gm-Message-State: AOJu0YwE6Nq8ACcocyfDgQV6jKyUDdpHTVjYil/7+Cf1/46Yi0cGOZD8
	FelcM83RnWQjlTPd/zeWESObG3kfY63OHgFkcEBjLrLBaWsC7PzJ
X-Google-Smtp-Source: AGHT+IGBpGhTphyMnDCF2c8qdk/yNrNOLlLbBK+kIyfkKhW8FPd+AqZlBhZVn/BTVg9JwZc33WJZgA==
X-Received: by 2002:a05:6000:1acd:b0:367:418d:650e with SMTP id ffacd0b85a97d-367418d67edmr4780934f8f.33.1719608101000;
        Fri, 28 Jun 2024 13:55:01 -0700 (PDT)
Received: from alexis-pc (cust-west-par-46-193-0-235.cust.wifirst.net. [46.193.0.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0cd707sm3312708f8f.1.2024.06.28.13.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 13:55:00 -0700 (PDT)
Date: Fri, 28 Jun 2024 22:54:58 +0200
From: Alexis Belmonte <alexbelm48@gmail.com>
To: W_Armin@gmx.de, ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org
Subject: [PATCHv5] platform/x86: hp-wmi: Fix platform profile option switch
 bug on Omen and Victus laptops
Message-ID: <Zn8jIvxVFPtuw0r4@alexis-pc>
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
---
 drivers/platform/x86/hp/hp-wmi.c | 232 +++++++++++++++++++++++++++++--
 1 file changed, 220 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 5fa553023842..7e81251c6066 100644
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
@@ -1245,10 +1279,9 @@ inline int omen_thermal_profile_ec_timer_set(u8 value)
 	return ec_write(HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET, value);
 }
 
-static int platform_profile_omen_set(struct platform_profile_handler *pprof,
-				     enum platform_profile_option profile)
+static int platform_profile_omen_set_ec(enum platform_profile_option *profile)
 {
-	int err, tp, tp_version;
+	int tp, tp_version, err;
 	enum hp_thermal_profile_omen_flags flags = 0;
 
 	tp_version = omen_get_thermal_policy_version();
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
 
@@ -1297,6 +1330,29 @@ static int platform_profile_omen_set(struct platform_profile_handler *pprof,
 			return err;
 	}
 
+	/*
+	 * Immediately read back the profile to let the callee know about the
+	 * currently reported EC platform profile
+	 */
+	return platform_profile_omen_get_ec(profile);
+}
+
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
 	return 0;
 }
 
@@ -1381,8 +1437,7 @@ static bool is_victus_thermal_profile(void)
 			    board_name) >= 0;
 }
 
-static int platform_profile_victus_get(struct platform_profile_handler *pprof,
-				     enum platform_profile_option *profile)
+static int platform_profile_victus_get_ec(enum platform_profile_option *profile)
 {
 	int tp;
 
@@ -1407,12 +1462,18 @@ static int platform_profile_victus_get(struct platform_profile_handler *pprof,
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
@@ -1430,9 +1491,138 @@ static int platform_profile_victus_set(struct platform_profile_handler *pprof,
 	if (err < 0)
 		return err;
 
+	/*
+	 * Immediately read back the profile to let the callee know about the
+	 * currently reported EC platform profile
+	 */
+	return platform_profile_victus_get_ec(profile);
+}
+
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
 	return 0;
 }
 
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
+	/*
+	 * We don't want the handler to overwrite the newly set platform
+	 * profile if the user has changed it in the meantime (thanks Armin!)
+	 */
+	if (!mutex_trylock(&active_platform_profile_lock))
+		return NOTIFY_DONE;
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
+	acpi_status status;
+
+	active_platform_profile = PLATFORM_PROFILE_BALANCED;
+
+	if (is_omen_thermal_profile())
+		err = platform_profile_omen_get_ec(&active_platform_profile);
+	else if (is_victus_thermal_profile())
+		err = platform_profile_victus_get_ec(&active_platform_profile);
+
+	if (err) {
+		pr_warn("Failed to retrieve active platform profile (%d)\n",
+			err);
+		active_platform_profile = PLATFORM_PROFILE_BALANCED;
+
+		return err;
+	}
+
+	platform_power_source_nb.notifier_call = omen_powersource_event;
+	status = register_acpi_notifier(&platform_power_source_nb);
+
+	if (ACPI_FAILURE(status))
+		pr_warn("Failed to install ACPI power source notify handler\n");
+
+	return 0;
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
@@ -1534,6 +1724,15 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
 
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
 
@@ -1758,6 +1957,12 @@ static int __init hp_wmi_init(void)
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
@@ -1772,6 +1977,9 @@ module_init(hp_wmi_init);
 
 static void __exit hp_wmi_exit(void)
 {
+	if (is_omen_thermal_profile() || is_victus_thermal_profile())
+		omen_unregister_powersource_event_handler();
+
 	if (wmi_has_guid(HPWMI_EVENT_GUID))
 		hp_wmi_input_destroy();
 
-- 
2.45.2

