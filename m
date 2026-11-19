Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103696;
	b=rBqa7k6JIkiLaWCZuqOfd5zLeCFHlMqEF8siagwQt4nHH+A0tz5y25kcuiCCcp5Kyp97
	 4fX1F7QjWTnHA2wC7xtx0SuZzq8BQiFbYhO+/esqL6bGELHPIEI5tO3Sk4MZgBf++DqGZ
	 SYkGLpQ2f3jUDICjHKd6KFS28a7X1UJitNUbTs5GQof5Wm9fYGSZlFbVipd7B0wEUAWAx
	 LErQGctkZIoIu0r66M39oePMvSUjUIj7kY1Ewv7bvctvTEmrmC9xZo8DtOSNGQqi1NaVU
	 k7QLHmTboBTnsyBp/ER53XwbcVkTYoUF4uXnxuTUxy3wezEAevs4uPSY54vVAaOlROw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103696;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7CDbWc2YZjyz6kpfeZ6t6hCc1UwDPPlcoxY8jSmf+Pc=;
	b=ZVSpxlHNvODcaSGYaEVQaYmPnh1OC8u9+QSX5DKa0NfDlMTAB3CPr8w3JzKoj9PyT6Ca
	 yqR5xhrf05WGv6a5fBBvAWv753J9YHAjPqaSDju7FfwXa39zUBSNfELSh78mcfxqG7Qal
	 f35nbSNwsSg7yf/MzX/rcDHn+Zwy4OFRgJufz8z1zG6ZaQl8yBRWgb6Gd/zcZIx8ZE1pw
	 5UPV13pWrLnGplNSJySVVtH6G8Y3J2QGB8/j8/kGuuC1h8+YnPTD4G2wN6pkiLwUc1EJs
	 h4vGA12mWKOg19DkgQIZHXA4NSSCsqhHzyRWjCtOtZlw0tRDJWqv9ZeHuXbnoQp8FHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ko8R7cPZ;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C7D606A330
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 15:54:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55C7D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ko8R7cPZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795103696; x=1826639696;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=j0BnPlxq7JEVz6/6T9RbZkc1vLTA9xc7qG1Pv5i3+VE=;
  b=Ko8R7cPZde6ph3AFykizwSRBA+PF9+fuPENgY9QjSR2tssPSaEMKJVU+
   xJyEOJwvBGxFIPJLPWfI6lkNnlDFqYmAQHn5jS2NfYP7y0CWeNVR4or4a
   WthUaZSJNCal4pvXhY+YCCOLlu5qkcyg4UaW/gKka5XyJcOwLx4vvujxt
   hMJkxxtQl/wyloUivytQCdxT+kiLx0Fr1hoUJDSLKWZchHoGmMRCJ9Wwg
   Bc7yEshmL56mIzCQmebde+KlP3tX99WHM23xEWhATzUuC0I2gnFV7yQR6
   844NmyKqatMq1pydsX3cLRVN43112aAZjqKRVXlv+YlSQ+TTGVoe7Asjw
   Q==;
X-CSE-ConnectionGUID: X6hLFfYkR+KBH9VoIFwzyw==
X-CSE-MsgGUID: sisO5VoBQqCnQVGLfOfhoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3848958"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208,146";a="3848958"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 07:54:52 -0800
X-CSE-ConnectionGUID: 97Ba04r7TKekgD/SSwiuow==
X-CSE-MsgGUID: p/sS6oY5RgCv4988cAWA/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208,146";a="10263385"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 07:54:50 -0800
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
Subject: [PATCH v19 04/19] drm/xe/vsec: Do not register BMG PMT for VF
Date: Thu, 19 Nov 2026 07:54:42 -0800
Message-ID: <20261119155438.40762-25-michael.j.ruhl@intel.com>
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

BMG PMT is not supported for VF nodes.

If IS_SRIOV_VF() is true, do NOT register with PMT.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index a9baf0bfe572..178f22db4046 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -149,6 +149,8 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 	u32 offset;
 	int ret;
 
+	xe_assert(xe, !IS_SRIOV_VF(xe));
+
 	ret = xe_guid_decode(guid, &mem_region, &offset);
 	if (ret)
 		return ret;
@@ -157,9 +159,6 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 
 	guard(mutex)(&xe->pmt.lock);
 
-	if (!xe->soc_remapper.set_telem_region)
-		return -ENODEV;
-
 	/* indicate that we are not at an appropriate power level */
 	if (!xe_pm_runtime_get_if_active(xe))
 		return -ENODATA;
@@ -186,6 +185,9 @@ static enum xe_vsec get_platform_info(struct xe_device *xe)
 	if (xe->info.platform > XE_BATTLEMAGE)
 		return XE_VSEC_UNKNOWN;
 
+	if (IS_SRIOV_VF(xe) && xe->info.platform == XE_BATTLEMAGE)
+		return XE_VSEC_UNKNOWN;
+
 	return vsec_platforms[xe->info.platform];
 }
 
-- 
2.43.0

