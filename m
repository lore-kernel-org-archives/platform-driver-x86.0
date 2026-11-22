Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795376060;
	b=3TG9X4U28fOeOJyaJRhKi11T7xDw4foYWbuO1r9ATgUs1TquzmPUWEaK3eAPZMXhuXD1
	 /yYCIeaWWMmsGWb8EWOd+PGRjZEMLDem0YBAsjJFMKKlbcKAb9vwFV4gTvEqMLeXpbeVA
	 LjGVECUPl9wH2P+eEx4XPHU5RJ+rKOnteocnbdOhk+9+5fDbdlXWjISSI3Q7twSY3kRGr
	 +CQPjXi3Qli/55cvofDzpSLfgQeipldjdgYODBBJ/GFO/iYTBFA7Nh9atjE4kHO/sfPi4
	 zyRgu9EuZTfu6Jg5YUJJIg12nJEP/kVigdQ5dkHc8g+F0XS0NbGfIXHsDfFJPb37NgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795376060;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dWPDKYsa+uLDhZgp40POBUinX7C6AP2xiUyASvrK2Rk=;
	b=nQQ9q4uCeq2P+cBDAB6rPaBq+vxhjUAOvkaCTvXxOePQ8805xFa2/C1kSSO//SU1b6M7
	 dbgqKrqMGidHtAUkmZlKpEHl0EJoC/CmZl1+/G4MJxmFrCfw5eDZT3vM30LAvJHZhk9pu
	 h8IwcAGG5EPFBbV1fqKXJ56Hn+d7bFXXWc0tCjSVsjiC3aLWutLePZ9T2jjfNCo/IkSxm
	 Hb1JmfUOq/C9ZwrjFQO4jBWMI2z6GlK2Zamb5V/M/mxperhpxhvA7yb96xt4+rr+RE/NG
	 6+2iLtGMxX9y4TA87+gc0N71e/WXmZn2gFJNtFTgf6k5VxCfLrA4Bz8/sKZ/1pdsqIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Nn6Q2vxR;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16383606A681;
	Sun, 22 Nov 2026 19:34:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16383606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Nn6Q2vxR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795376060; x=1826912060;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=InsIHKgOtB79EvnOrZmSszfcqrGa2e84XxKWmsq7AyQ=;
  b=Nn6Q2vxRgRkIF9flVlnRpLqS4blAG3h+xm/ukv1HZ5BmZp90QpdN98Os
   syCpdwaSx9UEDFV6dCbuZ/B5PcpsXElzda9boZwU6R3lKmriEIRk941Jr
   Bq26fKEDA1Y6JE68jT573/Xnm474UoJTL6ASRDmSpjuYfNwlq48poCdGy
   qMfoWHLZv++ejcIlc9LxPJrpGm18tuaMxrdbnY0jsUrpnIb/IFhOMjmcu
   YPbBGHTFIVJ8QmA+NM/kTaslLPsIO3+W/r4P5Pd9aRz7iI9BC10yeGphp
   FsFvAwoU2mHXkzbmCVnSaqHw+QxaqxuoOcpeKrdKgP9iqJMOlpyFTAXFD
   g==;
X-CSE-ConnectionGUID: jpNKWLUmQzCtN0hxrjC40A==
X-CSE-MsgGUID: AE6u1RCQSai+GisaHJzyrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4217512"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4217512"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 11:34:19 -0800
X-CSE-ConnectionGUID: U+kN5gnWTtGWX0HSS1ruCw==
X-CSE-MsgGUID: NvWcumEbS7alLLftI6n1/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11109798"
Received: from debox1-desk4.jf.intel.com (HELO localhost) ([10.54.77.98])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 11:34:20 -0800
From: "David E. Box" <david.e.box@linux.intel.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/12] tools/arch/x86/pmtctl: Add 'list' command
Date: Sun, 22 Nov 2026 11:34:00 -0800
Message-ID: <770cd5933dd8288d95dfabf9342877c8860c8624.1795374925.git.david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795374925.git.david.e.box@linux.intel.com>
References: <cover.1795374925.git.david.e.box@linux.intel.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add the 'list' command, which shows the metric definitions of the PMT
telemetry devices on the system: one group per GUID with its platform,
number of metrics and description, followed by each metric's name and
description. A GUID shared by several devices is listed once. On a
terminal, descriptions are wrapped to its width; otherwise each is
printed on one line so the output is easy to search.

