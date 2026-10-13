Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6BF5448BE;
	Tue, 13 Oct 2026 19:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919816; cv=none; b=nO5ULmwJPykQr4Y7J+CPTqB33VR/+WpwR9cgt1YUGSDZLiEB0AP8Co1gdlxkDZDv3zhAfDX/F1HuDleigB0FvggD5DC4QK1AuB3lDGf+WVvhhliKpGIG+oqdp4dzJ2ZH5TiJt0oUdnnB0e5FViN8YJqQwsLG1SpcIcPplOef0bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919816; c=relaxed/simple;
	bh=s0UXAW1jglOMQ0ACum63m+uMDYIGQktW+Os4ylk8wug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KsLl0dpJMuuQxVPq0Q0LikBMCKfYIrwh4AFpDRWimir5i92NdpUHaQOHqeebuJw4ogTdHwdyzQ7ybqjmyLvyH0n0bFh0Bx4smHCBR58CLtCSxV51Fdbv24ITOTPAJ3qfAWyqS+5Hl17J7Ew621APx2wjYF8P0/AyKmuLdlWPbL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EBjStNx7; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EBjStNx7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791919814; x=1823455814;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s0UXAW1jglOMQ0ACum63m+uMDYIGQktW+Os4ylk8wug=;
  b=EBjStNx7wGZ7A4XrSl5HirNj/Ifb//c6qkdlzSe9pMbCOTPrSR6dWM7e
   Zl5Q57vDrUjKWzKQAOgrItSezTVE9YBc5Ty7K9D3RgBykOpX5uJeqWLq6
   Ly/cY/mLve1WywFjanrWPn0RpkEifjp6Os8ae51DSpQgEcUCyfQju2TOu
   oUkqoXPMY7M79abJTYUEIGSDedt3zLKTwfEt8kD2yXXdQBpcKVullRn6+
   Mq+qs+Z9xejSz4i42uJI58qbr6v1uzdJshUvFy1SwWnMB0eonsrqAGGh0
   ryhZNjKys7l1aMcCoH73fUwh6wI83mQIU17F+K7d5+/eapombhAszovRg
   A==;
X-CSE-ConnectionGUID: FNeH6jgIRuC9GjB8jZWGPg==
X-CSE-MsgGUID: J9NIXVqzQsCvFzdb0GR0uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="544143"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="544143"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 12:29:49 -0700
X-CSE-ConnectionGUID: V7WcJTXdSaCrAXN8Cmy9bA==
X-CSE-MsgGUID: X5M6rF0wTCqZamlZgUOQhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1167717"
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
Subject: [PATCH v5 18/20] platform/x86/intel/tpmi: Use DEFINE_RES_MEM() for the feature resources
Date: Tue, 13 Oct 2026 12:29:33 -0700
Message-ID: <20261013192935.2243291-19-sathyanarayanan.kuppuswamy@linux.intel.com>
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

tpmi_create_device() fills in each feature resource field by field,
deriving the end from the start and setting IORESOURCE_MEM by hand.
That is what DEFINE_RES_MEM() exists for, so use it.

The resources come from kzalloc_flex(), so the fields the macro sets
that the open coded version left alone, name and desc, were already
zero.

No functional change intended.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/platform/x86/intel/tpmi_common.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/tpmi_common.c b/drivers/platform/x86/intel/tpmi_common.c
index 097754365897..91d8083fecc0 100644
--- a/drivers/platform/x86/intel/tpmi_common.c
+++ b/drivers/platform/x86/intel/tpmi_common.c
@@ -583,9 +583,7 @@ static int tpmi_create_device(struct intel_tpmi_info *tpmi_info,
 	for (i = 0, tmp = res; i < pfs->pfs_header.num_entries; i++, tmp++) {
 		u64 entry_size_bytes = pfs->pfs_header.entry_size * sizeof(u32);
 
-		tmp->start = pfs->vsec_offset + entry_size_bytes * i;
-		tmp->end = tmp->start + entry_size_bytes - 1;
-		tmp->flags = IORESOURCE_MEM;
+		*tmp = DEFINE_RES_MEM(pfs->vsec_offset + entry_size_bytes * i, entry_size_bytes);
 	}
 
 	feature_vsec_dev->dev = tpmi_info->parent;
-- 
2.43.0

