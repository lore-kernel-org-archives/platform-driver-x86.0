Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794708018;
	b=1h8qdgNTbhXYeHf2G61UWmUb8B6yKzc7mVUv019dd1PbqAAN4FfL5MKq6458uaZTJA58
	 en4Qcb+4z6xBEv3W/I9IsuShje1oxmzojcaSuJ0/T0X/cXt65urrhX7vwItqNKJfjNv95
	 Ttk5rDCOqMVaKexL4lYdIFj/Wz9tHhgoyYhUfKH9J0POtgAxWA4ZVzQRmemv0ZS/ZyIIY
	 q0XHyCdw43bwD+jr2rZvDBiqvpwPwSHBvPm/XXgnFfKsGKi8WywzLgMZP7Az1MrTJLzgV
	 S+ukbyo3oPyx9Vm/K2d0vGs5oKBhAuaaooutmWNM2vH107fhGCHd/osJaQXUAPUlPDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794708018;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=P7Glu6ZJzmA9TW+nAmORFcdgVf1KdQKTeaWvtFvicEw=;
	b=kjevRsiPXjVG5z0z4vWvz+bM0XCFNXH/QuHwvRFZ7Wb1CQ2sYFCFCP8xYSxDfxHrIC0F
	 sBpqSCI/PIw1WusrsbEypXjt6Ri/Rpbetyaenw7oPjGVtoH7pZ1cn6FoZVAprf/ZDrqiB
	 UpdXQGfRRlyPQyu9NYcu5SkJN4jKkSYVmV8ApebJy1BUfQc0V8SPtCPRWl/84979hgiov
	 ZkkgX3GEGMm/G3O9hSLpP+Y+c5wYE88xfhRjyrahl614hlY7jArR58GewiTIi17xKpbk7
	 u43VTV/sp4nB1EF+/dgqlE+jTtYTmR7HYA+QVBhqDLEKi41K8mz1xVzhIYdmDI45xlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JfRUytLN;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C85606A327;
	Sun, 15 Nov 2026 02:00:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35C85606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JfRUytLN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794708017; x=1826244017;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Lzcz4BRVuH2aPh8wmrZy4z4sHdJcmT6Z30ltuzvhGIQ=;
  b=JfRUytLNClrlcuWJMuoQ39bz97I2WHU6HTK/T3Tc6iHAB4RUrabU/xK2
   XI7NyOCUU5o0kbjM/y/BfEAFfiBExDkHIHc1yl6PuQP8co9LFKjVp7Cl7
   1EJgahQzjv5bVMWT8zgCD9GBMQ7xSHVUtJd9hY9ke6JqZrPOkUN74hhsl
   TU6O9CxFINCXnRzeljxwmJx+cTR+XhqcjKVD5kPnASIzGO77quFNdHMZd
   rHNVq4/PiotWFJ8M2IHF2qT46MwNEyEiMagKADnSg+VdC435phZ5XXhcb
   si0idqJ1LUkRJOJ5H7FEvZHVsWK/fmLZXByEcP4W6mEcGwzB2sXXw9JMx
   w==;
X-CSE-ConnectionGUID: UhVtn+/qSN+Db0QFdF4nvg==
X-CSE-MsgGUID: uV1C5CoXRvq1duSTplkWrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3476868"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3476868"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 18:00:17 -0800
X-CSE-ConnectionGUID: EjShwE4vRYmXe4CMdm2vjA==
X-CSE-MsgGUID: B0DvsWVRR8CgTsePJ5toAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9397844"
Received: from spandruv-desk.jf.intel.com ([10.54.55.20])
  by fmviesa002.fm.intel.com with ESMTP; 14 Nov 2026 18:00:16 -0800
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH] platform/x86/intel-uncore-freq: Use the same IO domain IDs as ISST
Date: Sat, 14 Nov 2026 18:00:15 -0800
Message-ID: <20261115020015.2518047-1-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The uncore frequency driver and the Intel Speed Select (ISST) driver both
present power domain IDs, which are unique in a package. Compute die
domain IDs are the same in both drivers, as they come from the hardware
provided cdie_mask.

