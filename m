Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794707392;
	b=cL06dH+sManpGY4bbDLj5SNUnlO9kCt1yDN/CyonL1cMB7Z51V/K9qKabAJzVixIDv9g
	 QWBnH1dbcCsd9R698zSwav0qy31rCLnDvq3m803T+L6HMS+Bu2nNm0M+U/izp40i6dA/b
	 8tV18mP8aEJXlbsdvnyFPAtHg7bzar7seucdLqdx4tzEHjS0rFrD8TbtoE4myNtjxl94z
	 gPDyxQRVZGzawYBYHfQtytW+51MLEYTqubelzH8hCprQ+DE2CsNHK8BGvMJ9E7rkol2je
	 WkkNQlcvnCf8UfcRuu1/u4ygCyJ2zKReAGT0SMB6yK412gjqvxeJx79h7JqPQ5vk2qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794707392;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Otzma9vCv7j0/AHpd0p99dn7imhWfAapg4Er/Y7/7fE=;
	b=i0yYnqfLf4oIR2OdkC8KvDvx+ksZo1oPnt6mYpFSwwUymkuI9ib4UOUjJGmGq1eppKdS
	 HGe0rF20+RE6idWzSbEJdf5w+Yky4NM1xYKdSCDZNvwarK+92RnP1Y1srA38/tXQZI/73
	 JDkrUDpsV4irwUc1ISLRbiOE19/WFnhOhDIFQ+KCw2na4iMm8+eISyUzR9yA4R51yvFvi
	 D8De3naio0a2sw1ql0qmd5Nlk/HUyFeSiZBsAMHMZ2kRciH5pzOClhLMFRBGRHP4JnZsZ
	 VB9DBo8KS8IX61fxXryjNNHtgl7CJETf0zwSCqIZyQ+fezoZrOKrsESUWvYNaS0E/2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IjcsxfRP;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772F7606A32E;
	Sun, 15 Nov 2026 01:49:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 772F7606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IjcsxfRP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794707392; x=1826243392;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XllZZknxafj3mpwUzGZApICQsB0DSXg81aQnGpKiEHk=;
  b=IjcsxfRPAfbkHy98nHjzgUBbKXmHDfHkOcfSZo+5bgWv/N5q3l9PbUTZ
   XP4oPwrFxoKOlcgp1TfU1AMNUmsXrMGGCJJlDjVjrMo9m3oGNqaQjF2mi
   DxDr6FAX2f3DiBvjfYJLBhxLGktoRUMWjk34kCCHEPp6Z3FRKNAypUCq1
   ZdQCWvZdogUzb+XS00qi45qdKBicN5G0XVBR77Iv7cr1ynsbKSuW2lJn0
   fkxmPz26kQH/EeQFtutrMKAmdVQxq/mmxi/1XehFRmevQFVz4hNBP3ODq
   TjLo1SAtSgnszjE9Mlirw6LBZnNKEpOzMubhtqdhSG7HpB8B5SjRN1R6C
   A==;
X-CSE-ConnectionGUID: 5XYMH46/TD+MVL2F56fMkQ==
X-CSE-MsgGUID: X5Y9IIOPTwmiL+EHp1/j4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3476605"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3476605"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 17:49:50 -0800
X-CSE-ConnectionGUID: 0htPdH2SR/+8FlKO/Pg4Gw==
X-CSE-MsgGUID: 9dtPmQBdReGe5vRwdlIgKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9492167"
Received: from spandruv-desk.jf.intel.com ([10.54.55.20])
  by fmviesa008.fm.intel.com with ESMTP; 14 Nov 2026 17:49:50 -0800
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 1/2] platform/x86/intel-uncore-freq: Don't remove entries which are not added
Date: Sat, 14 Nov 2026 17:49:47 -0800
Message-ID: <20261115014948.2517688-2-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115014948.2517688-1-srinivas.pandruvada@linux.intel.com>
References: <20261115014948.2517688-1-srinivas.pandruvada@linux.intel.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When uncore_probe() fails, remove_cluster_entries() removes the entries of
all clusters of every mapped power domain. But not all of them are added:

- When the allocation of cluster_infos fails, cluster_count is already
  set. So remove_cluster_entries() dereferences the NULL cluster_infos.

- When uncore_freq_add_entry() fails for a cluster, this cluster and all
  later clusters were not added. uncore_freq_remove_die_entry() still
  removes their attribute group, which doesn't exist. As domain_id of
  these clusters is not UNCORE_DOMAIN_ID_INVALID, it also frees their
  seqnum_id with ida_free(). The seqnum_id is 0 from allocation, which
  can be in use by an entry of another device.

Skip removing an entry in uncore_freq_remove_die_entry(), when it is not
valid, which means that it was not added or is already removed. Also
skip power domains without cluster_infos in remove_cluster_entries().

Fixes: 01c10f88c9b7 ("platform/x86/intel-uncore-freq: tpmi: Provide cluster level control")
Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 .../x86/intel/uncore-frequency/uncore-frequency-common.c     | 5 +++++
 .../x86/intel/uncore-frequency/uncore-frequency-tpmi.c       | 3 ++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
index 4bcafedf68ef..6051aa040abf 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
@@ -312,12 +312,17 @@ EXPORT_SYMBOL_NS_GPL(uncore_freq_add_entry, "INTEL_UNCORE_FREQUENCY");
 void uncore_freq_remove_die_entry(struct uncore_data *data)
 {
 	mutex_lock(&uncore_lock);
+	/* Nothing to remove, if the entry was not added or already removed */
+	if (!data->valid)
+		goto uncore_unlock;
+
 	delete_attr_group(data, data->name);
 	data->control_cpu = -1;
 	data->valid = false;
 	if (data->domain_id != UNCORE_DOMAIN_ID_INVALID)
 		ida_free(&intel_uncore_ida, data->seqnum_id);
 
+uncore_unlock:
 	mutex_unlock(&uncore_lock);
 }
 EXPORT_SYMBOL_NS_GPL(uncore_freq_remove_die_entry, "INTEL_UNCORE_FREQUENCY");
diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
index 753ddfe8c759..73e0b0a94eaf 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
@@ -524,7 +524,8 @@ static void remove_cluster_entries(struct tpmi_uncore_struct *tpmi_uncore)
 		int j;
 
 		pd_info = &tpmi_uncore->pd_info[i];
-		if (!pd_info->uncore_base)
+		/* Probe may fail before cluster_infos is allocated */
+		if (!pd_info->uncore_base || !pd_info->cluster_infos)
 			continue;
 
 		for (j = 0; j < pd_info->cluster_count; ++j) {
-- 
2.55.0

