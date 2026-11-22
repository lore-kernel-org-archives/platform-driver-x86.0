Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795376060;
	b=HO0DBT0KRQf+LbrudWA8UaYQ8PMhJtr6JMmic2C0p09LvkSJ578cQRorFacBFJUZD5Uu
	 hsN5URaulRQTQkDP6CHUBmszcZzPCZNLc9vbTzU9rHidi0/YWpxDrEjDOTbDjF4LrOGs7
	 RRTmk9Mp1S451cfszfzmS52w02UWw3mQSK4NnvukwYRL0hwGdfQeRIfUoKbjjvns9dMst
	 2y4sLXa86a2Fy0tjENLoDpmQ/NwfBEr9PDuqXBxBKgtsB94iPfuXnGiBNZbFBWj723FZb
	 enBdCE86NlP7SVpuP8kDTkb3EFUYpCzUbBEHGv2ZU1Zpg/QEKpfQjcwj+PtF+nHViwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795376060;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5P+7tBedBIdwQSGY2GkLGv3XTyNXbKGIOLqLjYKCNQ4=;
	b=zGCetfEs3uk478LSDFRJp8ro0nCF+Ck0P9cyhDEAh/D+uUqF+MfAGfmA9TbkzChSFbVl
	 KPji3urTkX+Wgk4MpSc03BClPJR7vbuE/SDZtXmc7aVCHCY7uQhZplfMwrOb7VLG82ySR
	 uvxV/LOELLoNVsygetzhY5WOQ/KlkIncZKRrB6msxxAEBe/V5c3kWJvwGXo7+qBmadEbb
	 6DUvObzdmcRT94Tdwurw3m/r9mForFVrZC3RpZ+IfAXK5iikXLN/HCdf/8gVcJ9s9jy9K
	 3kkgX4uU2w2GTidKwW6DbuikZGG8egnYGZZzkECj8huSUEKrfvi72dV2axV8SOYbbyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U8TzuuMw;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63E6606A33B;
	Sun, 22 Nov 2026 19:34:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C63E6606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U8TzuuMw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795376059; x=1826912059;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BG2gzCHnt9oFAjZiqbSwnEbVMvdnKd/0xby1+p5ZVl8=;
  b=U8TzuuMwL1W44wryWwDEaDGfGdx85DS3Zsp+FrRdHjfp7NdslltAtbSZ
   re+EOld744JgsNDa+ZHO0uaZulU4MVajUbeUVb/KufSqKYPMcfgCV0B4z
   BIzD8QJ0H2pMNJnyBkx6nSOmVHEe9+qZKAkvDx1ZikiJLLFMAGB5UhE21
   PNXMTGhsNp9NsKyrA59x0C7PJtGrHKf6FjENLlJDsP/oqQ2WnJWgjR4Wl
   ZX/17xIfFShydD0vq6A7Q9blTfpyQsJUlHOzf7fqoVvazl149mwFhc1mA
   uYMfwM3ODpTkNJ06lKEThQcsirG2zGv9x4YzfrxeCSSMx6VGsvvmNfYyS
   g==;
X-CSE-ConnectionGUID: 3nw2GBVeSzW8fHMlmKg+jg==
X-CSE-MsgGUID: 0UKwMLYbQWmQFO3rIFmODQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4217510"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4217510"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 11:34:19 -0800
X-CSE-ConnectionGUID: FHMOa7JITg2E18fpr20kKQ==
X-CSE-MsgGUID: tl8NZPL7S86cPCEHTAS+OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11109794"
Received: from debox1-desk4.jf.intel.com (HELO localhost) ([10.54.77.98])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 11:34:19 -0800
From: "David E. Box" <david.e.box@linux.intel.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/12] tools/arch/x86/pmtctl: Add JSON metric definition loading
Date: Sun, 22 Nov 2026 11:33:59 -0800
Message-ID: <57cd5d4e4774ba815decccdd3d62a4abacfad1ea.1795374925.git.david.e.box@linux.intel.com>
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

The telemetry data of a PMT device is an array of 64-bit samples
whose meaning, its telemetry semantic space (TSS), is identified by the
device's GUID. pmtxml2json.py converts the published layouts into one
JSON file per GUID, listing the metrics as bit ranges of samples.

