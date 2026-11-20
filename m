Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795208171;
	b=EjJV67V+Egu/xIZbEVePjavqIiXnzA89UPjTti/0HnuCBOAZ2l3Z9amGmpvMAcVn7o3I
	 oXLilmtTtnlqbjUleffevu2p2SnUOIjCPc2+x7YiEMYJ4YNt7JSvtHYB114DenI+/J/Tv
	 ahcggprcmeMMmc+nJlHzKiM5gmBI1b8eFI2v5OLQRdHZwcYE2rVxQ6Sgc3cSpx1vLgyR6
	 8hwNrkoKIOcGGVRY9KLHE/3pWIfBPf5c7/Q5g+003Dv/RtQKy3Nh9cBU6e9FL54p78+K0
	 2kx43M0bGW7uLRefR19eQJzDHGAXtFZ0wXsXe/4VFvcvpGLCN44SDMgH6HDmqU8HGSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795208171;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7CDbWc2YZjyz6kpfeZ6t6hCc1UwDPPlcoxY8jSmf+Pc=;
	b=qPGIchRzf/DEL4qz/fJ5DNpS3sKaKjOhKLIjtrr8KgoYWm48SMN2t49v29PtaHuVdWsR
	 GpWcUkrtomd0ptvPVNmaRzcxGzT4Y7h5GOmycVFJ6TkihA0xFJBEQ3d67ooU+c0Hq637m
	 R5ozofplTbypFjohCJlJxYBa+11tSE8zICbq7jFf0Jfxm4ZLBMWGmK1KK2lJUC9YTjVza
	 18cLgVj+rhqAPef0jlCZWgKD5LuiYbjmlBLtktn0pHMMnJfPwVlTpWoeC3R+1PDgu8Zxr
	 AEfbApqoc82cDRI7zVMZqYbvS/eKgKbCybdT46N0x+tk8nu4miuQENS0L2QnIsGxx/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i5E4A2Uq;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68811606A6AA
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 20:55:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68811606A6AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i5E4A2Uq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795208156; x=1826744156;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=j0BnPlxq7JEVz6/6T9RbZkc1vLTA9xc7qG1Pv5i3+VE=;
  b=i5E4A2Uqmi25E4mk+1+QCL+s9JFE0TzwZnSfmyGQfzAx50809t+f+Y/h
   6Hz/9DZbU5Cs11BTbmegX/Rs9aLp/CN3TVmTEqcRb0/DMw1zlC+Vlfpoo
   V47uQOhBhStdV+wT6PAoDTwDRz1+SASU+VXGgrMOBmbQLiFCvM1HkHW4y
   ci7rN1mulXVt2siFHHTDrr3b816TT4zQd6VyG6rOaqtu2YB4MVnPudbmL
   vTJ+clG61UB0cnbN9WXA02d8CuB5m4JK7rPececVu7OpWXK9Gbc0xo9lg
   TbSA+M6DDT4kfGKWv58vC/pPHvfPCi2xRiFOSuG9F6209Dpbd8iH4nAdx
   w==;
X-CSE-ConnectionGUID: 8sDb6XICR96Ct0HoB7soMA==
X-CSE-MsgGUID: kBkfu94eQ0GJk+4wITjDPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4136359"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208,146";a="4136359"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 12:55:50 -0800
X-CSE-ConnectionGUID: EJh31w8dSoKIWuxGrGWysg==
X-CSE-MsgGUID: tfGX3sF1TWyVR5B0PeTbug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208,146";a="10908699"
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
Subject: [PATCH v21 04/19] drm/xe/vsec: Do not register BMG PMT for VF
Date: Fri, 20 Nov 2026 12:55:44 -0800
Message-ID: <20261120205540.1220643-25-michael.j.ruhl@intel.com>
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

