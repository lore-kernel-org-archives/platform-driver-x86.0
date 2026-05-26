Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C512C11E1;
	Tue, 26 May 2026 01:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779760064; cv=none; b=faFwAFxtAi/2ZvdUz+VcvCU7RX2wLt5iDXPp3Ip55Vn871TjtM27lsNR1L067RHpZ+AWZnRfWaZzhRISE5OEV8/Tb4Uy79ynihgcAscgFUu+jOGcnsjYwABFMwVsmYS1RM5++IjIfM1ZrSsGRaRUbc2/6wfTpG9trggiwKoeHw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779760064; c=relaxed/simple;
	bh=4PWGR7/iQA9G+UNTX1NwJUfdmHdoA/WRZPmsSOQZW1Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eIEOGz+zRZD60DhJ/zrSN0mvnEImzbi/RatQmgF52ykoftKQbNU3no9tY6fqG2KUWfnmhCn6RlIorQMzOo6iKLmkliN1kV6n82TOnmDeJseDiDDmwJaN7R3PhXJVxiYEm2i4bjNskWB8+U8J7kqnubiQzJdtRAfvgQHWwBAZKn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=liRhPeeK; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="liRhPeeK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779760062; x=1811296062;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=4PWGR7/iQA9G+UNTX1NwJUfdmHdoA/WRZPmsSOQZW1Q=;
  b=liRhPeeKN7CGX6hk2GIF9TOqf6T0fHeXow4xOtaamyZecFE9fsRuDpG/
   rtw0ykaTk7jGoLMuU7QaMj8MBfWL/fwRNwBzaqlBmGGwkNtf4eV4wDfbX
   ZRpdiV8N3YMUTf+mp2Ysug0ccmw8swjWDQjZuNbFQtHG55O1/h+wKo3Yp
   NQqmGRmTFt6qCHIiCwqf7I4/5WmGCmcqfrSyWwZxB4A4SjtRhPSD6WVIG
   LOHIN9x34i06OQb8naZHfknzut8U2pN1Zbisq0RZD4xQoLFebEQHZ2MSD
   V3QITJRaKvJ9W+w6/5sHqz8MCk3CcCghXe6Ao3uI92mWt/zHl3RXH4L4D
   A==;
X-CSE-ConnectionGUID: qHzyNJg5TV6IDFyApcMy6g==
X-CSE-MsgGUID: 9EBLnzF0Ti6V5f61dqffMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80539888"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="80539888"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 18:47:33 -0700
X-CSE-ConnectionGUID: Kekrx729SLyIzNH53WujIA==
X-CSE-MsgGUID: HcTxhgcwTsqWpUR5AIP/sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="272074970"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 18:47:33 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 03/17] tools/arch/x86/pmtctl: Add libpmtctl internal logging and utility functions
Date: Mon, 25 May 2026 18:47:01 -0700
Message-ID: <20260526014719.2248380-4-david.e.box@linux.intel.com>
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

Add the internal logging infrastructure and shared utility helpers used by
libpmtctl_core.

The logging layer provides consistent level-filtered diagnostics across the
library, while the utility helpers centralize common sysfs access, string
handling, and scoped resource cleanup functionality used across backend
implementations.

Logging levels mirror the public pmtctl_log_level enum and can be used to
control library verbosity.

Assisted-by: GitHub-Copilot:claude-sonnet-4.6
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 tools/arch/x86/pmtctl/include/lib/common.h   |  34 ++++
 tools/arch/x86/pmtctl/include/lib/log.h      |  80 ++++++++
 tools/arch/x86/pmtctl/include/lib/pmt_guid.h |  63 ++++++
 tools/arch/x86/pmtctl/lib/common.c           | 178 +++++++++++++++++
 tools/arch/x86/pmtctl/lib/log.c              |  80 ++++++++
 tools/arch/x86/pmtctl/lib/pmt_guid.c         | 200 +++++++++++++++++++
 6 files changed, 635 insertions(+)
 create mode 100644 tools/arch/x86/pmtctl/include/lib/common.h
 create mode 100644 tools/arch/x86/pmtctl/include/lib/log.h
 create mode 100644 tools/arch/x86/pmtctl/include/lib/pmt_guid.h
 create mode 100644 tools/arch/x86/pmtctl/lib/common.c
 create mode 100644 tools/arch/x86/pmtctl/lib/log.c
 create mode 100644 tools/arch/x86/pmtctl/lib/pmt_guid.c

