Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103696;
	b=bN4isj3juT7tkgljl5u4FiFgZteYUMPjbVKU0zL32T1jO21+DQXldtRv7HxSEQgdYIDK
	 n2LAGUS/6I3OZ10lMJP0lwFuCo7fPyYQxFm4dINBu8zwswVJCHtATBqrFoala+i9CURwz
	 RxWoXhdqYgkqy8SLd/hJaCIiWqmcgBasy/XbLjfP1SvSMf+0B5/9lDwpGbxXJ4Ljl8Brc
	 xw/d4sWCBRdqsGKRGRdLY2W1aae0qEMzi2ySWEUf+d7tgXkBWQfKDqtFeCEjdaW21u7LT
	 szlJ2uZSC8J2mHaJlrOuAiHToKilDGKY/wwRButfAEV7fK88RxhHU97rB+1yhAvBR5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103696;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UeFzLJF/W3MP6hnTk/aQJHR5BfAgVR8SrWaZpTCGIJA=;
	b=KH5AJ1chqpg3zQ7yLnkPyk0dq7wSdd2ofULErtnWGeTNC6EDXyl7iRgYWcyXQ5DrW7j5
	 OfSeTXqoxaR2whaZtlnwX4fCD9tqT+OU0xFrS17SNsSt0ubsev4xlnGyf9sLeoeNZ6EH0
	 eBEjRKEQALLY+5/ers090vUJy00Isq94YbK+FimC2EQUTr+VmBen4Z1/KSS2WnQgf3IiO
	 gRea6iwmg+UrwCDcMYCTLrCDSEmFGuaExTlWCnnX4C8BjuluFjcbB49ieXQA7Ee+Wqoox
	 tD1Ghg59q1haQFqhZqVeUIfaQ5PPSs+VlH9aea96KZFWAu9stQ+SlUk95eQPZlbq8Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YaG8+eYf;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3453E606A33A
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 15:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3453E606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YaG8+eYf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795103697; x=1826639697;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=dFi7+7rVkMJZpmYSBBYKQvigbHpbltpr5YECkuyw3fs=;
  b=YaG8+eYfJlz0gkBUTZcr7LVWwN9weiW1py6jwDqss5OmnIqc/G/w5BSR
   vvw26mQMw+hZaP8wUsHJlt9ezCZdbyMbjjdG1v3NBoc8tHQ0Kctc0L9Ml
   or1ojDaDuxwDhfjVb+s+9OA8ki5D5v8GkBhEzrFiPfhnxZ3VoR7xulqE2
   lt3bUW4JqXVbMPeCNKuFjB2LYIJrtmS2LNM4H4muFqEXAPG65Lm9WjWqo
   fP1tc/0jeCc4TuX9BFiXcvrdWwawEjcT5cUZ/H4599vjLC09P8PJF7o7M
   XMPeug4C7WUcI218aCMmcbDm8UxI2w0hSORNxyWLuA2wo21kiq/0K0y50
   g==;
X-CSE-ConnectionGUID: O8nacEP1S5+wtRsYQXMVcQ==
X-CSE-MsgGUID: 7Y5N5+LzR2GspSmzZLKShw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3848971"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3848971"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 07:54:52 -0800
X-CSE-ConnectionGUID: wlyK/uyETMm/HeGMONkzRA==
X-CSE-MsgGUID: VuPjJ3lmTFuUt9Fok/3MHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10263396"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 07:54:51 -0800
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
Subject: [PATCH v19 06/19] drm/xe/vsec: Use correct pm state get
Date: Thu, 19 Nov 2026 07:54:44 -0800
Message-ID: <20261119155438.40762-27-michael.j.ruhl@intel.com>
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

