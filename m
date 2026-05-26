Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493312DCF57;
	Tue, 26 May 2026 01:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779760064; cv=none; b=XTo9TXraxqmvuCPwqvWwMJ0KanK3kqBeB+CLOgKNh8BjfPIEiH0mL6KUlPMf03rzmPZOLjiZlesJXzN8qyUB3uK69twLGehTq68NbWCm5SOXsALJNq7XcUTNB50dOd/QbvdUle2cxvKS06Yecvfgsam2icfwRU8HszlG82wF0go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779760064; c=relaxed/simple;
	bh=lp++n971QefDK1N1N6sPS1/lzjrzc5mlVMEZCe13XA8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YI6+BZp6lHj9vHgviuOcGLUsZAbZA+kDU3pheAdTWF9SxArVjg1ZDRGzDXoB97KsKUXulknq1CbCX0Q2o9kd91RjIWrqzhHWksv9LpI+Wd8WT19XZy0uEKg5mmy4u3RfSH30ij9uj8dU4i2EIOPmSFEN24ywvCeEhU73tV/tv5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kp+UmfbP; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kp+UmfbP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779760063; x=1811296063;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=lp++n971QefDK1N1N6sPS1/lzjrzc5mlVMEZCe13XA8=;
  b=kp+UmfbP0ABYegWp7HzWiqgCK8BJQjHiMS9g+em7zteBcXnsf5LM2/3M
   IFueksDrdPJKpRg1GFudnpdSjp7AtzGEwyJuzZ+ZDGEQrjfItYpBL8tSX
   MjZ/JENgl0prX6dhbStn9UN49KSjMj6IuSzbm97CQMto7KuR7GOfdHs2m
   OXm6du/INmTTWeVRlAQyV8fILmtiom6QoVm7fzCoFmqHOg68q7MAbwvNe
   BOGty7/uOpnMh5UYJ/nuFxuUmpHeMO+/oq+/2BXF3oeSxKnzrCMM7NH/N
   LhkoTvzve/dm+6wmRI/bXmofFSQlxnFmZ9d2s3Cm0lnmjUoYNl1DG9V9b
   A==;
X-CSE-ConnectionGUID: Bxgq6BWeTcaOA8P3MGj+Ig==
X-CSE-MsgGUID: KANTUpviTKChk/Jm0UMhEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80539891"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="80539891"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 18:47:33 -0700
X-CSE-ConnectionGUID: TD44fPBaQY283gxl+clNkQ==
X-CSE-MsgGUID: v7qOdjZbQMGqkYINQYen3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="272074973"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 18:47:33 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 06/17] tools/arch/x86/pmtctl: Add libpmtctl built-in metric provider
Date: Mon, 25 May 2026 18:47:04 -0700
Message-ID: <20260526014719.2248380-7-david.e.box@linux.intel.com>
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

Add a unified metric definition provider interface to libpmtctl_core,
giving callers a single entry point for loading PMT metric definitions
regardless of their source.

pmt_metrics_load() abstracts whether definitions come from a built-in
table or an external JSON file. When no path is provided, the built-in
definitions are loaded. When a path is provided, loading is delegated to
the JSON provider when built with HAVE_JANSSON, otherwise
PMTCTL_ERR_UNSUPPORTED is returned.

Provide a stub built-in definition table so the library can build and run
before platform-specific definitions are generated. In that case,
pmt_metrics_load() returns PMTCTL_ERR_NOMETRICS, allowing callers to
report a meaningful error.

Add the remaining build-system integration in a later patch to keep the
library split into logically separate changes.

Assisted-by: GitHub-Copilot:claude-sonnet-4.6
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 .../x86/pmtctl/include/lib/builtin_defs.h     | 14 +++++++
 .../x86/pmtctl/include/lib/metrics_provider.h | 21 ++++++++++
 .../arch/x86/pmtctl/lib/builtin_defs_empty.c  | 13 ++++++
 tools/arch/x86/pmtctl/lib/metrics_provider.c  | 42 +++++++++++++++++++
 4 files changed, 90 insertions(+)
 create mode 100644 tools/arch/x86/pmtctl/include/lib/builtin_defs.h
 create mode 100644 tools/arch/x86/pmtctl/include/lib/metrics_provider.h
 create mode 100644 tools/arch/x86/pmtctl/lib/builtin_defs_empty.c
 create mode 100644 tools/arch/x86/pmtctl/lib/metrics_provider.c

