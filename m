Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04B61E633C
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Jun 2025 18:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749149133; cv=none; b=VoLn/BJx0VcYOBE9C+1ghmGd8r507AfTnkH8phECnhEGfehbt0kAqeHoTryNHj5RjmbNp60FLXsX9dfLvIL16VFgY+ZJ2GmxyUtyFZ91oVG2Wx782ygNnd0AZ8/EDjWB+1saq0Hw0zEaqcwoLbGs0CuP1v4Tq7JJ7H/RQPr6skU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749149133; c=relaxed/simple;
	bh=3zGaaI2Tt6uZqgfQb9gVOR7zHW+K28NJnwQluJOmn1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c0z8Tj+AwzGiS3js27zhSKY+6EDcAMYKUM86vWP20bCs5jD283cn6xwL3UZT6jhuncwE84aj5cOJXpxeDkWEVRwFarLDMKav0KRE3HF/uJSUfZela52USp0DSV0FEyfmvzW/EONdT6vWue7GVwqfsZdWEoujCWO4MIlzS6ZI1U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RbS3hm0/; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RbS3hm0/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749149131; x=1780685131;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3zGaaI2Tt6uZqgfQb9gVOR7zHW+K28NJnwQluJOmn1s=;
  b=RbS3hm0/dlW2NNwmS2UBZ+BPora/IPINt6HTTXtqS/NROzRJpoqIFpXs
   Pnh+HNN0wmhBQ6JhDSaz3+IeV29Jr7cVWMqvZEebMhmMIz3JTIrUOI87e
   QCH7GXLUR0AEdQEUTEBA1814lZRqQzCkK/dxFRFbj/T+81YI1VNAa8d+c
   dt58G/qY89vUk1OCDxECW+FJJdoXNHFsmuD80e251cUwpz2pRiq3oi9oJ
   YkZuy5tJcGzBO4LrxYtjQ2snXzTkrvCkvdC00grF1d3l8GhiUvXTukydW
   1THbKiki+G2lQ9J1ascxse+Tqj0O4U7g9NK0y+LzwxpptDXPuVExs+i0C
   Q==;
X-CSE-ConnectionGUID: tZOxLnXTQQSO739yctL5Nw==
X-CSE-MsgGUID: Bsx/H5U/SWW6hchc+BUM9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="38916638"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
   d="scan'208";a="38916638"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 11:45:31 -0700
X-CSE-ConnectionGUID: ZD4BDshvSYStZgWeVRM4qg==
X-CSE-MsgGUID: JoG8cmoDRjaZv2DAMgXUZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
   d="scan'208";a="182782496"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.222.42])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 11:45:30 -0700
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
Subject: [PATCH v3 06/11] platform/x86/intel/pmt: re-order trigger logic
Date: Thu,  5 Jun 2025 14:44:39 -0400
Message-ID: <20250605184444.515556-7-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605184444.515556-1-michael.j.ruhl@intel.com>
References: <20250605184444.515556-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Setting the clear bit or checking the complete bit before checking to
see if crashlog is disabled seems incorrect.

Check disable before accessing any other bits.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index 94858bfb52f8..aa3f57fbe018 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -191,6 +191,10 @@ trigger_store(struct device *dev, struct device_attribute *attr,
 
 	guard(mutex)(&entry->control_mutex);
 
+	/* if device is currently disabled, return busy */
+	if (pmt_crashlog_disabled(&entry->entry))
+		return -EBUSY;
+
 	if (!trigger) {
 		pmt_crashlog_set_clear(&entry->entry);
 		return count;
@@ -200,10 +204,6 @@ trigger_store(struct device *dev, struct device_attribute *attr,
 	if (pmt_crashlog_complete(&entry->entry))
 		return -EEXIST;
 
-	/* if device is currently disabled, return busy */
-	if (pmt_crashlog_disabled(&entry->entry))
-		return -EBUSY;
-
 	pmt_crashlog_set_execute(&entry->entry);
 
 	return count;
-- 
2.49.0

