Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A717A4A2060
	for <platform-driver-x86@vger.kernel.org>; Tue,  1 Sep 2026 19:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788290880; cv=none; b=njLGVBq0d2USG5FG/6vNYjSE3dgOdFNUKbEq8/vhnHKTd+WOtra/6K7UnRQNxn/6FL8TYLJT6mZGfkRk1cKUZXKX7IatDs5BiEc/ZHpoyIBFm/a1exZQjhbvD4CT2OdE0HCJ4zw67YHZ4Y42Tck0f5bgMadTDyO0TWNsBW8XmYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788290880; c=relaxed/simple;
	bh=oyppWImDtwUkPzbq1zVZzOH1dSCrAGMaTRcu6kEKXjc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k/NwpMmZJ+Dlva/qkh+gZ6grSQz2mjx3nranpAOhFmHYilU4CG4xAm2F2ShaRj9F9hiO3FKhj+kh3nozjnU+RKqfgnHUndN8dj7CYcWuw6Qh+rZW0+qpdmZYHXRF8WdMtrwnZuRilK6oUi+KDDh+zYiB9yAnI86keC+olqAI1ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iIYyS57s; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iIYyS57s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788290879; x=1819826879;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=oyppWImDtwUkPzbq1zVZzOH1dSCrAGMaTRcu6kEKXjc=;
  b=iIYyS57sR/i80yGIz+sVhoM2KylOcZKxvIa0bildKFNoVLsOsuecpbCH
   6pRnWWzqix11nuLoBToRAaY/5jzVQwlT9qr1/gfiyhIjaqh7mSOaVerlU
   mPnEdqBRW9hW0h/ulET4R/l8vOKoIL+eIcexUXbv8eFkyl3I2M9ai33Wc
   8yUkExMYsTQFXNhWIMrJg4Y9jryTReTtjNTEgzF5KvHWvJyIuLhDKTqr6
   VXDWWiM7TSco2wXAhTTdLfxsIZVb/uHYppv3eyKEYevl05yNzj+X0NF9P
   b1x5da4ftBJPmPI0O5PlYvqGbVCbZfp7Rjgdep/0w8aXMyEGqZv9S/gv8
   Q==;
X-CSE-ConnectionGUID: 0KJXLy3oRiyPFOa7UIaOjQ==
X-CSE-MsgGUID: z363b+f0TrKebXuEx60AqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88762508"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="88762508"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 12:27:58 -0700
X-CSE-ConnectionGUID: BFeEQmQCQa6yTNs2bVKMzQ==
X-CSE-MsgGUID: Zohw/UAwRueAcCZ6j4XptA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="269776755"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 12:27:58 -0700
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
	james.ausmus@intel.com,
	karthik.poosa@intel.com
Subject: [PATCH v4 09/18] drm/xe/vsec: Use correct pm state get
Date: Tue,  1 Sep 2026 12:27:44 -0700
Message-ID: <20260901192736.626777-29-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901192736.626777-20-michael.j.ruhl@intel.com>
References: <20260901192736.626777-20-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Crashlog needs to be collected at all times.  The current pm
check assumes telemetry only.

Update read path to enable device for crashlog instances.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Fixes: 2c402a801c19 ("platform/x86/intel/pmt: support BMG crashlog")
---
 drivers/gpu/drm/xe/xe_vsec.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index dd7723ba6c1c..468a221378fa 100644
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
@@ -158,9 +159,18 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 
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
 
 	mutex_lock(&xe->pmt.lock);
 
-- 
2.43.0