Metric definitions are loaded by pmtctl_ctx_load_tss() from the path
given with -J or, without it, from the directory they are installed in
(/usr/share/pmtctl by default, set with DEFSDIR at build time).
'make install' installs the definitions converted by
'make defs-json-fetch', if any. A missing default directory is not an
error, but definitions that fail to load are.

--guid and --device restrict the listing to the devices with a GUID or
to one device. The selection is done by pmtctl_select_devices(), which
keeps the device order and is shared with the commands added later. If
none of the selected devices has metric definitions, 'list' fails with
an error rather than printing nothing.

Also add print_chars() to lib/common.c for the indents and separator
lines; 'stat' uses it as well.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
V2 changes:
  - Replaces the metric listing of v1 13, with -J from v1 12.
  - Each metric is listed once per GUID; v1 listed it once per device
    sharing the GUID.
  - Descriptions are wrapped only on a terminal.
  - Definitions come from -J or the installed /usr/share/pmtctl.
  - --guid and --device replace -d; the pager and -X/--keep are dropped.
  - A selection without metric definitions is an error.

 tools/arch/x86/pmtctl/Makefile             |   9 +
 tools/arch/x86/pmtctl/include/lib/common.h |   7 +
 tools/arch/x86/pmtctl/include/lib/pmtctl.h |  26 ++
 tools/arch/x86/pmtctl/include/pmtctl_cli.h |   6 +
 tools/arch/x86/pmtctl/lib/common.c         |   6 +
 tools/arch/x86/pmtctl/lib/pmtctl.c         |  90 +++++++
 tools/arch/x86/pmtctl/src/cmd_list.c       | 292 +++++++++++++++++++++
 tools/arch/x86/pmtctl/src/main.c           |  17 +-
 8 files changed, 452 insertions(+), 1 deletion(-)
 create mode 100644 tools/arch/x86/pmtctl/src/cmd_list.c

diff --git a/tools/arch/x86/pmtctl/Makefile b/tools/arch/x86/pmtctl/Makefile
index 8b723f96904b..bb1a92e3dd6f 100644
--- a/tools/arch/x86/pmtctl/Makefile
+++ b/tools/arch/x86/pmtctl/Makefile
@@ -2,10 +2,12 @@
 # Makefile for Intel Platform Monitoring Technology (PMT) tool
=20
 BINDIR ?=3D /usr/sbin
+DEFSDIR ?=3D /usr/share/pmtctl
=20
 CFLAGS =3D -Wextra
=20
 override CFLAGS +=3D -O2 -Wall -D_GNU_SOURCE -Iinclude -I../../../include
+override CFLAGS +=3D -DPMTCTL_DEFS_DIR=3D'"$(DEFSDIR)"'
=20
 # The jansson check is skipped for targets that don't compile anything
 ifneq ($(filter-out clean defs-json-fetch defs-json-pull defs-clean,$(or $=
(MAKECMDGOALS),pmtctl)),)
@@ -25,6 +27,7 @@ OBJS :=3D \
 	lib/pmtctl.o \
 	lib/tss.o \
 	lib/tss_json.o \
+	src/cmd_list.o \
 	src/main.o
=20
 pmtctl: $(OBJS)
@@ -92,3 +95,9 @@ clean:
 install: pmtctl
 	install -d $(DESTDIR)$(BINDIR)
 	install -m 755 -p pmtctl $(DESTDIR)$(BINDIR)/pmtctl
