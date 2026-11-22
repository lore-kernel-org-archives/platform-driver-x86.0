Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795376059;
	b=e+zNmAdIM/BRFKYJs3qrUjPM/Dw4FNL2fdLWbU5KFv/yOUY5hUbxhsSqOIf7y0RP+UQX
	 UJQmUrGvwhZOKSKTDOsLIM9kzEJkhti8GA3KZkJ157Sn+GITXvCk+4jjiaGNPcmntS34E
	 ddYzsBfwXyN9+oqcBeSVf8HMPqX7AHva0TkLPx012KkDvgClbHrSg/ObGw4BDTQ2F4mht
	 bxIu5VA0OTPFdgNY7DYy0odTv9CZzu4xwgaCadU6WjUllMVVKsKiPMrQ6E0equj4gwRso
	 KvN1C2oxQaF4FbvXJCtrMU2TUEGbjnG4+a5bxRUGNsyhKId9Fx6Rldg2NKaDi/IIfqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795376059;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SZfX6GqA97KrTyfThiMFH/SSOzB8FMyr8wecHzrn23c=;
	b=cYGmh9oM4FggpEjhcSM0gv6Pwq5L71l+SZbZ1O5lBwbwKkR5rVnQCaWTk+tm71n/Ura/
	 8DLLal6u+rYcCqgFwofbso7j85eh3WoB0XRwEjF1fTd/jAgQEZf+z7Ig6dT5/zJxNJ8LL
	 L1lopPjP9OK3eQMHDgiHyvRkEP0AHo6cUtHLDPA1c5J63qxjCGwIaePY2S2FxYXckCnpB
	 Z+Cmaflx5UtIsLrUx3KAERE8d1kk+wJxtZGvIv8bu57pl/9q5Lmnx+/E+8b6xNorBsoOv
	 T3wKdCcZ9CApjTUW2o4v6ppLz/pT1UyXeSLjP8df2r71r13/+fF+zy/tgK9UpOamhzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XI15yrSg;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160A6606A327;
	Sun, 22 Nov 2026 19:34:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 160A6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XI15yrSg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795376059; x=1826912059;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8iddT5HjDYJt3X5bz+LJhsoeGXlDcluRY/tTUylnwHI=;
  b=XI15yrSgk8ZnaW/DGIb0HY+5bb5UTMrmdA89izxA5DlV7SoXkiM7U4+8
   aU1vNtCg4U7BHdE6TbW6DUAnQrRkJSL0QrykxXiZBCI5tliM7Gy7+j8jW
   k6WcmEOosB9fGGkW1wovk9tcxae6YMJRj7KOwp44QAKxOxTMu7xCoa/Nu
   TWQENbwRh8c3832xlYcKM0IYxSnu/+j9yYuGywTgLnCdkVdtmd3SEZJ35
   B/Qpz/7SbPKUPSl0FA3c/rX8FLPFKPMYNJiA2IfHH+MU1Thf8ewUirVnj
   OF1UUU8gV0OmLqz4JJRXWDMSZThJKtDbHQ9+0UR3kfWuJMiZKAko92xm/
   A==;
X-CSE-ConnectionGUID: nZty6iYnR7+QenF+9JY1Jg==
X-CSE-MsgGUID: ctCe88PBTmeKARub8QSl3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4217505"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4217505"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 11:34:18 -0800
X-CSE-ConnectionGUID: pmlmR//GS0qPa9O7PrkHvg==
X-CSE-MsgGUID: Kj5431ZURQemtDJck572Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11109788"
Received: from debox1-desk4.jf.intel.com (HELO localhost) ([10.54.77.98])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 11:34:18 -0800
From: "David E. Box" <david.e.box@linux.intel.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/12] tools/arch/x86/pmtctl: Add PMT telemetry device discovery
Date: Sun, 22 Nov 2026 11:33:57 -0800
Message-ID: <65c24797e5d631463d0db4316fdb61625f09b3ff.1795374925.git.david.e.box@linux.intel.com>
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

The pmt_telemetry driver binds to Intel VSEC auxiliary devices and
registers one telemetry device, telemN, per telemetry region under the
auxiliary device's intel_pmt directory. Each telemetry device has a guid
attribute that identifies its metric layout and a telem file with the
sample data.

Add discovery of these telemetry devices. telem_scan() walks the
auxiliary devices bound to pmt_telemetry and records the GUID, name and
data file path of each telemetry device. A device whose GUID can't be
read is skipped with a warning. If no devices are found, an error asks
whether the driver is loaded. The devices are returned sorted by GUID
and then by name, so the commands built on them don't depend on the
order of the sysfs directories.

