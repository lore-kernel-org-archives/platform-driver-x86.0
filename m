Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012542E091B;
	Tue, 26 May 2026 01:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779760074; cv=none; b=BWZStEQeOKMst6oi8xdHVNaNWi1YQHq2OqRoy4AZF/hSNbfktl1YYNJiimj+vgaQwEHls7Li5BRKetCA0NCGMBR3820nCgXavWqPvTcqj3GJs0xUKFkKRBLzH5fYf2NW3XQjp71pse1GS5eZuYaYiXi0dFQC0VJYJgsid72ylkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779760074; c=relaxed/simple;
	bh=ur0uw3DNn+opEciJpwnTTS9p739vL3Dph1rw0Rg1N4c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PixZ21cu07p9eS/XiatvetWslLwBdJuvogJnVd2fLC7YM394z7bC64nUS+4CVYGNa+snr9CIOFtceqwc6B495RocXMqbuk53y7ehi+u1FatE1bVQNvsHYAGo+J9LuPqjTcy2zYCpmVv6Vcdtntlm4C/NsvRAl1AIsOAKBSa9Q64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BN15qJJI; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BN15qJJI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779760065; x=1811296065;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ur0uw3DNn+opEciJpwnTTS9p739vL3Dph1rw0Rg1N4c=;
  b=BN15qJJIfimKNfUKxPRcPiZj0iMdrjL2ky3P51IL5Toqfo9kB+lie2ZW
   ZKqz1FF46mNC1/Ki6fnl1l7nTaffk6LIOQGTnh0hkynhYKbC37RJ58bxe
   V0D6B5I0EmSgK0dQ3EWQ8pT+Xc+hms6ZTCBoryqRuLdncOxRPk+s4VRbJ
   YyByh0tGEpUy3oS3Eu2fjO4YIhF4WfKTEi10uCSMmXSl2RozTzZsDmHvL
   SlzEOzhxyswuXq7lYdudPpHeszzHJLjV/hToD5Z8n2UDGA6BPSMIeyWT8
   S3O8XsAAEnIQGnLr4l+hCWkOrJGVtKjGksH4i/xG/L7cldLy1hSbEFLEy
   A==;
X-CSE-ConnectionGUID: l8tjotJCRhWYmw25yFiobw==
X-CSE-MsgGUID: SnLkkK+cSD6mDjZ6UO4qsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80539893"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="80539893"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 18:47:33 -0700
X-CSE-ConnectionGUID: ouIiSxTpRPudMzATbNdgCg==
X-CSE-MsgGUID: m2YjsaQ/SQKVERa6RbJlEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="272074975"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 18:47:33 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 08/17] tools/arch/x86/pmtctl: Add libpmtctl public API and context
Date: Mon, 25 May 2026 18:47:06 -0700
Message-ID: <20260526014719.2248380-9-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526014719.2248380-1-david.e.box@linux.intel.com>
References: <20260526014719.2248380-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Add the public API for libpmtctl_core and the context object that backs it,
providing callers with a stable, opaque interface for discovering Intel PMT
telemetry devices and querying their metrics without depending on internal
library structures.

This patch adds the primary lifecycle and query interfaces used by library
consumers. pmtctl_init() performs device enumeration and metric database
loading once during initialization so subsequent queries operate on cached
state rather than re-scanning sysfs. pmtctl_cleanup() releases associated
resources.

The library context (struct pmtctl_context) remains opaque to callers.
pmtctl_get_ctx() provides controlled access for consumers that need to pass
library context across translation units.

Add PMTCTL_SCOPE_GUARD() as a convenience macro for deterministic cleanup
of library-managed resources in single-exit C code paths.

Build-system wiring is added a later patch of the series.

Assisted-by: GitHub-Copilot:claude-sonnet-4.6
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 tools/arch/x86/pmtctl/include/lib/pmtctl.h    |  90 +++++
 .../x86/pmtctl/include/lib/pmtctl_context.h   |  21 ++
 tools/arch/x86/pmtctl/lib/pmtctl.c            | 327 ++++++++++++++++++
 3 files changed, 438 insertions(+)
 create mode 100644 tools/arch/x86/pmtctl/include/lib/pmtctl.h
 create mode 100644 tools/arch/x86/pmtctl/include/lib/pmtctl_context.h
 create mode 100644 tools/arch/x86/pmtctl/lib/pmtctl.c

