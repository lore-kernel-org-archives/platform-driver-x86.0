Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288E037EFE1;
	Fri,  1 May 2026 23:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777677066; cv=none; b=cYP/6jrA6sEwaz+wV/dBCe4/6JOhRdMqh4rT7fa1SVVQsiE78M61OBDsrtQZAr+jF/vNgSpL1c8FlyoC/VD1LfGRZ3mCMFYUDXDXQpfqGOcvYok8oNSKv5WjFoqldkLnFpfTk1T77arkLByu/CAOqdO8IGR+m7kRH/v6kg0IDZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777677066; c=relaxed/simple;
	bh=d3ajbWEClndZEuSRy34LEdzFvzBzxHMs99f4yupyhoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EeGkh0WirfAz5TmPOb3uYLYGucXVuAjDmRo+h/I+wXrRj/2+SJ2lwVX85sxaAZ0gyrWq7vR1Ixw7mpJqQqPSwTO1/2l+kc8ojzmF38s6vJUc2Y+F15v/aP6jKd5qbOcogMDpjK1pYuFqSbEepSCREXYA8VWDxUYPXkeOjyFTV+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J+KrOM7G; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J+KrOM7G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777677064; x=1809213064;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=d3ajbWEClndZEuSRy34LEdzFvzBzxHMs99f4yupyhoc=;
  b=J+KrOM7G3pqnnckUlaV9TkuOu2NqVPY+IZ6v5wKqSsRUDo7kC6UfnnJ9
   gchyYLbB0B8oy54qRUPVLRd9FPnLmQfk9ouZb7OWU7I1dm4lC6YSmei8v
   14RtqTo3OqyixUGQDWF8q2QiyuFAUhSVGcQ6o4xm+/zxW4sotwWYTcfPP
   FfSyZu4PxfpFAz9oD2useDTytglln95y6B96JhChukSMxC/izdIZ63GJ4
   YtDxJsq7qMpxasZ2iAByLZnjwWTlVMkjCTkBoyr85wVLQNXKSS2yYMmrt
   F1FCZ3hwm0DsZYrBIskvxQtoVlkycyvJMumEp3TgiEMFzDSNz7hNW+nc+
   Q==;
X-CSE-ConnectionGUID: yOOLvg3IQBqgGLCppfLyeA==
X-CSE-MsgGUID: 280ocdliSkeBKNRUaGUF3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="78740132"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="78740132"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 16:11:00 -0700
X-CSE-ConnectionGUID: Y1GD7B1gQUulRtS1Wp+kpQ==
X-CSE-MsgGUID: Uspq/I3vSymIOO3WuODo5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="238948958"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 16:11:00 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: irenic.rajneesh@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	srinivas.pandruvada@linux.intel.com,
	xi.pardee@linux.intel.com,
	david.e.box@linux.intel.com
Cc: hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH V3 05/16] platform/x86/intel/pmt: Cache the telemetry discovery header
Date: Fri,  1 May 2026 16:10:42 -0700
Message-ID: <20260501231054.3890305-6-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260501231054.3890305-1-david.e.box@linux.intel.com>
References: <20260501231054.3890305-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

pmt_telem_header_decode() only needs the discovery header dwords, but it
currently decodes them by reading directly from entry->disc_table.

Cache the discovery header in intel_pmt_entry when the device is created
and have telemetry decode use the cached values instead of performing MMIO
reads at decode time.

This keeps the telemetry header decode path independent of how the
discovery data is backed and avoids baking a direct MMIO assumption into
the feature-specific decode logic.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
V3 changes:
  - New patch split out from PMT header-fetch rework to cache discovery
    header data before downstream decode/population.
  - Added to carry the post-v3 bug fix while preserving the original series
    ordering intent.

 drivers/platform/x86/intel/pmt/class.c     |  3 +++
 drivers/platform/x86/intel/pmt/class.h     |  1 +
 drivers/platform/x86/intel/pmt/telemetry.c | 12 ++++++------
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/=
intel/pmt/class.c
index 7da8279b54f8..61834cbe3764 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -383,6 +383,9 @@ int intel_pmt_dev_create(struct intel_pmt_entry *entry,=
 struct intel_pmt_namespa
 	if (IS_ERR(entry->disc_table))
 		return PTR_ERR(entry->disc_table);
=20
+	memcpy_fromio(entry->disc_header, entry->disc_table,
+		      sizeof(entry->disc_header));
+
 	if (ns->pmt_pre_decode) {
 		ret =3D ns->pmt_pre_decode(intel_vsec_dev, entry);
 		if (ret)
diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/=
intel/pmt/class.h
index 8a0db0ef58c1..84202fc7920c 100644
--- a/drivers/platform/x86/intel/pmt/class.h
+++ b/drivers/platform/x86/intel/pmt/class.h
@@ -44,6 +44,7 @@ struct intel_pmt_entry {
 	struct telem_endpoint	*ep;
 	struct pci_dev		*pcidev;
 	struct intel_pmt_header	header;
+	u32			disc_header[4];
 	struct bin_attribute	pmt_bin_attr;
 	const struct attribute_group *attr_grp;
 	struct kobject		*kobj;
diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/=
x86/intel/pmt/telemetry.c
index d22f633638be..953f35b6daec 100644
--- a/drivers/platform/x86/intel/pmt/telemetry.c
+++ b/drivers/platform/x86/intel/pmt/telemetry.c
@@ -72,16 +72,16 @@ static bool pmt_telem_region_overlaps(struct device *de=
v, u32 guid, u32 type)
 static int pmt_telem_header_decode(struct intel_pmt_entry *entry,
 				   struct device *dev)
 {
-	void __iomem *disc_table =3D entry->disc_table;
 	struct intel_pmt_header *header =3D &entry->header;
+	u32 *disc_header =3D entry->disc_header;
=20
-	header->access_type =3D TELEM_ACCESS(readl(disc_table));
-	header->guid =3D readl(disc_table + TELEM_GUID_OFFSET);
-	header->base_offset =3D readl(disc_table + TELEM_BASE_OFFSET);
+	header->access_type =3D TELEM_ACCESS(disc_header[0]);
+	header->guid =3D disc_header[1];
+	header->base_offset =3D disc_header[2];
=20
 	/* Size is measured in DWORDS, but accessor returns bytes */
-	header->size =3D TELEM_SIZE(readl(disc_table));
-	header->telem_type =3D TELEM_TYPE(readl(entry->disc_table));
+	header->size =3D TELEM_SIZE(disc_header[0]);
+	header->telem_type =3D TELEM_TYPE(disc_header[0]);
=20
 	return 0;
 }
--=20
2.43.0

