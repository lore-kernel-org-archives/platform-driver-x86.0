Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D051C2322
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Jun 2024 15:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719587434; cv=none; b=gdKLdTLPx1AlnyTlk326e87vQUHbq9ZaWVhMxX+uoER5sUFkYSplkIiNzj8QgznfMO5JjzQp3slt7Alv6rzo/5uN+DVzTPfvuapYmfzt6KajxAPGOQTfpQTwvxR51s4bdJDZ+Z59ou/YPhRtiD4bjPF5gAo9+elabB0t3y7EmvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719587434; c=relaxed/simple;
	bh=R8dbb3VgmZF9CuqsKQAVTfcfpL/OtdrfBMNafCLJTlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jPO77jEDdDrAYjBS5RvcbFIQ7n6Kp5LQFaZ0pbpHC5f0dlusDYTMyJk1D9Z4q0rGDyD5j2pzRccUHG5/DbikANM5sXKTIPQw/LrG8ZGENqDfl0A5+bZ5NBewmoUPghRsiKp6JiqmiFblsczxuOTS/KlUEql8IHoV9OFWZ2NmQVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=keVZd9NB; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="keVZd9NB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719587433; x=1751123433;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R8dbb3VgmZF9CuqsKQAVTfcfpL/OtdrfBMNafCLJTlQ=;
  b=keVZd9NBlMPQcFyG7V3ySJiJElZEOsdnRFjS3xnDC9l0APnFHdxDOzuC
   a4Rp/t+qigm12tWeqjc75jGLK+wdXtvymgeiwTI36M27rE7N7YWV7lDd9
   e2pchCrKcvvlUZe+h43++TKQ2y1hzP+Er2LC0P8Vgs71+2QtTJFxm2vrY
   f72MhhC9q1tw9MSOsN0wF/CIqMYjFBx524xUPFa9pKEaRC2O2f+2Zeqr2
   fSAsmHldfC5CdPQijVD+g8ZgBngjN3l28+uBv/qHPTKRU/Mf7WlfwmXXz
   HWY6nYpFJpuP/3xkmme1WL8s39P0VJ8CmIdTTlHm+ragoEtH7gaFBVKJo
   A==;
X-CSE-ConnectionGUID: yAqIfKfORay5SRBLoKkgcA==
X-CSE-MsgGUID: SeyrWctBSei9YFhI+/oGHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="27460846"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="27460846"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 08:10:32 -0700
X-CSE-ConnectionGUID: ooUVYUKcSvCVLO1TFVn/Qw==
X-CSE-MsgGUID: xG6KHdMnTN+Ymp91fqQQJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="44848122"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 08:10:31 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH v4 2/6] platform/x86/intel/vsec: Add PMT read callbacks
Date: Fri, 28 Jun 2024 11:09:40 -0400
Message-ID: <20240628150945.3363575-3-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240628150945.3363575-1-michael.j.ruhl@intel.com>
References: <20240628150945.3363575-1-michael.j.ruhl@intel.com>
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

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 drivers/platform/x86/intel/vsec.c | 1 +
 include/linux/intel_vsec.h        | 5 +++++
 2 files changed, 6 insertions(+)

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
index ff7998cadab4..003301783331 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -67,10 +67,15 @@ enum intel_vsec_quirks {
 	VSEC_QUIRK_EARLY_HW     = BIT(4),
 };
 
+struct pmt_callbacks {
+	int (*read_telem)(void *args, u32 guid, u64 *data, u32 count);
+};
+
 /* Platform specific data */
 struct intel_vsec_platform_info {
 	struct device *parent;
 	struct intel_vsec_header **headers;
+	void *priv_data;
 	unsigned long caps;
 	unsigned long quirks;
 	u64 base_addr;
-- 
2.44.0

