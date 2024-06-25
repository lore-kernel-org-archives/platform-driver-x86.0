Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B81156899
	for <platform-driver-x86@vger.kernel.org>; Tue, 25 Jun 2024 12:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719319584; cv=none; b=kFFXbrZ0+KygBxTF6PZvhZme267A1bld5x0c8qoOIZPPuJhPNbggeyZXD8FdQ/hiIqeppodbil9YVMf1REwOnHr5ezg2rmJBJkWrOAlD2Hw3lJQKpbRTKyUTwCp51jSGPWmqndc2swJZwS+4K7Gdp17QSmi4xP8PsOFt7TWWLIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719319584; c=relaxed/simple;
	bh=R8dbb3VgmZF9CuqsKQAVTfcfpL/OtdrfBMNafCLJTlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=arlQ77jW4Pi5gJ3LENCS/iOVZ4R0I14W8YnYM76WBGlLEaCMKPYPP+6+WdMSWuEtsCZdY+fBjhTDi10UewWcgfK1vGB5HpOhGOeXOL3ChHOaJChNYgg4dRJDBEbrooIO61tF2xPCSCbs4d3BEgLzC8TH3xEVOOx3ImTsQAKK954=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=grsQScr1; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="grsQScr1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719319583; x=1750855583;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R8dbb3VgmZF9CuqsKQAVTfcfpL/OtdrfBMNafCLJTlQ=;
  b=grsQScr1fwexNjnFA89nBFYhrGpivNYUwvbtPzK7hQeOYLElYVWLg3bB
   gItTInD9qXMX0GLQSy9PetY+pMercUXDCU+GyYcTdKcEAcWlyskFGMagh
   llkm/JZnI3N1RLMJ/vlavf6mjhAzRLfViNhu8bRXPB2cgjDt6ZmGY0d6y
   ZDZRyOj2lVr2lEGKFs2KF9Z4OpTl3zOfrXrhOLn5M91W39J7TckhC5L6x
   tF0OHMyUWwbxBtp2+79XH+AdAG/6mmDPVolmlFjBFe5wpcICeo//PsAhL
   qQvpVsTdznZaj31bJWr8gEsSWwIGY/A7FuvsLsMUYampncIf44CbsIzDV
   w==;
X-CSE-ConnectionGUID: kgCXrm0eS0KuDwGjOa3dww==
X-CSE-MsgGUID: ePzX03V4Q02fRCkWaSoOLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="26955332"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="26955332"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 05:46:18 -0700
X-CSE-ConnectionGUID: k966GdQBTbS27l/lMDLkTA==
X-CSE-MsgGUID: 83DSzVQoSCWhZ805gOv5yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="48547069"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 05:46:17 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH v3 2/6] platform/x86/intel/vsec: Add PMT read callbacks
Date: Tue, 25 Jun 2024 08:45:48 -0400
Message-ID: <20240625124554.3358460-3-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240625124554.3358460-1-michael.j.ruhl@intel.com>
References: <20240625124554.3358460-1-michael.j.ruhl@intel.com>
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

