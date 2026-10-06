Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041C44A483F;
	Tue,  6 Oct 2026 18:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791311481; cv=none; b=eF8HpAjM5JAWIPcPH/w3ec5hq0K7eBPcQ6s84dAqHHQVfdOgxUmqnKCU/k6K8mXby1wzwYj6qO+jWyaxFqUBBxfz5GTd+UxBCRVipP07OEH7BWVTlSxt/VbnmSIa7bLo2ChFnieIRgUtPXPpLI2GOPTnBFKsHBauB3SOPjhY4Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791311481; c=relaxed/simple;
	bh=HTGLRto3nO6S/WMSAAmvf65ADeoe1675DVsbEayoP/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=saqev/PThwJCLBMyo1nLQneR+A8B2Iza8Ddy5FkbrCICok1krGhCtipM6wmrZwq/kMQcqlOm+Hqrq/KVphNjaAmCqMnJ0CM1nHyI1uB68UoAHQQR97CnKNMMytuPR9wUYfQHnXgxErMiR3MRm0UzOg9iqeQIdsOC8WLyb5Dh8kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=heIdP2Gj; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="heIdP2Gj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791311478; x=1822847478;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HTGLRto3nO6S/WMSAAmvf65ADeoe1675DVsbEayoP/4=;
  b=heIdP2Gj7aseN4QjCG5LlyvuDlKmbvC1tHmlzQhSJUGAnVNNU4VCpIUk
   RMAT74w8aMy9shF4wsXUGOSOrvHszc+/0nNjpvv8iFGYS33vpfLw+6TZn
   Mp39YrMFS5Ue1Xp3tXCJfXKWXgZEQuCc3Pp0Q44hbAr7AXgfrlhNrp5Nm
   sUyX3EQbhBN2EUe+OneLsC1AWBvtzhx1JL1fP0X4fq46cJ7TYuRCrn4gZ
   ZvKzD3APgXKKVruSzhJIwyyqnruwkItTyreP+3NvuCFwdA8+M0y25SQG0
   sFhhoshJUw2/Gp78Ktl0ukvR7L4QvPkZDKLkE4V1BrMITvXTnImxef1x8
   A==;
X-CSE-ConnectionGUID: ta0arhcVQ1y8yKltYOlYZQ==
X-CSE-MsgGUID: cy7AjFZ6SaeixruQqD27TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="102591622"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="102591622"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 11:30:57 -0700
X-CSE-ConnectionGUID: m+HGLWC7RTmxHHrIWB5+9w==
X-CSE-MsgGUID: OTlaFR+jQ1+DmpCZDoCjTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="303500288"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 11:30:57 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 15/20] platform/x86/intel/tpmi: Build the TPMI control words in one expression
Date: Tue,  6 Oct 2026 11:30:32 -0700
Message-ID: <20261006183037.1507007-16-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006183037.1507007-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20261006183037.1507007-1-sathyanarayanan.kuppuswamy@linux.intel.com>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
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

