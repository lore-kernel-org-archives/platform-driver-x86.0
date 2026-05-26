Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B752DFA2F;
	Tue, 26 May 2026 01:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779760084; cv=none; b=jB4HQsWS43FToL6IIoiSLk1Mb7aqpZs09pbkmSSqYpgBCzxB9kNCF3RAc88dIJH2vQlBMCzhw5QEL6cWwK1x+vxsNMotPCHw2uGwEkLX6OttF9uEYEnHjOhCl+DsgFkpxs2YAmb95iyxhVQGz1y6DB96Bmsb3AmW/J9e3mbVqGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779760084; c=relaxed/simple;
	bh=1ni8FEhJPwpKFLPtQAx84NWaBulJha/1W5JUZ2o/E9E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P+MgvZYZXeJongedpYRGznLUgrf6DY7rJLdFiKmDp1oBrzjj2ELAHfaxl9R/mbkCXusbbzZjnmbExDhpiOG5d137L0DgxOSnn7R57GIP5+bX/VkWZW1ZzaR1XlqtRil3VLWAQDS2+CZQj1HuesQ30EkG4eLtJCxMbarALUFh+Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b1fc1hT0; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b1fc1hT0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779760082; x=1811296082;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=1ni8FEhJPwpKFLPtQAx84NWaBulJha/1W5JUZ2o/E9E=;
  b=b1fc1hT00dN9gEpUrq53Dl97srRv8CXpbplxkgoW7v0q0Z8t+BTFXqm0
   LA9u7xP/iDBA2JE+krULs8RrDhUWYz2FCuBwcXIjYfxOavYMCU6HuTuQ9
   syfqfS1yw0ywgx1szOZNUdU69pGw/fZ0Y2IVrduV8q5ZAVTorG3JXPjB/
   IjNNwMvRIiNcOSlGRtAmbixZqbgVmVqozh4xyuHvfOEhcKFbjbauZOScG
   QzpN0mUx2eDAKW+OSM953Y8V3KLUVOBRDFg0iuXkw2q/gnJx0Gp1xHcfZ
   o53qXR60Z9A18CehqSDVqc85aFk7bT68Yr1QgXiNihEO5BRhbcdNubDPS
   w==;
X-CSE-ConnectionGUID: rlfLLN87QDuyiz/xECdNJQ==
X-CSE-MsgGUID: INaw3wlpQ92I7c5dzg4Htg==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80539899"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="80539899"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 18:47:34 -0700
X-CSE-ConnectionGUID: ncQFxe6eS8epGoxuwy7wLw==
X-CSE-MsgGUID: e+vLXSWnQN6UUUrrFKS7Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="272074982"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 18:47:33 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 14/17] tools/arch/x86/pmtctl: Add pmtctl 'stat' command
Date: Mon, 25 May 2026 18:47:12 -0700
Message-ID: <20260526014719.2248380-15-david.e.box@linux.intel.com>
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

Register the 'stat' subcommand, giving pmtctl users a perf stat-like mode
for repeatedly sampling Intel PMT telemetry metrics at a configurable
interval and iteration count. Where the earlier 'list' command shows what
the platform exposes, 'stat' read metrics over time.

Metrics can be selected by name or sampled in 'raw' mode at fixes bit
positions, the latter which doesn't require metric definitions. Output is
available in human-readable tabular form.

Assisted-by: GitHub-Copilot:claude-opus-4.7
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 tools/arch/x86/pmtctl/Makefile                |   3 +
 tools/arch/x86/pmtctl/include/cmd_stat.h      |  75 +++
 .../arch/x86/pmtctl/include/cmd_stat_format.h |  11 +
 tools/arch/x86/pmtctl/include/pmtctl_cli.h    |   2 +
 tools/arch/x86/pmtctl/src/cmd_stat.c          | 501 +++++++++++++++++
 tools/arch/x86/pmtctl/src/cmd_stat_format.c   | 205 +++++++
 tools/arch/x86/pmtctl/src/cmd_stat_run.c      | 528 ++++++++++++++++++
 tools/arch/x86/pmtctl/src/main.c              |   4 +
 8 files changed, 1329 insertions(+)
 create mode 100644 tools/arch/x86/pmtctl/include/cmd_stat.h
 create mode 100644 tools/arch/x86/pmtctl/include/cmd_stat_format.h
 create mode 100644 tools/arch/x86/pmtctl/src/cmd_stat.c
 create mode 100644 tools/arch/x86/pmtctl/src/cmd_stat_format.c
 create mode 100644 tools/arch/x86/pmtctl/src/cmd_stat_run.c

diff --git a/tools/arch/x86/pmtctl/Makefile b/tools/arch/x86/pmtctl/Makefile
index ee6633a6f435..52e50597b5c1 100644
--- a/tools/arch/x86/pmtctl/Makefile
+++ b/tools/arch/x86/pmtctl/Makefile
@@ -42,6 +42,9 @@ SAMPLE_TARGET :=3D $(BUILDDIR)/samples/libpmtctl_sample
 SRC :=3D \
 	$(SRCDIR)/main.c \
 	$(SRCDIR)/cmd_list.c \
+	$(SRCDIR)/cmd_stat.c \
+	$(SRCDIR)/cmd_stat_format.c \
+	$(SRCDIR)/cmd_stat_run.c \
 	$(SRCDIR)/pager.c
=20
 OBJ :=3D $(patsubst $(SRCDIR)/%.c,$(BUILDDIR)/%.o,$(SRC))
