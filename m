Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9497F2BD5BF
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Jul 2025 21:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751577152; cv=none; b=qTO0KbRvJmy/plUNDUHTF2Vi9VUi8Tz6ZEmVEVwMWQRtWKhrc2IC5m+7y16EbQE4/esgfs4vgtgNKNwGWhP8D5/idaiS4hhd5iypooQG/uFiB+HFipJwk0SF2RypRMOU1YDyckXAyDBq9feoc/P9Ms44ZcyBnau7BirWI9PKCNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751577152; c=relaxed/simple;
	bh=9MrQFq/bUM5cB16MXjQ2aOiN+o+uwH5fZNtoRhUB98Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qbwef08MIcSy9lR0gJRLYBEnCWRXb1iau0ZFPd6xDiPt/hII35l03tJLS4wUYM3Iue3wmqQGLEW+lRlkrK9ooRjN75W5T+pIJZU2i9fcLMzvVnQfCkzjlMqDib/LC4aeKf5+wFem6XYv/D2z1cLBg/1PRKRKee1hPMyQdK/9x3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PvWejTMg; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PvWejTMg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751577151; x=1783113151;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9MrQFq/bUM5cB16MXjQ2aOiN+o+uwH5fZNtoRhUB98Q=;
  b=PvWejTMgW8xwR9g3Osvvq8P9gHEn8Riep2+Dp6zzhszS1hqcNaKxE3Vt
   94qCe1bzVRSYtQFkeEQ95WqT4gKNJxpSMeqdbEetDB3vFoyw0HHXJMiIp
   QbySXT/ANnh5QIzhX/xxFyomzeJHzz18JoZ4awkjUUpNjpFVBoAOU8cVY
   mADYiNP2HjHWUtje8QqBX5Cu7LAwpOlfdLwC8lyifSeFAIPTJcXLz148o
   SngNHdtrI1FNK4JwmO+pq/JJQ4ZkHexP37rBbKUwTEpIF6S0itIGHplgH
   nOWRLKEfMyWMLm29MAftVm1UswgqnoiPQW3Nvz41gLLfAUR5jF0vQB+98
   A==;
X-CSE-ConnectionGUID: OeQAvmmzQwuaNPVE3oVwEQ==
X-CSE-MsgGUID: AWSZ/thVStqfl+kGom1tfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="79353031"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="79353031"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 14:12:30 -0700
X-CSE-ConnectionGUID: dWoeV5VtS8SCTANOabY02g==
X-CSE-MsgGUID: 6KECvgXwTNabhNonfGIFyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="154240078"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.223.97])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 14:12:28 -0700
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
Subject: [PATCH v6 07/12] platform/x86/intel/pmt: correct types
Date: Thu,  3 Jul 2025 17:11:45 -0400
Message-ID: <20250703211150.135320-8-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703211150.135320-1-michael.j.ruhl@intel.com>
References: <20250703211150.135320-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A couple of auto variables do not match the return types of some of
the functions.

Update the mismatched types to match.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: David E. Box <david.e.box@linux.intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index 440d2045e90d..881f4abdae14 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -138,7 +138,7 @@ static ssize_t
 enable_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct intel_pmt_entry *entry = dev_get_drvdata(dev);
-	int enabled = !pmt_crashlog_disabled(entry);
+	bool enabled = !pmt_crashlog_disabled(entry);
 
 	return sprintf(buf, "%d\n", enabled);
 }
@@ -169,7 +169,7 @@ static ssize_t
 trigger_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct intel_pmt_entry *entry;
-	int trigger;
+	bool trigger;
 
 	entry = dev_get_drvdata(dev);
 	trigger = pmt_crashlog_complete(entry);
-- 
2.49.0

