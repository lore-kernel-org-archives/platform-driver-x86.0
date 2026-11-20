Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795208160;
	b=TzsDuymoreoZSMXRaj5jJ7wnGZes5x13Jbn3ALoTZNyGQpXmhNjLfw5wqG5uCIZCtufp
	 4dbC8ImxiTVGdRdFrLnueeuHgQAwOq41X//ds+lsJL7z+8nPnbCkemj4oW5DDOaZs3RF4
	 4fxuTr6DQbTGHBd5PHdnUZRbUG3KVAz79ATwEgpoijO9DQX6Qj6dNrlt3I2mQgEjkOK10
	 k4CA2uT5aM8G0KTohIrWBx1oXwo1WclDe4nzIq7xTUeFyneL2Nc4MrN6Iz8WAM6+oNR4h
	 y5a07Jk4K3woX1j44ipAeT2c7vYl4XVfqIJb5amx+2w6hcymOKa3AOsGFCLgqOmBMyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795208160;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UeFzLJF/W3MP6hnTk/aQJHR5BfAgVR8SrWaZpTCGIJA=;
	b=5Bg05lB72pjT86XQp8/AZvm9fu/HAVrj+372IB9Kqnj2CYCVMkopYpacrWXA2tWLLjZu
	 qLS3i/5oElCtMRQ40xcx4Z1FLQXuX/4nD9Q2AvkSKB1Gfwl/6jGc/ATHuSxM909Atw22B
	 QjhSsnASr0bP2Q0U2qseRPvZBmcmzreR+o3lSL5PiKG0315f1kfOOzoC9szYhns+akB2H
	 7X+81nrH/JOEXsJtJNpDFFRJvxlMCdgnvLneCyClbiI10JvYYIy1YxfbAYXh7XFEGld2c
	 lwH+COhnyGVKLewdTghm3ZWsq2RfJ98XdniIDK3uV1pV/bv7qnD+T5Mjyw/RinsDR9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iHhScum2;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF811606A6B2
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 20:55:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF811606A6B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iHhScum2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795208160; x=1826744160;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=dFi7+7rVkMJZpmYSBBYKQvigbHpbltpr5YECkuyw3fs=;
  b=iHhScum2mwW1Kx6KbPcNW/zS5AvuXV1mEb82AsLz2dr9X6GLQOI9Gej8
   UbOBp5DPSMbX/MdPaRpXEDoS8cAj5rOet+q1YQ6jKIgw4VCjFcaYSNi/E
   DrYoqBn/ns2YBlqEDZBa0lREBDX3ZAzJ5LTwp7E/4SMWAcgPekwASNiiG
   mfWWXrzeNGjrp+NPbZOTzJJ9MUHGzVgmyoypZQawSSGgZXLlab/1fVHT3
   7esIYqwT8lJz8hM/rvOf9HdDjn0/UeEksqIHxw50z5oldBOEGXea7AcUC
   wiYT4mMBODxt6npY1mrmGNZRoJwfR1Rv3kNbvGNfcsBWnJof9v71tkjxs
   Q==;
X-CSE-ConnectionGUID: M2OblszWQ6icXddBpQSrAQ==
X-CSE-MsgGUID: SFdhbzcWSv2Tp0z7+geqeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4136370"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4136370"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 12:55:50 -0800
X-CSE-ConnectionGUID: cq8I7Y/JQA2lJ8FjZxFlBA==
X-CSE-MsgGUID: 2WEPMw8LQpmQaOj2V93tLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10908706"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 12:55:48 -0800
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
Subject: [PATCH v21 06/19] drm/xe/vsec: Use correct pm state get
Date: Fri, 20 Nov 2026 12:55:46 -0800
Message-ID: <20261120205540.1220643-27-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120205540.1220643-21-michael.j.ruhl@intel.com>
References: <20261120205540.1220643-21-michael.j.ruhl@intel.com>
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

