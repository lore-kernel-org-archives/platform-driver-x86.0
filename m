Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7009078C71
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Jun 2024 21:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719609285; cv=none; b=YPp5Stvg0PC6xuMQzCl3Ix0ScMaKoAGOrg178xV7mzoeP7e8eHfBP0eZlG9WLyKvvQ68Iwp5arSrQO0rM2NDhh+w0jPIT8gRoE0IJCFGy1OHYgOyuLB4ZfBRpof5Poh669K3F/mtU97A6hDCJ9DxNv/CPXks4qOD6lQQkYLPJy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719609285; c=relaxed/simple;
	bh=MoabUAH7CwuIOTJY/ZyhhxPO0UTZyr9bgf5oSw8nSzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nBf/Ui3dXr+7esQK/fGNds19Yd36Z+3Oa1AA4hK39dT4+KC41ccnU+QixFdYC1bTbJpRaX69vG2ADBIqcNJZAwZRz5RMSuDeXUv1PawCjJ9v0WBDs0i+0NUWQA0IF4NdBCqIAAXqqaXBDZOpc6JDXdthc0jDb0DdNn5wgiX7SRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ICWW4ATP; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ICWW4ATP"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42565670e20so13313375e9.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 28 Jun 2024 14:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719609282; x=1720214082; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r4IFUG4EJqe42feaTNPHDMeAhVuLHOeVXMMGWT6gBrs=;
        b=ICWW4ATPfkn93JZp7xiH+5ziij7Zn7QKleczmskZA6AnGdReie1uGJaCwUMYv/R0f2
         T6ly+E0sx/OOTSabgtdZq9ylDI9hkuoGxKN4ZOwBOSK7CGFX103uL6iPhcKIAV01xznu
         Hs6HqRRPb/H2fxxgnH0GMUV5nW5DLPOZDDGDExzRXwOXVBQSGw3foRQCAH8K8pom3+h6
         tSIp8Vvu0uTPiZ3vheXYCMnpPIJ1RwsUvz1LsWDfMBA4l1RSYMw8JYZgzpfPZ0+2YYXN
         4JHZNlq7rclrWKsAVqCIfDdNoqt1Pt+IlIWWlHdQdCPzea30LdbqsVUKisUH/LNM0Gey
         nNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719609282; x=1720214082;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r4IFUG4EJqe42feaTNPHDMeAhVuLHOeVXMMGWT6gBrs=;
        b=gpgre9I9mHPwLTinCIMfmJZ0331x7g0zALhdDCJyChchudHr3urg8CrpwfhzMY9Hj8
         VE2/qwCQsc2im6sv7R2E1ifyJJoEkbK31A072iKAKgGef2SrwLWvrxSoV21xdoRscqyl
         Ou2BDp93R+Ls4yTHPqeYzao6j81KX+dsH5RuhOXZZqoQsOeM8q5k+rRVeKbRwCQ1DoyD
         XMfsib11pBopWvtCKuIw0hI79xYCzVzBNVxFliLZWPyxMtb0CjQVqsRbC+fnDiE/Ca4i
         5IAxMHu8nkBbUa04/XLhCYLupZ2z5FD7tqADTzbJJx4HNUl1GZisOkjk66eW+PWTakjk
         RKFA==
X-Gm-Message-State: AOJu0Yy5uVPmMkCusgWqXNNsOJa2haXjZJt7nj8Dk6PD5WL5dGWiKGW8
	eK4UQntIT6kMVW/r21aGGpY/paNcdVwDeGWUyC4Q8P218k50bwoj
X-Google-Smtp-Source: AGHT+IE266JjFzfjqR5CuC9PsSFw52dp/Sw4h78F4WcH/EzhEUxInyGbUDCblA3Pz993YzEldP84Fg==
X-Received: by 2002:adf:f182:0:b0:362:363a:9594 with SMTP id ffacd0b85a97d-36760a71f40mr2231696f8f.11.1719609281366;
        Fri, 28 Jun 2024 14:14:41 -0700 (PDT)
Received: from alexis-pc (cust-west-par-46-193-0-235.cust.wifirst.net. [46.193.0.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a103e5esm3303270f8f.108.2024.06.28.14.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 14:14:40 -0700 (PDT)
Date: Fri, 28 Jun 2024 23:14:39 +0200
From: Alexis Belmonte <alexbelm48@gmail.com>
To: W_Armin@gmx.de, ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org
Subject: [PATCHv6] platform/x86: hp-wmi: Fix platform profile option switch
 bug on Omen and Victus laptops
Message-ID: <Zn8nv0bAS4nVsowI@alexis-pc>
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
---
 drivers/platform/x86/hp/hp-wmi.c | 230 +++++++++++++++++++++++++++++--
 1 file changed, 219 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 5fa553023842..a2d1884fedbc 100644
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

