Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B856317A306
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Jun 2025 20:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751057031; cv=none; b=BTYAK4DFggJwFiG9P9BQ42ASl3CuoQ2w22xF1EJ4ofHVvjLL1Rob4tMB7FXwAFnfurtpFWaG3Asx+v5kVNfpIld3EOFVvCz+NPHI8fByqjQJTl7vntcxo9d2c935Z0QThLSMXIiYNoPhMVOnP3THfjVupFQ+PItXF20g7p/5BY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751057031; c=relaxed/simple;
	bh=9MrQFq/bUM5cB16MXjQ2aOiN+o+uwH5fZNtoRhUB98Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Os4QEymXljIQQmGKsVqLt+sob3dFQjtab1t0DkpdoKqiGnSpfA7Txy91cl0pvhW4p275rWJ8U5+og5bwrCPfVIcv455iAPV0wQZuWdD33ejk2WH0DWSr23w8NrBdnqLvda7Hd1YJ5pYyO9MGynmpqX11Kr0VM4skR8dG5ezE8vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cmqggPJn; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cmqggPJn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751057029; x=1782593029;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9MrQFq/bUM5cB16MXjQ2aOiN+o+uwH5fZNtoRhUB98Q=;
  b=cmqggPJnkt9HwxfeVaPnlIPZLt3rvGbbcvjZcdVjNrnbM9Vf/XWxLifp
   qrLK4kYLC3mCpGIuHH6BsnXC4jIWIetJ/zbIUcd5V3g2qiErHT5bfXC/q
   JRPcZW2ssKLQ62FpOe6u9/Kf6OiQmviO24b4hI3jnaGfKJbsn5ljaBPu7
   1dSn0TsUpAJDPVF0x5oi9u0snAtSrQjQjId7AJnV8Pss5smMpuzMEpym/
   +ZTZvut5Rg2sw/LfDRc2ksiOU/rTIHWQq8a0Hr3QEbpIrt959cmY1K62R
   2vOhfFVIV/TRe+HviQdZonW94iBv6CtZP19zqHL4c6jYDdonGAd2vfJU1
   Q==;
X-CSE-ConnectionGUID: 01+EvZvQS8WCuBKNkDJWNg==
X-CSE-MsgGUID: ge6+tb4oS7+9XkP9qzJNPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="41003208"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="41003208"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 13:43:49 -0700
X-CSE-ConnectionGUID: KBCzcKhWRyO+/p9dF+PAJQ==
X-CSE-MsgGUID: QFCzp6eYS6aCYujRlEa9ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="156939025"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.220.252])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 13:43:48 -0700
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
Subject: [PATCH v5 07/12] platform/x86/intel/pmt: correct types
Date: Fri, 27 Jun 2025 16:43:16 -0400
Message-ID: <20250627204321.521628-8-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627204321.521628-1-michael.j.ruhl@intel.com>
References: <20250627204321.521628-1-michael.j.ruhl@intel.com>
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

