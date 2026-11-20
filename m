Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795141186;
	b=H6up46PLMkAwyvlQel6YesgoAfe5XQlckQvBwp73l4Olxj/e7Qgd3p02u2wAYvPlasWc
	 mOGs9e5hsSpvX2WOFAs/qjz7neSXDMvzqp5k4YvHgBdrDBmBB20Bm3YXxwARJBL29SUht
	 nHqGaEP2pLo8Io2/fcmPsgLgREqsZ5QXI+nA3WkQCTHm/BesE8YzcPC/O/TokOxrVWMKs
	 QgqSQ6jcMqyDCSZsryhTdRMeMC0jyriIEnwlGYVN5WVh+KBpCSNBeiKm70imCZiAF6+Dv
	 Lp6D7YCqUqvufRulcWN6gUgzcn2taOqmPYwkP2AI5CwJ4Be8yDusOnOKWarRVdcXV8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795141186;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nAaiMp5jxye3wYCbau8m4lx1LFRUBmG58xsWgWDwahs=;
	b=p9nGYhLMg2aUv8kSqQP6JO1smeblU+moba8e5zcVvldxgfDliel2qr8HJX+rxSzo9/rw
	 IH6MGpBbF8Rv8iFL8nYhqNWcaLMXcByOGMc/cmdILaJaH/rgwTKkaUHfu3hp611rsBrGO
	 KwakQwpI9g6+fGdHjwCgSRcw9emf4ivlC5e+W8Sermp4TPKuiTujV19atHov2N1PcH4Ie
	 k6k2u5T2kM4mZtvR3hOJl9BINmsRzxzShmNn4KOzPfGwySP6fakUbqZQ9X7EevCPFvwB0
	 5VRm20G314dhjJEvnQys6C/O0iZOCu+Gz0o8kP3SO4UDox+8qVzgRvhUnGtifVFykzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EhyPpnEr;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2415C606A320
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 02:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2415C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EhyPpnEr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795141186; x=1826677186;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=9rp74QyDTfCjDpcOMHKQUWyqWQzn+hnKSJBSp5vLyeQ=;
  b=EhyPpnErLhgEu3YLOzMWQ7FVQv6blBDmNoKyIIKdWtJXufvF84slH9cN
   AlbIF8Eptm8zHSKD9GE3zEzLdxwb9Dw/floG+NoRvs6HswbONkKPB/IzX
   BtwdSXL1lGNfdJ1/XpwfefHh5kbdLqsqd/24vnJFPNpeWrZcIsorUlUv4
   T8gogaP06vDDC+1gv6ZAkJtn+WS7xH4UbbBOoIw530aR4SzZofwIkffxE
   rh7BH4f+gl2LMxfgEh9mN/A6wgRwaT8OUDEpCZn/RM1/JHWUebDu+/RRg
   yjOZZD5R/nlyp9MNOngfqdIcR677rNChBnsN5vJwFE+QoM7QFPcFc9kPe
   g==;
X-CSE-ConnectionGUID: w1XbtxOQSHaSCq3mHvZj9A==
X-CSE-MsgGUID: jvgt0OfQREiuaKnRi6YXYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3898437"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3898437"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 18:19:45 -0800
X-CSE-ConnectionGUID: I0s91TonRyeiyv4EdsgUqQ==
X-CSE-MsgGUID: 27qxqanGTtiR+uU2HGemdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10487125"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 18:19:44 -0800
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
Subject: [PATCH v20 10/19] drm/xe/vsec: Update VSEC probe order
Date: Thu, 19 Nov 2026 18:19:40 -0800
Message-ID: <20261120021929.473553-31-michael.j.ruhl@intel.com>
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
index f5a581d39c96..ba1f49a56794 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1088,6 +1088,8 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
+	xe_vsec_init(xe);
+
 	xe_debugfs_register(xe);
 
 	err = xe_hwmon_register(xe);
@@ -1098,8 +1100,6 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
-	xe_vsec_init(xe);
-
 	err = xe_sriov_init_late(xe);
 	if (err)
 		goto err_unregister_display;
-- 
2.43.0

