Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAB02BD5BF
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Jul 2025 21:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751577149; cv=none; b=Q99EXkg9JT6POkXpAWq0BPmMyjA/7uT0qs+v0TQRo+wdxKFIBqtjOnLEDkx+zCSdvskjFOiP31bJIbQgi57RZDXMAFciMjb3nTkHFbcBhXeWjOYp9g6ujYbIJiDk3N6f2L16fQXkMJon8VS/8ScI2kWk88wyYg9+pJGnPBbQMnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751577149; c=relaxed/simple;
	bh=BJcfpLwdp7OjNfdXNRDZjblDyEz0umlF3JSqpfLr03I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X1UnxoqX4eFdi+DIObXfA9NY/vKSyaveMSmYedrwhTkjzFSQXzCi0eXR/eTPOzKthLClIfaQ3HsJ0WzznnuA/e4u1iI9/Pa1psn6xoVhz55X5z1aavMyqovGy2DA0mtZsKrhNfRxQqutF1qDzWZW2bCiedwQ0VBw3yt7iErjzaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R0I+J9wh; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R0I+J9wh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751577148; x=1783113148;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BJcfpLwdp7OjNfdXNRDZjblDyEz0umlF3JSqpfLr03I=;
  b=R0I+J9whvbZ3kMDfCs1FqXuiQajNh0cbnR3oX7Mk2zcQMy05Mx2B1FM0
   5mWehzn0336+cvJox970wVJJTAWZp06pu4Dh4YX2UJzlK0Z1FcK7wxIdH
   vuiZ/r4fdB5pxOclQqq0HGN8SEnRbS/IwLj10P1h5a71kPbJkqHK5gWbp
   8QvjD8tb8ddjw/EeZaRCtBqU9og1Qj5+1PPiGdzmsB/Oo1BE2xJAWAmkX
   zVhyLZKqyG191GAjctqQEzM350U2npH5Qxy5iY/xF8yKBXwy4nk9Oy594
   jID5AAAzJiHHDU49zwjpyK2BFmCCkuEg7DcunBEuiANXbDo737q9nb0Bp
   g==;
X-CSE-ConnectionGUID: 7VPTi0tlSsaeegf1knyQ+w==
X-CSE-MsgGUID: gXI6wNWTQi+8d3pg0oFVkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="79353025"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="79353025"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 14:12:28 -0700
X-CSE-ConnectionGUID: 4mW19qsKTiKuts+REqAZHA==
X-CSE-MsgGUID: W+Wkk40KRkmUgcsN+zhj2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="154240067"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.223.97])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 14:12:26 -0700
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
Subject: [PATCH v6 06/12] platform/x86/intel/pmt: re-order trigger logic
Date: Thu,  3 Jul 2025 17:11:44 -0400
Message-ID: <20250703211150.135320-7-michael.j.ruhl@intel.com>
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
2.49.0