The results are held in struct pmtctl_ctx, which each command owns and
releases with pmtctl_ctx_free(). auto_pmtctl_ctx frees it automatically
at scope exit, and auto_free does the same for heap pointers.

Also add small helpers to lib/common.c, used by this and later patches:
pmt_grow_array() grows a dynamic array by doubling its capacity,
parse_u32() parses a whole string as an unsigned 32-bit number, and
path_printf() builds a path, failing instead of truncating.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
V2 changes:
  - Replaces v1 05, with the context from v1 08 and pmt_grow_array()
    from v1 03.
  - Unused device fields and sysfs helpers dropped.
  - A device whose GUID can't be read is skipped with a warning.
  - Devices are returned sorted by GUID and name, independent of the
    order of the sysfs directories.
  - pmt_grow_array() returns the array and uses reallocarray(), with no
    realloc(+1) growth or void ** cast.
  - parse_u32() rejects a sign, leading whitespace and trailing
    characters; path_printf() fails instead of truncating.

 tools/arch/x86/pmtctl/Makefile             |   3 +
 tools/arch/x86/pmtctl/include/lib/common.h |  64 ++++++
 tools/arch/x86/pmtctl/include/lib/device.h |  18 ++
 tools/arch/x86/pmtctl/include/lib/pmtctl.h |  24 ++
 tools/arch/x86/pmtctl/lib/common.c         |  75 +++++++
 tools/arch/x86/pmtctl/lib/device_telem.c   | 248 +++++++++++++++++++++
 tools/arch/x86/pmtctl/lib/pmtctl.c         |  22 ++
 7 files changed, 454 insertions(+)
 create mode 100644 tools/arch/x86/pmtctl/include/lib/common.h
 create mode 100644 tools/arch/x86/pmtctl/include/lib/device.h
 create mode 100644 tools/arch/x86/pmtctl/include/lib/pmtctl.h
 create mode 100644 tools/arch/x86/pmtctl/lib/common.c
 create mode 100644 tools/arch/x86/pmtctl/lib/device_telem.c
 create mode 100644 tools/arch/x86/pmtctl/lib/pmtctl.c

diff --git a/tools/arch/x86/pmtctl/Makefile b/tools/arch/x86/pmtctl/Makefile
index 0595d6617920..bf422b84fd34 100644
--- a/tools/arch/x86/pmtctl/Makefile
+++ b/tools/arch/x86/pmtctl/Makefile
@@ -8,7 +8,10 @@ CFLAGS =3D -Wextra
 override CFLAGS +=3D -O2 -Wall -D_GNU_SOURCE -Iinclude -I../../../include
=20
 OBJS :=3D \
+	lib/common.o \
+	lib/device_telem.o \
 	lib/log.o \
+	lib/pmtctl.o \
 	src/main.o
=20
 pmtctl: $(OBJS)
diff --git a/tools/arch/x86/pmtctl/include/lib/common.h b/tools/arch/x86/pm=
tctl/include/lib/common.h
new file mode 100644
index 000000000000..0e1950bffc43
--- /dev/null
+++ b/tools/arch/x86/pmtctl/include/lib/common.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef PMTCTL_COMMON_H
+#define PMTCTL_COMMON_H
+
+#include <stddef.h>
+#include <stdint.h>
+#include <stdlib.h>
+
+#include <linux/compiler.h>
+
+static inline void freep(void *p)
+{
+	free(*(void **)p);
+}
+
+/* Free the pointer with free() at scope exit: char *p auto_free =3D NULL;=
 */
+#define auto_free __attribute__((cleanup(freep)))
+
+/* Take ownership of an auto_free pointer so it is not freed at scope exit=
 */