diff --git a/tools/arch/x86/pmtctl/include/lib/pmtctl.h b/tools/arch/x86/pm=
tctl/include/lib/pmtctl.h
new file mode 100644
index 000000000000..b243a48e8d72
--- /dev/null
+++ b/tools/arch/x86/pmtctl/include/lib/pmtctl.h
@@ -0,0 +1,90 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef PMTCTL_H
+#define PMTCTL_H
+
+#include <stdbool.h>
+#include <stdint.h>
+
+#include <linux/compiler.h>
+#include "pmtctl_types.h"
+
+enum pmt_selector_kind {
+	PMT_SEL_ANY =3D 0,   /* no selector provided */
+	PMT_SEL_GUID,      /* guid=3D27971628 */
+	PMT_SEL_EP_NAME,   /* ep=3Dpmt_ep_27971628_0 OR ep=3Dtelem1 */
+};
+
+struct pmt_ep_selector {
+	enum pmt_selector_kind kind;
+
+	uint32_t guid;
+
+	/* For SEL_EP_NAME */
+	const char *str;
+};
+
+struct pmt_binding {
+	int metric_idx;   /* index into defs[] */
+	int device_idx;   /* index into devices[] */
+};
+
+struct pmtctl_context;
+
+struct pmt_global_opts {
+	const char            *json_path;        /* -J / --json-file */
+	const char            *device_selector;  /* -d / --device (raw) */
+	bool                   quiet;            /* -q / --quiet */
+	bool                   debug;            /* --debug */
+};
+
+/*
+ * Initialize library-global PMT state.
+ *
+ * This may return success even if no metric definitions are available.
+ * In that case, device enumeration is still usable and raw mode remains
+ * supported (raw reads do not require metric definitions).
+ */
+int pmtctl_init(const struct pmt_global_opts *gopts);
+const struct pmtctl_context *pmtctl_get_ctx(void);
+enum pmt_device_type pmtctl_get_device_type(void);
+int pmtctl_get_num_devices(void);
+int pmtctl_get_num_metrics(void);
+int pmtctl_get_num_bindings(void);
+
+/*
+ * Set process-global library logging verbosity.
+ *
+ * Invalid values are clamped to PMTCTL_LOG_INFO.
+ */
+void pmtctl_set_log_level(enum pmtctl_log_level level);
+
+/*
+ * Thread-safety note:
+ *
+ * libpmtctl_core is generally not thread-safe. Callers should serialize
+ * pmtctl_init()/pmtctl_cleanup() and API usage around shared library stat=
e.
+ */
+void pmtctl_cleanup(void);
+
+static inline __always_unused void pmtctl_scope_cleanup(int *unused)
+{
+	(void)unused;
+	pmtctl_cleanup();
+}
+
+#define PMTCTL_SCOPE_GUARD                              \
+	__attribute__((cleanup(pmtctl_scope_cleanup)))  \
+	int _pmtctl_scope_guard __always_unused \
+
+int pmt_select_devices(const struct pmtctl_context *ctx, const struct pmt_=
ep_selector *sel,
+		       int *out_idx, int max_out);
+
+/*
+ * Parse an ep selector string like "guid=3D27971628" or "ep=3Dpmt_ep_...".
+ * For selectors that set a string (ep/name) the implementation will
+ * allocate a copy into sel->str; the caller is responsible for freeing
+ * sel->str if non-NULL.
+ */
+int pmtctl_parse_ep_selector(const char *s, struct pmt_ep_selector *out);
+
+#endif
diff --git a/tools/arch/x86/pmtctl/include/lib/pmtctl_context.h b/tools/arc=
h/x86/pmtctl/include/lib/pmtctl_context.h
new file mode 100644
index 000000000000..6f3e8563f7eb
--- /dev/null
+++ b/tools/arch/x86/pmtctl/include/lib/pmtctl_context.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef PMTCTL_CONTEXT_H
+#define PMTCTL_CONTEXT_H
+
+#include "lib/device.h"
+#include "lib/metrics_db.h"
+#include "lib/pmtctl.h"
+
+struct pmtctl_context {
+	const struct pmt_device_ops *ops;
+
+	struct pmt_device *devices;
+	int num_devices;
+
+	struct pmt_metrics_db metrics;
+
+	struct pmt_binding *bindings;
+	int num_bindings;
+};
+
+#endif
diff --git a/tools/arch/x86/pmtctl/lib/pmtctl.c b/tools/arch/x86/pmtctl/lib=
/pmtctl.c
new file mode 100644
index 000000000000..5ee2f576316a
--- /dev/null
+++ b/tools/arch/x86/pmtctl/lib/pmtctl.c
@@ -0,0 +1,327 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <errno.h>
+#include <string.h>
+#include <stdio.h>
+#include <stdlib.h>
+
+#include "lib/common.h"
+#include "lib/device.h"
+#include "lib/log.h"
+#include "lib/metrics_db.h"
+#include "lib/metrics_provider.h"
+#include "lib/pmtctl.h"
+#include "lib/pmtctl_context.h"
+
+static struct pmtctl_context g_pmtctl_ctx;
+
+const struct pmtctl_context *pmtctl_get_ctx(void)
+{
+	return &g_pmtctl_ctx;
+}
+
+enum pmt_device_type pmtctl_get_device_type(void)
+{
+	const struct pmt_device_ops *ops =3D g_pmtctl_ctx.ops;
+
+	return ops ? ops->dev_type : PMT_DEVICE_TELEM;
+}
+
+int pmtctl_get_num_devices(void)
+{
+	return g_pmtctl_ctx.num_devices;
+}
+
+int pmtctl_get_num_metrics(void)
+{
+	return g_pmtctl_ctx.metrics.total;
+}
+
+int pmtctl_get_num_bindings(void)
+{
+	return g_pmtctl_ctx.num_bindings;
+}
+
+void pmtctl_set_log_level(enum pmtctl_log_level level)
+{
+	log_set_level(level);
+}
+
+int pmt_select_devices(const struct pmtctl_context *ctx,
+		       const struct pmt_ep_selector *sel,
+		       int *out_idx, int max_out)
+{
+	int i, n =3D 0;
+
+	if (!ctx || !sel || !out_idx || max_out <=3D 0)
+		return log_ret(PMTCTL_ERR_INVALID, "bad argument");
+
+	if (!ctx->devices || ctx->num_devices <=3D 0)
+		return log_ret(PMTCTL_ERR_INVALID, "no devices");
+
+	switch (sel->kind) {
+	case PMT_SEL_ANY:
+		/* No filter: return all devices */
+		for (i =3D 0; i < ctx->num_devices && n < max_out; i++)
+			out_idx[n++] =3D i;
+		break;
+
+	case PMT_SEL_GUID:
+		for (i =3D 0; i < ctx->num_devices && n < max_out; i++) {
+			const struct pmt_device *dev =3D &ctx->devices[i];
+
+			if (dev->guid && dev->guid->guid =3D=3D sel->guid)
+				out_idx[n++] =3D i;
+		}
+		break;
+
+	case PMT_SEL_EP_NAME:
+		if (!sel->str || !sel->str[0])
+			return log_ret(PMTCTL_ERR_CMD_PARSE, "empty ep selector");
+
+		for (i =3D 0; i < ctx->num_devices && n < max_out; i++) {
+			const struct pmt_device *dev =3D &ctx->devices[i];
+
+			if (dev->name && strcmp(dev->name, sel->str) =3D=3D 0)
+				out_idx[n++] =3D i;
+		}
+		break;
+
+	default:
+		return log_ret(PMTCTL_ERR_CMD_PARSE, "unknown selector kind %d", sel->ki=
nd);
+	}
+
+	/* n =3D=3D 0 is "no matches", not an API error. Caller decides what to d=
o. */
+	return n;
+}
+
+int pmtctl_parse_ep_selector(const char *s, struct pmt_ep_selector *out)
+{
+	auto_free char *copy =3D NULL;
+	char *end;
+	char *eq;
+	char *key =3D NULL;
+	const char *val =3D NULL;
+
+	if (!out)
+		return -EINVAL;
+
+	if (!s || !*s) {
+		out->kind =3D PMT_SEL_ANY;
+		out->str =3D NULL;
+		out->guid =3D 0;
+		return 0;
+	}
+
+	/* Expect a single key=3Dvalue selector: guid=3D..., ep=3D..., name=3D...=
 */
+	copy =3D strdup(s);
+
+	if (!copy)
+		return -ENOMEM;
+
+	eq =3D strchr(copy, '=3D');
+	if (!eq)
+		return -EINVAL;
+
+	*eq =3D '\0';
+	key =3D copy;
+	val =3D eq + 1;
+
+	if (!strcmp(key, "guid")) {
+		errno =3D 0;
+		unsigned long v =3D strtoul(val, &end, 16);
+
+		if (errno || end =3D=3D val || *end !=3D '\0' || v > UINT32_MAX)
+			return errno ? -errno : -EINVAL;
+		out->kind =3D PMT_SEL_GUID;
+		out->guid =3D (uint32_t)v;
+		out->str =3D NULL;
+	} else if (!strcmp(key, "ep") || !strcmp(key, "name")) {
+		out->kind =3D PMT_SEL_EP_NAME;
+		out->str =3D strdup(val);
+		if (!out->str)
+			return -ENOMEM;
+		out->guid =3D 0;
+	} else {
+		log_err(PMTCTL_ERR_CMD_PARSE, "unknown device selector %s", key);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static bool
+metric_matches_device(const struct pmt_metric_def *def, const struct pmt_d=
evice *dev)
+{
+	/*
+	 * Compare the underlying numeric GUID rather than the pmt_guid pointer:
+	 * builtin metric defs reference &builtin_guids[idx] directly, while
+	 * devices intern through the registry. These may resolve to different
+	 * pmt_guid entries for the same GUID depending on init order.
+	 */
+	return def->guid->guid =3D=3D dev->guid->guid;
+}
+
+static int pmt_bind_build(struct pmtctl_context *ctx)
+{
+	struct pmt_binding *bindings;
+	size_t count =3D 0;
+	int i, j, k;
+
+	/*
+	 * -----------------------------
+	 * Pass 1: count bindings
+	 * -----------------------------
+	 */
+	for (i =3D 0; i < ctx->metrics.total; i++) {
+		const struct pmt_metric_def *def =3D pmt_metrics_at(&ctx->metrics, i);
+
+		if (!def)
+			continue;
+
+		for (j =3D 0; j < ctx->num_devices; j++) {
+			const struct pmt_device *dev =3D &ctx->devices[j];
+
+			if (!metric_matches_device(def, dev))
+				continue;
+
+			count++;
+		}
+	}
+
+	if (count =3D=3D 0) {
+		log_warn("no metric/device bindings found");
+		return 0;
+	}
+
+	bindings =3D calloc(count, sizeof(*bindings));
+	if (!bindings)
+		return log_ret(-ENOMEM, "count not allocate bindings");
+
+	/*
+	 * -----------------------------
+	 * Pass 2: fill bindings
+	 * -----------------------------
+	 */
+	k =3D 0;
+	for (i =3D 0; i < ctx->metrics.total; i++) {
+		const struct pmt_metric_def *def =3D pmt_metrics_at(&ctx->metrics, i);
+
+		if (!def)
+			continue;
+
+		for (j =3D 0; j < ctx->num_devices; j++) {
+			const struct pmt_device *dev =3D &ctx->devices[j];
+
+			if (!metric_matches_device(def, dev))
+				continue;
+
+			bindings[k].metric_idx =3D i;
+			bindings[k].device_idx =3D j;
+			k++;
+		}
+	}
+
+	ctx->bindings     =3D bindings;
+	ctx->num_bindings =3D k;
+
+	return 0;
+}
+
+int pmtctl_init(const struct pmt_global_opts *gopts)
+{
+	const struct pmt_device_ops *ops =3D NULL;
+	int num_devices;
+	int ret;
+
+	if (!gopts)
+		return log_ret(PMTCTL_ERR_INVALID, "bad argument");
+
+	memset(&g_pmtctl_ctx, 0, sizeof(g_pmtctl_ctx));
+
+	/*
+	 * 1) Initialize device backend.
+	 *    Only the telem backend is currently supported; PMU support is
+	 *    pending upstream driver availability.
+	 */
+	ret =3D device_telem_ops.init();
+	if (ret !=3D 0)
+		return log_ret(ret, "failed to find PMT source");
+	ops =3D &device_telem_ops;
+	log_debug("Selecting from /sys/class/intel_pmt");
+	g_pmtctl_ctx.ops =3D ops;
+
+	/*
+	 * 2) Enumerate devices from the chosen device
+	 */
+	g_pmtctl_ctx.devices =3D ops->device_list(&num_devices);
+	if (!g_pmtctl_ctx.devices) {
+		pmtctl_cleanup();
+		log_bug_and_exit("unexpected NULL device context");
+	}
+
+	if (num_devices <=3D 0) {
+		pmtctl_cleanup();
+		log_bug_and_exit("unexpected zero device count");
+	}
+	g_pmtctl_ctx.num_devices =3D num_devices;
+
+	/*
+	 * 3) Load metric definitions from JSON or built-in
+	 *
+	 * If metric load fails or returns zero metrics, we intentionally keep in=
it as a
+	 * degraded success (return 0) with a warning. This allows raw mode opera=
tion,
+	 * which does not require metric definitions.
+	 */
+	ret =3D pmt_metrics_load(gopts->json_path, &g_pmtctl_ctx.metrics);
+	/*
+	 * Any nonzero rc here means the metric source itself was broken
+	 * (e.g. -J pointed at a nonexistent path, or a JSON file failed to
+	 * parse).  Treat that as a hard init failure so the CLI exits with
+	 * PMTCTL_EXIT_SYSTEM instead of silently degrading to a metric-less
+	 * session.  Empty source (ret =3D=3D 0 but metrics.total =3D=3D 0) stays=
 a
+	 * degraded success -- raw mode and `list --devices` are still usable.
+	 *
+	 * Some provider paths return positive PMTCTL_ERR_* codes; normalize
+	 * those to -EIO so main()'s mapping selects EXIT_SYSTEM.
+	 */
+	if (ret !=3D 0) {
+		pmtctl_cleanup();
+		if (ret > 0)
+			ret =3D -EIO;
+		return log_ret(ret, "failed to load metrics from %s",
+			       gopts->json_path ? gopts->json_path : "<built-in>");
+	}
+	if (g_pmtctl_ctx.metrics.total =3D=3D 0) {
+		log_warn("no metrics from %s", gopts->json_path ? gopts->json_path : "<b=
uilt-in>");
+		return 0;
+	}
+
+	/*
+	 * 4) Build metric =E2=86=94 device bindings
+	 */
+	ret =3D pmt_bind_build(&g_pmtctl_ctx);
+	if (ret !=3D 0) {
+		pmtctl_cleanup();
+		return ret;
+	}
+
+	return 0;
+}
+
+void pmtctl_cleanup(void)
+{
+	if (g_pmtctl_ctx.bindings) {
+		free(g_pmtctl_ctx.bindings);
+		g_pmtctl_ctx.bindings =3D NULL;
+		g_pmtctl_ctx.num_bindings =3D 0;
+	}
+
+	if (g_pmtctl_ctx.ops && g_pmtctl_ctx.ops->cleanup)
+		g_pmtctl_ctx.ops->cleanup();
+
+	pmt_metrics_free(&g_pmtctl_ctx.metrics);
+	pmt_guid_cleanup();
+
+	g_pmtctl_ctx.ops         =3D NULL;
+	g_pmtctl_ctx.devices     =3D NULL;
+	g_pmtctl_ctx.num_devices =3D 0;
+}
--=20
2.43.0