+	@# Metric definitions, if 'make defs-json-fetch' was run
+	@if ls $(DEFS_DIR)/*.json >/dev/null 2>&1; then \
+		install -d $(DESTDIR)$(DEFSDIR); \
+		install -m 644 -p $(DEFS_DIR)/*.json $(DESTDIR)$(DEFSDIR); \
+		echo "Installed metric definitions to $(DESTDIR)$(DEFSDIR)"; \
+	fi
diff --git a/tools/arch/x86/pmtctl/include/lib/common.h b/tools/arch/x86/pm=
tctl/include/lib/common.h
index 0e1950bffc43..018b21db4e08 100644
--- a/tools/arch/x86/pmtctl/include/lib/common.h
+++ b/tools/arch/x86/pmtctl/include/lib/common.h
@@ -61,4 +61,11 @@ int parse_u32(const char *s, int base, uint32_t *val);
  */
 int path_printf(char *buf, size_t size, const char *fmt, ...) __printf(3, =
4);
=20
+/**
+ * print_chars - print a character repeatedly to stdout
+ * @c: character to print
+ * @n: number of times to print it
+ */
+void print_chars(int c, size_t n);
+
 #endif
diff --git a/tools/arch/x86/pmtctl/include/lib/pmtctl.h b/tools/arch/x86/pm=
tctl/include/lib/pmtctl.h
index 9da9e1f221ca..5d3586bf31e2 100644
--- a/tools/arch/x86/pmtctl/include/lib/pmtctl.h
+++ b/tools/arch/x86/pmtctl/include/lib/pmtctl.h
@@ -2,11 +2,18 @@
 #ifndef PMTCTL_H
 #define PMTCTL_H
=20
+#include <stdbool.h>
 #include <stddef.h>
+#include <stdint.h>
=20
 #include "lib/device.h"
 #include "lib/tss.h"
=20
+/* Installed metric definitions, used when no path is given */
+#ifndef PMTCTL_DEFS_DIR
+#define PMTCTL_DEFS_DIR		"/usr/share/pmtctl"
+#endif
+
 /* State for one pmtctl command, owned by the command */
 struct pmtctl_ctx {
 	struct pmt_device *devices;
@@ -14,8 +21,27 @@ struct pmtctl_ctx {
 	struct pmt_tss_db tss;
 };
=20
+/**
+ * struct pmt_device_filter - devices a command acts on
+ * @has_guid: select only the devices whose GUID is @guid
+ * @guid:     the GUID to match, used only if @has_guid is set
+ * @name:     if not NULL, select only the device with this name, e.g. "te=
lem3"
+ *
+ * A device is selected if it matches every filter that is set, so a zeroed
+ * filter selects all devices.
+ */
+struct pmt_device_filter {
+	bool has_guid;
+	uint32_t guid;
+	const char *name;
+};
+
 int pmtctl_ctx_init(struct pmtctl_ctx *ctx);
+int pmtctl_ctx_load_tss(struct pmtctl_ctx *ctx, const char *json_path);
 void pmtctl_ctx_free(struct pmtctl_ctx *ctx);
+int pmtctl_select_devices(const struct pmtctl_ctx *ctx, const struct pmt_d=
evice_filter *filter,
+			  const struct pmt_device ***devs, size_t *num_devs);
+int pmt_device_filter_set_guid(struct pmt_device_filter *filter, const cha=
r *arg);
=20
 /*
  * Free the context with pmtctl_ctx_free() at scope exit:
diff --git a/tools/arch/x86/pmtctl/include/pmtctl_cli.h b/tools/arch/x86/pm=
tctl/include/pmtctl_cli.h
index 550a61b97aca..9551c581cf1b 100644
--- a/tools/arch/x86/pmtctl/include/pmtctl_cli.h
+++ b/tools/arch/x86/pmtctl/include/pmtctl_cli.h
@@ -9,4 +9,10 @@ enum pmtctl_exit {
 	PMTCTL_EXIT_SYSTEM,
 };
=20
+struct pmt_global_opts {
+	const char *json_path;	/* -J, or NULL for the default directory */
+};
+
+int cmd_list(int argc, char **argv, const struct pmt_global_opts *gopts);
+
 #endif
diff --git a/tools/arch/x86/pmtctl/lib/common.c b/tools/arch/x86/pmtctl/lib=
/common.c
index adf546df0911..85e887b348e0 100644
--- a/tools/arch/x86/pmtctl/lib/common.c
+++ b/tools/arch/x86/pmtctl/lib/common.c
@@ -73,3 +73,9 @@ int path_printf(char *buf, size_t size, const char *fmt, =
...)
=20
 	return 0;
 }
