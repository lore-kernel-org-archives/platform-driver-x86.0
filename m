Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486085;
	b=GaeN50377rf46UzwJ2Wcg8xz1AnV9qcN2u2jxzdAwsst2ZLVoKlwhj49E+bRSfcYzXrw
	 Zcbx9S1JZqDBt3lscD+8946JmVL+6AJs2JFg1DvrrcC5Uc2mxxbsCZ7l93aBL8SopAo2P
	 09Uv0AvtVL+IQdy4P/3vm+ZS+S6Co3rs7xmuW1xS4xu1eid3PLc6U9/n1oZaOees3sTXY
	 JvbwhNM4ILKoRvCeHO+si+AarANZvsFGa99bj0V9SIc6U6tpD8B0NPdOGSuvjfI2+mZGM
	 AM8cw7XJZy6ZMCp4dXGc5mH5JRjeiRHcwOmQrXWW84PPGKyWzHtHVWOWsvQBfVXFuPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486085;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7CDbWc2YZjyz6kpfeZ6t6hCc1UwDPPlcoxY8jSmf+Pc=;
	b=y5u3MopYHuYwbFsTRk5OZcWR1vM1uk/kwjYi38xfJoteNL/c+LLDzwtxqxvGsPfAI5n0
	 UzvmlsQw21rK1kpEXojJR62inGAdLiCNGw3wbVS5ueO4WHBdnQDMPqQIggpu2CnHbfR1q
	 eepp5/8dCgozeNQwFvIqF67Vo4MgwCyCbQe/5OVyK5bkGgVt5yr07SLBOgTnhDWn8MqwB
	 AlHdm/IhnRYVyp6LVylIdAGGyqUc8/dMpTZ1uQkt3afA21aVEwxr8D9F9lEmVBCSK92Yn
	 myczvD1bdfPGf3qs11zKEyWNRtIZyRKgSJuuHYD0PPyTUH/AU/JJY8XMrW31H7W6EiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kRvA5cq6;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7132606A32C
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 02:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7132606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kRvA5cq6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795486086; x=1827022086;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=j0BnPlxq7JEVz6/6T9RbZkc1vLTA9xc7qG1Pv5i3+VE=;
  b=kRvA5cq63ancz+kFQB7E+6mVbtaRaJ3X19n02oMIiTiYkFanDbSihLMw
   89PXCvw1wKFSN1sUQ6MRVxGQbZAURgiHh8sKFznZ8F0t5HFQP6X0QVQMk
   1BXKxd+mB3jdBYEABm68GjSyWIlZipSCiRWBcOgfTD7mBeXUONK0BrQsK
   2mDPCgPfH0+TFut41xjUCoA7EmLXuiSGn6yyb0XT7B5c6owhs5dJ0ZwO5
   VDT7bF8sfv6t4TtfXvUzmFTrMCUuYbxb/qt8BS1H+NAJQ4GV2pocskPcf
   7z9siAoTBOnEo4mElUj8CLASL19oORyTBLYfRi5tJdKEbhP7UmHLA3gTY
   w==;
X-CSE-ConnectionGUID: 4nfHMtMcTJSbqcSmchuEXQ==
X-CSE-MsgGUID: Nx57S7ttQfSpxQLg41QSfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4153500"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208,146";a="4153500"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 18:08:03 -0800
X-CSE-ConnectionGUID: c2yUAk+rRlu8u2+CkXoL9Q==
X-CSE-MsgGUID: pbcH5iXBRq+1IJXgIHSAkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208,146";a="11621415"
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
Subject: [PATCH v23 04/19] drm/xe/vsec: Do not register BMG PMT for VF
Date: Mon, 23 Nov 2026 18:07:56 -0800
Message-ID: <20261124020752.30551-25-michael.j.ruhl@intel.com>
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

