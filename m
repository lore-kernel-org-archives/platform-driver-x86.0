Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FE14BD361;
	Thu, 24 Sep 2026 19:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790278450; cv=none; b=YZbnUG6CiaLzhpU7Lr9U9vgztL/vEsopswJanE/3824OKOsOKIxMRS4lUWIQymvCrNrFEfVb8EY798/etyCEevtp4V9BYjeAOXeDmH5ZjxbWbEnvAt3Hyysw/VfbDqIJT5fRfhT3WY0gpGVO5GiNG/0tOOnajpdTOg2/6jW7Feg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790278450; c=relaxed/simple;
	bh=fhBtsznCQq5t4ZccI8MCZLDbM/VwdqmZUl8PWm/bT0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eIXRFVWa5xo092K8AuQykkssvCeX1+C3o5vWZcG+41ywsIx/VnQk73QJ+6QWrSwN/h3WI4yWpMujfoQJ//v5c4KSl4o9yR2ApnW5HLdA57epb0wpstvFRvbCU8JQKuSZVLPYEZsAcHkRguFa6+flQRtWFo60YVWcTDOvpWFar7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LxmELkQB; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LxmELkQB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790278448; x=1821814448;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fhBtsznCQq5t4ZccI8MCZLDbM/VwdqmZUl8PWm/bT0s=;
  b=LxmELkQBEMXARJr9GkqWo7jeA6CPaP+TbeyCAAda7wE7pCogWKGDoC0D
   Bt1Otch3BdAmVy8eqaeyMX7f7cfYmIkZIRGFXOCwmJdIMJsAxQ5b0DQTZ
   OuqgbrpG0r8ggX5icaxmxjCOww7aPQcWxWy6BiqGPtchGaWFjAdM7Bv35
   4YX7hSSx+XZs9EIjIYYn9peXifO8A9ksyA4MWJCak5ua8QbHgKd2bazbs
   Wb+KqqiEHSVg1TJDstUoa/zut1W61TmYlQhXi3jU4C6y/dTgPybHEGccD
   9pcqLinxsJy+nxIJ689ojhrrfBk2aFJCnjumGBXRk2h7O7qe3qLLa3T9/
   A==;
X-CSE-ConnectionGUID: FmupYE+KRYSRPD4kZNzdxg==
X-CSE-MsgGUID: cekz03wkSoeoky8ARQBYmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="116591529"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="116591529"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 12:34:02 -0700
X-CSE-ConnectionGUID: 5GixzenzQkaWNXXhNiTwzw==
X-CSE-MsgGUID: fgS5nAGNSJKmH/wUNtHf4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="271960859"
Received: from b04f130c8410.jf.intel.com ([10.165.154.100])
  by orviesa006.jf.intel.com with ESMTP; 24 Sep 2026 12:34:01 -0700
From: Kristen Carlson Accardi <kristen.c.accardi@intel.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] platform/x86/intel: power-domains: Handle failed init in tpmi_get_power_domain_mask()
Date: Thu, 24 Sep 2026 12:36:25 -0700
Message-ID: <20260924193625.1830526-3-kristen.c.accardi@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924193625.1830526-1-kristen.c.accardi@intel.com>
References: <20260924193625.1830526-1-kristen.c.accardi@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tpmi_init() returns early on CPU models that are not in tpmi_cpu_ids,
before tpmi_power_domain_mask is allocated. When the driver is built
in, the exported tpmi_get_power_domain_mask() remains callable after
the failed init. It returns NULL then only because it indexes the NULL
array at offset 0 for the zeroed per-CPU data. If cpuhp_setup_state()
fails, the error path frees the array but leaves the pointer set, so
the helper would return a pointer into freed memory.

Nothing in the tree calls tpmi_get_power_domain_mask() today, so this
is hardening rather than a fix for a reachable bug. Return NULL when
the array was not allocated, and clear the pointer wherever it is
freed, as the previous patch does for domain_die_map.

Assisted-by: LLM
Signed-off-by: Kristen Carlson Accardi <kristen.c.accardi@intel.com>
---
 drivers/platform/x86/intel/tpmi_power_domains.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/intel/tpmi_power_domains.c b/drivers/platform/x86/intel/tpmi_power_domains.c
index ea51fc56297d..d89b9894c42a 100644
--- a/drivers/platform/x86/intel/tpmi_power_domains.c
+++ b/drivers/platform/x86/intel/tpmi_power_domains.c
@@ -139,6 +139,13 @@ cpumask_t *tpmi_get_power_domain_mask(int cpu_no)
 	cpumask_t *mask;
 	int index;
 
+	/*
+	 * When built in, this stays callable after tpmi_init() failed
+	 * before allocating the array.
+	 */
+	if (!tpmi_power_domain_mask)
+		return NULL;
+
 	if (cpu_no >= num_possible_cpus())
 		return NULL;
 
@@ -256,6 +263,7 @@ static int __init tpmi_init(void)
 
 free_domain_mask:
 	kfree(tpmi_power_domain_mask);
+	tpmi_power_domain_mask = NULL;
 
 	return ret;
 }
@@ -265,6 +273,7 @@ static void __exit tpmi_exit(void)
 {
 	cpuhp_remove_state(tpmi_hp_state);
 	kfree(tpmi_power_domain_mask);
+	tpmi_power_domain_mask = NULL;
 	kfree(domain_die_map);
 	domain_die_map = NULL;
 }
-- 
2.55.0

