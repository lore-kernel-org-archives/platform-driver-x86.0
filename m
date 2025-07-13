Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07576280318
	for <platform-driver-x86@vger.kernel.org>; Sun, 13 Jul 2025 17:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752427813; cv=none; b=tfJn44agP8PXgSPEi2rsKG+FPo5Ava5x9NkpUv4ypOvINNEI4TGG806EoGwjVUy/ayxVMu4UlgEKYwh8AzubG5nHnmMcj2arOA8fl4d2yyZ9+tMsKIrfcoRUVU4DyEArYIMtUzHpgUu9halNnwrNnGhQzb5yR0aExb7u6B203cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752427813; c=relaxed/simple;
	bh=D9Zul45yjXKzwokdO1jUDxBZAEv2+NuRjL3Kzqe+gm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RN7CypcFMomXl6IYnVDIDbXtS5dREtg/m+3umnWXYYTSVsVXDGV53n+38WtGyn/wbHDZMv0ZGawQA9kqKm44QXOQi40LmoJhlv4vW6K5RKfsynHyD+jlVVBvSh2d2VtfuYInadgCwdcmoZ68IOiqbNOK1qJSA6thpS49GoyfrYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nzPuqvlh; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nzPuqvlh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752427812; x=1783963812;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D9Zul45yjXKzwokdO1jUDxBZAEv2+NuRjL3Kzqe+gm0=;
  b=nzPuqvlheeef6kb23+3qNTLhpw7FqM8SDK/De+TM4Mc407XG0DL+nVBB
   W382zqhSXf/h4tu8rLi9ksIe8qufdbUky0wIZ42Pw2Fbrb6FCe3D/7pqh
   710f4ngVTvxJ56xUdb8OF5In2USb1G6s12W5Ayq3cczLm5uUpErJ0rOKW
   kxWh+NiHFMLBtugXOHB1daKBHJmgwNoYM1eGgdUyGQFhExVjhaaYFupYz
   6lpEYn6IHuk9zpwy44bT1UJxeJnVpFO68wFu3/Li7W0PjitP8kwV4bQXe
   3i/kJ/Ca/ZfU2anv3+9bw1SSu3pTBCSULLNJbs/5eCbOYzV5eR6dRuMO3
   A==;
X-CSE-ConnectionGUID: iOXGjJj3TKij0DKgY+pusQ==
X-CSE-MsgGUID: kx+0tJlzSDSMFwpiwMV+SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65334148"
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="65334148"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 10:30:12 -0700
X-CSE-ConnectionGUID: 8FePctO4Q2SRD6vEi/qzkw==
X-CSE-MsgGUID: hG7QBuw+To+/liJO5S34uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="161069333"
Received: from mgoodin-mobl3.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.223.19])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 10:30:10 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com,
	thomas.hellstrom@linux.intel.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	david.e.box@linux.intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH v8 08/13] platform/x86/intel/pmt: correct types
Date: Sun, 13 Jul 2025 13:29:38 -0400
Message-ID: <20250713172943.7335-9-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250713172943.7335-1-michael.j.ruhl@intel.com>
References: <20250713172943.7335-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A couple of auto variables do not match the return types of some of
the functions.

Update the mismatched types to match.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: David E. Box <david.e.box@linux.intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index 440d2045e90d..881f4abdae14 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -138,7 +138,7 @@ static ssize_t
 enable_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct intel_pmt_entry *entry = dev_get_drvdata(dev);
-	int enabled = !pmt_crashlog_disabled(entry);
+	bool enabled = !pmt_crashlog_disabled(entry);
 
 	return sprintf(buf, "%d\n", enabled);
 }
@@ -169,7 +169,7 @@ static ssize_t
 trigger_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct intel_pmt_entry *entry;
-	int trigger;
+	bool trigger;
 
 	entry = dev_get_drvdata(dev);
 	trigger = pmt_crashlog_complete(entry);
-- 
2.50.0

