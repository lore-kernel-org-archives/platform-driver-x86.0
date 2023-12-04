Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WKrda9UV"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D655BCD;
	Mon,  4 Dec 2023 14:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701728267; x=1733264267;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=f6TRJ2hJT6nfibR7M6U1wk9xS01PL6yH67o2Q+4zI2M=;
  b=WKrda9UVaikyt4MWmUvS4scghsyEz/QE29g3kXOef/nIZIUgSy3XatzS
   XjBNQ8ACVPUAvF/0Cvgbg3idswf/bSHrfjIRg15wm71sZ1+12EPjiEFey
   wtjlaF8qyUaY2ltdoyQDJL2sjokmypmzZ7lC9t5J9OvpVIc3XOkCuQJ5g
   q9Uw0rvf5enYJH2weUTSPsEhO2xTG2nZnmhXhtCt+WCD2s5Ix3fimdgKO
   AG1tQ8ZHOxqNYHgIgxFt7zzlNmN8GH1AP0AoJjIlC6lQdFIoC7mxA4y4s
   I2WBgF4XEaO2RwFoY3WDJ/XOt1ytLduzOPiVkzfz6IIlDhv2wVlPmeH9p
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="480000872"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="480000872"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 14:17:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="764111952"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="764111952"
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
Subject: [PATCH v3 1/5] platform/x86/intel/tpmi: Don't create devices for disabled features
Date: Mon,  4 Dec 2023 14:17:36 -0800
Message-Id: <20231204221740.3645130-2-srinivas.pandruvada@linux.intel.com>
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

If some TPMI features are disabled, don't create auxiliary devices. In
this way feature drivers will not load.

While creating auxiliary devices, call tpmi_read_feature_status() to
check feature state and return if the feature is disabled without
creating a device.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
v3
- Rebased on top of /pdx86/platform-drivers-x86 review-hans

v2
- Add comment for returning -EOPNOTSUPP

 drivers/platform/x86/intel/tpmi.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/tpmi.c b/drivers/platform/x86/intel/tpmi.c
index 311abcac894a..09972e2b8a06 100644
--- a/drivers/platform/x86/intel/tpmi.c
+++ b/drivers/platform/x86/intel/tpmi.c
@@ -598,9 +598,21 @@ static int tpmi_create_device(struct intel_tpmi_info *tpmi_info,
 	struct intel_vsec_device *vsec_dev = tpmi_info->vsec_dev;
 	char feature_id_name[TPMI_FEATURE_NAME_LEN];
 	struct intel_vsec_device *feature_vsec_dev;
+	struct tpmi_feature_state feature_state;
 	struct resource *res, *tmp;
 	const char *name;
-	int i;
+	int i, ret;
+
+	ret = tpmi_read_feature_status(tpmi_info, pfs->pfs_header.tpmi_id, &feature_state);
+	if (ret)
+		return ret;
+
+	/*
+	 * If not enabled, continue to look at other features in the PFS, so return -EOPNOTSUPP.
+	 * This will not cause failure of loading of this driver.
+	 */
+	if (!feature_state.enabled)
+		return -EOPNOTSUPP;
 
 	name = intel_tpmi_name(pfs->pfs_header.tpmi_id);
 	if (!name)
-- 
2.40.1

