Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486087;
	b=o5lSYxlGwSf1Ym27xCRJNtHqoj0qZHMT3FfP8aQRTwlDOP+96ulT+0fpUkAxYvHKEUDs
	 Cl7I5/bZXqlwWDzogShiEneBpx2/J7wQSbAUWkTHCVLNyKrNpFxdN8f3KXgJzwwsu6SQj
	 owbPGM+SV4xE/IyrZbkE+Yk723ryrW5fjDcZyoqsDwKY1cc1UZtPRAGW5s6b1wVgJ2jEp
	 9PAzUYRtoUBmsd3Kt/nWYwlAkga+vTt8qqhuFrEYPc9GnlSbY57gZzelku1Z9laArHswS
	 2nYuRdOgtNSg0pCao38ZCAFEW0OKEFfZAtS/Z4CMb6lblinbcA4zbhMSrJU96K20SvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486087;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zHE1KXB2q/JdQGCUsfq40v7xe4dEzeFr01b+8tBDj8I=;
	b=TaWfwLMw47UUVrtOi/BiJIOUa+GD3TVWAVAf2GK+7++vnYNs/pCPMd7LY92sEVmRksNj
	 w0BkH+RInwDhVibhT0eKlg1ZbcAWXQym5iT2K93EPE6SRwP/vBq/ShEEF8TK5Uum548GZ
	 kEzSvneXle0gZ6zAAV6qo95dqb9sh3UPJ87qQ7snllHdnrUo/HifFFNWubJyqEsTK8wLM
	 CC8bg+2lD6c43MpgGD4mnXKDQmnmgxXQyr2UAExKFLcjBcHcPHiLSCY7utOkWURUesxjy
	 zp6G5Zycbojl4GBP8TIVf2rhFuyHVF2jBFGXMm0h1XIJo36jEDleJib9zJVYHiIDmMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MgAa0okK;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8438606A321
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 02:08:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8438606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MgAa0okK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795486087; x=1827022087;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=4xF1evHpyznKiMIzsTeSc2qiff37ofUk6whKxWvMSsM=;
  b=MgAa0okKFoToRh7GUBZoxiOXVaOdaNJGTUOfITRlyOp2MnWdTZxwupAT
   8CmsxmGIXTqnCjZvhul22l5GXXRFYJp3kIDeJbY9VwIOCpgl/cSSuMY/v
   qLYqmfTzqZq+0wZ4Ai8xBegmLov67GJWMu6sQFg+2ByWuMOJR+3JuRjYj
   1jEkOeU9N2cbiD2EsuPGeLBRY3c+cHMHsPORy2b0GYwDvqT85iyaI7o87
   IJ12joAKFuYWGapvpjsCLGaCVI2hNIxKyQagr+g7674F3ok1dHV3bW8sN
   eIKKiuMc1M60O5mjNh4Xrbf/A51Jq+W/rCfI/TJ5hvotQJDLwOFi/lr8Y
   A==;
X-CSE-ConnectionGUID: mju1ccBSRkCfCGAwhgqg9w==
X-CSE-MsgGUID: Kkr1wvkDSlSnOdwTR3sxNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4153530"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4153530"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 18:08:03 -0800
X-CSE-ConnectionGUID: SD/burjBScuRO09y6SwDxQ==
X-CSE-MsgGUID: HKBvVTWFSu+RiJ8LbZLPnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11621433"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 18:08:01 -0800
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
Subject: [PATCH v23 10/19] drm/xe/vsec: Update VSEC probe order
Date: Mon, 23 Nov 2026 18:08:02 -0800
Message-ID: <20261124020752.30551-31-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124020752.30551-21-michael.j.ruhl@intel.com>
References: <20261124020752.30551-21-michael.j.ruhl@intel.com>
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
index eafc66d686e2..e9a9634744ae 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1092,6 +1092,8 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
+	xe_vsec_init(xe);
+
 	xe_debugfs_register(xe);
 
 	err = xe_hwmon_register(xe);
@@ -1102,8 +1104,6 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_hwmon;
 
-	xe_vsec_init(xe);
-
 	err = xe_sriov_init_late(xe);
 	if (err)
 		goto err_unregister_hwmon;
-- 
2.43.0

