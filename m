Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A97E824A3
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Jun 2025 18:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749149127; cv=none; b=rmOephQLQKjMhg98c5ugN4gkhuHmwjj3b4upA7siWM4tM9Zo9jjY/kaOTt3poZu9rM8VtisFFVdyiLWFOdA8eVd3SZm/Taci12NpywHXu9vSA8SnXcVM8skeWhr1LNLuYDOnQfQQJ5KJ1qj7nThtj4R3eEaxDdWRAisJN00KImI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749149127; c=relaxed/simple;
	bh=AfLD4UZeGCsNhY+2Apa7Y073l276eY/6AvTiQqohL88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Arm2kmMJWVWV6mYPeM0m/Lw97cHiH7508Ju3xHYd/TtdVZyCgYOj77dMGFeAii+F+jHjfqoRYk85HvZq1OcFSKdQT9B9DRheVXTLZ5W8Xp5JCiBkBfC7SEOQqBMgC1duUOk/fWUAJKON0JaQSl4IzNO/95IDW46GMKpopy1qWRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ki5PgncY; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ki5PgncY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749149126; x=1780685126;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AfLD4UZeGCsNhY+2Apa7Y073l276eY/6AvTiQqohL88=;
  b=Ki5PgncYWy4MNop0zFmU+B2a4sxzJFAwnvhyk/OAv4lo0zZ9vr2pRTDA
   09B+nyHxdJ4w3RaGJqETBaLTgfgRv5Ha5TXVmxAbnYsGTF8+bL3IrDAW3
   +Z9h4AsQWmltxbdWCMsEW868PtkILXdlZaS8rjlw6pThpNRaj8SEHLJkG
   +M4eyqXu8KCnCiLDGwpu5tO4Hb1wqVAiQCvEJxw8XgC5NLTHK+SRq1Tfo
   1TPq9QIu8/ce9CNR1M97o+EPlG9jsI5TF507i8sXnuCfNZ40UGbm03JLv
   D7QWn6oEGbNN73Q63lL5U+a3rOI5Jcz3K4tTcew71wB5eVPim41yhJMAa
   Q==;
X-CSE-ConnectionGUID: 9BCnjktXR5epg2ShocZg7g==
X-CSE-MsgGUID: zleZr5yaTzucWIp/TzJ/kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="38916625"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
   d="scan'208";a="38916625"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 11:45:26 -0700
X-CSE-ConnectionGUID: 9Y2Coh5GSmWJE23dp2c/BA==
X-CSE-MsgGUID: KyjG5RfBR5ydTnFXqZqXhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
   d="scan'208";a="182782472"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.222.42])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 11:45:24 -0700
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
Subject: [PATCH v3 04/11] platform/x86/intel/pmt: white space cleanup
Date: Thu,  5 Jun 2025 14:44:37 -0400
Message-ID: <20250605184444.515556-5-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605184444.515556-1-michael.j.ruhl@intel.com>
References: <20250605184444.515556-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Noticed two white space issues; cleaned them.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index 74ce199e59f0..e997fc48b9ce 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -143,7 +143,7 @@ enable_show(struct device *dev, struct device_attribute *attr, char *buf)
 
 static ssize_t
 enable_store(struct device *dev, struct device_attribute *attr,
-	    const char *buf, size_t count)
+	     const char *buf, size_t count)
 {
 	struct crashlog_entry *entry;
 	bool enabled;
@@ -177,7 +177,7 @@ trigger_show(struct device *dev, struct device_attribute *attr, char *buf)
 
 static ssize_t
 trigger_store(struct device *dev, struct device_attribute *attr,
-	    const char *buf, size_t count)
+	      const char *buf, size_t count)
 {
 	struct crashlog_entry *entry;
 	bool trigger;
-- 
2.49.0

