Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F4127AC2F
	for <platform-driver-x86@vger.kernel.org>; Fri, 30 May 2025 20:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748637500; cv=none; b=O5FAP9ImK7aFiPy0PLF1lYSuLYZ1QnuZ9PtmNX5Ag9Zxp5hQ0MZnqwZgnUyGVkZ2brydjpmiVFbWaNT74OtyW/iudfpk4luUt4dKFeQsDmltTwVE4Ul0RHVN8bPbzsZgGctIj+O5y9JPRv7poGd0LP56SQn9i4kPBvkXQbCI1DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748637500; c=relaxed/simple;
	bh=anO5uSxXGHeVN2wZdaUxm+8Bhoy2yyCKRXoSKuFsiLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a0Z6SJgHdlz20ZDmNQNTiOznYEfEuUYGJ8fnZ5lFwhuh/LaOIVYAbkjqaHD6rtthmMPgi7lllrttKEIeBWRQZCyn5q0SRNKsykZg94VeJfzwJkHNIsYdsen0Uz27e65xHDBl+MtCw3pECsuVGr5QKoG6eqZFOqtgyuq5grOq8LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nXp4miKf; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nXp4miKf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748637499; x=1780173499;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=anO5uSxXGHeVN2wZdaUxm+8Bhoy2yyCKRXoSKuFsiLI=;
  b=nXp4miKf/cteix2bGiRSQCti4dOCjg9ImjpSTkeyj9nw2J1xPoz8CmLs
   FUgWvxU3EE/MlgUXzrCEVZzuwK41wrd36mars6BF0ZIZ3dPRWjPp38Asg
   Hdl9oSWc1qGWh56NFmRq3nedW5IxFipvtJ9mFFyixq8ctkfHYjSPz8WYL
   7iMY/1a8+fS1BPxSbXLW0oIWRP4Sgue3VgcGEQmvmbH6j3CkZ/STIGzJ6
   fXDH5Gk5fnAaV6G6ej7CmeU8EQEenGWD5smaiMhkW/tS999WtIZw6SRPS
   8Zzh65Jg0OEF3xPIJMcBz3a0HqXmTVEEdUUOZziuT24zXotM9FhDBO7dD
   A==;
X-CSE-ConnectionGUID: EkAic66iRJqovHO6kriOrA==
X-CSE-MsgGUID: IPp8PYU0Suig3w3cq5v4jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="54406004"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="54406004"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 13:38:18 -0700
X-CSE-ConnectionGUID: gFGlh9CzSxWPWWjj2lakqg==
X-CSE-MsgGUID: UrW9XkfnREu9NzDLgn2kUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="143824223"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.223.23])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 13:38:18 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH v2 3/8] platform/x86/intel/pmt: use guard(mutex)
Date: Fri, 30 May 2025 16:37:52 -0400
Message-ID: <20250530203757.190853-4-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530203757.190853-1-michael.j.ruhl@intel.com>
References: <20250530203757.190853-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the mutex paths to use the new guard() mechanism.

With the removal of goto, do some minor cleanup of the current
logic path.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 32 +++++++++++------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index d40c8e212733..c6d8a7a61d39 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -155,9 +155,9 @@ enable_store(struct device *dev, struct device_attribute *attr,
 	if (result)
 		return result;
 
-	mutex_lock(&entry->control_mutex);
+	guard(mutex)(&entry->control_mutex);
+
 	pmt_crashlog_set_disable(&entry->entry, !enabled);
-	mutex_unlock(&entry->control_mutex);
 
 	return count;
 }
@@ -189,26 +189,24 @@ trigger_store(struct device *dev, struct device_attribute *attr,
 	if (result)
 		return result;
 
-	mutex_lock(&entry->control_mutex);
+	guard(mutex)(&entry->control_mutex);
 
 	if (!trigger) {
 		pmt_crashlog_set_clear(&entry->entry);
-	} else if (pmt_crashlog_complete(&entry->entry)) {
-		/* we cannot trigger a new crash if one is still pending */
-		result = -EEXIST;
-		goto err;
-	} else if (pmt_crashlog_disabled(&entry->entry)) {
-		/* if device is currently disabled, return busy */
-		result = -EBUSY;
-		goto err;
-	} else {
-		pmt_crashlog_set_execute(&entry->entry);
+		return count;
 	}
 
-	result = count;
-err:
-	mutex_unlock(&entry->control_mutex);
-	return result;
+	/* we cannot trigger a new crash if one is still pending */
+	if (pmt_crashlog_complete(&entry->entry))
+		return -EEXIST;
+
+	/* if device is currently disabled, return busy */
+	if (pmt_crashlog_disabled(&entry->entry))
+		return -EBUSY;
+
+	pmt_crashlog_set_execute(&entry->entry);
+
+	return count;
 }
 static DEVICE_ATTR_RW(trigger);
 
-- 
2.49.0