Add loading of these files with libjansson. A path may name a single
definition file or a directory of them. Each file becomes one entry of
a TSS database in struct pmtctl_ctx, holding the GUID's platform,
description and metrics, sorted by name, so the metrics of a device
are found with a single lookup of its GUID. pmt_tss_db_load_json()
loads the database, and pmtctl_ctx_free() frees it with the rest of the
context.

Definition files are validated: each must have a GUID not defined by
another file, and each event a unique name, a 32-bit sample ID and a bit
range within the 64-bit sample (lsb <=3D msb <=3D 63). Otherwise the file is
rejected with a message naming the event. In a directory every file is
checked and any bad file fails the load, so a partial set of definitions
is never used.

Building pmtctl now requires libjansson.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
V2 changes:
  - Replaces v1 04 and 07.
  - A TSS database with one entry per GUID, sorted and searched with
    bsearch(), replaces the metric blocks, the flat-index accessors and
    the GUID registry.
  - No string pool, casts or realloc(+1) growth.
  - Files are validated strictly. A bad file fails a directory load,
    where v1's result depended on readdir order, and errors name the
    file and event.

 tools/arch/x86/pmtctl/Makefile             |  13 +
 tools/arch/x86/pmtctl/include/lib/pmtctl.h |   2 +
 tools/arch/x86/pmtctl/include/lib/tss.h    |  43 +++
 tools/arch/x86/pmtctl/lib/pmtctl.c         |   2 +
 tools/arch/x86/pmtctl/lib/tss.c            |  45 +++
 tools/arch/x86/pmtctl/lib/tss_json.c       | 406 +++++++++++++++++++++
 6 files changed, 511 insertions(+)
 create mode 100644 tools/arch/x86/pmtctl/include/lib/tss.h
 create mode 100644 tools/arch/x86/pmtctl/lib/tss.c
 create mode 100644 tools/arch/x86/pmtctl/lib/tss_json.c

diff --git a/tools/arch/x86/pmtctl/Makefile b/tools/arch/x86/pmtctl/Makefile
index 2d66e4e036cc..8b723f96904b 100644
--- a/tools/arch/x86/pmtctl/Makefile
+++ b/tools/arch/x86/pmtctl/Makefile
@@ -7,11 +7,24 @@ CFLAGS =3D -Wextra
=20
 override CFLAGS +=3D -O2 -Wall -D_GNU_SOURCE -Iinclude -I../../../include
=20
+# The jansson check is skipped for targets that don't compile anything
+ifneq ($(filter-out clean defs-json-fetch defs-json-pull defs-clean,$(or $=
(MAKECMDGOALS),pmtctl)),)
+JANSSON_CFLAGS :=3D $(shell pkg-config --cflags jansson 2>/dev/null)
+JANSSON_LIBS :=3D $(shell pkg-config --libs jansson 2>/dev/null)
+ifeq ($(JANSSON_LIBS),)
+$(error jansson not found: install libjansson-dev (Debian/Ubuntu) or janss=
on-devel (Fedora/RHEL))
+endif
+override CFLAGS +=3D $(JANSSON_CFLAGS)
+LDLIBS +=3D $(JANSSON_LIBS)
+endif
+
 OBJS :=3D \
 	lib/common.o \
 	lib/device_telem.o \
 	lib/log.o \
 	lib/pmtctl.o \
+	lib/tss.o \
+	lib/tss_json.o \
 	src/main.o
=20
 pmtctl: $(OBJS)
diff --git a/tools/arch/x86/pmtctl/include/lib/pmtctl.h b/tools/arch/x86/pm=
tctl/include/lib/pmtctl.h
index e3a2c862bc78..9da9e1f221ca 100644
--- a/tools/arch/x86/pmtctl/include/lib/pmtctl.h
+++ b/tools/arch/x86/pmtctl/include/lib/pmtctl.h
@@ -5,11 +5,13 @@
 #include <stddef.h>
=20
 #include "lib/device.h"
