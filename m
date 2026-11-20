Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795141185;
	b=EkHWcF92udny7z/5XKXmje/zRlpyVFXI43gSH096MMoKUwWS8dLwJFULkxgsLopZGDa1
	 F/CHnEjIljgCXWTPXdWsYfcaFzfLteTXRHzYndQIJ9YaKK+dqDcuZ/T1JxCfcl7MR5+Pl
	 nTtgEy2EMngjfW/qGjmKGT+HxWk3A3Wt7luUaVL9BOufoOqaIhUJQNNpj0fJGnhRJkzMo
	 KrUqDsOlS9JJdsefZu5hD1VDjr3V6DF8fO9gQP8wkNHjdpmff8wxIwfvPhMYy3skTYyyo
	 xUYm0XdT1Omh9/VMadFCLT8vfGFmJCgh0H0xlfZwm1QT7AjuQPbLIuL84wrqKvi4rwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795141185;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8tJxo1k4F6xf8gVL51rzG+x2tFlwx0r/UVyY5MAn2V4=;
	b=ekWT55h1tJ8IyL5AOO9lEB2Adrwtq3DJuhtbFYTym1FMdKSdhiXR+VW9n3THXkA4f2FG
	 P8UcymdUWkhvguqQM4nwWXYYaV5nYv1ysMHj04qBhBHQzfTpK9owedyKYzxQ9NyCKNez+
	 0gikHsgvupfB9xTYULB8SgLqNbpjd4DUvpCXkNpiptVSLOLhVXUWpIm/FYaLcBsXHLF8l
	 /PTfXnE1AiQUPiR9gXau7++/CWljc7jtTQcb/2RHZd0AgyhPgnovQbusaoXL0FGoxHaj7
	 5EDh1LC+N65VXZZmq8fvD2xDOV7GJwCNS9XUf9c29iGrs8alzACuuRIWGha7qlsIimw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Mmj/EpMX";
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6208F606A334
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 02:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6208F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Mmj/EpMX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795141185; x=1826677185;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=rayEZ0+oT/Iyk+FY8Hj0Rn8qFu76Ec9MdIYQCC7fDsI=;
  b=Mmj/EpMXyc7lyUld6KKwYGLbZz7NOOKjw/LFl1MXP6Y0UrWuWe49x5Bv
   RYGf/sjGMXDBF86bhOMebVuY0q7cEBpU42ngNFv0m2CjihOGg65zjPPOp
   tzBNpv4MTiKiX8hrtLBXVQjA+reeJuxfxetG2OjGKJh9v38S6/1A/J0Ym
   tZE4bAOcFB5RetBq8e3UnjjeacubmFWBFji4lz9gxgyvm9GgEoq8h//Gu
   +8HjZdftkor0s1uAuvIuMnBzpTY3RWh/SiH4cQaAu4+y88eOUbHM+tqOk
   lb2i/RwnCZl8I2T4qpogsT3CF+AxV9ClQ2XOfU41p0AMlD1coxOE2MWDm
   Q==;
X-CSE-ConnectionGUID: 5sT2ziZnQzadVWZtoGu6Sw==
X-CSE-MsgGUID: Z9CH+6zYTyS7d0oyVwvUmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3898410"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3898410"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 18:19:44 -0800
X-CSE-ConnectionGUID: rkv4Qo29Tci9PnV39aepMA==
X-CSE-MsgGUID: VMDs/t0CQ0i3q3DKNh0JFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10487107"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 18:19:43 -0800
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
Subject: [PATCH v20 05/19] drm/xe/vsec: Correct locking order
Date: Thu, 19 Nov 2026 18:19:35 -0800
Message-ID: <20261120021929.473553-26-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120021929.473553-21-michael.j.ruhl@intel.com>
References: <20261120021929.473553-21-michael.j.ruhl@intel.com>
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

