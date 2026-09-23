Received: from mta1.migadu.com (out-64.mta1.migadu.com [95.215.58.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29113311C32
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Sep 2026 00:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790124437; cv=none; b=oZehLSMPDsbVoZXglVHXVuyaW+j1/s2Kl/eQ6w1BtVsfoHKZBs2U9KEsHuSzjvsxV52JSl4IT9fFpZdwIeXpqFr8qhJSrx3e8CY+6N10X+KtZ3mBCo12RuKXu9/FY+hhfCR2lnQyRdoK4uGwiX5um2Tj2QljUnDdUAuxC0nsac8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790124437; c=relaxed/simple;
	bh=Qj9HZiPePJhGdvJbXs3hWBcD87o8H0W+O6Kv2OW8Uo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KeX5kDXVerIu17GG2eQwffc4HnWUljjiD7UTzrKKlRq10l0izNfDLvqepzNOMpUT/rvTQKoYvC/poLoRU/DUdKrCGpv7XLa+vvJa+cUoJs5uVVEWOUoyfvVByddl4YWesKl0ck8J5oqO5rYy8LKyASHuRjo2GYFUDK5THHIACGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FNDgAOD0; arc=none smtp.client-ip=95.215.58.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FNDgAOD0"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Qj9HZiPePJhGdvJbXs3hWBcD87o8H0W+O6Kv2OW8Uo8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790124431; v=1; x=1790729231;
 b=FNDgAOD0rVY1TlxoVLDrSoRt4NQz5/8Z7b7SdwLkZCLtXyudrJqX+ASpOTt0qYKFpT0vYQCw
 MibT6VjKz9gAa6/O4pfG0bT6JrWVWjgApl+0fuuqkM0h23XVTTdiK3pCEF6eJ4aXnO3bfgGMXb2
 zpoHg4o+ELjvtv5IAw+Bc0OY=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 95090a31b149dccd;
	Wed, 23 Sep 2026 00:47:11 +0000
X-Mizu-Trace-ID: 95090a31b149dccd
X-Migadu-Flow: FLOW_OUT
From: Denis Benato <denis.benato@linux.dev>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Hans de Goede" <hansg@kernel.org>,
	"Corentin Chary" <corentin.chary@gmail.com>,
	"Luke Jones" <luke@ljones.dev>,
	"busybox11" <busybox11th@gmail.com>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v2 1/2] platform/x86: asus-armoury: let attribute groups decide their own visibility
Date: Wed, 23 Sep 2026 00:47:05 +0000
Message-ID: <20260923004706.41256-2-denis.benato@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260923004706.41256-1-denis.benato@linux.dev>
References: <20260923004706.41256-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mini_led_mode, gpu_mux_mode and dgpu_disable are created by ad-hoc
conditional blocks in asus_fw_attr_add() which must be manually tracked
by the error and exit paths; those paths also re-probe WMI to know which
groups were actually created.

Give every attribute group its own .is_visible() callback: all groups
are created unconditionally through the common loop and sysfs hides the
unsupported ones entirely. The plain group macros now gate their
visibility on the WMI presence of their device, the
ASUS_ATTR_GROUP_BOOL() and ASUS_ATTR_GROUP_ENUM() macros declare groups
backed by a device ID resolved at probe time, and the power tunable
macros are additionally gated on the platform limits defining a max
value, replacing the special-casing in asus_fw_attr_add() and with it
is_power_tunable_attr().

The dgpu_disable attribute now goes through the same resolved device ID
scheme as mini_led_mode and gpu_mux_mode, storing the device ID to use
in asus_armoury.dgpu_disable_dev_id instead of always operating on
ASUS_WMI_DEVID_DGPU.

No functional change is intended.

Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-armoury.c | 280 +++++++++++-----------------
 drivers/platform/x86/asus-armoury.h | 124 +++++++++---
 2 files changed, 213 insertions(+), 191 deletions(-)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 2d5ca75bc727..7812e93734b8 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -94,6 +94,7 @@ struct asus_armoury_priv {
 
 	u32 mini_led_dev_id;
 	u32 gpu_mux_dev_id;
+	u32 dgpu_disable_dev_id;
 
 	bool requires_fan_curve;
 };
@@ -110,11 +111,6 @@ static struct fw_attrs_group fw_attrs = {
 	.pending_reboot = false,
 };
 
-struct asus_attr_group {
-	const struct attribute_group *attr_group;
-	u32 wmi_devid;
-};
-
 static void asus_set_reboot_and_signal_event(void)
 {
 	fw_attrs.pending_reboot = true;
@@ -458,6 +454,12 @@ static ssize_t mini_led_mode_possible_values_show(struct kobject *kobj,
 		return -ENODEV;
 	}
 }
+
+static bool mini_led_mode_group_visible(struct kobject *kobj)
+{
+	return asus_armoury.mini_led_dev_id;
+}
+
 ASUS_ATTR_GROUP_ENUM(mini_led_mode, "mini_led_mode", "Set the mini-LED backlight mode");
 
 static ssize_t gpu_mux_mode_current_value_store(struct kobject *kobj,
@@ -471,8 +473,8 @@ static ssize_t gpu_mux_mode_current_value_store(struct kobject *kobj,
 	if (err)
 		return err;
 
-	if (armoury_has_devstate(ASUS_WMI_DEVID_DGPU)) {
-		err = armoury_get_devstate(NULL, &result, ASUS_WMI_DEVID_DGPU);
+	if (asus_armoury.dgpu_disable_dev_id) {
+		err = armoury_get_devstate(NULL, &result, asus_armoury.dgpu_disable_dev_id);
 		if (err)
 			return err;
 		if (result && !optimus) {
@@ -502,6 +504,12 @@ static ssize_t gpu_mux_mode_current_value_store(struct kobject *kobj,
 	return count;
 }
 ASUS_WMI_SHOW_INT(gpu_mux_mode_current_value, asus_armoury.gpu_mux_dev_id);
+
+static bool gpu_mux_mode_group_visible(struct kobject *kobj)
+{
+	return asus_armoury.gpu_mux_dev_id;
+}
+
 ASUS_ATTR_GROUP_BOOL(gpu_mux_mode, "gpu_mux_mode", "Set the GPU display MUX mode");
 
 static ssize_t dgpu_disable_current_value_store(struct kobject *kobj,
@@ -538,7 +546,8 @@ static ssize_t dgpu_disable_current_value_store(struct kobject *kobj,
 	}
 
 	scoped_guard(mutex, &asus_armoury.egpu_mutex) {
-		err = armoury_set_devstate(attr, disable ? 1 : 0, NULL, ASUS_WMI_DEVID_DGPU);
+		err = armoury_set_devstate(attr, disable ? 1 : 0, NULL,
+					   asus_armoury.dgpu_disable_dev_id);
 		if (err)
 			return err;
 	}
@@ -547,7 +556,13 @@ static ssize_t dgpu_disable_current_value_store(struct kobject *kobj,
 
 	return count;
 }
-ASUS_WMI_SHOW_INT(dgpu_disable_current_value, ASUS_WMI_DEVID_DGPU);
+
+static bool dgpu_disable_group_visible(struct kobject *kobj)
+{
+	return asus_armoury.dgpu_disable_dev_id;
+}
+
+ASUS_WMI_SHOW_INT(dgpu_disable_current_value, asus_armoury.dgpu_disable_dev_id);
 ASUS_ATTR_GROUP_BOOL(dgpu_disable, "dgpu_disable", "Disable the dGPU");
 
 /* Values map for eGPU activation requests. */
@@ -695,6 +710,12 @@ static ssize_t egpu_enable_possible_values_show(struct kobject *kobj, struct kob
 {
 	return armoury_attr_enum_list(buf, ARRAY_SIZE(egpu_status_map));
 }
+
+static bool egpu_enable_group_visible(struct kobject *kobj)
+{
+	return armoury_has_devstate(ASUS_WMI_DEVID_EGPU);
+}
+
 ASUS_ATTR_GROUP_ENUM(egpu_enable, "egpu_enable", "Enable the eGPU (also disables dGPU)");
 
 /* Device memory available to APU */
@@ -771,6 +792,12 @@ static ssize_t apu_mem_possible_values_show(struct kobject *kobj, struct kobj_at
 {
 	return armoury_attr_enum_list(buf, ARRAY_SIZE(apu_mem_map));
 }
+
+static bool apu_mem_group_visible(struct kobject *kobj)
+{
+	return armoury_has_devstate(ASUS_WMI_DEVID_APU_MEM);
+}
+
 ASUS_ATTR_GROUP_ENUM(apu_mem, "apu_mem", "Set available system RAM (in GB) for the APU to use");
 
 /* Define helper to access the current power mode tunable values */
@@ -782,6 +809,44 @@ static inline struct rog_tunables *get_current_tunables(void)
 	return asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_DC];
 }
 
+/**
+ * has_valid_limit - Checks if a power-related attribute has a valid limit value
+ * @name: The name of the attribute to check
+ * @limits: Pointer to the power_limits structure containing limit values
+ *
+ * This function checks if a power-related attribute has a valid limit value.
+ * It returns false if limits is NULL or if the corresponding limit value is zero.
+ *
+ * Return: true if the attribute has a valid limit value, false otherwise
+ */
+static bool has_valid_limit(const char *name, const struct power_limits *limits)
+{
+	u32 limit_value = 0;
+
+	if (!limits)
+		return false;
+
+	if (!strcmp(name, ATTR_PPT_PL1_SPL))
+		limit_value = limits->ppt_pl1_spl_max;
+	else if (!strcmp(name, ATTR_PPT_PL2_SPPT))
+		limit_value = limits->ppt_pl2_sppt_max;
+	else if (!strcmp(name, ATTR_PPT_PL3_FPPT))
+		limit_value = limits->ppt_pl3_fppt_max;
+	else if (!strcmp(name, ATTR_PPT_APU_SPPT))
+		limit_value = limits->ppt_apu_sppt_max;
+	else if (!strcmp(name, ATTR_PPT_PLATFORM_SPPT))
+		limit_value = limits->ppt_platform_sppt_max;
+	else if (!strcmp(name, ATTR_NV_DYNAMIC_BOOST))
+		limit_value = limits->nv_dynamic_boost_max;
+	else if (!strcmp(name, ATTR_NV_TEMP_TARGET))
+		limit_value = limits->nv_temp_target_max;
+	else if (!strcmp(name, ATTR_NV_BASE_TGP) ||
+		 !strcmp(name, ATTR_NV_TGP))
+		limit_value = limits->nv_tgp_max;
+
+	return limit_value > 0;
+}
+
 /* Simple attribute creation */
 ASUS_ATTR_GROUP_ENUM_INT_RO(charge_mode, "charge_mode", ASUS_WMI_DEVID_CHARGE_MODE, "0;1;2\n",
 			    "Show the current mode of charging");
@@ -819,103 +884,35 @@ ASUS_ATTR_GROUP_ROG_TUNABLE(nv_tgp, "nv_tgp", ASUS_WMI_DEVID_DGPU_SET_TGP,
 ASUS_ATTR_GROUP_INT_VALUE_ONLY_RO(nv_base_tgp, ATTR_NV_BASE_TGP, ASUS_WMI_DEVID_DGPU_BASE_TGP,
 				  "Read the base TGP value");
 
-/* If an attribute does not require any special case handling add it here */
-static const struct asus_attr_group armoury_attr_groups[] = {
-	{ &egpu_connected_attr_group, ASUS_WMI_DEVID_EGPU_CONNECTED },
-	{ &egpu_enable_attr_group, ASUS_WMI_DEVID_EGPU },
-	{ &dgpu_disable_attr_group, ASUS_WMI_DEVID_DGPU },
-	{ &dgpu_power_state_attr_group, ASUS_WMI_DEVID_DGPU_POWER_STATE },
-	{ &apu_mem_attr_group, ASUS_WMI_DEVID_APU_MEM },
-
-	{ &ppt_pl1_spl_attr_group, ASUS_WMI_DEVID_PPT_PL1_SPL },
-	{ &ppt_pl2_sppt_attr_group, ASUS_WMI_DEVID_PPT_PL2_SPPT },
-	{ &ppt_pl3_fppt_attr_group, ASUS_WMI_DEVID_PPT_PL3_FPPT },
-	{ &ppt_apu_sppt_attr_group, ASUS_WMI_DEVID_PPT_APU_SPPT },
-	{ &ppt_platform_sppt_attr_group, ASUS_WMI_DEVID_PPT_PLAT_SPPT },
-	{ &nv_dynamic_boost_attr_group, ASUS_WMI_DEVID_NV_DYN_BOOST },
-	{ &nv_temp_target_attr_group, ASUS_WMI_DEVID_NV_THERM_TARGET },
-	{ &nv_base_tgp_attr_group, ASUS_WMI_DEVID_DGPU_BASE_TGP },
-	{ &nv_tgp_attr_group, ASUS_WMI_DEVID_DGPU_SET_TGP },
-
-	{ &charge_mode_attr_group, ASUS_WMI_DEVID_CHARGE_MODE },
-	{ &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
-	{ &mcu_powersave_attr_group, ASUS_WMI_DEVID_MCU_POWERSAVE },
-	{ &panel_od_attr_group, ASUS_WMI_DEVID_PANEL_OD },
-	{ &panel_hd_mode_attr_group, ASUS_WMI_DEVID_PANEL_HD },
-	{ &screen_auto_brightness_attr_group, ASUS_WMI_DEVID_SCREEN_AUTO_BRIGHTNESS },
+static const struct attribute_group *armoury_attr_groups[] = {
+	&mini_led_mode_attr_group,
+	&gpu_mux_mode_attr_group,
+	&egpu_connected_attr_group,
+	&egpu_enable_attr_group,
+	&dgpu_disable_attr_group,
+	&dgpu_power_state_attr_group,
+	&apu_mem_attr_group,
+
+	&ppt_pl1_spl_attr_group,
+	&ppt_pl2_sppt_attr_group,
+	&ppt_pl3_fppt_attr_group,
+	&ppt_apu_sppt_attr_group,
+	&ppt_platform_sppt_attr_group,
+	&nv_dynamic_boost_attr_group,
+	&nv_temp_target_attr_group,
+	&nv_base_tgp_attr_group,
+	&nv_tgp_attr_group,
+
+	&charge_mode_attr_group,
+	&boot_sound_attr_group,
+	&mcu_powersave_attr_group,
+	&panel_od_attr_group,
+	&panel_hd_mode_attr_group,
+	&screen_auto_brightness_attr_group,
 };
 
-/**
- * is_power_tunable_attr - Determines if an attribute is a power-related tunable
- * @name: The name of the attribute to check
- *
- * This function checks if the given attribute name is related to power tuning.
- *
- * Return: true if the attribute is a power-related tunable, false otherwise
- */
-static bool is_power_tunable_attr(const char *name)
-{
-	static const char * const power_tunable_attrs[] = {
-		ATTR_PPT_PL1_SPL,	ATTR_PPT_PL2_SPPT,
-		ATTR_PPT_PL3_FPPT,	ATTR_PPT_APU_SPPT,
-		ATTR_PPT_PLATFORM_SPPT, ATTR_NV_DYNAMIC_BOOST,
-		ATTR_NV_TEMP_TARGET,	ATTR_NV_BASE_TGP,
-		ATTR_NV_TGP
-	};
-
-	for (unsigned int i = 0; i < ARRAY_SIZE(power_tunable_attrs); i++) {
-		if (!strcmp(name, power_tunable_attrs[i]))
-			return true;
-	}
-
-	return false;
-}
-
-/**
- * has_valid_limit - Checks if a power-related attribute has a valid limit value
- * @name: The name of the attribute to check
- * @limits: Pointer to the power_limits structure containing limit values
- *
- * This function checks if a power-related attribute has a valid limit value.
- * It returns false if limits is NULL or if the corresponding limit value is zero.
- *
- * Return: true if the attribute has a valid limit value, false otherwise
- */
-static bool has_valid_limit(const char *name, const struct power_limits *limits)
-{
-	u32 limit_value = 0;
-
-	if (!limits)
-		return false;
-
-	if (!strcmp(name, ATTR_PPT_PL1_SPL))
-		limit_value = limits->ppt_pl1_spl_max;
-	else if (!strcmp(name, ATTR_PPT_PL2_SPPT))
-		limit_value = limits->ppt_pl2_sppt_max;
-	else if (!strcmp(name, ATTR_PPT_PL3_FPPT))
-		limit_value = limits->ppt_pl3_fppt_max;
-	else if (!strcmp(name, ATTR_PPT_APU_SPPT))
-		limit_value = limits->ppt_apu_sppt_max;
-	else if (!strcmp(name, ATTR_PPT_PLATFORM_SPPT))
-		limit_value = limits->ppt_platform_sppt_max;
-	else if (!strcmp(name, ATTR_NV_DYNAMIC_BOOST))
-		limit_value = limits->nv_dynamic_boost_max;
-	else if (!strcmp(name, ATTR_NV_TEMP_TARGET))
-		limit_value = limits->nv_temp_target_max;
-	else if (!strcmp(name, ATTR_NV_BASE_TGP) ||
-		 !strcmp(name, ATTR_NV_TGP))
-		limit_value = limits->nv_tgp_max;
-
-	return limit_value > 0;
-}
-
 static int asus_fw_attr_add(void)
 {
-	const struct rog_tunables *const ac_rog_tunables =
-		asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_AC];
-	const struct power_limits *limits;
-	bool should_create;
-	const char *name;
 	int err, i;
 
 	asus_armoury.fw_attr_dev = device_create(&firmware_attributes_class, NULL, MKDEV(0, 0),
@@ -944,73 +941,32 @@ static int asus_fw_attr_add(void)
 	else if (armoury_has_devstate(ASUS_WMI_DEVID_MINI_LED_MODE2))
 		asus_armoury.mini_led_dev_id = ASUS_WMI_DEVID_MINI_LED_MODE2;
 
-	if (asus_armoury.mini_led_dev_id) {
-		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
-					 &mini_led_mode_attr_group);
-		if (err) {
-			pr_err("Failed to create sysfs-group for mini_led\n");
-			goto err_remove_file;
-		}
-	}
-
 	asus_armoury.gpu_mux_dev_id = 0;
 	if (armoury_has_devstate(ASUS_WMI_DEVID_GPU_MUX))
 		asus_armoury.gpu_mux_dev_id = ASUS_WMI_DEVID_GPU_MUX;
 	else if (armoury_has_devstate(ASUS_WMI_DEVID_GPU_MUX_VIVO))
 		asus_armoury.gpu_mux_dev_id = ASUS_WMI_DEVID_GPU_MUX_VIVO;
 
-	if (asus_armoury.gpu_mux_dev_id) {
-		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
-					 &gpu_mux_mode_attr_group);
-		if (err) {
-			pr_err("Failed to create sysfs-group for gpu_mux\n");
-			goto err_remove_mini_led_group;
-		}
-	}
+	asus_armoury.dgpu_disable_dev_id = 0;
+	if (armoury_has_devstate(ASUS_WMI_DEVID_DGPU))
+		asus_armoury.dgpu_disable_dev_id = ASUS_WMI_DEVID_DGPU;
 
 	for (i = 0; i < ARRAY_SIZE(armoury_attr_groups); i++) {
-		if (!armoury_has_devstate(armoury_attr_groups[i].wmi_devid))
-			continue;
-
-		/* Always create by default, unless PPT is not present */
-		should_create = true;
-		name = armoury_attr_groups[i].attr_group->name;
-
-		/* Check if this is a power-related tunable requiring limits */
-		if (ac_rog_tunables && ac_rog_tunables->power_limits &&
-		    is_power_tunable_attr(name)) {
-			limits = ac_rog_tunables->power_limits;
-			/* Check only AC: if not present then DC won't be either */
-			should_create = has_valid_limit(name, limits);
-			if (!should_create)
-				pr_debug("Missing max value for tunable %s\n", name);
-		}
-
-		if (should_create) {
-			err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
-						 armoury_attr_groups[i].attr_group);
-			if (err) {
-				pr_err("Failed to create sysfs-group for %s\n",
-				       armoury_attr_groups[i].attr_group->name);
-				goto err_remove_groups;
-			}
+		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
+					 armoury_attr_groups[i]);
+		if (err) {
+			pr_err("Failed to create sysfs-group for %s\n",
+			       armoury_attr_groups[i]->name);
+			goto err_remove_groups;
 		}
 	}
 
 	return 0;
 
 err_remove_groups:
-	while (i--) {
-		if (armoury_has_devstate(armoury_attr_groups[i].wmi_devid))
-			sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj,
-					   armoury_attr_groups[i].attr_group);
-	}
-	if (asus_armoury.gpu_mux_dev_id)
-		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &gpu_mux_mode_attr_group);
-err_remove_mini_led_group:
-	if (asus_armoury.mini_led_dev_id)
-		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &mini_led_mode_attr_group);
-err_remove_file:
+	while (i--)
+		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj,
+				   armoury_attr_groups[i]);
 	sysfs_remove_file(&asus_armoury.fw_attr_kset->kobj, &pending_reboot.attr);
 err_destroy_kset:
 	kset_unregister(asus_armoury.fw_attr_kset);
@@ -1182,17 +1138,9 @@ static void __exit asus_fw_exit(void)
 {
 	int i;
 
-	for (i = ARRAY_SIZE(armoury_attr_groups) - 1; i >= 0; i--) {
-		if (armoury_has_devstate(armoury_attr_groups[i].wmi_devid))
-			sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj,
-					   armoury_attr_groups[i].attr_group);
-	}
-
-	if (asus_armoury.gpu_mux_dev_id)
-		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &gpu_mux_mode_attr_group);
-
-	if (asus_armoury.mini_led_dev_id)
-		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &mini_led_mode_attr_group);
+	for (i = ARRAY_SIZE(armoury_attr_groups) - 1; i >= 0; i--)
+		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj,
+				   armoury_attr_groups[i]);
 
 	sysfs_remove_file(&asus_armoury.fw_attr_kset->kobj, &pending_reboot.attr);
 	kset_unregister(asus_armoury.fw_attr_kset);
diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index d605af2fdaa1..38509a086a02 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -100,6 +100,43 @@ ssize_t armoury_attr_uint_show(struct kobject *kobj, struct kobj_attribute *attr
 	static struct kobj_attribute attr_##_attrname##_##_prop =		\
 		__ASUS_ATTR_RO(_attrname, _prop)
 
+/*
+ * Every attribute group decides its own visibility through .is_visible():
+ * sysfs hides a named group entirely when its first attribute reports
+ * SYSFS_GROUP_INVISIBLE, so groups are always created and never leave
+ * empty directories behind.
+ */
+#define __ASUS_DEVSTATE_GROUP_VISIBLE(_attrname, _wmi)			\
+	static bool _attrname##_group_visible(struct kobject *kobj)	\
+	{								\
+		return armoury_has_devstate(_wmi);			\
+	}								\
+	DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(_attrname)
+
+/*
+ * Power tunables are additionally gated on the platform limits actually
+ * defining a max value for them. Only the AC limits are checked: if not
+ * present then DC won't be either.
+ */
+#define __ASUS_POWER_TUNABLE_GROUP_VISIBLE(_attrname, _fsname, _wmi)	\
+	static bool _attrname##_group_visible(struct kobject *kobj)	\
+	{								\
+		const struct rog_tunables *tunables =			\
+			asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_AC];	\
+									\
+		if (!tunables || !tunables->power_limits)		\
+			return armoury_has_devstate(_wmi);		\
+									\
+		if (!has_valid_limit(_fsname, tunables->power_limits)) {\
+			pr_debug("Missing max value for tunable %s\n",	\
+				 _fsname);				\
+			return false;					\
+		}							\
+									\
+		return armoury_has_devstate(_wmi);			\
+	}								\
+	DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(_attrname)
+
 #define __ATTR_RO_INT_GROUP_ENUM(_attrname, _wmi, _fsname, _possible, _dispname)\
 	ASUS_WMI_SHOW_INT(_attrname##_current_value, _wmi);		\
 	static struct kobj_attribute attr_##_attrname##_current_value =		\
@@ -108,6 +145,7 @@ ssize_t armoury_attr_uint_show(struct kobject *kobj, struct kobj_attribute *attr
 	__ATTR_SHOW_FMT(possible_values, _attrname, "%s\n", _possible);		\
 	static struct kobj_attribute attr_##_attrname##_type =			\
 		__ASUS_ATTR_RO_AS(type, enum_type_show);			\
+	__ASUS_DEVSTATE_GROUP_VISIBLE(_attrname, _wmi);				\
 	static struct attribute *_attrname##_attrs[] = {			\
 		&attr_##_attrname##_current_value.attr,				\
 		&attr_##_attrname##_display_name.attr,				\
@@ -116,7 +154,9 @@ ssize_t armoury_attr_uint_show(struct kobject *kobj, struct kobj_attribute *attr
 		NULL								\
 	};									\
 	static const struct attribute_group _attrname##_attr_group = {		\
-		.name = _fsname, .attrs = _attrname##_attrs			\
+		.name = _fsname,						\
+		.is_visible = SYSFS_GROUP_VISIBLE(_attrname),			\
+		.attrs = _attrname##_attrs					\
 	}
 
 #define __ATTR_RW_INT_GROUP_ENUM(_attrname, _minv, _maxv, _wmi, _fsname,\
@@ -129,6 +169,7 @@ ssize_t armoury_attr_uint_show(struct kobject *kobj, struct kobj_attribute *attr
 	__ATTR_SHOW_FMT(possible_values, _attrname, "%s\n", _possible);	\
 	static struct kobj_attribute attr_##_attrname##_type =		\
 		__ASUS_ATTR_RO_AS(type, enum_type_show);		\
+	__ASUS_DEVSTATE_GROUP_VISIBLE(_attrname, _wmi);			\
 	static struct attribute *_attrname##_attrs[] = {		\
 		&attr_##_attrname##_current_value.attr,			\
 		&attr_##_attrname##_display_name.attr,			\
@@ -137,7 +178,9 @@ ssize_t armoury_attr_uint_show(struct kobject *kobj, struct kobj_attribute *attr
 		NULL							\
 	};								\
 	static const struct attribute_group _attrname##_attr_group = {	\
-		.name = _fsname, .attrs = _attrname##_attrs		\
+		.name = _fsname,					\
+		.is_visible = SYSFS_GROUP_VISIBLE(_attrname),		\
+		.attrs = _attrname##_attrs				\
 	}
 
 /* Boolean style enumeration, base macro. Requires adding show/store */
@@ -168,37 +211,63 @@ ssize_t armoury_attr_uint_show(struct kobject *kobj, struct kobj_attribute *attr
 	__ATTR_RO_INT_GROUP_ENUM(_attrname, _wmi, _fsname, _possible, _dispname)
 
 /*
- * Requires <name>_current_value_show(), <name>_current_value_show()
+ * Boolean style group whose whole visibility is decided by
+ * <name>_group_visible(), for attributes backed by a device ID resolved
+ * at probe time.
+ * Requires <name>_current_value_show(), <name>_current_value_store()
+ * and <name>_group_visible()
  */
 #define ASUS_ATTR_GROUP_BOOL(_attrname, _fsname, _dispname)		\
+	DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(_attrname)			\
 	static struct kobj_attribute attr_##_attrname##_current_value =	\
 		__ASUS_ATTR_RW(_attrname, current_value);		\
-	__ATTR_GROUP_ENUM(_attrname, _fsname, "0;1", _dispname)
+	__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);	\
+	__ATTR_SHOW_FMT(possible_values, _attrname, "%s\n", "0;1");	\
+	static struct kobj_attribute attr_##_attrname##_type =		\
+		__ASUS_ATTR_RO_AS(type, enum_type_show);		\
+	static struct attribute *_attrname##_attrs[] = {		\
+		&attr_##_attrname##_current_value.attr,			\
+		&attr_##_attrname##_display_name.attr,			\
+		&attr_##_attrname##_possible_values.attr,		\
+		&attr_##_attrname##_type.attr,				\
+		NULL							\
+	};								\
+	static const struct attribute_group _attrname##_attr_group = {	\
+		.name = _fsname,					\
+		.is_visible = SYSFS_GROUP_VISIBLE(_attrname),		\
+		.attrs = _attrname##_attrs				\
+	}
 
 /*
- * Requires <name>_current_value_show(), <name>_current_value_show()
- * and <name>_possible_values_show()
+ * Group whose whole visibility is decided by <name>_group_visible(),
+ * for attributes backed by a device ID resolved at probe time.
+ * Requires <name>_current_value_show(), <name>_current_value_store(),
+ * <name>_possible_values_show() and <name>_group_visible()
  */
