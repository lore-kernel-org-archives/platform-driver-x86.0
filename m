Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5F6521232;
	Wed, 30 Sep 2026 17:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789391; cv=none; b=Bup0UDYHVOCB74IRUtmTi3Vk+ytJm+zQxcolDxtnt9GX9p9XxJnGRXJ9JUr6imufNjyW1LDaRjWMLkTLtjgWWj0JNdCHKe1LeaNo4cgOt+CtQVQIqidFEZ9aYpWHF0PMlm3xkA3OglU0/KUUalGk0bGc1bTbIkgW2ZsndsxtPQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789391; c=relaxed/simple;
	bh=CgKPy20w/SqJcq9KYdCEbnbtwycLYdSNFZmZA6Iggig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BK0qJPA1x03fKM8M8u3LHxIztpkUD5/+P0J7fCrzWP9os9yi1WTMrLjBvny7r8/jkrionpqCdR/0c1+XaefpHiC7pQfQFfpj1NGJkBxF5CIWGDeLxUWK/+In9mLWJG02gJSLsZi7SYsozcEieWXpttz/PLjrcEViSzgoRPWR/X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kIjBHnHO; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kIjBHnHO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790789391; x=1822325391;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CgKPy20w/SqJcq9KYdCEbnbtwycLYdSNFZmZA6Iggig=;
  b=kIjBHnHOH1neRqpWaHOShAeT6O7wM8iEBSzv6FHmzfWFPav+ywTsfepI
   L0KT6+nnJj2e57RAlrKZ1wciufwbT5RihUpfv7mg0rLYNYkc+GJaMGmeQ
   Ljksvszqv1fl8ytWlpdSp2FOvFo1VeYxmlx+F98iAYVz1kzS34RN2HuoN
   MVLGV+xPedPuBvTorcYkqMUZRt2mQTjpzsQPX/VEqfdZ5Us8pKx6nI4fQ
   fQxrHbvZrl9yLS/sSSoqXmm6tZIxtYyGSzN+bMEPKcS2UUaNeXBKgMJlV
   Dx+YCDh6poT86zP255c1xGImvwAC20mIdhkVg8UtHt5n1fja7xwqTkI+L
   g==;
X-CSE-ConnectionGUID: NuiRg8KSRHyuT19xwU4mIg==
X-CSE-MsgGUID: qC/zHL/hQ86zE3fb5rX0Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91632078"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="91632078"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 10:29:35 -0700
X-CSE-ConnectionGUID: 9BJUSRzLTTGQE/ZyBGfNrA==
X-CSE-MsgGUID: bsuxKx/cQaSTxwQm9dZDrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="278959426"
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
Subject: [PATCH v3 13/20] platform/x86/intel/tpmi: Use guard() for tpmi_dev_lock in the status read
Date: Wed, 30 Sep 2026 10:29:10 -0700
Message-ID: <20260930172918.743656-14-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930172918.743656-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20260930172918.743656-1-sathyanarayanan.kuppuswamy@linux.intel.com>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
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

