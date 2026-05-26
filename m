Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4C727AC4D;
	Tue, 26 May 2026 01:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779760063; cv=none; b=uA0U07iDpASp6Z+W2OsLfWIKI3vFDYDIQ7OOm73sv+IKpi6FALGAkD8sQWzc0a86FGKkbYjThO6kTIkj8QDWrm7a47IM8zEb2dOUrNiSGR22cOJc/UnXeQIiR7Eohi41CMxcY42Gez3HSvDGuP2lLziq7kiGI28nXX4bmpxexBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779760063; c=relaxed/simple;
	bh=kz608zM0XMUFOftz7h4Nad7WcR5cOsMteiI1G4z9k1E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LW0wrZFzQjx5LYtWRSm6S7sJMg5C48H2vFpdmCbXeELCrjuCxIMW3kXWcyzMpxQ22m9dY0VO9AK6lIsvkBsOe3ky1muKZWOnSa1x/3bxPgUJcvdfNSCwM0423cGapJIGlMymuSYMp1aEVxhEtAycdH9ef1WEnYcgy36SFtt6OU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B2a2XBW6; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B2a2XBW6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779760062; x=1811296062;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=kz608zM0XMUFOftz7h4Nad7WcR5cOsMteiI1G4z9k1E=;
  b=B2a2XBW67PpANWi6f4vHpIAAMEMfFvRTdCvezssKbejU+5qaj1F9H5YK
   ONuE17wgnlbUbMcgY22TOc8dEZ1emX5WW2dxCRZLJvFoue1/VsNlnPui/
   igiI0CkjVrWiTkGqhX3lY3tDDUPgbPwwcpXVcHX/bGzSJEg2UGEIJUQWA
   pDiKOdyJQM28CswzoQ6jWyNymvbIJgVGQzZ3z4JY6gPKzTJ5N3pnQZqe/
   ksP2yUCbBn1lY+NseQGkI5sI2IGFSCD87TnoJP1+lKJGsbXAl89j6YJy/
   ex4GnPabCCzdQDVBSNjDXLs1l2kMMQwYWWUZp5df0DAyika2Afy50bVYm
   A==;
X-CSE-ConnectionGUID: +LmdaRfVS/214GtYE8/hQg==
X-CSE-MsgGUID: hqjV6Az3S+aM470mROiBnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80539889"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="80539889"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 18:47:33 -0700
X-CSE-ConnectionGUID: 2E19POeJSP60SV9cFObgyg==
X-CSE-MsgGUID: b53EyuKyQmeilOv3i3sFwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="272074971"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 18:47:33 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 04/17] tools/arch/x86/pmtctl: Add libpmtctl metric definition database
Date: Mon, 25 May 2026 18:47:02 -0700
Message-ID: <20260526014719.2248380-5-david.e.box@linux.intel.com>
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

Add a growable container for PMT metric definitions to support loading and
querying hardware metric descriptors at runtime.

PMT metrics vary by platform and are discovered dynamically from sysfs. A
block-based database allows metric definitions to be appended as they are
parsed, without requiring the final size to be known in advance, while
bounding individual memory allocations.

Assisted-by: GitHub-Copilot:claude-sonnet-4.6
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 .../arch/x86/pmtctl/include/lib/metrics_db.h  | 69 +++++++++++++++++++
 tools/arch/x86/pmtctl/lib/metrics_db.c        | 62 +++++++++++++++++
 2 files changed, 131 insertions(+)
 create mode 100644 tools/arch/x86/pmtctl/include/lib/metrics_db.h
 create mode 100644 tools/arch/x86/pmtctl/lib/metrics_db.c

