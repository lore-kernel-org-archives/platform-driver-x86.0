Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB5449651;
	Tue, 20 Aug 2024 20:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724186761; cv=none; b=Mpm5SAKsHOxRRnUQXbN9fYj3AfdHqnR5Z6UsZRJhjq/S4dUUdwKXhyzkNRY3LgAIakHUH1HVIdrw5j603VN5yfVfleEa3te1485v7tVxcS8VAofMj4wPqSXEkMM2FgiJz9eCntLhDsUu7VH1M93PqqKftd2zIuj7M7lIbxi35Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724186761; c=relaxed/simple;
	bh=DzEEW1HlHBTo8rcN75ILvfm4kL9YGDtUrluz9TCmyyw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b6ABZPotO7m1kgpYPYQKb1Ja9ZTaICEvkBNekwfXOM57Kku9XTJL4PGM3yGnagmmgfaEj1U8FEJIkwD5TJzIyQF7/Te6svjxosoqxrvCvhjvCN4EvmtjdYMWNw9g5X7uytOIksyT1pNjXlljbgc691iCGn4YUFnZRjrBHgatbu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d4uKlvE8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d4uKlvE8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724186760; x=1755722760;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DzEEW1HlHBTo8rcN75ILvfm4kL9YGDtUrluz9TCmyyw=;
  b=d4uKlvE8dUBl/BgktjAxEttLtMTRe8qs0YHsfaOb8GT2HWa2Nuyc40rF
   LHnKgqA4HnwuR9QBF6qV17qdXa74Iwtv8fwr2o/ztz8OHSozqZ6OpFg5O
   OTY204NVcUGv4OIE2a1ntTlFvchnPmIWtXZyDZv5/0tlNlRRLwzsnhvNN
   a6p4AjqgI4nqGEHC65R/+0gSsQUS7DvPkKbx5nahdNy7m6pkx2YXL4dCt
   a/v1qu59tEMnSq3WSuh3nEjzgpcBVFRnJY3bt5q24c6ntOmj2xKU5f9r7
   U0XTHMQejU1kmWB9hbjr1JBd/c8YRJTJG9fXV2ubvd7HT+KWGIcmFJXRS
   g==;
X-CSE-ConnectionGUID: Cq+vW8dXQCm2UnyBwTscuA==
X-CSE-MsgGUID: cXnBuBLgSdyyn9ZyhaVadA==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="33905234"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="33905234"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 13:46:00 -0700
X-CSE-ConnectionGUID: cKZ2PoXHQ36L5o69uLwCjQ==
X-CSE-MsgGUID: dm5Is9j3QcKBCOKrUVCNEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="65743106"
Received: from spandruv-desk.jf.intel.com ([10.54.75.19])
  by orviesa005.jf.intel.com with ESMTP; 20 Aug 2024 13:46:00 -0700
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v2] platform/x86/intel-uncore-freq: Do not present separate package-die domain
Date: Tue, 20 Aug 2024 13:45:58 -0700
Message-ID: <20240820204558.1296319-1-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The scope of uncore control is per power domain with TPMI.

There are two types of processor topologies can be presented by CPUID
extended topology leaf irrespective of the hardware architecture:

1. A die is not enumerated in CPUID. In this case there is only one die
in a package is visible. In this case there can be multiple power domains
in a single die.
2. A power domain in a package is enumerated as a die in CPUID. So
there is one power domain per die.

To allow die level controls, the current implementation creates a root
domain and aggregates all information from power domains in it. This
is well suited for configuration 1 above.

But for configuration 2 above, the root domain will present the same
information as present by power domain. So, no use of aggregating. To
check the configuration, call topology_max_dies_per_package(). If it is
more than one, avoid creating root domain.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
This is a forward looking change as TPMI is architectural and should
support all topologies.

v2
Updated commit description as suggested.

 .../x86/intel/uncore-frequency/uncore-frequency-tpmi.c     | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
index 2016acf44f6a..e6047fbbea76 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
@@ -557,6 +557,9 @@ static int uncore_probe(struct auxiliary_device *auxdev, const struct auxiliary_
 
 	auxiliary_set_drvdata(auxdev, tpmi_uncore);
 
+	if (topology_max_dies_per_package() > 1)
+		return 0;
+
 	tpmi_uncore->root_cluster.root_domain = true;
 	tpmi_uncore->root_cluster.uncore_root = tpmi_uncore;
 
@@ -580,7 +583,9 @@ static void uncore_remove(struct auxiliary_device *auxdev)
 {
 	struct tpmi_uncore_struct *tpmi_uncore = auxiliary_get_drvdata(auxdev);
 
-	uncore_freq_remove_die_entry(&tpmi_uncore->root_cluster.uncore_data);
+	if (tpmi_uncore->root_cluster.root_domain)
+		uncore_freq_remove_die_entry(&tpmi_uncore->root_cluster.uncore_data);
+
 	remove_cluster_entries(tpmi_uncore);
 
 	uncore_freq_common_exit();
-- 
2.45.0

