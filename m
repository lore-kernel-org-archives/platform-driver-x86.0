Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096875437CC;
	Tue, 13 Oct 2026 19:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919811; cv=none; b=dPmfcT6Bw1jjOejtAEQRtBUYUlxGGElKexnItZ8WO9yMSOtgSjPUjPCZQAom3z4jHlAGr9pg4p8NDxkABqu2Mdda+gs1RD1O/C6uOd1qzmhxPSl0BJwwdpC7bctFruce2ZBbI9kLdOAIpTGNQhgSViQQfUiv9MFMmVCWQWckrns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919811; c=relaxed/simple;
	bh=yT6V2Li5yIQj9solRgGsVP/YWXiUoiFnzPSFblUPFxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AE6cWeHcgW0si1THx97HUuFCqRuSPZjMYoz8toRJx9aOcWoj0iL8IwyROaabwJRweP/26DzNTBzPXnOvbjON8AOAgqxu91ZqN0CeW1e5yrLtWKeVvHA85dGc6AOa6VcpkacL65GmMe+77LtAUHYL1cHXloHQxALOPpqtilros0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hO8wl1VS; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hO8wl1VS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791919810; x=1823455810;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yT6V2Li5yIQj9solRgGsVP/YWXiUoiFnzPSFblUPFxs=;
  b=hO8wl1VSIx3GbkwTeIXzGlLG/DHWTOKQlAme0kZmYRxVewXIey4dWxV+
   DxCUhgF4CdfZh8ZsNp2qo7ZC0wgBYKhhCkA7zk3XkooJB8u4sJ77y4QI6
   Sa1yi2RaSHannvbIhSxySQ8gKMhvRA12sPsIqsZJ3jQD3UD3RPk6ZvmKd
   /PgSz+T0APJgo3RTWLpIRPu33nDI/+gyqtr2ph6i1csvPMV6Ks0ZS8wBn
   xm6MnIhCP+jPN2YUmF+TlRNhjuLM5Wg8LCWAAKwiKAURir2qUae9AVxRo
   pfo5TX84Kn84f3O/DdMdAtsoTYUU7HG1ewwdwixTC9W1xa5+b7V9wc7U8
   g==;
X-CSE-ConnectionGUID: yDDLdQERTIywX+ST0I56xQ==
X-CSE-MsgGUID: xbJNjCV7TruPg/YM6EkCYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="544133"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="544133"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 12:29:49 -0700
X-CSE-ConnectionGUID: 7zjHRiMvSfaCFpEpw77EUA==
X-CSE-MsgGUID: TPCGtpGFRnmaUDa4U2eIiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1167698"
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
Subject: [PATCH v5 13/20] platform/x86/intel/tpmi: Use guard() for tpmi_dev_lock in the status read
Date: Tue, 13 Oct 2026 12:29:28 -0700
Message-ID: <20261013192935.2243291-14-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013192935.2243291-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20261013192935.2243291-1-sathyanarayanan.kuppuswamy@linux.intel.com>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
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

