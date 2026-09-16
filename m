Received: from mta0.migadu.com (out-64.mta0.migadu.com [91.218.175.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB154D797D
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 15:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789573348; cv=none; b=gH6QjthLJ9oUywEhVgbyL/Q1GJSF2pMIGIQ1Tj7kD9o9uZ7Fk10B23NLHJ2kwKWuMxm4Wzdr6BAsRt4qSS1jBHHvOB73gVVTfe0i20lA22NIPSxsb6ly808JtgXPp/RCnPjMtBOi9e1c3VUSPhFiZVll8/UaqJSCkxULmewoXY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789573348; c=relaxed/simple;
	bh=pgJZycd6T5cegHfWjo8x3usfbnao0lmc6UEvZnSMqss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cY+W46+R8PTHdPJZ1iB4LOwvrD077EuIBRMxAyvJvwGRia8+4PAzNiSu4f1N3hwaZcUhwOOZbCUMAn321XRR9uPZW8sPzcq/WQIXxH3M9GEp6ol8RNwuhV5HOCxb5VsfaDwfvh3C0pkyZYREPQL4gs+Ft052scLowvlAZxJ4iho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jGTOcqKs; arc=none smtp.client-ip=91.218.175.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jGTOcqKs"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=pgJZycd6T5cegHfWjo8x3usfbnao0lmc6UEvZnSMqss=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789573341; v=1; x=1790178141;
 b=jGTOcqKs+7muO8UzrMmUr4viTfPp7tuLNoKwYQmwOQaq9/uujqL7daP5TsYsFG2BSvWi3rVf
 YwRddpVqqhoF1t8g+1h1Z8oDfFdZKAZ3h3wDQnjSWQj/o26+fcBPW+aUBZmaBp7W1MbXLPkX3bn
 jtTXCzEGNuuPO8aEMEd4IH3w=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0bca811407a263d2;
	Wed, 16 Sep 2026 15:42:21 +0000
X-Mizu-Trace-ID: 0bca811407a263d2
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
Subject: [PATCH v1 1/2] platform/x86: asus-armoury: let attribute groups decide their own visibility
Date: Wed, 16 Sep 2026 15:42:09 +0000
Message-ID: <20260916154210.181441-2-denis.benato@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916154210.181441-1-denis.benato@linux.dev>
References: <20260916154210.181441-1-denis.benato@linux.dev>
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

Give attribute groups whose support depends on a resolved device ID
their own .is_visible() callback: the group is created unconditionally
and sysfs hides it entirely (SYSFS_GROUP_INVISIBLE) when the backing WMI
device is not present. The new ASUS_ATTR_GROUP_BOOL_VIS() and
ASUS_ATTR_GROUP_ENUM_VIS() macros declare such attribute groups.
Creation and removal become symmetric, groups can be removed
unconditionally since sysfs_remove_group() is a no-op for groups that
were never created, and no WMI probe is needed outside of
initialization.

The dgpu_disable attribute now goes through the same resolved device ID
scheme as mini_led_mode and gpu_mux_mode, storing the device ID to use
in asus_armoury.dgpu_disable_dev_id instead of always operating on
ASUS_WMI_DEVID_DGPU.

No functional change is intended.

Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-armoury.c | 111 +++++++++++++++++-----------
 drivers/platform/x86/asus-armoury.h |  55 ++++++++++++++
 2 files changed, 123 insertions(+), 43 deletions(-)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 2d5ca75bc727..8639902f084d 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -94,6 +94,7 @@ struct asus_armoury_priv {
 
 	u32 mini_led_dev_id;
 	u32 gpu_mux_dev_id;
+	u32 dgpu_disable_dev_id;
 
 	bool requires_fan_curve;
 };
@@ -458,7 +459,13 @@ static ssize_t mini_led_mode_possible_values_show(struct kobject *kobj,
 		return -ENODEV;
 	}
 }
-ASUS_ATTR_GROUP_ENUM(mini_led_mode, "mini_led_mode", "Set the mini-LED backlight mode");
+
+static bool mini_led_mode_group_visible(struct kobject *kobj)
+{
+	return asus_armoury.mini_led_dev_id;
+}
+
+ASUS_ATTR_GROUP_ENUM_VIS(mini_led_mode, "mini_led_mode", "Set the mini-LED backlight mode");
 
 static ssize_t gpu_mux_mode_current_value_store(struct kobject *kobj,
 						struct kobj_attribute *attr,
@@ -471,8 +478,8 @@ static ssize_t gpu_mux_mode_current_value_store(struct kobject *kobj,
 	if (err)
 		return err;
 
-	if (armoury_has_devstate(ASUS_WMI_DEVID_DGPU)) {
-		err = armoury_get_devstate(NULL, &result, ASUS_WMI_DEVID_DGPU);
+	if (asus_armoury.dgpu_disable_dev_id) {
+		err = armoury_get_devstate(NULL, &result, asus_armoury.dgpu_disable_dev_id);
 		if (err)
 			return err;
 		if (result && !optimus) {
@@ -502,7 +509,13 @@ static ssize_t gpu_mux_mode_current_value_store(struct kobject *kobj,
 	return count;
 }
 ASUS_WMI_SHOW_INT(gpu_mux_mode_current_value, asus_armoury.gpu_mux_dev_id);
-ASUS_ATTR_GROUP_BOOL(gpu_mux_mode, "gpu_mux_mode", "Set the GPU display MUX mode");
+
+static bool gpu_mux_mode_group_visible(struct kobject *kobj)
+{
+	return asus_armoury.gpu_mux_dev_id;
+}
+
+ASUS_ATTR_GROUP_BOOL_VIS(gpu_mux_mode, "gpu_mux_mode", "Set the GPU display MUX mode");
 
 static ssize_t dgpu_disable_current_value_store(struct kobject *kobj,
 						struct kobj_attribute *attr, const char *buf,
@@ -538,7 +551,8 @@ static ssize_t dgpu_disable_current_value_store(struct kobject *kobj,
 	}
 
 	scoped_guard(mutex, &asus_armoury.egpu_mutex) {
-		err = armoury_set_devstate(attr, disable ? 1 : 0, NULL, ASUS_WMI_DEVID_DGPU);
+		err = armoury_set_devstate(attr, disable ? 1 : 0, NULL,
+					   asus_armoury.dgpu_disable_dev_id);
 		if (err)
 			return err;
 	}
@@ -547,8 +561,14 @@ static ssize_t dgpu_disable_current_value_store(struct kobject *kobj,
 
 	return count;
 }
-ASUS_WMI_SHOW_INT(dgpu_disable_current_value, ASUS_WMI_DEVID_DGPU);
-ASUS_ATTR_GROUP_BOOL(dgpu_disable, "dgpu_disable", "Disable the dGPU");
+
+static bool dgpu_disable_group_visible(struct kobject *kobj)
+{
+	return asus_armoury.dgpu_disable_dev_id;
+}
+
+ASUS_WMI_SHOW_INT(dgpu_disable_current_value, asus_armoury.dgpu_disable_dev_id);
+ASUS_ATTR_GROUP_BOOL_VIS(dgpu_disable, "dgpu_disable", "Disable the dGPU");
 
 /* Values map for eGPU activation requests. */
 static u32 egpu_status_map[] = {
@@ -823,7 +843,6 @@ ASUS_ATTR_GROUP_INT_VALUE_ONLY_RO(nv_base_tgp, ATTR_NV_BASE_TGP, ASUS_WMI_DEVID_
 static const struct asus_attr_group armoury_attr_groups[] = {
 	{ &egpu_connected_attr_group, ASUS_WMI_DEVID_EGPU_CONNECTED },
 	{ &egpu_enable_attr_group, ASUS_WMI_DEVID_EGPU },
-	{ &dgpu_disable_attr_group, ASUS_WMI_DEVID_DGPU },
 	{ &dgpu_power_state_attr_group, ASUS_WMI_DEVID_DGPU_POWER_STATE },
 	{ &apu_mem_attr_group, ASUS_WMI_DEVID_APU_MEM },
 
@@ -938,34 +957,46 @@ static int asus_fw_attr_add(void)
 		goto err_destroy_kset;
 	}
 
+	/*
+	 * Device IDs with model-dependent alternatives are resolved once
+	 * here: their attribute groups then decide visibility themselves
+	 * through .is_visible.
+	 */
 	asus_armoury.mini_led_dev_id = 0;
 	if (armoury_has_devstate(ASUS_WMI_DEVID_MINI_LED_MODE))
 		asus_armoury.mini_led_dev_id = ASUS_WMI_DEVID_MINI_LED_MODE;
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
+	asus_armoury.dgpu_disable_dev_id = 0;
+	if (armoury_has_devstate(ASUS_WMI_DEVID_DGPU))
+		asus_armoury.dgpu_disable_dev_id = ASUS_WMI_DEVID_DGPU;
+
+	err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
+				 &mini_led_mode_attr_group);
+	if (err) {
+		pr_err("Failed to create sysfs-group for mini_led\n");
+		goto err_remove_file;
+	}
+
+	err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
+				 &gpu_mux_mode_attr_group);
+	if (err) {
+		pr_err("Failed to create sysfs-group for gpu_mux\n");
+		goto err_remove_mini_led_group;
+	}
+
+	err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
+				 &dgpu_disable_attr_group);
+	if (err) {
+		pr_err("Failed to create sysfs-group for dgpu_disable\n");
+		goto err_remove_gpu_mux_group;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(armoury_attr_groups); i++) {
@@ -1000,16 +1031,14 @@ static int asus_fw_attr_add(void)
 	return 0;
 
 err_remove_groups:
-	while (i--) {
-		if (armoury_has_devstate(armoury_attr_groups[i].wmi_devid))
-			sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj,
-					   armoury_attr_groups[i].attr_group);
-	}
-	if (asus_armoury.gpu_mux_dev_id)
-		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &gpu_mux_mode_attr_group);
+	while (i--)
+		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj,
+				   armoury_attr_groups[i].attr_group);
+	sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &dgpu_disable_attr_group);
+err_remove_gpu_mux_group:
+	sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &gpu_mux_mode_attr_group);
 err_remove_mini_led_group:
-	if (asus_armoury.mini_led_dev_id)
-		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &mini_led_mode_attr_group);
+	sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &mini_led_mode_attr_group);
 err_remove_file:
 	sysfs_remove_file(&asus_armoury.fw_attr_kset->kobj, &pending_reboot.attr);
 err_destroy_kset:
