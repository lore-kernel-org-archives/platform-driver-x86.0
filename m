Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1657218845;
	Fri, 15 May 2026 00:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778804509; cv=none; b=jgAIy5zEO5Eg9E7pCM/2DcxaotKIpwG0m1mddklKYe7Hm+z/LPXVXoC76vcngvF3JWvlkMfDW2mQX5sJvELobtLUb41N/qevmSJd0pRw4jnpHUX4dby0GcfobifujwSunNhcjQ1ZKbq6/mhn/rvyOrwc1jKGFZevbjGQ2BGNQtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778804509; c=relaxed/simple;
	bh=krxuhetD5zCg7m2JjokwK3bkS2gd8lTKar82wllleUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KdfrU80lMH2/cpWpMYZMoOu17ZGw0omIXEp1PuiSpT+5oLBKtWyJFYECsXq1YFkdQw8TnMDP0RvFr20Nk/k46a6IwwaYCpst6feZm7BKA8XcpurlUXGLVbxmA1uuEAdJND71qnHzcvdZ50nj19g4Ho/stxIZxK6LOhST3XS/9Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bpHMmMZ8; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bpHMmMZ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778804507; x=1810340507;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=krxuhetD5zCg7m2JjokwK3bkS2gd8lTKar82wllleUs=;
  b=bpHMmMZ8oYoMUSbH7ZXR8bAPYZKwunm7i46fbYkgDBa5p9soJTuVnx8c
   t8ffKSw1I9f1GRiVsuh1+uP3TJNXKxtMrG6SLV4xrCjbL9Err+RjoggGZ
   h2lJaHIWRfVEcXUJZ7fJEicqbqYi89EVyCzsAySDD73/Vi5LRQJeb1o4D
   s8uZHB4uM01RT9CKbtOccIAq3Oql8QJEBy2YdBIv/FOPhkhYogZyG1FrX
   jQttfKeBPej2syf5wN1Ye97Ko7mDR9apCeO3sHUWEuvKXmZIkBjuxLED7
   nDmQ5re5ULrbx/5TwMa04q7qvtEk7+O6lAP9Tcj49DlmrEYa/zp/IvkDq
   w==;
X-CSE-ConnectionGUID: 2lGhBdpCSwm6865hMW9Kmg==
X-CSE-MsgGUID: AO7V0DNSTM+jTDKop2ip/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="78895151"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="78895151"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 17:21:44 -0700
X-CSE-ConnectionGUID: 4m1gYqW6SKGwSwmelDMzLA==
X-CSE-MsgGUID: 1uMMUiBdRmWDf/cpHe4a6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="242879061"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 17:21:45 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: y,
	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xi Pardee <xi.pardee@linux.intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v4 02/16] platform/x86/intel/pmt/crashlog: Split init into pre-decode
Date: Thu, 14 May 2026 17:21:09 -0700
Message-ID: <20260515002130.701457-3-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515002130.701457-1-david.e.box@linux.intel.com>
References: <20260515002130.701457-1-david.e.box@linux.intel.com>
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

