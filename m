Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795376062;
	b=F4RM6HszP06J/nEwQykQhifie1piR7MhwTz59G6XXjhmr/EkvH0KZ/Y22LyCcW0rKUte
	 aBnEm4Y6hWJwUJ3NDtZUeO8nt0BZstrSZGz9aQBCWvn0iLfRjbzH2vkYruL2snTvSH17M
	 GZ6LF7/xlqm2Ooq0k1q1dz/94ZpI1N78nG1niZ+OqTQqWjEGUXwy9K/ctD0LSfRIktLB/
	 HvpZ/lrBI1YvL0v5LeAE1se5lg6EoKAIJzsFh5Ck+3QQ4r9/s9i1oqToG1X8wDy6mhqE2
	 Uvm9R9UuJWDlHr78wy53u/itJ031YC9mVeyMCBYsFvwg1cT9PB5lwSsWL3wOwK70ZUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795376062;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lS3tK9GbltiK8NPg/SK88lXpAQtYdZiM/ncR69mcFNk=;
	b=A34LHToPyNi9AbZZijaUs90ShdMr0HSWkOmy/cwiW8TvAgC5+UnE1Hxn0pix22XefCg7
	 jnWRIIX4dLutgEluyJ7ZnWaAnelyk1AOO3Lq9yIEABBRRdxpfx5Dofled5dr06qfqXbDu
	 jIYQVjS8jpiRCCrK+qLy0fWR7DhDyQ7Q5KkudEdH7ub4cCGWOp/Q+E2ni1Cvb7piyaGiJ
	 TBzElz0xoysMR0l81KXrEjJsgUdEqAdxP9x/FI556vnVJqMFTp6R8T+2tCe7dSj4bGTa6
	 xwskUrcjoGvVr/1s1x7L4KdIGo+bvzumt2mAP3az/j8g0uFsExDfJ/uBtzSQng+2iyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=StEVJEWU;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21550606A68D;
	Sun, 22 Nov 2026 19:34:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21550606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=StEVJEWU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795376061; x=1826912061;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mzXbDEnLI1QQzmEVf/XXyC7OqkvkyV24SJUCntmmni4=;
  b=StEVJEWU34cx04m+xzAIrF1+lEH7NzejnY/yQrZ883t8/WwqaIa1E4E1
   Jo6Nc6hSui4IwQDcq/vSmWi/WllP24LppEs61XW22RLCxPh9SOkPBcyS9
   QN0MArMCr/rDduOT/iPVS+Ro/x+Uc2MG1A0W+KjIr+okzX7VvryPQlbun
   1Jhr3uXfIvVFLdUIZ5MejgW6M18Sl5Yi0oNVAj6uWiNMAwmLNEzsjGiUF
   zfZ5/SgihuErTN6qkxDGJKhJXz2+g7mS2R+gfV4vqnpmRNUciWD0NF3ax
   eqGc1rkaI4WA1lUoBEjdBIMiSLGzMsr887jWSkiPHi+7exFMJUTjGTd7H
   Q==;
X-CSE-ConnectionGUID: LwC9MeOPS4u51IRNYz5E/w==
X-CSE-MsgGUID: ybJy6JlYRR2wKXVB9gVKPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4217516"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4217516"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 11:34:21 -0800
X-CSE-ConnectionGUID: pu21JxZDTYaNtguDHW9PDA==
X-CSE-MsgGUID: +/Etj6bzRNubrN6B+HTsLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11109801"
Received: from debox1-desk4.jf.intel.com (HELO localhost) ([10.54.77.98])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 11:34:21 -0800
From: "David E. Box" <david.e.box@linux.intel.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/12] tools/arch/x86/pmtctl: Add 'stat' command
Date: Sun, 22 Nov 2026 11:34:02 -0800
Message-ID: <2d4566e76b319e2ad0ccc55b59d023ba51473511.1795374925.git.david.e.box@linux.intel.com>
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

Add the 'stat' command, which samples metrics of the PMT telemetry
devices at an interval, similar to 'perf stat'. Metrics are given by
name with -e. The default layout has one row per device with the
metric's value; --vertical has one row per device and metric, and is
needed to view more than one metric. A device that has none of the
requested metrics is left out; with --vertical, a metric a device
doesn't have is shown as '-'. A value that can't be read is shown as
NaN; stat only fails if no value could be read at all. --guid and
--device restrict the devices, -i and -c set the interval and number of
samples, and --no-header leaves out the header.

Samples are scheduled from the start time with CLOCK_MONOTONIC, so the
interval doesn't drift, and the time column shows when each sample was
taken. SIGINT (Ctrl-C) ends the sampling without waiting out the
interval, whether it arrives during the wait or while values are being
read. Before sampling, every requested sample is checked against the
size of its telemetry region, and the data files are opened once, so a
permission problem is reported up front.