+
+void print_chars(int c, size_t n)
+{
+	while (n--)
+		putchar(c);
+}
diff --git a/tools/arch/x86/pmtctl/lib/pmtctl.c b/tools/arch/x86/pmtctl/lib=
/pmtctl.c
index b218bac15824..dba015cfb574 100644
--- a/tools/arch/x86/pmtctl/lib/pmtctl.c
+++ b/tools/arch/x86/pmtctl/lib/pmtctl.c
@@ -1,5 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0-only
+#include <errno.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+
+#include "lib/common.h"
 #include "lib/device.h"
+#include "lib/log.h"
 #include "lib/pmtctl.h"
 #include "lib/tss.h"
=20
@@ -15,6 +22,33 @@ int pmtctl_ctx_init(struct pmtctl_ctx *ctx)
 	return telem_scan(&ctx->devices, &ctx->num_devices);
 }
=20
+/**
+ * pmtctl_ctx_load_tss - load metric definitions from JSON
+ * @ctx:       initialized context without definitions
+ * @json_path: a definition file, a directory of them, or NULL for PMTCTL_=
DEFS_DIR
+ *
+ * A missing default directory is not an error: @ctx is left without
+ * definitions.
+ *
+ * Return: 0 on success or a negative errno.
+ */
+int pmtctl_ctx_load_tss(struct pmtctl_ctx *ctx, const char *json_path)
+{
+	if (!json_path) {
+		/*
+		 * Definitions are optional, so a default directory that doesn't
+		 * exist just means none are installed. Any other problem with it
+		 * is reported by the loader.
+		 */
+		if (access(PMTCTL_DEFS_DIR, F_OK) && errno =3D=3D ENOENT)
+			return 0;
+
+		json_path =3D PMTCTL_DEFS_DIR;
+	}
+
+	return pmt_tss_db_load_json(json_path, &ctx->tss);
+}
+
 void pmtctl_ctx_free(struct pmtctl_ctx *ctx)
 {
 	pmt_tss_db_free(&ctx->tss);
@@ -22,3 +56,59 @@ void pmtctl_ctx_free(struct pmtctl_ctx *ctx)
 	ctx->devices =3D NULL;
 	ctx->num_devices =3D 0;
 }
