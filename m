Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kie+S0mL"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE5E71704;
	Thu, 30 Nov 2023 13:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701380893; x=1732916893;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ynpHLXDdF8t4exe4BtFwqcU6UiBYIe3RD5PYagdF8UE=;
  b=Kie+S0mLoxPMeY8mDMPtrM37sxgfawqhftYI56jKpvFR8AvWWt38ENYK
   96NPBh7SfqBSpM6PWnPOKHyo9DQIt+8hCNvUjlZm34OIZEmgOhMqYzO4z
   twGbB5aiw1HG1feG9jFONRHXWPhM5IFXYob8lmrj0wH80s0PKzBWVQGaj
   lPWoDFUWf165ppcvwy1lZ3QdTVUPAh8fPYi3dUoSyLXjif7tgmENkqITA
   o5LXR2Edp0zgP6xkjVbXIm+cmvXYcEHsryHAcldyWMvELgjQe5PtE1a1l
   J/1fxSXB2yijGCNntcKC5OEvuMzoyFSbvoUpCFPKd83al2hZyLehsOZu9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="399962"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="399962"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 13:48:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="860334609"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="860334609"
Received: from spandruv-desk.jf.intel.com ([10.54.75.14])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Nov 2023 13:48:11 -0800
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hdegoede@redhat.com,
	markgross@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v2 5/5] platform/x86/intel-uncore-freq: Process read/write blocked feature status
Date: Thu, 30 Nov 2023 13:47:51 -0800
Message-Id: <20231130214751.3100418-6-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231130214751.3100418-1-srinivas.pandruvada@linux.intel.com>
References: <20231130214751.3100418-1-srinivas.pandruvada@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When a feature is read blocked, don't continue to read uncore information
and register with uncore core.

When the feature is write blocked, continue to offer read interface but
block setting uncore limits.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
v2
- Change read_blocked, write_blocked to bool

 .../uncore-frequency/uncore-frequency-tpmi.c      | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
index 4fb790552c47..bd75d61ff8a6 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
@@ -66,6 +66,7 @@ struct tpmi_uncore_struct {
 	int min_ratio;
 	struct tpmi_uncore_power_domain_info *pd_info;
 	struct tpmi_uncore_cluster_info root_cluster;
+	bool write_blocked;
 };
 
 #define UNCORE_GENMASK_MIN_RATIO	GENMASK_ULL(21, 15)
@@ -157,6 +158,9 @@ static int uncore_write_control_freq(struct uncore_data *data, unsigned int inpu
 	cluster_info = container_of(data, struct tpmi_uncore_cluster_info, uncore_data);
 	uncore_root = cluster_info->uncore_root;
 
+	if (uncore_root->write_blocked)
+		return -EPERM;
+
 	/* Update each cluster in a package */
 	if (cluster_info->root_domain) {
 		struct tpmi_uncore_struct *uncore_root = cluster_info->uncore_root;
@@ -233,11 +237,21 @@ static void remove_cluster_entries(struct tpmi_uncore_struct *tpmi_uncore)
 
 static int uncore_probe(struct auxiliary_device *auxdev, const struct auxiliary_device_id *id)
 {
+	bool read_blocked = 0, write_blocked = 0;
 	struct intel_tpmi_plat_info *plat_info;
 	struct tpmi_uncore_struct *tpmi_uncore;
 	int ret, i, pkg = 0;
 	int num_resources;
 
+	ret = tpmi_get_feature_status(auxdev, TPMI_ID_UNCORE, &read_blocked, &write_blocked);
+	if (ret)
+		dev_info(&auxdev->dev, "Can't read feature status: ignoring blocked status\n");
+
+	if (read_blocked) {
+		dev_info(&auxdev->dev, "Firmware has blocked reads, exiting\n");
+		return -ENODEV;
+	}
+
 	/* Get number of power domains, which is equal to number of resources */
 	num_resources = tpmi_get_resource_count(auxdev);
 	if (!num_resources)
@@ -266,6 +280,7 @@ static int uncore_probe(struct auxiliary_device *auxdev, const struct auxiliary_
 	}
 
 	tpmi_uncore->power_domain_count = num_resources;
+	tpmi_uncore->write_blocked = write_blocked;
 
 	/* Get the package ID from the TPMI core */
 	plat_info = tpmi_get_platform_data(auxdev);
-- 
2.41.0

