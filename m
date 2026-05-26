Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDE92DECD3;
	Tue, 26 May 2026 01:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779760072; cv=none; b=FCBeYuy7hxeSJhxlTkwC+d/s1dMyDgLXJ6bq+cu6hjK4iN7mrVOHk+dnkSfNUNksuDArlNE7B2Y8jQzA3dvSLYVz4SE0XvHqt7N0KkrG69OVkSRzL0g23Q+UjnsCMEpRYO1RvnOVj/9RevasqvHxKUTzUO59QNwC0xrS9363AoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779760072; c=relaxed/simple;
	bh=ulmbEncpBcQEOsMC5liskJHLDiDXr1110pZaBOvIoLQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CmY76USJ+b3RgToOMc7fAjFpSbUzfNS8aRrcg8/qdeJ0fNXhSuKaPWV7SqvRbCsPGEZKI/jRRf9A58hbEA424NYGXKzhzCgFaXEkqslme1S9pOwBz9a1Vh3/A9LHvvL/4DFfAc43xPQPmNX4NDhziIHWg7rUFw219AUvP5ZqZiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F5hjKjLV; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F5hjKjLV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779760064; x=1811296064;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ulmbEncpBcQEOsMC5liskJHLDiDXr1110pZaBOvIoLQ=;
  b=F5hjKjLVCjqkhbg64B3gmWxeieLVKnToz4X88pVGMQgk2U9SRNWDPdp4
   CYjd8kq5Y7KuaPtZ06Yh/h//RzwxH5xl7iTq2u7LIm1Irhfnw47O5Q9Q+
   fAhl3J64C4C/hTszsWy4mFgB0UJLL5sjjL7yuM0t2UmuhxRURbItNv43t
   AlUpBX9P9f3O3BnexJnCcU1WPrWoZMGfVI/wwQJzQGcpOLKGwlMCtlMWs
   wLfgrqhpsS92qMFEKQHeXuXaVq25veQjs7nKjrucETZiAW7/5rVQcSZL4
   9uNcNfm4F3A2iC5te50yedhTGLuuwSNFjb3nasJUgSDM73mQYuZHGXRbc
   Q==;
X-CSE-ConnectionGUID: oBPZGkpfQaqkAC/OHwDk4A==
X-CSE-MsgGUID: LrPELFlvQSyYGFP7AxpThQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80539892"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="80539892"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 18:47:33 -0700
X-CSE-ConnectionGUID: /C3V2uXlQ++Vfh+b3GgoFw==
X-CSE-MsgGUID: JjYBWf5AQS64X4lEsK/Gxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="272074974"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 18:47:33 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 07/17] tools/arch/x86/pmtctl: Add libpmtctl JSON metric provider
Date: Mon, 25 May 2026 18:47:05 -0700
Message-ID: <20260526014719.2248380-8-david.e.box@linux.intel.com>
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

Add an optional JSON-based metric definition provider to libpmtctl_core,
allowing PMT metric definitions to be supplied at runtime from external
files rather than compiled into the library.

This allows platform-specific metric definitions to be maintained
separately from the kernel tree and updated without rebuilding the library.
The provider accepts either a single JSON file or a directory of JSON
files, loading discovered definitions into the metric database.

When built with HAVE_JANSSON, pmt_metrics_load() dispatches non-NULL path
arguments to the JSON provider. Otherwise, PMTCTL_ERR_UNSUPPORTED is
returned so callers can detect that JSON-backed loading is unavailable.

Build-system wiring is added in a later patch of the series.

Assisted-by: GitHub-Copilot:claude-sonnet-4.6
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 .../x86/pmtctl/lib/metrics_provider_json.c    | 459 ++++++++++++++++++
 1 file changed, 459 insertions(+)
 create mode 100644 tools/arch/x86/pmtctl/lib/metrics_provider_json.c