-#define ASUS_ATTR_GROUP_ENUM(_attrname, _fsname, _dispname)			\
-	__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);		\
-	static struct kobj_attribute attr_##_attrname##_current_value =		\
-		__ASUS_ATTR_RW(_attrname, current_value);			\
-	static struct kobj_attribute attr_##_attrname##_possible_values =	\
-		__ASUS_ATTR_RO(_attrname, possible_values);			\
-	static struct kobj_attribute attr_##_attrname##_type =			\
-		__ASUS_ATTR_RO_AS(type, enum_type_show);			\
-	static struct attribute *_attrname##_attrs[] = {			\
-		&attr_##_attrname##_current_value.attr,				\
-		&attr_##_attrname##_display_name.attr,				\
-		&attr_##_attrname##_possible_values.attr,			\
-		&attr_##_attrname##_type.attr,					\
-		NULL								\
-	};									\
-	static const struct attribute_group _attrname##_attr_group = {		\
-		.name = _fsname, .attrs = _attrname##_attrs			\
+#define ASUS_ATTR_GROUP_ENUM(_attrname, _fsname, _dispname)		\
+	DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(_attrname)			\
+	static struct kobj_attribute attr_##_attrname##_current_value =	\
+		__ASUS_ATTR_RW(_attrname, current_value);		\
+	__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);	\
+	static struct kobj_attribute attr_##_attrname##_possible_values =\
+		__ASUS_ATTR_RO(_attrname, possible_values);		\
+	static struct kobj_attribute attr_##_attrname##_type =		\
+		__ASUS_ATTR_RO_AS(type, enum_type_show);		\
+	static struct attribute *_attrname##_attrs[] = {		\
+		&attr_##_attrname##_current_value.attr,			\
+		&attr_##_attrname##_display_name.attr,			\
+		&attr_##_attrname##_possible_values.attr,		\
+		&attr_##_attrname##_type.attr,				\
+		NULL							\
+	};								\
+	static const struct attribute_group _attrname##_attr_group = {	\
+		.name = _fsname,					\
+		.is_visible = SYSFS_GROUP_VISIBLE(_attrname),		\
+		.attrs = _attrname##_attrs				\
 	}
 
 #define ASUS_ATTR_GROUP_INT_VALUE_ONLY_RO(_attrname, _fsname, _wmi, _dispname)	\
