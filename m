Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F67F2741C9
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Jun 2025 21:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749589973; cv=none; b=HqwRMS7kwx54JoqkvfGrvwDp9UVH7BB5i4+J2HXpx725aWvlUg9ZwEbZYeCgo/AA5REW9NbR7SsFfAdI66N4F4c3q+i1Y62f+xxc5r7pY4PmhjCIraoN7bFcXGvaBhGDyD0j3cd4HPIIfcyugavfIyifCsdGDAH2wJle1dKOAx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749589973; c=relaxed/simple;
	bh=pOIDz017sJBbK2oIqU+tLFCqZZU2v13L/TTfFRtl5wU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bTDDnt1wKtUauHrFY9NxDY6R05qHJnP84zcodSVSpMivBlxEEsOPGbsR+mSZS6z5kwKkJbMUp3I9CEabFXMiroWkL/yhcu/KxtBD5rs9sz+Yj4G0OVnJBXe+R9N9TGGrGQTc9v00oJtbYvMpbl6l1Ts/fL1u84E+wjPJORFzpbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DjW/CTsH; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DjW/CTsH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749589972; x=1781125972;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pOIDz017sJBbK2oIqU+tLFCqZZU2v13L/TTfFRtl5wU=;
  b=DjW/CTsHi3o3bDkRe/neCc9PYs3diWmsEe9ImbSXq+YC9WTpGMK/WFEs
   bkzPZPoihUIEezfSfzzw0+LaEkA8FPOWherjDTklwOI/EgWs8VV0ZZQEw
   l3hiUS6QLMTTooOqokZ1yWifQUEVwBEi7VuA6VefzERuiFBoC8hhcUmQW
   x34pZXoO3ZQ6BZHawWdZqaFNqS1HglfR/Bkthgnp4i8Srr28EtGmB+NNs
   9aW6OhRgmGPWKk8dPhD5QK/dbvujVHnMTkWNnWYIZ0bmhQD2piSAXvLNc
   gUJIhfdBlDnwjQzyQt3SStvGgunR00e4OEwEV/N7CcN2Rlp36VleC2zZk
   A==;
X-CSE-ConnectionGUID: EKF3GMgST0GV2YsuS0ixiw==
X-CSE-MsgGUID: AWRe7WpQSV+UN7bI3xanUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51816930"
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="51816930"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 14:12:52 -0700
X-CSE-ConnectionGUID: m6MMw7XURsi92/gCSOTESg==
X-CSE-MsgGUID: Y9BlLX7QSHKkBlFwRSpVaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="146939800"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.220.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 14:12:50 -0700
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
Subject: [PATCH v4 05/10] platform/x86/intel/pmt: re-order trigger logic
Date: Tue, 10 Jun 2025 17:12:20 -0400
Message-ID: <20250610211225.1085901-6-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610211225.1085901-1-michael.j.ruhl@intel.com>
References: <20250610211225.1085901-1-michael.j.ruhl@intel.com>
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

Reviewed-by: David E. Box <david.e.box@linux.intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index 1525e702e993..3d3b72451c01 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -192,6 +192,10 @@ trigger_store(struct device *dev, struct device_attribute *attr,
 
 	guard(mutex)(&entry->control_mutex);
 
+	/* if device is currently disabled, return busy */
+	if (pmt_crashlog_disabled(&entry->entry))
+		return -EBUSY;
+
 	if (!trigger) {
 		pmt_crashlog_set_clear(&entry->entry);
 		return count;
@@ -201,10 +205,6 @@ trigger_store(struct device *dev, struct device_attribute *attr,
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

