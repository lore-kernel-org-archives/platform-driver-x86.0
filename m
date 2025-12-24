Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A591367
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Dec 2025 04:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766551598; cv=none; b=A024YtCu7J+3w1dbhZDC7EmArBN7UvwevRBHKafXNTYTzq1vWv1QB7aSDUTtxAe2mIM3Ht1GzVm9nzI3nuZdsJkYu1g/gxSQJN9Y73+vc074NRSCMeAfM1Gn1/4O/F3VRCbIyut5LIJylGFfA0zEe8CuX9Hep9fL1pbOGUmq3xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766551598; c=relaxed/simple;
	bh=bKLhkrW8HcucVS0kG42Uq+NPsbD77zJkEPFeQwt+HeY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dzJnDaWNUAH1AIeI9wxrI7eQ0pAo3AYiFK0GEQOdvVNsvEuyJVlrsJ4c2B04+FJHd1zjh23xZ5gmEz0MQ035yXcwgvuOwqC/yUcxgtgyE69ofURLwGYXrXHRPcp7RyPmhsepsihFw09RlBuPHR6DiOJMTkiCyaSJZCE47+FQbjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ne/RGI3F; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ne/RGI3F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766551597; x=1798087597;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bKLhkrW8HcucVS0kG42Uq+NPsbD77zJkEPFeQwt+HeY=;
  b=Ne/RGI3FOFKZwYmQ1h2nzxa9IQrwoSFbxexIPi/yM/0oydY3IPn94Reb
   JvuM3NKdS5scCERa/Ueh/lpmaShFb/6pseujc70iAR5nVhJosPKTM2Qg8
   O7IXdVa0r8yDZjvD/hZWopAyd0hgN9ngmUPTSVF+aecPbXrYT44aUU3WO
   gBJENdawIDNTZiIdGRL65/U0C9FbLmj0DRS5EEz6wuuwR+pSVNzC8cqbq
   UvhrkGFED4TqqYqf406+0YZO6fpVnTPASJ8wbN88m0OXSxUGTgIzfsB3n
   VAsSWoWP0hX9JpxkZXWFticy3I8vPChuEFPzlivE+NsLvbeqXFdWt3Cf5
   g==;
X-CSE-ConnectionGUID: oUUy7YnkTOeRLI/39oblbQ==
X-CSE-MsgGUID: TOnG080xSBa1K6Rb0ksShw==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="70975417"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="70975417"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 20:46:36 -0800
X-CSE-ConnectionGUID: CCjxTxMRQbOgnzNp3A3Y7w==
X-CSE-MsgGUID: tpl9qXowTJuYxu2TXSmxIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="199851215"
Received: from baandr0id001.iind.intel.com ([10.66.253.151])
  by fmviesa006.fm.intel.com with ESMTP; 23 Dec 2025 20:46:34 -0800
From: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
To: david.e.box@linux.intel.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	Kaushlendra Kumar <kaushlendra.kumar@intel.com>
Subject: [PATCH] platform/x86: intel_telemetry: Fix PCI device ref leak
Date: Wed, 24 Dec 2025 10:13:59 +0530
Message-Id: <20251224044359.3919178-1-kaushlendra.kumar@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The for_each_pci_dev() macro increments the reference count for each
PCI device. Without calling pci_dev_put() to release these references,
the code leaks device references.

Add pci_dev_put() at the end of each iteration to properly release the
reference taken by for_each_pci_dev().

Fixes: 87bee290998d ("platform:x86: Add Intel Telemetry Debugfs interfaces")
Signed-off-by: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
---
 drivers/platform/x86/intel/telemetry/debugfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/intel/telemetry/debugfs.c b/drivers/platform/x86/intel/telemetry/debugfs.c
index 189c61ff7ff0..8fdc9965ff27 100644
--- a/drivers/platform/x86/intel/telemetry/debugfs.c
+++ b/drivers/platform/x86/intel/telemetry/debugfs.c
@@ -589,6 +589,7 @@ static int telem_soc_states_show(struct seq_file *s, void *unused)
 			   dev->vendor, dev->device, dev_name(&dev->dev),
 			   dev_driver_string(&dev->dev));
 		seq_printf(s, " d3:%x\n", d3_state);
+		pci_dev_put(dev);
 	}
 
 	seq_puts(s, "\n--------------------------------------\n");
-- 
2.34.1