+#include "lib/tss.h"
=20
 /* State for one pmtctl command, owned by the command */
 struct pmtctl_ctx {
 	struct pmt_device *devices;
 	size_t num_devices;
+	struct pmt_tss_db tss;
 };
=20
 int pmtctl_ctx_init(struct pmtctl_ctx *ctx);
diff --git a/tools/arch/x86/pmtctl/include/lib/tss.h b/tools/arch/x86/pmtct=
l/include/lib/tss.h
new file mode 100644
index 000000000000..3f5238540240
--- /dev/null
+++ b/tools/arch/x86/pmtctl/include/lib/tss.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef PMTCTL_TSS_H
+#define PMTCTL_TSS_H
+
+#include <stddef.h>
+#include <stdint.h>
+
+/* Every PMT telemetry sample is one 64-bit word */
+#define PMT_SAMPLE_BITS		64
+
+/* A metric: bits [lsb, msb] of sample sample_id */
+struct pmt_metric_def {
+	char *name;
+	char *description;	/* may be NULL */
+	uint32_t sample_id;
+	unsigned int lsb;
+	unsigned int msb;
+};
+
+/*
+ * The telemetry semantic space (TSS) identified by a GUID: the meaning of
+ * the samples in a telemetry region with that GUID.
+ */
+struct pmt_tss_info {
+	uint32_t guid;
+	char *platform;		/* may be NULL */
+	char *description;	/* may be NULL */
+	struct pmt_metric_def *metrics;	/* sorted by name */
+	size_t num_metrics;
+};
+
+/* The telemetry semantic spaces with known metric definitions */
+struct pmt_tss_db {
+	struct pmt_tss_info *tss_info;	/* sorted by GUID */
+	size_t num_tss_info;
+};
+
+int pmt_tss_db_load_json(const char *path, struct pmt_tss_db *db);
+void pmt_tss_info_free(struct pmt_tss_info *info);
+void pmt_tss_db_free(struct pmt_tss_db *db);
+const struct pmt_tss_info *pmt_tss_db_lookup(const struct pmt_tss_db *db, =
uint32_t guid);
+
+#endif
diff --git a/tools/arch/x86/pmtctl/lib/pmtctl.c b/tools/arch/x86/pmtctl/lib=
/pmtctl.c
index 9a6fd2a303f4..b218bac15824 100644
--- a/tools/arch/x86/pmtctl/lib/pmtctl.c
+++ b/tools/arch/x86/pmtctl/lib/pmtctl.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #include "lib/device.h"
 #include "lib/pmtctl.h"
