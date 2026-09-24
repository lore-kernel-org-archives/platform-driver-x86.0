Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B174BD7B6;
	Thu, 24 Sep 2026 18:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790274255; cv=none; b=iC8L7Pex+1+t7f4q4khP9j5d7GGyVFWm9y3F44nc16xx7MmZq44f7PHGXXfHPtAfAYJC6RsuMNwc4V78WfORFXGiMGjVX3XCAEuWMiaJTzMtkbdw67ZE3Z27VT0xYNiwaSypSsFgLgZTmX2WqASxsu3jStVyaZSa90oODFHgkW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790274255; c=relaxed/simple;
	bh=bNIkW65ZfVn58YW1HWsKmm6NZdc84pyK4ipCYZmHuNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lcBN5gk7bU1w1TQQtr3jrN5DbGXzQneCXKYfwXze1xta/TKNPyISpCbWEHXy7pKz1pHMn35KZ7gLR08kdJiOyZgqJHXcfj8xZdpqLxcHow+ocwQpDF+80E+JCwvSmKR3EtfJXuvf87H3HJA+IAmJsqzQtt8Cx+M7jfxthehgC4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gvvb5cVW; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gvvb5cVW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790274253; x=1821810253;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bNIkW65ZfVn58YW1HWsKmm6NZdc84pyK4ipCYZmHuNA=;
  b=gvvb5cVWDz8KFL6Ou20lVF3mY4nZVHgTa+KRI1V+HjOMpzWBqKVZeMua
   YwVQMvRXfFZeFFvQFJlUb4HfjqwoWNMo61fwWfssI1IrUsmxWxRsqZgDr
   /0yDUYC8zpP8+ufxUf4cSoE7K2RH2wrpaefoOa+fGSGF99LqZ4w+9bb9M
   lKcPjqfxiDyy5uSvYmqr1COOCeVoZdekf9x1Mn7WIUj9Nl1byovO1Fsyf
   axXSix+6Ha6HfwxxdnVZYfcw/LgXmZIvh8IXMl6pEdvUyv7xTpDzOkmee
   PacEAlO2HtuhcjAogalfW/m1tr9Y2eKDPGI7dncm1wg7PEg9LUEvtcvzW
   g==;
X-CSE-ConnectionGUID: yR1JZAy9R/aZxrVUQ3vRPQ==
X-CSE-MsgGUID: QebovquEQ+aIXs0XLgqWBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="91164283"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="91164283"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 11:23:45 -0700
X-CSE-ConnectionGUID: S6PN+3G3QPqKggYPE62nDg==
X-CSE-MsgGUID: 0PKM4tJWRW6NXTVXow6utg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="272229946"
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
Subject: [PATCH v2 13/19] platform/x86/intel/tpmi: Use guard() for tpmi_dev_lock in the status read
Date: Thu, 24 Sep 2026 11:23:35 -0700
Message-ID: <20260924182342.212709-14-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924182342.212709-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20260924182342.212709-1-sathyanarayanan.kuppuswamy@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

tpmi_read_feature_status() takes tpmi_dev_lock explicitly and unwinds
through an err_unlock label, which is what forced the two error paths
before the mailbox command is issued to be gotos rather than returns.

Take the mutex with guard() and return directly from those two paths.

The done_proc label stays, because the paths that reach it have already
handed the mailbox to the hardware and still owe it the CPL write before
dropping the lock. That is unchanged: the two early failures never wrote
CPL before either.

No functional change intended.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/platform/x86/intel/tpmi_common.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/intel/tpmi_common.c b/drivers/platform/x86/intel/tpmi_common.c
index 7f6cd0fb23d7..00f27ac0a753 100644
--- a/drivers/platform/x86/intel/tpmi_common.c
+++ b/drivers/platform/x86/intel/tpmi_common.c
@@ -272,12 +272,12 @@ static int tpmi_read_feature_status(struct intel_tpmi_info *tpmi_info, int featu
 	if (!tpmi_info->tpmi_control_mem)
 		return -EFAULT;
 
-	mutex_lock(&tpmi_dev_lock);
+	guard(mutex)(&tpmi_dev_lock);
 
 	/* Wait for owner bit set to 0 (none) */
 	ret = tpmi_wait_for_owner(tpmi_info, TPMI_OWNER_NONE);
 	if (ret)
-		goto err_unlock;
+		return ret;
 
 	/* set command id to 0x10 for TPMI_GET_STATE */
 	data = FIELD_PREP(TMPI_CONTROL_DATA_CMD, TPMI_CONTROL_GET_STATE_CMD);
@@ -291,7 +291,7 @@ static int tpmi_read_feature_status(struct intel_tpmi_info *tpmi_info, int featu
 	/* Wait for owner bit set to in-band */
 	ret = tpmi_wait_for_owner(tpmi_info, TPMI_OWNER_IN_BAND);
 	if (ret)
-		goto err_unlock;
+		return ret;
 
 	/* Set Run Busy and packet length of 2 dwords */
 	control = TPMI_CONTROL_STATUS_RB;
@@ -323,9 +323,6 @@ static int tpmi_read_feature_status(struct intel_tpmi_info *tpmi_info, int featu
 	/* Set CPL "completion" bit */
 	writeq(TPMI_CONTROL_STATUS_CPL, tpmi_info->tpmi_control_mem + TPMI_CONTROL_STATUS_OFFSET);
 
-err_unlock:
-	mutex_unlock(&tpmi_dev_lock);
-
 	return ret;
 }
 
-- 
2.43.0

