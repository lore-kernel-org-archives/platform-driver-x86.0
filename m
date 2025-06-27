Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E322ECD17
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Jun 2025 20:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751057022; cv=none; b=XpKU27rMeJB3i4aNZ8RBcpxOQGsbj8OAVdOpxToibhFRNnEaKyBP+caOsj5eeu/hRBPVJvFVSI1XbLvK7XURJz2BTsv3EBEPbQax6jwLG319tNp/SK/OAs24UwWYeSX+qntt/Yu7wlWpfGlkZqrknm2Q6/ziM0GMrygW4Nf54gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751057022; c=relaxed/simple;
	bh=Qi8VA7IyqSTyswM7OG5Q49zNovGlyjja/KwiWAM4/W0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V/Ba1iH3lDfxt6T1MPfxEndd2rRqSo7b++d6onifLwwBhhcbLYJ1U+g7wQfHYdYlIbmHkHu9GCYe9Cp8x6xYgYQsDiZ+BHZs2ZTddHr/HOV1fqKWp8coalwbR4qCNcGOoTowxfvIaz4iXzH6LofcMDeSbm+2+smrBhP3YzFn6UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AKkg6yPL; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AKkg6yPL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751057020; x=1782593020;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Qi8VA7IyqSTyswM7OG5Q49zNovGlyjja/KwiWAM4/W0=;
  b=AKkg6yPLDD7IXlr+H6kV0aF9eGf0hCkQWnPOqYMh5xPAFqay3WgBH3Gn
   zYvJvJazzH1Vo7AYFxxKuWTpot5U+t81c9665Y7ltkGxahs7ETOQQAszi
   dGBpQISqPD1mvWKiTEMWgIatpupU5l5v1/oRkMeLv/LxqxZ4l8jKttv0i
   zekIgTXipxVgh6VN07R7b5M5lMY3e36l+DFeLxtmm4WsqBXK0wK07DaaH
   zO/6CYomZQ5AOdfSB3jfzeyQ/17q/420hKzxqeQfssz/dNInT7xYbb0uf
   Z0xCnBPxiHMBu+u53oOt0c3dgsLvFK4HJ69F5GGlrEZL6h1qeZunmzCw9
   A==;
X-CSE-ConnectionGUID: EJfxhsBtQQ+h/GoN5YojSA==
X-CSE-MsgGUID: jn3o1EdeS7O8Ntz3uO200g==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="41003175"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="41003175"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 13:43:40 -0700
X-CSE-ConnectionGUID: RRDl+yLtTwGjKKRVDm79QA==
X-CSE-MsgGUID: GWnLNIRnQWO5t7f5Xvlkfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="156938991"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.220.252])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 13:43:39 -0700
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
Subject: [PATCH v5 03/12] platform/x86/intel/pmt: white space cleanup
Date: Fri, 27 Jun 2025 16:43:12 -0400
Message-ID: <20250627204321.521628-4-michael.j.ruhl@intel.com>
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
2.49.0