+#include "lib/tss.h"
=20
 /**
  * pmtctl_ctx_init - discover PMT devices
@@ -16,6 +17,7 @@ int pmtctl_ctx_init(struct pmtctl_ctx *ctx)
=20
 void pmtctl_ctx_free(struct pmtctl_ctx *ctx)
 {
+	pmt_tss_db_free(&ctx->tss);
 	telem_free(ctx->devices, ctx->num_devices);
 	ctx->devices =3D NULL;
 	ctx->num_devices =3D 0;
diff --git a/tools/arch/x86/pmtctl/lib/tss.c b/tools/arch/x86/pmtctl/lib/ts=
s.c
new file mode 100644
index 000000000000..7555b76c3ded
--- /dev/null
+++ b/tools/arch/x86/pmtctl/lib/tss.c
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <stdlib.h>
+
+#include "lib/tss.h"
+
+void pmt_tss_info_free(struct pmt_tss_info *info)
+{
+	for (size_t i =3D 0; i < info->num_metrics; i++) {
+		free(info->metrics[i].name);
+		free(info->metrics[i].description);
+	}
+	free(info->metrics);
+	free(info->platform);
+	free(info->description);
+}
+
+void pmt_tss_db_free(struct pmt_tss_db *db)
+{
+	for (size_t i =3D 0; i < db->num_tss_info; i++)
+		pmt_tss_info_free(&db->tss_info[i]);
+	free(db->tss_info);
+
+	*db =3D (struct pmt_tss_db){};
+}
+
+static int tss_info_guid_cmp(const void *key, const void *elem)
+{
+	const uint32_t *guid =3D key;
+	const struct pmt_tss_info *info =3D elem;
+
+	if (*guid !=3D info->guid)
+		return *guid < info->guid ? -1 : 1;
+
+	return 0;
+}
+
+/* Return: the entry for @guid, or NULL if no definitions were loaded for =
it */
+const struct pmt_tss_info *pmt_tss_db_lookup(const struct pmt_tss_db *db, =
uint32_t guid)
+{
+	if (!db->num_tss_info)
+		return NULL;
+
+	return bsearch(&guid, db->tss_info, db->num_tss_info, sizeof(*db->tss_inf=
o),
+		       tss_info_guid_cmp);
+}
diff --git a/tools/arch/x86/pmtctl/lib/tss_json.c b/tools/arch/x86/pmtctl/l=
ib/tss_json.c
new file mode 100644
index 000000000000..32343f233aff
--- /dev/null
+++ b/tools/arch/x86/pmtctl/lib/tss_json.c
@@ -0,0 +1,406 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Load metric definitions from the JSON files written by
+ * scripts/pmtxml2json.py: one pmt_<guid>.json per telemetry semantic
+ * space, with the GUID's platform, description and events.
+ */
+#include <dirent.h>
+#include <errno.h>
+#include <jansson.h>
+#include <limits.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/stat.h>
+
+#include "lib/common.h"
+#include "lib/log.h"
+#include "lib/tss.h"
+
+static bool is_regular_file(const char *path)
+{
+	struct stat st;
+
+	if (stat(path, &st))
+		return false;
+
+	return S_ISREG(st.st_mode);
+}
+
+static const char *obj_get_string(json_t *obj, const char *key)
+{
+	return json_string_value(json_object_get(obj, key));
+}
+
+/* Read the integer @key of @obj into @val if it is in the range [0, @max]=
 */