+	__ASUS_POWER_TUNABLE_GROUP_VISIBLE(_attrname, _fsname, _wmi);		\
 	ASUS_WMI_SHOW_INT(_attrname##_current_value, _wmi);		\
 	static struct kobj_attribute attr_##_attrname##_current_value =		\
 		__ASUS_ATTR_RO(_attrname, current_value);			\
@@ -211,7 +280,9 @@ ssize_t armoury_attr_uint_show(struct kobject *kobj, struct kobj_attribute *attr
 		&attr_##_attrname##_type.attr, NULL				\
 	};									\
 	static const struct attribute_group _attrname##_attr_group = {		\
-		.name = _fsname, .attrs = _attrname##_attrs			\
+		.name = _fsname,						\
+		.is_visible = SYSFS_GROUP_VISIBLE(_attrname),			\
+		.attrs = _attrname##_attrs					\
 	}
 
 /*
@@ -284,6 +355,7 @@ ssize_t armoury_attr_uint_show(struct kobject *kobj, struct kobj_attribute *attr
 		__ASUS_ATTR_RW(_attr, current_value)
 
 #define ASUS_ATTR_GROUP_ROG_TUNABLE(_attrname, _fsname, _wmi, _dispname)	\
+	__ASUS_POWER_TUNABLE_GROUP_VISIBLE(_attrname, _fsname, _wmi);	\
 	__ROG_TUNABLE_RW(_attrname, _wmi);				\
 	__ROG_TUNABLE_SHOW_DEFAULT(_attrname);				\
 	__ROG_TUNABLE_SHOW(min_value, _attrname, _attrname##_min);	\
@@ -303,7 +375,9 @@ ssize_t armoury_attr_uint_show(struct kobject *kobj, struct kobj_attribute *attr
 		NULL							\
 	};								\
 	static const struct attribute_group _attrname##_attr_group = {	\
-		.name = _fsname, .attrs = _attrname##_attrs		\
+		.name = _fsname,					\
+		.is_visible = SYSFS_GROUP_VISIBLE(_attrname),		\
+		.attrs = _attrname##_attrs				\
 	}
 
 /* Default is always the maximum value unless *_def is specified */
-- 
2.47.3

