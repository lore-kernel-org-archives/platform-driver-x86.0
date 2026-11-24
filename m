Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486086;
	b=QKUfqXHg0N5RthGYzlxetDbuz+CQZcXo4OxJ+nFtbeq+/BJdBRLxBiCjR7ku/2BzZYeG
	 F45dGk6K3P9KCXhac3pjLDEGByXK0D/r+yspd6twNcUqIp6lBm6lsMCwnaMeGmN7a3EJA
	 3pDRLsWg4/4ytB8ZPM3IzMqZ24lvFVmOSYb9gBKC9jzfjv3QA6mCqp4P1nH1b26nlLUA/
	 5oUm/Cv0xGsalRA8vRaMxvZ0AB8/GsnzipZ9CdBMzDfLb07QB7w8vE4hdvvoeWU1Eqzyj
	 cfJniQYheaBfM4ZSEUCAWvZTXlq1RPhra6BX1CB1tfqhEHzaeCC1+gGwpP7HfEHBaTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486086;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UeFzLJF/W3MP6hnTk/aQJHR5BfAgVR8SrWaZpTCGIJA=;
	b=uLQB2uBSrn/lbc3a3e64PX/Z1k8cDz8vNcu3EjtC//1CSldYI9xXU/sJJqr27eMlJhyz
	 PfE5zNiF1Zj2DH68A+eyvQf+KXVY7nyAGFtC2qPGrLhjp2ZD1MzsDOKXWBfIMYTcH86lZ
	 zj7FlikBTIjEQslnseZBIk+2Q3uPgK8PzcZMs1tVxrzxm2bm6uFhrCa4IGMT2QweuYIoC
	 CWY2tj/OoJ2h9PE+hGXJhTfXRlZkQi4C/ubuSnK2Q9QqOcIN2nRLv9vqgEM18BykjLmWW
	 k2wyZFLd7av4maoUtSyV0tkkx054KyIauK2EpBMUxMkSiRS4j+iXjxiMK5wUSl7w30g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SP1eaBXF;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCAB606A322
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 02:08:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BCAB606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SP1eaBXF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795486086; x=1827022086;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=dFi7+7rVkMJZpmYSBBYKQvigbHpbltpr5YECkuyw3fs=;
  b=SP1eaBXFhL6Cv5wdxwCuyYidYTaCV6M5bH10VGvjG88fjWnqX+Xuenc9
   ddTYBvtFgI22Qc/DK912kVRJ1GkafzDrjV2JkdXQ7UF3dueeIiM0KuCHN
   Bj8pGxJoyQvT9Z7HGu2aPXjk6JS3iC/gaqG/9jk1ldyNJQzIys1UXZHCI
   rXUT9K1jlcaD0pFzU/YtTutc5DCCGID+A4GOhDB6a82ZpoeyacTpFNo9o
   3WGwy2PJGUaNa615A3VbXs1xc8n1cMc/CXZ8+gPx9rDMXqkXlOcs0psFv
   ua+dWZYDBIAUiVbWa0gCDIvhTmwiWKanLm8lFGzdlkuMNuZENJe0t38JY
   Q==;
X-CSE-ConnectionGUID: xoahSP4QT+SjeHzFf/x33A==
X-CSE-MsgGUID: Zt7crQDGSKyXop8uRGnF/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4153510"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4153510"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 18:08:03 -0800
X-CSE-ConnectionGUID: dKbaZXyLSdiZRL5PVkEILQ==
X-CSE-MsgGUID: MT0PRD3mQy+0dhZqvBjWbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11621421"
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
Subject: [PATCH v23 06/19] drm/xe/vsec: Use correct pm state get
Date: Mon, 23 Nov 2026 18:07:58 -0800
Message-ID: <20261124020752.30551-27-michael.j.ruhl@intel.com>
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

