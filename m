Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C831C2DB79C;
	Tue, 26 May 2026 01:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779760074; cv=none; b=VHXiT7KFyXf/ksVVJX3RKswkMv/oX/CAD6zIiNagIsxas9U2xy/42Bk61VIHvgsx7R4Dm1LN3zZAojRJa7mo11aIUs2TyW2oH6iX0NFCKb+h58hxi//qw8MdLqF/+6aAvCPmyOdOEvDkXLVKvkUbzTFw/neuUxqUJKxaB0DZpPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779760074; c=relaxed/simple;
	bh=bFKC4tO7+aRb3RQUUeA4nmzXbzCDFwwJEkaI3UdBb+0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=acuokbDxDLTvdQeB14RKoNA6IpjbYBSpTJS5uRtjEQQSs5qGo4g0iOjzHgdWjLQUSZQEANb1A5cpHkqujHrrYwU58cQA53FG7HwimscWTzSKic10B+5UB9PNaqcEPqh7s9gyaZADFICvFHoe+QcB544GayIXcA2UesBZCZ8hfgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DFENOlgk; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DFENOlgk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779760073; x=1811296073;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=bFKC4tO7+aRb3RQUUeA4nmzXbzCDFwwJEkaI3UdBb+0=;
  b=DFENOlgk6IUzrJkLVJSfGkHqgULR5FCOETRH8V51JI3FD5emBOhg+Yy+
   6fo6roQDdmSX7MFakDHGlfqB27Me9GSDdlvf0efaSPB98N3v6o2W4eLat
   dlIPQ7eHF62j6KPhpa6gbiOuQk42bCti5V+ni1MuFW1khl54S03YiSxa7
   CesPycInMzKg6h+/q9CffuP2KfgIaUz5MVxlMtHvx7SfNqtAWPSH1HwvV
   dv9ZgVUFuCInXz8TI4ZuG9RroYw4fX3dM1y6ZWGDSA04HDfYkO/6Lr2t5
   R9PbBPL26y2SiOkEnpWFUeS/IVS6+QxzHktq8M1DPONYIgSN6wkUizPZd
   A==;
X-CSE-ConnectionGUID: 1ZcqtJ/0Tk67cvLRVwjT1Q==
X-CSE-MsgGUID: MSh9G4/yT+yQMx/kPIIweg==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80539895"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="80539895"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 18:47:33 -0700
X-CSE-ConnectionGUID: WDqiSpo+QpKR5Yzk4VWBDg==
X-CSE-MsgGUID: DsEbo01aToSvXxPnJ0MZTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="272074978"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 18:47:33 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 10/17] tools/arch/x86/pmtctl: Add libpmtctl usage sample
Date: Mon, 25 May 2026 18:47:08 -0700
Message-ID: <20260526014719.2248380-11-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526014719.2248380-1-david.e.box@linux.intel.com>
References: <20260526014719.2248380-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add a small sample program under samples/ that demonstrates how an
out-of-tree consumer links against libpmtctl, plus the corresponding
'sample' Makefile target.

Assisted-by: GitHub-Copilot:claude-opus-4.7
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 .../x86/pmtctl/samples/libpmtctl_sample.c     | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 tools/arch/x86/pmtctl/samples/libpmtctl_sample.c

diff --git a/tools/arch/x86/pmtctl/samples/libpmtctl_sample.c b/tools/arch/=
x86/pmtctl/samples/libpmtctl_sample.c
new file mode 100644
index 000000000000..88a12d5c9ddb
--- /dev/null
+++ b/tools/arch/x86/pmtctl/samples/libpmtctl_sample.c
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <stdio.h>
+
+#include "pmtctl.h"
+
+int main(void)
+{
+	struct pmt_global_opts opts =3D {
+		.json_path =3D NULL,
+		.device_selector =3D NULL,
+		.quiet =3D false,
+		.debug =3D false,
+	};
+	int ret;
+
+	ret =3D pmtctl_init(&opts);
+	if (ret !=3D 0) {
+		fprintf(stderr, "pmtctl_init failed: %d\n", ret);
+		return 1;
+	}
+
+	printf("devices=3D%d metrics=3D%d bindings=3D%d\n",
+	       pmtctl_get_num_devices(),
+	       pmtctl_get_num_metrics(),
+	       pmtctl_get_num_bindings());
+
+	pmtctl_cleanup();
+
+	return 0;
+}
--=20
2.43.0

