Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103696;
	b=XU8jFfeTOpn4Ky082m71A6KZB2dGYx3fuBtyijj3CgvIgisKbMvHDZLgh6yVO1VtTj+j
	 1P8k+GQXOE/eFm0WTr8LHZO4igaqmSicGUBOyo03PfIkMomPjjsV/AzR1poRlhOmxTDXm
	 Ku0yujOfb+RC5+ueEGTdxnZV1tOHcLkAem7CrsCIh3xVO37EO9OLzVDogRFUL+NXgPcx3
	 7/RnxFeb73eSBtykewZZc6oM7YU5AaIWoaBlSvQJPceYZ07AUpeZUWYnKIQ21OIEdSs1t
	 okXeUVa/NgzIXo8quzqflrdlb0/AG9MACVBppFthxZ85jOwNizTtqbbybkPESUdzqwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103696;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8tJxo1k4F6xf8gVL51rzG+x2tFlwx0r/UVyY5MAn2V4=;
	b=HRoMQHGlfPiBYak0zmwyuDl9cGgrAOQRhKVlWkay8DX0tgpQQb//LAdOuMu0GcagMQ6A
	 v3EgMOP1v38XbQIdAZVihoucIsNJBm5LgasxzzZRhafCFTQ/UP3ST3w2otm7f661BBNBF
	 oNW/xprJTUqP6dZRXTfJN1GyZEeKmEGGu6WVLodVMbjF+fiRiXE4COgg315vVKMaKqOe9
	 0aStLMNppUqBA/1+5JKzo9ILnhu7Lz0R1PmWdbja267FfLQl1yzCwVQqR09uB3n7Owk4n
	 mvoCqjLru3LDrDhP3oNp/oVB8Kvk/tlYd8kokKNHpaJAjpvuZI2hKRowspOF9X8qp9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HB0D1Ddk;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1B2606A337
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 15:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E1B2606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HB0D1Ddk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795103696; x=1826639696;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=rayEZ0+oT/Iyk+FY8Hj0Rn8qFu76Ec9MdIYQCC7fDsI=;
  b=HB0D1DdkC2KO2wvI2uAgxiGlxZ4FClC1xB+Tl1VFd5Ts9Fed1H8Z9sIO
   4rzlCC37UajWZwhXuM2yRjz3gVim8cRHS8W4TqjSmMHAuX8SK3PsDZDVC
   yk6IAjMyTrRVsP5327+Nzez1KFv3riujinfU5lq7sRQHAWKKKQ/fL58wY
   tbaTjYXXjuWkAMz2Pe6z3RnkCifvc70iW7E8ibxpj6+0o9mv4aRr/azbP
   PwpRpTm+ebD/fUEovtqp36Ds1CwPG5N47wBZJNhWi9N2YgHYNWN97UfbN
   Jox+RJ4r8kydis+CQCIpkh7dInu8Jr8dsSmUtwU7iBzhzYMxDwngR18tt
   w==;
X-CSE-ConnectionGUID: QvDuSL5rQ3q+BCvnEIDvXg==
X-CSE-MsgGUID: G+KVQvKMQD6a2XWuvsiiAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3848963"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3848963"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 07:54:52 -0800
X-CSE-ConnectionGUID: VNfohx3MSY2GSVHKRAe8SA==
X-CSE-MsgGUID: ltHLArEkQSSID6m/SdF86g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10263391"
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
Subject: [PATCH v19 05/19] drm/xe/vsec: Correct locking order
Date: Thu, 19 Nov 2026 07:54:43 -0800
Message-ID: <20261119155438.40762-26-michael.j.ruhl@intel.com>
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

Xe locking order is power state first, and then local locks.

Reorder locking for correct usage.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 178f22db4046..d93c042cf25b 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -157,16 +157,17 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 
 	telem_addr += offset + user_offset;
 
-	guard(mutex)(&xe->pmt.lock);
-
 	/* indicate that we are not at an appropriate power level */
 	if (!xe_pm_runtime_get_if_active(xe))
 		return -ENODATA;
 
-	/* set SoC re-mapper index register based on GUID memory region */
-	xe->soc_remapper.set_telem_region(xe, mem_region);
+	scoped_guard(mutex, &xe->pmt.lock) {
+		/* set SoC re-mapper index register based on GUID memory region */
+		xe->soc_remapper.set_telem_region(xe, mem_region);
+
+		memcpy_fromio(data, telem_addr, count);
+	}
 
-	memcpy_fromio(data, telem_addr, count);
 	xe_pm_runtime_put(xe);
 
 	return count;
-- 
2.43.0

