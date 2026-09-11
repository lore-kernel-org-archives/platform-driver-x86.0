Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FE959B69E
	for <platform-driver-x86@vger.kernel.org>; Fri, 11 Sep 2026 20:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789157531; cv=none; b=gZ8uqb14R5IsrlV3zk0SrT/bQaSs6g+x+2wF9LJabQRJ53TxF/IUfRAXMc9ALv6pTdJy2TVoSbkem0lkCCsohxvqBgssBVKCwjEflVEXkZH7e+l3+RypNc6Y3w1w3/6jJ2HWcFM1I3fj/YD6D/C0CN26uNa5kaRRvaf+eoJB7Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789157531; c=relaxed/simple;
	bh=YlljUlfYK6ql8aglTP+s8zYB492b5ToRyyIJDOqB8ts=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WWXLwZHM4LX25KBNPstM6CLs/mknDNq7MJmc27Xm8KxR7WLusdsrbsk7z/z1iv9OUj52AZMyEbPtxO06b7P7A/1a200weVCkGjZtgtVtb9jMbXt106znTVH/0+4FTjOjFTMiTYg9uQWowFPmpwlpRMbLQNnEaAtwu6VtOl3MnRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JX7ZqQ40; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JX7ZqQ40"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789157528; x=1820693528;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=YlljUlfYK6ql8aglTP+s8zYB492b5ToRyyIJDOqB8ts=;
  b=JX7ZqQ40v4iqJ0T7SmlaZuQh8xaykY0zJOtgARMalt5aOiTTIq+GxpdW
   bI2S5pfrro1xTNDrfnBRkB9YUvtY4ouAmyukzpedG4EvzjO1b2eOqbeVu
   O2Yzmd1MSuy8aSmbiTJa9kweuDesvzpwRXANN0JNFLlmJuLa4yW79pBoL
   H2teF+WcBJXUXpTSTkJ3U9UVTZO8UL0I9dHKn059vBKIKY/k0IYCM+tXk
   DOxmsEA73fZg0JxPgKDEIyHHKeEcoiPuQ7MrvG+28NbTOGLBzQ3QyXLab
   3efaUjGfi0s0x5/uPSfyEXflT09z4SJRSa4YVVIx7AsH2XKFmr2d3jh/a
   A==;
X-CSE-ConnectionGUID: /qTJyICVTRCWXuaQG6nqfw==
X-CSE-MsgGUID: iddIPJezSOyWdaZyOEsWIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="115162382"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208,146";a="115162382"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 13:11:59 -0700
X-CSE-ConnectionGUID: b3ggMJDISSimOFTP3H7CBg==
X-CSE-MsgGUID: eYwS8hodQy6HQVMrtAmhRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208,146";a="277272085"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 13:11:59 -0700
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
Subject: [PATCH v8 06/20] drm/xe/vsec: Do not register BMG PMT for VF
Date: Fri, 11 Sep 2026 13:11:54 -0700
Message-ID: <20260911201148.1610547-28-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
References: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

BMG PMT is not supported for VF nodes.

If IS_SRIOV_VF() is true, do NOT register with PMT.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index a9baf0bfe572..71bc359b2ad1 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -149,6 +149,9 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 	u32 offset;
 	int ret;
 
+	if (IS_SRIOV_VF(xe))
+		return -EINVAL;
+
 	ret = xe_guid_decode(guid, &mem_region, &offset);
 	if (ret)
 		return ret;
@@ -157,9 +160,6 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 
 	guard(mutex)(&xe->pmt.lock);
 
-	if (!xe->soc_remapper.set_telem_region)
-		return -ENODEV;
-
 	/* indicate that we are not at an appropriate power level */
 	if (!xe_pm_runtime_get_if_active(xe))
 		return -ENODATA;
@@ -210,6 +210,8 @@ void xe_vsec_init(struct xe_device *xe)
 
 	switch (platform) {
 	case XE_VSEC_BMG:
+		if (IS_SRIOV_VF(xe))
+			return;
 		info->priv_data = &xe_pmt_cb;
 		break;
 	default:
-- 
2.43.0

