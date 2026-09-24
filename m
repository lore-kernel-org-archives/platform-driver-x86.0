Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060B24B66EF;
	Thu, 24 Sep 2026 19:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790278449; cv=none; b=cnhOxeFsAXuv0Yx+Osw+cgT4PHOWO/QuNThiATk8uNjJrcVgXLMxYTmT1fzuwSbcy5e14nE286dWjgPqLhFz06+o2IPjJ7+YZlfzY+USGTzSEqz0jwVRk3zmj/j9RjX4cOCvQoKmQ3gdEurJeYVU8+NydQMgSNHJ0/kGTCtvQSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790278449; c=relaxed/simple;
	bh=fOd13VFWTTe4uBRPYBYVJgym4WCNBms4d8T5r12NOlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pn4/hH6DgAJcNJcXim9lpvyYSn7GmTqAPPH4tmrmCdSwvbXc6nXykwH5A42A501BUIMBJW5WuvT+Zqh4BBfx5ONV9qTtFsYWhQKHAXO6DefZM71IOvxWS6M8Pc640qtqRfc6rVJWOp8AHzN5K2PqJ+n6t5Hie9TF8OsCDrKJxs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ie2fmobW; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ie2fmobW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790278447; x=1821814447;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fOd13VFWTTe4uBRPYBYVJgym4WCNBms4d8T5r12NOlQ=;
  b=ie2fmobWCGXiw/PEycC1R8esyPS2K5JOff0/Z6V/g6/ZR+V7hGtzvQ5r
   WRt9uLUT1ZOLG/giAOGLmPHMPaEZ+aaBuiWLPoTT4QaxzMj1KrhdyrVqk
   9vQudlc5Q6sOtAKHLvalALbT8xhEM0xfduf6N0aWkHT9cPxSBs+c//uKA
   fLk9Esxc0WYnJJjX2PPbb901okFF8z8N4JLjzdxOb113HnliT12gzfyqd
   x5fq0nIu4m8ji2DPMyNFXfqrojk+uUa1ooZrUruIFWYBKHrrNk4MacGMZ
   kd7SBxFL2bksAC5BdYw1wN5FAGy5EizW7M9Ieu1x6gXKiRYbuagw8bEKD
   A==;
X-CSE-ConnectionGUID: 6E3dKQAoR5SHe78rGXOrSQ==
X-CSE-MsgGUID: Uad6FdF/QKmqlt4BQoXlpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="116591527"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="116591527"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 12:34:02 -0700
X-CSE-ConnectionGUID: DY4Zql+GSNedMs4zZiqOKA==
X-CSE-MsgGUID: ducPiAFNShmnchc+Yoh0Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="271960857"
Received: from b04f130c8410.jf.intel.com ([10.165.154.100])
  by orviesa006.jf.intel.com with ESMTP; 24 Sep 2026 12:34:01 -0700
From: Kristen Carlson Accardi <kristen.c.accardi@intel.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] platform/x86/intel: power-domains: Handle failed init in tpmi_get_linux_die_id()
Date: Thu, 24 Sep 2026 12:36:24 -0700
Message-ID: <20260924193625.1830526-2-kristen.c.accardi@intel.com>
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

tpmi_init() returns early with -ENODEV on CPU models that are not in
tpmi_cpu_ids, before domain_die_map is allocated. When the driver is
built in, tpmi_get_linux_die_id() remains callable after the failed
init and dereferences the NULL domain_die_map.

This is reachable from user space: uncore-frequency-tpmi calls
tpmi_get_linux_die_id() from the show function of the world-readable
die_id sysfs attribute. The attribute is created on multi-die packages
for clusters with the core agent type, so reading it on such a CPU
that is missing from tpmi_cpu_ids oopses.

Likewise, if cpuhp_setup_state() fails, the error path frees
domain_die_map but leaves the pointer set, so a later call would read
freed memory.

Return -ENODEV when the map was not allocated, and clear the pointer
wherever it is freed.

tpmi_get_linux_cpu_number(), tpmi_get_punit_core_number() and
tpmi_get_power_domain_id() read only the static per-CPU data and hash
table, so they are safe after a failed init. tpmi_get_power_domain_mask()
has the same problem as this helper but no callers, so it is handled
separately.

Fixes: e37be5d85c60 ("platform/x86/intel: power-domains: Add interface to get Linux die ID")
Assisted-by: LLM
Signed-off-by: Kristen Carlson Accardi <kristen.c.accardi@intel.com>
---
 drivers/platform/x86/intel/tpmi_power_domains.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/intel/tpmi_power_domains.c b/drivers/platform/x86/intel/tpmi_power_domains.c
index 833052dc34d2..ea51fc56297d 100644
--- a/drivers/platform/x86/intel/tpmi_power_domains.c
+++ b/drivers/platform/x86/intel/tpmi_power_domains.c
@@ -156,6 +156,13 @@ EXPORT_SYMBOL_NS_GPL(tpmi_get_power_domain_mask, "INTEL_TPMI_POWER_DOMAIN");
 
 int tpmi_get_linux_die_id(int pkg_id, int domain_id)
 {
+	/*
+	 * When built in, this stays callable after tpmi_init() failed
+	 * before allocating the map.
+	 */
+	if (!domain_die_map)
+		return -ENODEV;
+
 	if (pkg_id >= topology_max_packages() || domain_id >= MAX_POWER_DOMAINS)
 		return -EINVAL;
 
@@ -245,6 +252,7 @@ static int __init tpmi_init(void)
 
 free_domain_map:
 	kfree(domain_die_map);
+	domain_die_map = NULL;
 
 free_domain_mask:
 	kfree(tpmi_power_domain_mask);
@@ -258,6 +266,7 @@ static void __exit tpmi_exit(void)
 	cpuhp_remove_state(tpmi_hp_state);
 	kfree(tpmi_power_domain_mask);
 	kfree(domain_die_map);
+	domain_die_map = NULL;
 }
 module_exit(tpmi_exit)
 
-- 
2.55.0

