Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEA63DD85A;
	Tue, 26 May 2026 11:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779793487; cv=none; b=QxEIRYbCdGBBBMVIprDjUkx3XDdrGPEgNr6L4CESQ4QW7aPT2PjYWm3w31HD1x1bGzaoiU2G36w691fbAeK91VoLJ7UZd1hUUfr4lMcatImJo22oZ1V9BL7HuV4fOcmCe/zR3Eq+tBTtae37i/AD1sjX9JoSIOUQfRWkUNgNdoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779793487; c=relaxed/simple;
	bh=WoLzcVkLwI8pQVDZ+S6A+JK95nYE2ThpzWWgTBX35jo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GU5OoNT+K2IcUFet3TSOAEvU9l7XhWC6/Rtvp+B70xQJuPqyWnXd5C+WEdeK5jV6ZHF3bOPY0oHF2dbu/hm9BvPCCXCiZEz1pw7ECTUwImlyGWKo686ZX0ypawUqOkep15h45o32DnVwPDIJLenX+hYnLldGWf8iFnFOWa+WEYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n/VgqgyY; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n/VgqgyY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779793485; x=1811329485;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=WoLzcVkLwI8pQVDZ+S6A+JK95nYE2ThpzWWgTBX35jo=;
  b=n/VgqgyYKQlGqTfouBeru79OqRZu23v2/Da5MfsrtxkoOba+lIXEIMhf
   tlPZQDQnhcOeb6m1e/vwbUFzpp70y6iV81f4hnasmC9a15swZI670aIbC
   yrLyxL4li5S5L9ktDuHZEGtMnpGecJuer02iafviNnrtCAwveUHvkhjO1
   1ZF/FE8XhVA57McK4ST/x5Ba5AXHwcebZ/02qYkTJuSE8T6PaDTEAQUni
   KSspGyYYMpesbuZ5+F11UGfamvobVQnhzPdF3c2msX0HGIV+xEixL7CKZ
   yeoT1NxTfD2hUouMlG5Ixgr/wvNymvIiHUQAIYavrRGoyr6n3CSW6cEEQ
   Q==;
X-CSE-ConnectionGUID: JaeJItJpQ9q6OrPtdzIe4A==
X-CSE-MsgGUID: WnamKqv7SfCUbm6LAjHHRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="91710353"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="91710353"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 04:04:45 -0700
X-CSE-ConnectionGUID: RPenWalLS6+QzrCsXivPpA==
X-CSE-MsgGUID: znhugvkBRvWQpWt+ctbCEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="240838292"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.137])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 04:04:43 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 26 May 2026 14:04:39 +0300 (EEST)
To: "David E. Box" <david.e.box@linux.intel.com>
cc: LKML <linux-kernel@vger.kernel.org>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 07/17] tools/arch/x86/pmtctl: Add libpmtctl JSON metric
 provider
In-Reply-To: <20260526014719.2248380-8-david.e.box@linux.intel.com>
Message-ID: <931acdcb-2aaa-7ffa-b51e-c518d0530078@linux.intel.com>
References: <20260526014719.2248380-1-david.e.box@linux.intel.com> <20260526014719.2248380-8-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 25 May 2026, David E. Box wrote:

> Add an optional JSON-based metric definition provider to libpmtctl_core,
> allowing PMT metric definitions to be supplied at runtime from external
> files rather than compiled into the library.
> 
> This allows platform-specific metric definitions to be maintained
> separately from the kernel tree and updated without rebuilding the library.
> The provider accepts either a single JSON file or a directory of JSON
> files, loading discovered definitions into the metric database.
> 
> When built with HAVE_JANSSON, pmt_metrics_load() dispatches non-NULL path
> arguments to the JSON provider. Otherwise, PMTCTL_ERR_UNSUPPORTED is
> returned so callers can detect that JSON-backed loading is unavailable.
> 
> Build-system wiring is added in a later patch of the series.
> 
> Assisted-by: GitHub-Copilot:claude-sonnet-4.6
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
>  .../x86/pmtctl/lib/metrics_provider_json.c    | 459 ++++++++++++++++++
>  1 file changed, 459 insertions(+)
>  create mode 100644 tools/arch/x86/pmtctl/lib/metrics_provider_json.c
> 
> diff --git a/tools/arch/x86/pmtctl/lib/metrics_provider_json.c b/tools/arch/x86/pmtctl/lib/metrics_provider_json.c
> new file mode 100644
> index 000000000000..9c0a7e55407d
> --- /dev/null
> +++ b/tools/arch/x86/pmtctl/lib/metrics_provider_json.c
> @@ -0,0 +1,459 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#define LOG_PREFIX "metrics_provider_json"

