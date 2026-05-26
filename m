Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0952DECBF;
	Tue, 26 May 2026 01:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779760082; cv=none; b=qSK8L/y9IIUvskX1BwV7CLfO5IzCU4V3vTcIhlc5S78LwBbGfrYei9DX4YMiGi/QirSFD4TXb7/wBnN56unqXzKwHNsuMSVPuwl3kniCmITPLYrg3wAP6yxLAhuoeg6nfKRn7h8Dh4X3bfHwJF4EBfgllKCffvcMY1BXGglz0OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779760082; c=relaxed/simple;
	bh=0Ddxim4pkGcts07WXlAXP7hCEnNrTlDYju5LbqSbvzg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EOiHoTUkifT/mXx2Z0M6SUC0KlpkCK/L5INXJ+t8VkkeV+FnrcMo5Aa/eoKb0pWrOA3CyaHJbQIWH5FIz9MQbcSlQj9Sx0UzJUsj27QSv0WkGqdX40iPnmbvmpMLJLJXdaTeZ6F45YmpZZ7kaXJHcBd7pR25KK8gRoCqfB63HgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U0wEYi1g; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U0wEYi1g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779760077; x=1811296077;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=0Ddxim4pkGcts07WXlAXP7hCEnNrTlDYju5LbqSbvzg=;
  b=U0wEYi1gNVc2+MOlR2DFQjkPmaBfgj1AVR/sDzF5Upr52rzRPzwALB1b
   6UTHhl+StNddBEylfC9QoBHrJrAYeabivuInF1nDQcAYSyArp6PDop4Za
   ECaZ/F7z3Au04bMWErHjjBl6zvGszSlcfhQ+gZlW4bxcXCZrtaBfZSSDU
   /RJihAwGIUPo8qNkCGE2+Rcsw1lZHYzv1qSiGHdJUka1JRKS2uo+Bp5VN
   dlS5Dl1yZGNNMozu2X2aoJlqupX2rbwqiCCfarVgT6QTy9Dr53hoKW6BT
   qxpfbR23yuq8Xa8v8V871hq84TG7FiGP4dAw7lHFVjDSzAHhKlEmTVv3e
   A==;
X-CSE-ConnectionGUID: ZS9YQAWtS8aTg7mDk2joXA==
X-CSE-MsgGUID: 8g69rmhXSQ+ko0EOwY1K1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80539898"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="80539898"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 18:47:34 -0700
X-CSE-ConnectionGUID: doCUjaPdT8aeZ/K/zTY8qw==
X-CSE-MsgGUID: U1nKgcFjTCSZeQKPXnUKFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="272074981"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 18:47:33 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 13/17] tools/arch/x86/pmtctl: Add pmtctl 'list' command
Date: Mon, 25 May 2026 18:47:11 -0700
Message-ID: <20260526014719.2248380-14-david.e.box@linux.intel.com>
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

Register the 'list' subcommand in the CLI dispatcher and add its
implementation in src/cmd_list.c. The command enumerates PMT devices
and metrics, with optional filtering by GUID or endpoint name.

Per-command --help, JSON output, and tabular formatting are handled
locally inside cmd_list.

Assisted-by: GitHub-Copilot:claude-opus-4.7
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 tools/arch/x86/pmtctl/Makefile             |   1 +
 tools/arch/x86/pmtctl/include/pmtctl_cli.h |   2 +
 tools/arch/x86/pmtctl/src/cmd_list.c       | 786 +++++++++++++++++++++
 tools/arch/x86/pmtctl/src/main.c           |  13 +
 4 files changed, 802 insertions(+)
 create mode 100644 tools/arch/x86/pmtctl/src/cmd_list.c

diff --git a/tools/arch/x86/pmtctl/Makefile b/tools/arch/x86/pmtctl/Makefile
index 83bca8c312e7..ee6633a6f435 100644
--- a/tools/arch/x86/pmtctl/Makefile
+++ b/tools/arch/x86/pmtctl/Makefile
@@ -41,6 +41,7 @@ SAMPLE_TARGET :=3D $(BUILDDIR)/samples/libpmtctl_sample
=20
 SRC :=3D \
 	$(SRCDIR)/main.c \
