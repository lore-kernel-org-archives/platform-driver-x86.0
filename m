Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A325C41B36A;
	Tue, 26 May 2026 17:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779817500; cv=none; b=jqtDSjw4ct0u1nhSK6sl/R8h3V1EPdK9/5QeOLXxwytPjySP2TvpO4wBdkUyg8p9sqW7Bj6Yf8JKtiRRrNUOQtvqgZh02B2VbHm1jgGC3Xi5CmXgy0TrnEVgMn3PFvRdy7Lm35hqSNr26fXsIuzmedNPKedcRtpQU1FB2gZ1g0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779817500; c=relaxed/simple;
	bh=6ZabK3W+RlLlOC5aPQxgIhQ4LqndbJ7QquVa4RZVU1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pKwTA5nhNzAK24044+d1MW3Gzi30F3ahs8s29NKGgLSDS1FeDjUCJz4pJ9dJbGRzeiPAhgmht/5QqMlTiQ60RlI28O2BDFu1j6gSDvX1EZCev4ZbsX3JISDGC6gUKrP/nCKMxL4K1vaOgF7bMpUULiCoFLLLvlt9qGRRDEJ12/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KMMzAa5q; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KMMzAa5q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779817499; x=1811353499;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=6ZabK3W+RlLlOC5aPQxgIhQ4LqndbJ7QquVa4RZVU1Y=;
  b=KMMzAa5qgsCwPTv+X1kobXPNrJ4uM1hZwp+ffNYIBqgwtBRI0/bOl8K1
   RdYyn0HW5+AudQbrLHS0+xl0f5vPRipS6tsG7ab3qh8YWf3pLFdx+V0rL
   M0qWbGIj36ofvE0qPkLo9+EYJUoy40uCX4DFQ/uXzgr7z2Xtr7ng+/w0g
   7slOo8rYjN6r978Fc463rO0jtOCg/g/5bwVmIyTqytcYcF+mLx/0oqb5O
   Xixh6Sc63mlK27V9Ms6cYsLoegowpXcGvRK33/E4A1M1aQbYGpVyKPM+G
   43OufrEVwiV3CdwolhBdVQYbU7hOQjDuxScW3fpVn1ZEGql0F2B6NQ/Ef
   g==;
X-CSE-ConnectionGUID: r8tqG/QwQUOsVJ49RBxt6g==
X-CSE-MsgGUID: WaxZb+ntSBCcay7tlk8y3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="103316318"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="103316318"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 10:44:58 -0700
X-CSE-ConnectionGUID: uIQbeJxdS/2y2zQSQrQjOA==
X-CSE-MsgGUID: X7AGNkRDR6GP3hzoMqE2PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="247080385"
Received: from debox1-desk4.jf.intel.com (HELO localhost) ([10.88.27.138])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 10:44:58 -0700
Date: Tue, 26 May 2026 10:44:57 -0700
From: David Box <david.e.box@linux.intel.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 08/17] tools/arch/x86/pmtctl: Add libpmtctl public API
 and context
Message-ID: <wcoaxqklkidkqufvlodnhfpxrhjjkirvoyakzvtoadt3r6tjhw@ohcz7fuvbo7y>
References: <20260526014719.2248380-1-david.e.box@linux.intel.com>
 <20260526014719.2248380-9-david.e.box@linux.intel.com>
 <da65991e-fc47-49ea-ae5e-6b5b696bb613@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <da65991e-fc47-49ea-ae5e-6b5b696bb613@linux.intel.com>