diff --git a/tools/arch/x86/pmtctl/lib/metrics_provider_json.c b/tools/arch=
/x86/pmtctl/lib/metrics_provider_json.c
new file mode 100644
index 000000000000..9c0a7e55407d
--- /dev/null
+++ b/tools/arch/x86/pmtctl/lib/metrics_provider_json.c
@@ -0,0 +1,459 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#define LOG_PREFIX "metrics_provider_json"
+#include <dirent.h>
+#include <errno.h>
+#include <jansson.h>
+#include <limits.h>
+#include <stdbool.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/stat.h>
+
+#include "lib/log.h"
+#include "lib/metrics_db.h"
+#include "lib/metrics_provider.h"
+
+static bool is_regular(const char *path)
+{
+	struct stat st;
+
+	if (stat(path, &st) < 0)
+		return false;
+
+	return !!S_ISREG(st.st_mode);
+}
+
+static bool is_dir(const char *path)
+{
+	struct stat st;
+
+	if (stat(path, &st) < 0)
+		return false;
+
+	return !!S_ISDIR(st.st_mode);
+}
+
+static const char *pool_copy(char **pool, const char *s)
+{
+	char *dst;
+	size_t len;
+
+	if (!pool || !s)
+		return NULL;
+
+	len =3D strlen(s) + 1;
+	dst =3D *pool;
+
+	memcpy(dst, s, len);
+	*pool +=3D len;
+
+	return dst;
+}
+
+/*
+ * Example PMU name: "pmt_ep_3d4bb41a"
+ * Extract GUID =3D 0x3d4bb41a
+ */
+static uint32_t parse_guid_from_pmu(const char *pmu)
+{
+	unsigned long val;
+	const char *last;
+	const char *p;
+	char *end;
+
+	if (!pmu)
+		return 0;
+
+	last =3D strrchr(pmu, '_');
+	p =3D last ? last + 1 : pmu;
+
+	end =3D NULL;
+	val =3D strtoul(p, &end, 16);
+
+	if (end =3D=3D p || val > 0xffffffffUL)
+		return 0;
+
+	return (uint32_t)val;
+}
+
+/*
+ * Decode a perf-style ConfigCode string into (sample_id, lsb, msb).
+ *
+ * Bit layout (matches scripts/gen_builtin_defs.py::decode_config_code()
+ * and scripts/pmtxml2json.py::pack_config()):
+ *
+ *   bits[15:0]   sample_id
+ *   bits[23:16]  lsb
+ *   bits[31:24]  msb
+ *
+ * Returns 0 on success, or -EINVAL if the string is malformed or the
+ * decoded range is out of bounds. A missing ConfigCode (NULL) decodes
+ * to (0, 0, 0) successfully so callers don't need to special-case it.
+ */
+static int parse_config_code(const char *s, uint32_t *sample_id,
+			     uint8_t *lsb, uint8_t *msb)
+{
+	unsigned long val;
+	char *end;
+	uint8_t l, m;
+
+	*sample_id =3D 0;
+	*lsb =3D 0;
+	*msb =3D 0;
+
+	if (!s)
+		return 0;
+
+	end =3D NULL;
+	val =3D strtoul(s, &end, 0);
+
+	if (end =3D=3D s || *end !=3D '\0' || val > 0xffffffffUL)
+		return -EINVAL;
+
+	l =3D (val >> 16) & 0xff;
+	m =3D (val >> 24) & 0xff;
+
+	if (m > 63 || l > m)
+		return -EINVAL;
+
+	*sample_id =3D val & 0xffff;
+	*lsb =3D l;
+	*msb =3D m;
+	return 0;
+}
+
+static int json_count_root(json_t *root, size_t *metric_count, size_t *str=
ing_bytes)
+{
+	size_t n;
+
+	if (!json_is_array(root))
+		return -EINVAL;
+
+	n =3D json_array_size(root);
+
+	for (size_t i =3D 0; i < n; i++) {
+		const char *name, *brief, *group, *platform_group;
+		json_t *ev;
+
+		ev =3D json_array_get(root, i);
+
+		if (!json_is_object(ev))
+			continue;
+
+		name =3D json_string_value(json_object_get(ev, "EventName"));
+		brief =3D json_string_value(json_object_get(ev, "BriefDescription"));
+		group =3D json_string_value(json_object_get(ev, "MetricGroup"));
+		platform_group =3D json_string_value(json_object_get(ev, "PlatformGroup"=
));
+
+		if (name)
+			*string_bytes +=3D strlen(name) + 1;
+		if (brief)
+			*string_bytes +=3D strlen(brief) + 1;
+		if (group)
+			*string_bytes +=3D strlen(group) + 1;
+		if (platform_group)
+			*string_bytes +=3D strlen(platform_group) + 1;
+
+		(*metric_count)++;
+	}
+
+	if (*metric_count =3D=3D 0)
+		return PMTCTL_ERR_NOMETRICS;
+
+	return 0;
+}
+
+static int json_fill_root(json_t *root, struct pmt_metric_def *defs, char =
**pool)
+{
+	int idx =3D 0;
+	size_t n;
+
+	if (!json_is_array(root))
+		return -EINVAL;
+
+	n =3D json_array_size(root);
+
+	for (size_t i =3D 0; i < n; i++) {
+		const char *pmu, *name, *brief, *group, *platform_group, *cfg;
+		json_t *ev;
+		struct pmt_metric_def *m;
+		int ret;
+
+		ev =3D json_array_get(root, i);
+
+		if (!json_is_object(ev))
+			continue;
+
+		m =3D &defs[idx++];
+
+		pmu =3D json_string_value(json_object_get(ev, "PMU"));
+		name =3D json_string_value(json_object_get(ev, "EventName"));
+		brief =3D json_string_value(json_object_get(ev, "BriefDescription"));
+		group =3D json_string_value(json_object_get(ev, "MetricGroup"));
+		platform_group =3D json_string_value(json_object_get(ev, "PlatformGroup"=
));
+		cfg =3D json_string_value(json_object_get(ev, "ConfigCode"));
+
+		m->event_name =3D pool_copy(pool, name);
+		m->description =3D pool_copy(pool, brief);
+		m->group =3D pool_copy(pool, group);
+		m->platform_group =3D pool_copy(pool, platform_group);
+		m->guid =3D pmt_guid_intern(parse_guid_from_pmu(pmu));
+		if (!m->guid)
+			return -ENOMEM;
+
+		ret =3D parse_config_code(cfg, &m->sample_id, &m->lsb, &m->msb);
+		if (ret)
+			return log_ret(ret, "metric \"%s\" (PMU %s): invalid ConfigCode \"%s\"",
+				       name ? name : "(null)",
+				       pmu ? pmu : "(null)",
+				       cfg ? cfg : "(null)");
+	}
+
+	return 0;
+}
+
+static struct pmt_metric_def *load_metrics_from_json_single(const char *pa=
th, int *count)
+{
+	json_error_t error;
+	json_t *root;
+	struct pmt_metric_def *defs;
+	void *block;
+	char *pool;
+	size_t metric_count =3D 0;
+	size_t string_bytes =3D 0;
+	size_t def_bytes;
+	size_t total_bytes;
+	int ret;
+
+	if (!count)
+		return NULL;
+
+	*count =3D 0;
+
+	root =3D json_load_file(path, 0, &error);
+	if (!root) {
+		log_err(PMTCTL_ERR_METRICS, "JSON parse error in %s: %s\n", path, error.=
text);
+		return NULL;
+	}
+
+	ret =3D json_count_root(root, &metric_count, &string_bytes);
+	if (ret < 0) {
+		json_decref(root);
+		return NULL;
+	}
+
+	def_bytes =3D metric_count * sizeof(struct pmt_metric_def);
+	total_bytes =3D def_bytes + string_bytes;
+
+	block =3D malloc(total_bytes);
+	if (!block) {
+		json_decref(root);
+		return NULL;
+	}
+
+	defs =3D block;
+	memset(defs, 0, def_bytes);
+	pool =3D (char *)block + def_bytes;
+
+	ret =3D json_fill_root(root, defs, &pool);
+	json_decref(root);
+	if (ret < 0) {
+		free(block);
+		return NULL;
+	}
+
+	*count =3D (int)metric_count;
+
+	return defs;
+}
+
+static int load_pmt_guids_sidecar(const char *path)
+{
+	json_error_t error;
+	json_t *root;
+	struct pmt_guid *table;
+	char *pool;
+	size_t string_bytes =3D 0;
+	size_t n;
+	int ret =3D -EINVAL;
+
+	root =3D json_load_file(path, 0, &error);
+	if (!root) {
+		log_warn("pmt_guids JSON parse error in %s: %s\n", path, error.text);
+		return -EINVAL;
+	}
+
+	if (!json_is_array(root)) {
+		json_decref(root);
+		return -EINVAL;
+	}
+
+	n =3D json_array_size(root);
+	if (n =3D=3D 0) {
+		json_decref(root);
+		return 0;
+	}
+
+	for (size_t i =3D 0; i < n; i++) {
+		json_t *e =3D json_array_get(root, i);
+		const char *s;
+
+		if (!json_is_object(e))
+			continue;
+		s =3D json_string_value(json_object_get(e, "name"));
+		if (s)
+			string_bytes +=3D strlen(s) + 1;
+		s =3D json_string_value(json_object_get(e, "description"));
+		if (s)
+			string_bytes +=3D strlen(s) + 1;
+	}
+
+	table =3D calloc(1, n * sizeof(*table) + string_bytes);
+	if (!table) {
+		json_decref(root);
+		return -ENOMEM;
+	}
+
+	pool =3D (char *)table + n * sizeof(*table);
+
+	for (size_t i =3D 0; i < n; i++) {
+		json_t *e =3D json_array_get(root, i);
+		const char *guid_s, *name, *desc;
+		unsigned long guid_val;
+		char *end;
+
+		if (!json_is_object(e))
+			continue;
+
+		guid_s =3D json_string_value(json_object_get(e, "guid"));
+		if (!guid_s)
+			continue;
+
+		errno =3D 0;
+		guid_val =3D strtoul(guid_s, &end, 0);
+		if (errno || end =3D=3D guid_s || *end !=3D '\0' || guid_val > UINT32_MA=
X)
+			continue;
+
+		name =3D json_string_value(json_object_get(e, "name"));
+		desc =3D json_string_value(json_object_get(e, "description"));
+
+		table[i].guid =3D (uint32_t)guid_val;
+		table[i].name =3D name ? pool_copy(&pool, name) : NULL;
+		table[i].description =3D desc ? pool_copy(&pool, desc) : NULL;
+	}
+
+	ret =3D pmt_guid_register_owned(table, table, (int)n);
+
+	json_decref(root);
+	if (ret < 0)
+		free(table);
+
+	return ret;
+}
+
+static int load_metrics_from_json_dir(const char *dir_path, struct pmt_met=
rics_db *db)
+{
+	DIR *d =3D opendir(dir_path);
+	struct dirent *de;
+	char guids_path[PATH_MAX];
+	int len;
+	int ret =3D 0;
+
+	if (!d)
+		return log_ret(-errno, "could not open %s", dir_path);
+
+	/*
+	 * Load the optional pmt_guids.json sidecar first so any subsequent
+	 * intern calls in json_fill_root() resolve to the registered
+	 * struct pmt_guid entries (with name/description populated).
+	 */
+	len =3D snprintf(guids_path, sizeof(guids_path), "%s/%s", dir_path, "pmt_=
guids.json");
+	if (len > 0 && (size_t)len < sizeof(guids_path) && is_regular(guids_path))
+		(void)load_pmt_guids_sidecar(guids_path);
+
+	while ((de =3D readdir(d)) !=3D NULL) {
+		struct pmt_metric_def *defs;
+		const char *name =3D de->d_name;
+		const char *dot =3D strrchr(name, '.');
+		char pathbuf[PATH_MAX];
+		int count =3D 0;
+
+		if (name[0] =3D=3D '.')
+			continue;
+
+		if (!dot || strcmp(dot, ".json"))
+			continue;
+
+		/* Sidecar already handled above. */
+		if (!strcmp(name, "pmt_guids.json"))
+			continue;
+
+		if (snprintf(pathbuf, sizeof(pathbuf), "%s/%s", dir_path, name) >=3D
+		    (int)sizeof(pathbuf))
+			continue;
+		if (!is_regular(pathbuf))
+			continue;
+
+		defs =3D load_metrics_from_json_single(pathbuf, &count);
+		if (!defs) {
+			log_warn("unable to load JSON %s\n", pathbuf);
+			ret =3D -EINVAL;
+			continue;
+		}
+
+		ret =3D pmt_metrics_add_block(db, defs, count, false);
+		if (ret < 0) {
+			free(defs);
+			log_ret(ret, "unable to add json %s", pathbuf);
+			break;
+		}
+	}
+	closedir(d);
+
+	if (ret < 0) {
+		pmt_metrics_free(db);
+		return ret;
+	}
+
+	/*
+	 * Successfully scanned the directory.  A zero count is reported via
+	 * db->total =3D=3D 0 to the caller; the dir itself was not broken, so
+	 * do not invent an error rc here.  pmtctl_init() distinguishes
+	 * "broken source" (negative rc) from "empty source" (rc =3D=3D 0 with
+	 * db->total =3D=3D 0) and only fails the init in the former case.
+	 */
+	return 0;
+}
+
+int pmt_metrics_load_json(const char *json_path, struct pmt_metrics_db *db)
+{
+	int ret;
+
+	if (!db)
+		log_bug_and_exit("invalid metric db pointer");
+
+	if (!json_path)
+		return PMTCTL_ERR_METRICS;
+
+	if (is_regular(json_path)) {
+		struct pmt_metric_def *defs;
+		int count =3D 0;
+
+		defs =3D load_metrics_from_json_single(json_path, &count);
+		if (!defs)
+			return log_ret(PMTCTL_ERR_METRICS, "unable to load json %s", json_path);
+
+		ret =3D pmt_metrics_add_block(db, defs, count, false);
+		if (ret < 0) {
+			free(defs);
+			return log_ret(ret, "unable to add json %s", json_path);
+		}
+
+		return 0;
+	}
+
+	if (is_dir(json_path))
+		return load_metrics_from_json_dir(json_path, db);
+
+	return PMTCTL_ERR_METRICS;
+}
--=20
2.43.0

