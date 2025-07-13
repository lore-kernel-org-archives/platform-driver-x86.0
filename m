Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE0728313D
	for <platform-driver-x86@vger.kernel.org>; Sun, 13 Jul 2025 17:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752427804; cv=none; b=CJEW/qEWaFgflwVrHGlB/kul0zVf7XQfO/1bBmqAZfl9n+rRfgafweaBfLL62yP7M/y3b3UB2YRmph9+/5INSljAVJYrCojp3dgccfwgOxAf41u57jy8lomnV8BNMLSs7ir+5NHSE8qA+HGsgiUyExQitJUJq4jT97ZBwieYG2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752427804; c=relaxed/simple;
	bh=fEpVBDkA7IcyV+aL6nnoML3R5kcIskBLXH9u4N8bYS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GT8OZNWpoxCvWSpeRdsgEEPIxUC+hkVQLNoZt9RuhMSNjfwiUMMSn3NXUS13CFtWxnAVG/uS56HANt0dZ0CP3X8KxfovzB3JfeX5p46569xvOjQ/Xcu3xGSjlw884VJ+J5VYeVrWtugFxwyGKbwcJrteMp0JW9QiehU6cEEAqvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ko7m5Pkd; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ko7m5Pkd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752427803; x=1783963803;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fEpVBDkA7IcyV+aL6nnoML3R5kcIskBLXH9u4N8bYS4=;
  b=Ko7m5Pkd4cpZSb4VWG0G5zYpFdiJyXrmOdr9ltR6MYRseVOj+nbgS9EX
   umaVy3BjUc3oYGD5ZVNSTo5t8ZOUq/5anj2D3lqYtKR3dVL00Lu56eblr
   meN1i+bPm/Q+EY0eFmcjdM3xyk4itoKPVvOSFJdR3w7qbgmp5M4Q4a0GY
   ShQJG76t77eOVHTIKbISoIRxwAMAMWtiVs+iXCGP2ALmkSOH9R/i8J5dk
   r5zxig3bsoYF70j5cfzzPxTbyWSuCtgpPKVG9tiX1J1ovRSaAuo7Op0ly
   VvG7rJhT+kkoYP5cUC0ZPTLDAVu8SsF4A5mV6VqgyuI7fZRTjhUyiebdt
   A==;
X-CSE-ConnectionGUID: 1YOAgaRNRoKWNTIrgAoZdw==
X-CSE-MsgGUID: yr+RbQH9TpSZv1VNyRfp9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65334126"
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="65334126"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 10:30:03 -0700
X-CSE-ConnectionGUID: 7yupOhaESCagoDo361G8Lg==
X-CSE-MsgGUID: Q6BXaF5tQaqQpXliXOXASw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="161069256"
Received: from mgoodin-mobl3.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.223.19])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 10:30:01 -0700
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
Subject: [PATCH v8 04/13] platform/x86/intel/pmt: white space cleanup
Date: Sun, 13 Jul 2025 13:29:34 -0400
Message-ID: <20250713172943.7335-5-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250713172943.7335-1-michael.j.ruhl@intel.com>
References: <20250713172943.7335-1-michael.j.ruhl@intel.com>
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