diff --git a/tools/arch/x86/pmtctl/include/lib/builtin_defs.h b/tools/arch/=
x86/pmtctl/include/lib/builtin_defs.h
new file mode 100644
index 000000000000..432e4d87d0ac
--- /dev/null
+++ b/tools/arch/x86/pmtctl/include/lib/builtin_defs.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef PMTCTL_BUILTIN_DEFS_H
+#define PMTCTL_BUILTIN_DEFS_H
+
+#include "lib/metrics_db.h"
+#include "lib/pmt_guid.h"
+
+extern const struct pmt_metric_def builtin_defs[];
+extern const int builtin_defs_count;
+
+extern const struct pmt_guid builtin_guids[];
+extern const int builtin_guids_count;
+
+#endif
diff --git a/tools/arch/x86/pmtctl/include/lib/metrics_provider.h b/tools/a=
rch/x86/pmtctl/include/lib/metrics_provider.h
new file mode 100644
index 000000000000..efe9bea817c8
--- /dev/null
+++ b/tools/arch/x86/pmtctl/include/lib/metrics_provider.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef PMTCTL_METRICS_PROVIDER_H
+#define PMTCTL_METRICS_PROVIDER_H
+
+#include "lib/metrics_db.h"
+
+/*
+ * Populate @db with metric definitions.
+ *
+ * If @json_path is NULL, the built-in provider is used (definitions linked
+ * into the library via builtin_defs[]). If @json_path is non-NULL, the JS=
ON
+ * provider is used; that provider is only available when the library is
+ * built with HAVE_JANSSON.
+ */
+int pmt_metrics_load(const char *json_path, struct pmt_metrics_db *db);
+
+#ifdef HAVE_JANSSON
+int pmt_metrics_load_json(const char *json_path, struct pmt_metrics_db *db=
);
+#endif
+
+#endif
diff --git a/tools/arch/x86/pmtctl/lib/builtin_defs_empty.c b/tools/arch/x8=
6/pmtctl/lib/builtin_defs_empty.c
new file mode 100644
index 000000000000..4496d85b230c
--- /dev/null
+++ b/tools/arch/x86/pmtctl/lib/builtin_defs_empty.c
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include "lib/builtin_defs.h"
+
+/*
+ * Empty stub used when no generated/builtin_defs.c is present.
+ * The build system will pick this file unless a generated one exists.
+ */
+
+const struct pmt_guid builtin_guids[1];
+const int builtin_guids_count;
+
+const struct pmt_metric_def builtin_defs[1];
+const int builtin_defs_count;
diff --git a/tools/arch/x86/pmtctl/lib/metrics_provider.c b/tools/arch/x86/=
pmtctl/lib/metrics_provider.c
new file mode 100644
index 000000000000..6673145d4a9a
--- /dev/null
+++ b/tools/arch/x86/pmtctl/lib/metrics_provider.c
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#define LOG_PREFIX "metrics_provider"
+#include <string.h>
+
+#include "lib/builtin_defs.h"
+#include "lib/log.h"
+#include "lib/metrics_provider.h"
+
+static int pmt_metrics_load_builtin(struct pmt_metrics_db *db)
+{
+	if (builtin_defs_count =3D=3D 0)
+		return PMTCTL_ERR_NOMETRICS;
+
+	/*
+	 * Register the compiled-in GUID metadata table so device_telem and
+	 * any runtime providers can resolve raw GUIDs to the same intern'd
+	 * struct pmt_guid pointers that builtin_defs[] already references.
+	 */
+	if (builtin_guids_count > 0)
+		pmt_guid_register(builtin_guids, builtin_guids_count);
+
+	return pmt_metrics_add_block(db, builtin_defs, builtin_defs_count, true);
+}
+
+int pmt_metrics_load(const char *json_path, struct pmt_metrics_db *db)
+{
+	if (!db)
+		log_bug_and_exit("invalid metric db pointer");
+
+	memset(db, 0, sizeof(*db));
+
+	if (!json_path)
+		return pmt_metrics_load_builtin(db);
+
+#ifdef HAVE_JANSSON
+	return pmt_metrics_load_json(json_path, db);
+#else
+	(void)json_path;
+	return log_ret(PMTCTL_ERR_UNSUPPORTED,
+		       "JSON metric definitions requested but library built without jans=
son support");
+#endif
+}
--=20
2.43.0