Discovery also records the size of each device's telemetry region,
from its size attribute, so that samples can be checked against it. A
device whose size can't be read is skipped with a warning, like one
whose GUID can't be read.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
V2 changes:
  - Replaces v1 14, without --hex and --raw, which follow.
  - -i and -c are parsed strictly; v1 accepted '10abc'.
  - The time column is measured and sampling doesn't drift; v1 printed
    sample x interval. SIGINT ends sampling without waiting out the
    interval.
  - Columns fit the names; v1 cut them at 20 or 28 characters.
  - Samples are checked against the region size before sampling, and
    the data files are opened once, up front.
  - telem_read() rewritten.
  - --once, --header and -d dropped in favor of -c 1, --no-header and
    --guid/--device.

 tools/arch/x86/pmtctl/Makefile             |   1 +
 tools/arch/x86/pmtctl/include/lib/device.h |   3 +
 tools/arch/x86/pmtctl/include/pmtctl_cli.h |   1 +
 tools/arch/x86/pmtctl/lib/device_telem.c   |  49 ++
 tools/arch/x86/pmtctl/src/cmd_stat.c       | 753 +++++++++++++++++++++
 tools/arch/x86/pmtctl/src/main.c           |   4 +
 6 files changed, 811 insertions(+)
 create mode 100644 tools/arch/x86/pmtctl/src/cmd_stat.c

diff --git a/tools/arch/x86/pmtctl/Makefile b/tools/arch/x86/pmtctl/Makefile
index bb1a92e3dd6f..564931794086 100644
--- a/tools/arch/x86/pmtctl/Makefile
+++ b/tools/arch/x86/pmtctl/Makefile
@@ -28,6 +28,7 @@ OBJS :=3D \
 	lib/tss.o \
 	lib/tss_json.o \
 	src/cmd_list.o \
+	src/cmd_stat.o \
 	src/main.o
=20
 pmtctl: $(OBJS)
diff --git a/tools/arch/x86/pmtctl/include/lib/device.h b/tools/arch/x86/pm=
tctl/include/lib/device.h
index 92d9603d695c..59a4e5b352e7 100644
--- a/tools/arch/x86/pmtctl/include/lib/device.h
+++ b/tools/arch/x86/pmtctl/include/lib/device.h
@@ -10,9 +10,12 @@ struct pmt_device {
 	uint32_t guid;
 	char *name;		/* e.g. "telem0" */
 	char *data_path;	/* telemetry data file */
+	uint32_t size;		/* telemetry region size in bytes */
 };
=20
 int telem_scan(struct pmt_device **devices, size_t *num_devices);
 void telem_free(struct pmt_device *devices, size_t num_devices);
+int telem_open(const struct pmt_device *dev);
+int telem_read(int fd, uint32_t sample_id, unsigned int lsb, unsigned int =
msb, uint64_t *val);
=20
 #endif
diff --git a/tools/arch/x86/pmtctl/include/pmtctl_cli.h b/tools/arch/x86/pm=
tctl/include/pmtctl_cli.h
index 9551c581cf1b..eb8537c794b4 100644
--- a/tools/arch/x86/pmtctl/include/pmtctl_cli.h
+++ b/tools/arch/x86/pmtctl/include/pmtctl_cli.h
@@ -14,5 +14,6 @@ struct pmt_global_opts {
 };
=20
 int cmd_list(int argc, char **argv, const struct pmt_global_opts *gopts);
+int cmd_stat(int argc, char **argv, const struct pmt_global_opts *gopts);
=20
 #endif
diff --git a/tools/arch/x86/pmtctl/lib/device_telem.c b/tools/arch/x86/pmtc=
tl/lib/device_telem.c
index 0e249f16a21a..2f728514abe5 100644
--- a/tools/arch/x86/pmtctl/lib/device_telem.c
+++ b/tools/arch/x86/pmtctl/lib/device_telem.c
@@ -11,6 +11,8 @@
 #include <string.h>
 #include <unistd.h>
=20
+#include <linux/bits.h>
+
 #include "lib/common.h"
 #include "lib/device.h"
 #include "lib/log.h"
@@ -90,6 +92,7 @@ static int telem_add_device(struct telem_scan *scan, cons=
t char *devpath, const
 	char *data_path auto_free =3D NULL;
 	struct pmt_device *devices;
 	uint32_t guid;
+	uint32_t size;
 	int ret;
=20
 	ret =3D read_attr_u32(devpath, "guid", 16, &guid);
@@ -98,6 +101,12 @@ static int telem_add_device(struct telem_scan *scan, co=
nst char *devpath, const
 		return 0;
 	}
=20
+	ret =3D read_attr_u32(devpath, "size", 10, &size);
+	if (ret) {
+		log_warn("skipping %s: unable to read size: %s", devpath, strerror(-ret)=
);
+		return 0;
+	}
+
 	dev_name =3D strdup(name);
 	if (!dev_name)
 		return -ENOMEM;
@@ -119,6 +128,7 @@ static int telem_add_device(struct telem_scan *scan, co=
nst char *devpath, const
 		.guid =3D guid,
 		.name =3D no_free_ptr(dev_name),
 		.data_path =3D no_free_ptr(data_path),
+		.size =3D size,
 	};
=20
 	return 0;
@@ -246,3 +256,42 @@ void telem_free(struct pmt_device *devices, size_t num=
_devices)
 	}
 	free(devices);
 }
