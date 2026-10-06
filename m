Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A884A4845;
	Tue,  6 Oct 2026 18:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791311480; cv=none; b=meN+2OfAGzm7H35HFy4rlU5NDI24HDDCY52TlUnnDbjmC42mbkq5uia9ZCZff/f0yd7lAlKH7TMOSCEF66MCCSq71JH0rTxckjR34qQ/vvyHWNzY6hk7RkIe9JctEvARe8S6CdoNZKZT82loyiS6gCBB42/QrJcyencRPBiOfMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791311480; c=relaxed/simple;
	bh=yT6V2Li5yIQj9solRgGsVP/YWXiUoiFnzPSFblUPFxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E9VmH1ifmOlu5zA+zkyeImwgWQcGnnYougC5dZN3wJqwpyzsicDICg3VyFCHdsrZFP6weFoFp5wiika0LwTNTesbqqLqGWY7L7f9qfcuztWiIhSDbfs9UYb2mFAUPaXFcyl2/6Llu9wbrmzY3iVqdqTOZHJ+jWXfL7qngETk6ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FK9tRKvo; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FK9tRKvo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791311468; x=1822847468;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yT6V2Li5yIQj9solRgGsVP/YWXiUoiFnzPSFblUPFxs=;
  b=FK9tRKvoGaHSyt8PoSSLe8lKU9yeNTdxvFB19rbcmxQeImkElhwTVBBV
   FmMXQw1/MHY6Ni1eeKcBfE+MUFgi25Sm257ngV9ZhIsMK/XABRag+PjbU
   NJnCgEtug1g00rNTRsbgB4DJLQULEPAcJsrOfE5sUTXP1svhK91dqDoMf
   wrW9SyKIBUIpefJFa0zy2ug1SG0rIxXZpiKpWMA/aYJMRr0wQINRlbCy5
   R0OAVaKsAGmQJg1xDjHxm8KDLmcDZIlZpzV3dVJVvxs12teNxJ56IljqT
   qp9B8IqJ1dGLUmUzOdAFCpaEjj5igDWRoCHb5diHfgJRDACjx788bFOhw
   w==;
X-CSE-ConnectionGUID: ziRW1WWsQ2CPW4eyzYfJOg==
X-CSE-MsgGUID: V2JwaFOARkCnVgdpQ+DsCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="102591615"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="102591615"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 11:30:57 -0700
X-CSE-ConnectionGUID: yDmXKVEBSeWCdX5F7eaypg==
X-CSE-MsgGUID: T8eoldsNSoGdmgzew4XEog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="303500282"
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
Subject: [PATCH v4 13/20] platform/x86/intel/tpmi: Use guard() for tpmi_dev_lock in the status read
Date: Tue,  6 Oct 2026 11:30:30 -0700
Message-ID: <20261006183037.1507007-14-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006183037.1507007-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20261006183037.1507007-1-sathyanarayanan.kuppuswamy@linux.intel.com>
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

