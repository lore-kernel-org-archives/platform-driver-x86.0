Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795141185;
	b=j8d7bt7myyWQuC24WSOQ7EMFmJj5StKSklSCefnnC0IpqOH9bkuu+ZpfY8xXVXC1nTMN
	 y7F+cuVHJKHplkpJMNVSd+3lMokIE9pl8unsnMDIMYq3/P7XNgFNTRNaoiArUYMZOxIpv
	 0ytvjUXpq7gWpddVOHNPzl+8dSOBKtoMRM4xTl5ifKD72Dlu8Uj65FEtaG3SN1hLBecvZ
	 2YLWh7moA9PDAS0WhpyV2ChDtX393qiFghahVsgEj+Myc6ud+mfQnFSBzmuax2B7DWqwt
	 liDeUiRA/LOJP6evhFN3yZxDHe5Ir0aBQyCqcAeUlQZQHI566DMLWbQRRTi15csMAuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795141185;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UeFzLJF/W3MP6hnTk/aQJHR5BfAgVR8SrWaZpTCGIJA=;
	b=xY0ihQMPXS4l3TT1aTi3oF2SLdyg0fNa16rM41KRJdqFDQ4/vEVVJTinoEPK3JZS8hyJ
	 1VuV3SiSbfiRoA2w67Pf1ETtpwwnT6TjIQVbxDlpOSEriqIo29YeQTH5+bsg8yxB1xlTS
	 XugIgiKmgzL8iq1UJ4PR1R0GzQD5WZg38QdouxmLQqkDLswfqmrGTTsXLd0N7K8siAvpF
	 S2qSxrRLq8oCRriXjXAS8Q61VZ+teLfyNRkGeWNpJLcm4Cr+XO3t0os7dblzi8TN6dKEa
	 bFHteuJKtaQGIt/N8qv2w4RxTIATS5sXwBRI0SyFAThZ2czMk3geqCoE1ek9dZbLyiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="n0P/6x0m";
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47617606A333
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 02:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47617606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n0P/6x0m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795141185; x=1826677185;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=dFi7+7rVkMJZpmYSBBYKQvigbHpbltpr5YECkuyw3fs=;
  b=n0P/6x0mR9hu6K8FYVn+jPrKRIVGL0qvdGTKehoEg8uZbRLF4px5kOFF
   re/OLKM4lb7DPJephBjJHfl+CdMhB7CXPWZUphKhq3QuVSwxIGqQR3xq6
   cV1IiZ/b1icwWqAN2cclmGTstAwBCjLoAO3uZ69nsePc3/QZYRparkAnj
   qk2hqh+PoVghfboSW0fZOWRhTgHOLuim0PRAOEVcUP5yaOhsbKciZr1aD
   KcwUBWtYAfqUau2uC4sn8DWR+PrQo9DUVlfpi0ZpxrfBOa6UbdKxMrvTb
   XkNtl5INBMXB0FB4WBakgsLxowQLuEXOyhAr7m2meiCaVGnJARYQi753s
   w==;
X-CSE-ConnectionGUID: uhcP/p0hTYCIbYGah+lwqg==
X-CSE-MsgGUID: k9q24xAjQruJMIBebXttgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3898415"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3898415"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 18:19:44 -0800
X-CSE-ConnectionGUID: EwQ6iF4pRD2HIbzBBqqkMg==
X-CSE-MsgGUID: G7HVwnhdTf6ylAjZf8ck/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10487110"
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
Subject: [PATCH v20 06/19] drm/xe/vsec: Use correct pm state get
Date: Thu, 19 Nov 2026 18:19:36 -0800
Message-ID: <20261120021929.473553-27-michael.j.ruhl@intel.com>
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

