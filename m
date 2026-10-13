Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDA454488E;
	Tue, 13 Oct 2026 19:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919814; cv=none; b=ht5LuzgDw9Yx0I+zpday1X1KQDaZdSgEOumHOFz6HIPAoui/tZpKs7BYEqhhZ/sGWiBG57Mu2SxZpUjdBEsEEqvj5vinJoNwdY5U+dFdq3Fqpg/Xv/S7VNH4Hq4Tsvyl2KB+n5mFpMCTzYfAeGe2DRcenjPwg0hufSd50tKDuJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919814; c=relaxed/simple;
	bh=HTGLRto3nO6S/WMSAAmvf65ADeoe1675DVsbEayoP/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xs+gNMu0ediB7azi/X7DkhZg0Atg2yc1WzJduGUNurtCdTYFRsjOTQffkDQZpJjf4Q0nGtAR+wQ+RSEckCV8fEGyx96DlCj9Vwvr6HJBjhrUwASHton630EHD5e9AEQ50Bs9KPBA61UxRMR/BPd1v2AVAhYbuF1KrUG6Y9Tu8Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W+IgrKlX; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W+IgrKlX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791919812; x=1823455812;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HTGLRto3nO6S/WMSAAmvf65ADeoe1675DVsbEayoP/4=;
  b=W+IgrKlXO53+jgXIhSiUFqIFynaDbJCnkbgq9x9Ud+S4JinuZkbOUfXW
   gpqyA6F6lnzjvgFzTbBMg0KkrbOpB7XsDp0K0mcOt2kmPYnhNygPSIsQw
   /QUeacbDql0+vj28gCYali2jyurG3LiyuKvg23MfFWVccpDTDjGXnKDoS
   s+CP9LvTrbMqb28BZKHzuxGaoxzy3tUf2ZsgxTtfmTRi+Oit5gGIBHstq
   mETN3Mbw98Gsh+5fDN1Ka0mYKMOgD2UnPzf6dSCApvWsAa2GyzfRLnkVX
   ftAMf0Vb0CzxiF0dG722NwoszHJiO29W7T5aoC10qOEsd9hOJTLTP7Yp8
   Q==;
X-CSE-ConnectionGUID: 2+gyQxvPR6+/2H3PkRbJYg==
X-CSE-MsgGUID: SnBdbGl+TMWmk0aq6h8png==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="544137"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="544137"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 12:29:49 -0700
X-CSE-ConnectionGUID: Dicckkc6RRmWMPMjGk6j+Q==
X-CSE-MsgGUID: d+TSQ/T+Q/G1S9MJTqSJ4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1167706"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 12:29:49 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 15/20] platform/x86/intel/tpmi: Build the TPMI control words in one expression
Date: Tue, 13 Oct 2026 12:29:30 -0700
Message-ID: <20261013192935.2243291-16-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013192935.2243291-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20261013192935.2243291-1-sathyanarayanan.kuppuswamy@linux.intel.com>
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

