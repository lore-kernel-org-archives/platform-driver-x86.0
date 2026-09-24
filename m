Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6868F4AD7E1;
	Thu, 24 Sep 2026 18:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790274252; cv=none; b=Ir5k6hcsoVXt1Bkevn7SgCIUhSCmfISqZmm7hIjtKvOwEy43ssfw9SZM2fzzD+jVjdEHnKqa5lm1tkj+iCpHCNTjNj9WVZFqZuYUF+Jf8dttZS7RwgnBAoGKDhlXscQbPdi79FmY00tVwR8P4Jja33+uDkdfk1bajaR1Rfxvkkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790274252; c=relaxed/simple;
	bh=GdQRUsWTefq+6QLvCZQIKDvBAvUOzHfWAI++XDMzxPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nUs0XLKuAUNR3J+9xN1uE/S1feXGCdrnUXymz36SZjT6iu8d+CInKS/ggp1vMMA391jrkQ+Fu6t37LnoHJ6Qun+NUeJx529/hx4tj0uyaDn4WvLPrEBUg/Dh0XawaRiWOkyOswinBa501Z9+NEgFQ22HuslgPv6PnN7QHdThh0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T7wLnX1v; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T7wLnX1v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790274251; x=1821810251;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GdQRUsWTefq+6QLvCZQIKDvBAvUOzHfWAI++XDMzxPE=;
  b=T7wLnX1v/0PYGw+zYPsNa4HfF9a2hgW3tqBIMXGenAVaho2adH0L6x4Q
   gxSXzZGHqDyEFxYIa140Ac6IuGhB4d/T/EFWU9lBt8RodUpOyV7P3DCQy
   YI+MGsf1CxcRYKhpaNX/9BTMIe7YrTjVorRmLSVmLdj8M5+t9RpxoW28P
   IAqUM+W2Nzd/PRqlZvskqHBBwIJNvtHeArG+imMC+8zcv9TeIu22aGZOL
   LEGDwFXycu8N6IYJT5YGMm+P4opUAucUNnLy5ZLcn/0XiuBp5ofF0SteW
   k32/eEeFziWLpIhWMUJTQI9MRFSxPg9bXBuYIPbW8PpCYrFJRfFwgp/Dp
   A==;
X-CSE-ConnectionGUID: J+WmWcj0RtKKaLOs2/EuJw==
X-CSE-MsgGUID: sei24a0lSpGhnYoilet2cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="91164288"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="91164288"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 11:23:45 -0700
X-CSE-ConnectionGUID: 2Cw9ex+kT7y47Bi7F/VBig==
X-CSE-MsgGUID: fc+wvKGhRdidc8Vi15xECQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="272229952"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 11:23:45 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 15/19] platform/x86/intel/tpmi: Build the TPMI control words in one expression
Date: Thu, 24 Sep 2026 11:23:37 -0700
Message-ID: <20260924182342.212709-16-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924182342.212709-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20260924182342.212709-1-sathyanarayanan.kuppuswamy@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both mailbox words in tpmi_read_feature_status() are assembled as an
assignment followed by an or-assign of a second field, even though
neither value is used in between. Build each of them in a single
expression, so that a word and the fields it is made of read as one
thing.

The two comments on the command word described one value between them, so
fold them together as well.

No functional change intended.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/platform/x86/intel/tpmi_common.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/intel/tpmi_common.c b/drivers/platform/x86/intel/tpmi_common.c
index 5332d30aac6c..a91938024d09 100644
--- a/drivers/platform/x86/intel/tpmi_common.c
+++ b/drivers/platform/x86/intel/tpmi_common.c
@@ -279,11 +279,12 @@ static int tpmi_read_feature_status(struct intel_tpmi_info *tpmi_info, int featu
 	if (ret)
 		return ret;
 
-	/* set command id to 0x10 for TPMI_GET_STATE */
-	data = FIELD_PREP(TMPI_CONTROL_DATA_CMD, TPMI_CONTROL_GET_STATE_CMD);
-
-	/* 32 bits for DATA offset and +8 for feature_id field */
-	data |= FIELD_PREP(TPMI_CONTROL_DATA_VAL_FEATURE, feature_id);
+	/*
+	 * Set command id to 0x10 for TPMI_GET_STATE, with the feature id 32
+	 * bits into the DATA offset, +8 for the feature_id field.
+	 */
+	data = FIELD_PREP(TMPI_CONTROL_DATA_CMD, TPMI_CONTROL_GET_STATE_CMD) |
+	       FIELD_PREP(TPMI_CONTROL_DATA_VAL_FEATURE, feature_id);
 
 	/* Write at command offset for qword access */
 	writeq(data, tpmi_info->tpmi_control_mem + TPMI_COMMAND_OFFSET);
@@ -294,8 +295,8 @@ static int tpmi_read_feature_status(struct intel_tpmi_info *tpmi_info, int featu
 		return ret;
 
 	/* Set Run Busy and packet length of 2 dwords */
-	control = TPMI_CONTROL_STATUS_RB;
-	control |= FIELD_PREP(TPMI_CONTROL_STATUS_LEN, TPMI_CMD_PKT_LEN);
+	control = TPMI_CONTROL_STATUS_RB |
+		  FIELD_PREP(TPMI_CONTROL_STATUS_LEN, TPMI_CMD_PKT_LEN);
 
 	/* Write at status offset for qword access */
 	writeq(control, tpmi_info->tpmi_control_mem + TPMI_CONTROL_STATUS_OFFSET);
-- 
2.43.0

