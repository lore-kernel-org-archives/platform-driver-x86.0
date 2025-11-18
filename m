Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1DD2472B6
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Nov 2025 00:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763427506; cv=none; b=KJknCZGotK5Yd0zexKW3bgUyJsOE8ZC3E7YIPtPIGAiTGtZGGxuw95TvvpiTbsN2skrOdJXedQ/A/HBm355AtWjPCUCcX6GmZNJtyowlemm7Aqp2bMzs1GX9lQw9k4BXTTO+Ngkv/Sfk2B9dg2n5r9eXPIpOJhoG6QTtCsXJDcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763427506; c=relaxed/simple;
	bh=VKJDWUKr4rf+xeuei+j2+OdwvR9yeKkH1RHTprq/aM8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f2gnO3+oR1KDJKUZwP6P1tboLhbHkJiBZ7BSDG68icrRQP8g3j98oti/mOuq35uHKcbdvHu9UUW61PJEM9qytQFBL61HckRHssy9a4PuG/kIf9R0yaj+D0ZNznPDGfvFeKX6CpAUbRiJ6HYrtrFwn4niWlds5RvonwyW/G6Hf7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sa8JlcoH; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sa8JlcoH"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763427492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TwYLw+Es83x+aNI+ML0MmQD5GtV7lPKU8Tjfiq23IPI=;
	b=sa8JlcoHUpO8CXaE73HmGVffe2sCpQVAcQvKXYmHoBwGqrU2KhwR7Lei/ZUzadAR1mEyZ4
	fWOjK4hm03rNpigqHm1H7TDCrTVInQtJERAfD5jR4UaBhr2Z1BUW8YcGGpNkjVyvtXGjNT
	eyFR9dnWnL1Cd36s3jqWDG8PH/a6INs=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Limonciello, Mario" <mario.limonciello@amd.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Alok Tiwari" <alok.a.tiwari@oracle.com>,
	"Derek John Clark" <derekjohn.clark@gmail.com>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	porfet828@gmail.com,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH] platform/x86: asus-armoury: make CPU cores interface readonly
Date: Tue, 18 Nov 2025 01:57:48 +0100
Message-ID: <20251118005748.538726-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The CPU cores interface is inconsistent between AMD and Intel systems,
leading to probe failure: solve the problem taking following steps:
- make the interface read-only (avoid the possibility of bricks)
- do not fail if the interface returns unexpected data
- show interface errors at either info or debug level

Links:
https://lore.kernel.org/all/20251114185337.578959-1-denis.benato@linux.dev/
https://lore.kernel.org/all/20251115145158.1172210-1-denis.benato@linux.dev/

