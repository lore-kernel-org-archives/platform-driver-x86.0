Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447E3274660
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Jun 2025 21:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749589967; cv=none; b=iuX03Z4fO0ELBopqKgJiWh+0OtVZofPKRhHmyKdfPRURMPIlPYSY9rC7IfDbkxuBOb32vsi9oGq087oa+bMlbBdnTz+pdyUwBXwG+fK4MBpuxmGlNxhVmHQHyFrZ8jiZ4k6HObBxH74GQe3qUO7yD2/0z+e8auy25zcjl87fl8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749589967; c=relaxed/simple;
	bh=Qi8VA7IyqSTyswM7OG5Q49zNovGlyjja/KwiWAM4/W0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e5I/wsJRPyowawKt2t+7rIdLUEiW/qhgwP92HmjJ9NuPNv1nnOVoBmbUAABVtAsP7HSZUuLS19hJoivmmtKaPcMVnmtDi4Xnse9iiWTX+3wDYQ1lhIlDlOXOoBtG+aEBr7jW1JSfaJsXeopZF1Be+US4x2k3bZp3n2MiKuo80nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NlAtq7VY; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NlAtq7VY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749589966; x=1781125966;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Qi8VA7IyqSTyswM7OG5Q49zNovGlyjja/KwiWAM4/W0=;
  b=NlAtq7VYsxlMbSV1RK5Ze3Meb3k6+VOSjQBxXcJfLzCKM/kBUd/csA9X
   lXmCYhpfrlgaXodH+13bVru89iG1BkKWBBUC+unO9rEjk1H2MhagWXMrW
   xCAJnd0M0/5Tc6Cg7nCXXVp/jm49hwo4sz5sI7g++4r9gcErma5pdUq2h
   Rs+qsu5pfiojHeXclUFxi/Lqn3ReFXauiL+yixB9cKjtbyARFCmHAfnU5
   CjXDrkGmvxKQ6x4PjXTKBjdykY6z/a4ZvQ+/BvwdSWc8ocKT+5jMVxOCo
   0IMUKFMoAfvW64Dq4+zRkpwHoJZ1SkJN53AGNFo2v+aTaIdHL38RKJ1/q
   Q==;
X-CSE-ConnectionGUID: EqNc3cmlTJW+norvRCOqKQ==
X-CSE-MsgGUID: RbHmDWXXRYCMFOUg3KSXLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51816905"
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="51816905"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 14:12:46 -0700
X-CSE-ConnectionGUID: IUAor9RlQkSs0x8XYpYxDg==
X-CSE-MsgGUID: 1l4BDihUSXuvH99lSwM6fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="146939737"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.220.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 14:12:44 -0700
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
Subject: [PATCH v4 03/10] platform/x86/intel/pmt: white space cleanup
Date: Tue, 10 Jun 2025 17:12:18 -0400
Message-ID: <20250610211225.1085901-4-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610211225.1085901-1-michael.j.ruhl@intel.com>
References: <20250610211225.1085901-1-michael.j.ruhl@intel.com>
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