+
+/**
+ * pmtctl_select_devices - select the devices matching a filter
+ * @ctx:      initialized context
+ * @filter:   the devices to select, see struct pmt_device_filter
+ * @devs:     returns the selected devices in ctx->devices order, freed wi=
th free()
+ * @num_devs: returns the number of entries in @devs, which may be 0
+ *
+ * Return: 0 on success or -ENOMEM.
+ */
+int pmtctl_select_devices(const struct pmtctl_ctx *ctx, const struct pmt_d=
evice_filter *filter,
+			  const struct pmt_device ***devs, size_t *num_devs)
+{
+	const struct pmt_device **sel;
+	size_t n =3D 0;
+
+	sel =3D calloc(ctx->num_devices, sizeof(*sel));
+	if (!sel)
+		return -ENOMEM;
+
+	for (size_t i =3D 0; i < ctx->num_devices; i++) {
+		const struct pmt_device *dev =3D &ctx->devices[i];
+
+		if (filter->has_guid && dev->guid !=3D filter->guid)
+			continue;
+
+		if (filter->name && strcmp(dev->name, filter->name))
+			continue;
+
+		sel[n++] =3D dev;
+	}
+
+	*devs =3D sel;
+	*num_devs =3D n;
+
+	return 0;
+}
+
+/**
+ * pmt_device_filter_set_guid - restrict a filter to the devices with a GU=
ID
+ * @filter: filter to change
+ * @arg:    GUID in hex, as given on the command line
+ *
+ * Return: 0 on success, or -EINVAL with an error message if @arg isn't a =
GUID.
+ */
+int pmt_device_filter_set_guid(struct pmt_device_filter *filter, const cha=
r *arg)
+{
+	if (parse_u32(arg, 16, &filter->guid)) {
+		log_err("invalid GUID '%s'", arg);
+		return -EINVAL;
+	}
+
+	filter->has_guid =3D true;
+
+	return 0;
+}
diff --git a/tools/arch/x86/pmtctl/src/cmd_list.c b/tools/arch/x86/pmtctl/s=
rc/cmd_list.c
new file mode 100644
index 000000000000..cefcb465969a
--- /dev/null
+++ b/tools/arch/x86/pmtctl/src/cmd_list.c
@@ -0,0 +1,292 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * pmtctl list: show the metric definitions of the PMT telemetry devices
+ */
+#include <errno.h>
+#include <getopt.h>
+#include <limits.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <unistd.h>
+
+#include <linux/kernel.h>
+
+#include "lib/common.h"
+#include "lib/device.h"
+#include "lib/log.h"
+#include "lib/pmtctl.h"
+#include "lib/tss.h"
+#include "pmtctl_cli.h"
+
+#define LIST_BASE_INDENT	2
+#define LIST_DEFAULT_COLS	80
+
+/* Indent of the description under a GUID group header and under a metric =
*/
+#define LIST_GROUP_DESC_INDENT	4
+#define LIST_METRIC_DESC_INDENT	8
+
+/* Width limits of the line under a group header */
+#define LIST_SEP_MIN		((size_t)8)
+#define LIST_SEP_MAX		((size_t)100)
+
+/* Values for long-only options, above any short option character */
+enum {
+	OPT_LIST_GUID =3D CHAR_MAX + 1,
+	OPT_LIST_DEVICE,
+};
+
+struct list_opts {
+	bool show_help;
+	struct pmt_device_filter filter;
+};
+
+static void list_usage(FILE *out)
+{
+	fprintf(out,
+		"Usage: pmtctl list [options]\n"
+		"\n"
+		"List PMT metrics.\n"
+		"\n"
+		"Options:\n"
+		"  -h, --help              Show this help.\n"
+		"      --guid <hex>        Restrict to devices with this GUID.\n"
+		"      --device <name>     Restrict to one device, e.g. telem3.\n");
+}
+
+static int parse_list_opts(struct list_opts *opts, int argc, char **argv)
+{
+	static const struct option long_opts[] =3D {
+		{ "help",	no_argument,	NULL, 'h' },
+		{ "guid",	required_argument, NULL, OPT_LIST_GUID },
+		{ "device",	required_argument, NULL, OPT_LIST_DEVICE },
+		{}
+	};
+	int opt;
+
+	optind =3D 1;
+
+	while ((opt =3D getopt_long(argc, argv, "h", long_opts, NULL)) !=3D -1) {
+		switch (opt) {
+		case 'h':
+			opts->show_help =3D true;
+			break;
+		case OPT_LIST_GUID:
+			if (pmt_device_filter_set_guid(&opts->filter, optarg))
+				return -EINVAL;
+			break;
+		case OPT_LIST_DEVICE:
+			opts->filter.name =3D optarg;
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	if (optind !=3D argc) {
+		log_err("unexpected extra arguments to 'list'");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/* Return: the terminal width if stdout is a terminal, otherwise 0 (don't =
wrap) */
+static size_t output_columns(void)
+{
+	struct winsize ws;
+
+	if (ioctl(STDOUT_FILENO, TIOCGWINSZ, &ws))
+		return 0;
+
+	if (!ws.ws_col)
+		return LIST_DEFAULT_COLS;
+
+	return ws.ws_col;
+}
+
+/*
+ * Print @s indented by @indent columns, with each run of whitespace print=
ed
+ * as one space, or nothing if @s is empty. With @cols nonzero, wrap it at
+ * whitespace to fit @cols columns; a word longer than a line is not split.
+ * Widths are counted in bytes, which matches the ASCII definitions.
+ */
+static void print_description(const char *s, size_t indent, size_t cols)
+{
+	size_t column =3D indent;
+	bool line_start =3D true;
+
+	s +=3D strspn(s, " \t\n");
+	if (!*s)
+		return;
+
+	print_chars(' ', indent);
+
+	while (*s) {
+		size_t wlen =3D strcspn(s, " \t\n");
+
+		if (cols && !line_start && column + 1 + wlen > cols) {
+			putchar('\n');
+			print_chars(' ', indent);
+			column =3D indent;
+			line_start =3D true;
+		}
+
+		if (!line_start) {
+			putchar(' ');
+			column++;
+		}
+
+		fwrite(s, 1, wlen, stdout);
+		column +=3D wlen;
+		line_start =3D false;
+
+		s +=3D wlen;
+		s +=3D strspn(s, " \t\n");
+	}
+
+	putchar('\n');
+}
+
+/* Return: the platform of @info for display, "---" if it is unknown */
+static const char *tss_platform(const struct pmt_tss_info *info)
+{
+	if (info && info->platform)
+		return info->platform;
+
+	return "---";
+}
+
+/*
+ * Print the header of the group of @guid: its platform and, if it has met=
ric
+ * definitions (@info is not NULL), their number and the description, wrap=
ped
+ * at @cols if nonzero
+ */
+static void print_guid_group_line(uint32_t guid, const struct pmt_tss_info=
 *info, size_t cols)
+{
+	print_chars(' ', LIST_BASE_INDENT);
+	printf("GUID %08x  platform: %s", guid, tss_platform(info));
+	if (info)
+		printf("   %zu metric%s", info->num_metrics, info->num_metrics =3D=3D 1 =
? "" : "s");
+	putchar('\n');
+
+	if (info && info->description)
+		print_description(info->description, LIST_GROUP_DESC_INDENT, cols);
+}
+
+/*
+ * Underline a group header up to where its longest metric name would end =
at
+ * the description indent, within LIST_SEP_MIN and LIST_SEP_MAX columns
+ */
+static void print_separator(const struct pmt_tss_info *info)
+{
+	size_t width =3D 0;
+
+	for (size_t i =3D 0; i < info->num_metrics; i++)
+		width =3D max(width, strlen(info->metrics[i].name));
+
+	width =3D clamp(width + LIST_METRIC_DESC_INDENT - LIST_BASE_INDENT, LIST_=
SEP_MIN,
+		      LIST_SEP_MAX);
+
+	print_chars(' ', LIST_BASE_INDENT);
+	print_chars('-', width);
+	putchar('\n');
+}
+
+/*
+ * List the metrics of the GUIDs of @devs, which are sorted by GUID.
+ * Return: whether any metric was listed.
+ */
+static bool do_list_metrics(const struct pmtctl_ctx *ctx, const struct pmt=
_device **devs,
+			    size_t num_devs)
+{
+	size_t cols =3D output_columns();
+	bool listed =3D false;
+
+	for (size_t i =3D 0; i < num_devs; i++) {
+		const struct pmt_tss_info *info;
+
+		/* List each GUID once, however many devices have it */
+		if (i && devs[i]->guid =3D=3D devs[i - 1]->guid)
+			continue;
+
+		info =3D pmt_tss_db_lookup(&ctx->tss, devs[i]->guid);
+		if (!info || !info->num_metrics)
+			continue;
+
+		if (listed)
+			putchar('\n');
+		listed =3D true;
+
+		print_guid_group_line(info->guid, info, cols);
+		print_separator(info);
+
+		for (size_t j =3D 0; j < info->num_metrics; j++) {
+			const struct pmt_metric_def *m =3D &info->metrics[j];
+
+			print_chars(' ', LIST_BASE_INDENT);
+			printf("%s\n", m->name);
+			if (m->description)
+				print_description(m->description, LIST_METRIC_DESC_INDENT, cols);
+		}
+	}
+
+	return listed;
+}
+
+int cmd_list(int argc, char **argv, const struct pmt_global_opts *gopts)
+{
+	struct pmtctl_ctx ctx auto_pmtctl_ctx =3D {};
+	const struct pmt_device **devs auto_free =3D NULL;
+	struct list_opts opts =3D {};
+	size_t num_devs;
+	int ret;
+
+	ret =3D parse_list_opts(&opts, argc, argv);
+	if (ret) {
+		list_usage(stderr);
+		return PMTCTL_EXIT_USER;
+	}
+
+	if (opts.show_help) {
+		list_usage(stdout);
+		return PMTCTL_EXIT_OK;
+	}
+
+	ret =3D pmtctl_ctx_init(&ctx);
+	if (ret)
+		return PMTCTL_EXIT_SYSTEM;
+
+	ret =3D pmtctl_ctx_load_tss(&ctx, gopts->json_path);
+	if (ret)
+		return PMTCTL_EXIT_SYSTEM;
+
+	ret =3D pmtctl_select_devices(&ctx, &opts.filter, &devs, &num_devs);
+	if (ret) {
+		log_ret(ret, "unable to select devices");
+		return PMTCTL_EXIT_SYSTEM;
+	}
+
+	if (!num_devs) {
+		log_err("no PMT telemetry device matches the filter");
+		return PMTCTL_EXIT_USER;
+	}
+
+	if (!ctx.tss.num_tss_info) {
+		if (gopts->json_path)
+			log_err("no metric definitions in %s", gopts->json_path);
+		else
+			log_err("no metric definitions; use -J or install them in %s",
+				PMTCTL_DEFS_DIR);
+		return PMTCTL_EXIT_USER;
+	}
+
+	if (!do_list_metrics(&ctx, devs, num_devs)) {
+		log_err("no metric definitions for the selected devices");
+		return PMTCTL_EXIT_USER;
+	}
+
+	return PMTCTL_EXIT_OK;
+}
diff --git a/tools/arch/x86/pmtctl/src/main.c b/tools/arch/x86/pmtctl/src/m=
ain.c
index 25aedef59cf5..d4a7ae464cb8 100644
--- a/tools/arch/x86/pmtctl/src/main.c
+++ b/tools/arch/x86/pmtctl/src/main.c
@@ -7,6 +7,7 @@
 #include <string.h>
=20
 #include "lib/log.h"
+#include "lib/pmtctl.h"
 #include "pmtctl_cli.h"
=20
 #define PMTCTL_VERSION	"2026.11.22"
@@ -22,6 +23,12 @@ static void print_usage(FILE *out)
 		"  -h, --help              Show this help and exit\n"
 		"  -V, --version           Show version and exit\n"
 		"\n"
+		"  -J, --json-file <path>  Metrics JSON file or directory\n"
+		"                          If omitted, " PMTCTL_DEFS_DIR " is used if it=
 exists.\n"
+		"\n"
+		"Commands:\n"
+		"  list      List available PMT metrics\n"
+		"\n"
 		"Run 'pmtctl <command> --help' for command-specific options.\n");
 }
=20
@@ -30,13 +37,15 @@ int main(int argc, char **argv)
 	static const struct option long_opts[] =3D {
 		{ "help",	no_argument,	NULL, 'h' },
 		{ "version",	no_argument,	NULL, 'V' },
+		{ "json-file",	required_argument, NULL, 'J' },
 		{}
 	};
+	struct pmt_global_opts gopts =3D {};
 	const char *cmd;
 	int opt;
=20
 	/* '+' stops at the first non-option: the command name */
-	while ((opt =3D getopt_long(argc, argv, "+hV", long_opts, NULL)) !=3D -1)=
 {
+	while ((opt =3D getopt_long(argc, argv, "+hVJ:", long_opts, NULL)) !=3D -=
1) {
 		switch (opt) {
 		case 'h':
 			print_usage(stdout);
@@ -45,6 +54,9 @@ int main(int argc, char **argv)
 			printf("pmtctl version %s - David E. Box <david.e.box@linux.intel.com>\=
n",
 			       PMTCTL_VERSION);
 			return PMTCTL_EXIT_OK;
+		case 'J':
+			gopts.json_path =3D optarg;
+			break;
 		default:
 			/* getopt_long() already printed an error */
 			fprintf(stderr, "Try 'pmtctl --help' for usage.\n");
@@ -60,6 +72,9 @@ int main(int argc, char **argv)
=20
 	cmd =3D argv[optind];
=20
+	if (!strcmp(cmd, "list"))
+		return cmd_list(argc - optind, argv + optind, &gopts);
+
 	if (!strcmp(cmd, "help")) {
 		print_usage(stdout);
 		return PMTCTL_EXIT_OK;
--=20
2.53.0