Suggested-by: Luke D. Jones <luke@ljones.dev>
Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-armoury.c | 104 ++++++++++++++++++++++++----
 drivers/platform/x86/asus-armoury.h |  12 +++-
 2 files changed, 99 insertions(+), 17 deletions(-)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 9f67218ecd14..abbbcd62d0eb 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -118,11 +118,14 @@ struct asus_armoury_priv {
 	 */
 	struct mutex egpu_mutex;
 
+#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
 	/*
 	 * Mutex to prevent big/little core count changes writing to same
 	 * endpoint at the same time. Must lock during attr store.
 	 */
 	struct mutex cpu_core_mutex;
+#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
+
 	struct cpu_cores *cpu_cores;
 	bool cpu_cores_changeable;
 
@@ -136,7 +139,9 @@ struct asus_armoury_priv {
 static struct asus_armoury_priv asus_armoury = {
 	.egpu_mutex = __MUTEX_INITIALIZER(asus_armoury.egpu_mutex),
 
+#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
 	.cpu_core_mutex = __MUTEX_INITIALIZER(asus_armoury.cpu_core_mutex),
+#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
 };
 
 struct fw_attrs_group {
@@ -285,6 +290,12 @@ static int armoury_set_devstate(struct kobj_attribute *attr,
 			return -EINVAL;
 		}
 		break;
+	case ASUS_WMI_DEVID_CORES_MAX:
+		/*
+		 * CPU cores max is a read-only property on supported devices.
+		 */
+		pr_err("Refusing to write to readonly devstate of CPU cores interface\n");
+		return -EINVAL;
 	default:
 		/* No known problems are known for this dev_id */
 		break;
@@ -803,6 +814,7 @@ static struct cpu_cores *init_cpu_cores_ctrl(void)
 		return ERR_PTR(-ENODEV);
 	}
 
+	pr_debug("CPU cores control interface max cores read 0%x.\n", cores);
 	cores_p->max_power_cores = FIELD_GET(ASUS_POWER_CORE_MASK, cores);
 	cores_p->max_perf_cores = FIELD_GET(ASUS_PERF_CORE_MASK, cores);
 
@@ -812,16 +824,30 @@ static struct cpu_cores *init_cpu_cores_ctrl(void)
 		return ERR_PTR(-EIO);
 	}
 
+	pr_debug("CPU cores control interface active cores read 0%x.\n", cores);
 	cores_p->cur_power_cores = FIELD_GET(ASUS_POWER_CORE_MASK, cores);
 	cores_p->cur_perf_cores = FIELD_GET(ASUS_PERF_CORE_MASK, cores);
 
 	cores_p->min_power_cores = CPU_POWR_CORE_COUNT_MIN;
 	cores_p->min_perf_cores = CPU_PERF_CORE_COUNT_MIN;
 
+	if (cores_p->min_perf_cores > cores_p->max_perf_cores) {
+		pr_info("Invalid CPU performance cores count detected: min: %u, max: %u, current: %u\n",
+		       cores_p->min_perf_cores,
+		       cores_p->max_perf_cores,
+		       cores_p->cur_perf_cores
+		);
+		return ERR_PTR(-EINVAL);
+	}
+
 	if ((cores_p->min_perf_cores > cores_p->max_perf_cores) ||
 	    (cores_p->min_power_cores > cores_p->max_power_cores)
 	) {
-		pr_err("Invalid CPU cores count detected: interface is not safe to be used.\n");
+		pr_info("Invalid CPU efficiency cores count detected: min: %u, max: %u, current: %u\n",
+		       cores_p->min_power_cores,
+		       cores_p->max_power_cores,
+		       cores_p->cur_power_cores
+		);
 		return ERR_PTR(-EINVAL);
 	}
 
@@ -836,6 +862,24 @@ static struct cpu_cores *init_cpu_cores_ctrl(void)
 	return no_free_ptr(cores_p);
 }
 
