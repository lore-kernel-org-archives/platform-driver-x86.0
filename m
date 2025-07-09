Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47F623B62B
	for <platform-driver-x86@vger.kernel.org>; Wed,  9 Jul 2025 18:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752086731; cv=none; b=mtf1rahvP7Y63L9Xo2Mh3HOwMCREPujUSuJ1WWu5+Hd0wGfZcpLlGMbbhXz6neq1M3CjL2eArJZ/ed2s6dIOg1kZbJb/lK3WUme76QqrjEL6ltiEn2Z1ooav6hAz7JZXYMKt6LXZLocgTXMXBseJx7qAWNfcmNBIP/Hg5bfXfE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752086731; c=relaxed/simple;
	bh=FCJ4IU4j+U6xQMZgZnRxgXoyukF8eMT2iB3TNiA16Vg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bzqkcv/DLnCIWlw2pom8GUhA0lbVt5mLznUkpdgBjiIeV2fgdkjYgiDYEgM3PNvF6HwST97YgutGnm+GlX3mw06vCdcagTSqo0QJXNFOZ/L1FHsH4EPIFwPP/+UEzRADcrNH7A+SwA0v20YP9rhAkeI1jsnmyySlSR+P1ipw9Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hu5bfmAR; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hu5bfmAR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752086729; x=1783622729;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FCJ4IU4j+U6xQMZgZnRxgXoyukF8eMT2iB3TNiA16Vg=;
  b=hu5bfmARMsAd3Kb2mlKXv4GQ5rM7z9od0FSESfKH+HLzBEhMJLxE+Lrz
   tG0NtRYsyTtNy1psXi2PK6GjPfhqyLDJv1v95G8XmPvLM4r+htX4FH9h4
   BFg8ObgYz9febnlVEgNsDpgcNAnPCE/yDaKuoLsTU+RpAIlzLZRuUsPhZ
   v+7vyXrV5rElLGf9fWMjg+6xDrrysBZg4yUbQosHRhRCeVooqiKxcEeiB
   FDhye8zUOIx2zFZZhZswoJh2SfrzMYUFVNhPxIFJzCJAagakX/0H3x1d9
   MCQTrp7KCX8V27U5z5RC5WgI0BCnCL6nHrbW/PrsiNAuSu/INJ/BtfZgg
   A==;
X-CSE-ConnectionGUID: Np2pH2HsRq6dGJYaFvtGNg==
X-CSE-MsgGUID: Vs8QJWrsQYGi+CT6Ns8GDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54451059"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="54451059"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 11:45:29 -0700
X-CSE-ConnectionGUID: I8O39gK/Q6qL7l/xbXp+DQ==
X-CSE-MsgGUID: 14A1zAVQQZer+12UkG7BGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="161404871"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.221.121])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 11:45:28 -0700
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
Subject: [PATCH v7 06/12] platform/x86/intel/pmt: re-order trigger logic
Date: Wed,  9 Jul 2025 14:44:52 -0400
Message-ID: <20250709184458.298283-7-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250709184458.298283-1-michael.j.ruhl@intel.com>
References: <20250709184458.298283-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Setting the clear bit or checking the complete bit before checking to
see if crashlog is disabled seems incorrect.

Check disable before accessing any other bits.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: David E. Box <david.e.box@linux.intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index c3ca95854aba..440d2045e90d 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -193,6 +193,10 @@ trigger_store(struct device *dev, struct device_attribute *attr,
 
 	guard(mutex)(&entry->control_mutex);
 
+	/* if device is currently disabled, return busy */
+	if (pmt_crashlog_disabled(&entry->entry))
+		return -EBUSY;
+
 	if (!trigger) {
 		pmt_crashlog_set_clear(&entry->entry);
 		return count;
@@ -202,10 +206,6 @@ trigger_store(struct device *dev, struct device_attribute *attr,
 	if (pmt_crashlog_complete(&entry->entry))
 		return -EEXIST;
 
-	/* if device is currently disabled, return busy */
-	if (pmt_crashlog_disabled(&entry->entry))
-		return -EBUSY;
-
 	pmt_crashlog_set_execute(&entry->entry);
 
 	return count;
-- 
2.50.0

