Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486085;
	b=z5ajA2RUMVE9w8Z+YbO1cvBHoJSJRk/QAanp5eDIxR5QnJYzbrHn6D0Q4KCtUJQxix5N
	 tGSelY3VAqacHYBYp0Id5Bh04b9q0V6kF/OHE5r7BP6x1pEFKeuCLnteA0ka5DktXWg83
	 1/IPQ9LyibXtoEXpk/V7adMoecI7HqTbNGGgq+P5AvLoIWF0eGsODqvpX+75tzllo/JGF
	 av/NHpH+J9O+naGK9npTGK9NnOorofexsl859rNEMqtIJDS7NXxu7FsGrT3u+H/skispC
	 A+uVG63cjakL8i4hRiWthceIDSJV2sSKyavlUHmlLXS2YrsrcSQO/amh80pT22hawdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486085;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8tJxo1k4F6xf8gVL51rzG+x2tFlwx0r/UVyY5MAn2V4=;
	b=fk1FmyF9/sfvCaIed4Ri2+AS2AZhgLcl4yWwL+zkPhdacCHhsE2670NSlsSzvXUqp6XA
	 83lISKwX+qgY5juzlu8BY22fWZCdP81KqzPeFnJlo2dee9B3fzwxRjfdfHDwu8FEFpNqh
	 R+ZmrjZZhbaPZfvtkw9A041GiK1zQtahmbATL+Vh4XyI9AR/xYLyPptFzcDUir6tDAj0l
	 JTJI/K4ugaY3ipoGNKr1phVm8GO0fKpCaxB+64sGVlo9hP9IFSgOft2qNq161v2Lh1kPv
	 eNAjZ2wz+ob3JVPmmppSG9+clbV61faFYqbtSmeuXdnNlfMCnvxFFF9tvlR5+bRa8vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Mp+k3JTj;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3534A606A32D
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 02:08:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3534A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Mp+k3JTj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795486086; x=1827022086;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=rayEZ0+oT/Iyk+FY8Hj0Rn8qFu76Ec9MdIYQCC7fDsI=;
  b=Mp+k3JTj3dENya2OOkj6ZtkoCQKbn+pvuywAeFzIxaqoXMp5nFEXA6+s
   IB2eys+BPuPmx+SpsyOJiPN/yD7RIITey2uYdFe7nt+jr66wq/vdxBpjl
   U8sDHXFII5H1bt67ST8BIqxI6OZDkrMk4OFNtL3/8OXEpvYPtcmRG/ap4
   Z9pzKcTUCk42kyvqHujbASVwWd7tjghAJv6lEQSeOqhMfbenXtb33OHAS
   YqEGUeB8NqiSRM5PaVhqfcEhbXRNCgZD8U0tNB3E/SMQsNpl3zl7GusfK
   8p9JbYkGUd8SlOW7NIJBAuVX1DbeqenQywFPyt4k79qCGn0PkR0AucoRa
   Q==;
X-CSE-ConnectionGUID: xefzyDjcTkexFF59meazRQ==
X-CSE-MsgGUID: qot18kWLTyuMeT4fwOK2ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4153505"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4153505"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 18:08:03 -0800
X-CSE-ConnectionGUID: nu2j6ZmETxe5r9c80x9ZXQ==
X-CSE-MsgGUID: NljMji1VTIGai4UgCHNCiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11621418"
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
Subject: [PATCH v23 05/19] drm/xe/vsec: Correct locking order
Date: Mon, 23 Nov 2026 18:07:57 -0800
Message-ID: <20261124020752.30551-26-michael.j.ruhl@intel.com>
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

