Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795480749;
	b=Vis/BjAd1orhILokNn+dYg5TZSlaHNW9FyoUG2UXU7B4kSEdiSp/yZytnDthCiyCXLL+
	 Zngu+ZC9dIZaHp6jzAlu1aImXbVPPBMFZYbKZEnaKSCgPPRprAmt3zKuiAu4Pf3oM9Czt
	 mAYDdplrRlZW8AMYA+iGEJjdaCF0Mw4n5arl1WETPhuvlZH2twa7rhZaHbAZwKihO8Ncp
	 Y6YZNbG8wvFmfaJsVrFXL1BLdpeY4tNoMFurpLDpmHMXLt5LmE3lwrwqcQvQDIIa0CXnY
	 +LEw5LMR6fYlw72R6i8kMxkhmk/daSbgkDbMQkSzRRDN58FiALiTm1xAlxIoUXyigdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480749;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UeFzLJF/W3MP6hnTk/aQJHR5BfAgVR8SrWaZpTCGIJA=;
	b=euQ06EyKyZDZofFNGnwe93NfzOu+DZQlCW+8nSphb35vk8ozDB/DHxPJAJ5+2Xtoo8qJ
	 vNJXtXbSkRp5bWXuuB9QRr8dI/zguPky8OXn50ne7bLT/LeCHou93SyMOsSCCq/bI9dxw
	 KL0dSCKBOfWgovZVlju7zzfSWMCTpErcZp3myrYNiSE7aISCRfvlQWRFv+xnq6ZQFtTdr
	 9gQvshLqLi/n8/PJpwKiMW6MxrS2ubSKaursPJpox6PGHbgoleWJpExBuQdApZJ6uwAUc
	 Jf8Od7S90x5bk3DDFvXWQhmGgaCl1r85G/Xh/vTa2cq66ti9biXFNFJejMa6LbJh0bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="DDNz/tkv";
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13AA606A321
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 00:39:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C13AA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DDNz/tkv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795480748; x=1827016748;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=dFi7+7rVkMJZpmYSBBYKQvigbHpbltpr5YECkuyw3fs=;
  b=DDNz/tkvUlSMPy5xOISRkWrYeWgWfAnV0NeC/Wv3Epgquq1Gap5RSu07
   Yiey023YnG3PGRwG85T2twWiYZOpWdszsyr5vBZZ7H94Nvp20dZVU8E0s
   FtGEAiovLNe2VBDjeeOctE7OJtYIv979hXgebS+q8h4zUDiX7RYhyPKjC
   BsdKC7MnSYB9Zj/LXlUk0eQkqyZj42NEOXJB6ofWe+KjqJzKyFC4q+6vb
   nRWJ3R57Oq3RvKKHwViTmf2BxX8uNpjH3eYDuLwBvUPNqa6i+LBEA2fob
   R/V26MagzfQ8ArKOlQDGA79f95itOs7pXK5XtgSs81JTmfmH1LJ7G51ru
   A==;
X-CSE-ConnectionGUID: QIcLo9PjSK2xd3JIvhb6cg==
X-CSE-MsgGUID: zoMIZLAJQo+fMylcsHMrEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4332842"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4332842"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 16:39:05 -0800
X-CSE-ConnectionGUID: 55U3O0kbQa6EGNQB1l49bA==
X-CSE-MsgGUID: qxjq2ItrSrmkzXXAI5CEVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11805746"
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
Subject: [PATCH v22 06/19] drm/xe/vsec: Use correct pm state get
Date: Mon, 23 Nov 2026 16:39:02 -0800
Message-ID: <20261124003856.4145635-27-michael.j.ruhl@intel.com>
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

Crashlog needs to be collected at all times.  The current pm check
assumes telemetry only.

Update read path to enable device for crashlog instances.

Include check of the WATCHER CAP_TYPE for completeness.
WATCHER is a possible type and needs to be accounted for, but is not
supported.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Fixes: 0c45e76fcc62 ("drm/xe/vsec: Support BMG devices")
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index d93c042cf25b..38081dacd307 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -145,6 +145,7 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 {
 	struct xe_device *xe = kdev_to_xe_device(dev);
 	void __iomem *telem_addr = xe->mmio.regs + BMG_TELEMETRY_OFFSET;
+	u32 cap_type = FIELD_GET(GUID_CAP_TYPE, guid);
 	u32 mem_region;
 	u32 offset;
 	int ret;
@@ -157,9 +158,18 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 
 	telem_addr += offset + user_offset;
 
-	/* indicate that we are not at an appropriate power level */
-	if (!xe_pm_runtime_get_if_active(xe))
-		return -ENODATA;
+	/* Always allow crashlog. Telemetry, only when powered */
+	switch (cap_type) {
+	case CRASHLOG:
+		xe_pm_runtime_get(xe);
+		break;
+	case TELEMETRY:
+		if (!xe_pm_runtime_get_if_active(xe))
+			return -ENODATA;
+		break;
+	case WATCHER:
+		return -EINVAL;
+	}
 
 	scoped_guard(mutex, &xe->pmt.lock) {
 		/* set SoC re-mapper index register based on GUID memory region */
-- 
2.43.0

