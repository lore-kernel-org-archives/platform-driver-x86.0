Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC68A3264D5;
	Sun, 31 May 2026 19:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780256788; cv=none; b=HrUoDfrNHcdHTZ4vBkAEHN7D3xrO8nTsjsvGjy8kwd+1Lp2lyw7ykRnB/cE4gNaNm1b5gGF/XpCnv6lopjZX/hVmZzYz0SHalP4Stx/+00LmazXGWeDxwNCClcyD4QeWF8ep9KxzTH4jHj377+KkM9B+1WUzV9HnMYZDWSMoooI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780256788; c=relaxed/simple;
	bh=1P1TwYoDfNLbH+8aR7ieaMCAt4ZRzqB4ux5f50uHvnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W06/5iYuqabwpjms5fOHgtedNSi48F7fvKQGtucT6CQRzEVjpdGbApOJaACP9Z6nEyvRl33qZv9BpxAhrB3u1e5lUw1N2OPJakM3sMS8YdguDGrJN7tErzPqTqFb/R5Pvc0P6XsAVXMaATVmuDR4SWtH1GEGqRpYGoNI8tWvV+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A7lQL2Kq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A7lQL2Kq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780256787; x=1811792787;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1P1TwYoDfNLbH+8aR7ieaMCAt4ZRzqB4ux5f50uHvnc=;
  b=A7lQL2Kqi6pt0ryOxc0JepCcRs1hvNhXh3RR8IyBfsIAd+0Vv3goSFpQ
   ED1S6CI1iuf9CKpq2SoFttg3KeDd4S8HbqzaL9EAGx5uwxtZ/G/sXBNtA
   AL9FH5m6syMCChtT+K5v1Xu4XDy70VZPrNebIA5bvXo9M/d8QlpyaEHSL
   L3moYR8Wa3GzeYqEXFf1OwDbG9C85peN+fCBbamjMzpSrK2WtvmoKulfk
   jckFJA9+tqMB+S1aVhJ44f/0HvaGRi16kcIUJv6i76z2oZDfuK7tj5095
   u0QzFBGnqevl1hdWuW1n9TggwCepcGXyjZuitDGsa/khEFb5LS4XEA7Qj
   g==;
X-CSE-ConnectionGUID: SseYIbiSR4W98Y17xATfBA==
X-CSE-MsgGUID: oM/BRqaZQmiMDXni4kN8/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="80751275"
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="80751275"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 12:46:25 -0700
X-CSE-ConnectionGUID: sT1SAI/MShmDF5CBuPBnug==
X-CSE-MsgGUID: r227P7DqTgWXmHXT+XGbjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="247363892"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 12:46:25 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	irenic.rajneesh@gmail.com
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	xi.pardee@linux.intel.com
Subject: [PATCH v6 02/15] platform/x86/intel/pmt/crashlog: Split init into pre-decode
Date: Sun, 31 May 2026 12:46:04 -0700
Message-ID: <ae0fcc6d633d1f6516034dfcdb5d316c6cd4ba4a.1780248804.git.david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1780248804.git.david.e.box@linux.intel.com>
References: <cover.1780248804.git.david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
---
V6 - No changes

V5 - No changes

V4 - No changes

V3 - No changes

V2 - No changes

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