+/**
+ * cores_value_show() - Get the core count for the specified core type.
+ * @kobj: The kobject associated to caller.
+ * @attr: The kobj_attribute associated to caller.
+ * @buf: The buffer that will be used to sysfs_emit.
+ * @core_type: The core type (performance or efficiency).
+ * @core_value: min, max or current count for the specified cores type.
+ *
+ * Intended usage is from sysfs attribute reading a CPU core count.
+ *
+ * This function assumes asus_armoury.cpu_cores is already initialized,
+ * therefore the compatibility of the interface has already been checked.
+ *
+ * Returns:
+ * * %-EINVAL	- invalid core value type.
+ * * %0		- successful and buf is filled by sysfs_emit.
+ * * %other	- error from sysfs_emit.
+ */
 static ssize_t cores_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf,
 				enum cpu_core_type core_type, enum cpu_core_value core_value)
 {
@@ -865,6 +909,7 @@ static ssize_t cores_value_show(struct kobject *kobj, struct kobj_attribute *att
 	return sysfs_emit(buf, "%u\n", cpu_core_value);
 }
 
+#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
 static ssize_t cores_current_value_store(struct kobject *kobj, struct kobj_attribute *attr,
 					 const char *buf, enum cpu_core_type core_type)
 {
@@ -919,6 +964,7 @@ static ssize_t cores_current_value_store(struct kobject *kobj, struct kobj_attri
 
 	return 0;
 }
+#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
 
 static ssize_t cores_performance_min_value_show(struct kobject *kobj,
 						struct kobj_attribute *attr, char *buf)
@@ -944,6 +990,7 @@ static ssize_t cores_performance_current_value_show(struct kobject *kobj,
 	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_CURRENT);
 }
 
+#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
 static ssize_t cores_performance_current_value_store(struct kobject *kobj,
 						     struct kobj_attribute *attr,
 						     const char *buf, size_t count)
@@ -956,8 +1003,9 @@ static ssize_t cores_performance_current_value_store(struct kobject *kobj,
 
 	return count;
 }
-ASUS_ATTR_GROUP_CORES_RW(cores_performance, "cores_performance",
-			 "Set the max available performance cores");
+#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
+ASUS_ATTR_GROUP_CORES(cores_performance, "cores_performance",
+			 "Get available performance cores");
 
 /* Define helper to access the current power mode tunable values */
 static inline struct rog_tunables *get_current_tunables(void)
@@ -992,6 +1040,7 @@ static ssize_t cores_efficiency_current_value_show(struct kobject *kobj,
 	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_CURRENT);
 }
 
+#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
 static ssize_t cores_efficiency_current_value_store(struct kobject *kobj,
 						    struct kobj_attribute *attr, const char *buf,
 						    size_t count)
@@ -1004,8 +1053,9 @@ static ssize_t cores_efficiency_current_value_store(struct kobject *kobj,
 
 	return count;
 }
-ASUS_ATTR_GROUP_CORES_RW(cores_efficiency, "cores_efficiency",
-		    "Set the max available efficiency cores");
+#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
+ASUS_ATTR_GROUP_CORES(cores_efficiency, "cores_efficiency",
+		    "Get available efficiency cores");
 
 /* Simple attribute creation */
 ASUS_ATTR_GROUP_ENUM_INT_RO(charge_mode, "charge_mode", ASUS_WMI_DEVID_CHARGE_MODE, "0;1;2\n",
@@ -1048,8 +1098,6 @@ static const struct asus_attr_group armoury_attr_groups[] = {
 	{ &egpu_enable_attr_group, ASUS_WMI_DEVID_EGPU },
 	{ &dgpu_disable_attr_group, ASUS_WMI_DEVID_DGPU },
 	{ &apu_mem_attr_group, ASUS_WMI_DEVID_APU_MEM },
-	{ &cores_efficiency_attr_group, ASUS_WMI_DEVID_CORES_MAX },
-	{ &cores_performance_attr_group, ASUS_WMI_DEVID_CORES_MAX },
 
 	{ &ppt_pl1_spl_attr_group, ASUS_WMI_DEVID_PPT_PL1_SPL },
 	{ &ppt_pl2_sppt_attr_group, ASUS_WMI_DEVID_PPT_PL2_SPPT },
@@ -1191,6 +1239,22 @@ static int asus_fw_attr_add(void)
 		}
 	}
 
+	if (asus_armoury.cpu_cores != NULL) {
+		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
+					&cores_efficiency_attr_group);
+		if (err) {
+			pr_err("Failed to create sysfs-group for cpu efficiency cores: %d\n", err);
+			goto err_remove_cores_efficiency_group;
+		}
+
+		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
+					&cores_performance_attr_group);
+		if (err) {
+			pr_err("Failed to create sysfs-group for cpu performance cores: %d\n", err);
+			goto err_remove_cores_performance_group;
+		}
+	}
+
 	for (i = 0; i < ARRAY_SIZE(armoury_attr_groups); i++) {
 		if (!armoury_has_devstate(armoury_attr_groups[i].wmi_devid))
 			continue;
@@ -1230,6 +1294,12 @@ static int asus_fw_attr_add(void)
 	}
 	if (asus_armoury.gpu_mux_dev_id)
 		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &gpu_mux_mode_attr_group);