+static int obj_get_uint(json_t *obj, const char *key, uint32_t max, uint32=
_t *val)
+{
+	json_t *v =3D json_object_get(obj, key);
+	json_int_t n;
+
+	if (!json_is_integer(v))
+		return -EINVAL;
+
+	n =3D json_integer_value(v);
+	if (n < 0 || n > max)
+		return -ERANGE;
+
+	*val =3D n;
+
+	return 0;
+}
+
+/* Duplicate @s into @dst, or set @dst to NULL if @s is NULL */
+static int dup_optional(const char *s, char **dst)
+{
+	*dst =3D NULL;
+	if (!s)
+		return 0;
+
+	*dst =3D strdup(s);
+	if (!*dst)
+		return -ENOMEM;
+
+	return 0;
+}
+
+/* Read the sample and bit range of an event into @def */
+static int parse_location(json_t *ev, struct pmt_metric_def *def)
+{
+	uint32_t sample_id, lsb, msb;
+	int ret;
+
+	ret =3D obj_get_uint(ev, "sample_id", UINT32_MAX, &sample_id);
+	if (ret)
+		return ret;
+
+	ret =3D obj_get_uint(ev, "lsb", PMT_SAMPLE_BITS - 1, &lsb);
+	if (ret)
+		return ret;
+
+	ret =3D obj_get_uint(ev, "msb", PMT_SAMPLE_BITS - 1, &msb);
+	if (ret)
+		return ret;
+
+	if (lsb > msb)
+		return -EINVAL;
+
+	def->sample_id =3D sample_id;
+	def->lsb =3D lsb;
+	def->msb =3D msb;
+
+	return 0;
+}
+
+/* Fill @def from event @idx of @path. On failure @def may be partly fille=
d. */
+/*
+ * Fill @def from event @ev. On failure @def may be partly filled; the
+ * caller frees it with the rest of the metrics array.
+ */
+static int parse_event(json_t *ev, const char *path, size_t idx, struct pm=
t_metric_def *def)
+{
+	const char *name;
+	int ret;
+
+	name =3D obj_get_string(ev, "EventName");
+	if (!name) {
+		log_err("%s: event %zu: missing EventName", path, idx);
+		return -EINVAL;
+	}
+
+	ret =3D parse_location(ev, def);
+	if (ret) {
+		log_err("%s: event %zu (%s): missing or invalid sample_id, lsb or msb",
+			path, idx, name);
+		return ret;
+	}
+
+	def->name =3D strdup(name);
+	if (!def->name)
+		return -ENOMEM;
+
+	return dup_optional(obj_get_string(ev, "description"), &def->description);
+}
+
+static int metric_cmp(const void *a, const void *b)
+{
+	const struct pmt_metric_def *ma =3D a;
+	const struct pmt_metric_def *mb =3D b;
+
+	return strcmp(ma->name, mb->name);
+}
+
+/* Sort the metrics of @info by name and reject duplicate names */
+static int sort_metrics(struct pmt_tss_info *info, const char *path)
+{
+	if (!info->num_metrics)
+		return 0;
+
+	qsort(info->metrics, info->num_metrics, sizeof(*info->metrics), metric_cm=
p);
+
+	for (size_t i =3D 1; i < info->num_metrics; i++) {
+		if (!strcmp(info->metrics[i - 1].name, info->metrics[i].name)) {
+			log_err("%s: event %s is defined more than once", path,
+				info->metrics[i].name);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static int parse_file_guid(json_t *root, const char *path, uint32_t *guid)
+{
+	const char *s;
+
+	s =3D obj_get_string(root, "guid");
+	if (!s || parse_u32(s, 0, guid)) {
+		log_err("%s: missing or invalid guid", path);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/*
+ * Add the telemetry semantic space of @root. @db->tss_info has room for o=
ne
+ * more entry. On failure nothing is added.
+ */
+static int parse_file(struct pmt_tss_db *db, json_t *root, const char *pat=
h)
+{
+	struct pmt_tss_info info =3D {};
+	json_t *events;
+	json_t *ev;
+	size_t idx;
+	int ret;
+
+	if (!json_is_object(root)) {
+		log_err("%s: expected an object", path);
+		return -EINVAL;
+	}
+
+	ret =3D parse_file_guid(root, path, &info.guid);
+	if (ret)
+		return ret;
+
+	events =3D json_object_get(root, "events");
+	if (!json_is_array(events)) {
+		log_err("%s: missing events array", path);
+		return -EINVAL;
+	}
+
+	if (json_array_size(events)) {
+		info.metrics =3D calloc(json_array_size(events), sizeof(*info.metrics));
+		if (!info.metrics)
+			return -ENOMEM;
+
+		/* Zeroed, so pmt_tss_info_free() can free a partly parsed array */
+		info.num_metrics =3D json_array_size(events);
+	}
+
+	ret =3D dup_optional(obj_get_string(root, "platform"), &info.platform);
+	if (ret)
+		goto err_free;
+
+	ret =3D dup_optional(obj_get_string(root, "description"), &info.descripti=
on);
+	if (ret)
+		goto err_free;
+
+	json_array_foreach(events, idx, ev) {
+		ret =3D parse_event(ev, path, idx, &info.metrics[idx]);
+		if (ret)
+			goto err_free;
+	}
+
+	ret =3D sort_metrics(&info, path);
+	if (ret)
+		goto err_free;
+
+	db->tss_info[db->num_tss_info++] =3D info;
+
+	return 0;
+
+err_free:
+	pmt_tss_info_free(&info);
+
+	return ret;
+}
+
+/* Read @path into *@root. fopen() rather than json_load_file() keeps its =
errno. */
+static int read_json_file(const char *path, json_t **root)
+{
+	json_error_t error;
+	FILE *fp;
+
+	fp =3D fopen(path, "r");
+	if (!fp)
+		return log_ret(-errno, "unable to open %s", path);
+
+	*root =3D json_loadf(fp, 0, &error);
+	fclose(fp);
+	if (!*root) {
+		log_err("%s: line %d: %s", path, error.line, error.text);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int load_file(struct pmt_tss_db *db, const char *path)
+{
+	json_t *root;
+	int ret;
+
+	ret =3D read_json_file(path, &root);
+	if (ret)
+		return ret;
+
+	ret =3D parse_file(db, root, path);
+	json_decref(root);
+
+	return ret;
+}
+
+/* Select the definition files of a directory: *.json, except hidden files=
 */
+static int is_definition_file(const struct dirent *de)
+{
+	const char *ext =3D strrchr(de->d_name, '.');
+
+	if (de->d_name[0] =3D=3D '.')
+		return 0;
+
+	return ext && !strcmp(ext, ".json");
+}
+
+static int load_dir_entry(struct pmt_tss_db *db, const char *dir, const ch=
ar *name)
+{
+	char path[PATH_MAX];
+	int ret;
+
+	ret =3D path_printf(path, sizeof(path), "%s/%s", dir, name);
+	if (ret) {
+		log_err("%s/%s: path too long", dir, name);
+		return ret;
+	}
+
+	if (!is_regular_file(path))
+		return 0;
+
+	return load_file(db, path);
+}
+
+/*
+ * Load every definition file in @dir, in name order. A file that fails to
+ * load is reported and the remaining files are still checked, but the load
+ * as a whole fails.
+ */
+static int load_dir(struct pmt_tss_db *db, const char *dir)
+{
+	struct dirent **names;
+	int ret =3D 0;
+	int n;
+
+	n =3D scandir(dir, &names, is_definition_file, alphasort);
+	if (n < 0)
+		return log_ret(-errno, "unable to read %s", dir);
+
+	/* Each file adds at most one entry */
+	if (n) {
+		db->tss_info =3D calloc(n, sizeof(*db->tss_info));
+		if (!db->tss_info) {
+			ret =3D -ENOMEM;
+			goto out_free_names;
+		}
+	}
+
+	for (int i =3D 0; i < n; i++) {
+		int err;
+
+		err =3D load_dir_entry(db, dir, names[i]->d_name);
+		if (err =3D=3D -ENOMEM) {
+			ret =3D err;
+			break;
+		}
+
+		if (err)
+			ret =3D err;
+	}
+
+out_free_names:
+	for (int i =3D 0; i < n; i++)
+		free(names[i]);
+	free(names);
+
+	return ret;
+}
+
+static int tss_info_cmp(const void *a, const void *b)
+{
+	const struct pmt_tss_info *ia =3D a;
+	const struct pmt_tss_info *ib =3D b;
+
+	if (ia->guid !=3D ib->guid)
+		return ia->guid < ib->guid ? -1 : 1;
+
+	return 0;
+}
+
+/* Check that no two files of directory @path define the same GUID; @db is=
 sorted */
+static int check_unique_guids(const struct pmt_tss_db *db, const char *pat=
h)
+{
+	for (size_t i =3D 1; i < db->num_tss_info; i++) {
+		if (db->tss_info[i].guid =3D=3D db->tss_info[i - 1].guid) {
+			log_err("guid 0x%08x is defined by more than one file in %s",
+				db->tss_info[i].guid, path);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * pmt_tss_db_load_json - load metric definitions
+ * @path: a definition file, or a directory of them
+ * @db:   zero-initialized, filled on success
+ *
+ * Return: 0 on success, or a negative errno with @db left empty.
+ */
+int pmt_tss_db_load_json(const char *path, struct pmt_tss_db *db)
+{
+	struct stat st;
+	int ret;
+
+	if (stat(path, &st))
+		return log_ret(-errno, "unable to access %s", path);
+
+	if (S_ISDIR(st.st_mode)) {
+		ret =3D load_dir(db, path);
+	} else if (S_ISREG(st.st_mode)) {
+		db->tss_info =3D calloc(1, sizeof(*db->tss_info));
+		if (db->tss_info)
+			ret =3D load_file(db, path);
+		else
+			ret =3D -ENOMEM;
+	} else {
+		log_err("%s: not a file or directory", path);
+		ret =3D -EINVAL;
+	}
+
+	if (!ret && db->num_tss_info > 1) {
+		qsort(db->tss_info, db->num_tss_info, sizeof(*db->tss_info), tss_info_cm=
p);
+		ret =3D check_unique_guids(db, path);
+	}
+
+	if (ret) {
+		pmt_tss_db_free(db);
+		return log_ret(ret, "unable to load metric definitions from %s", path);
+	}
+
+	if (!db->num_tss_info)
+		log_warn("no metric definitions found in %s", path);
+
+	return 0;
+}
--=20
2.53.0