The Intel Speed Select user space tool shows the uncore frequency limits
of IO dies, which are set using the uncore frequency sysfs interface. To
find the uncore frequency entry of an IO die, user space needs the same
power domain ID from both drivers. Otherwise it needs to rely on platform
specific knowledge to map IO dies between the two interfaces.

But IO domain IDs are assigned differently:

ISST: IO domain IDs start after the highest compute die ID of the last
partition, which is fls() of its cdie_mask, and are assigned in partition
order.

Uncore: IO domain IDs start at the maximum of
topology_max_dies_per_package() and the compute die range of the
partition which is probed first, and are assigned in probe order.

So on a partitioned system, the IO domain IDs of the two drivers differ:

- When partition 1 is probed before partition 0. For example with
  cdie_mask 0b0011 and 0b1100 and one IO die in each partition, ISST
  uses 4 for the IO die of partition 0 and 5 for partition 1, while
  uncore uses 5 and 4.

Use the same method as ISST, which doesn't depend on the probe order or
the CPU topology. As a partition only knows its own cdie_mask, store the
cdie_mask and the number of IO dies of each partition at probe, and
resolve the IO domain ID when the domain_id attribute is read.

When the hardware doesn't provide cdie_mask, the system is not
partitioned. Use the resource index as the domain ID, same as ISST.

There is no change in the domain IDs presented to user space on
non-partitioned systems with cdie_mask. On partitioned systems there is
no change, when partition 0 is probed first and the number of dies from
the CPU topology covers all compute dies. Without cdie_mask, there is no
change when the CPU doesn't enumerate dies.

Fixes: a191224186ec ("platform/x86/intel-uncore-freq: Present unique domain ID per package")
Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 .../uncore-frequency-common.c                 |  14 +-
 .../uncore-frequency-common.h                 |   1 +
 .../uncore-frequency/uncore-frequency-tpmi.c  | 142 ++++++++++++------
 3 files changed, 106 insertions(+), 51 deletions(-)

diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
index 22019099a857..060414d9bbfe 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
@@ -25,8 +25,20 @@ static int (*uncore_write)(struct uncore_data *data, unsigned int input, enum un
 static ssize_t show_domain_id(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
 {
 	struct uncore_data *data = container_of(attr, struct uncore_data, domain_id_kobj_attr);
+	unsigned int value;
+	int ret;
 
-	return sysfs_emit(buf, "%u\n", data->domain_id);
+	/*
+	 * Some domain IDs can only be resolved after all partitions are
+	 * probed. The driver uses its own lock for the domain IDs.
+	 */
+	ret = uncore_read(data, &value, UNCORE_INDEX_DOMAIN_ID);
+	if (ret == -EOPNOTSUPP)
+		value = data->domain_id;
+	else if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%u\n", value);
 }
 
 static ssize_t show_instance_id(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.h b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.h
index e319448dc1a4..c77e4d98e3ca 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.h
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.h
@@ -108,6 +108,7 @@ enum uncore_index {
 	UNCORE_INDEX_EFF_LAT_CTRL_HIGH_THRESHOLD_ENABLE,
 	UNCORE_INDEX_EFF_LAT_CTRL_FREQ,
 	UNCORE_INDEX_DIE_ID,
+	UNCORE_INDEX_DOMAIN_ID,
 };
 
 int uncore_freq_common_init(int (*read)(struct uncore_data *data, unsigned int *value,
diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
index 73e0b0a94eaf..27221b66be2e 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
@@ -52,6 +52,8 @@ struct tpmi_uncore_cluster_info {
 	bool elc_supported;
 	u8 __iomem *cluster_base;
 	u16 cdie_id;
+	bool io_domain;
+	u8 partition;
 	struct uncore_data uncore_data;
 	struct tpmi_uncore_struct *uncore_root;
 };
@@ -376,13 +378,16 @@ static void uncore_set_agent_type(struct tpmi_uncore_cluster_info *cluster_info)
 
 #define MAX_PARTITIONS	2
 
-/* IO domain ID start index for a partition */
-static u8 io_die_start[MAX_PARTITIONS];
-
-/* Next IO domain ID index after the current partition IO die IDs */
-static u8 io_die_index_next;
+/*
+ * Compute die mask and number of IO dies of each partition. The layout is
+ * the same for all packages. A partition only knows its own compute dies,
+ * so IO domain IDs are resolved at read time once all partitions are known.
+ */
+static u16 part_cdie_mask[MAX_PARTITIONS];
+static u8 part_io_dies[MAX_PARTITIONS];
+static u8 part_mask;
 
-/* Lock to protect io_die_start, io_die_index_next */
+/* Lock to protect part_cdie_mask, part_io_dies and part_mask */
 static DEFINE_MUTEX(domain_lock);
 
 static inline void set_instance_id(int id, struct tpmi_uncore_cluster_info *cluster_info)
@@ -397,64 +402,89 @@ static inline void set_instance_id(int id, struct tpmi_uncore_cluster_info *clus
 	cluster_info->uncore_data.instance_id = id;
 }
 
-static void set_domain_id(int id, int num_resources,
-			  struct oobmsm_plat_info *plat_info,
-			  struct tpmi_uncore_cluster_info *cluster_info)
+static u8 get_cdie_range(u16 cdie_mask)
 {
-	u8 part_io_index, cdie_range, pkg_io_index, max_dies;
+	/* Unlikely but cdie_mask may have holes, so take range */
+	return fls(cdie_mask) - ffs(cdie_mask) + 1;
+}
 
-	if (plat_info->partition >= MAX_PARTITIONS) {
-		cluster_info->uncore_data.domain_id = id;
-		return;
-	}
+/*
+ * Get the IO domain ID of a cluster, which is unique in a package. Same as
+ * the Intel Speed Select driver, IO domain IDs start after the highest
+ * compute die ID of the last partition and are then assigned in partition
+ * order. For example:
+ *
+ * Partition 0: cdie_mask 0b0011 with 1 IO die
+ * Partition 1: cdie_mask 0b1100 with 1 IO die
+ *
+ * Domain IDs 0-3 are compute dies, 4 is the IO die of partition 0 and 5 is
+ * the IO die of partition 1.
+ *
+ * Until all partitions are probed, the returned ID may change.
+ */
+static unsigned int get_io_domain_id(struct tpmi_uncore_cluster_info *cluster_info)
+{
+	u8 part = cluster_info->partition;
+	unsigned int io_start, i;
 
-	if (cluster_info->uncore_data.agent_type_mask & AGENT_TYPE_CORE) {
-		cluster_info->uncore_data.domain_id = cluster_info->cdie_id;
-		return;
-	}
+	lockdep_assert_held(&domain_lock);
 
-	/* Unlikely but cdie_mask may have holes, so take range */
-	cdie_range = fls(plat_info->cdie_mask) - ffs(plat_info->cdie_mask) + 1;
-	max_dies = topology_max_dies_per_package();
+	io_start = fls(part_cdie_mask[fls(part_mask) - 1]);
 
-	/*
-	 * If the CPU doesn't enumerate dies, then use current cdie range
-	 * as the max.
-	 */
-	if (cdie_range > max_dies)
-		max_dies = cdie_range;
+	for (i = 0; i < part; i++)
+		io_start += part_io_dies[i];
+
+	/* Compute dies are first in a partition, followed by IO dies */
+	return io_start + cluster_info->uncore_data.instance_id -
+	       get_cdie_range(part_cdie_mask[part]);
+}
+
+/*
+ * Record the compute die mask and number of IO dies of a partition. This is
+ * done for every partition, including partitions without IO dies, as IO
+ * domain IDs depend on the compute dies of all partitions.
+ */
+static void set_partition_info(struct oobmsm_plat_info *plat_info, int num_resources)
+{
+	u8 part = plat_info->partition;
+
+	if (part >= MAX_PARTITIONS || !plat_info->cdie_mask)
+		return;
 
 	guard(mutex)(&domain_lock);
 
-	if (!io_die_index_next)
-		io_die_index_next = max_dies;
+	/* Keep partition data on unbind, so that IDs stay stable */
+	part_cdie_mask[part] = plat_info->cdie_mask;
+	part_io_dies[part] = num_resources - get_cdie_range(plat_info->cdie_mask);
+	part_mask |= BIT(part);
+}
 
-	if (!io_die_start[plat_info->partition]) {
-		io_die_start[plat_info->partition] = io_die_index_next;
-		/*
-		 * number of IO dies = num_resources - cdie_range. Hence
-		 * next partition io_die_index_next is set after IO dies
-		 * in the current partition.
-		 */
-		io_die_index_next += (num_resources - cdie_range);
-	}
+static void set_domain_id(int id, struct oobmsm_plat_info *plat_info,
+			  struct tpmi_uncore_cluster_info *cluster_info)
+{
+	u8 part = plat_info->partition;
 
 	/*
-	 * Index from IO die start within the partition:
-	 * This is the first valid domain after the cdies.
-	 * For example the current resource index 5 and cdies end at
-	 * index 3 (cdie_cnt = 4). Then the IO only index 5 - 4 = 1.
+	 * Without the hardware provided compute die mask, power domain IDs
+	 * are the same as the resource index, same as the Intel Speed Select
+	 * driver.
 	 */
-	part_io_index = id - cdie_range;
+	if (part >= MAX_PARTITIONS || !plat_info->cdie_mask) {
+		cluster_info->uncore_data.domain_id = id;
+		return;
+	}
+
+	if (cluster_info->uncore_data.agent_type_mask & AGENT_TYPE_CORE) {
+		cluster_info->uncore_data.domain_id = cluster_info->cdie_id;
+		return;
+	}
 
 	/*
-	 * Add to the IO die start index for this partition in this package
-	 * to make unique in the package.
+	 * The domain ID is resolved in uncore_read() as it depends on all
+	 * partitions. domain_id is zero initialized, which marks it valid.
 	 */
-	pkg_io_index = io_die_start[plat_info->partition] + part_io_index;
-
-	/* Assign this to domain ID */
-	cluster_info->uncore_data.domain_id = pkg_io_index;
+	cluster_info->io_domain = true;
+	cluster_info->partition = part;
 }
 
 /* Callback for sysfs read for TPMI uncore values. Called under mutex locks. */
@@ -487,6 +517,16 @@ static int uncore_read(struct uncore_data *data, unsigned int *value, enum uncor
 		*value = ret;
 		return 0;
 
+	case UNCORE_INDEX_DOMAIN_ID: {
+		cluster_info = container_of(data, struct tpmi_uncore_cluster_info, uncore_data);
+		if (!cluster_info->io_domain)
+			break;
+
+		guard(mutex)(&domain_lock);
+		*value = get_io_domain_id(cluster_info);
+		return 0;
+	}
+
 	default:
 		break;
 	}
@@ -610,6 +650,8 @@ static int uncore_probe(struct auxiliary_device *auxdev, const struct auxiliary_
 
 	pkg = plat_info->package_id;
 
+	set_partition_info(plat_info, num_resources);
+
 	for (i = 0; i < num_resources; ++i) {
 		struct tpmi_uncore_power_domain_info *pd_info;
 		bool auto_ufs_enabled;
@@ -702,7 +744,7 @@ static int uncore_probe(struct auxiliary_device *auxdev, const struct auxiliary_
 
 			set_cdie_id(i, cluster_info, plat_info);
 
-			set_domain_id(i, num_resources, plat_info, cluster_info);
+			set_domain_id(i, plat_info, cluster_info);
 			set_instance_id(i, cluster_info);
 
 			cluster_info->uncore_root = tpmi_uncore;
-- 
2.55.0