+err_remove_cores_performance_group:
+	if (asus_armoury.cpu_cores != NULL)
+		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &cores_performance_attr_group);
+err_remove_cores_efficiency_group:
+	if (asus_armoury.cpu_cores != NULL)
+		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &cores_efficiency_attr_group);
 err_remove_mini_led_group:
 	if (asus_armoury.mini_led_dev_id)
 		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &mini_led_mode_attr_group);
@@ -1375,7 +1445,6 @@ static int __init asus_fw_init(void)
 {
 	char *wmi_uid;
 	struct cpu_cores *cpu_cores_ctrl;
-	int err;
 
 	wmi_uid = wmi_get_acpi_device_uid(ASUS_WMI_MGMT_GUID);
 	if (!wmi_uid)
@@ -1389,16 +1458,14 @@ static int __init asus_fw_init(void)
 		return -ENODEV;
 
 	asus_armoury.cpu_cores_changeable = false;
+	asus_armoury.cpu_cores = NULL;
 	if (armoury_has_devstate(ASUS_WMI_DEVID_CORES_MAX)) {
 		cpu_cores_ctrl = init_cpu_cores_ctrl();
-		if (IS_ERR(cpu_cores_ctrl)) {
-			err = PTR_ERR(cpu_cores_ctrl);
-			pr_err("Could not initialise CPU core control: %d\n", err);
-			return err;
+		if (!IS_ERR(cpu_cores_ctrl)) {
+			pr_debug("CPU cores control available.\n");
+			asus_armoury.cpu_cores = cpu_cores_ctrl;
+			asus_armoury.cpu_cores_changeable = true;
 		}
-
-		asus_armoury.cpu_cores = cpu_cores_ctrl;
-		asus_armoury.cpu_cores_changeable = true;
 	}
 
 	init_rog_tunables();
@@ -1417,6 +1484,13 @@ static void __exit asus_fw_exit(void)
 					   armoury_attr_groups[i].attr_group);
 	}
 
+	if (asus_armoury.cpu_cores != NULL) {
+		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj,
+				   &cores_performance_attr_group);
+		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj,
+				   &cores_efficiency_attr_group);
+	}
+
 	if (asus_armoury.gpu_mux_dev_id)
 		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &gpu_mux_mode_attr_group);
 
diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index 2f05a2e0cab3..6b2bfe763d23 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -198,12 +198,20 @@ ssize_t armoury_attr_uint_show(struct kobject *kobj, struct kobj_attribute *attr
 		.name = _fsname, .attrs = _attrname##_attrs			\
 	}
 
+#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
+	#define __ASUS_ATTR_CPU_CORES(_attrname, __attrval) \
+		__ASUS_ATTR_RW(_attrname, __attrval)
+#else
+	#define __ASUS_ATTR_CPU_CORES(_attrname, __attrval) \
+		__ASUS_ATTR_RO(_attrname, __attrval)
+#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
+
 /* CPU core attributes need a little different in setup */
-#define ASUS_ATTR_GROUP_CORES_RW(_attrname, _fsname, _dispname)		\
+#define ASUS_ATTR_GROUP_CORES(_attrname, _fsname, _dispname)		\
 	__ATTR_SHOW_FMT(scalar_increment, _attrname, "%d\n", 1);	\
 	__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);	\
 	static struct kobj_attribute attr_##_attrname##_current_value =	\
-		__ASUS_ATTR_RW(_attrname, current_value);		\
+		__ASUS_ATTR_CPU_CORES(_attrname, current_value);	\
 	static struct kobj_attribute attr_##_attrname##_default_value = \
 		__ASUS_ATTR_RO(_attrname, default_value);		\
 	static struct kobj_attribute attr_##_attrname##_min_value =	\
-- 
2.51.2

