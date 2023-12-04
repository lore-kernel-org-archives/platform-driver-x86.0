Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bwGMWAak"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9FB6FA;
	Mon,  4 Dec 2023 14:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701728268; x=1733264268;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e9k30i8Y84vJYYRkJpUgYrf0FTWIOyXX19b3ixH1MBE=;
  b=bwGMWAak+vOuRY/ZTt+1Z+uoXW0T/68YdBCKGqIaxJmreqm0C6WOMIT1
   gjLRxMlzm55HcQuQJQdSgdqfCjfzlqjth9Ig7LIula4SjuyTla00Q9D+v
   hQ0PRjhUXzn3e5/k+/SyEr2RBfLB3Xo/3LX0yR8mWiNH5FSrE9D6Hr24b
   lvGwzdp2nMc80uR5e8eBK+R3AaOx71eMgmCXjA3/VLXf5jfZ9l87Lkxn2
   2OCAF3gtsO1SCIPnhrZJqTwipdpt1777K6oARTId24LZxAYVhyFBoYPbK
   sZG7kRnXXxYAl0DfEkahYO76KV/IWm5RKjo50M8WOt61nJV61XdvTIwkM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="480000883"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="480000883"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 14:17:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="764111955"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="764111955"
Received: from spandruv-desk.jf.intel.com ([10.54.75.14])
  by orsmga007.jf.intel.com with ESMTP; 04 Dec 2023 14:17:46 -0800
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hdegoede@redhat.com,
	markgross@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v3 4/5] platform/x86: ISST: Process read/write blocked feature status
Date: Mon,  4 Dec 2023 14:17:39 -0800
Message-Id: <20231204221740.3645130-5-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231204221740.3645130-1-srinivas.pandruvada@linux.intel.com>
References: <20231204221740.3645130-1-srinivas.pandruvada@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When a feature is read blocked, don't continue to read SST information
and register with SST core.

When the feature is write blocked, continue to offer read interface for
SST parameters, but don't allow any operation to change state. A state
change results from SST level change, feature change or class of service
change.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
v3
- Rebased on top of /pdx86/platform-drivers-x86 review-hans
v2
- Change read_blocked, write_blocked to bool
- Move the check for power_domain_info->write_blocked for SST-CP
to only write operations

 .../intel/speed_select_if/isst_tpmi_core.c    | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
index 0b6d2c864437..2662fbbddf0c 100644
--- a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
+++ b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
@@ -234,6 +234,7 @@ struct perf_level {
  * @saved_clos_configs:	Save SST-CP CLOS configuration to store restore for suspend/resume
  * @saved_clos_assocs:	Save SST-CP CLOS association to store restore for suspend/resume
  * @saved_pp_control:	Save SST-PP control information to store restore for suspend/resume
+ * @write_blocked:	Write operation is blocked, so can't change SST state
  *
  * This structure is used store complete SST information for a power_domain. This information
  * is used to read/write request for any SST IOCTL. Each physical CPU package can have multiple
@@ -259,6 +260,7 @@ struct tpmi_per_power_domain_info {
 	u64 saved_clos_configs[4];
 	u64 saved_clos_assocs[4];
 	u64 saved_pp_control;
+	bool write_blocked;
 };
 
 /**
@@ -515,6 +517,9 @@ static long isst_if_clos_param(void __user *argp)
 		return -EINVAL;
 
 	if (clos_param.get_set) {
+		if (power_domain_info->write_blocked)
+			return -EPERM;
+
 		_write_cp_info("clos.min_freq", clos_param.min_freq_mhz,
 			       (SST_CLOS_CONFIG_0_OFFSET + clos_param.clos * SST_REG_SIZE),
 			       SST_CLOS_CONFIG_MIN_START, SST_CLOS_CONFIG_MIN_WIDTH,
@@ -602,6 +607,9 @@ static long isst_if_clos_assoc(void __user *argp)
 
 		power_domain_info = &sst_inst->power_domain_info[punit_id];
 
+		if (assoc_cmds.get_set && power_domain_info->write_blocked)
+			return -EPERM;
+
 		offset = SST_CLOS_ASSOC_0_OFFSET +
 				(punit_cpu_no / SST_CLOS_ASSOC_CPUS_PER_REG) * SST_REG_SIZE;
 		shift = punit_cpu_no % SST_CLOS_ASSOC_CPUS_PER_REG;
@@ -752,6 +760,9 @@ static int isst_if_set_perf_level(void __user *argp)
 	if (!power_domain_info)
 		return -EINVAL;
 
+	if (power_domain_info->write_blocked)
+		return -EPERM;
+
 	if (!(power_domain_info->pp_header.allowed_level_mask & BIT(perf_level.level)))
 		return -EINVAL;
 
@@ -809,6 +820,9 @@ static int isst_if_set_perf_feature(void __user *argp)
 	if (!power_domain_info)
 		return -EINVAL;
 
+	if (power_domain_info->write_blocked)
+		return -EPERM;
+
 	_write_pp_info("perf_feature", perf_feature.feature, SST_PP_CONTROL_OFFSET,
 		       SST_PP_FEATURE_STATE_START, SST_PP_FEATURE_STATE_WIDTH,
 		       SST_MUL_FACTOR_NONE)
@@ -1257,11 +1271,21 @@ static long isst_if_def_ioctl(struct file *file, unsigned int cmd,
 
 int tpmi_sst_dev_add(struct auxiliary_device *auxdev)
 {
+	bool read_blocked = 0, write_blocked = 0;
 	struct intel_tpmi_plat_info *plat_info;
 	struct tpmi_sst_struct *tpmi_sst;
 	int i, ret, pkg = 0, inst = 0;
 	int num_resources;
 
+	ret = tpmi_get_feature_status(auxdev, TPMI_ID_SST, &read_blocked, &write_blocked);
+	if (ret)
+		dev_info(&auxdev->dev, "Can't read feature status: ignoring read/write blocked status\n");
+
+	if (read_blocked) {
+		dev_info(&auxdev->dev, "Firmware has blocked reads, exiting\n");
+		return -ENODEV;
+	}
+
 	plat_info = tpmi_get_platform_data(auxdev);
 	if (!plat_info) {
 		dev_err(&auxdev->dev, "No platform info\n");
@@ -1306,6 +1330,7 @@ int tpmi_sst_dev_add(struct auxiliary_device *auxdev)
 		tpmi_sst->power_domain_info[i].package_id = pkg;
 		tpmi_sst->power_domain_info[i].power_domain_id = i;
 		tpmi_sst->power_domain_info[i].auxdev = auxdev;
+		tpmi_sst->power_domain_info[i].write_blocked = write_blocked;
 		tpmi_sst->power_domain_info[i].sst_base = devm_ioremap_resource(&auxdev->dev, res);
 		if (IS_ERR(tpmi_sst->power_domain_info[i].sst_base))
 			return PTR_ERR(tpmi_sst->power_domain_info[i].sst_base);
-- 
2.40.1

