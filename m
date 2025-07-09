Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64F92397BE
	for <platform-driver-x86@vger.kernel.org>; Wed,  9 Jul 2025 18:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752086725; cv=none; b=f3P46nXBSU1c2x2F2CpxoCFfNdkINGhjPuniboJcvMix2I9DI0Nv53d5JF0H7s9GAFbYRcmRtcHUJvwRYb9EgbleXfJgcmD+joTogcOdgmHRNU+yAdU1zURSJY3omvLK4yY2p1RqvQlOViTX76qYPvHYJ5V1JlzKyLmKeQBLDeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752086725; c=relaxed/simple;
	bh=fEpVBDkA7IcyV+aL6nnoML3R5kcIskBLXH9u4N8bYS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hPBNwik2Rqr8r89LB24qi/X2uaQiZy0PPyKf7oI+yCOUD/0CvgKUOUVMAiJ1D6Q5rzrDVTpYTwvzovIC1qpwlfGTGacnE+IsOeG6UqbYVDLx7X/9sjYHdsHfDgwIJrWfxGmNnbHyTvyuG8lWwpFxdj63v/YgDuJAbsOPnYmiipw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XhQqC038; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XhQqC038"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752086723; x=1783622723;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fEpVBDkA7IcyV+aL6nnoML3R5kcIskBLXH9u4N8bYS4=;
  b=XhQqC038Rcs7EVT7JatTfIZhhD5CzuV9QlDxN2F9tcUimUCjzurxJbhr
   h950JYRg4EAzuPSykU1k5enyVXckhdZ6ILDd2KEUpIFWuTz1N5LBLwj2e
   mtIqdnj6oSOf1lKKJ94xJLWs5FgpLZ0NDw2NBBcl6Cx592XMmtdQ6CZ/Y
   88XCWbtEQUKK2pI2TJ5IfByW2wX/GZ1aLdZ8WSteklWzY9gviieBmGh+D
   d9W0FEy8xXG2SBVO0Rvj7kNVRoAYyloq8oxiM6q9Rk67JkSA5Al9i1c32
   NQ6VtAL+Bpur2Wu6PZG8wdk+O+qnjqP1Hp2R27C6yDHThZ/7eeOKa63f2
   w==;
X-CSE-ConnectionGUID: npaVqoiYRNKiDXrpQFVmKw==
X-CSE-MsgGUID: ECBV5LJARvS6xppFGlbMBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54451032"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="54451032"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 11:45:23 -0700
X-CSE-ConnectionGUID: dhm4QvdSRRGH7NsQe1rdJw==
X-CSE-MsgGUID: xa1Mtws3QAqelbRu/0gbSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="161404852"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.221.121])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 11:45:22 -0700
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
Subject: [PATCH v7 03/12] platform/x86/intel/pmt: white space cleanup
Date: Wed,  9 Jul 2025 14:44:49 -0400
Message-ID: <20250709184458.298283-4-michael.j.ruhl@intel.com>
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

Noticed two white space issues; cleaned them.

Reviewed-by: David E. Box <david.e.box@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index 6a9eb3c4b313..d40c8e212733 100644
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
2.50.0

