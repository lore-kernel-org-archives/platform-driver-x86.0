Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8C83385B6;
	Fri, 13 Mar 2026 01:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773366745; cv=none; b=dfnPLH4KV/HanLcjp8JYS7JlytO61WuD4gagtIZZM6ARlRtq/FxJJbLPyDocvJ7VI7QlsOYD3z0T0f7RkrjkKo8MupJpHrVf/ciKFyDIdGBYLkhbkGsNgjB9qBRN60yZzuyc1aVAVB/orOfzVCwvzmgZBK9XbimB4wLQT8q2u/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773366745; c=relaxed/simple;
	bh=O6eG7WRWywaqNptPXMPB/TF5fGTS9YsXb2B5mhnJT5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vfgw3cvGxc+laWMeLD7tfQmlGaWsNNVjG2TaToCVphTr9aFYAjFJf4BvKbIRMWjZQFvL1yQftx7PswWxLBdAhoKVLXqYdM1qQvvgu3PYtudWaKKR66+G89Hma5+q30vn2r5fLbJwoFUKSMKS2E2uWawpcigFPsKlkqWwUV5NLyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RaMSO1O7; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RaMSO1O7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773366744; x=1804902744;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O6eG7WRWywaqNptPXMPB/TF5fGTS9YsXb2B5mhnJT5w=;
  b=RaMSO1O7npi1PDF894ULMLEeng2V9KepTQEioKS5GxZoEzJjbfQZFht0
   MG0tx1++61DyIg2CufrQLf1bZizWIEJNyZg3DSLu6+WVbUa1Ilo+bg6Ia
   IfRqg8p6Db2VcJvns1To5yPLY9sFrf2slcGzbvaIlg9Yu/w9uXPLHayC6
   f9aQCyDuNw45GUK0pzcZRpjGmanUZ9IKEXwnK59BzvJ6gAbsz4RJfWlJL
   Cd9Ix5L//RnOQx2WUDMFkqjC/MWcbuOfOBbtM1TIqDe5Ppssqxq5I9P7v
   HQeX5uGMiuQ4NjYhK4S5/h6HG49jXQkPonyjneeKI4G6/XwzOv/fij7fK
   w==;
X-CSE-ConnectionGUID: +yLj5luLRnKOajRTVC2pUQ==
X-CSE-MsgGUID: y3fm5yhISUiy7KkBawIwyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74354564"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="74354564"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 18:52:12 -0700
X-CSE-ConnectionGUID: TMsKAeUpRUGaCXxJQ1roKQ==
X-CSE-MsgGUID: fK7N8ixzQC6dsd5yXu8hYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="220108490"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 18:52:12 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: thomas.hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com,
	irenic.rajneesh@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	srinivas.pandruvada@linux.intel.com,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	xi.pardee@linux.intel.com
Cc: david.e.box@linux.intel.com,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 08/22] platform/x86/intel/pmt/crashlog: Split init into pre-decode
Date: Thu, 12 Mar 2026 18:51:47 -0700
Message-ID: <20260313015202.3660072-9-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313015202.3660072-1-david.e.box@linux.intel.com>
References: <20260313015202.3660072-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Refactor crashlog initialization to use the PMT namespace pre-decode hook:

  - Add pmt_crashlog_pre_decode() to parse type/version, select the
    crashlog_info, initialize the control mutex, and set entry->attr_grp.
  - Simplify pmt_crashlog_header_decode() to only read header fields from
    the discovery table.
  - Wire the namespace with .pmt_pre_decode =3D pmt_crashlog_pre_decode.

This separates structural initialization from header parsing, aligning
crashlog with the PMT class pre/post decode flow.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x=
86/intel/pmt/crashlog.c
index b0393c9c5b4b..f936daf99e4d 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -496,11 +496,9 @@ static const struct crashlog_info *select_crashlog_inf=
o(u32 type, u32 version)
 	return &crashlog_type1_ver2;
 }
=20
-static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry,
-				      struct device *dev)
+static int pmt_crashlog_pre_decode(struct intel_vsec_device *ivdev,
+				   struct intel_pmt_entry *entry)
 {
-	void __iomem *disc_table =3D entry->disc_table;
-	struct intel_pmt_header *header =3D &entry->header;
 	struct crashlog_entry *crashlog;
 	u32 version;
 	u32 type;
@@ -513,6 +511,16 @@ static int pmt_crashlog_header_decode(struct intel_pmt=
_entry *entry,
 	mutex_init(&crashlog->control_mutex);
=20
 	crashlog->info =3D select_crashlog_info(type, version);
+	entry->attr_grp =3D crashlog->info->attr_grp;
+
+	return 0;
+}
+
+static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry,
+				      struct device *dev)
+{
+	void __iomem *disc_table =3D entry->disc_table;
+	struct intel_pmt_header *header =3D &entry->header;
=20
 	header->access_type =3D GET_ACCESS(readl(disc_table));
 	header->guid =3D readl(disc_table + GUID_OFFSET);
@@ -521,8 +529,6 @@ static int pmt_crashlog_header_decode(struct intel_pmt_=
entry *entry,
 	/* Size is measured in DWORDS, but accessor returns bytes */
 	header->size =3D GET_SIZE(readl(disc_table + SIZE_OFFSET));
=20
-	entry->attr_grp =3D crashlog->info->attr_grp;
-
 	return 0;
 }
=20
@@ -530,6 +536,7 @@ static DEFINE_XARRAY_ALLOC(crashlog_array);
 static struct intel_pmt_namespace pmt_crashlog_ns =3D {
 	.name =3D "crashlog",
 	.xa =3D &crashlog_array,
+	.pmt_pre_decode =3D pmt_crashlog_pre_decode,
 	.pmt_header_decode =3D pmt_crashlog_header_decode,
 };
=20
--=20
2.43.0

