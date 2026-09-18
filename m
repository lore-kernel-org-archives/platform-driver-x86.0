Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269884F403C
	for <platform-driver-x86@vger.kernel.org>; Fri, 18 Sep 2026 13:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737502; cv=none; b=mXjy7XlPhhx03xLnh4lhweJs5TUvLWCcrsruoxwlkChM8bMTuiEjgEAdGQi2Qq20GhjKz4Ue6aLiXFjUImpWuzhTVnE6Bn4sCyl5bnZEEyNUdJ2AyKGj2s11qMGqj40evPlUSd7apzBuDMMxBgqQCN2XFCN7DUJM/jxssLaPc0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737502; c=relaxed/simple;
	bh=LPGG504LJ3vrcENFvlBo/VSFE0LKRYZg7u6iUu7Y6Hs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m9WU0EoQQHJ1Rz2YPdf8ZukxDlgNfKKPbvAOfvPF5DA1r8Mo8BUd4Fy4BnfMcLcxZuaEbJN90caOS5kGasMe1EJ3kptnkUucCOA6WKZVMKgWA9cSr/Blm/HNalt4w8GBQ+H9H6DpKGH3yyQ0iWxg94zj0j4Alb5HQ8nFPnCyGk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=am3U9VBo; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="am3U9VBo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789737499; x=1821273499;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=LPGG504LJ3vrcENFvlBo/VSFE0LKRYZg7u6iUu7Y6Hs=;
  b=am3U9VBoimGtfz9RjdpKar1/pbHrxnnaqTg7p+gNQ+OfuScWJbQtayXU
   /6nnuAQ+du8hGrIHjcJQXbgmfM3ygARt0EYrtmDJPqPkh9E5gIil+d28w
   F5xysqy1DErNTRoTF5/IM1sqspx6BKViu8jPcRcnWYLwQ0ffvGNMc3u43
   SxQLu452R4QkGcvhV7R5HFyEQgE5orMkdf0PS4HQeyBepawN49N81ySfa
   YQ+oHwVv4RG5ZVdwT9LYeiTMmvYv4Ix8c5B5OkDo5xbvpfXS9hVh2vDMs
   JVKuacxH0bA05OEvEeHOutHeg22xbaZvITDUUYvshVnOx1pB4DDq65BXb
   g==;
X-CSE-ConnectionGUID: q4uPQq5VQr2/eAVmaCRmew==
X-CSE-MsgGUID: Ftv0DtcdQ6S5Lzt9Tu/q9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="89378257"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="89378257"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 06:18:03 -0700
X-CSE-ConnectionGUID: qF2s6mKuSkK+olOtFocycA==
X-CSE-MsgGUID: uixn2awpRjeHHM/lMlVZOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="270095342"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 06:18:02 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	matthew.brost@intel.com,
	rodrigo.vivi@intel.com,
	thomas.hellstrom@linux.intel.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	david.e.box@linux.intel.com,
	anoop.c.vijay@intel.com,
	badal.nilawar@intel.com,
	matthew.d.roper@intel.com,
	james.ausmus@intel.com,
	karthik.poosa@intel.com
Subject: [PATCH v10 12/20] drm/xe/vsec: Update VSEC probe order
Date: Fri, 18 Sep 2026 06:18:03 -0700
Message-ID: <20260918131751.2408883-34-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918131751.2408883-22-michael.j.ruhl@intel.com>
References: <20260918131751.2408883-22-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both debugfs and hwmon access the PMT data area before PMT is
initialized.

Hardwired offset usage allows this to work by accident.
Upcoming changes will break this usage.

Re-order the probe steps to initialize VSEC before the other
features are initialized.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 205cb4e7f9e8..3ec950606e67 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1053,6 +1053,8 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
+	xe_vsec_init(xe);
+
 	xe_debugfs_register(xe);
 
 	err = xe_hwmon_register(xe);
@@ -1066,8 +1068,6 @@ int xe_device_probe(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_sanitize_freq(gt);
 
-	xe_vsec_init(xe);
-
 	err = xe_sriov_init_late(xe);
 	if (err)
 		goto err_unregister_display;
-- 
2.43.0

