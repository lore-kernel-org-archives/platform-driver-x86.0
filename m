Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF2D3793DE
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 19:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786563480; cv=none; b=q72GCNr9UEVPI//hm5Ta1RPWD4zF20RLgI6GqIC127Ojjd6DftYM9WCYdslNfecfJ2kOMk6bzBdX+aspy7GZUnWl77IbiR5rUCQrsUjrmRi3XpZtg6a4r/8t6sC6mD7ayPS48i/PKitv/3DTiuWwMJzoUDZG93t4DpyGTF6/tjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786563480; c=relaxed/simple;
	bh=IDb6Ixz9/y5Puin5GHNA6oNcgYp9d0JoawAmDv8Dzak=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fwg33bxB8YA/LVUNdXIIzpdtA97NDfCt/T7rW2qtBR7ioNEGs7GPuYR0QPDZG7P6iKqkfs9UJQlRh1S4rmQczoDY2r19WO8sn1kKG7lAq138Mw9sUcW8FBGuJL0sT5AhPiIcmJLo0eKW1IfwTm2rELeDeHGMIMjHpu3JVAmh4Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m4ed8sXb; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m4ed8sXb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786563478; x=1818099478;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=IDb6Ixz9/y5Puin5GHNA6oNcgYp9d0JoawAmDv8Dzak=;
  b=m4ed8sXbakeoR1hZ4ZcZfjDCAhZNhdSWU6K0VXAMNBUGmsHy5ounmo5Q
   9json06XMXoilnZUjv9uW7ixGJ4mlPZUXu5sh9uh1Kvxz9a3/haRU60Ra
   DD+TJGzGkTmL5LiGzQo+/HJhpc/X6h0NREsTEo8AqEwT5dDquVfAb10Dy
   5hopwY+mdLwbqrMUgg5ZuPQWn7GqK4NuH2fapyseBaPBAFfrF0mQ2rjY7
   bV1iSTgKpOTyz8tRlA10qYyUl9bi8pJKTVBDg6HlhMAO4tnYY7S+CXMEZ
   j8Q8hGXjMA05lzhDYAa4y+OC9NmdPd4pde0hmGpX730Gdd25Ue1AE4Poy
   g==;
X-CSE-ConnectionGUID: MeGPwvZxSMOBl26MJ8+OeA==
X-CSE-MsgGUID: BBdBy3ONQ3un4FFOc95BFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="104515375"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="104515375"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 12:37:58 -0700
X-CSE-ConnectionGUID: oZxlQbQTQgybQh0B/Axzhw==
X-CSE-MsgGUID: 6KhLng/MT8+TTxLJMdSfmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="263779922"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 12:37:57 -0700
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
Subject: [PATCH v2 03/10] drm/xe/vsec: Protect against missing config
Date: Wed, 12 Aug 2026 12:37:44 -0700
Message-ID: <20260812193742.2170188-15-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812193742.2170188-12-michael.j.ruhl@intel.com>
References: <20260812193742.2170188-12-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some init paths (VF) will not provide soc-remapper
callbacks.

BMG PMT access requires the soc-remapper.

If the soc-remapper is not configured, do not register for
PMT, and block read access.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index a9baf0bfe572..bd83a33aef6c 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -149,6 +149,9 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 	u32 offset;
 	int ret;
 
+	if (!xe->soc_remapper.set_telem_region)
+		return -ENODEV;
+
 	ret = xe_guid_decode(guid, &mem_region, &offset);
 	if (ret)
 		return ret;
@@ -157,9 +160,6 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 
 	guard(mutex)(&xe->pmt.lock);
 
-	if (!xe->soc_remapper.set_telem_region)
-		return -ENODEV;
-
 	/* indicate that we are not at an appropriate power level */
 	if (!xe_pm_runtime_get_if_active(xe))
 		return -ENODATA;
@@ -210,6 +210,8 @@ void xe_vsec_init(struct xe_device *xe)
 
 	switch (platform) {
 	case XE_VSEC_BMG:
+		if (!xe->soc_remapper.set_telem_region)
+			return;
 		info->priv_data = &xe_pmt_cb;
 		break;
 	default:
-- 
2.43.0

