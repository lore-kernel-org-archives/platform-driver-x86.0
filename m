Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dX9tL3KO"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16A6610FC;
	Thu, 30 Nov 2023 13:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701380892; x=1732916892;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zOIRV6C6yfvlONwX2u1gSAyMm0UlCkV9/4g8gxQwRqo=;
  b=dX9tL3KO56lqPsWtJv27N/fN1AVj/dSkb5PFwMN3FYIDiwC9P8cdYZbH
   Cy5/InCOIZp+9Q79tOZ5ZiC1cZBiZEmKrb8XdyA3vGHBiCMeCSPl6CuIQ
   ubKDTw2Baw/NTjBadaCEKv9sHyKe7KQzT2uSslMjXe209Zi58Ue4HfZfB
   Z8N22+0Wc7khMMJtZLTCB3On4tS3Ru2qPbuf/hIJW3AO3do1f229WiQJ3
   8Pq2DBVVpWgvbmCBepmJ/AVGxyzRmG8qOxlhCQ/ox+D5zHoiLn9gb0ZHf
   J8ySqvXvZcM+gKEFxGs4oxhoevxuJtBuPSROOyi9RiVCwQXIVs1OFcHmi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="399950"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="399950"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 13:48:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="860334607"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="860334607"
Received: from spandruv-desk.jf.intel.com ([10.54.75.14])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Nov 2023 13:48:10 -0800
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hdegoede@redhat.com,
	markgross@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v2 3/5] platform/x86/intel/tpmi: Move TPMI ID definition
Date: Thu, 30 Nov 2023 13:47:49 -0800
Message-Id: <20231130214751.3100418-4-srinivas.pandruvada@linux.intel.com>
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

Move TPMI ID definitions to common include file. In this way other
feature drivers don't have to redefine.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
v2
- Aligned comments for TPMI IDs

 drivers/platform/x86/intel/tpmi.c | 13 -------------
 include/linux/intel_tpmi.h        | 13 +++++++++++++
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/intel/tpmi.c b/drivers/platform/x86/intel/tpmi.c
index ec64565baddc..7ea4cbf5b3a3 100644
--- a/drivers/platform/x86/intel/tpmi.c
+++ b/drivers/platform/x86/intel/tpmi.c
@@ -176,19 +176,6 @@ struct tpmi_feature_state {
 	u32 locked:1;
 } __packed;
 
-/*
- * List of supported TMPI IDs.
- * Some TMPI IDs are not used by Linux, so the numbers are not consecutive.
- */
-enum intel_tpmi_id {
-	TPMI_ID_RAPL = 0, /* Running Average Power Limit */
-	TPMI_ID_PEM = 1, /* Power and Perf excursion Monitor */
-	TPMI_ID_UNCORE = 2, /* Uncore Frequency Scaling */
-	TPMI_ID_SST = 5, /* Speed Select Technology */
-	TPMI_CONTROL_ID = 0x80, /* Special ID for getting feature status */
-	TPMI_INFO_ID = 0x81, /* Special ID for PCI BDF and Package ID information */
-};
-
 /*
  * The size from hardware is in u32 units. This size is from a trusted hardware,
  * but better to verify for pre silicon platforms. Set size to 0, when invalid.
diff --git a/include/linux/intel_tpmi.h b/include/linux/intel_tpmi.h
index 7dff3d96a200..612b6a215e81 100644
--- a/include/linux/intel_tpmi.h
+++ b/include/linux/intel_tpmi.h
@@ -12,6 +12,19 @@
 #define TPMI_MINOR_VERSION(val)	FIELD_GET(GENMASK(4, 0), val)
 #define TPMI_MAJOR_VERSION(val)	FIELD_GET(GENMASK(7, 5), val)
 
+/*
+ * List of supported TMPI IDs.
+ * Some TMPI IDs are not used by Linux, so the numbers are not consecutive.
+ */
+enum intel_tpmi_id {
+	TPMI_ID_RAPL = 0,	/* Running Average Power Limit */
+	TPMI_ID_PEM = 1,	/* Power and Perf excursion Monitor */
+	TPMI_ID_UNCORE = 2,	/* Uncore Frequency Scaling */
+	TPMI_ID_SST = 5,	/* Speed Select Technology */
+	TPMI_CONTROL_ID = 0x80,	/* Special ID for getting feature status */
+	TPMI_INFO_ID = 0x81,	/* Special ID for PCI BDF and Package ID information */
+};
+
 /**
  * struct intel_tpmi_plat_info - Platform information for a TPMI device instance
  * @cdie_mask:	Mask of all compute dies in the partition
-- 
2.41.0

