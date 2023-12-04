Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ltWg0URi"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E903CD5;
	Mon,  4 Dec 2023 14:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701728267; x=1733264267;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BQqr6Qiq+LU7qEGRJzXDgEFA8nx6ZpzNwnQjzicG5Lw=;
  b=ltWg0URif3DXDlQ92tAF/zWwMXe3ggj1U/JWJ80yloCcIgB5UsLIFy/q
   7eCTYgU5AnEb/iW/33uz+kKO3uy4vDvdC2Y4pOEjdzFIjDG4Ey8OEEOUt
   qyDfrFVftx4z55/TYVXjdZw9STpxhV8ixE3j+CwSlmDph7fEPl1TMBd9V
   QIDsOh2zo+KJTZbrehifibouWx6AZRJard0FKO97sHp65zK3oHzC4aq2O
   Ys0r6ng9/xq2qhjFTYnuxgudNdEDXD9p8JNlwLeWIuBoVnyr6DdH+jkqb
   UnYHibrIiyFvTzzKURDFKURRyWighVmy/MDJBTH1wHNGMxMq2sc9KkGHy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="480000875"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="480000875"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 14:17:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="764111953"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="764111953"
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
Subject: [PATCH v3 2/5] platform/x86/intel/tpmi: Modify external interface to get read/write state
Date: Mon,  4 Dec 2023 14:17:37 -0800
Message-Id: <20231204221740.3645130-3-srinivas.pandruvada@linux.intel.com>
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

Modify the external interface tpmi_get_feature_status() to get read
and write blocked instead of locked and disabled. Since auxiliary device
is not created when disabled, no use of returning disabled state. Also
locked state is not useful as feature driver can't use locked state
in a meaningful way.

Using read and write state, feature driver can decide which operations
to restrict for that feature.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
v3
- Rebased on top of /pdx86/platform-drivers-x86 review-hans
v2:
- Change read_blocked/write_blocked to bool *

 drivers/platform/x86/intel/tpmi.c | 8 ++++----
 include/linux/intel_tpmi.h        | 5 ++---
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/intel/tpmi.c b/drivers/platform/x86/intel/tpmi.c
index 09972e2b8a06..92c5c3a90d53 100644
--- a/drivers/platform/x86/intel/tpmi.c
+++ b/drivers/platform/x86/intel/tpmi.c
@@ -345,8 +345,8 @@ static int tpmi_read_feature_status(struct intel_tpmi_info *tpmi_info, int featu
 	return ret;
 }
 
-int tpmi_get_feature_status(struct auxiliary_device *auxdev, int feature_id,
-			    int *locked, int *disabled)
+int tpmi_get_feature_status(struct auxiliary_device *auxdev,
+			    int feature_id, bool *read_blocked, bool *write_blocked)
 {
 	struct intel_vsec_device *intel_vsec_dev = dev_to_ivdev(auxdev->dev.parent);
 	struct intel_tpmi_info *tpmi_info = auxiliary_get_drvdata(&intel_vsec_dev->auxdev);
@@ -357,8 +357,8 @@ int tpmi_get_feature_status(struct auxiliary_device *auxdev, int feature_id,
 	if (ret)
 		return ret;
 
-	*locked = feature_state.locked;
-	*disabled = !feature_state.enabled;
+	*read_blocked = feature_state.read_blocked;
+	*write_blocked = feature_state.write_blocked;
 
 	return 0;
 }
diff --git a/include/linux/intel_tpmi.h b/include/linux/intel_tpmi.h
index ee07393445f9..4f89c5bd8663 100644
--- a/include/linux/intel_tpmi.h
+++ b/include/linux/intel_tpmi.h
@@ -32,7 +32,6 @@ struct intel_tpmi_plat_info {
 struct intel_tpmi_plat_info *tpmi_get_platform_data(struct auxiliary_device *auxdev);
 struct resource *tpmi_get_resource_at_index(struct auxiliary_device *auxdev, int index);
 int tpmi_get_resource_count(struct auxiliary_device *auxdev);
-
-int tpmi_get_feature_status(struct auxiliary_device *auxdev, int feature_id, int *locked,
-			    int *disabled);
+int tpmi_get_feature_status(struct auxiliary_device *auxdev, int feature_id, bool *read_blocked,
+			    bool *write_blocked);
 #endif
-- 
2.40.1