Empty lines missing, but shouldn't this be after includes?

> +#include <dirent.h>
> +#include <errno.h>
> +#include <jansson.h>
> +#include <limits.h>
> +#include <stdbool.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <sys/stat.h>
> +
> +#include "lib/log.h"
> +#include "lib/metrics_db.h"
> +#include "lib/metrics_provider.h"
> +
> +static bool is_regular(const char *path)
> +{
> +	struct stat st;
> +
> +	if (stat(path, &st) < 0)
> +		return false;
> +
> +	return !!S_ISREG(st.st_mode);

Unnecessary !!

> +}
> +
> +static bool is_dir(const char *path)
> +{
> +	struct stat st;
> +
> +	if (stat(path, &st) < 0)
> +		return false;
> +
> +	return !!S_ISDIR(st.st_mode);
> +}
> +
> +static const char *pool_copy(char **pool, const char *s)
> +{
> +	char *dst;
> +	size_t len;
> +
> +	if (!pool || !s)
> +		return NULL;
> +
> +	len = strlen(s) + 1;
> +	dst = *pool;
> +
> +	memcpy(dst, s, len);

This is generally a dangerous pattern: length is taken from that of 
source, whereas we'd want to check that dst space does not overflow.

> +	*pool += len;

This looks some adhoc string heap management to me, and it honestly 
doesn't impress me.

> +	return dst;
> +}
> +
> +/*
> + * Example PMU name: "pmt_ep_3d4bb41a"
> + * Extract GUID = 0x3d4bb41a
> + */
> +static uint32_t parse_guid_from_pmu(const char *pmu)
> +{
> +	unsigned long val;
> +	const char *last;
> +	const char *p;
> +	char *end;
> +
> +	if (!pmu)
> +		return 0;
> +
> +	last = strrchr(pmu, '_');
> +	p = last ? last + 1 : pmu;
> +
> +	end = NULL;
> +	val = strtoul(p, &end, 16);
> +
> +	if (end == p || val > 0xffffffffUL)

Some _MAX?

> +		return 0;
> +
> +	return (uint32_t)val;
> +}
> +
> +/*
> + * Decode a perf-style ConfigCode string into (sample_id, lsb, msb).
> + *
> + * Bit layout (matches scripts/gen_builtin_defs.py::decode_config_code()
> + * and scripts/pmtxml2json.py::pack_config()):
> + *
> + *   bits[15:0]   sample_id
> + *   bits[23:16]  lsb
> + *   bits[31:24]  msb
> + *
> + * Returns 0 on success, or -EINVAL if the string is malformed or the
> + * decoded range is out of bounds. A missing ConfigCode (NULL) decodes
> + * to (0, 0, 0) successfully so callers don't need to special-case it.
> + */
> +static int parse_config_code(const char *s, uint32_t *sample_id,
> +			     uint8_t *lsb, uint8_t *msb)
> +{
> +	unsigned long val;
> +	char *end;
> +	uint8_t l, m;
> +
> +	*sample_id = 0;
> +	*lsb = 0;
> +	*msb = 0;
> +
> +	if (!s)
> +		return 0;
> +
> +	end = NULL;
> +	val = strtoul(s, &end, 0);
> +
> +	if (end == s || *end != '\0' || val > 0xffffffffUL)

*_MAX?

> +		return -EINVAL;
> +
> +	l = (val >> 16) & 0xff;
> +	m = (val >> 24) & 0xff;
> +
> +	if (m > 63 || l > m)

63 relates to bit index so don't write it as a literal)

> +		return -EINVAL;
> +
> +	*sample_id = val & 0xffff;
> +	*lsb = l;
> +	*msb = m;
> +	return 0;
> +}
> +
> +static int json_count_root(json_t *root, size_t *metric_count, size_t *string_bytes)
> +{
> +	size_t n;
> +
> +	if (!json_is_array(root))
> +		return -EINVAL;
> +
> +	n = json_array_size(root);
> +
> +	for (size_t i = 0; i < n; i++) {
> +		const char *name, *brief, *group, *platform_group;
> +		json_t *ev;
> +
> +		ev = json_array_get(root, i);
> +
> +		if (!json_is_object(ev))

No empty lines between call and its error handling.

> +			continue;
> +
> +		name = json_string_value(json_object_get(ev, "EventName"));
> +		brief = json_string_value(json_object_get(ev, "BriefDescription"));
> +		group = json_string_value(json_object_get(ev, "MetricGroup"));
> +		platform_group = json_string_value(json_object_get(ev, "PlatformGroup"));
> +
> +		if (name)
> +			*string_bytes += strlen(name) + 1;
> +		if (brief)
> +			*string_bytes += strlen(brief) + 1;
> +		if (group)
> +			*string_bytes += strlen(group) + 1;
> +		if (platform_group)
> +			*string_bytes += strlen(platform_group) + 1;

Another part of the adhoc heap management? Please don't do this.

> +
> +		(*metric_count)++;
> +	}
> +
> +	if (*metric_count == 0)
> +		return PMTCTL_ERR_NOMETRICS;
> +
> +	return 0;
> +}
> +
> +static int json_fill_root(json_t *root, struct pmt_metric_def *defs, char **pool)
> +{
> +	int idx = 0;
> +	size_t n;
> +
> +	if (!json_is_array(root))
> +		return -EINVAL;
> +
> +	n = json_array_size(root);
> +
> +	for (size_t i = 0; i < n; i++) {
> +		const char *pmu, *name, *brief, *group, *platform_group, *cfg;
> +		json_t *ev;
> +		struct pmt_metric_def *m;
> +		int ret;
> +
> +		ev = json_array_get(root, i);
> +
> +		if (!json_is_object(ev))
> +			continue;
> +
> +		m = &defs[idx++];
> +
> +		pmu = json_string_value(json_object_get(ev, "PMU"));
> +		name = json_string_value(json_object_get(ev, "EventName"));
> +		brief = json_string_value(json_object_get(ev, "BriefDescription"));
> +		group = json_string_value(json_object_get(ev, "MetricGroup"));
> +		platform_group = json_string_value(json_object_get(ev, "PlatformGroup"));
> +		cfg = json_string_value(json_object_get(ev, "ConfigCode"));
> +
> +		m->event_name = pool_copy(pool, name);
> +		m->description = pool_copy(pool, brief);
> +		m->group = pool_copy(pool, group);
> +		m->platform_group = pool_copy(pool, platform_group);
> +		m->guid = pmt_guid_intern(parse_guid_from_pmu(pmu));
> +		if (!m->guid)
> +			return -ENOMEM;
> +
> +		ret = parse_config_code(cfg, &m->sample_id, &m->lsb, &m->msb);
> +		if (ret)
> +			return log_ret(ret, "metric \"%s\" (PMU %s): invalid ConfigCode \"%s\"",
> +				       name ? name : "(null)",
> +				       pmu ? pmu : "(null)",
> +				       cfg ? cfg : "(null)");
> +	}
> +
> +	return 0;
> +}
> +
> +static struct pmt_metric_def *load_metrics_from_json_single(const char *path, int *count)
> +{
> +	json_error_t error;
> +	json_t *root;
> +	struct pmt_metric_def *defs;
> +	void *block;
> +	char *pool;
> +	size_t metric_count = 0;
> +	size_t string_bytes = 0;
> +	size_t def_bytes;
> +	size_t total_bytes;
> +	int ret;
> +
> +	if (!count)
> +		return NULL;
> +
> +	*count = 0;
> +
> +	root = json_load_file(path, 0, &error);
> +	if (!root) {
> +		log_err(PMTCTL_ERR_METRICS, "JSON parse error in %s: %s\n", path, error.text);
> +		return NULL;
> +	}
> +
> +	ret = json_count_root(root, &metric_count, &string_bytes);
> +	if (ret < 0) {
> +		json_decref(root);
> +		return NULL;
> +	}
> +
> +	def_bytes = metric_count * sizeof(struct pmt_metric_def);
> +	total_bytes = def_bytes + string_bytes;
> +
> +	block = malloc(total_bytes);
> +	if (!block) {
> +		json_decref(root);
> +		return NULL;
> +	}
> +
> +	defs = block;
> +	memset(defs, 0, def_bytes);
> +	pool = (char *)block + def_bytes;
> +
> +	ret = json_fill_root(root, defs, &pool);
> +	json_decref(root);
> +	if (ret < 0) {
> +		free(block);
> +		return NULL;
> +	}
> +
> +	*count = (int)metric_count;
> +
> +	return defs;
> +}
> +
> +static int load_pmt_guids_sidecar(const char *path)
> +{
> +	json_error_t error;
> +	json_t *root;
> +	struct pmt_guid *table;
> +	char *pool;
> +	size_t string_bytes = 0;
> +	size_t n;
> +	int ret = -EINVAL;
> +
> +	root = json_load_file(path, 0, &error);
> +	if (!root) {
> +		log_warn("pmt_guids JSON parse error in %s: %s\n", path, error.text);
> +		return -EINVAL;
> +	}
> +
> +	if (!json_is_array(root)) {
> +		json_decref(root);
> +		return -EINVAL;
> +	}
> +
> +	n = json_array_size(root);
> +	if (n == 0) {
> +		json_decref(root);
> +		return 0;
> +	}
> +
> +	for (size_t i = 0; i < n; i++) {
> +		json_t *e = json_array_get(root, i);
> +		const char *s;
> +
> +		if (!json_is_object(e))
> +			continue;
> +		s = json_string_value(json_object_get(e, "name"));
> +		if (s)
> +			string_bytes += strlen(s) + 1;
> +		s = json_string_value(json_object_get(e, "description"));
> +		if (s)
> +			string_bytes += strlen(s) + 1;
> +	}
> +
> +	table = calloc(1, n * sizeof(*table) + string_bytes);
> +	if (!table) {
> +		json_decref(root);
> +		return -ENOMEM;

Instead of duplication root decref, add a label and goto to the end.

> +	}
> +
> +	pool = (char *)table + n * sizeof(*table);

Can this be written without casting to an alien type???

> +
> +	for (size_t i = 0; i < n; i++) {
> +		json_t *e = json_array_get(root, i);
> +		const char *guid_s, *name, *desc;
> +		unsigned long guid_val;
> +		char *end;
> +
> +		if (!json_is_object(e))
> +			continue;
> +
> +		guid_s = json_string_value(json_object_get(e, "guid"));
> +		if (!guid_s)
> +			continue;
> +
> +		errno = 0;
> +		guid_val = strtoul(guid_s, &end, 0);
> +		if (errno || end == guid_s || *end != '\0' || guid_val > UINT32_MAX)
> +			continue;
> +
> +		name = json_string_value(json_object_get(e, "name"));
> +		desc = json_string_value(json_object_get(e, "description"));
> +
> +		table[i].guid = (uint32_t)guid_val;
> +		table[i].name = name ? pool_copy(&pool, name) : NULL;
> +		table[i].description = desc ? pool_copy(&pool, desc) : NULL;

pool_copy() handles NULL inputs so why is the check duplicated here?

> +	}
> +
> +	ret = pmt_guid_register_owned(table, table, (int)n);

A typing issue?

> +
> +	json_decref(root);
> +	if (ret < 0)
> +		free(table);

Error handling should be first.

> +
> +	return ret;
> +}
> +
> +static int load_metrics_from_json_dir(const char *dir_path, struct pmt_metrics_db *db)
> +{
> +	DIR *d = opendir(dir_path);
> +	struct dirent *de;
> +	char guids_path[PATH_MAX];
> +	int len;
> +	int ret = 0;
> +
> +	if (!d)
> +		return log_ret(-errno, "could not open %s", dir_path);
> +
> +	/*
> +	 * Load the optional pmt_guids.json sidecar first so any subsequent
> +	 * intern calls in json_fill_root() resolve to the registered
> +	 * struct pmt_guid entries (with name/description populated).
> +	 */
> +	len = snprintf(guids_path, sizeof(guids_path), "%s/%s", dir_path, "pmt_guids.json");
> +	if (len > 0 && (size_t)len < sizeof(guids_path) && is_regular(guids_path))
> +		(void)load_pmt_guids_sidecar(guids_path);
> +
> +	while ((de = readdir(d)) != NULL) {
> +		struct pmt_metric_def *defs;
> +		const char *name = de->d_name;
> +		const char *dot = strrchr(name, '.');
> +		char pathbuf[PATH_MAX];
> +		int count = 0;
> +
> +		if (name[0] == '.')

dot == name ?

> +			continue;
> +
> +		if (!dot || strcmp(dot, ".json"))
> +			continue;
> +
> +		/* Sidecar already handled above. */
> +		if (!strcmp(name, "pmt_guids.json"))
> +			continue;
> +
> +		if (snprintf(pathbuf, sizeof(pathbuf), "%s/%s", dir_path, name) >=
> +		    (int)sizeof(pathbuf))

No! Do the error check separately.

> +			continue;
> +		if (!is_regular(pathbuf))
> +			continue;
> +
> +		defs = load_metrics_from_json_single(pathbuf, &count);
> +		if (!defs) {
> +			log_warn("unable to load JSON %s\n", pathbuf);
> +			ret = -EINVAL;
> +			continue;
> +		}
> +
> +		ret = pmt_metrics_add_block(db, defs, count, false);
> +		if (ret < 0) {
> +			free(defs);
> +			log_ret(ret, "unable to add json %s", pathbuf);
> +			break;
> +		}
> +	}
> +	closedir(d);
> +
> +	if (ret < 0) {
> +		pmt_metrics_free(db);
> +		return ret;
> +	}
> +
> +	/*
> +	 * Successfully scanned the directory.  A zero count is reported via
> +	 * db->total == 0 to the caller; the dir itself was not broken, so
> +	 * do not invent an error rc here.  pmtctl_init() distinguishes
> +	 * "broken source" (negative rc) from "empty source" (rc == 0 with
> +	 * db->total == 0) and only fails the init in the former case.
> +	 */
> +	return 0;
> +}
> +
> +int pmt_metrics_load_json(const char *json_path, struct pmt_metrics_db *db)
> +{
> +	int ret;
> +
> +	if (!db)
> +		log_bug_and_exit("invalid metric db pointer");
> +
> +	if (!json_path)
> +		return PMTCTL_ERR_METRICS;
> +
> +	if (is_regular(json_path)) {
> +		struct pmt_metric_def *defs;
> +		int count = 0;
> +
> +		defs = load_metrics_from_json_single(json_path, &count);
> +		if (!defs)
> +			return log_ret(PMTCTL_ERR_METRICS, "unable to load json %s", json_path);
> +
> +		ret = pmt_metrics_add_block(db, defs, count, false);
> +		if (ret < 0) {
> +			free(defs);
> +			return log_ret(ret, "unable to add json %s", json_path);
> +		}
> +
> +		return 0;
> +	}
> +
> +	if (is_dir(json_path))
> +		return load_metrics_from_json_dir(json_path, db);
> +
> +	return PMTCTL_ERR_METRICS;
> +}
> 

-- 
 i.

