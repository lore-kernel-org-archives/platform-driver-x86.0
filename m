Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C32E3D903A;
	Tue, 26 May 2026 09:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779789564; cv=none; b=pO9nxkRbrCnHFdVyX5w5j+FL35L/iCZ9yGV48NkW0I3Ztq2pw9NmZJ8KKO46arVTCU1i17nHHMY+WwKAJdXxfvu2S6+veVZFUmELQXgTMFEkd7stNGDg/DhDfGGONok0Mx1zpHQ/pcMWLIRNHwtCAG1RIWSNkpF1YGe9GKDfees=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779789564; c=relaxed/simple;
	bh=tRGPKz717Yo+l1KLjt1TRayduJAvzCZ09gOvaLO//NA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=TOCvZ41knd+ZMOMGeTHj+0OnGcxbcBIosTI2CxBP0a1D3Fodz0EF+BgJMviI2FiLEybccsmomEbdjSqdmtv/QBenbACM96GTSuO+Du0/uYusz+VrUEZyMbxPuqjMbYuyisi7GWwHmlq4kgE+Ec1X3MgDfOvN0TjQ9VzLZOjaWIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LQ/yyQaV; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LQ/yyQaV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779789563; x=1811325563;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=tRGPKz717Yo+l1KLjt1TRayduJAvzCZ09gOvaLO//NA=;
  b=LQ/yyQaVholyZsDS6FkhmbvlLanYsON1qGM64byV253Vp69wnRfEpmYk
   Fy+7GNrEqr+zv7Ru/DJY0YTEH/GTyEj71vpoEjte31mGGi2G8euLDsAcw
   FClWmGTs0G70YdCT/PVwbXts2QdQjRe7xaCe0t71TluZUG/dPRY8ZsPXp
   47k/sP/lQ6oNgPSEuqBsyTzkNGIgy2TyMyHKtqbXRchxYDum5IRv2S5Y3
   AzzWjIgzV7nzxp57vQJjkNK8GUbyniD6G2iBYuaazhpRaTZ+t4+gnXefy
   3k8uuxuNsm5yIh7/QyJ5g7r1SHaK4Ex6OPh1d6/vEmzLpy2K3sDFnIsS3
   A==;
X-CSE-ConnectionGUID: jbiBP4+OTD2SSJClynoIJg==
X-CSE-MsgGUID: EmEq735MSSWaIRmM5VSwFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80583044"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="80583044"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 02:59:22 -0700
X-CSE-ConnectionGUID: rL3jzWEAQq24/FrmkT+XSw==
X-CSE-MsgGUID: eXockHoTTVKOCX7/C3tMhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="241725712"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.137])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 02:59:20 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 26 May 2026 12:59:16 +0300 (EEST)
To: "David E. Box" <david.e.box@linux.intel.com>
cc: LKML <linux-kernel@vger.kernel.org>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 03/17] tools/arch/x86/pmtctl: Add libpmtctl internal
 logging and utility functions
In-Reply-To: <20260526014719.2248380-4-david.e.box@linux.intel.com>
Message-ID: <cb84eb3c-4fd9-4584-d9b3-b88d04bc345d@linux.intel.com>
References: <20260526014719.2248380-1-david.e.box@linux.intel.com> <20260526014719.2248380-4-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 25 May 2026, David E. Box wrote:

> Add the internal logging infrastructure and shared utility helpers used by
> libpmtctl_core.
> 
> The logging layer provides consistent level-filtered diagnostics across the
> library, while the utility helpers centralize common sysfs access, string
> handling, and scoped resource cleanup functionality used across backend
> implementations.
> 
> Logging levels mirror the public pmtctl_log_level enum and can be used to
> control library verbosity.
> 
> Assisted-by: GitHub-Copilot:claude-sonnet-4.6
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
>  tools/arch/x86/pmtctl/include/lib/common.h   |  34 ++++
>  tools/arch/x86/pmtctl/include/lib/log.h      |  80 ++++++++
>  tools/arch/x86/pmtctl/include/lib/pmt_guid.h |  63 ++++++
>  tools/arch/x86/pmtctl/lib/common.c           | 178 +++++++++++++++++
>  tools/arch/x86/pmtctl/lib/log.c              |  80 ++++++++
>  tools/arch/x86/pmtctl/lib/pmt_guid.c         | 200 +++++++++++++++++++
>  6 files changed, 635 insertions(+)
>  create mode 100644 tools/arch/x86/pmtctl/include/lib/common.h
>  create mode 100644 tools/arch/x86/pmtctl/include/lib/log.h
>  create mode 100644 tools/arch/x86/pmtctl/include/lib/pmt_guid.h
>  create mode 100644 tools/arch/x86/pmtctl/lib/common.c
>  create mode 100644 tools/arch/x86/pmtctl/lib/log.c
>  create mode 100644 tools/arch/x86/pmtctl/lib/pmt_guid.c
> 
> diff --git a/tools/arch/x86/pmtctl/include/lib/common.h b/tools/arch/x86/pmtctl/include/lib/common.h
> new file mode 100644
> index 000000000000..cf1540326ec6
> --- /dev/null
> +++ b/tools/arch/x86/pmtctl/include/lib/common.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef PMTCTL_COMMON_H
> +#define PMTCTL_COMMON_H
> +
> +#include <stdlib.h>
> +#include <stdio.h>
> +#include <stdint.h>
> +
> +#ifndef __GNUC__
> +#error "pmtctl: cleanup helpers require GCC/Clang (__GNUC__)."
> +#endif
> +
> +static inline void freep(void *p)
> +{
> +	void **ptr = (void **)p;
> +
> +	if (*ptr) {
> +		free(*ptr);
> +		*ptr = NULL;
> +	}
> +}
> +
> +#define auto_free __attribute__((cleanup(freep)))
> +
> +#ifndef ARRAY_SIZE
> +#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
> +#endif
> +
> +char *xstrdup(const char *s);
> +int read_attr_text(const char *dir, const char *name, char *buf, size_t buflen);
> +int read_optional_int_attr(const char *devpath, const char *attr, int *out_id);
> +int read_int_attr(const char *devpath, const char *attr, int *out_id);
> +int read_u32_hex_attr(const char *devpath, const char *attr, uint32_t *out, int err_invalid);
> +#endif
> diff --git a/tools/arch/x86/pmtctl/include/lib/log.h b/tools/arch/x86/pmtctl/include/lib/log.h
> new file mode 100644
> index 000000000000..32f4de05f9de
> --- /dev/null
> +++ b/tools/arch/x86/pmtctl/include/lib/log.h
> @@ -0,0 +1,80 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef PMTCTL_LOG_H
> +#define PMTCTL_LOG_H
> +
> +#include <linux/compiler.h>
> +#include "pmtctl_types.h"
> +
> +#define PMTCTL_EXIT_USER    1
> +#define PMTCTL_EXIT_SYSTEM  2
> +#define PMTCTL_EXIT_BUG     3
> +
> +enum {
> +	PMTCTL_ERR_PARSE = 1,   /* malformed JSON, invalid numbers, missing fields */
> +	PMTCTL_ERR_NOTFOUND,   /* metric/device/group not found */
> +	PMTCTL_ERR_BAD_ARG,
> +	PMTCTL_ERR_CMD_PARSE,
> +	PMTCTL_ERR_CMD_LIST,
> +	PMTCTL_ERR_CMD_STAT,
> +	PMTCTL_ERR_NOMETRICS,
> +	PMTCTL_ERR_METRICS,
> +	PMTCTL_ERR_INVALID,   /* bad selector, bad arguments, bad config */
> +	PMTCTL_ERR_DEVICE,   /* device mismatch or device internal failure */
> +	PMTCTL_ERR_BINDING,   /* binding table construction failed */
> +	PMTCTL_ERR_UNSUPPORTED,   /* metric/feature not supported on this system */
> +};
> +
> +#ifdef LOG_PREFIX
> +#define _LOG_PREFIXED(fmt) LOG_PREFIX ": " fmt
> +#else
> +#define _LOG_PREFIXED(fmt) fmt
> +#endif
> +
> +#define LOG_ERROR PMTCTL_LOG_ERROR
> +#define LOG_WARN PMTCTL_LOG_WARN
> +#define LOG_INFO PMTCTL_LOG_INFO
> +#define LOG_DEBUG PMTCTL_LOG_DEBUG
> +
> +void log_impl(enum pmtctl_log_level lvl, int err, const char *fmt, ...)
> +	__printf(3, 4);
> +void log_set_level(enum pmtctl_log_level lvl);
> +
> +#define log_bug_and_exit(fmt, ...) \
> +	log_bug_impl(__FILE__, __LINE__, fmt, ##__VA_ARGS__)
> +
> +#define log_err(err, fmt, ...) \
> +	log_impl(LOG_ERROR, (err), _LOG_PREFIXED(fmt), ##__VA_ARGS__)
> +
> +#define log_warn(fmt, ...) \
> +	log_impl(LOG_WARN, 0, _LOG_PREFIXED(fmt), ##__VA_ARGS__)
> +
> +#define log_info(fmt, ...) \
> +	log_impl(LOG_INFO, 0, _LOG_PREFIXED(fmt), ##__VA_ARGS__)
> +
> +#ifdef DEBUG
> +#define log_debug(fmt, ...) \
> +	log_impl(LOG_DEBUG, 0, _LOG_PREFIXED(fmt), ##__VA_ARGS__)
> +#else
> +#define log_debug(fmt, ...) \
> +	((void)(0 ? log_info(fmt, ##__VA_ARGS__) : 0))
> +#endif
> +
> +int log_ret(int ret, const char *fmt, ...);
> +
> +__noreturn
> +void log_bug_impl(const char *file, int line, const char *fmt, ...);
> +
> +#define LOG_ONCE(level, fmt, ...)                             \
> +	do {                                                  \
> +		static int __done_##__LINE__;                 \
> +		if (!__done_##__LINE__) {                     \
> +			level(fmt, ##__VA_ARGS__);            \
> +			__done_##__LINE__ = 1;                \
> +		}                                             \
> +	} while (0)
> +
> +#define log_err_once(fmt, ...)  LOG_ONCE(log_err,  fmt, ##__VA_ARGS__)
> +#define log_warn_once(fmt, ...) LOG_ONCE(log_warn, fmt, ##__VA_ARGS__)
> +#define log_info_once(fmt, ...) LOG_ONCE(log_info, fmt, ##__VA_ARGS__)
> +
> +#endif
> diff --git a/tools/arch/x86/pmtctl/include/lib/pmt_guid.h b/tools/arch/x86/pmtctl/include/lib/pmt_guid.h
> new file mode 100644
> index 000000000000..d21bda5bc71b
> --- /dev/null
> +++ b/tools/arch/x86/pmtctl/include/lib/pmt_guid.h
> @@ -0,0 +1,63 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef PMTCTL_PMT_GUID_H
> +#define PMTCTL_PMT_GUID_H
> +
> +#include <stdbool.h>
> +#include <stdint.h>
> +
> +/*
> + * Per-GUID metadata derived from the Intel-PMT pmt.xml top-level mapping
> + * table. The compiled-in built-in table (builtin_guids[]) is generated by
> + * scripts/gen_builtin_defs.py. Runtime-loaded providers may register
> + * additional entries via pmt_guid_register().
> + *
> + * A global intern registry ensures pointer-equality across pmt_device and
> + * pmt_metric_def: two references to the same GUID always yield the same
> + * struct pmt_guid pointer.
> + */
> +struct pmt_guid {
> +	uint32_t    guid;
> +	const char *name;        /* basedir lowercased with '/' -> '_'; may be NULL */
> +	const char *description; /* may be NULL */
> +};
> +
> +/*
> + * Register an array of pmt_guid entries with the global registry. The
> + * pointer must remain valid for the registry's lifetime. Entries with a
> + * GUID already present in the registry are skipped (first wins).
> + *
> + * Returns 0 on success, negative errno on failure.
> + */
> +int pmt_guid_register(const struct pmt_guid *entries, int count);
> +
> +/*
> + * Same as pmt_guid_register(), but the registry takes ownership of `block`
> + * (typically the heap allocation that backs `entries` and any pooled
> + * strings the entries point into). The block is freed by pmt_guid_cleanup().
> + *
> + * `block` may equal `entries` when the array sits at the head of the
> + * allocation. Passing a NULL block degrades to pmt_guid_register().
> + *
> + * Returns 0 on success, negative errno on failure. On failure the caller
> + * retains ownership of `block` and must free it.
> + */
> +int pmt_guid_register_owned(void *block, const struct pmt_guid *entries, int count);
> +
> +/*
> + * Lookup the registered pmt_guid for the given numeric GUID. Returns NULL
> + * if no entry has been registered or interned for that GUID.
> + */
> +const struct pmt_guid *pmt_guid_lookup(uint32_t guid);
> +
> +/*
> + * Resolve numeric GUID to a stable struct pmt_guid pointer. If no entry is
> + * registered, a synthetic entry (name = NULL, description = NULL) is
> + * allocated and returned; subsequent calls with the same GUID return the
> + * same pointer. Returns NULL only on allocation failure.
> + */
> +const struct pmt_guid *pmt_guid_intern(uint32_t guid);
> +
> +/* Free all synthetic (interned) entries and clear registrations. */
> +void pmt_guid_cleanup(void);
> +
> +#endif
> diff --git a/tools/arch/x86/pmtctl/lib/common.c b/tools/arch/x86/pmtctl/lib/common.c
> new file mode 100644
> index 000000000000..42931bf79480
> --- /dev/null
> +++ b/tools/arch/x86/pmtctl/lib/common.c
> @@ -0,0 +1,178 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <limits.h>
> +#include <stdlib.h>
> +#include <stdint.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <sys/types.h>
> +#include <unistd.h>
> +
> +#include "lib/common.h"
> +#include "lib/log.h"
> +
> +char *xstrdup(const char *s)
> +{
> +	char *p;
> +
> +	if (!s)
> +		return NULL;
> +
> +	p = strdup(s);
> +	if (!p) {
> +		log_err(errno, "out of memory");
> +		exit(EXIT_FAILURE);
> +	}
> +
> +	return p;
> +}
> +
> +static void trim_newline(char *s)
> +{
> +	size_t len;
> +	char *end;
> +
> +	if (!s)
> +		return;
> +
> +	len = strlen(s);
> +	if (!len)
> +		return;
> +
> +	end = s + len - 1;
> +
> +	while (end >= s && (*end == '\n' || *end == '\r')) {

Is it beneficial to trim just newlines or would it be better to 
trim anything for which isspace() is true?

> +		*end = '\0';
> +		end--;
> +	}
> +}
> +
> +int read_attr_text(const char *dir, const char *name, char *buf, size_t buflen)
> +{
> +	char path[PATH_MAX];
> +	int fd;
> +	ssize_t n;
> +
> +	if (!dir || !name || !buf || buflen == 0)
> +		return -EINVAL;
> +
> +	if (snprintf(path, sizeof(path), "%s/%s", dir, name) >= (int)sizeof(path))
> +		return -ENAMETOOLONG;
> +
> +	fd = open(path, O_RDONLY | O_CLOEXEC);

Why is O_CLOEXEC required? (The is closed just a few lines down.)

> +	if (fd == -1)
> +		return -errno;
> +
> +	n = read(fd, buf, buflen - 1);
> +	close(fd);
> +
> +	if (n == -1)
> +		return -errno;
> +
> +	buf[n] = '\0';
> +	trim_newline(buf);
> +
> +	return 0;
> +}
> +
> +int read_optional_int_attr(const char *devpath, const char *attr, int *out_id)
> +{
> +	char buf[64];
> +	char *end;
> +	long v;
> +	int ret;
> +
> +	if (!out_id || !devpath || !attr)
> +		return -EINVAL;
> +
> +	ret = read_attr_text(devpath, attr, buf, sizeof(buf));
> +	if (ret != 0) {
> +		if (ret == -ENOENT) {
> +			/* file not found */
> +			*out_id = -1;
> +			return 0;
> +		}
> +
> +		return ret;
> +	}
> +
> +	errno = 0;
> +

This belongs tightly together with strtol() so I don't know why there's 
empty in between.

> +	/* accept decimal or 0x-prefixed hex */
> +	v = strtol(buf, &end, 0);
> +	if (errno)
> +		return -errno;
> +
> +	if (end == buf || *end != '\0')
> +		return -EINVAL;
> +
> +	if (v < INT_MIN || v > INT_MAX)
> +		return -ERANGE;
> +
> +	*out_id = (int)v;
> +
> +	return 0;
> +}
> +
> +int read_int_attr(const char *devpath, const char *attr, int *out_id)
> +{
> +	char buf[64];
> +	char *end;
> +	long v;
> +	int ret;
> +
> +	if (!out_id || !devpath || !attr)
> +		return -EINVAL;
> +
> +	ret = read_attr_text(devpath, attr, buf, sizeof(buf));
> +	if (ret != 0)
> +		return ret;
> +
> +	errno = 0;
> +
> +	/* accept decimal or 0x-prefixed hex */
> +	v = strtol(buf, &end, 0);
> +	if (errno)
> +		return -errno;
> +
> +	if (end == buf || *end != '\0')
> +		return -EINVAL;
> +
> +	if (v < INT_MIN || v > INT_MAX)
> +		return -ERANGE;
> +
> +	*out_id = (int)v;
> +
> +	return 0;
> +}

Lots of code duplication.

> +
> +int read_u32_hex_attr(const char *devpath, const char *attr, uint32_t *out, int err_invalid)
> +{
> +	char buf[64];
> +	char *end;
> +	unsigned long v;
> +	int ret;
> +
> +	if (!out || !devpath || !attr)
> +		return -EINVAL;
> +
> +	ret = read_attr_text(devpath, attr, buf, sizeof(buf));
> +	if (ret != 0)
> +		return ret;
> +
> +	errno = 0;
> +	v = strtoul(buf, &end, 16);
> +	if (errno)
> +		return -errno;
> +
> +	if (end == buf || *end != '\0')
> +		return err_invalid;
> +
> +	if (v > UINT32_MAX)
> +		return err_invalid;
> +
> +	*out = (uint32_t)v;
> +
> +	return 0;
> +}
> diff --git a/tools/arch/x86/pmtctl/lib/log.c b/tools/arch/x86/pmtctl/lib/log.c
> new file mode 100644
> index 000000000000..2ce9edacc97a
> --- /dev/null
> +++ b/tools/arch/x86/pmtctl/lib/log.c
> @@ -0,0 +1,80 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include <stdarg.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <errno.h>
> +
> +#include "lib/log.h"
> +
> +static enum pmtctl_log_level g_log_level = LOG_INFO;
> +
> +void log_set_level(enum pmtctl_log_level lvl)
> +{
> +	if (lvl < LOG_ERROR || lvl > LOG_DEBUG)
> +		g_log_level = LOG_INFO;
> +	else
> +		g_log_level = lvl;
> +}
> +
> +static void log_vmsg(enum pmtctl_log_level lvl, int err, const char *fmt,
> +		     va_list ap)
> +{
> +	if (lvl > g_log_level)
> +		return;
> +
> +	const char *tag =
> +		(lvl == LOG_ERROR) ? "error"  :
> +		(lvl == LOG_WARN)  ? "warning" :
> +		(lvl == LOG_INFO)  ? "info"   :

Aligning is off.

> +				     "debug";
> +
> +	fprintf(stderr, "%s: ", tag);
> +	vfprintf(stderr, fmt, ap);
> +
> +	if (err != 0) {
> +		int e = (err < 0) ? -err : err;

???

> +
> +		if (err < 0)

???

> +			fprintf(stderr, ": %s", strerror(e));
> +	}
> +
> +	fputc('\n', stderr);
> +}
> +
> +void log_impl(enum pmtctl_log_level lvl, int err, const char *fmt, ...)
> +{
> +	va_list ap;
> +
> +	va_start(ap, fmt);
> +	log_vmsg(lvl, err, fmt, ap);
> +	va_end(ap);
> +}
> +
> +int log_ret(int ret, const char *fmt, ...)
> +{
> +	if (ret == 0)
> +		return 0;
> +
> +	va_list ap;
> +
> +	va_start(ap, fmt);
> +	log_vmsg(LOG_ERROR, ret, fmt, ap);
> +	va_end(ap);
> +
> +	return ret;
> +}
> +
> +__noreturn
> +void log_bug_impl(const char *file, int line, const char *fmt, ...)
> +{
> +	va_list ap;
> +
> +	fprintf(stderr, "pmtctl: BUG at %s:%d: ", file, line);
> +	va_start(ap, fmt);
> +	vfprintf(stderr, fmt, ap);
> +	va_end(ap);
> +	fputc('\n', stderr);
> +
> +	exit(PMTCTL_EXIT_BUG);
> +}
> diff --git a/tools/arch/x86/pmtctl/lib/pmt_guid.c b/tools/arch/x86/pmtctl/lib/pmt_guid.c
> new file mode 100644
> index 000000000000..f4d74fc7a977
> --- /dev/null
> +++ b/tools/arch/x86/pmtctl/lib/pmt_guid.c
> @@ -0,0 +1,200 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include <errno.h>
> +#include <stdbool.h>
> +#include <stdint.h>
> +#include <stdlib.h>
> +#include <string.h>
> +
> +#include "lib/pmt_guid.h"
> +
> +/*
> + * Global intern registry for struct pmt_guid.
> + *
> + * Two sources feed this table:
> + *   1. Pre-registered blocks (e.g. builtin_guids[] from generated code,
> + *      or JSON-loaded pmt_guids.json from the runtime provider). Pointers
> + *      to those entries are stored verbatim and assumed to outlive the
> + *      registry's use.
> + *   2. Synthetic entries allocated on demand by pmt_guid_intern() for
> + *      GUIDs that no provider knows about. These have name = NULL and
> + *      description = NULL.
> + *
> + * A simple linear-scan array is used; the registry holds at most a few
> + * hundred entries on any realistic system.
> + */

This seems largely irrelevant to what it comments about (struct 
guid_slot is definitely not a "global intern registry" nor a "table").

> +struct guid_slot {
> +	const struct pmt_guid *entry; /* points into registered block or synth_storage */
> +	struct pmt_guid       *synth; /* non-NULL iff this slot owns the entry */
> +};
> +
> +static struct guid_slot *g_slots;
> +static int               g_nslots;
> +static int               g_cap;
> +
> +/*
> + * Heap blocks handed to pmt_guid_register_owned(). The registry frees
> + * them in pmt_guid_cleanup() after disposing of the slot array, so any
> + * pointers the slots held into these blocks are gone by then.
> + */
> +static void **g_owned_blocks;
> +static int    g_nowned;
> +static int    g_owned_cap;
> +
> +static int reserve_one(void)
> +{
> +	struct guid_slot *tmp;
> +	int new_cap;
> +
> +	if (g_nslots < g_cap)
> +		return 0;
> +
> +	new_cap = g_cap ? g_cap * 2 : 32;
> +	tmp = realloc(g_slots, (size_t)new_cap * sizeof(*tmp));

Why is new_cap int if it is needed as size_t ??

And a follow up from that, why are g_cap and g_nslots signed if only 
positive values are acceptable?

> +	if (!tmp)
> +		return -ENOMEM;
> +
> +	g_slots = tmp;
> +	g_cap = new_cap;
> +	return 0;
> +}
> +
> +const struct pmt_guid *pmt_guid_lookup(uint32_t guid)
> +{
> +	for (int i = 0; i < g_nslots; i++) {
> +		if (g_slots[i].entry && g_slots[i].entry->guid == guid)
> +			return g_slots[i].entry;
> +	}
> +	return NULL;
> +}
> +
> +int pmt_guid_register(const struct pmt_guid *entries, int count)
> +{
> +	if (!entries || count <= 0)
> +		return -EINVAL;
> +
> +	for (int i = 0; i < count; i++) {
> +		const struct pmt_guid *e = &entries[i];
> +		bool already_known = false;
> +		int ret;
> +
> +		/*
> +		 * If a slot already exists for this GUID, upgrade it when the
> +		 * existing entry is a synthetic placeholder (created earlier
> +		 * by pmt_guid_intern() before any provider was loaded) and the
> +		 * new entry carries real metadata. The synthetic struct must
> +		 * be kept alive because earlier callers (e.g. devices) hold
> +		 * pointers to it; patch its fields in place instead of
> +		 * swapping the slot entry.
> +		 */
> +		for (int s = 0; s < g_nslots; s++) {
> +			struct guid_slot *slot = &g_slots[s];
> +
> +			if (!slot->entry || slot->entry->guid != e->guid)
> +				continue;
> +
> +			if (slot->synth && e->name && *e->name) {
> +				slot->synth->name = e->name;
> +				slot->synth->description = e->description;
> +			}
> +			already_known = true;
> +			break;
> +		}
> +
> +		if (already_known)
> +			continue;
> +
> +		ret = reserve_one();
> +		if (ret < 0)
> +			return ret;
> +
> +		g_slots[g_nslots].entry = e;
> +		g_slots[g_nslots].synth = NULL;
> +		g_nslots++;

So does reserve_one() and this function, instead of returning the index, 
communicate using g_nslots variable???

> +	}
> +
> +	return 0;
> +}
> +
> +int pmt_guid_register_owned(void *block, const struct pmt_guid *entries, int count)
> +{
> +	void **tmp;
> +	int ret;
> +
> +	/*
> +	 * Grow g_owned_blocks first, before registering anything. If this
> +	 * fails, no entries have been added to g_slots yet, so the caller
> +	 * can safely free(block) on error without leaving dangling slot
> +	 * pointers behind.
> +	 */
> +	if (block && g_nowned == g_owned_cap) {
> +		int new_cap = g_owned_cap ? g_owned_cap * 2 : 8;
> +
> +		tmp = realloc(g_owned_blocks, (size_t)new_cap * sizeof(*tmp));

Same typing problem as above but it also implies this duplicating code.

> +		if (!tmp)
> +			return -ENOMEM;
> +
> +		g_owned_blocks = tmp;
> +		g_owned_cap = new_cap;
> +	}
> +
> +	ret = pmt_guid_register(entries, count);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (block)
> +		g_owned_blocks[g_nowned++] = block;
> +
> +	return 0;
> +}
> +
> +const struct pmt_guid *pmt_guid_intern(uint32_t guid)
> +{
> +	const struct pmt_guid *existing;
> +	struct pmt_guid *synth;
> +	int ret;
> +
> +	existing = pmt_guid_lookup(guid);
> +	if (existing)
> +		return existing;
> +
> +	ret = reserve_one();
> +	if (ret < 0)
> +		return NULL;
> +
> +	synth = calloc(1, sizeof(*synth));
> +	if (!synth)
> +		return NULL;
> +
> +	synth->guid = guid;
> +	synth->name = NULL;
> +	synth->description = NULL;
> +
> +	g_slots[g_nslots].entry = synth;
> +	g_slots[g_nslots].synth = synth;
> +	g_nslots++;
> +
> +	return synth;
> +}
> +
> +void pmt_guid_cleanup(void)
> +{
> +	for (int i = 0; i < g_nslots; i++)
> +		free(g_slots[i].synth);
> +
> +	free(g_slots);
> +	g_slots = NULL;
> +	g_nslots = 0;
> +	g_cap = 0;
> +
> +	/*
> +	 * Owned blocks are freed last: slot entries may have pointed into
> +	 * them, but those pointers are gone now that g_slots is released.
> +	 */
> +	for (int i = 0; i < g_nowned; i++)
> +		free(g_owned_blocks[i]);
> +
> +	free(g_owned_blocks);
> +	g_owned_blocks = NULL;
> +	g_nowned = 0;
> +	g_owned_cap = 0;
> +}
> 

-- 
 i.

