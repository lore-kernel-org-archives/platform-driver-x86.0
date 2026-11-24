Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795480750;
	b=ElnIzXhGQseMhk/Pplm5ddaCV1dvAnMUwPeszuKNugz0Po5o3Hcj8vqDUrKpblrSD+aV
	 0utid0jD3oVhEobBE4CyDTpWZdiGlZp/6W5z60lN8SrKKdCJC8rFJiTeGemnbJjWeI3Rn
	 QosoWIqYOYf7+LIREkGlJw8xHRZvC+TZ2zVgAQbccB0NOyakCn8roIQfj54rhe/sXfgCs
	 k2JZvbfz4OBIpZc8Rl+boGshBrcYDwYjfjgT2WFYn9oJxzlzbviR4hUCuEVcgwR2+xQyl
	 0vfRLwl+SzzRtHesuxR1vgCRdDSmvDrjVpsq7bZwqBZYvDIHOyGf4gIuE743CRX75Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480750;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zHE1KXB2q/JdQGCUsfq40v7xe4dEzeFr01b+8tBDj8I=;
	b=1vmKAHkP11mTcWhSfvWy5V+w14G9dUfBHP4OtZ3qa5QvMSQ44GLRDWJQS1BjsPCpsfzh
	 vuc7drXLccS22PPBXQQQAPQX7FXpNUOXkANsmHhTScdEIyNTzgDofVO68RzWTnQndWULE
	 l2vAg65bpc0WQDZq5aLmdJvUTGpPfb06lRPkwsFZY4fd41QJzuvanl3RV2/JvRyWAewAl
	 OZ1qSg6DVjZJnW/17tY4Gn6Qqbp4BK6ArGl6HACQfucOI+WNspca8dJ8XrbPoOpKl12g9
	 PaJNbu0wtt2G6R1kPBVmH6FlB0+d3/FBflHz9OxpY3DTFJ1xkwgbHEDANYFFVFrFO0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OLEPINMl;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DCE606A32C
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 00:39:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01DCE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OLEPINMl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795480750; x=1827016750;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=4xF1evHpyznKiMIzsTeSc2qiff37ofUk6whKxWvMSsM=;
  b=OLEPINMle+2eiVT3YV0K3dxJnRdc85ThO2DiYW79Rg916Mmk5he9RLPM
   pwgFlOT1STVxRnoXAQqU0JgeUwmlTt/w+qmqu2gAIm0rl9GsqxEiYA5V2
   6+x9jqYp2hh9ugIFe7+/mFKDwf8oq6CpT3YQ4xOxHOl/tnaIG6u2U/6zn
   YScn/OCh135TCNcv/3MZAfIZm74IZvdZJYB3ydyU8uPQn4cNP0aNMGNgZ
   Zjc7Qg1D2s0E9Ix5JYxzSya1AVGd29Q9WJIpiSY/UFlCu8l3CaMLSKXfk
   YPpMj/TuXAjaT/gjRaPYYeTMMe+7Bd/Objs67uPDM7VkCjRDB5WrtBKDf
   Q==;
X-CSE-ConnectionGUID: y4EtiZD7QfGy7YVsL4IwDg==
X-CSE-MsgGUID: 2TNq97O/SVCi7Bx9WF9CuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4332871"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4332871"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 16:39:06 -0800
X-CSE-ConnectionGUID: jU4f+i68Rd6UGk64LK18Fw==
X-CSE-MsgGUID: TKMXsrg2Qcy35YDW8S6KpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11805758"
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
Subject: [PATCH v22 10/19] drm/xe/vsec: Update VSEC probe order
Date: Mon, 23 Nov 2026 16:39:06 -0800
Message-ID: <20261124003856.4145635-31-michael.j.ruhl@intel.com>
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

