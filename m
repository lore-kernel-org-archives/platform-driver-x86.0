Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795480749;
	b=z1NyXY/3OeIAg/lbBk/lchKyrbVBFdC+G59JlaenOrPSPohN+kLoe8Wo+D+xLv2KT2/m
	 eKLzDJb/7AlJfQwwMsup9XT4KXouhHc9Zeape1IaP5h7mSh+4nHiQ7tYqAV180fHEB8je
	 465UBqg4OS6Gewf/nPX4Ds5rqeBY8EJXBfeJ8R7Q+6idC/6gQHkFE9L42cePagG/0Pxx8
	 m93JMbsDAP5W5vWvXo4wu8okLIOzdXDXxNCJ4ofGg9iwxaOkE1RMsRa1IxeRLXLwGV/sv
	 jnI8h6/Dz5lOu2BkfLwcyptzYlzxzd/gu/jSbgmxMl+Nn2r87eBANm+15jGAT2GNdvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480749;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7CDbWc2YZjyz6kpfeZ6t6hCc1UwDPPlcoxY8jSmf+Pc=;
	b=aSY8YvJS9Rzpxx5j0j85Tvn9nk7IpITT5wC7zww8MrU/JHNen4CsU/49b3SdXwqQUpyj
	 /Sf9JM1uOdSpjpo4pU3kIM+wBGRfTOXEUEpiGXUfURaNZGn6mrfVOQjzyIoPtLMop855W
	 hclTVRORRhuyyFc7wx7u2Pd1xfXGLOvvCXIC+yVuSx6bUycx5c6kSucr9N/SlMrPu9vjr
	 6cRLINN3TPXQtZ2MKDIeOlEqcyD27ZJlhgooJavgoL0pnSFhA5ThJ+Dmh/v3Cl0EYUHWF
	 M7WZgU59DhXNnO7+ppFKKxvnghLo5xG5JZqEshQEwjoBaYblEiBrtPYR4Z5dDoT/iDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RHlFEL2j;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7C5606A327
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 00:39:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A7C5606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RHlFEL2j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795480748; x=1827016748;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=j0BnPlxq7JEVz6/6T9RbZkc1vLTA9xc7qG1Pv5i3+VE=;
  b=RHlFEL2joHVqDKi76/rAwu6AEbU+wVLoOjEPexxroiEdKL2VSFdmDxws
   PZlTKe+Pci59u3MBDykqK84GFHU9H8dmbahFEWJ9kXyw3tYYtSfc5+uwi
   JW0y9br5NBkKCLUWGS0G5VwGxDnsz2B2VhDqNUQ27G4FgR/ZYJj4RaAIB
   yUxlv5fMsSIoCHZvNHV9drMlkK4oBAGZ8nDQYrpGb1DhtMoT+TwfPiWD5
   gFZdMtiQ/sqK4GHTZkWEmkOkgK1qMab51lBbBPQqvMYoCqArDzr90d7vG
   qbaQSdjoDzJ/FLOmqQ1v8QetQJoDkarsU9FUoRgP0Ffnw/pXr2Wd8omTg
   Q==;
X-CSE-ConnectionGUID: uB/lmPfQR9qpuz4UempS0A==
X-CSE-MsgGUID: SUHuKPR+T1O6bB7/O8hjZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4332837"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208,146";a="4332837"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 16:39:05 -0800
X-CSE-ConnectionGUID: P3SIuDA1RmWME7nQWW8Zkg==
X-CSE-MsgGUID: gRPrbOpXRlSRw2iB0Ahc9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208,146";a="11805739"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 16:39:06 -0800
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
Subject: [PATCH v22 04/19] drm/xe/vsec: Do not register BMG PMT for VF
Date: Mon, 23 Nov 2026 16:39:00 -0800
Message-ID: <20261124003856.4145635-25-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124003856.4145635-21-michael.j.ruhl@intel.com>
References: <20261124003856.4145635-21-michael.j.ruhl@intel.com>
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

BMG PMT is not supported for VF nodes.

If IS_SRIOV_VF() is true, do NOT register with PMT.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index a9baf0bfe572..178f22db4046 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -149,6 +149,8 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 	u32 offset;
 	int ret;
 
+	xe_assert(xe, !IS_SRIOV_VF(xe));
+
 	ret = xe_guid_decode(guid, &mem_region, &offset);
 	if (ret)
 		return ret;
@@ -157,9 +159,6 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 
 	guard(mutex)(&xe->pmt.lock);
 
-	if (!xe->soc_remapper.set_telem_region)
-		return -ENODEV;
-
 	/* indicate that we are not at an appropriate power level */
 	if (!xe_pm_runtime_get_if_active(xe))
 		return -ENODATA;
@@ -186,6 +185,9 @@ static enum xe_vsec get_platform_info(struct xe_device *xe)
 	if (xe->info.platform > XE_BATTLEMAGE)
 		return XE_VSEC_UNKNOWN;
 
+	if (IS_SRIOV_VF(xe) && xe->info.platform == XE_BATTLEMAGE)
+		return XE_VSEC_UNKNOWN;
+
 	return vsec_platforms[xe->info.platform];
 }
 
-- 
2.43.0