On Tue, May 26, 2026 at 02:25:06PM +0300, Ilpo Järvinen wrote:
> On Mon, 25 May 2026, David E. Box wrote:
> 
> > Add the public API for libpmtctl_core and the context object that backs it,
> > providing callers with a stable, opaque interface for discovering Intel PMT
> > telemetry devices and querying their metrics without depending on internal
> > library structures.
> > 
> > This patch adds the primary lifecycle and query interfaces used by library
> > consumers. pmtctl_init() performs device enumeration and metric database
> > loading once during initialization so subsequent queries operate on cached
> > state rather than re-scanning sysfs. pmtctl_cleanup() releases associated
> > resources.
> > 
> > The library context (struct pmtctl_context) remains opaque to callers.
> > pmtctl_get_ctx() provides controlled access for consumers that need to pass
> > library context across translation units.
> > 
> > Add PMTCTL_SCOPE_GUARD() as a convenience macro for deterministic cleanup
> > of library-managed resources in single-exit C code paths.
> > 
> > Build-system wiring is added a later patch of the series.
> > 
> > Assisted-by: GitHub-Copilot:claude-sonnet-4.6
> > Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> > ---
> >  tools/arch/x86/pmtctl/include/lib/pmtctl.h    |  90 +++++
> >  .../x86/pmtctl/include/lib/pmtctl_context.h   |  21 ++
> >  tools/arch/x86/pmtctl/lib/pmtctl.c            | 327 ++++++++++++++++++
> >  3 files changed, 438 insertions(+)
> >  create mode 100644 tools/arch/x86/pmtctl/include/lib/pmtctl.h
> >  create mode 100644 tools/arch/x86/pmtctl/include/lib/pmtctl_context.h
> >  create mode 100644 tools/arch/x86/pmtctl/lib/pmtctl.c
> > 
> > diff --git a/tools/arch/x86/pmtctl/include/lib/pmtctl.h b/tools/arch/x86/pmtctl/include/lib/pmtctl.h
> > new file mode 100644
> > index 000000000000..b243a48e8d72
> > --- /dev/null
> > +++ b/tools/arch/x86/pmtctl/include/lib/pmtctl.h
> > @@ -0,0 +1,90 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef PMTCTL_H
> > +#define PMTCTL_H
> > +
> > +#include <stdbool.h>
> > +#include <stdint.h>
> > +
> > +#include <linux/compiler.h>
> > +#include "pmtctl_types.h"
> > +
> > +enum pmt_selector_kind {
> > +	PMT_SEL_ANY = 0,   /* no selector provided */
> > +	PMT_SEL_GUID,      /* guid=27971628 */
> > +	PMT_SEL_EP_NAME,   /* ep=pmt_ep_27971628_0 OR ep=telem1 */
> > +};
> > +
> > +struct pmt_ep_selector {
> > +	enum pmt_selector_kind kind;
> > +
> > +	uint32_t guid;
> > +
> > +	/* For SEL_EP_NAME */
> > +	const char *str;
> > +};
> > +
> > +struct pmt_binding {
> > +	int metric_idx;   /* index into defs[] */
> > +	int device_idx;   /* index into devices[] */
> > +};
> > +
> > +struct pmtctl_context;
> > +
> > +struct pmt_global_opts {
> > +	const char            *json_path;        /* -J / --json-file */
> > +	const char            *device_selector;  /* -d / --device (raw) */
> > +	bool                   quiet;            /* -q / --quiet */
> > +	bool                   debug;            /* --debug */
> > +};
> > +
> > +/*
> > + * Initialize library-global PMT state.
> > + *
> > + * This may return success even if no metric definitions are available.
> > + * In that case, device enumeration is still usable and raw mode remains
> > + * supported (raw reads do not require metric definitions).
> > + */
> > +int pmtctl_init(const struct pmt_global_opts *gopts);
> > +const struct pmtctl_context *pmtctl_get_ctx(void);
> > +enum pmt_device_type pmtctl_get_device_type(void);
> > +int pmtctl_get_num_devices(void);
> > +int pmtctl_get_num_metrics(void);
> > +int pmtctl_get_num_bindings(void);
> > +
> > +/*
> > + * Set process-global library logging verbosity.
> > + *
> > + * Invalid values are clamped to PMTCTL_LOG_INFO.
> > + */
> > +void pmtctl_set_log_level(enum pmtctl_log_level level);
> > +
> > +/*
> > + * Thread-safety note:
> > + *
> > + * libpmtctl_core is generally not thread-safe. Callers should serialize
> > + * pmtctl_init()/pmtctl_cleanup() and API usage around shared library state.
> > + */
> > +void pmtctl_cleanup(void);
> > +
> > +static inline __always_unused void pmtctl_scope_cleanup(int *unused)
> > +{
> > +	(void)unused;
> > +	pmtctl_cleanup();
> > +}
> > +
> > +#define PMTCTL_SCOPE_GUARD                              \
> > +	__attribute__((cleanup(pmtctl_scope_cleanup)))  \
> > +	int _pmtctl_scope_guard __always_unused \
> > +
> > +int pmt_select_devices(const struct pmtctl_context *ctx, const struct pmt_ep_selector *sel,
> > +		       int *out_idx, int max_out);
> > +
> > +/*
> > + * Parse an ep selector string like "guid=27971628" or "ep=pmt_ep_...".
> > + * For selectors that set a string (ep/name) the implementation will
> > + * allocate a copy into sel->str; the caller is responsible for freeing
> > + * sel->str if non-NULL.
> > + */
> > +int pmtctl_parse_ep_selector(const char *s, struct pmt_ep_selector *out);
> > +
> > +#endif
> > diff --git a/tools/arch/x86/pmtctl/include/lib/pmtctl_context.h b/tools/arch/x86/pmtctl/include/lib/pmtctl_context.h
> > new file mode 100644
> > index 000000000000..6f3e8563f7eb
> > --- /dev/null
> > +++ b/tools/arch/x86/pmtctl/include/lib/pmtctl_context.h
> > @@ -0,0 +1,21 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef PMTCTL_CONTEXT_H
> > +#define PMTCTL_CONTEXT_H
> > +
> > +#include "lib/device.h"
> > +#include "lib/metrics_db.h"
> > +#include "lib/pmtctl.h"
> > +
> > +struct pmtctl_context {
> > +	const struct pmt_device_ops *ops;
> > +
> > +	struct pmt_device *devices;
> > +	int num_devices;
> > +
> > +	struct pmt_metrics_db metrics;
> > +
> > +	struct pmt_binding *bindings;
> > +	int num_bindings;
> > +};
> > +
> > +#endif
> > diff --git a/tools/arch/x86/pmtctl/lib/pmtctl.c b/tools/arch/x86/pmtctl/lib/pmtctl.c
> > new file mode 100644
> > index 000000000000..5ee2f576316a
> > --- /dev/null
> > +++ b/tools/arch/x86/pmtctl/lib/pmtctl.c
> > @@ -0,0 +1,327 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +#include <errno.h>
> > +#include <string.h>
> > +#include <stdio.h>
> > +#include <stdlib.h>
> > +
> > +#include "lib/common.h"
> > +#include "lib/device.h"
> > +#include "lib/log.h"
> > +#include "lib/metrics_db.h"
> > +#include "lib/metrics_provider.h"
> > +#include "lib/pmtctl.h"
> > +#include "lib/pmtctl_context.h"
> > +
> > +static struct pmtctl_context g_pmtctl_ctx;
> > +
> > +const struct pmtctl_context *pmtctl_get_ctx(void)
> > +{
> > +	return &g_pmtctl_ctx;
> > +}
> > +
> > +enum pmt_device_type pmtctl_get_device_type(void)
> > +{
> > +	const struct pmt_device_ops *ops = g_pmtctl_ctx.ops;
> > +
> > +	return ops ? ops->dev_type : PMT_DEVICE_TELEM;
> > +}
> > +
> > +int pmtctl_get_num_devices(void)
> > +{
> > +	return g_pmtctl_ctx.num_devices;
> > +}
> > +
> > +int pmtctl_get_num_metrics(void)
> > +{
> > +	return g_pmtctl_ctx.metrics.total;
> > +}
> > +
> > +int pmtctl_get_num_bindings(void)
> > +{
> > +	return g_pmtctl_ctx.num_bindings;
> > +}
> > +
> > +void pmtctl_set_log_level(enum pmtctl_log_level level)
> > +{
> > +	log_set_level(level);
> > +}
> > +
> > +int pmt_select_devices(const struct pmtctl_context *ctx,
> > +		       const struct pmt_ep_selector *sel,
> > +		       int *out_idx, int max_out)
> > +{
> > +	int i, n = 0;
> > +
> > +	if (!ctx || !sel || !out_idx || max_out <= 0)
> > +		return log_ret(PMTCTL_ERR_INVALID, "bad argument");
> > +
> > +	if (!ctx->devices || ctx->num_devices <= 0)
> > +		return log_ret(PMTCTL_ERR_INVALID, "no devices");
> > +
> > +	switch (sel->kind) {
> > +	case PMT_SEL_ANY:
> > +		/* No filter: return all devices */
> > +		for (i = 0; i < ctx->num_devices && n < max_out; i++)
> > +			out_idx[n++] = i;
> > +		break;
> > +
> > +	case PMT_SEL_GUID:
> > +		for (i = 0; i < ctx->num_devices && n < max_out; i++) {
> > +			const struct pmt_device *dev = &ctx->devices[i];
> > +
> > +			if (dev->guid && dev->guid->guid == sel->guid)
> > +				out_idx[n++] = i;
> > +		}
> > +		break;
> > +
> > +	case PMT_SEL_EP_NAME:
> > +		if (!sel->str || !sel->str[0])
> > +			return log_ret(PMTCTL_ERR_CMD_PARSE, "empty ep selector");
> > +
> > +		for (i = 0; i < ctx->num_devices && n < max_out; i++) {
> > +			const struct pmt_device *dev = &ctx->devices[i];
> > +
> > +			if (dev->name && strcmp(dev->name, sel->str) == 0)
> 
> !strcmp()
> 
> > +				out_idx[n++] = i;
> > +		}
> 
> 
> Move the code to helper with parameter(s) to filter variations.
> 
> > +		break;
> > +
> > +	default:
> > +		return log_ret(PMTCTL_ERR_CMD_PARSE, "unknown selector kind %d", sel->kind);
> > +	}
> > +
> > +	/* n == 0 is "no matches", not an API error. Caller decides what to do. */
> > +	return n;
> > +}
> > +
> > +int pmtctl_parse_ep_selector(const char *s, struct pmt_ep_selector *out)
> > +{
> > +	auto_free char *copy = NULL;
> > +	char *end;
> > +	char *eq;
> > +	char *key = NULL;
> > +	const char *val = NULL;
> > +
> > +	if (!out)
> > +		return -EINVAL;
> > +
> > +	if (!s || !*s) {
> > +		out->kind = PMT_SEL_ANY;
> > +		out->str = NULL;
> > +		out->guid = 0;
> > +		return 0;
> > +	}
> > +
> > +	/* Expect a single key=value selector: guid=..., ep=..., name=... */
> > +	copy = strdup(s);
> > +
> > +	if (!copy)
> > +		return -ENOMEM;
> 
> Hmm, so for some reason this can survive without invoking exit() right 
> away. I wonder if exit() is really necessary with the other xstrdup() 
> callers either...
> 
> > +
> > +	eq = strchr(copy, '=');
> > +	if (!eq)
> > +		return -EINVAL;
> > +
> > +	*eq = '\0';
> > +	key = copy;
> > +	val = eq + 1;
> > +
> > +	if (!strcmp(key, "guid")) {
> > +		errno = 0;
> > +		unsigned long v = strtoul(val, &end, 16);
> > +
> 
> Please fix this.
> 
> I think I've read enough of AI thrown curveballs. Please review _all_ the 
> patches yourself before sending them again and don't let AI slipping from 
> usual style or using unusual construct through but fix them all before 
> submitting.
> 
> Given the size of this patch series, the next round, I'll just be passing 
> the ball back to ypu on the spot where I see the usual style is blatantly
> violated or some odd constructs are found.
> 
> I think I was quite generous to look this far.

Yes you were.

I agree with the feedback. I started leaning too much on generated code toward
the end of development and did not give the final result the full line-by-line
review it needed before posting.

Rather than respond to each comment, I'll do a full pass over the series for v2,
addressing the issues you mentioned along with any other inconsistencies.

Thanks for taking the time to review it this far.

David

> 
> > +		if (errno || end == val || *end != '\0' || v > UINT32_MAX)
> > +			return errno ? -errno : -EINVAL;
> 
> Please split if you have to do elvis like this.
> 
> --
>  i.
> 
> > +		out->kind = PMT_SEL_GUID;
> > +		out->guid = (uint32_t)v;
> > +		out->str = NULL;
> > +	} else if (!strcmp(key, "ep") || !strcmp(key, "name")) {
> > +		out->kind = PMT_SEL_EP_NAME;
> > +		out->str = strdup(val);
> > +		if (!out->str)
> > +			return -ENOMEM;
> > +		out->guid = 0;
> > +	} else {
> > +		log_err(PMTCTL_ERR_CMD_PARSE, "unknown device selector %s", key);
> > +		return -EINVAL;
> > +	}
> > +	return 0;
> > +}
> > +
> > +static bool
> > +metric_matches_device(const struct pmt_metric_def *def, const struct pmt_device *dev)
> > +{
> > +	/*
> > +	 * Compare the underlying numeric GUID rather than the pmt_guid pointer:
> > +	 * builtin metric defs reference &builtin_guids[idx] directly, while
> > +	 * devices intern through the registry. These may resolve to different
> > +	 * pmt_guid entries for the same GUID depending on init order.
> > +	 */
> > +	return def->guid->guid == dev->guid->guid;
> > +}
> > +
> > +static int pmt_bind_build(struct pmtctl_context *ctx)
> > +{
> > +	struct pmt_binding *bindings;
> > +	size_t count = 0;
> > +	int i, j, k;
> > +
> > +	/*
> > +	 * -----------------------------
> > +	 * Pass 1: count bindings
> > +	 * -----------------------------
> > +	 */
> > +	for (i = 0; i < ctx->metrics.total; i++) {
> > +		const struct pmt_metric_def *def = pmt_metrics_at(&ctx->metrics, i);
> > +
> > +		if (!def)
> > +			continue;
> > +
> > +		for (j = 0; j < ctx->num_devices; j++) {
> > +			const struct pmt_device *dev = &ctx->devices[j];
> > +
> > +			if (!metric_matches_device(def, dev))
> > +				continue;
> > +
> > +			count++;
> > +		}
> > +	}
> > +
> > +	if (count == 0) {
> > +		log_warn("no metric/device bindings found");
> > +		return 0;
> > +	}
> > +
> > +	bindings = calloc(count, sizeof(*bindings));
> > +	if (!bindings)
> > +		return log_ret(-ENOMEM, "count not allocate bindings");
> > +
> > +	/*
> > +	 * -----------------------------
> > +	 * Pass 2: fill bindings
> > +	 * -----------------------------
> > +	 */
> > +	k = 0;
> > +	for (i = 0; i < ctx->metrics.total; i++) {
> > +		const struct pmt_metric_def *def = pmt_metrics_at(&ctx->metrics, i);
> > +
> > +		if (!def)
> > +			continue;
> > +
> > +		for (j = 0; j < ctx->num_devices; j++) {
> > +			const struct pmt_device *dev = &ctx->devices[j];
> > +
> > +			if (!metric_matches_device(def, dev))
> > +				continue;
> > +
> > +			bindings[k].metric_idx = i;
> > +			bindings[k].device_idx = j;
> > +			k++;
> > +		}
> > +	}
> > +
> > +	ctx->bindings     = bindings;
> > +	ctx->num_bindings = k;
> > +
> > +	return 0;
> > +}
> > +
> > +int pmtctl_init(const struct pmt_global_opts *gopts)
> > +{
> > +	const struct pmt_device_ops *ops = NULL;
> > +	int num_devices;
> > +	int ret;
> > +
> > +	if (!gopts)
> > +		return log_ret(PMTCTL_ERR_INVALID, "bad argument");
> > +
> > +	memset(&g_pmtctl_ctx, 0, sizeof(g_pmtctl_ctx));
> > +
> > +	/*
> > +	 * 1) Initialize device backend.
> > +	 *    Only the telem backend is currently supported; PMU support is
> > +	 *    pending upstream driver availability.
> > +	 */
> > +	ret = device_telem_ops.init();
> > +	if (ret != 0)
> > +		return log_ret(ret, "failed to find PMT source");
> > +	ops = &device_telem_ops;
> > +	log_debug("Selecting from /sys/class/intel_pmt");
> > +	g_pmtctl_ctx.ops = ops;
> > +
> > +	/*
> > +	 * 2) Enumerate devices from the chosen device
> > +	 */
> > +	g_pmtctl_ctx.devices = ops->device_list(&num_devices);
> > +	if (!g_pmtctl_ctx.devices) {
> > +		pmtctl_cleanup();
> > +		log_bug_and_exit("unexpected NULL device context");
> > +	}
> > +
> > +	if (num_devices <= 0) {
> > +		pmtctl_cleanup();
> > +		log_bug_and_exit("unexpected zero device count");
> > +	}
> > +	g_pmtctl_ctx.num_devices = num_devices;
> > +
> > +	/*
> > +	 * 3) Load metric definitions from JSON or built-in
> > +	 *
> > +	 * If metric load fails or returns zero metrics, we intentionally keep init as a
> > +	 * degraded success (return 0) with a warning. This allows raw mode operation,
> > +	 * which does not require metric definitions.
> > +	 */
> > +	ret = pmt_metrics_load(gopts->json_path, &g_pmtctl_ctx.metrics);
> > +	/*
> > +	 * Any nonzero rc here means the metric source itself was broken
> > +	 * (e.g. -J pointed at a nonexistent path, or a JSON file failed to
> > +	 * parse).  Treat that as a hard init failure so the CLI exits with
> > +	 * PMTCTL_EXIT_SYSTEM instead of silently degrading to a metric-less
> > +	 * session.  Empty source (ret == 0 but metrics.total == 0) stays a
> > +	 * degraded success -- raw mode and `list --devices` are still usable.
> > +	 *
> > +	 * Some provider paths return positive PMTCTL_ERR_* codes; normalize
> > +	 * those to -EIO so main()'s mapping selects EXIT_SYSTEM.
> > +	 */
> > +	if (ret != 0) {
> > +		pmtctl_cleanup();
> > +		if (ret > 0)
> > +			ret = -EIO;
> > +		return log_ret(ret, "failed to load metrics from %s",
> > +			       gopts->json_path ? gopts->json_path : "<built-in>");
> > +	}
> > +	if (g_pmtctl_ctx.metrics.total == 0) {
> > +		log_warn("no metrics from %s", gopts->json_path ? gopts->json_path : "<built-in>");
> > +		return 0;
> > +	}
> > +
> > +	/*
> > +	 * 4) Build metric ↔ device bindings
> > +	 */
> > +	ret = pmt_bind_build(&g_pmtctl_ctx);
> > +	if (ret != 0) {
> > +		pmtctl_cleanup();
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +void pmtctl_cleanup(void)
> > +{
> > +	if (g_pmtctl_ctx.bindings) {
> > +		free(g_pmtctl_ctx.bindings);
> > +		g_pmtctl_ctx.bindings = NULL;
> > +		g_pmtctl_ctx.num_bindings = 0;
> > +	}
> > +
> > +	if (g_pmtctl_ctx.ops && g_pmtctl_ctx.ops->cleanup)
> > +		g_pmtctl_ctx.ops->cleanup();
> > +
> > +	pmt_metrics_free(&g_pmtctl_ctx.metrics);
> > +	pmt_guid_cleanup();
> > +
> > +	g_pmtctl_ctx.ops         = NULL;
> > +	g_pmtctl_ctx.devices     = NULL;
> > +	g_pmtctl_ctx.num_devices = 0;
> > +}
> > 