+
+/* Return: a file descriptor for reading the telemetry of @dev, or a negat=
ive errno */
+int telem_open(const struct pmt_device *dev)
+{
+	int fd;
+
+	fd =3D open(dev->data_path, O_RDONLY);
+	if (fd < 0)
+		return -errno;
+
+	return fd;
+}
+
+/**
+ * telem_read - read a field of a telemetry sample
+ * @fd:        file descriptor from telem_open()
+ * @sample_id: index of the 64-bit sample in the telemetry region
+ * @lsb:       lowest bit of the field
+ * @msb:       highest bit of the field, at most 63
+ * @val:       returns the field, shifted down to bit 0
+ *
+ * Return: 0 on success, or a negative errno if the sample can't be read.
+ */
+int telem_read(int fd, uint32_t sample_id, unsigned int lsb, unsigned int =
msb, uint64_t *val)
+{
+	uint64_t sample;
+	ssize_t n;
+
+	n =3D pread(fd, &sample, sizeof(sample), sample_id * sizeof(sample));
+	if (n < 0)
+		return -errno;
+
+	if ((size_t)n !=3D sizeof(sample))
+		return -EIO;
+
+	*val =3D (sample & GENMASK_ULL(msb, lsb)) >> lsb;
+
+	return 0;
+}
diff --git a/tools/arch/x86/pmtctl/src/cmd_stat.c b/tools/arch/x86/pmtctl/s=
rc/cmd_stat.c
new file mode 100644
index 000000000000..11a2ab1fa341
--- /dev/null
+++ b/tools/arch/x86/pmtctl/src/cmd_stat.c
@@ -0,0 +1,753 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * pmtctl stat: sample metrics of the PMT telemetry devices over time
+ */
+#include <errno.h>
+#include <getopt.h>
+#include <inttypes.h>
+#include <limits.h>
+#include <signal.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <time.h>
+#include <unistd.h>
+
+#include <linux/kernel.h>
+#include <linux/time64.h>
+
+#include "lib/common.h"
+#include "lib/device.h"
+#include "lib/log.h"
+#include "lib/pmtctl.h"
+#include "lib/tss.h"
+#include "pmtctl_cli.h"
+
+#define STAT_DEFAULT_INTERVAL_MS	1000
+
+/* Printed instead of a value the device doesn't have, or that couldn't be=
 read */