diff --git a/tools/arch/x86/pmtctl/include/lib/common.h b/tools/arch/x86/pm=
tctl/include/lib/common.h
new file mode 100644
index 000000000000..cf1540326ec6
--- /dev/null
+++ b/tools/arch/x86/pmtctl/include/lib/common.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef PMTCTL_COMMON_H
+#define PMTCTL_COMMON_H
+
+#include <stdlib.h>
+#include <stdio.h>
+#include <stdint.h>
+
+#ifndef __GNUC__
+#error "pmtctl: cleanup helpers require GCC/Clang (__GNUC__)."
+#endif
+
+static inline void freep(void *p)
+{
+	void **ptr =3D (void **)p;
+
+	if (*ptr) {
+		free(*ptr);
+		*ptr =3D NULL;
+	}
+}
+
+#define auto_free __attribute__((cleanup(freep)))
+
+#ifndef ARRAY_SIZE
+#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
+#endif
+
+char *xstrdup(const char *s);
+int read_attr_text(const char *dir, const char *name, char *buf, size_t bu=
flen);
+int read_optional_int_attr(const char *devpath, const char *attr, int *out=
_id);
+int read_int_attr(const char *devpath, const char *attr, int *out_id);
+int read_u32_hex_attr(const char *devpath, const char *attr, uint32_t *out=
, int err_invalid);
+#endif
diff --git a/tools/arch/x86/pmtctl/include/lib/log.h b/tools/arch/x86/pmtct=
l/include/lib/log.h
new file mode 100644
index 000000000000..32f4de05f9de
--- /dev/null
+++ b/tools/arch/x86/pmtctl/include/lib/log.h
@@ -0,0 +1,80 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef PMTCTL_LOG_H
+#define PMTCTL_LOG_H
+
+#include <linux/compiler.h>
+#include "pmtctl_types.h"
+
+#define PMTCTL_EXIT_USER    1
+#define PMTCTL_EXIT_SYSTEM  2
+#define PMTCTL_EXIT_BUG     3
+
+enum {
+	PMTCTL_ERR_PARSE =3D 1,   /* malformed JSON, invalid numbers, missing fie=
lds */
+	PMTCTL_ERR_NOTFOUND,   /* metric/device/group not found */
+	PMTCTL_ERR_BAD_ARG,
+	PMTCTL_ERR_CMD_PARSE,
+	PMTCTL_ERR_CMD_LIST,
+	PMTCTL_ERR_CMD_STAT,
+	PMTCTL_ERR_NOMETRICS,
+	PMTCTL_ERR_METRICS,
+	PMTCTL_ERR_INVALID,   /* bad selector, bad arguments, bad config */
+	PMTCTL_ERR_DEVICE,   /* device mismatch or device internal failure */
+	PMTCTL_ERR_BINDING,   /* binding table construction failed */
+	PMTCTL_ERR_UNSUPPORTED,   /* metric/feature not supported on this system =
*/
+};
+
+#ifdef LOG_PREFIX
+#define _LOG_PREFIXED(fmt) LOG_PREFIX ": " fmt
+#else
+#define _LOG_PREFIXED(fmt) fmt
+#endif
+
+#define LOG_ERROR PMTCTL_LOG_ERROR
+#define LOG_WARN PMTCTL_LOG_WARN
+#define LOG_INFO PMTCTL_LOG_INFO
+#define LOG_DEBUG PMTCTL_LOG_DEBUG
+
+void log_impl(enum pmtctl_log_level lvl, int err, const char *fmt, ...)
+	__printf(3, 4);
+void log_set_level(enum pmtctl_log_level lvl);
+
+#define log_bug_and_exit(fmt, ...) \
+	log_bug_impl(__FILE__, __LINE__, fmt, ##__VA_ARGS__)
+
+#define log_err(err, fmt, ...) \
+	log_impl(LOG_ERROR, (err), _LOG_PREFIXED(fmt), ##__VA_ARGS__)
+
+#define log_warn(fmt, ...) \
+	log_impl(LOG_WARN, 0, _LOG_PREFIXED(fmt), ##__VA_ARGS__)
+
+#define log_info(fmt, ...) \
+	log_impl(LOG_INFO, 0, _LOG_PREFIXED(fmt), ##__VA_ARGS__)
+
+#ifdef DEBUG
+#define log_debug(fmt, ...) \
+	log_impl(LOG_DEBUG, 0, _LOG_PREFIXED(fmt), ##__VA_ARGS__)
+#else
+#define log_debug(fmt, ...) \
+	((void)(0 ? log_info(fmt, ##__VA_ARGS__) : 0))
+#endif
+
+int log_ret(int ret, const char *fmt, ...);
+
+__noreturn
+void log_bug_impl(const char *file, int line, const char *fmt, ...);
+
+#define LOG_ONCE(level, fmt, ...)                             \
+	do {                                                  \
+		static int __done_##__LINE__;                 \
+		if (!__done_##__LINE__) {                     \
+			level(fmt, ##__VA_ARGS__);            \
+			__done_##__LINE__ =3D 1;                \
+		}                                             \
+	} while (0)
+
+#define log_err_once(fmt, ...)  LOG_ONCE(log_err,  fmt, ##__VA_ARGS__)
+#define log_warn_once(fmt, ...) LOG_ONCE(log_warn, fmt, ##__VA_ARGS__)
+#define log_info_once(fmt, ...) LOG_ONCE(log_info, fmt, ##__VA_ARGS__)
+
+#endif
diff --git a/tools/arch/x86/pmtctl/include/lib/pmt_guid.h b/tools/arch/x86/=
pmtctl/include/lib/pmt_guid.h
new file mode 100644
index 000000000000..d21bda5bc71b
--- /dev/null
+++ b/tools/arch/x86/pmtctl/include/lib/pmt_guid.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef PMTCTL_PMT_GUID_H
+#define PMTCTL_PMT_GUID_H
+
+#include <stdbool.h>
+#include <stdint.h>
+
+/*
+ * Per-GUID metadata derived from the Intel-PMT pmt.xml top-level mapping
+ * table. The compiled-in built-in table (builtin_guids[]) is generated by
+ * scripts/gen_builtin_defs.py. Runtime-loaded providers may register
+ * additional entries via pmt_guid_register().
+ *
+ * A global intern registry ensures pointer-equality across pmt_device and
+ * pmt_metric_def: two references to the same GUID always yield the same
+ * struct pmt_guid pointer.
+ */
+struct pmt_guid {
+	uint32_t    guid;
+	const char *name;        /* basedir lowercased with '/' -> '_'; may be NU=
LL */
+	const char *description; /* may be NULL */
+};
+
+/*
+ * Register an array of pmt_guid entries with the global registry. The
+ * pointer must remain valid for the registry's lifetime. Entries with a
+ * GUID already present in the registry are skipped (first wins).
+ *
+ * Returns 0 on success, negative errno on failure.
+ */
+int pmt_guid_register(const struct pmt_guid *entries, int count);
+
+/*
+ * Same as pmt_guid_register(), but the registry takes ownership of `block`
+ * (typically the heap allocation that backs `entries` and any pooled
+ * strings the entries point into). The block is freed by pmt_guid_cleanup=
().
+ *
+ * `block` may equal `entries` when the array sits at the head of the
+ * allocation. Passing a NULL block degrades to pmt_guid_register().
+ *
+ * Returns 0 on success, negative errno on failure. On failure the caller
+ * retains ownership of `block` and must free it.
+ */
+int pmt_guid_register_owned(void *block, const struct pmt_guid *entries, i=
nt count);
+
+/*
+ * Lookup the registered pmt_guid for the given numeric GUID. Returns NULL
+ * if no entry has been registered or interned for that GUID.
+ */
+const struct pmt_guid *pmt_guid_lookup(uint32_t guid);
+
+/*
+ * Resolve numeric GUID to a stable struct pmt_guid pointer. If no entry is
+ * registered, a synthetic entry (name =3D NULL, description =3D NULL) is
+ * allocated and returned; subsequent calls with the same GUID return the
+ * same pointer. Returns NULL only on allocation failure.
+ */
+const struct pmt_guid *pmt_guid_intern(uint32_t guid);
+
+/* Free all synthetic (interned) entries and clear registrations. */
+void pmt_guid_cleanup(void);
+
+#endif
diff --git a/tools/arch/x86/pmtctl/lib/common.c b/tools/arch/x86/pmtctl/lib=
/common.c
new file mode 100644
index 000000000000..42931bf79480
--- /dev/null
+++ b/tools/arch/x86/pmtctl/lib/common.c
@@ -0,0 +1,178 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <errno.h>
+#include <fcntl.h>
+#include <limits.h>
+#include <stdlib.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <string.h>
+#include <sys/types.h>
+#include <unistd.h>
+
+#include "lib/common.h"
+#include "lib/log.h"
+
+char *xstrdup(const char *s)
+{
+	char *p;
+
+	if (!s)
+		return NULL;
+
+	p =3D strdup(s);
+	if (!p) {
+		log_err(errno, "out of memory");
+		exit(EXIT_FAILURE);
+	}
+
+	return p;
+}
+
+static void trim_newline(char *s)
+{
+	size_t len;
+	char *end;
+
+	if (!s)
+		return;
+
+	len =3D strlen(s);
+	if (!len)
+		return;
+
+	end =3D s + len - 1;
+
+	while (end >=3D s && (*end =3D=3D '\n' || *end =3D=3D '\r')) {
+		*end =3D '\0';
+		end--;
+	}
+}
+
+int read_attr_text(const char *dir, const char *name, char *buf, size_t bu=
flen)
+{
+	char path[PATH_MAX];
+	int fd;
+	ssize_t n;
+
+	if (!dir || !name || !buf || buflen =3D=3D 0)
+		return -EINVAL;
+
+	if (snprintf(path, sizeof(path), "%s/%s", dir, name) >=3D (int)sizeof(pat=
h))
+		return -ENAMETOOLONG;
+
+	fd =3D open(path, O_RDONLY | O_CLOEXEC);
+	if (fd =3D=3D -1)
+		return -errno;
+
+	n =3D read(fd, buf, buflen - 1);
+	close(fd);
+
+	if (n =3D=3D -1)
+		return -errno;
+
+	buf[n] =3D '\0';
+	trim_newline(buf);
+
+	return 0;
+}
+
+int read_optional_int_attr(const char *devpath, const char *attr, int *out=
_id)
+{
+	char buf[64];
+	char *end;
+	long v;
+	int ret;
+
+	if (!out_id || !devpath || !attr)
+		return -EINVAL;
+
+	ret =3D read_attr_text(devpath, attr, buf, sizeof(buf));
+	if (ret !=3D 0) {
+		if (ret =3D=3D -ENOENT) {
+			/* file not found */
+			*out_id =3D -1;
+			return 0;
+		}
+
+		return ret;
+	}
+
+	errno =3D 0;
+
+	/* accept decimal or 0x-prefixed hex */
+	v =3D strtol(buf, &end, 0);
+	if (errno)
+		return -errno;
+
+	if (end =3D=3D buf || *end !=3D '\0')
+		return -EINVAL;
+
+	if (v < INT_MIN || v > INT_MAX)
+		return -ERANGE;
+
+	*out_id =3D (int)v;
+
+	return 0;
+}
+
+int read_int_attr(const char *devpath, const char *attr, int *out_id)
+{
+	char buf[64];
+	char *end;
+	long v;
+	int ret;
+
+	if (!out_id || !devpath || !attr)
+		return -EINVAL;
+
+	ret =3D read_attr_text(devpath, attr, buf, sizeof(buf));
+	if (ret !=3D 0)
+		return ret;
+
+	errno =3D 0;
+
+	/* accept decimal or 0x-prefixed hex */
+	v =3D strtol(buf, &end, 0);
+	if (errno)
+		return -errno;
+
+	if (end =3D=3D buf || *end !=3D '\0')
+		return -EINVAL;
+
+	if (v < INT_MIN || v > INT_MAX)
+		return -ERANGE;
+
+	*out_id =3D (int)v;
+
+	return 0;
+}
+
+int read_u32_hex_attr(const char *devpath, const char *attr, uint32_t *out=
, int err_invalid)
+{
+	char buf[64];
+	char *end;
+	unsigned long v;
+	int ret;
+
+	if (!out || !devpath || !attr)
+		return -EINVAL;
+
+	ret =3D read_attr_text(devpath, attr, buf, sizeof(buf));
+	if (ret !=3D 0)
+		return ret;
+
+	errno =3D 0;
+	v =3D strtoul(buf, &end, 16);
+	if (errno)
+		return -errno;
+
+	if (end =3D=3D buf || *end !=3D '\0')
+		return err_invalid;
+
+	if (v > UINT32_MAX)
+		return err_invalid;
+
+	*out =3D (uint32_t)v;
+
+	return 0;
+}
diff --git a/tools/arch/x86/pmtctl/lib/log.c b/tools/arch/x86/pmtctl/lib/lo=
g.c
new file mode 100644
index 000000000000..2ce9edacc97a
--- /dev/null
+++ b/tools/arch/x86/pmtctl/lib/log.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <stdarg.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <errno.h>
+
+#include "lib/log.h"
+
+static enum pmtctl_log_level g_log_level =3D LOG_INFO;
+
+void log_set_level(enum pmtctl_log_level lvl)
+{
+	if (lvl < LOG_ERROR || lvl > LOG_DEBUG)
+		g_log_level =3D LOG_INFO;
+	else
+		g_log_level =3D lvl;
+}
+
+static void log_vmsg(enum pmtctl_log_level lvl, int err, const char *fmt,
+		     va_list ap)
+{
+	if (lvl > g_log_level)
+		return;
+
+	const char *tag =3D
+		(lvl =3D=3D LOG_ERROR) ? "error"  :
+		(lvl =3D=3D LOG_WARN)  ? "warning" :
+		(lvl =3D=3D LOG_INFO)  ? "info"   :
+				     "debug";
+
+	fprintf(stderr, "%s: ", tag);
+	vfprintf(stderr, fmt, ap);
+
+	if (err !=3D 0) {
+		int e =3D (err < 0) ? -err : err;
+
+		if (err < 0)
+			fprintf(stderr, ": %s", strerror(e));
+	}
+
+	fputc('\n', stderr);
+}
+
+void log_impl(enum pmtctl_log_level lvl, int err, const char *fmt, ...)
+{
+	va_list ap;
+
+	va_start(ap, fmt);
+	log_vmsg(lvl, err, fmt, ap);
+	va_end(ap);
+}
+
+int log_ret(int ret, const char *fmt, ...)
+{
+	if (ret =3D=3D 0)
+		return 0;
+
+	va_list ap;
+
+	va_start(ap, fmt);
+	log_vmsg(LOG_ERROR, ret, fmt, ap);
+	va_end(ap);
+
+	return ret;
+}
+
+__noreturn
+void log_bug_impl(const char *file, int line, const char *fmt, ...)
+{
+	va_list ap;
+
+	fprintf(stderr, "pmtctl: BUG at %s:%d: ", file, line);
+	va_start(ap, fmt);
+	vfprintf(stderr, fmt, ap);
+	va_end(ap);
+	fputc('\n', stderr);
+
+	exit(PMTCTL_EXIT_BUG);
+}
diff --git a/tools/arch/x86/pmtctl/lib/pmt_guid.c b/tools/arch/x86/pmtctl/l=
ib/pmt_guid.c
new file mode 100644
index 000000000000..f4d74fc7a977
--- /dev/null
+++ b/tools/arch/x86/pmtctl/lib/pmt_guid.c
@@ -0,0 +1,200 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <errno.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include "lib/pmt_guid.h"
+
+/*
+ * Global intern registry for struct pmt_guid.
+ *
+ * Two sources feed this table:
+ *   1. Pre-registered blocks (e.g. builtin_guids[] from generated code,
+ *      or JSON-loaded pmt_guids.json from the runtime provider). Pointers
+ *      to those entries are stored verbatim and assumed to outlive the
+ *      registry's use.
+ *   2. Synthetic entries allocated on demand by pmt_guid_intern() for
+ *      GUIDs that no provider knows about. These have name =3D NULL and
+ *      description =3D NULL.
+ *
+ * A simple linear-scan array is used; the registry holds at most a few
+ * hundred entries on any realistic system.
+ */
+struct guid_slot {
+	const struct pmt_guid *entry; /* points into registered block or synth_st=
orage */
+	struct pmt_guid       *synth; /* non-NULL iff this slot owns the entry */
+};
+
+static struct guid_slot *g_slots;
+static int               g_nslots;
+static int               g_cap;
+
+/*
+ * Heap blocks handed to pmt_guid_register_owned(). The registry frees
+ * them in pmt_guid_cleanup() after disposing of the slot array, so any
+ * pointers the slots held into these blocks are gone by then.
+ */
+static void **g_owned_blocks;
+static int    g_nowned;
+static int    g_owned_cap;
+
+static int reserve_one(void)
+{
+	struct guid_slot *tmp;
+	int new_cap;
+
+	if (g_nslots < g_cap)
+		return 0;
+
+	new_cap =3D g_cap ? g_cap * 2 : 32;
+	tmp =3D realloc(g_slots, (size_t)new_cap * sizeof(*tmp));
+	if (!tmp)
+		return -ENOMEM;
+
+	g_slots =3D tmp;
+	g_cap =3D new_cap;
+	return 0;
+}
+
+const struct pmt_guid *pmt_guid_lookup(uint32_t guid)
+{
+	for (int i =3D 0; i < g_nslots; i++) {
+		if (g_slots[i].entry && g_slots[i].entry->guid =3D=3D guid)
+			return g_slots[i].entry;
+	}
+	return NULL;
+}
+
+int pmt_guid_register(const struct pmt_guid *entries, int count)
+{
+	if (!entries || count <=3D 0)
+		return -EINVAL;
+
+	for (int i =3D 0; i < count; i++) {
+		const struct pmt_guid *e =3D &entries[i];
+		bool already_known =3D false;
+		int ret;
+
+		/*
+		 * If a slot already exists for this GUID, upgrade it when the
+		 * existing entry is a synthetic placeholder (created earlier
+		 * by pmt_guid_intern() before any provider was loaded) and the
+		 * new entry carries real metadata. The synthetic struct must
+		 * be kept alive because earlier callers (e.g. devices) hold
+		 * pointers to it; patch its fields in place instead of
+		 * swapping the slot entry.
+		 */
+		for (int s =3D 0; s < g_nslots; s++) {
+			struct guid_slot *slot =3D &g_slots[s];
+
+			if (!slot->entry || slot->entry->guid !=3D e->guid)
+				continue;
+
+			if (slot->synth && e->name && *e->name) {
+				slot->synth->name =3D e->name;
+				slot->synth->description =3D e->description;
+			}
+			already_known =3D true;
+			break;
+		}
+
+		if (already_known)
+			continue;
+
+		ret =3D reserve_one();
+		if (ret < 0)
+			return ret;
+
+		g_slots[g_nslots].entry =3D e;
+		g_slots[g_nslots].synth =3D NULL;
+		g_nslots++;
+	}
+
+	return 0;
+}
+
+int pmt_guid_register_owned(void *block, const struct pmt_guid *entries, i=
nt count)
+{
+	void **tmp;
+	int ret;
+
+	/*
+	 * Grow g_owned_blocks first, before registering anything. If this
+	 * fails, no entries have been added to g_slots yet, so the caller
+	 * can safely free(block) on error without leaving dangling slot
+	 * pointers behind.
+	 */
+	if (block && g_nowned =3D=3D g_owned_cap) {
+		int new_cap =3D g_owned_cap ? g_owned_cap * 2 : 8;
+
+		tmp =3D realloc(g_owned_blocks, (size_t)new_cap * sizeof(*tmp));
+		if (!tmp)
+			return -ENOMEM;
+
+		g_owned_blocks =3D tmp;
+		g_owned_cap =3D new_cap;
+	}
+
+	ret =3D pmt_guid_register(entries, count);
+	if (ret < 0)
+		return ret;
+
+	if (block)
+		g_owned_blocks[g_nowned++] =3D block;
+
+	return 0;
+}
+
+const struct pmt_guid *pmt_guid_intern(uint32_t guid)
+{
+	const struct pmt_guid *existing;
+	struct pmt_guid *synth;
+	int ret;
+
+	existing =3D pmt_guid_lookup(guid);
+	if (existing)
+		return existing;
+
+	ret =3D reserve_one();
+	if (ret < 0)
+		return NULL;
+
+	synth =3D calloc(1, sizeof(*synth));
+	if (!synth)
+		return NULL;
+
+	synth->guid =3D guid;
+	synth->name =3D NULL;
+	synth->description =3D NULL;
+
+	g_slots[g_nslots].entry =3D synth;
+	g_slots[g_nslots].synth =3D synth;
+	g_nslots++;
+
+	return synth;
+}
+
+void pmt_guid_cleanup(void)
+{
+	for (int i =3D 0; i < g_nslots; i++)
+		free(g_slots[i].synth);
+
+	free(g_slots);
+	g_slots =3D NULL;
+	g_nslots =3D 0;
+	g_cap =3D 0;
+
+	/*
+	 * Owned blocks are freed last: slot entries may have pointed into
+	 * them, but those pointers are gone now that g_slots is released.
+	 */
+	for (int i =3D 0; i < g_nowned; i++)
+		free(g_owned_blocks[i]);
+
+	free(g_owned_blocks);
+	g_owned_blocks =3D NULL;
+	g_nowned =3D 0;
+	g_owned_cap =3D 0;
+}
--=20
2.43.0