@@ -1182,17 +1211,13 @@ static void __exit asus_fw_exit(void)
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
+	for (i = ARRAY_SIZE(armoury_attr_groups) - 1; i >= 0; i--)
+		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj,
+				   armoury_attr_groups[i].attr_group);
 
-	if (asus_armoury.mini_led_dev_id)
-		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &mini_led_mode_attr_group);
+	sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &dgpu_disable_attr_group);
+	sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &gpu_mux_mode_attr_group);
+	sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &mini_led_mode_attr_group);
 
 	sysfs_remove_file(&asus_armoury.fw_attr_kset->kobj, &pending_reboot.attr);
 	kset_unregister(asus_armoury.fw_attr_kset);
diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index 6dfe5ddfe4ac..44d12f20cd3c 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -198,6 +198,61 @@ ssize_t armoury_attr_uint_show(struct kobject *kobj, struct kobj_attribute *attr
 		.name = _fsname, .attrs = _attrname##_attrs			\
 	}
 
+/*
+ * Same as ASUS_ATTR_GROUP_BOOL() but the whole attribute group is
+ * created only when <name>_group_visible() returns true.
+ * Requires <name>_current_value_show(), <name>_current_value_store()
+ * and <name>_group_visible()
+ */
+#define ASUS_ATTR_GROUP_BOOL_VIS(_attrname, _fsname, _dispname)		\
+	DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(_attrname)			\
+	static struct kobj_attribute attr_##_attrname##_current_value =	\
+		__ASUS_ATTR_RW(_attrname, current_value);		\
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
+
+/*
+ * Same as ASUS_ATTR_GROUP_ENUM() but the whole attribute group is
+ * created only when <name>_group_visible() returns true.
+ * Requires <name>_current_value_show(), <name>_current_value_store(),
+ * <name>_possible_values_show() and <name>_group_visible()
+ */
+#define ASUS_ATTR_GROUP_ENUM_VIS(_attrname, _fsname, _dispname)		\
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
+	}
+
 #define ASUS_ATTR_GROUP_INT_VALUE_ONLY_RO(_attrname, _fsname, _wmi, _dispname)	\
 	ASUS_WMI_SHOW_INT(_attrname##_current_value, _wmi);		\
 	static struct kobj_attribute attr_##_attrname##_current_value =		\
-- 
2.47.3

