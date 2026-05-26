Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71373DA7EC;
	Tue, 26 May 2026 11:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779794714; cv=none; b=IhbODb2MXoCTCfC/6yCBHkbP4E/XXjeP5oFEVrA1MqOf3Tq7lLWJHmcn+OxYlkQq2R8sHUGjEm3hEv0nRtYEC3eXv0saYI8n4y61/4Mh5lRCPk8dG5OSqPngiped5I/BNfar/OkV4byQnycAqV0D0jl9wz+iOCcKSHlUq1BCP7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779794714; c=relaxed/simple;
	bh=k1ViItkES+DJlK4u9/+lO8QT2IL0D+wR2E2FHb18284=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=G6Gox3K/Deik0opNQfzwjtLEzWHiRcUfo/3ezdcPPJSIxEggQ4gsnhrDjuBX0gySouWydB4vGJQ9FPLhnxcBn7HH8NEyeF6ogOhJKxTtdwPUAKX/VTSkq/lZxloA9XfPj29i1zRvx8u/x44iN/aq1hkixje9ziQYsj4bQ1/6BC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R3HpR/sr; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R3HpR/sr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779794712; x=1811330712;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=k1ViItkES+DJlK4u9/+lO8QT2IL0D+wR2E2FHb18284=;
  b=R3HpR/srctL+6lfZINipzZyAFMknVkevkigtB3CTnNtTiPIwvnC/jL+7
   NAEyFDo3punkY7ElAJIeewn5rqzEOKucZk5OfmYR54g9QSVsaFES0BUlr
   HUANjw2usqfx4PWWdZfLYOPBYW0yIAwGZ8ZGClkPzzTPJF8cNl4Tld8aw
   hnkqDIvrfnICMOSqoTv1u+Gy6ITUv+LlGNI0m4AutaOxrP9szzjz2AppA
   qxFE4tDDMX0McwuOIkk2o0lv4GHNSFGWxfWdttbLweEEv61WbWWzqG4YK
   8doTlch70tCPvrOuZMR5bjXWxwLpta4aXLWuexB+28Y86CNsioTunsoUe
   A==;
X-CSE-ConnectionGUID: BGsZXBvLQIGLTiKSBtg+JA==
X-CSE-MsgGUID: NF1M+kMPSoe3AjCIezJG4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80588676"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="80588676"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 04:25:11 -0700
X-CSE-ConnectionGUID: Hifh7yZgQJOiOcajTuNr/A==
X-CSE-MsgGUID: SXQTArJ0RjSmCjFT15s9zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="245929282"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.137])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 04:25:10 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 26 May 2026 14:25:06 +0300 (EEST)
To: "David E. Box" <david.e.box@linux.intel.com>
cc: LKML <linux-kernel@vger.kernel.org>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 08/17] tools/arch/x86/pmtctl: Add libpmtctl public API
 and context
In-Reply-To: <20260526014719.2248380-9-david.e.box@linux.intel.com>
Message-ID: <da65991e-fc47-49ea-ae5e-6b5b696bb613@linux.intel.com>
References: <20260526014719.2248380-1-david.e.box@linux.intel.com> <20260526014719.2248380-9-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1471150120-1779794706=:1874"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1471150120-1779794706=:1874
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 25 May 2026, David E. Box wrote:

> Add the public API for libpmtctl_core and the context object that backs i=
t,
> providing callers with a stable, opaque interface for discovering Intel P=
MT
> telemetry devices and querying their metrics without depending on interna=
l
> library structures.
>=20
> This patch adds the primary lifecycle and query interfaces used by librar=
y
> consumers. pmtctl_init() performs device enumeration and metric database
> loading once during initialization so subsequent queries operate on cache=
d
> state rather than re-scanning sysfs. pmtctl_cleanup() releases associated
> resources.
>=20
> The library context (struct pmtctl_context) remains opaque to callers.
> pmtctl_get_ctx() provides controlled access for consumers that need to pa=
ss
> library context across translation units.
>=20
> Add PMTCTL_SCOPE_GUARD() as a convenience macro for deterministic cleanup
> of library-managed resources in single-exit C code paths.
>=20
> Build-system wiring is added a later patch of the series.
>=20
> Assisted-by: GitHub-Copilot:claude-sonnet-4.6
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
>  tools/arch/x86/pmtctl/include/lib/pmtctl.h    |  90 +++++
>  .../x86/pmtctl/include/lib/pmtctl_context.h   |  21 ++
>  tools/arch/x86/pmtctl/lib/pmtctl.c            | 327 ++++++++++++++++++
>  3 files changed, 438 insertions(+)
>  create mode 100644 tools/arch/x86/pmtctl/include/lib/pmtctl.h
>  create mode 100644 tools/arch/x86/pmtctl/include/lib/pmtctl_context.h
>  create mode 100644 tools/arch/x86/pmtctl/lib/pmtctl.c
>=20
> diff --git a/tools/arch/x86/pmtctl/include/lib/pmtctl.h b/tools/arch/x86/=
pmtctl/include/lib/pmtctl.h
> new file mode 100644
> index 000000000000..b243a48e8d72
> --- /dev/null
> +++ b/tools/arch/x86/pmtctl/include/lib/pmtctl.h
> @@ -0,0 +1,90 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef PMTCTL_H
> +#define PMTCTL_H
> +
> +#include <stdbool.h>
> +#include <stdint.h>
> +
> +#include <linux/compiler.h>
> +#include "pmtctl_types.h"
> +
> +enum pmt_selector_kind {
> +=09PMT_SEL_ANY =3D 0,   /* no selector provided */
> +=09PMT_SEL_GUID,      /* guid=3D27971628 */
> +=09PMT_SEL_EP_NAME,   /* ep=3Dpmt_ep_27971628_0 OR ep=3Dtelem1 */
> +};
> +
> +struct pmt_ep_selector {
> +=09enum pmt_selector_kind kind;
> +
> +=09uint32_t guid;
> +
> +=09/* For SEL_EP_NAME */
> +=09const char *str;
> +};
> +
> +struct pmt_binding {
> +=09int metric_idx;   /* index into defs[] */
> +=09int device_idx;   /* index into devices[] */
> +};
> +
> +struct pmtctl_context;
> +
> +struct pmt_global_opts {
> +=09const char            *json_path;        /* -J / --json-file */
> +=09const char            *device_selector;  /* -d / --device (raw) */
> +=09bool                   quiet;            /* -q / --quiet */
> +=09bool                   debug;            /* --debug */
> +};
> +
> +/*
> + * Initialize library-global PMT state.
> + *
> + * This may return success even if no metric definitions are available.
> + * In that case, device enumeration is still usable and raw mode remains
> + * supported (raw reads do not require metric definitions).
> + */
> +int pmtctl_init(const struct pmt_global_opts *gopts);
> +const struct pmtctl_context *pmtctl_get_ctx(void);
> +enum pmt_device_type pmtctl_get_device_type(void);
> +int pmtctl_get_num_devices(void);
> +int pmtctl_get_num_metrics(void);
> +int pmtctl_get_num_bindings(void);
> +
> +/*
> + * Set process-global library logging verbosity.
> + *
> + * Invalid values are clamped to PMTCTL_LOG_INFO.
> + */
> +void pmtctl_set_log_level(enum pmtctl_log_level level);
> +
> +/*
> + * Thread-safety note:
> + *
> + * libpmtctl_core is generally not thread-safe. Callers should serialize
> + * pmtctl_init()/pmtctl_cleanup() and API usage around shared library st=
ate.
> + */
> +void pmtctl_cleanup(void);
> +
> +static inline __always_unused void pmtctl_scope_cleanup(int *unused)
> +{
> +=09(void)unused;
> +=09pmtctl_cleanup();
> +}
> +
> +#define PMTCTL_SCOPE_GUARD                              \
> +=09__attribute__((cleanup(pmtctl_scope_cleanup)))  \
> +=09int _pmtctl_scope_guard __always_unused \
> +
> +int pmt_select_devices(const struct pmtctl_context *ctx, const struct pm=
t_ep_selector *sel,
> +=09=09       int *out_idx, int max_out);
> +
> +/*
> + * Parse an ep selector string like "guid=3D27971628" or "ep=3Dpmt_ep_..=
=2E".
> + * For selectors that set a string (ep/name) the implementation will
> + * allocate a copy into sel->str; the caller is responsible for freeing
> + * sel->str if non-NULL.
> + */
> +int pmtctl_parse_ep_selector(const char *s, struct pmt_ep_selector *out)=
;
> +
> +#endif
> diff --git a/tools/arch/x86/pmtctl/include/lib/pmtctl_context.h b/tools/a=
rch/x86/pmtctl/include/lib/pmtctl_context.h
> new file mode 100644
> index 000000000000..6f3e8563f7eb
> --- /dev/null
> +++ b/tools/arch/x86/pmtctl/include/lib/pmtctl_context.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef PMTCTL_CONTEXT_H
> +#define PMTCTL_CONTEXT_H
> +
> +#include "lib/device.h"
> +#include "lib/metrics_db.h"
> +#include "lib/pmtctl.h"
> +
> +struct pmtctl_context {
> +=09const struct pmt_device_ops *ops;
> +
> +=09struct pmt_device *devices;
> +=09int num_devices;
> +
> +=09struct pmt_metrics_db metrics;
> +
> +=09struct pmt_binding *bindings;
> +=09int num_bindings;
> +};
> +
> +#endif
> diff --git a/tools/arch/x86/pmtctl/lib/pmtctl.c b/tools/arch/x86/pmtctl/l=
ib/pmtctl.c
> new file mode 100644
> index 000000000000..5ee2f576316a
> --- /dev/null
> +++ b/tools/arch/x86/pmtctl/lib/pmtctl.c
> @@ -0,0 +1,327 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include <errno.h>
> +#include <string.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +
> +#include "lib/common.h"
> +#include "lib/device.h"
> +#include "lib/log.h"
> +#include "lib/metrics_db.h"
> +#include "lib/metrics_provider.h"
> +#include "lib/pmtctl.h"
> +#include "lib/pmtctl_context.h"
> +
> +static struct pmtctl_context g_pmtctl_ctx;
> +
> +const struct pmtctl_context *pmtctl_get_ctx(void)
> +{
> +=09return &g_pmtctl_ctx;
> +}
> +
> +enum pmt_device_type pmtctl_get_device_type(void)
> +{
> +=09const struct pmt_device_ops *ops =3D g_pmtctl_ctx.ops;
> +
> +=09return ops ? ops->dev_type : PMT_DEVICE_TELEM;
> +}
> +
> +int pmtctl_get_num_devices(void)
> +{
> +=09return g_pmtctl_ctx.num_devices;
> +}
> +
> +int pmtctl_get_num_metrics(void)
> +{
> +=09return g_pmtctl_ctx.metrics.total;
> +}
> +
> +int pmtctl_get_num_bindings(void)
> +{
> +=09return g_pmtctl_ctx.num_bindings;
> +}
> +
> +void pmtctl_set_log_level(enum pmtctl_log_level level)
> +{
> +=09log_set_level(level);
> +}
> +
> +int pmt_select_devices(const struct pmtctl_context *ctx,
> +=09=09       const struct pmt_ep_selector *sel,
> +=09=09       int *out_idx, int max_out)
> +{
> +=09int i, n =3D 0;
> +
> +=09if (!ctx || !sel || !out_idx || max_out <=3D 0)
> +=09=09return log_ret(PMTCTL_ERR_INVALID, "bad argument");
> +
> +=09if (!ctx->devices || ctx->num_devices <=3D 0)
> +=09=09return log_ret(PMTCTL_ERR_INVALID, "no devices");
> +
> +=09switch (sel->kind) {
> +=09case PMT_SEL_ANY:
> +=09=09/* No filter: return all devices */
> +=09=09for (i =3D 0; i < ctx->num_devices && n < max_out; i++)
> +=09=09=09out_idx[n++] =3D i;
> +=09=09break;
> +
> +=09case PMT_SEL_GUID:
> +=09=09for (i =3D 0; i < ctx->num_devices && n < max_out; i++) {
> +=09=09=09const struct pmt_device *dev =3D &ctx->devices[i];
> +
> +=09=09=09if (dev->guid && dev->guid->guid =3D=3D sel->guid)
> +=09=09=09=09out_idx[n++] =3D i;
> +=09=09}
> +=09=09break;
> +
> +=09case PMT_SEL_EP_NAME:
> +=09=09if (!sel->str || !sel->str[0])
> +=09=09=09return log_ret(PMTCTL_ERR_CMD_PARSE, "empty ep selector");
> +
> +=09=09for (i =3D 0; i < ctx->num_devices && n < max_out; i++) {
> +=09=09=09const struct pmt_device *dev =3D &ctx->devices[i];
> +
> +=09=09=09if (dev->name && strcmp(dev->name, sel->str) =3D=3D 0)

!strcmp()

> +=09=09=09=09out_idx[n++] =3D i;
> +=09=09}


Move the code to helper with parameter(s) to filter variations.

> +=09=09break;
> +
> +=09default:
> +=09=09return log_ret(PMTCTL_ERR_CMD_PARSE, "unknown selector kind %d", s=
el->kind);
> +=09}
> +
> +=09/* n =3D=3D 0 is "no matches", not an API error. Caller decides what =
to do. */
> +=09return n;
> +}
> +
> +int pmtctl_parse_ep_selector(const char *s, struct pmt_ep_selector *out)
> +{
> +=09auto_free char *copy =3D NULL;
> +=09char *end;
> +=09char *eq;
> +=09char *key =3D NULL;
> +=09const char *val =3D NULL;
> +
> +=09if (!out)
> +=09=09return -EINVAL;
> +
> +=09if (!s || !*s) {
> +=09=09out->kind =3D PMT_SEL_ANY;
> +=09=09out->str =3D NULL;
> +=09=09out->guid =3D 0;
> +=09=09return 0;
> +=09}
> +
> +=09/* Expect a single key=3Dvalue selector: guid=3D..., ep=3D..., name=
=3D... */
> +=09copy =3D strdup(s);
> +
> +=09if (!copy)
> +=09=09return -ENOMEM;

Hmm, so for some reason this can survive without invoking exit() right=20
away. I wonder if exit() is really necessary with the other xstrdup()=20
callers either...

> +
> +=09eq =3D strchr(copy, '=3D');
> +=09if (!eq)
> +=09=09return -EINVAL;
> +
> +=09*eq =3D '\0';
> +=09key =3D copy;
> +=09val =3D eq + 1;
> +
> +=09if (!strcmp(key, "guid")) {
> +=09=09errno =3D 0;
> +=09=09unsigned long v =3D strtoul(val, &end, 16);
> +

Please fix this.

I think I've read enough of AI thrown curveballs. Please review _all_ the=
=20
patches yourself before sending them again and don't let AI slipping from=
=20
usual style or using unusual construct through but fix them all before=20
submitting.

Given the size of this patch series, the next round, I'll just be passing=
=20
the ball back to ypu on the spot where I see the usual style is blatantly
violated or some odd constructs are found.

I think I was quite generous to look this far.

> +=09=09if (errno || end =3D=3D val || *end !=3D '\0' || v > UINT32_MAX)
> +=09=09=09return errno ? -errno : -EINVAL;

Please split if you have to do elvis like this.

--
 i.

> +=09=09out->kind =3D PMT_SEL_GUID;
> +=09=09out->guid =3D (uint32_t)v;
> +=09=09out->str =3D NULL;
> +=09} else if (!strcmp(key, "ep") || !strcmp(key, "name")) {
> +=09=09out->kind =3D PMT_SEL_EP_NAME;
> +=09=09out->str =3D strdup(val);
> +=09=09if (!out->str)
> +=09=09=09return -ENOMEM;
> +=09=09out->guid =3D 0;
> +=09} else {
> +=09=09log_err(PMTCTL_ERR_CMD_PARSE, "unknown device selector %s", key);
> +=09=09return -EINVAL;
> +=09}
> +=09return 0;
> +}
> +
> +static bool
> +metric_matches_device(const struct pmt_metric_def *def, const struct pmt=
_device *dev)
> +{
> +=09/*
> +=09 * Compare the underlying numeric GUID rather than the pmt_guid point=
er:
> +=09 * builtin metric defs reference &builtin_guids[idx] directly, while
> +=09 * devices intern through the registry. These may resolve to differen=
t
> +=09 * pmt_guid entries for the same GUID depending on init order.
> +=09 */
> +=09return def->guid->guid =3D=3D dev->guid->guid;
> +}
> +
> +static int pmt_bind_build(struct pmtctl_context *ctx)
> +{
> +=09struct pmt_binding *bindings;
> +=09size_t count =3D 0;
> +=09int i, j, k;
> +
> +=09/*
> +=09 * -----------------------------
> +=09 * Pass 1: count bindings
> +=09 * -----------------------------
> +=09 */
> +=09for (i =3D 0; i < ctx->metrics.total; i++) {
> +=09=09const struct pmt_metric_def *def =3D pmt_metrics_at(&ctx->metrics,=
 i);
> +
> +=09=09if (!def)
> +=09=09=09continue;
> +
> +=09=09for (j =3D 0; j < ctx->num_devices; j++) {
> +=09=09=09const struct pmt_device *dev =3D &ctx->devices[j];
> +
> +=09=09=09if (!metric_matches_device(def, dev))
> +=09=09=09=09continue;
> +
> +=09=09=09count++;
> +=09=09}
> +=09}
> +
> +=09if (count =3D=3D 0) {
> +=09=09log_warn("no metric/device bindings found");
> +=09=09return 0;
> +=09}
> +
> +=09bindings =3D calloc(count, sizeof(*bindings));
> +=09if (!bindings)
> +=09=09return log_ret(-ENOMEM, "count not allocate bindings");
> +
> +=09/*
> +=09 * -----------------------------
> +=09 * Pass 2: fill bindings
> +=09 * -----------------------------
> +=09 */
> +=09k =3D 0;
> +=09for (i =3D 0; i < ctx->metrics.total; i++) {
> +=09=09const struct pmt_metric_def *def =3D pmt_metrics_at(&ctx->metrics,=
 i);
> +
> +=09=09if (!def)
> +=09=09=09continue;
> +
> +=09=09for (j =3D 0; j < ctx->num_devices; j++) {
> +=09=09=09const struct pmt_device *dev =3D &ctx->devices[j];
> +
> +=09=09=09if (!metric_matches_device(def, dev))
> +=09=09=09=09continue;
> +
> +=09=09=09bindings[k].metric_idx =3D i;
> +=09=09=09bindings[k].device_idx =3D j;
> +=09=09=09k++;
> +=09=09}
> +=09}
> +
> +=09ctx->bindings     =3D bindings;
> +=09ctx->num_bindings =3D k;
> +
> +=09return 0;
> +}
> +
> +int pmtctl_init(const struct pmt_global_opts *gopts)
> +{
> +=09const struct pmt_device_ops *ops =3D NULL;
> +=09int num_devices;
> +=09int ret;
> +
> +=09if (!gopts)
> +=09=09return log_ret(PMTCTL_ERR_INVALID, "bad argument");
> +
> +=09memset(&g_pmtctl_ctx, 0, sizeof(g_pmtctl_ctx));
> +
> +=09/*
> +=09 * 1) Initialize device backend.
> +=09 *    Only the telem backend is currently supported; PMU support is
> +=09 *    pending upstream driver availability.
> +=09 */
> +=09ret =3D device_telem_ops.init();
> +=09if (ret !=3D 0)
> +=09=09return log_ret(ret, "failed to find PMT source");
> +=09ops =3D &device_telem_ops;
> +=09log_debug("Selecting from /sys/class/intel_pmt");
> +=09g_pmtctl_ctx.ops =3D ops;
> +
> +=09/*
> +=09 * 2) Enumerate devices from the chosen device
> +=09 */
> +=09g_pmtctl_ctx.devices =3D ops->device_list(&num_devices);
> +=09if (!g_pmtctl_ctx.devices) {
> +=09=09pmtctl_cleanup();
> +=09=09log_bug_and_exit("unexpected NULL device context");
> +=09}
> +
> +=09if (num_devices <=3D 0) {
> +=09=09pmtctl_cleanup();
> +=09=09log_bug_and_exit("unexpected zero device count");
> +=09}
> +=09g_pmtctl_ctx.num_devices =3D num_devices;
> +
> +=09/*
> +=09 * 3) Load metric definitions from JSON or built-in
> +=09 *
> +=09 * If metric load fails or returns zero metrics, we intentionally kee=
p init as a
> +=09 * degraded success (return 0) with a warning. This allows raw mode o=
peration,
> +=09 * which does not require metric definitions.
> +=09 */
> +=09ret =3D pmt_metrics_load(gopts->json_path, &g_pmtctl_ctx.metrics);
> +=09/*
> +=09 * Any nonzero rc here means the metric source itself was broken
> +=09 * (e.g. -J pointed at a nonexistent path, or a JSON file failed to
> +=09 * parse).  Treat that as a hard init failure so the CLI exits with
> +=09 * PMTCTL_EXIT_SYSTEM instead of silently degrading to a metric-less
> +=09 * session.  Empty source (ret =3D=3D 0 but metrics.total =3D=3D 0) s=
tays a
> +=09 * degraded success -- raw mode and `list --devices` are still usable=
=2E
> +=09 *
> +=09 * Some provider paths return positive PMTCTL_ERR_* codes; normalize
> +=09 * those to -EIO so main()'s mapping selects EXIT_SYSTEM.
> +=09 */
> +=09if (ret !=3D 0) {
> +=09=09pmtctl_cleanup();
> +=09=09if (ret > 0)
> +=09=09=09ret =3D -EIO;
> +=09=09return log_ret(ret, "failed to load metrics from %s",
> +=09=09=09       gopts->json_path ? gopts->json_path : "<built-in>");
> +=09}
> +=09if (g_pmtctl_ctx.metrics.total =3D=3D 0) {
> +=09=09log_warn("no metrics from %s", gopts->json_path ? gopts->json_path=
 : "<built-in>");
> +=09=09return 0;
> +=09}
> +
> +=09/*
> +=09 * 4) Build metric =E2=86=94 device bindings
> +=09 */
> +=09ret =3D pmt_bind_build(&g_pmtctl_ctx);
> +=09if (ret !=3D 0) {
> +=09=09pmtctl_cleanup();
> +=09=09return ret;
> +=09}
> +
> +=09return 0;
> +}
> +
> +void pmtctl_cleanup(void)
> +{
> +=09if (g_pmtctl_ctx.bindings) {
> +=09=09free(g_pmtctl_ctx.bindings);
> +=09=09g_pmtctl_ctx.bindings =3D NULL;
> +=09=09g_pmtctl_ctx.num_bindings =3D 0;
> +=09}
> +
> +=09if (g_pmtctl_ctx.ops && g_pmtctl_ctx.ops->cleanup)
> +=09=09g_pmtctl_ctx.ops->cleanup();
> +
> +=09pmt_metrics_free(&g_pmtctl_ctx.metrics);
> +=09pmt_guid_cleanup();
> +
> +=09g_pmtctl_ctx.ops         =3D NULL;
> +=09g_pmtctl_ctx.devices     =3D NULL;
> +=09g_pmtctl_ctx.num_devices =3D 0;
> +}
>=20
--8323328-1471150120-1779794706=:1874--
