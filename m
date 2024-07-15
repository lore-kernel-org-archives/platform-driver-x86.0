Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7BD53368
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jul 2024 17:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721066115; cv=none; b=Xh7h0SgDiqAimM4yQUHXp2Vv4jiad0r0Jex912gFglvNOL6gc/TNMid8jjM427XbHCETPi2ztW/PHbf39cHdOJrvgYp/XPpH/Bm0IamwlfIsEuvgx+6UKoqtbhwRywEgqLQE52XBC586ozmjQpARmmVR1szPzJUZWp5y3n4CYJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721066115; c=relaxed/simple;
	bh=bqbSRH82dd5hz4Y007eKHvFfx5KomReNipxj+rMsFyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PXJ4xbQYsXKKXlQ8KJ+FoVGmzRZChfC7YdgFpSoTpFZeCEDbF5wpx9YNEH1aPhg/VnG7VwQkt5vtyyOfnuk3HoPQVr75hApBF7UAyMXkvCj796z3TEqLzNsMZe6dcgksnka8WQ/f+cS67ZN82Ym1mp+xRfDy/aCvekxvt2xPU4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nZ89EvUz; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nZ89EvUz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721066114; x=1752602114;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bqbSRH82dd5hz4Y007eKHvFfx5KomReNipxj+rMsFyE=;
  b=nZ89EvUzrhZIcewrdoW5mXrzk7P1EVLc6lxfjzEFsDCZoCEGvIHwRIBH
   lUtfp9ubiq5q7d/4foJE91MUMrMRS8mhO4/+qs5YDLNlChrs9O/1sZEwp
   d5BVwm/zaKBj6BckvCzKi4EbIw8Znx94/d0vAMoy3Rkggg0ZM+eeAerqE
   cGj8rfGBOEfuKYyl0yR9xWxiu1BlyGnHzHx7xcUj+xEGmJXOUu+rJBDE5
   eRO8G7UoCpCZzv2nq2K+NeAm2jtnZnreIat3NNsk2MuLb6pTG7WZphLbn
   X3uoG5JHFqGNUmK8T6PsuUV1j21lVWSz/3YGvVZtr0aic/766txUquYny
   A==;
X-CSE-ConnectionGUID: WjyjQVaASzqRNDuZbJRpQA==
X-CSE-MsgGUID: XWLssSkMTsKOm1jLk/Pg4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="18077433"
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; 
   d="scan'208";a="18077433"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 10:55:14 -0700
X-CSE-ConnectionGUID: Fw4OGiXeSsymDo7G04JXtQ==
X-CSE-MsgGUID: Vbm9+lZPRHSXqSwiDG5AdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; 
   d="scan'208";a="49654322"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 10:55:12 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	matthew.brost@intel.com,
	andriy.shevchenko@linux.intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH v7 2/6] platform/x86/intel/vsec: Add PMT read callbacks
Date: Mon, 15 Jul 2024 13:54:46 -0400
Message-ID: <20240715175452.4010751-3-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240715175452.4010751-1-michael.j.ruhl@intel.com>
References: <20240715175452.4010751-1-michael.j.ruhl@intel.com>
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
index 6495e37c9079..b1c1131213f6 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -67,6 +67,19 @@ enum intel_vsec_quirks {
 	VSEC_QUIRK_EARLY_HW     = BIT(4),
 };
 
+/**
+ * struct pmt_callbacks - Callback infrastructure for PMT devices
+ * ->read_telem() when specified, called by client driver to access PMT data (instead
+ * of direct copy).
+ * @pdev:  PCI device reference for the callback's use
+ * @guid:  ID of data to acccss
+ * @data:  buffer for the data to be copied
+ * @count: size of buffer
+ */
+struct pmt_callbacks {
+	int (*read_telem)(struct pci_dev *pdev, u32 guid, u64 *data, u32 count);
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