diff --git a/tools/arch/x86/pmtctl/include/cmd_stat.h b/tools/arch/x86/pmtc=
tl/include/cmd_stat.h
new file mode 100644
index 000000000000..be4ddfe1e636
--- /dev/null
+++ b/tools/arch/x86/pmtctl/include/cmd_stat.h
@@ -0,0 +1,75 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef PMTCTL_CMD_STAT_H
+#define PMTCTL_CMD_STAT_H
+
+#include <stdbool.h>
+
+#include "lib/device.h"
+#include "lib/metrics_db.h"
+#include "lib/pmtctl.h"
+
+enum pmtctl_fmt {
+	PMTCTL_FMT_DEC,
+	PMTCTL_FMT_HEX,
+};
+
+struct stat_raw_spec {
+	int sample_id;
+	int lsb;
+	int msb;
+};
+
+struct stat_options {
+	char                 **events;
+	int                    nr_events;
+	int                    events_cap;
+
+	char                  *device_selector;
+
+	enum pmtctl_fmt        fmt;
+
+	unsigned int           interval_ms;
+	long                   count;
+
+	struct stat_raw_spec  *raw_specs;
+	int                    nr_raw_specs;
+	int                    raw_specs_cap;
+	bool                   raw;
+
+	bool                   once;
+	bool                   header;
+	bool                   hex;
+	bool                   vertical;
+	bool                   show_help;
+};
+
+/*
+ * stat_item: internal sampling representation
+ *
+ *  - STAT_ITEM_METRIC:
+ *      Uses def/bindings and metrics_db.
+ *  - STAT_ITEM_RAW:
+ *      Uses device + (sample_id, lsb, msb) only. No metrics_db.
+ */
+enum stat_item_kind {
+	STAT_ITEM_METRIC,
+	STAT_ITEM_RAW,
+};
+
+struct stat_item {
+	enum stat_item_kind    kind;
+
+	struct pmt_metric_desc desc;
+
+	/* Metric mode fields */
+	int                    event_idx;     /* index into opts->events[] */
+	struct pmt_device     *dev;
+
+	uint64_t               cur_raw;
+	double                 cur_value;
+	bool                   present;       /* false if metric not bound to thi=
s device */
+};
+
+int stat_run(const struct stat_options *opts);
+
+#endif
diff --git a/tools/arch/x86/pmtctl/include/cmd_stat_format.h b/tools/arch/x=
86/pmtctl/include/cmd_stat_format.h
new file mode 100644
index 000000000000..ad76c2b2bc0b
--- /dev/null
+++ b/tools/arch/x86/pmtctl/include/cmd_stat_format.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef PMTCTL_CMD_STAT_FORMAT_H
+#define PMTCTL_CMD_STAT_FORMAT_H
+
+struct stat_options;
+struct stat_item;
+
+void stat_print_header(const struct stat_options *opts);
+void stat_print_rows(const struct stat_options *opts, const struct stat_it=
em *items, int nitems,
+		     int num_devices, int sample_idx);
+#endif
diff --git a/tools/arch/x86/pmtctl/include/pmtctl_cli.h b/tools/arch/x86/pm=
tctl/include/pmtctl_cli.h
index eb5efb0b650f..76540c3340cb 100644
--- a/tools/arch/x86/pmtctl/include/pmtctl_cli.h
+++ b/tools/arch/x86/pmtctl/include/pmtctl_cli.h
@@ -11,4 +11,6 @@ void pmtctl_finish_pager(FILE *out);
=20
 int cmd_list(int argc, char **argv, const struct pmt_global_opts *gopts);
=20
+int cmd_stat(int argc, char **argv, const struct pmt_global_opts *gopts);
+
 #endif