+#define no_free_ptr(p) \
+	({ typeof(p) __ptr =3D (p); (p) =3D NULL; __ptr; })
+
+#define PMT_ARRAY_INITIAL_CAP 16
+
+/**
+ * pmt_grow_array - grow a dynamic array
+ * @array:     array allocated with malloc() and friends, or NULL
+ * @cap:       current capacity in elements, updated on success
+ * @min_cap:   required capacity in elements
+ * @elem_size: element size in bytes
+ *
+ * The capacity starts at PMT_ARRAY_INITIAL_CAP and doubles until it
+ * reaches @min_cap.
+ *
+ * Return: the possibly moved array, or NULL on allocation failure or
+ * overflow. On failure @array and @cap are unchanged.
+ */
+void *pmt_grow_array(void *array, size_t *cap, size_t min_cap, size_t elem=
_size);
+
+/**
+ * parse_u32 - parse a complete string as an unsigned 32-bit number
+ * @s:    string to parse
+ * @base: number base, as for strtoul()
+ * @val:  returns the parsed value
+ *
+ * Unlike strtoul(), leading whitespace and a sign are not accepted.
+ *
+ * Return: 0 on success, -EINVAL if @s is not a number or has trailing
+ * characters, or -ERANGE if the value does not fit in 32 bits.
+ */
+int parse_u32(const char *s, int base, uint32_t *val);
+
+/**
+ * path_printf - format a path into a buffer
+ * @buf:  buffer for the path
+ * @size: size of @buf in bytes
+ * @fmt:  printf() format of the path
+ * @...:  arguments for @fmt
+ *
+ * Return: 0 on success, or -ENAMETOOLONG if the path does not fit in @buf.
+ */
+int path_printf(char *buf, size_t size, const char *fmt, ...) __printf(3, =
4);
+
+#endif
diff --git a/tools/arch/x86/pmtctl/include/lib/device.h b/tools/arch/x86/pm=
tctl/include/lib/device.h
new file mode 100644
index 000000000000..92d9603d695c
--- /dev/null
+++ b/tools/arch/x86/pmtctl/include/lib/device.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef PMTCTL_DEVICE_H
+#define PMTCTL_DEVICE_H
+
+#include <stddef.h>
+#include <stdint.h>
+
+/* A PMT telemetry device registered by the pmt_telemetry driver */
+struct pmt_device {
+	uint32_t guid;
+	char *name;		/* e.g. "telem0" */
+	char *data_path;	/* telemetry data file */
+};
+
+int telem_scan(struct pmt_device **devices, size_t *num_devices);
+void telem_free(struct pmt_device *devices, size_t num_devices);
+
+#endif
diff --git a/tools/arch/x86/pmtctl/include/lib/pmtctl.h b/tools/arch/x86/pm=
tctl/include/lib/pmtctl.h
new file mode 100644
index 000000000000..e3a2c862bc78
--- /dev/null
+++ b/tools/arch/x86/pmtctl/include/lib/pmtctl.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef PMTCTL_H
+#define PMTCTL_H
+
+#include <stddef.h>
+
+#include "lib/device.h"
+
+/* State for one pmtctl command, owned by the command */
+struct pmtctl_ctx {
+	struct pmt_device *devices;
+	size_t num_devices;
+};
+
+int pmtctl_ctx_init(struct pmtctl_ctx *ctx);
+void pmtctl_ctx_free(struct pmtctl_ctx *ctx);
+
+/*
+ * Free the context with pmtctl_ctx_free() at scope exit:
+ * struct pmtctl_ctx ctx auto_pmtctl_ctx =3D {};
+ */
+#define auto_pmtctl_ctx __attribute__((cleanup(pmtctl_ctx_free)))
+
+#endif
diff --git a/tools/arch/x86/pmtctl/lib/common.c b/tools/arch/x86/pmtctl/lib=
/common.c
new file mode 100644
index 000000000000..adf546df0911
--- /dev/null
+++ b/tools/arch/x86/pmtctl/lib/common.c
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <ctype.h>
+#include <errno.h>
+#include <stdarg.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+
+#include "lib/common.h"
+
+void *pmt_grow_array(void *array, size_t *cap, size_t min_cap, size_t elem=
_size)
+{
+	size_t new_cap;
+	void *new_array;
+
+	if (*cap >=3D min_cap)
+		return array;
+
+	new_cap =3D *cap;
+	if (!new_cap)
+		new_cap =3D PMT_ARRAY_INITIAL_CAP;
+
+	while (new_cap < min_cap) {
+		if (new_cap > SIZE_MAX / 2)
+			return NULL;
+		new_cap *=3D 2;
+	}
+
+	new_array =3D reallocarray(array, new_cap, elem_size);
+	if (!new_array)
+		return NULL;
+
+	*cap =3D new_cap;
+
+	return new_array;
+}
+
+int parse_u32(const char *s, int base, uint32_t *val)
+{
+	unsigned long v;
+	char *end;
+
+	if (!isxdigit((unsigned char)*s))
+		return -EINVAL;
+
+	errno =3D 0;
+	v =3D strtoul(s, &end, base);
+	if (errno)
+		return -errno;
+
+	if (end =3D=3D s || *end !=3D '\0')
+		return -EINVAL;
+
+	if (v > UINT32_MAX)
+		return -ERANGE;
+
+	*val =3D v;
+
+	return 0;
+}
+
+int path_printf(char *buf, size_t size, const char *fmt, ...)
+{
+	va_list ap;
+	int len;
+
+	va_start(ap, fmt);
+	len =3D vsnprintf(buf, size, fmt, ap);
+	va_end(ap);
+
+	if (len < 0 || (size_t)len >=3D size)
+		return -ENAMETOOLONG;
+
+	return 0;
+}
diff --git a/tools/arch/x86/pmtctl/lib/device_telem.c b/tools/arch/x86/pmtc=
tl/lib/device_telem.c
new file mode 100644
index 000000000000..0e249f16a21a
--- /dev/null
+++ b/tools/arch/x86/pmtctl/lib/device_telem.c
@@ -0,0 +1,248 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <ctype.h>
+#include <dirent.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <limits.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+
+#include "lib/common.h"
+#include "lib/device.h"
+#include "lib/log.h"
+
+#define PMT_TELEM_AUX_DIR	"/sys/bus/auxiliary/drivers/pmt_telemetry"
+#define PMT_TELEM_PMT_DIR	"intel_pmt"
+#define PMT_TELEM_PREFIX	"telem"
+#define PMT_TELEM_DATA_FILE	"telem"
+
+struct telem_scan {
+	struct pmt_device *devices;
+	size_t num_devices;
+	size_t cap;
+};
+
+/* Read sysfs attribute @dir/@name into @buf without trailing whitespace */
+static int read_attr_text(const char *dir, const char *name, char *buf, si=
ze_t buflen)
+{
+	char path[PATH_MAX];
+	ssize_t n;
+	int ret;
+	int fd;
+
+	ret =3D path_printf(path, sizeof(path), "%s/%s", dir, name);
+	if (ret)
+		return ret;
+
+	fd =3D open(path, O_RDONLY);
+	if (fd < 0)
+		return -errno;
+
+	n =3D read(fd, buf, buflen - 1);
+	if (n < 0) {
+		ret =3D -errno;
+		close(fd);
+		return ret;
+	}
+	close(fd);
+
+	while (n > 0 && isspace((unsigned char)buf[n - 1]))
+		n--;
+	buf[n] =3D '\0';
+
+	return 0;
+}
+
+/* Read sysfs attribute @dir/@name as a number in @base, as for parse_u32(=
) */
+static int read_attr_u32(const char *dir, const char *name, int base, uint=
32_t *val)
+{
+	char buf[64];
+	int ret;
+
+	ret =3D read_attr_text(dir, name, buf, sizeof(buf));
+	if (ret)
+		return ret;
+
+	return parse_u32(buf, base, val);
+}
+
+/* Match "telem<N>" where <N> is a decimal number */
+static bool is_telem_name(const char *name)
+{
+	const size_t prefix_len =3D strlen(PMT_TELEM_PREFIX);
+	const char *num;
+
+	if (strncmp(name, PMT_TELEM_PREFIX, prefix_len))
+		return false;
+
+	num =3D name + prefix_len;
+
+	return *num !=3D '\0' && num[strspn(num, "0123456789")] =3D=3D '\0';
+}
+
+static int telem_add_device(struct telem_scan *scan, const char *devpath, =
const char *name)
+{
+	char *dev_name auto_free =3D NULL;
+	char *data_path auto_free =3D NULL;
+	struct pmt_device *devices;
+	uint32_t guid;
+	int ret;
+
+	ret =3D read_attr_u32(devpath, "guid", 16, &guid);
+	if (ret) {
+		log_warn("skipping %s: unable to read guid: %s", devpath, strerror(-ret)=
);
+		return 0;
+	}
+
+	dev_name =3D strdup(name);
+	if (!dev_name)
+		return -ENOMEM;
+
+	if (asprintf(&data_path, "%s/%s", devpath, PMT_TELEM_DATA_FILE) < 0) {
+		/* asprintf() leaves the pointer undefined on failure */
+		data_path =3D NULL;
+		return -ENOMEM;
+	}
+
+	devices =3D pmt_grow_array(scan->devices, &scan->cap, scan->num_devices +=
 1,
+				 sizeof(*devices));
+	if (!devices)
+		return -ENOMEM;
+
+	scan->devices =3D devices;
+
+	devices[scan->num_devices++] =3D (struct pmt_device) {
+		.guid =3D guid,
+		.name =3D no_free_ptr(dev_name),
+		.data_path =3D no_free_ptr(data_path),
+	};
+
+	return 0;
+}
+
+/* Add the telemetry devices under one auxiliary device's intel_pmt direct=
ory */
+static int telem_scan_pmt_dir(struct telem_scan *scan, const char *pmt_pat=
h)
+{
+	struct dirent *de;
+	DIR *dir;
+	int ret =3D 0;
+
+	dir =3D opendir(pmt_path);
+	if (!dir) {
+		/* Most driver directory entries (bind, uevent, ...) aren't devices */
+		if (errno =3D=3D ENOENT || errno =3D=3D ENOTDIR)
+			return 0;
+
+		return -errno;
+	}
+
+	while ((de =3D readdir(dir))) {
+		char devpath[PATH_MAX];
+
+		if (!is_telem_name(de->d_name))
+			continue;
+
+		ret =3D path_printf(devpath, sizeof(devpath), "%s/%s", pmt_path, de->d_n=
ame);
+		if (ret)
+			break;
+
+		ret =3D telem_add_device(scan, devpath, de->d_name);
+		if (ret)
+			break;
+	}
+
+	closedir(dir);
+
+	return ret;
+}
+
+/* Walk the auxiliary devices bound to the pmt_telemetry driver */
+static int telem_scan_aux_dir(struct telem_scan *scan)
+{
+	struct dirent *de;
+	DIR *dir;
+	int ret =3D 0;
+
+	/* Without the driver there are no devices, which telem_scan() reports */
+	dir =3D opendir(PMT_TELEM_AUX_DIR);
+	if (!dir)
+		return 0;
+
+	while ((de =3D readdir(dir))) {
+		char pmt_path[PATH_MAX];
+
+		if (de->d_name[0] =3D=3D '.')
+			continue;
+
+		ret =3D path_printf(pmt_path, sizeof(pmt_path), "%s/%s/%s",
+				  PMT_TELEM_AUX_DIR, de->d_name, PMT_TELEM_PMT_DIR);
+		if (ret)
+			break;
+
+		ret =3D telem_scan_pmt_dir(scan, pmt_path);
+		if (ret)
+			break;
+	}
+
+	closedir(dir);
+
+	return ret;
+}
+
+/* Order devices by GUID, then by name, so telem2 comes before telem10 */
+static int device_cmp(const void *a, const void *b)
+{
+	const struct pmt_device *da =3D a;
+	const struct pmt_device *db =3D b;
+
+	if (da->guid !=3D db->guid)
+		return da->guid < db->guid ? -1 : 1;
+
+	return strverscmp(da->name, db->name);
+}
+
+/**
+ * telem_scan - discover PMT telemetry devices
+ * @devices:     returns the discovered devices sorted by GUID, then by na=
me.
+ *               Freed with telem_free().
+ * @num_devices: returns the number of entries in @devices
+ *
+ * Return: 0 on success, -ENODEV if no devices were found, or another
+ * negative errno on failure.
+ */
+int telem_scan(struct pmt_device **devices, size_t *num_devices)
+{
+	struct telem_scan scan =3D {};
+	int ret;
+
+	ret =3D telem_scan_aux_dir(&scan);
+	if (ret) {
+		telem_free(scan.devices, scan.num_devices);
+		return log_ret(ret, "unable to scan PMT telemetry devices");
+	}
+
+	if (!scan.num_devices) {
+		log_err("no PMT telemetry devices found (is the pmt_telemetry driver loa=
ded?)");
+		return -ENODEV;
+	}
+
+	qsort(scan.devices, scan.num_devices, sizeof(*scan.devices), device_cmp);
+
+	*devices =3D scan.devices;
+	*num_devices =3D scan.num_devices;
+
+	return 0;
+}
+
+void telem_free(struct pmt_device *devices, size_t num_devices)
+{
+	for (size_t i =3D 0; i < num_devices; i++) {
+		free(devices[i].name);
+		free(devices[i].data_path);
+	}
+	free(devices);
+}
diff --git a/tools/arch/x86/pmtctl/lib/pmtctl.c b/tools/arch/x86/pmtctl/lib=
/pmtctl.c
new file mode 100644
index 000000000000..9a6fd2a303f4
--- /dev/null
+++ b/tools/arch/x86/pmtctl/lib/pmtctl.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include "lib/device.h"
+#include "lib/pmtctl.h"
+
+/**
+ * pmtctl_ctx_init - discover PMT devices
+ * @ctx: zero-initialized context
+ *
+ * Return: 0 on success or a negative errno. @ctx must be released with
+ * pmtctl_ctx_free() in either case.
+ */
+int pmtctl_ctx_init(struct pmtctl_ctx *ctx)
+{
+	return telem_scan(&ctx->devices, &ctx->num_devices);
+}
+
+void pmtctl_ctx_free(struct pmtctl_ctx *ctx)
+{
+	telem_free(ctx->devices, ctx->num_devices);
+	ctx->devices =3D NULL;
+	ctx->num_devices =3D 0;
+}
--=20
2.53.0

