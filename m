Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8017F195FE0
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jul 2024 19:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720639384; cv=none; b=pfTT+8PVAjG9Tcq7lA+txHJ3LO3m2fu2jI6PSek4VP92St3rLMZatnxecQrKAqcKunsou4nEe5ZtRXUo2GsNToZ/5u6YEeiwge3ozyM8s1bBofWAidtXIRzmxepQ9cdTJgGFvi+z/flM6ZiT/FewiGyo+x8hz3kvoXEvpnI3944=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720639384; c=relaxed/simple;
	bh=1wzK91ocBSnPobNzarGgOMEeaZ4BR10PVYBukOtfc8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q38Ks8Y/1Pp2KnzQ3YQHzwUy8x3PN0UDYf/MRd71Q4XcX3KO9WJdYx2J72aMxe7QkPweluQmkOiC1WsAwZrigSPhzzrkVs1jnAi9LseDbkU/Z2+DptHACCBreqz3EyMGpwRIL/iAKTP/Q9hBu+xeB6YNRZn+1VmHob+H91VKPGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FFmGkQEG; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FFmGkQEG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720639382; x=1752175382;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1wzK91ocBSnPobNzarGgOMEeaZ4BR10PVYBukOtfc8g=;
  b=FFmGkQEGo6CHSxajv0B7HFVUyoSjjEzx7bCQTJjjFyybGqMBb0/ssbzd
   KClaPV9Yrx6IsmR9y9hM5cYea+c+W33nJ1B8dLNakaEOUB33LG3ZBQ73j
   NO6OOQLMBv6V9ecG7IwFR8kE1Vxxo2CelRnICM3w2Es7MS38ylGAgkX8q
   C4R9srwXL0m6eZ9j1fXZZH11BaHUE7EVzOZiiTnf2rgDhX+KNAHs4dqL+
   Gtr73mnysiT2ZhvuyLef7MXMkWfZTd8ZO7/6Je1GxAO9bWryL2NxIeRTi
   S/Oue1jFxiVjixvAcOFCEgE7AqAtHhz8M/hdm/PF6hnlQFW4yyxomXplH
   A==;
X-CSE-ConnectionGUID: tvGaxJPyQpGRQ3L2b6JEyA==
X-CSE-MsgGUID: lvQQ23hlQDW1ZGcCg2+LAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17856450"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="17856450"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 12:23:02 -0700
X-CSE-ConnectionGUID: HKvQlp8FQseMEBxRdG/vuQ==
X-CSE-MsgGUID: s2nsOMT+SNW8Y48lmdJjlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="53483019"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 12:23:01 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	matthew.brost@intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH v6 2/6] platform/x86/intel/vsec: Add PMT read callbacks
Date: Wed, 10 Jul 2024 15:22:43 -0400
Message-ID: <20240710192249.3915396-3-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240710192249.3915396-1-michael.j.ruhl@intel.com>
References: <20240710192249.3915396-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "David E. Box" <david.e.box@linux.intel.com>

Some PMT providers require device specific actions before their telemetry
can be read. Provide assignable PMT read callbacks to allow providers to
perform those actions.

Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 drivers/platform/x86/intel/vsec.c |  1 +
 include/linux/intel_vsec.h        | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
index 2b46807f868b..7b5cc9993974 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -212,6 +212,7 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_header *he
 	intel_vsec_dev->num_resources = header->num_entries;
 	intel_vsec_dev->quirks = info->quirks;
 	intel_vsec_dev->base_addr = info->base_addr;
+	intel_vsec_dev->priv_data = info->priv_data;
 
 	if (header->id == VSEC_ID_SDSI)
 		intel_vsec_dev->ida = &intel_vsec_sdsi_ida;
diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
index 1a287541a2f9..4569a55e8645 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -67,6 +67,19 @@ enum intel_vsec_quirks {
 	VSEC_QUIRK_EARLY_HW     = BIT(4),
 };
 
+/**
+ * struct pmt_callbacks - Callback infrastructure for PMT devices
+ * ->read_telem() when specified, called by client driver to access PMT data (instead
+ * of direct copy).
+ * @args:  pci device info pointer
+ * @guid:  ID of data to acccss
+ * @data:  buffer for the data to be copied
+ * @count: size of buffer
+ */
+struct pmt_callbacks {
+	int (*read_telem)(void *args, u32 guid, u64 *data, u32 count);
+};
+
 /**
  * struct intel_vsec_platform_info - Platform specific data
  * @parent:    parent device in the auxbus chain
@@ -78,6 +91,7 @@ enum intel_vsec_quirks {
 struct intel_vsec_platform_info {
 	struct device *parent;
 	struct intel_vsec_header **headers;
+	void *priv_data;
 	unsigned long caps;
 	unsigned long quirks;
 	u64 base_addr;
-- 
2.44.0