diff --git a/tools/arch/x86/pmtctl/src/cmd_stat.c b/tools/arch/x86/pmtctl/s=
rc/cmd_stat.c
new file mode 100644
index 000000000000..7825d7c9a44e
--- /dev/null
+++ b/tools/arch/x86/pmtctl/src/cmd_stat.c
@@ -0,0 +1,501 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <errno.h>
+#include <getopt.h>
+#include <limits.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+
+#define LOG_PREFIX "cmd_stat"
+#include "lib/log.h"
+
+#include "lib/common.h"
+#include "lib/pmtctl.h"
+
+#include "cmd_stat.h"
+#include "pmtctl_cli.h"
+
+#define CMD_STAT_DEFAULT_INTERVAL_MS 1000
+
+static int stat_add_event(struct stat_options *opts, const char *spec)
+{
+	/* Grow the events array by doubling; start at 8 slots. */
+	if (opts->nr_events =3D=3D opts->events_cap) {
+		int new_cap =3D opts->events_cap ? opts->events_cap * 2 : 8;
+		char **tmp =3D realloc(opts->events, new_cap * sizeof(char *));
+
+		if (!tmp)
+			return log_ret(-ENOMEM, "could not allocate");
+
+		opts->events =3D tmp;
+		opts->events_cap =3D new_cap;
+	}
+
+	opts->events[opts->nr_events++] =3D xstrdup(spec);
+
+	return 0;
+}
+
+static int stat_add_event_list(struct stat_options *opts, const char *arg)
+{
+	/* arg can be "a,b,c" */
+	char *copy =3D xstrdup(arg);
+	char *p =3D copy;
+	char *saveptr =3D NULL;
+	int ret =3D 0;
+
+	for (;;) {
+		char *tok =3D strtok_r(p, ",", &saveptr);
+
+		if (!tok)
+			break;
+
+		ret =3D stat_add_event(opts, tok);
+		if (ret < 0)
+			break;
+
+		p =3D NULL;
+	}
+
+	free(copy);
+
+	return ret;
+}
+
+/*
+ * Strict decimal-int parser used by stat_parse_raw_arg().
+ *
+ * Unlike `strtol(s, NULL, 10)`, this:
+ *   - rejects NULL or empty input (e.g. "id=3D" with no value),
+ *   - rejects partial conversions ("foo", "12x"),
+ *   - accepts an optional leading '+' or '-'.
+ * On success, *out receives the parsed value and 0 is returned.
+ */
+static int parse_decimal_int(const char *s, int *out)
+{
+	char *end;
+	long v;
+
+	if (!s || *s =3D=3D '\0')
+		return -1;
+
+	errno =3D 0;
+	v =3D strtol(s, &end, 10);
+	if (errno || end =3D=3D s || *end !=3D '\0')
+		return -1;
+	if (v < INT_MIN || v > INT_MAX)
+		return -1;
+
+	*out =3D (int)v;
+	return 0;
+}
+
+/*
+ * Parse one --raw argument of the form:
+ *     id=3D<num>[,lsb=3D<num>][,msb=3D<num>]
+ *
+ * Duplicate keys are rejected.
+ */
+static int stat_parse_raw_arg(struct stat_options *opts, const char *arg)
+{
+	auto_free char *copy =3D xstrdup(arg);
+	char *p =3D copy;
+	char *tok, *saveptr =3D NULL;
+	bool seen_id  =3D false;
+	bool seen_lsb =3D false;
+	bool seen_msb =3D false;
+	int id  =3D -1;
+	int lsb =3D -1;
+	int msb =3D -1;
+
+	/*
+	 * Reject empty input and structurally invalid lists *before*
+	 * strtok_r(), which silently collapses consecutive and
+	 * leading/trailing separators.
+	 */
+	if (*arg =3D=3D '\0' || *arg =3D=3D ',' || arg[strlen(arg) - 1] =3D=3D ',=
' ||
+	    strstr(arg, ",,") !=3D NULL) {
+		return log_ret(PMTCTL_ERR_CMD_PARSE,
+			       "invalid --raw argument '%s' (empty token)", arg);
+	}
+
+	while ((tok =3D strtok_r(p, ",", &saveptr)) !=3D NULL) {
+		char *eq;
+
+		p =3D NULL;
+
+		eq =3D strchr(tok, '=3D');
+		if (!eq) {
+			return log_ret(PMTCTL_ERR_CMD_PARSE,
+				       "invalid --raw token '%s' (expected key=3Dvalue)", tok);
+		}
+
+		*eq =3D '\0';
+		const char *key =3D tok;
+		const char *val =3D eq + 1;
+
+		if (!strcmp(key, "id")) {
+			if (seen_id) {
+				return log_ret(PMTCTL_ERR_CMD_PARSE,
+					       "duplicate key 'id' in --raw argument");
+			}
+
+			seen_id =3D true;
+
+			if (parse_decimal_int(val, &id))
+				return log_ret(PMTCTL_ERR_CMD_PARSE,
+					       "id must be a decimal integer, got '%s'", val);
+			if (id < 0)
+				return log_ret(PMTCTL_ERR_CMD_PARSE, "id must be >=3D 0");
+
+		} else if (!strcmp(key, "lsb")) {
+			if (seen_lsb) {
+				return log_ret(PMTCTL_ERR_CMD_PARSE,
+					       "duplicate key 'lsb' in --raw argument");
+			}
+
+			seen_lsb =3D true;
+
+			if (parse_decimal_int(val, &lsb))
+				return log_ret(PMTCTL_ERR_CMD_PARSE,
+					       "lsb must be a decimal integer, got '%s'", val);
+			if (lsb < 0 || lsb >=3D 64)
+				return log_ret(PMTCTL_ERR_CMD_PARSE, "lsb must be in [0,63]");
+
+		} else if (!strcmp(key, "msb")) {
+			if (seen_msb) {
+				return log_ret(PMTCTL_ERR_CMD_PARSE,
+					       "duplicate key 'msb' in --raw argument");
+			}
+
+			seen_msb =3D true;
+
+			if (parse_decimal_int(val, &msb))
+				return log_ret(PMTCTL_ERR_CMD_PARSE,
+					       "msb must be a decimal integer, got '%s'", val);
+			if (msb < 0 || msb >=3D 64)
+				return log_ret(PMTCTL_ERR_CMD_PARSE, "msb must be in [0,63]");
+
+		} else {
+			return log_ret(PMTCTL_ERR_CMD_PARSE,
+				       "unknown key '%s' in --raw argument", key);
+		}
+	}
+
+	/* Required: id */
+	if (id < 0)
+		return log_ret(PMTCTL_ERR_CMD_PARSE, "--raw requires at least 'id=3D<num=
>'");
+
+	/* Defaults */
+	if (lsb < 0)
+		lsb =3D 0;
+	if (msb < 0)
+		msb =3D 63;
+
+	if (lsb > msb) {
+		return log_ret(PMTCTL_ERR_CMD_PARSE,
+			       "lsb (%d) cannot be greater than msb (%d)", lsb, msb);
+	}
+
+	/* Append new raw spec */
+	if (opts->nr_raw_specs =3D=3D opts->raw_specs_cap) {
+		int new_cap =3D opts->raw_specs_cap ? opts->raw_specs_cap * 2 : 8;
+		struct stat_raw_spec *tmp =3D realloc(opts->raw_specs, new_cap * sizeof(=
*tmp));
+
+		if (!tmp)
+			return log_ret(-ENOMEM, "could not prepare raw collection");
+
+		opts->raw_specs =3D tmp;
+		opts->raw_specs_cap =3D new_cap;
+	}
+
+	opts->raw_specs[opts->nr_raw_specs].sample_id =3D id;
+	opts->raw_specs[opts->nr_raw_specs].lsb =3D lsb;
+	opts->raw_specs[opts->nr_raw_specs].msb =3D msb;
+	opts->nr_raw_specs++;
+
+	return 0;
+}
+
+static void stat_usage_full(FILE *out)
+{
+	fprintf(out,
+		"Usage:\n"
+		"    pmtctl stat [options] -e <metric>[,<metric>...] ...\n"
+		"    pmtctl stat [options] --raw id=3D<n>[,lsb=3D<n>][,msb=3D<n>] ...\n"
+		"\n"
+		"Purpose:\n"
+		"    Collect metric values over time (similar to 'perf stat').\n"
+		"\n"
+		"Options:\n"
+		"    -h, --help\n"
+		"        Show help.\n"
+		"\n"
+		"    -e, --event <spec>\n"
+		"        Metric name or comma-separated list; may be repeated.\n"
+		"        More than one metric requires --vertical.\n"
+		"\n"
+		"    Device selection:\n"
+		"        -d, --device <selector>\n"
+		"            Restrict to a device/endpoint. Can be supplied globally bef=
ore\n"
+		"            the command (recommended) or locally after the command as a=
\n"
+		"            fallback. Global value takes precedence when both are given=
.\n"
+		"            Selector forms: guid=3D<hex>, ep=3D<endpoint_name>\n"
+		"\n"
+		"    -i, --interval <ms>\n"
+		"        Sampling interval (default 1000 ms).\n"
+		"\n"
+		"    -c, --count <N>\n"
+		"        Number of samples (default infinite).\n"
+		"\n"
+		"    --once\n"
+		"        Single snapshot, exit.\n"
+		"\n"
+		"    --raw id=3D<n>[,lsb=3D<n>][,msb=3D<n>]\n"
+		"        Read raw sample values by sample id with optional bit slicing.\=
n"
+		"        May be specified multiple times.\n"
+		"          id     : required, sample id (>=3D 0)\n"
+		"          lsb    : optional, default 0 if omitted\n"
+		"          msb    : optional, default 63 if omitted\n"
+		"        Constraints:\n"
+		"          0 <=3D lsb <=3D msb <=3D 63\n"
+		"        -e/--event and --raw are mutually exclusive.\n"
+		"\n"
+		"    --header / --no-header\n"
+		"        Control header printing.\n"
+		"\n"
+		"    --hex\n"
+		"        Output values in hex.\n"
+		"\n"
+		"    --vertical\n"
+		"        One line per metric per sample: time_ms metric value.\n"
+		"\n"
+		"On read failure, the value prints as NaN.\n"
+		"\n"
+		"Examples:\n"
+		"    pmtctl stat -e temp_socket\n"
+		"    pmtctl stat -e socket_power --interval 500\n"
+		"    pmtctl stat -e fw_version_0 --once\n"
+		"    pmtctl stat -e temp_core0 -d guid=3D27971628\n"
+		"    pmtctl stat --raw id=3D2\n"
+		"    pmtctl stat --raw id=3D2,lsb=3D16,msb=3D31\n"
+		"    pmtctl stat --raw id=3D2,msb=3D7 --raw id=3D3,lsb=3D8,msb=3D15\n"
+	);
+}
+
+static void stat_usage_short(FILE *out)
+{
+	fprintf(out,
+		"Usage:\n"
+		"    pmtctl stat [options] -e <metric>[,<metric>...] ...\n"
+		"    pmtctl stat [options] --raw id=3D<n>[,lsb=3D<n>][,msb=3D<n>] ...\n"
+		"\n"
+		"Run 'pmtctl stat --help' for full help.\n"
+	);
+}
+
+static int stat_parse_options(int argc, char **argv, struct stat_options *=
opts)
+{
+	enum {
+		OPT_ONCE =3D 1000,
+		OPT_RAW,
+		OPT_HEADER,
+		OPT_NO_HEADER,
+		OPT_HEX,
+		OPT_VERTICAL,
+	};
+
+	static const struct option long_opts[] =3D {
+		{ "help",      no_argument,       NULL, 'h' },
+		{ "event",     required_argument, NULL, 'e' },
+		{ "device",    required_argument, NULL, 'd' },
+		{ "interval",  required_argument, NULL, 'i' },
+		{ "count",     required_argument, NULL, 'c' },
+
+		{ "once",      no_argument,       NULL, OPT_ONCE },
+		{ "raw",       required_argument, NULL, OPT_RAW },
+		{ "header",    no_argument,       NULL, OPT_HEADER },
+		{ "no-header", no_argument,       NULL, OPT_NO_HEADER },
+		{ "hex",       no_argument,       NULL, OPT_HEX },
+		{ "vertical",  no_argument,       NULL, OPT_VERTICAL },
+
+		{ 0, 0, 0, 0 }
+	};
+
+	int c;
+	int ret;
+
+	optind =3D 1;
+
+	while ((c =3D getopt_long(argc, argv, "he:d:i:c:", long_opts, NULL)) !=3D=
 -1) {
+		switch (c) {
+		case 'h':
+			opts->show_help =3D true;
+			return 0;
+
+		case 'e':
+			ret =3D stat_add_event_list(opts, optarg);
+			if (ret < 0)
+				return ret;
+			break;
+
+		case 'd':
+			if (opts->device_selector) {
+				return log_ret(PMTCTL_ERR_CMD_PARSE,
+					       "multiple --device options are not allowed");
+			}
+
+			opts->device_selector =3D xstrdup(optarg);
+			break;
+
+		case 'i': {
+			long v =3D strtol(optarg, NULL, 10);
+
+			if (v <=3D 0)
+				return log_ret(PMTCTL_ERR_CMD_PARSE, "interval must be > 0");
+
+			opts->interval_ms =3D (unsigned int)v;
+			break;
+		}
+
+		case 'c': {
+			long v =3D strtol(optarg, NULL, 10);
+
+			if (v <=3D 0)
+				return log_ret(PMTCTL_ERR_CMD_PARSE, "count must be > 0");
+
+			opts->count =3D v;
+			break;
+		}
+
+		case OPT_ONCE:
+			opts->once =3D true;
+			opts->count =3D 1;
+			opts->interval_ms =3D 0; /* oneshot, no sleep */
+			break;
+
+		case OPT_RAW:
+			ret =3D stat_parse_raw_arg(opts, optarg);
+			if (ret < 0)
+				return ret;
+			break;
+
+		case OPT_HEADER:
+			opts->header =3D true;
+			break;
+
+		case OPT_NO_HEADER:
+			opts->header =3D false;
+			break;
+
+		case OPT_HEX:
+			opts->hex =3D true;
+			break;
+
+		case OPT_VERTICAL:
+			opts->vertical =3D true;
+			break;
+
+		default:
+			stat_usage_short(stderr);
+			return PMTCTL_ERR_CMD_PARSE;
+		}
+	}
+
+	/* If the user explicitly requested hex output, set the format accordingl=
y */
+	if (opts->hex)
+		opts->fmt =3D PMTCTL_FMT_HEX;
+	else
+		opts->fmt =3D PMTCTL_FMT_DEC;
+
+	if (opts->nr_events =3D=3D 0 && opts->nr_raw_specs =3D=3D 0) {
+		log_err(PMTCTL_ERR_CMD_PARSE, "requires -e/--event or --raw");
+		stat_usage_short(stderr);
+		return PMTCTL_ERR_CMD_PARSE;
+	}
+
+	if (optind < argc) {
+		log_err(PMTCTL_ERR_CMD_PARSE, "unexpected extra arguments");
+		stat_usage_short(stderr);
+		return PMTCTL_ERR_CMD_PARSE;
+	}
+
+	if (opts->nr_events > 0 && opts->nr_raw_specs > 0) {
+		log_err(PMTCTL_ERR_CMD_PARSE, "-e/--event and --raw are mutually exclusi=
ve");
+		return PMTCTL_ERR_CMD_PARSE;
+	}
+
+	/* Horizontal mode (default) supports only one metric */
+	if (!opts->vertical && opts->nr_events > 1) {
+		log_err(PMTCTL_ERR_CMD_PARSE,
+			"horizontal mode supports only one metric at a time (use --vertical for=
 multiple metrics)");
+		return PMTCTL_ERR_CMD_PARSE;
+	}
+
+	return 0;
+}
+
+static void stat_opts_init(struct stat_options *opts)
+{
+	memset(opts, 0, sizeof(*opts));
+
+	opts->interval_ms =3D CMD_STAT_DEFAULT_INTERVAL_MS;
+	opts->count       =3D -1;    /* infinite */
+	opts->header      =3D true;
+	opts->fmt         =3D PMTCTL_FMT_DEC;
+}
+
+static void stat_opts_finalize(struct stat_options *opts)
+{
+	int i;
+
+	for (i =3D 0; i < opts->nr_events; i++)
+		free(opts->events[i]);
+
+	free(opts->events);
+	free(opts->device_selector);
+	free(opts->raw_specs);
+}
+
+int cmd_stat(int argc, char **argv, const struct pmt_global_opts *gopts)
+{
+	struct stat_options opts;
+	int ret;
+
+	stat_opts_init(&opts);
+
+	ret =3D stat_parse_options(argc, argv, &opts);
+	if (ret !=3D 0) {
+		stat_opts_finalize(&opts);
+		return ret;
+	}
+
+	if (opts.show_help) {
+		stat_usage_full(stdout);
+		stat_opts_finalize(&opts);
+		return 0;
+	}
+
+	ret =3D pmtctl_init(gopts);
+	if (ret)
+		return ret;
+
+	if (opts.device_selector && gopts && gopts->device_selector) {
+		log_err(PMTCTL_ERR_CMD_PARSE,
+			"multiple --device options are not allowed (global and command-local)");
+		stat_opts_finalize(&opts);
+
+		return PMTCTL_ERR_CMD_PARSE;
+	}
+
+	/* If no command-local selector, inherit the global one (if any). */
+	if (!opts.device_selector && gopts && gopts->device_selector)
+		opts.device_selector =3D xstrdup(gopts->device_selector);
+
+	ret =3D stat_run(&opts);
+
+	stat_opts_finalize(&opts);
+
+	return ret;
+}
diff --git a/tools/arch/x86/pmtctl/src/cmd_stat_format.c b/tools/arch/x86/p=
mtctl/src/cmd_stat_format.c
new file mode 100644
index 000000000000..4c0ca21c32c4
--- /dev/null
+++ b/tools/arch/x86/pmtctl/src/cmd_stat_format.c
@@ -0,0 +1,205 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Output format helpers for pmtctl stat.
+ * Implements text output for the header and per-sample rows.
+ */
+
+#include <inttypes.h>
+#include <stdio.h>
+#include <math.h>
+
+#include "cmd_stat.h"
+#include "cmd_stat_format.h"
+
+/* Column widths (characters) shared by header and row formatters. */
+#define STAT_COL_W_SAMPLE	6
+#define STAT_COL_W_TIME		7
+#define STAT_COL_W_DEV_H	18	/* horizontal-mode device column */
+#define STAT_COL_W_DEV_V	20	/* vertical-mode device column */
+#define STAT_COL_W_METRIC_V	20	/* vertical-mode metric column */
+#define STAT_COL_W_VALUE_V	40	/* vertical-mode value column (header underl=
ine) */
+#define STAT_COL_W_EVENT	28	/* horizontal-mode per-event value column */
+
+/* 4-space gap between the device column and the per-event value columns. =
*/
+#define STAT_COL_GAP		"    "
+
+/* Long enough dash string to satisfy any column width above. */
+#define STAT_DASHES \
+	"----------------------------------------------------------------"
+
+/*
+ * Buffer size for a stringified uint64 sample value.
+ * Worst case: decimal 18446744073709551615 (20 chars) or "0x" + 16 hex di=
gits;
+ * 32 leaves headroom for a NUL and any future prefix/suffix.
+ */
+#define STAT_VALUE_BUF_SIZE	32
+
+static void print_u64_field(FILE *out, enum pmtctl_fmt fmt, const struct s=
tat_item *it)
+{
+	if (!it->present || isnan(it->cur_value)) {
+		fprintf(out, STAT_COL_GAP "%*s", STAT_COL_W_EVENT, "NaN");
+		return;
+	}
+
+	switch (fmt) {
+	case PMTCTL_FMT_HEX: {
+		char buf[STAT_VALUE_BUF_SIZE];
+
+		snprintf(buf, sizeof(buf), "0x%" PRIx64, it->cur_raw);
+		fprintf(out, STAT_COL_GAP "%*s", STAT_COL_W_EVENT, buf);
+		break;
+	}
+	case PMTCTL_FMT_DEC:
+	default:
+		fprintf(out, STAT_COL_GAP "%*" PRIu64, STAT_COL_W_EVENT, it->cur_raw);
+		break;
+	}
+}
+
+void stat_print_header(const struct stat_options *opts)
+{
+	if (!opts->header)
+		return;
+
+	if (opts->vertical) {
+		fprintf(stdout, "%-*s  %-*s  %-*s  %-*s  %s\n",
+			STAT_COL_W_SAMPLE,   "sample",
+			STAT_COL_W_TIME,     "time_ms",
+			STAT_COL_W_DEV_V,    "device",
+			STAT_COL_W_METRIC_V, "metric",
+			"value");
+		fprintf(stdout, "%.*s  %.*s  %.*s  %.*s  %.*s\n",
+			STAT_COL_W_SAMPLE,   STAT_DASHES,
+			STAT_COL_W_TIME,     STAT_DASHES,
+			STAT_COL_W_DEV_V,    STAT_DASHES,
+			STAT_COL_W_METRIC_V, STAT_DASHES,
+			STAT_COL_W_VALUE_V,  STAT_DASHES);
+	} else {
+		int nr_value_cols =3D opts->nr_raw_specs > 0
+			? opts->nr_raw_specs : opts->nr_events;
+
+		fprintf(stdout, "%-*s  %-*s  %-*s",
+			STAT_COL_W_SAMPLE, "sample",
+			STAT_COL_W_TIME,   "time_ms",
+			STAT_COL_W_DEV_H,  "device");
+
+		if (opts->nr_raw_specs > 0) {
+			for (int r =3D 0; r < opts->nr_raw_specs; r++) {
+				const struct stat_raw_spec *rs =3D &opts->raw_specs[r];
+				char label[STAT_COL_W_EVENT + 1];
+
+				snprintf(label, sizeof(label),
+					 "raw[id=3D%d,lsb=3D%d,msb=3D%d]",
+					 rs->sample_id, rs->lsb, rs->msb);
+				fprintf(stdout, STAT_COL_GAP "%*.*s",
+					STAT_COL_W_EVENT, STAT_COL_W_EVENT, label);
+			}
+		} else {
+			for (int e =3D 0; e < opts->nr_events; e++)
+				fprintf(stdout, STAT_COL_GAP "%*.*s",
+					STAT_COL_W_EVENT, STAT_COL_W_EVENT, opts->events[e]);
+		}
+
+		fputc('\n', stdout);
+
+		fprintf(stdout, "%.*s  %.*s  %.*s",
+			STAT_COL_W_SAMPLE, STAT_DASHES,
+			STAT_COL_W_TIME,   STAT_DASHES,
+			STAT_COL_W_DEV_H,  STAT_DASHES);
+
+		for (int c =3D 0; c < nr_value_cols; c++)
+			fprintf(stdout, STAT_COL_GAP "%.*s", STAT_COL_W_EVENT, STAT_DASHES);
+
+		fputc('\n', stdout);
+	}
+}
+
+static const char *dev_name_or_unknown(const struct pmt_device *dev)
+{
+	return dev && dev->name ? dev->name : "(unknown)";
+}
+
+static void stat_print_rows_vertical(const struct stat_options *opts,
+				     const struct stat_item *items, int cols_per_dev,
+				     int num_devices, int sample_idx, unsigned long time_ms)
+{
+	for (int d =3D 0; d < num_devices; d++) {
+		const struct stat_item *row =3D &items[d * cols_per_dev];
+		const char *dev_name =3D dev_name_or_unknown(row->dev);
+
+		for (int c =3D 0; c < cols_per_dev; c++) {
+			const struct stat_item *it =3D &row[c];
+			char metric_buf[64];
+			char value_buf[STAT_VALUE_BUF_SIZE];
+
+			if (it->kind =3D=3D STAT_ITEM_RAW) {
+				snprintf(metric_buf, sizeof(metric_buf),
+					 "raw[id=3D%u,lsb=3D%u,msb=3D%u]",
+					 it->desc.raw_sample_id,
+					 it->desc.raw_lsb,
+					 it->desc.raw_msb);
+			} else {
+				snprintf(metric_buf, sizeof(metric_buf), "%.*s",
+					 STAT_COL_W_METRIC_V, opts->events[c]);
+			}
+
+			if (!it->present || isnan(it->cur_value)) {
+				snprintf(value_buf, sizeof(value_buf), "NaN");
+			} else {
+				switch (opts->fmt) {
+				case PMTCTL_FMT_HEX:
+					snprintf(value_buf, sizeof(value_buf),
+						 "0x%" PRIx64, it->cur_raw);
+					break;
+				case PMTCTL_FMT_DEC:
+				default:
+					snprintf(value_buf, sizeof(value_buf),
+						 "%" PRIu64, it->cur_raw);
+					break;
+				}
+			}
+
+			fprintf(stdout, "%-*d  %-*lu  %-*s  %-*s  %s\n",
+				STAT_COL_W_SAMPLE,   sample_idx,
+				STAT_COL_W_TIME,     time_ms,
+				STAT_COL_W_DEV_V,    dev_name,
+				STAT_COL_W_METRIC_V, metric_buf,
+				value_buf);
+		}
+	}
+}
+
+static void stat_print_rows_horizontal(const struct stat_options *opts,
+				       const struct stat_item *items, int cols_per_dev,
+				       int num_devices, int sample_idx, unsigned long time_ms)
+{
+	for (int d =3D 0; d < num_devices; d++) {
+		const struct stat_item *row =3D &items[d * cols_per_dev];
+
+		fprintf(stdout, "%-*d  %-*lu  %-*s",
+			STAT_COL_W_SAMPLE, sample_idx,
+			STAT_COL_W_TIME,   time_ms,
+			STAT_COL_W_DEV_H,  dev_name_or_unknown(row->dev));
+
+		for (int c =3D 0; c < cols_per_dev; c++)
+			print_u64_field(stdout, opts->fmt, &row[c]);
+
+		fputc('\n', stdout);
+	}
+}
+
+void stat_print_rows(const struct stat_options *opts, const struct stat_it=
em *items, int nitems,
+		     int num_devices, int sample_idx)
+{
+	unsigned long time_ms =3D (unsigned long)sample_idx * opts->interval_ms;
+	int cols_per_dev =3D nitems / num_devices;
+
+	if (opts->vertical)
+		stat_print_rows_vertical(opts, items, cols_per_dev, num_devices,
+					 sample_idx, time_ms);
+	else
+		stat_print_rows_horizontal(opts, items, cols_per_dev, num_devices,
+					   sample_idx, time_ms);
+
+	fflush(stdout);
+}
diff --git a/tools/arch/x86/pmtctl/src/cmd_stat_run.c b/tools/arch/x86/pmtc=
tl/src/cmd_stat_run.c
new file mode 100644
index 000000000000..bd461f30cb68
--- /dev/null
+++ b/tools/arch/x86/pmtctl/src/cmd_stat_run.c
@@ -0,0 +1,528 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <errno.h>
+#include <fcntl.h>
+#include <math.h>
+#include <signal.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdlib.h>
+#include <string.h>
+#include <time.h>
+#include <unistd.h>
+
+#define LOG_PREFIX "cmd_stat_run"
+#include "lib/log.h"
+
+#include "lib/common.h"
+#include "lib/device.h"
+#include "lib/metrics_db.h"
+#include "lib/pmtctl.h"
+#include "lib/pmtctl_context.h"
+
+#include "cmd_stat.h"
+#include "cmd_stat_format.h"
+
+static volatile sig_atomic_t stat_stop;
+
+static void stat_sigint(int sig)
+{
+	(void)sig;
+	stat_stop =3D 1;
+}
+
+/*
+ * Build raw-mode items:
+ *   - Devices: given by dev_indices[0..num_sel_devices-1]
+ *   - Raw specs: opts->raw_specs[0..nr_raw_specs-1]
+ *
+ * One item per (device, raw_spec).
+ */
+static int stat_build_raw_items(const struct stat_options *opts, const str=
uct pmtctl_context *ctx,
+				const int *dev_indices, int num_sel_devices,
+				struct stat_item **out_items, int *out_nitems)
+{
+	struct stat_item *items;
+	int nitems;
+	int d, r;
+
+	/* Initialize output parameters */
+	*out_items =3D NULL;
+	*out_nitems =3D 0;
+
+	nitems =3D num_sel_devices * opts->nr_raw_specs;
+
+	items =3D calloc(nitems, sizeof(*items));
+	if (!items)
+		return log_ret(-ENOMEM, "could not create item list");
+
+	/* Grid layout: device-major, raw-spec-minor */
+	for (d =3D 0; d < num_sel_devices; d++) {
+		int dev_idx =3D dev_indices[d];
+		struct pmt_device *dev =3D &ctx->devices[dev_idx];
+
+		for (r =3D 0; r < opts->nr_raw_specs; r++) {
+			const struct stat_raw_spec *rs =3D &opts->raw_specs[r];
+			struct stat_item *it =3D &items[d * opts->nr_raw_specs + r];
+
+			it->kind      =3D STAT_ITEM_RAW;
+			it->event_idx =3D -1;
+			it->dev       =3D dev;
+			it->present   =3D true; /* raw is device-only; no bindings */
+
+			it->desc.def           =3D NULL;
+			it->desc.dev           =3D dev;
+			it->desc.name          =3D NULL;      /* formatter can synthesize a lab=
el */
+			it->desc.guid_inst     =3D dev->guid_inst;
+			it->desc.raw_sample_id =3D rs->sample_id;
+			it->desc.raw_lsb       =3D rs->lsb;
+			it->desc.raw_msb       =3D rs->msb;
+		}
+	}
+
+	*out_items  =3D items;
+	*out_nitems =3D nitems;
+
+	return 0;
+}
+
+static int build_present_guid_list(const struct pmtctl_context *ctx, const=
 int *dev_indices,
+				   int num_sel_devices, uint32_t **out_guids, int *out_nr_guids)
+{
+	uint32_t *guids;
+	int nguids =3D 0;
+
+	guids =3D calloc(num_sel_devices, sizeof(*guids));
+	if (!guids)
+		return log_ret(-ENOMEM, "could not create guid list");
+
+	for (int d =3D 0; d < num_sel_devices; d++) {
+		int di =3D dev_indices[d];
+		uint32_t g;
+		bool seen =3D false;
+
+		if (di < 0 || di >=3D ctx->num_devices)
+			continue;
+
+		g =3D ctx->devices[di].guid ? ctx->devices[di].guid->guid : 0;
+
+		for (int i =3D 0; i < nguids; i++) {
+			if (guids[i] =3D=3D g) {
+				seen =3D true;
+				break;
+			}
+		}
+		if (seen)
+			continue;
+
+		guids[nguids++] =3D g;
+	}
+
+	*out_guids =3D guids;
+	*out_nr_guids =3D nguids;
+
+	return 0;
+}
+
+static int find_metric_for_guid(const struct pmt_metrics_db *db, uint32_t =
guid, const char *name)
+{
+	for (int i =3D 0; i < db->total; i++) {
+		const struct pmt_metric_def *def =3D pmt_metrics_at(db, i);
+
+		if (!def || !def->event_name)
+			continue;
+
+		if (!def->guid || def->guid->guid !=3D guid)
+			continue;
+
+		if (strcmp(def->event_name, name) =3D=3D 0)
+			return i;
+	}
+
+	return -1;
+}
+
+static int stat_build_metric_items(const struct stat_options *opts,
+				   const struct pmtctl_context *ctx, const int *dev_indices,
+				   int num_sel_devices, struct stat_item **out_items,
+				   int *out_nitems)
+{
+	const struct pmt_metrics_db *db;
+	struct stat_item *items =3D NULL;
+	auto_free uint32_t *guids =3D NULL;
+	auto_free int *metric_by_guid =3D NULL;
+	int nguids =3D 0;
+	int nitems;
+	int ret;
+
+	/* Initialize output parameters */
+	*out_items =3D NULL;
+	*out_nitems =3D 0;
+
+	/* Build deduplicated list of GUIDs for the selected devices */
+	ret =3D build_present_guid_list(ctx, dev_indices, num_sel_devices, &guids=
, &nguids);
+	if (ret)
+		return ret;
+
+	if (nguids =3D=3D 0)
+		return log_ret(PMTCTL_ERR_CMD_STAT, "no GUIDs found for selected devices=
");
+
+	/*
+	 * metric_by_guid[g * nr_events + e] gives the metric_idx for
+	 * GUID guids[g] and event opts->events[e], or -1 if not present.
+	 */
+	metric_by_guid =3D malloc(sizeof(int) * nguids * opts->nr_events);
+	if (!metric_by_guid)
+		return log_ret(-ENOMEM, "could not create event list");
+
+	db =3D &ctx->metrics;
+
+	for (int g =3D 0; g < nguids; g++) {
+		for (int e =3D 0; e < opts->nr_events; e++) {
+			metric_by_guid[g * opts->nr_events + e] =3D
+				find_metric_for_guid(db, guids[g], opts->events[e]);
+		}
+	}
+
+	/* Enforce: each requested event must be present on at least one GUID */
+	for (int e =3D 0; e < opts->nr_events; e++) {
+		bool found =3D false;
+
+		for (int g =3D 0; g < nguids; g++) {
+			if (metric_by_guid[g * opts->nr_events + e] >=3D 0) {
+				found =3D true;
+				break;
+			}
+		}
+
+		if (!found)
+			return log_ret(PMTCTL_ERR_BAD_ARG, "unknown event '%s'", opts->events[e=
]);
+	}
+
+	nitems =3D num_sel_devices * opts->nr_events;
+	items =3D calloc(nitems, sizeof(*items));
+	if (!items)
+		return log_ret(-ENOMEM, "could not create item list");
+
+	/* Grid layout: selected-device-major, event-minor */
+	for (int d =3D 0; d < num_sel_devices; d++) {
+		int dev_idx =3D dev_indices[d];
+		struct pmt_device *dev;
+		uint32_t guid;
+		int guid_idx =3D -1;
+
+		if (dev_idx < 0 || dev_idx >=3D ctx->num_devices)
+			continue;
+
+		dev =3D &ctx->devices[dev_idx];
+		guid =3D dev->guid ? dev->guid->guid : 0;
+
+		/* Find this device's GUID index */
+		for (int g =3D 0; g < nguids; g++) {
+			if (guids[g] =3D=3D guid) {
+				guid_idx =3D g;
+				break;
+			}
+		}
+		if (guid_idx < 0)
+			continue; /* should not happen if build_present_guid_list is correct */
+
+		for (int e =3D 0; e < opts->nr_events; e++) {
+			int metric_idx =3D metric_by_guid[guid_idx * opts->nr_events + e];
+			const struct pmt_metric_def *def;
+			struct stat_item *it =3D &items[d * opts->nr_events + e];
+
+			it->kind      =3D STAT_ITEM_METRIC;
+			it->event_idx =3D e;
+			it->dev       =3D dev;
+			it->present   =3D false; /* default */
+
+			if (metric_idx < 0)
+				continue; /* metric not defined for this GUID */
+
+			def =3D pmt_metrics_at(db, metric_idx);
+			if (!def)
+				continue;
+
+			it->desc.def       =3D def;
+			it->desc.dev       =3D dev;
+			it->desc.name      =3D def->event_name;
+			it->desc.guid_inst =3D dev->guid_inst;
+			it->present        =3D true;
+		}
+	}
+
+	*out_items  =3D items;
+	*out_nitems =3D nitems;
+
+	return 0;
+}
+
+/*
+ * Drop devices that do not contain any of the requested events.
+ * This keeps the output rows limited to devices where at least one metric
+ * binding is present, avoiding rows of all-NaN values.
+ */
+static int filter_metric_items_present(const struct stat_options *opts, st=
ruct stat_item **items,
+				       int *nitems, int *num_devices)
+{
+	struct stat_item *old;
+	struct stat_item *filtered;
+	size_t row_bytes;
+	int cols_per_dev;
+	int keep =3D 0;
+	int devs;
+
+	cols_per_dev =3D opts->nr_events;
+	devs =3D *num_devices;
+
+	old =3D *items;
+	row_bytes =3D (size_t)cols_per_dev * sizeof(*old);
+
+	/* First pass: count devices that have at least one present metric. */
+	for (int d =3D 0; d < devs; d++) {
+		struct stat_item *row =3D &old[d * cols_per_dev];
+		bool any =3D false;
+
+		for (int c =3D 0; c < cols_per_dev; c++) {
+			if (row[c].present) {
+				any =3D true;
+				break;
+			}
+		}
+
+		if (any)
+			keep++;
+	}
+
+	if (keep =3D=3D devs)
+		return 0; /* nothing to filter */
+
+	if (keep =3D=3D 0)
+		return log_ret(PMTCTL_ERR_CMD_STAT, "no devices contain requested event(=
s)");
+
+	filtered =3D calloc((size_t)keep * cols_per_dev, sizeof(*filtered));
+	if (!filtered)
+		return log_ret(-ENOMEM, "could not filter device list");
+
+	/* Second pass: copy kept rows in order. */
+	int out_idx =3D 0;
+
+	for (int d =3D 0; d < devs; d++) {
+		struct stat_item *row =3D &old[d * cols_per_dev];
+		bool any =3D false;
+
+		for (int c =3D 0; c < cols_per_dev; c++) {
+			if (row[c].present) {
+				any =3D true;
+				break;
+			}
+		}
+
+		if (!any)
+			continue;
+
+		memcpy(&filtered[out_idx * cols_per_dev], row, row_bytes);
+		out_idx++;
+	}
+
+	free(old);
+	*items =3D filtered;
+	*nitems =3D keep * cols_per_dev;
+	*num_devices =3D keep;
+
+	return 0;
+}
+
+/*
+ * Check if all devices needed for stat can be opened.
+ * Returns 0 if all devices are readable, otherwise returns error code.
+ */
+static int stat_check_device_access(const struct stat_item *items, int nit=
ems)
+{
+	/* Track which devices we've already checked to avoid redundant opens */
+	const struct pmt_device *last_dev =3D NULL;
+
+	for (int i =3D 0; i < nitems; i++) {
+		const struct stat_item *it =3D &items[i];
+
+		if (!it->dev || !it->present)
+			continue;
+
+		/* Skip if we just checked this device */
+		if (last_dev =3D=3D it->dev)
+			continue;
+
+		last_dev =3D it->dev;
+
+		int fd;
+
+		if (!it->dev->data_path)
+			return log_ret(-EINVAL, "missing data path for %s", it->dev->name);
+
+		fd =3D open(it->dev->data_path, O_RDONLY | O_CLOEXEC);
+		if (fd =3D=3D -1) {
+			if (errno =3D=3D EACCES || errno =3D=3D EPERM) {
+				return log_ret(-EACCES,
+					       "permission denied opening device %s (requires elevated privil=
eges)",
+					       it->dev->name);
+			}
+
+			return log_ret(-errno, "cannot open device %s", it->dev->name);
+		}
+
+		close(fd);
+	}
+
+	return 0;
+}
+
+static int stat_loop_metrics(const struct stat_options *opts, const struct=
 pmtctl_context *ctx,
+			     struct stat_item *items, int nitems, int num_devices)
+{
+	long max_samples =3D opts->count;   /* -1 =3D infinite */
+	struct sigaction sa;
+	int sample_idx =3D 0;
+	int last_read_err =3D 0;
+	bool any_read_ok =3D false;
+
+	memset(&sa, 0, sizeof(sa));
+	sa.sa_handler =3D stat_sigint;
+	sigaction(SIGINT, &sa, NULL);
+
+	stat_stop =3D 0;
+
+	stat_print_header(opts);
+
+	for (sample_idx =3D 0;
+	     !stat_stop && (max_samples < 0 || sample_idx < max_samples);
+	     sample_idx++) {
+		/* Read all present items */
+		for (int i =3D 0; i < nitems; i++) {
+			struct stat_item *it =3D &items[i];
+			uint64_t raw =3D 0;
+			int rc;
+
+			if (!it->present) {
+				it->cur_value =3D NAN;
+				continue;
+			}
+
+			rc =3D ctx->ops->read(&it->desc, &raw);
+			if (rc < 0) {
+				it->cur_value =3D NAN;
+				last_read_err =3D rc;
+				continue;
+			}
+
+			any_read_ok =3D true;
+			it->cur_raw =3D raw;
+			it->cur_value =3D (double)raw;
+		}
+
+		/* Print sample rows */
+		stat_print_rows(opts, items, nitems, num_devices, sample_idx);
+
+		if (opts->once)
+			break;
+
+		if (max_samples > 0 && sample_idx + 1 >=3D max_samples)
+			break;
+
+		if (opts->interval_ms > 0) {
+			struct timespec ts =3D {
+				.tv_sec  =3D opts->interval_ms / 1000,
+				.tv_nsec =3D (opts->interval_ms % 1000) * 1000000UL,
+			};
+			nanosleep(&ts, NULL);
+		}
+	}
+
+	/*
+	 * If no item ever produced a valid sample, propagate the last
+	 * read error so the CLI exits with PMTCTL_EXIT_SYSTEM rather
+	 * than masking a hard I/O failure as success.  A stat run that
+	 * had at least one good sample stays rc=3D0 (transient device
+	 * misses surface as NaN in the printed output).
+	 */
+	if (!any_read_ok && last_read_err < 0)
+		return last_read_err;
+
+	return 0;
+}
+
+int stat_run(const struct stat_options *opts)
+{
+	const struct pmtctl_context *ctx;
+	auto_free struct stat_item *items =3D NULL;
+	auto_free int *dev_indices =3D NULL;
+	int num_sel_devices =3D 0;
+	int nitems =3D 0;
+	int ret;
+
+	ctx =3D pmtctl_get_ctx();
+	if (!ctx)
+		return log_ret(PMTCTL_ERR_CMD_STAT, "context not initialized");
+
+	if (ctx->num_devices <=3D 0)
+		return log_ret(PMTCTL_ERR_CMD_STAT, "no devices available");
+
+	dev_indices =3D calloc(ctx->num_devices, sizeof(*dev_indices));
+	if (!dev_indices)
+		return log_ret(-ENOMEM, "can't create device index");
+
+	/*
+	 * Device selection:
+	 *  - If a selector string is present, parse it and call pmt_select_devic=
es()
+	 *    to get the subset of device indices.
+	 *  - Otherwise, use all devices.
+	 */
+	if (opts->device_selector) {
+		struct pmt_ep_selector sel;
+
+		ret =3D pmtctl_parse_ep_selector(opts->device_selector, &sel);
+		if (ret < 0)
+			return ret;
+
+		num_sel_devices =3D pmt_select_devices(ctx, &sel, dev_indices, ctx->num_=
devices);
+		if (num_sel_devices < 0)
+			return num_sel_devices;
+
+		if (num_sel_devices =3D=3D 0) {
+			return log_ret(PMTCTL_ERR_CMD_STAT, "no devices match selector '%s'",
+				       opts->device_selector);
+		}
+	} else {
+		/* No selector: use all devices. */
+		for (int i =3D 0; i < ctx->num_devices; i++)
+			dev_indices[i] =3D i;
+
+		num_sel_devices =3D ctx->num_devices;
+	}
+
+	/*
+	 * Build items according to mode:
+	 *   - metric mode: use events + bindings
+	 *   - raw mode:    use raw_specs only
+	 *
+	 * stat_parse_options() already enforces mutual exclusion between them.
+	 */
+	if (opts->nr_raw_specs > 0) {
+		ret =3D stat_build_raw_items(opts, ctx, dev_indices, num_sel_devices, &i=
tems,
+					   &nitems);
+	} else {
+		ret =3D stat_build_metric_items(opts, ctx, dev_indices, num_sel_devices,=
 &items,
+					      &nitems);
+		if (!ret)
+			ret =3D filter_metric_items_present(opts, &items, &nitems, &num_sel_dev=
ices);
+	}
+
+	if (ret)
+		return ret;
+
+	/* Check that we have permission to access the devices */
+	ret =3D stat_check_device_access(items, nitems);
+	if (ret)
+		return ret;
+
+	return stat_loop_metrics(opts, ctx, items, nitems, num_sel_devices);
+}
diff --git a/tools/arch/x86/pmtctl/src/main.c b/tools/arch/x86/pmtctl/src/m=
ain.c
index d9666956c27b..81117456252c 100644
--- a/tools/arch/x86/pmtctl/src/main.c
+++ b/tools/arch/x86/pmtctl/src/main.c
@@ -45,6 +45,7 @@ static void print_usage(FILE *out)
 		"\n"
 		"Commands:\n"
 		"  list      List available PMT devices and metrics\n"
+		"  stat      Sample metrics over time (perf stat-like)\n"
 		"\n"
 		"Run 'pmtctl <command> --help' for command-specific options.\n"
 	);
@@ -116,6 +117,9 @@ static int cmd_dispatch(int argc, char **argv)
 	if (!strcmp(cmd, "list"))
 		return cmd_list(cmd_argc, cmd_argv, &gopts);
=20
+	if (!strcmp(cmd, "stat"))
+		return cmd_stat(cmd_argc, cmd_argv, &gopts);
+
 	if (!strcmp(cmd, "--help") || !strcmp(cmd, "help")) {
 		print_usage(stdout);
 		return 0;
--=20
2.43.0

