Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083375208A9;
	Wed, 30 Sep 2026 17:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789389; cv=none; b=pkMODAvCaktIutpy2MamJnCXUz4iOK1P0o6x5aQIC67BXkmlMkCISkDQOXlH4BTBm9C0rDAo166KYLJ7pJ40HzBCiWAyIPQ1q/0ImsnsXmPSCYnc42DB1172N7pJZ3gHePxIJodf4YJmEQEVKSqY3kREFeOAwP2C+39x5QIMM78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789389; c=relaxed/simple;
	bh=a3+/FEKCkqtYjrcy2pJ7QwvFGw3RJ2DGOnScz6FFgsM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gJvNhOGxO4Zq/ofIpHS5WlEWSkF4St+cyfksR6OsZGkIwBOwQXNN/f+DOgqY1kbKqbAWQ+AO6IJ+f7avCQv04FDmcvkELNIwSetKCzwC0N6Yay6YBSKP9rLNePPIpDVGZWDjU80XzklLZ3LftmT15i/l57oVucYIi35jpx52mPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iiR1+gIB; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iiR1+gIB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790789388; x=1822325388;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=a3+/FEKCkqtYjrcy2pJ7QwvFGw3RJ2DGOnScz6FFgsM=;
  b=iiR1+gIBi/56B5H9k8szYmm/hsghbz55p7DLI5cWUNc4kZ5Q9neEaMrf
   TxpOTeGKW2MRvGQExBilsYfpGGZxGL6Pj6CejJ9LTgfPyQX5T/plMjkqG
   NqZOIj3X6zZVYXiXR9r63n9juZc8IizexoZelcZGyrr9LJhJ/IxUqTOMd
   UV6PCHAazOkfIQ/DHRQuQXoHG9ydQZ7kBXB95jWnzz2BgS8S//uGmlsvi
   GKCmJUebLtmxJTIU+aHbUf2jG51QzXr+k8ya9oxdx8HhItp+hIGBDPGtS
   oHwENAoz2zEDcVXqJcHQO54JKjcX1pW96zONFr3zzTlrBlMCXaQ0nL3it
   w==;
X-CSE-ConnectionGUID: QfB1cKWaS7Cdv8H7KTnt2A==
X-CSE-MsgGUID: OGkctriYQDaHZOtnCiREiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91632084"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="91632084"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 10:29:35 -0700
X-CSE-ConnectionGUID: dKIgnIIfQVWWS9LxubqFHQ==
X-CSE-MsgGUID: dI/NyJQ4RDK/lDYrmDUJrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="278959432"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 10:29:35 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 15/20] platform/x86/intel/tpmi: Build the TPMI control words in one expression
Date: Wed, 30 Sep 2026 10:29:12 -0700
Message-ID: <20260930172918.743656-16-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930172918.743656-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20260930172918.743656-1-sathyanarayanan.kuppuswamy@linux.intel.com>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
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

