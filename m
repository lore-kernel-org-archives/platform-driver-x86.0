Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103697;
	b=LsjhXmzzjg70h8EJCRrlz2axcOnwA+3Wd2DBUUU1a3JDHGUH0ZhuE8SB3J61ssrkypx1
	 GCV8Y3jrceBsniM+z7OnKy+zJ6Gq9BGq2BgaP16m6U3w2hYe961TcLcQ59a3hylQOhxK1
	 dnAqo/SpGsoBmEA4Y8/Rc+a1G9zu7VpzDiHSHt6dSWdaCHuWTRouT04f+rFFIh+0GExJc
	 2GO7gz1hDoHml4q4eWNOB0yzydVdLhXE80YtuV143zWKxRu52GGMSFpQxvxKgM5G5LH8S
	 kMHLqBkFW2eugFlW8nCqF2Vg5eYvh48VrbbobRbK4PN1XXDh0EtyFOH+RQaq1gLZXhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103697;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nAaiMp5jxye3wYCbau8m4lx1LFRUBmG58xsWgWDwahs=;
	b=oecIz+Cd8eayF0Pmz5wF59jWf9HrFh6sdvRdgH+Bs3P+5tACw1zOajhsyTz7JGFxqa0l
	 4WfJnJ/h1ydQFNW005wRprkYs2NHtMm945i2BpGU0Gw03vF2oaSRIY+zbLNe5f4fyiXHr
	 9Zmdo6j6KMsUfGsIjJgvq5QEz/crWG0lvWNSgroIpRN3jyKWsE1bzFPfWrlTdu3gA8yBe
	 ZVe0uHezGjMXAdDMPyxE3ZDgqL5jbQVAna/j1br+95jx0dIihotAFg5ifDXUs3PooePsY
	 uPIovM73VoFpLGsqROJgKeehhS5QiDT2GNjApyooI3Ynnkwx+sWTA0/7BBC4LoQ3AuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Q4puufz/";
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28ACC60A2602
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 15:54:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28ACC60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q4puufz/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795103698; x=1826639698;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=9rp74QyDTfCjDpcOMHKQUWyqWQzn+hnKSJBSp5vLyeQ=;
  b=Q4puufz/5Jc8cetQXV562PJ7CDn6JMaGjw34mfz+TxPGH7R1wekO0v7i
   FoJZBhCETQsAFFagXQo2egqgNi9VWYlhUKxgSKUds2UV8YoRLXtdAXjK0
   u4lPE3US8ANN1wfzOlSbxJCumFUvgPDvRcgo4UQqOCk8akI8lTRmPaz6M
   7GPwrw98p3Pn4LrU2/DJ5khejwKgXYIo/TpC5dbb77eUfBkCCPJidsAL6
   OiP2P/RYjDOCQa/hhxK6jiVF340EtEDvrLhHDcm9foe7t4JfjB9RNgiDB
   lxFvwFTCCKPpOH033mDDmXbaxmGO88WMONOmm6kqAwgi5Ao8VlvNlnYQs
   A==;
X-CSE-ConnectionGUID: dbDjAU57Rdmtf8yhPTn81Q==
X-CSE-MsgGUID: FWdrUZ9OQz+r8I+SKcVHyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3848992"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3848992"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 07:54:53 -0800
X-CSE-ConnectionGUID: c1qOIiOZRDG5KMvHP0rjAA==
X-CSE-MsgGUID: atzNtiaMSUqHmrgBOvQlpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10263413"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 07:54:52 -0800
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
	james.ausmus@intel.com
Subject: [PATCH v19 10/19] drm/xe/vsec: Update VSEC probe order
Date: Thu, 19 Nov 2026 07:54:48 -0800
Message-ID: <20261119155438.40762-31-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119155438.40762-21-michael.j.ruhl@intel.com>
References: <20261119155438.40762-21-michael.j.ruhl@intel.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
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
index f5a581d39c96..ba1f49a56794 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1088,6 +1088,8 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
+	xe_vsec_init(xe);
+
 	xe_debugfs_register(xe);
 
 	err = xe_hwmon_register(xe);
@@ -1098,8 +1100,6 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
-	xe_vsec_init(xe);
-
 	err = xe_sriov_init_late(xe);
 	if (err)
 		goto err_unregister_display;
-- 
2.43.0