+	$(SRCDIR)/cmd_list.c \
 	$(SRCDIR)/pager.c
=20
 OBJ :=3D $(patsubst $(SRCDIR)/%.c,$(BUILDDIR)/%.o,$(SRC))
diff --git a/tools/arch/x86/pmtctl/include/pmtctl_cli.h b/tools/arch/x86/pm=
tctl/include/pmtctl_cli.h
index 0b99dfe0ed64..eb5efb0b650f 100644
--- a/tools/arch/x86/pmtctl/include/pmtctl_cli.h
+++ b/tools/arch/x86/pmtctl/include/pmtctl_cli.h
@@ -9,4 +9,6 @@
 FILE *pmtctl_start_pager(const struct pmt_global_opts *gopts);
 void pmtctl_finish_pager(FILE *out);
=20
+int cmd_list(int argc, char **argv, const struct pmt_global_opts *gopts);
+
 #endif
diff --git a/tools/arch/x86/pmtctl/src/cmd_list.c b/tools/arch/x86/pmtctl/s=
rc/cmd_list.c
new file mode 100644
index 000000000000..a4164bf75dfb
--- /dev/null
+++ b/tools/arch/x86/pmtctl/src/cmd_list.c
@@ -0,0 +1,786 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <ctype.h>
+#include <errno.h>
+#include <getopt.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <unistd.h>
+
+#define LIST_BASE_INDENT    2
+#define LIST_CONT_INDENT    6
+#define LIST_DEFAULT_COLS  80
+
+/* Column widths for the --guids table */
+#define GCOL_GUID   8
+#define GCOL_COUNT  5
+#define GCOL_DEF   10
+#define GCOL_PLAT   8
+
+#define LOG_PREFIX "cmd_list"
+#include "lib/log.h"
+
+#include "lib/common.h"
+#include "lib/device.h"
+#include "lib/metrics_db.h"
+#include "lib/pmt_guid.h"
+#include "lib/pmtctl_context.h"
+
+#include "pmtctl_cli.h"
+
+struct list_opts {
+	bool show_help;
+	bool devices_only;
+	bool guids_only;
+	bool keep_screen;
+	const char *device_selector;   /* raw "guid=3D...,ep=3D..." string (comma=
nd-local fallback) */
+};
+
+struct list_metric_view {
+	const char *device_name;       /* GUID: "22806802" */
+	const char *platform_group;    /* platform group name */
+	const char *group_name;        /* pmt_guid->name */
+	const char *group_description; /* pmt_guid->description (may be NULL) */
+	const char *name;              /* metric name */
+	const char *desc;              /* metric description (may be NULL) */
+};
+
+struct guid_defs {
+	const char *platform_group;
+	const char *name;
+	const struct pmt_guid *pg;  /* registry entry (may be NULL) */
+	uint32_t guid;
+	bool from_builtin;
+	bool from_json;
+};
+
+struct guid_sys {
+	uint32_t guid;
+	int endpoints;
+};
+
+static int guid_defs_find(struct guid_defs *arr, int n, uint32_t guid)
+{
+	for (int i =3D 0; i < n; i++) {
+		if (arr[i].guid =3D=3D guid)
+			return i;
+	}
+
+	return -1;
+}
+
+static int guid_defs_cmp_platform_group(const void *a, const void *b)
+{
+	const struct guid_defs *ga =3D (const struct guid_defs *)a;
+	const struct guid_defs *gb =3D (const struct guid_defs *)b;
+	const char *pg_a =3D ga->platform_group;
+	const char *pg_b =3D gb->platform_group;
+
+	if (pg_a && pg_b) {
+		int cmp =3D strcmp(pg_a, pg_b);
+
+		if (cmp)
+			return cmp;
+	} else if (pg_a) {
+		return -1;
+	} else if (pg_b) {
+		return 1;
+	}
+
+	if (ga->guid < gb->guid)
+		return -1;
+	if (ga->guid > gb->guid)
+		return 1;
+
+	return 0;
+}
+
+static int guid_sys_find(struct guid_sys *arr, int n, uint32_t guid)
+{
+	for (int i =3D 0; i < n; i++) {
+		if (arr[i].guid =3D=3D guid)
+			return i;
+	}
+
+	return -1;
+}
+
+static bool is_blank_string(const char *s)
+{
+	while (*s) {
+		if (!isspace((unsigned char)*s))
+			return false;
+		s++;
+	}
+
+	return true;
+}
+
+static int do_list_guids(const int *dev_indices, int num_sel_devices)
+{
+	const struct pmtctl_context *ctx =3D pmtctl_get_ctx();
+	auto_free struct guid_defs *defs =3D NULL;
+	auto_free struct guid_sys  *sys  =3D NULL;
+	int num_defs =3D 0;
+	int n_sys =3D 0;
+
+	/* ----- 1) collect GUIDs from metric definitions ----- */
+	defs =3D calloc(ctx->metrics.total, sizeof(*defs));
+	if (!defs)
+		return log_ret(-ENOMEM, "could not build guid list");
+
+	for (int i =3D 0; i < ctx->metrics.total; i++) {
+		const struct pmt_metric_def *md;
+		const struct pmt_metrics_block *block;
+		uint32_t guid;
+		int idx;
+
+		md =3D pmt_metrics_at(&ctx->metrics, i);
+		if (!md)
+			continue;
+
+		block =3D pmt_metrics_block_for(&ctx->metrics, i);
+		if (!block)
+			continue;
+
+		/*
+		 * Fold every metric def into a single per-GUID row in defs[].
+		 * Many defs share the same GUID, so look up an existing row
+		 * and append a new one only the first time we see this GUID.
+		 * The metric-level fields below (from_builtin/from_json,
+		 * platform_group, name) then accumulate onto that row.
+		 *
+		 * A NULL md->guid means a provider failed to intern (or parse)
+		 * the GUID for this def; skip it rather than fold every such
+		 * def into a bogus "00000000" bucket.
+		 */
+		if (!md->guid) {
+			log_warn("metric def %d (%s) has no GUID; skipping",
+				 i, md->event_name ? md->event_name : "?");
+			continue;
+		}
+
+		guid =3D md->guid->guid;
+		idx =3D guid_defs_find(defs, num_defs, guid);
+		if (idx =3D=3D -1) {
+			idx =3D num_defs++;
+			defs[idx].guid =3D guid;
+			defs[idx].pg =3D md->guid;
+		}
+
+		if (block->is_builtin)
+			defs[idx].from_builtin =3D true;
+		else
+			defs[idx].from_json =3D true;
+
+		defs[idx].platform_group =3D md->platform_group;
+		defs[idx].name =3D md->group;
+	}
+
+	if (num_defs > 1)
+		qsort(defs, num_defs, sizeof(*defs), guid_defs_cmp_platform_group);
+
+	/* ----- 2) collect GUIDs from system devices (filtered) ----- */
+	sys =3D calloc(num_sel_devices, sizeof(*sys));
+	if (!sys)
+		return log_ret(-ENOMEM, "could not build guid list");
+
+	for (int i =3D 0; i < num_sel_devices; i++) {
+		const struct pmt_device *dev =3D &ctx->devices[dev_indices[i]];
+		uint32_t guid;
+		int idx;
+
+		if (!dev->guid) {
+			log_warn("device %s has no GUID; skipping",
+				 dev->name ? dev->name : "?");
+			continue;
+		}
+
+		guid =3D dev->guid->guid;
+		idx =3D guid_sys_find(sys, n_sys, guid);
+
+		if (idx < 0) {
+			idx =3D n_sys++;
+			sys[idx].guid =3D guid;
+		}
+		sys[idx].endpoints++;
+	}
+
+	/* ----- 3) print combined system + defs ----- */
+	printf("GUIDs on this system (TELEM):\n\n");
+	printf("  %-*s   %-*s   %-*s   %-*s   %s\n",
+	       GCOL_GUID, "GUID", GCOL_COUNT, "Count",
+	       GCOL_DEF, "Definition", GCOL_PLAT, "Platform",
+	       "PMT Name");
+	printf("  %.*s   %.*s   %.*s   %.*s   %s\n",
+	       GCOL_GUID, "--------",
+	       GCOL_COUNT, "--------",
+	       GCOL_DEF, "----------",
+	       GCOL_PLAT, "--------",
+	       "--------");
+
+	if (!n_sys) {
+		printf("  (none)\n");
+		return 0;
+	}
+
+	for (int i =3D 0; i < n_sys; i++) {
+		struct guid_sys *gs =3D &sys[i];
+		int idx =3D guid_defs_find(defs, num_defs, gs->guid);
+		const struct pmt_guid *pg =3D pmt_guid_lookup(gs->guid);
+		const char *pmt_name =3D (pg && pg->name && *pg->name) ? pg->name : "---=
";
+		struct guid_defs *gd;
+
+		printf("  %08x   %-*d   ", gs->guid, GCOL_COUNT, gs->endpoints);
+
+		if (idx < 0) {
+			printf("%-*s   %-*s   %s\n",
+			       GCOL_DEF, "---",
+			       GCOL_PLAT, "---",
+			       pmt_name);
+			continue;
+		}
+
+		gd =3D &defs[idx];
+
+		if (gd->from_builtin || gd->from_json) {
+			bool need_comma =3D false;
+
+			if (gd->from_builtin) {
+				printf("%-*s", GCOL_DEF, "builtin");
+				need_comma =3D true;
+			}
+
+			if (gd->from_json) {
+				if (need_comma)
+					fputc(',', stdout);
+				printf("%-*s", GCOL_DEF, "json");
+			}
+		} else {
+			printf("%-*s", GCOL_DEF, "unknown");
+		}
+
+		if (gd->platform_group && !is_blank_string(gd->platform_group))
+			printf("   %-*s", GCOL_PLAT, gd->platform_group);
+		else
+			printf("   %-*s", GCOL_PLAT, "---");
+
+		printf("   %s\n", pmt_name);
+	}
+
+	return 0;
+}
+
+#define PLAT_W 12
+static void print_guid_group_line(uint32_t guid, const struct guid_defs *g=
d)
+{
+	const char *plat =3D (gd && gd->platform_group) ? gd->platform_group : "-=
--";
+	const struct pmt_guid *pg =3D gd ? gd->pg : pmt_guid_lookup(guid);
+	const char *pmt_name =3D (pg && pg->name && *pg->name) ? pg->name : "---";
+
+	printf("  GUID %08x  platform: %-*s  name: %s\n", guid, PLAT_W, plat, pmt=
_name);
+
+	if (pg && pg->description && *pg->description)
+		printf("    %s\n", pg->description);
+}
+
+#define NAME_W 24
+static void print_dev_entry(const struct pmt_device *dev)
+{
+	if (dev->pkg_id >=3D 0 && dev->die_id >=3D 0)
+		printf("    %-*s  pkg=3D%d die=3D%d\n", NAME_W, dev->name, dev->pkg_id, =
dev->die_id);
+	else
+		printf("    %s\n", dev->name);
+}
+
+static int do_list_devices(const int *dev_indices, int num_sel_devices)
+{
+	const struct pmtctl_context *ctx =3D pmtctl_get_ctx();
+	auto_free struct guid_defs *defs =3D NULL;
+	auto_free uint32_t *guid_order =3D NULL;
+	int num_defs =3D 0;
+	int num_guids =3D 0;
+
+	if (ctx->num_devices =3D=3D 0 || num_sel_devices =3D=3D 0) {
+		printf("No PMT devices found.\n");
+		return 0;
+	}
+
+	/* Build GUID -> platform_group/name map from metric defs */
+	if (ctx->metrics.total > 0) {
+		defs =3D calloc(ctx->metrics.total, sizeof(*defs));
+		if (!defs)
+			return log_ret(-ENOMEM, "could not allocate guid info");
+
+		for (int i =3D 0; i < ctx->metrics.total; i++) {
+			const struct pmt_metric_def *md =3D pmt_metrics_at(&ctx->metrics, i);
+			uint32_t guid;
+			int idx;
+
+			if (!md || !md->guid)
+				continue;
+
+			guid =3D md->guid->guid;
+			idx =3D guid_defs_find(defs, num_defs, guid);
+			if (idx =3D=3D -1) {
+				idx =3D num_defs++;
+				defs[idx].guid =3D guid;
+				defs[idx].pg =3D md->guid;
+			}
+
+			defs[idx].platform_group =3D md->platform_group;
+			defs[idx].name =3D md->group;
+		}
+	}
+
+	/* Collect unique GUIDs in selected-device order */
+	guid_order =3D calloc(num_sel_devices, sizeof(*guid_order));
+	if (!guid_order)
+		return log_ret(-ENOMEM, "could not allocate guid order");
+
+	for (int k =3D 0; k < num_sel_devices; k++) {
+		const struct pmt_device *dev =3D &ctx->devices[dev_indices[k]];
+		uint32_t g;
+		bool found =3D false;
+
+		if (!dev->guid) {
+			log_warn("device %s has no GUID; skipping", dev->name ? dev->name : "?"=
);
+			continue;
+		}
+
+		g =3D dev->guid->guid;
+
+		for (int j =3D 0; j < num_guids; j++) {
+			if (guid_order[j] =3D=3D g) {
+				found =3D true;
+				break;
+			}
+		}
+
+		if (!found)
+			guid_order[num_guids++] =3D g;
+	}
+
+	printf("PMT devices on this system:\n\n");
+
+	for (int g =3D 0; g < num_guids; g++) {
+		uint32_t guid =3D guid_order[g];
+		int idx =3D defs ? guid_defs_find(defs, num_defs, guid) : -1;
+
+		print_guid_group_line(guid, idx >=3D 0 ? &defs[idx] : NULL);
+
+		for (int k =3D 0; k < num_sel_devices; k++) {
+			const struct pmt_device *dev =3D &ctx->devices[dev_indices[k]];
+
+			if (!dev->guid || dev->guid->guid !=3D guid)
+				continue;
+
+			print_dev_entry(dev);
+		}
+		printf("\n");
+	}
+
+	return 0;
+}
+
+static int get_term_columns(void)
+{
+	const char *col_env =3D getenv("COLUMNS");
+	struct winsize ws;
+
+	if (col_env) {
+		int n =3D atoi(col_env);
+
+		if (n > 0)
+			return n;
+	}
+#ifdef TIOCGWINSZ
+	if (ioctl(STDOUT_FILENO, TIOCGWINSZ, &ws) =3D=3D 0 && ws.ws_col)
+		return ws.ws_col;
+#endif
+	return LIST_DEFAULT_COLS;
+}
+
+/*
+ * Print @s word-wrapped at @term_cols, with every line (including the fir=
st)
+ * indented by @indent spaces.  Mirrors the wordwrap() behaviour in
+ * tools/perf/builtin-list.c: words are broken at spaces/tabs; explicit
+ * newlines in the source text force a break and restart the indent.
+ */
+static void print_wrapped_desc(FILE *out, const char *s, int indent, int t=
erm_cols)
+{
+	int column =3D indent;
+	bool at_line_start =3D true;
+
+	fprintf(out, "%*s", indent, "");
+
+	while (*s) {
+		int wlen =3D strcspn(s, " \t\n");
+
+		/* Wrap if the next word would overflow the right margin. */
+		if (!at_line_start && column + 1 + wlen > term_cols) {
+			fprintf(out, "\n%*s", indent, "");
+			column =3D indent;
+			at_line_start =3D true;
+		}
+
+		if (!at_line_start) {
+			fputc(' ', out);
+			column++;
+		}
+
+		fprintf(out, "%.*s", wlen, s);
+		column +=3D wlen;
+		at_line_start =3D false;
+		s +=3D wlen;
+
+		/* Skip spaces/tabs; honour explicit newlines. */
+		while (*s =3D=3D ' ' || *s =3D=3D '\t')
+			s++;
+		if (*s =3D=3D '\n') {
+			fprintf(out, "\n%*s", indent, "");
+			column =3D indent;
+			at_line_start =3D true;
+			s++;
+		}
+	}
+	fputc('\n', out);
+}
+
+static void print_group_header(FILE *out, const char *device_name, const c=
har *platform_group,
+			       const char *name, const char *description, int term_cols)
+{
+	const char *pg =3D (platform_group && *platform_group) ? platform_group :=
 "---";
+	const char *nm =3D (name && *name)                     ? name           :=
 "---";
+
+	fprintf(out, "TELEM %s   %s  %s\n", device_name, pg, nm);
+	if (description && *description)
+		print_wrapped_desc(out, description, LIST_BASE_INDENT, term_cols);
+}
+
+static void print_group_separator(FILE *out, int width)
+{
+	if (width < 8)
+		width =3D 8;
+	if (width > 100)
+		width =3D 100;
+
+	fprintf(out, "%*s", LIST_BASE_INDENT, "");
+
+	for (int i =3D 0; i < width; i++)
+		fputc('-', out);
+	fputc('\n', out);
+}
+
+/*
+ * The caller will free(*out) with free().
+ */
+static int build_list_view(struct list_metric_view **out, int *out_nr, con=
st int *dev_indices,
+			   int num_sel_devices)
+{
+	const struct pmtctl_context *ctx =3D pmtctl_get_ctx();
+	const struct pmt_binding *b  =3D ctx->bindings;
+	struct list_metric_view *arr;
+	int nb =3D ctx->num_bindings;
+	int arr_count =3D 0;
+
+	if (ctx->metrics.total =3D=3D 0)
+		return log_ret(PMTCTL_ERR_CMD_LIST, "no metrics loaded");
+
+	if (!nb)
+		return 0;
+
+	*out =3D NULL;
+	*out_nr =3D 0;
+
+	arr =3D calloc(nb, sizeof(*arr));
+	if (!arr)
+		return -ENOMEM;
+
+	for (int i =3D 0; i < nb; i++) {
+		const struct pmt_metric_def *md  =3D pmt_metrics_at(&ctx->metrics, b[i].=
metric_idx);
+		const struct pmt_device *dev =3D &ctx->devices[b[i].device_idx];
+		struct list_metric_view *m;
+		bool device_selected =3D false;
+		char buf[16];
+
+		if (!md || !dev)
+			continue;
+
+		if (!dev->guid) {
+			log_warn("device %s has no GUID; skipping", dev->name ? dev->name : "?"=
);
+			continue;
+		}
+
+		/* Check if this device is in the selected device list */
+		for (int j =3D 0; j < num_sel_devices; j++) {
+			if (dev_indices[j] =3D=3D b[i].device_idx) {
+				device_selected =3D true;
+				break;
+			}
+		}
+
+		if (!device_selected)
+			continue;
+
+		m =3D &arr[arr_count++];
+
+		snprintf(buf, sizeof(buf), "%08x", dev->guid->guid);
+		m->device_name =3D strdup(buf);
+
+		m->name =3D md->event_name;
+		m->desc =3D md->description;
+		m->platform_group =3D md->platform_group;
+		m->group_name =3D (md->guid && md->guid->name && *md->guid->name)
+				? md->guid->name : NULL;
+		m->group_description =3D (md->guid && md->guid->description && *md->guid=
->description)
+				? md->guid->description : NULL;
+	}
+
+	*out =3D arr;
+	*out_nr =3D arr_count;
+
+	return 0;
+}
+
+/* sort by device_name then metric name */
+static int list_metric_cmp(const void *a, const void *b)
+{
+	const struct list_metric_view *ma =3D a;
+	const struct list_metric_view *mb =3D b;
+	int d;
+
+	d =3D strcmp(ma->device_name, mb->device_name);
+	if (d)
+		return d;
+
+	return strcmp(ma->name, mb->name);
+}
+
+static int do_list_metrics(const struct pmt_global_opts *gopts, const int =
*dev_indices,
+			   int num_sel_devices)
+{
+	FILE *out =3D pmtctl_start_pager(gopts);
+	auto_free struct list_metric_view *mview =3D NULL;
+	int gstart =3D 0;
+	bool first_group =3D true;
+	int nr =3D 0;
+	int ret;
+
+	ret =3D build_list_view(&mview, &nr, dev_indices, num_sel_devices);
+	if (ret)
+		return ret;
+
+	if (!mview) {
+		log_warn("no metrics to view");
+		return 0;
+	}
+
+	if (!nr) {
+		log_warn("no metrics to view after filtering");
+		return 0;
+	}
+
+	qsort(mview, nr, sizeof(mview[0]), list_metric_cmp);
+
+	int term_cols =3D get_term_columns();
+
+	/* Iterate group-by-group (group =3D device_name) */
+
+	while (gstart < nr) {
+		int gend =3D gstart + 1;
+		int max_name =3D (int)strlen(mview[gstart].name);
+
+		while (gend < nr && strcmp(mview[gend].device_name,
+					   mview[gstart].device_name) =3D=3D 0) {
+			int n =3D (int)strlen(mview[gend].name);
+
+			if (n > max_name)
+				max_name =3D n;
+			gend++;
+		}
+
+		if (!first_group)
+			fputc('\n', out);
+		first_group =3D false;
+
+		print_group_header(out,
+				   mview[gstart].device_name,
+				   mview[gstart].platform_group,
+				   mview[gstart].group_name,
+				   mview[gstart].group_description,
+				   term_cols);
+
+		print_group_separator(out, max_name + LIST_CONT_INDENT);
+
+		for (int i =3D gstart; i < gend; i++) {
+			struct list_metric_view *m =3D &mview[i];
+
+			fprintf(out, "%*s%s\n", LIST_BASE_INDENT, "", m->name);
+			if (m->desc && *m->desc) {
+				print_wrapped_desc(out, m->desc,
+						   LIST_BASE_INDENT + LIST_CONT_INDENT,
+						   term_cols);
+			}
+		}
+
+		gstart =3D gend;
+	}
+
+	for (int i =3D 0; i < nr; i++)
+		free((char *)mview[i].device_name);
+
+	pmtctl_finish_pager(out);
+
+	return 0;
+}
+
+static void list_usage(FILE *out)
+{
+	fprintf(out,
+		"Usage: pmtctl list [options]\n"
+		"\n"
+		"List PMT metrics and optionally devices.\n"
+		"\n"
+		"Options:\n"
+		"  -h, --help              Show this help.\n"
+		"  -d, --device <selector> Restrict to a single endpoint.\n"
+		"                          Can be supplied globally before the command o=
r\n"
+		"                          locally after the command as a fallback.\n"
+		"                          Global value takes precedence when both are g=
iven.\n"
+		"                          Selectors: guid=3D<hex>, ep=3D<name>\n"
+		"      --devices           List devices only (no metrics).\n"
+		"      --guids             List GUIDs from defs and system.\n"
+		"  -X, --keep              Keep the last pager screen on exit.\n");
+}
+
+#define OPT_LIST_DEVICES 1000
+#define OPT_LIST_GUIDS   1001
+
+static int parse_list_opts(struct list_opts *opts, int argc, char **argv)
+{
+	int c;
+
+	memset(opts, 0, sizeof(*opts));
+	optind =3D 1;
+
+	static const struct option long_opts[] =3D {
+		{ "help",    no_argument,       NULL, 'h' },
+		{ "device",  required_argument, NULL, 'd' },
+		{ "devices", no_argument,       NULL, OPT_LIST_DEVICES },
+		{ "guids",   no_argument,       NULL, OPT_LIST_GUIDS },
+		{ "keep",    no_argument,       NULL, 'X' },
+		{ 0, 0, 0, 0 }
+	};
+
+	while ((c =3D getopt_long(argc, argv, "hd:X", long_opts, NULL)) !=3D -1) {
+		switch (c) {
+		case 'h':
+			opts->show_help =3D true;
+			break;
+		case 'd':
+			opts->device_selector =3D optarg;
+			break;
+		case OPT_LIST_DEVICES: /* --devices */
+			opts->devices_only =3D true;
+			break;
+		case OPT_LIST_GUIDS:  /* --guids */
+			opts->guids_only =3D true;
+			break;
+		case 'X':
+			opts->keep_screen =3D true;
+			break;
+		case '?':
+		default:
+			return -EINVAL;
+		}
+	}
+
+	if (optind !=3D argc)
+		return log_ret(-EINVAL, "unexpected extra arguments to 'list'");
+
+	return 0;
+}
+
+int cmd_list(int argc, char **argv, const struct pmt_global_opts *gopts)
+{
+	const struct pmtctl_context *ctx;
+	struct pmt_ep_selector sel;
+	struct list_opts opts;
+	auto_free int *dev_indices =3D NULL;
+	int num_sel_devices;
+	int ret;
+
+	ret =3D parse_list_opts(&opts, argc, argv);
+	if (ret) {
+		list_usage(stderr);
+		return PMTCTL_ERR_CMD_PARSE;
+	}
+
+	/*
+	 * Compatibility fallback: prefer global device selector if provided;
+	 * otherwise use command-local --device if supplied after the command.
+	 */
+	if (gopts && gopts->device_selector)
+		opts.device_selector =3D gopts->device_selector;
+
+	if (opts.show_help) {
+		list_usage(stdout);
+		return 0;
+	}
+
+	if (opts.keep_screen) {
+		const char *less =3D getenv("LESS");
+		char buf[512];
+
+		if (less && *less)
+			snprintf(buf, sizeof(buf), "-X %s", less);
+		else
+			snprintf(buf, sizeof(buf), "-X");
+		setenv("LESS", buf, 1);
+	}
+
+	/* Initialize pmtctl to get device context */
+	ret =3D pmtctl_init(gopts);
+	if (ret)
+		return ret;
+
+	/* Apply device selector filter (must precede --devices, --guids,
+	 * and metric listing so all three honour the global -d selector). */
+	ctx =3D pmtctl_get_ctx();
+
+	dev_indices =3D calloc(ctx->num_devices, sizeof(*dev_indices));
+	if (!dev_indices)
+		return log_ret(-ENOMEM, "failed to allocate device indices");
+
+	if (opts.device_selector) {
+		ret =3D pmtctl_parse_ep_selector(opts.device_selector, &sel);
+		if (ret < 0)
+			return ret;
+
+		num_sel_devices =3D pmt_select_devices(ctx, &sel, dev_indices,
+						     ctx->num_devices);
+		if (num_sel_devices < 0)
+			return num_sel_devices;
+
+		if (num_sel_devices =3D=3D 0) {
+			return log_ret(PMTCTL_ERR_CMD_LIST, "no devices match selector '%s'",
+				       opts.device_selector);
+		}
+	} else {
+		/* No selector: use all devices */
+		for (int i =3D 0; i < ctx->num_devices; i++)
+			dev_indices[i] =3D i;
+		num_sel_devices =3D ctx->num_devices;
+	}
+
+	if (opts.devices_only)
+		return do_list_devices(dev_indices, num_sel_devices);
+
+	if (opts.guids_only)
+		return do_list_guids(dev_indices, num_sel_devices);
+
+	return do_list_metrics(gopts, dev_indices, num_sel_devices);
+}
diff --git a/tools/arch/x86/pmtctl/src/main.c b/tools/arch/x86/pmtctl/src/m=
ain.c
index e93b544d9343..d9666956c27b 100644
--- a/tools/arch/x86/pmtctl/src/main.c
+++ b/tools/arch/x86/pmtctl/src/main.c
@@ -42,6 +42,11 @@ static void print_usage(FILE *out)
 		"\n"
 		"  -q, --quiet             Suppress non-essential messages\n"
 		"      --debug             Enable debug logging\n"
+		"\n"
+		"Commands:\n"
+		"  list      List available PMT devices and metrics\n"
+		"\n"
+		"Run 'pmtctl <command> --help' for command-specific options.\n"
 	);
 }
=20
@@ -64,6 +69,8 @@ static int cmd_dispatch(int argc, char **argv)
 	const char *cmd;
 	int option_index =3D 0;
 	int opt;
+	int cmd_argc;
+	char **cmd_argv;
=20
 	while ((opt =3D getopt_long(argc, argv, "+hVJ:qd:", long_options, &option=
_index)) !=3D -1) {
 		switch (opt) {
@@ -103,6 +110,12 @@ static int cmd_dispatch(int argc, char **argv)
 	}
=20
 	cmd =3D argv[optind];
+	cmd_argc =3D argc - optind;
+	cmd_argv =3D &argv[optind];
+
+	if (!strcmp(cmd, "list"))
+		return cmd_list(cmd_argc, cmd_argv, &gopts);
+
 	if (!strcmp(cmd, "--help") || !strcmp(cmd, "help")) {
 		print_usage(stdout);
 		return 0;
--=20
2.43.0