+#define STAT_VAL_ABSENT		"-"
+#define STAT_VAL_FAILED		"NaN"
+
+/* Room for any formatted value: the digits of UINT64_MAX, or a marker abo=
ve */
+#define STAT_VALUE_LEN		20
+#define STAT_NUM_BUF		(STAT_VALUE_LEN + 1)
+
+/* Column titles; each column is at least as wide as its title */
+#define STAT_COL_SAMPLE		"sample"
+#define STAT_COL_TIME		"time_ms"
+#define STAT_COL_DEVICE		"device"
+#define STAT_COL_METRIC		"metric"
+#define STAT_COL_VALUE		"value"
+
+#define STAT_COL_GAP		"  "
+
+/* Values for long-only options, above any short option character */
+enum {
+	OPT_STAT_GUID =3D CHAR_MAX + 1,
+	OPT_STAT_DEVICE,
+	OPT_STAT_NO_HEADER,
+	OPT_STAT_VERTICAL,
+};
+
+/* A value to sample on each device */
+struct stat_request {
+	const char *name;	/* metric name */
+};
+
+struct stat_opts {
+	bool show_help;
+	struct stat_request *requests;
+	size_t num_requests;
+	size_t requests_cap;
+	struct pmt_device_filter filter;
+	uint32_t interval_ms;
+	uint32_t count;		/* number of samples, 0 until interrupted */
+	bool no_header;
+	bool vertical;
+};
+
+/* The value of one request on one device */
+struct stat_cell {
+	bool present;		/* the device has the requested value */
+	uint32_t sample_id;
+	unsigned int lsb;
+	unsigned int msb;
+	bool valid;		/* false if the last read failed */
+	bool reported;		/* a read failure has been reported */
+	uint64_t value;
+};
+
+/* A device and the cells of its requests */
+struct stat_row {
+	const struct pmt_device *dev;
+	int fd;
+	struct stat_cell *cells;
+};
+
+struct stat_run {
+	struct stat_opts opts;
+	struct pmtctl_ctx ctx;
+	struct stat_row *rows;
+	size_t num_rows;
+	struct stat_cell *cells;
+	size_t dev_width;	/* width of the device column */
+	size_t label_width;	/* width of the metric column in --vertical */
+};
+
+static void stat_run_free(struct stat_run *run)
+{
+	for (size_t i =3D 0; i < run->num_rows; i++) {
+		if (run->rows[i].fd >=3D 0)
+			close(run->rows[i].fd);
+	}
+	free(run->rows);
+	free(run->cells);
+	free(run->opts.requests);
+	pmtctl_ctx_free(&run->ctx);
+}
+
+/* Free the run with stat_run_free() at scope exit */
+#define auto_stat_run __attribute__((cleanup(stat_run_free)))
+
+static void stat_usage_full(FILE *out)
+{
+	fprintf(out,
+		"Usage: pmtctl stat [options] -e <metric>[,<metric>...] ...\n"
+		"\n"
+		"Collect metric values over time (similar to 'perf stat').\n"
+		"\n"
+		"Options:\n"
+		"  -h, --help              Show this help.\n"
+		"  -e, --event <spec>      Metric name or comma-separated list; may be r=
epeated.\n"
+		"      --guid <hex>        Restrict to devices with this GUID.\n"
+		"      --device <name>     Restrict to one device, e.g. telem3.\n"
+		"  -i, --interval <ms>     Sampling interval (default 1000 ms).\n"
+		"  -c, --count <N>         Number of samples (default infinite).\n"
+		"      --no-header         Don't print the header.\n"
+		"      --vertical          One line per value per sample: sample time_ms=
 device\n"
+		"                          metric value. Required for more than one valu=
e.\n"
+		"\n"
+		"Devices without any requested value are left out. With --vertical, a\n"
+		"value a device doesn't have prints as -; one that can't be read, NaN.\n"
+		"\n"
+		"Examples:\n"
+		"  pmtctl stat -e package_energy\n"
+		"  pmtctl stat -e package_energy --interval 500\n"
+		"  pmtctl stat -e firmware_version -c 1\n"
+		"  pmtctl stat -e pch_temp --guid 03086000\n"
+		"  pmtctl stat --vertical -e package_energy,pch_temp\n"
+	);
+}
+
+static void stat_usage_short(FILE *out)
+{
+	fprintf(out,
+		"Usage: pmtctl stat [options] -e <metric>[,<metric>...] ...\n"
+		"\n"
+		"Run 'pmtctl stat --help' for full help.\n"
+	);
+}
+
+static int add_request(struct stat_opts *opts, const struct stat_request *=
req)
+{
+	struct stat_request *requests;
+
+	requests =3D pmt_grow_array(opts->requests, &opts->requests_cap, opts->nu=
m_requests + 1,
+				  sizeof(*requests));
+	if (!requests)
+		return -ENOMEM;
+
+	opts->requests =3D requests;
+	requests[opts->num_requests++] =3D *req;
+
+	return 0;
+}
+
+/* Add the metrics of an -e argument, which is split in place at the comma=
s */
+static int add_metric_requests(struct stat_opts *opts, char *arg)
+{
+	char *saveptr;
+	char *name;
+	int ret;
+
+	for (name =3D strtok_r(arg, ",", &saveptr); name; name =3D strtok_r(NULL,=
 ",", &saveptr)) {
+		ret =3D add_request(opts, &(struct stat_request){ .name =3D name });
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/* Parse a positive number of option @opt */
+static int parse_positive(const char *arg, const char *opt, uint32_t *val)
+{
+	if (parse_u32(arg, 10, val) || !*val) {
+		log_err("%s must be a positive number, not '%s'", opt, arg);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int stat_parse_options(struct stat_opts *opts, int argc, char **arg=
v)
+{
+	static const struct option long_opts[] =3D {
+		{ "help",	no_argument,		NULL, 'h' },
+		{ "event",	required_argument,	NULL, 'e' },
+		{ "guid",	required_argument,	NULL, OPT_STAT_GUID },
+		{ "device",	required_argument,	NULL, OPT_STAT_DEVICE },
+		{ "interval",	required_argument,	NULL, 'i' },
+		{ "count",	required_argument,	NULL, 'c' },
+		{ "no-header",	no_argument,		NULL, OPT_STAT_NO_HEADER },
+		{ "vertical",	no_argument,		NULL, OPT_STAT_VERTICAL },
+		{}
+	};
+	int opt;
+	int ret;
+
+	optind =3D 1;
+
+	while ((opt =3D getopt_long(argc, argv, "he:i:c:", long_opts, NULL)) !=3D=
 -1) {
+		switch (opt) {
+		case 'h':
+			opts->show_help =3D true;
+			return 0;
+		case 'e':
+			ret =3D add_metric_requests(opts, optarg);
+			if (ret)
+				return log_ret(ret, "unable to add metrics");
+			break;
+		case OPT_STAT_GUID:
+			if (pmt_device_filter_set_guid(&opts->filter, optarg))
+				return -EINVAL;
+			break;
+		case OPT_STAT_DEVICE:
+			opts->filter.name =3D optarg;
+			break;
+		case 'i':
+			ret =3D parse_positive(optarg, "interval", &opts->interval_ms);
+			if (ret)
+				return ret;
+			break;
+		case 'c':
+			ret =3D parse_positive(optarg, "count", &opts->count);
+			if (ret)
+				return ret;
+			break;
+		case OPT_STAT_NO_HEADER:
+			opts->no_header =3D true;
+			break;
+		case OPT_STAT_VERTICAL:
+			opts->vertical =3D true;
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	if (optind !=3D argc) {
+		log_err("unexpected extra arguments to 'stat'");
+		return -EINVAL;
+	}
+
+	if (!opts->num_requests) {
+		log_err("requires -e/--event");
+		return -EINVAL;
+	}
+
+	if (opts->num_requests > 1 && !opts->vertical) {
+		log_err("more than one value needs --vertical");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int metric_name_cmp(const void *key, const void *elem)
+{
+	const struct pmt_metric_def *def =3D elem;
+
+	return strcmp(key, def->name);
+}
+
+/* Return: whether 64-bit sample @sample_id is inside the telemetry region=
 of @dev */
+static bool sample_in_region(const struct pmt_device *dev, uint32_t sample=
_id)
+{
+	return (sample_id + 1ULL) * sizeof(uint64_t) <=3D dev->size;
+}
+
+/* Find where the value of @req is in the telemetry of @dev */
+static void resolve_request(const struct pmtctl_ctx *ctx, const struct pmt=
_device *dev,
+			    const struct stat_request *req, struct stat_cell *cell)
+{
+	const struct pmt_tss_info *info;
+	const struct pmt_metric_def *def;
+
+	*cell =3D (struct stat_cell){};
+
+	info =3D pmt_tss_db_lookup(&ctx->tss, dev->guid);
+	if (!info || !info->num_metrics)
+		return;
+
+	def =3D bsearch(req->name, info->metrics, info->num_metrics, sizeof(*info=
->metrics),
+		      metric_name_cmp);
+	if (!def)
+		return;
+
+	cell->present =3D true;
+	cell->sample_id =3D def->sample_id;
+	cell->lsb =3D def->lsb;
+	cell->msb =3D def->msb;
+}
+
+/*
+ * Build a row for each of @devs that has at least one of the requested
+ * values. Every request must be present on some device. On success the
+ * rows are handed to @run.
+ */
+static int build_rows(struct stat_run *run, const struct pmt_device **devs=
, size_t num_devs)
+{
+	struct stat_cell *cells auto_free =3D NULL;
+	struct stat_row *rows auto_free =3D NULL;
+	bool *found auto_free =3D NULL;
+	const size_t num_requests =3D run->opts.num_requests;
+	size_t num_rows =3D 0;
+
+	rows =3D calloc(num_devs, sizeof(*rows));
+	cells =3D calloc(num_devs * num_requests, sizeof(*cells));
+	found =3D calloc(num_requests, sizeof(*found));
+	if (!rows || !cells || !found)
+		return -ENOMEM;
+
+	for (size_t d =3D 0; d < num_devs; d++) {
+		/* A device without any requested value gives its slot to the next one */
+		struct stat_row *row =3D &rows[num_rows];
+		bool any =3D false;
+
+		row->dev =3D devs[d];
+		row->fd =3D -1;
+		row->cells =3D &cells[num_rows * num_requests];
+
+		for (size_t r =3D 0; r < num_requests; r++) {
+			resolve_request(&run->ctx, devs[d], &run->opts.requests[r], &row->cells=
[r]);
+			if (row->cells[r].present) {
+				found[r] =3D true;
+				any =3D true;
+			}
+		}
+
+		if (any)
+			num_rows++;
+	}
+
+	for (size_t r =3D 0; r < num_requests; r++) {
+		if (!found[r]) {
+			log_err("no selected device has metric '%s'",
+				run->opts.requests[r].name);
+			return -ENOENT;
+		}
+	}
+
+	run->rows =3D no_free_ptr(rows);
+	run->cells =3D no_free_ptr(cells);
+	run->num_rows =3D num_rows;
+
+	return 0;
+}
+
+/* Check that every value to sample is inside the telemetry region of its =
device */
+static int check_bounds(const struct stat_run *run)
+{
+	for (size_t d =3D 0; d < run->num_rows; d++) {
+		const struct stat_row *row =3D &run->rows[d];
+
+		for (size_t r =3D 0; r < run->opts.num_requests; r++) {
+			const struct stat_cell *cell =3D &row->cells[r];
+
+			if (!cell->present)
+				continue;
+
+			if (!sample_in_region(row->dev, cell->sample_id)) {
+				log_err("%s: sample %" PRIu32 " of '%s' is beyond the %" PRIu32
+					"-byte telemetry region", row->dev->name, cell->sample_id,
+					run->opts.requests[r].name, row->dev->size);
+				return -ERANGE;
+			}
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * Open the telemetry file of each row's device, once for the whole run. T=
he
+ * files are closed by stat_run_free().
+ */
+static int open_telem_files(struct stat_run *run)
+{
+	for (size_t d =3D 0; d < run->num_rows; d++) {
+		struct stat_row *row =3D &run->rows[d];
+
+		row->fd =3D telem_open(row->dev);
+		if (row->fd =3D=3D -EACCES || row->fd =3D=3D -EPERM) {
+			log_err("permission denied reading %s; reading telemetry requires root",
+				row->dev->data_path);
+			return row->fd;
+		}
+
+		if (row->fd < 0)
+			return log_ret(row->fd, "unable to open %s", row->dev->data_path);
+	}
+
+	return 0;
+}
+
+/* Print @s in a column of @width, aligned to the right if @right */
+static void print_column(const char *s, size_t width, bool right)
+{
+	size_t len =3D strlen(s);
+	size_t pad =3D len < width ? width - len : 0;
+
+	if (right)
+		print_chars(' ', pad);
+	fputs(s, stdout);
+	if (!right)
+		print_chars(' ', pad);
+}
+
+static const char *format_value(const struct stat_cell *cell, char *buf, s=
ize_t len)
+{
+	if (!cell->present)
+		return STAT_VAL_ABSENT;
+
+	if (!cell->valid)
+		return STAT_VAL_FAILED;
+
+	snprintf(buf, len, "%" PRIu64, cell->value);
+
+	return buf;
+}
+
+/* In the horizontal layout the value column is headed by its one value's =
label */
+static size_t value_width(const struct stat_run *run)
+{
+	size_t width =3D STAT_VALUE_LEN;
+	size_t len =3D strlen(run->opts.requests[0].name);
+
+	if (!run->opts.vertical && len > width)
+		width =3D len;
+
+	return width;
+}
+
+/* Print the start of a line: sample, time and device columns */
+static void print_line_start(const struct stat_run *run, const char *sampl=
e, const char *time,
+			     const char *dev)
+{
+	print_column(sample, strlen(STAT_COL_SAMPLE), false);
+	fputs(STAT_COL_GAP, stdout);
+	print_column(time, strlen(STAT_COL_TIME), false);
+	fputs(STAT_COL_GAP, stdout);
+	print_column(dev, run->dev_width, false);
+	fputs(STAT_COL_GAP, stdout);
+}
+
+static void print_header_dashes(const struct stat_run *run)
+{
+	print_chars('-', strlen(STAT_COL_SAMPLE));
+	fputs(STAT_COL_GAP, stdout);
+	print_chars('-', strlen(STAT_COL_TIME));
+	fputs(STAT_COL_GAP, stdout);
+	print_chars('-', run->dev_width);
+	fputs(STAT_COL_GAP, stdout);
+}
+
+static void print_header(const struct stat_run *run)
+{
+	if (run->opts.no_header)
+		return;
+
+	print_line_start(run, STAT_COL_SAMPLE, STAT_COL_TIME, STAT_COL_DEVICE);
+	if (run->opts.vertical) {
+		print_column(STAT_COL_METRIC, run->label_width, false);
+		fputs(STAT_COL_GAP STAT_COL_VALUE "\n", stdout);
+	} else {
+		print_column(run->opts.requests[0].name, value_width(run), true);
+		putchar('\n');
+	}
+
+	print_header_dashes(run);
+	if (run->opts.vertical) {
+		print_chars('-', run->label_width);
+		fputs(STAT_COL_GAP, stdout);
+	}
+	print_chars('-', value_width(run));
+	putchar('\n');
+	fflush(stdout);
+}
+
+static void print_sample(const struct stat_run *run, uint64_t sample, uint=
64_t time_ms)
+{
+	char sample_buf[STAT_NUM_BUF];
+	char time_buf[STAT_NUM_BUF];
+	char value_buf[STAT_NUM_BUF];
+
+	snprintf(sample_buf, sizeof(sample_buf), "%" PRIu64, sample);
+	snprintf(time_buf, sizeof(time_buf), "%" PRIu64, time_ms);
+
+	for (size_t d =3D 0; d < run->num_rows; d++) {
+		const struct stat_row *row =3D &run->rows[d];
+
+		for (size_t r =3D 0; r < run->opts.num_requests; r++) {
+			const char *value;
+
+			value =3D format_value(&row->cells[r], value_buf, sizeof(value_buf));
+
+			print_line_start(run, sample_buf, time_buf, row->dev->name);
+			if (run->opts.vertical) {
+				print_column(run->opts.requests[r].name, run->label_width, false);
+				fputs(STAT_COL_GAP, stdout);
+				fputs(value, stdout);
+			} else {
+				print_column(value, value_width(run), true);
+			}
+			putchar('\n');
+		}
+	}
+
+	fflush(stdout);
+}
+
+static void set_column_widths(struct stat_run *run)
+{
+	run->dev_width =3D strlen(STAT_COL_DEVICE);
+	for (size_t d =3D 0; d < run->num_rows; d++)
+		run->dev_width =3D max(run->dev_width, strlen(run->rows[d].dev->name));
+
+	run->label_width =3D strlen(STAT_COL_METRIC);
+	for (size_t r =3D 0; r < run->opts.num_requests; r++)
+		run->label_width =3D max(run->label_width, strlen(run->opts.requests[r].=
name));
+}
+
+/* Read every present cell; return the last read error, or 0 */
+/* Read the present values of every row. Return: whether any value was rea=
d */
+static bool read_cells(struct stat_run *run)
+{
+	bool any_read =3D false;
+
+	for (size_t d =3D 0; d < run->num_rows; d++) {
+		struct stat_row *row =3D &run->rows[d];
+
+		for (size_t r =3D 0; r < run->opts.num_requests; r++) {
+			struct stat_cell *cell =3D &row->cells[r];
+			int ret;
+
+			if (!cell->present)
+				continue;
+
+			ret =3D telem_read(row->fd, cell->sample_id, cell->lsb, cell->msb,
+					 &cell->value);
+			cell->valid =3D !ret;
+			if (!ret) {
+				any_read =3D true;
+				continue;
+			}
+
+			/* Report each failing value once, not on every sample */
+			if (!cell->reported) {
+				log_warn("%s: unable to read sample %" PRIu32 ": %s",
+					 row->dev->name, cell->sample_id, strerror(-ret));
+				cell->reported =3D true;
+			}
+		}
+	}
+
+	return any_read;
+}
+
+/* Return: @a - @b. @a must not be earlier than @b. */
+static struct timespec timespec_sub(const struct timespec *a, const struct=
 timespec *b)
+{
+	struct timespec d =3D {
+		.tv_sec =3D a->tv_sec - b->tv_sec,
+		.tv_nsec =3D a->tv_nsec - b->tv_nsec,
+	};
+
+	if (d.tv_nsec < 0) {
+		d.tv_sec--;
+		d.tv_nsec +=3D NSEC_PER_SEC;
+	}
+
+	return d;
+}
+
+/*
+ * Return: the milliseconds from @start to @now. @now must not be earlier
+ * than @start, as with two readings of CLOCK_MONOTONIC.
+ */
+static uint64_t ms_between(const struct timespec *start, const struct time=
spec *now)
+{
+	struct timespec d =3D timespec_sub(now, start);
+	uint64_t sec =3D d.tv_sec;
+
+	return sec * MSEC_PER_SEC + d.tv_nsec / NSEC_PER_MSEC;
+}
+
+static void timespec_add_ms(struct timespec *ts, uint32_t ms)
+{
+	ts->tv_sec +=3D ms / MSEC_PER_SEC;
+	ts->tv_nsec +=3D ms % MSEC_PER_SEC * NSEC_PER_MSEC;
+	if (ts->tv_nsec >=3D NSEC_PER_SEC) {
+		ts->tv_sec++;
+		ts->tv_nsec -=3D NSEC_PER_SEC;
+	}
+}
+
+static bool timespec_before(const struct timespec *a, const struct timespe=
c *b)
+{
+	if (a->tv_sec !=3D b->tv_sec)
+		return a->tv_sec < b->tv_sec;
+
+	return a->tv_nsec < b->tv_nsec;
+}
+
+/*
+ * Wait until @deadline, with the signals of @sigint blocked.
+ * Return: true if SIGINT arrived first.
+ */
+static bool wait_until(const struct timespec *deadline, const sigset_t *si=
gint)
+{
+	struct timespec now, timeout;
+
+	for (;;) {
+		clock_gettime(CLOCK_MONOTONIC, &now);
+		if (!timespec_before(&now, deadline))
+			return false;
+
+		timeout =3D timespec_sub(deadline, &now);
+		/* Otherwise timed out, or interrupted by a stop and continue */
+		if (sigtimedwait(sigint, NULL, &timeout) =3D=3D SIGINT)
+			return true;
+	}
+}
+
+/*
+ * Sample every interval until the count is reached or SIGINT. Samples are
+ * scheduled from the start time, so the interval doesn't drift; a sample
+ * that is due before the previous one finished is skipped. SIGINT is
+ * blocked while sampling, so one that arrives during a read is not lost
+ * but ends the wait for the next sample.
+ */
+static int stat_loop(struct stat_run *run)
+{
+	struct timespec start, next, now;
+	sigset_t sigint, old_mask;
+	bool any_read =3D false;
+
+	sigemptyset(&sigint);
+	sigaddset(&sigint, SIGINT);
+	sigprocmask(SIG_BLOCK, &sigint, &old_mask);
+
+	print_header(run);
+
+	clock_gettime(CLOCK_MONOTONIC, &start);
+	next =3D start;
+
+	for (uint64_t sample =3D 0; ; sample++) {
+		clock_gettime(CLOCK_MONOTONIC, &now);
+
+		if (read_cells(run))
+			any_read =3D true;
+
+		print_sample(run, sample, ms_between(&start, &now));
+
+		if (run->opts.count && sample + 1 =3D=3D run->opts.count)
+			break;
+
+		timespec_add_ms(&next, run->opts.interval_ms);
+		clock_gettime(CLOCK_MONOTONIC, &now);
+		while (timespec_before(&next, &now))
+			timespec_add_ms(&next, run->opts.interval_ms);
+
+		if (wait_until(&next, &sigint))
+			break;
+	}
+
+	sigprocmask(SIG_SETMASK, &old_mask, NULL);
+
+	/* Failed reads show as NaN and are each reported once; fail only if none=
 succeeded */
+	if (!any_read) {
+		log_err("unable to read any telemetry");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+int cmd_stat(int argc, char **argv, const struct pmt_global_opts *gopts)
+{
+	struct stat_run run auto_stat_run =3D {
+		.opts =3D { .interval_ms =3D STAT_DEFAULT_INTERVAL_MS },
+	};
+	const struct pmt_device **devs auto_free =3D NULL;
+	size_t num_devs;
+	int ret;
+
+	ret =3D stat_parse_options(&run.opts, argc, argv);
+	if (ret) {
+		stat_usage_short(stderr);
+		return PMTCTL_EXIT_USER;
+	}
+
+	if (run.opts.show_help) {
+		stat_usage_full(stdout);
+		return PMTCTL_EXIT_OK;
+	}
+
+	ret =3D pmtctl_ctx_init(&run.ctx);
+	if (ret)
+		return PMTCTL_EXIT_SYSTEM;
+
+	ret =3D pmtctl_ctx_load_tss(&run.ctx, gopts->json_path);
+	if (ret)
+		return PMTCTL_EXIT_SYSTEM;
+
+	ret =3D pmtctl_select_devices(&run.ctx, &run.opts.filter, &devs, &num_dev=
s);
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
+	ret =3D build_rows(&run, devs, num_devs);
+	if (ret =3D=3D -ENOMEM) {
+		log_ret(ret, "unable to set up sampling");
+		return PMTCTL_EXIT_SYSTEM;
+	}
+	if (ret)
+		return PMTCTL_EXIT_USER;
+
+	ret =3D check_bounds(&run);
+	if (ret)
+		return PMTCTL_EXIT_USER;
+
+	ret =3D open_telem_files(&run);
+	if (ret)
+		return PMTCTL_EXIT_SYSTEM;
+
+	set_column_widths(&run);
+
+	ret =3D stat_loop(&run);
+	if (ret)
+		return PMTCTL_EXIT_SYSTEM;
+
+	return PMTCTL_EXIT_OK;
+}
diff --git a/tools/arch/x86/pmtctl/src/main.c b/tools/arch/x86/pmtctl/src/m=
ain.c
index 081c33aeb649..dff05c30c7d1 100644
--- a/tools/arch/x86/pmtctl/src/main.c
+++ b/tools/arch/x86/pmtctl/src/main.c
@@ -28,6 +28,7 @@ static void print_usage(FILE *out)
 		"\n"
 		"Commands:\n"
 		"  list      List available PMT devices and metrics\n"
+		"  stat      Sample metrics over time (perf stat-like)\n"
 		"\n"
 		"Run 'pmtctl <command> --help' for command-specific options.\n");
 }
@@ -75,6 +76,9 @@ int main(int argc, char **argv)
 	if (!strcmp(cmd, "list"))
 		return cmd_list(argc - optind, argv + optind, &gopts);
=20
+	if (!strcmp(cmd, "stat"))
+		return cmd_stat(argc - optind, argv + optind, &gopts);
+
 	if (!strcmp(cmd, "help")) {
 		print_usage(stdout);
 		return PMTCTL_EXIT_OK;
--=20
2.53.0