diff --git a/tools/arch/x86/pmtctl/include/lib/metrics_db.h b/tools/arch/x8=
6/pmtctl/include/lib/metrics_db.h
new file mode 100644
index 000000000000..9dff27d8785a
--- /dev/null
+++ b/tools/arch/x86/pmtctl/include/lib/metrics_db.h
@@ -0,0 +1,69 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef PMTCTL_METRICS_DB_H
+#define PMTCTL_METRICS_DB_H
+
+#include <stdbool.h>
+#include <stddef.h>
+#include <stdint.h>
+
+#include "lib/pmt_guid.h"
+
+/* Metric definition from builtin or JSON */
+struct pmt_metric_def {
+	const char *event_name;
+	const char *description;
+	const char *group;
+	const char *platform_group;
+
+	const struct pmt_guid *guid;
+	uint32_t sample_id;
+	uint8_t  lsb;
+	uint8_t  msb;
+};
+
+struct pmt_metrics_block {
+	const struct pmt_metric_def *defs;
+	int count;
+	bool is_builtin;
+};
+
+struct pmt_metrics_db {
+	struct pmt_metrics_block *blocks;
+	int nblocks;
+	int total;   /* sum of all block->count */
+};
+
+/* Treat DB as a flat array [0..total-1] */
+static inline const struct pmt_metric_def *pmt_metrics_at(const struct pmt=
_metrics_db *db, int idx)
+{
+	if (!db || idx < 0 || idx >=3D db->total)
+		return NULL;
+
+	for (int i =3D 0; i < db->nblocks; i++) {
+		if (idx < db->blocks[i].count)
+			return &db->blocks[i].defs[idx];
+		idx -=3D db->blocks[i].count;
+	}
+	return NULL;
+}
+
+static inline const struct pmt_metrics_block *
+pmt_metrics_block_for(const struct pmt_metrics_db *db, int idx)
+{
+	if (!db || idx < 0 || idx >=3D db->total)
+		return NULL;
+
+	for (int i =3D 0; i < db->nblocks; i++) {
+		if (idx < db->blocks[i].count)
+			return &db->blocks[i];
+		idx -=3D db->blocks[i].count;
+	}
+
+	return NULL;
+}
+
+int pmt_metrics_add_block(struct pmt_metrics_db *db, const struct pmt_metr=
ic_def *defs,
+			  int count, bool is_builtin);
+void pmt_metrics_free(struct pmt_metrics_db *db);
+
+#endif
diff --git a/tools/arch/x86/pmtctl/lib/metrics_db.c b/tools/arch/x86/pmtctl=
/lib/metrics_db.c
new file mode 100644
index 000000000000..82e8121a1b98
--- /dev/null
+++ b/tools/arch/x86/pmtctl/lib/metrics_db.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <errno.h>
+#include <limits.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include "lib/metrics_db.h"
+
+int pmt_metrics_add_block(struct pmt_metrics_db *db, const struct pmt_metr=
ic_def *defs,
+			  int count, bool is_builtin)
+{
+	struct pmt_metrics_block *blocks;
+	size_t alloc_size;
+	int new_cap;
+
+	if (!db || !defs || count <=3D 0)
+		return -EINVAL;
+
+	if (db->nblocks > INT_MAX - 1)
+		return -EOVERFLOW;
+
+	if (db->total > INT_MAX - count)
+		return -EOVERFLOW;
+
+	new_cap =3D db->nblocks + 1;
+
+	if ((size_t)new_cap > SIZE_MAX / sizeof(*blocks))
+		return -EOVERFLOW;
+
+	alloc_size =3D (size_t)new_cap * sizeof(*blocks);
+
+	blocks =3D realloc(db->blocks, alloc_size);
+	if (!blocks)
+		return -ENOMEM;
+
+	db->blocks =3D blocks;
+
+	db->blocks[db->nblocks].defs       =3D defs;
+	db->blocks[db->nblocks].count      =3D count;
+	db->blocks[db->nblocks].is_builtin =3D is_builtin;
+
+	db->nblocks++;
+	db->total +=3D count;
+
+	return 0;
+}
+
+void pmt_metrics_free(struct pmt_metrics_db *db)
+{
+	if (!db)
+		return;
+
+	if (db->blocks) {
+		for (int i =3D 0; i < db->nblocks; i++) {
+			if (!db->blocks[i].is_builtin && db->blocks[i].defs)
+				free((void *)db->blocks[i].defs);
+		}
+		free(db->blocks);
+	}
+
+	memset(db, 0, sizeof(*db));
+}
--=20
2.43.0

