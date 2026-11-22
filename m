Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795376059;
	b=eqU4PdMbYjheNDdaRKQZICEMAFS+jH6sKVIkiSw489FWLDCTmndClMzV7wEHJcrv2DHD
	 1YrHuKoH1iW3lvJjQcOwhIzXUbse2zfG1vWJW8OiGQCj6xeFLNecsT2hpNr/Z7ZjtUWNT
	 JFxL1RYT43ngPT6qD5zALlOaOGxxJaQalk/ZG4lg7nduxlAbuVhPgGQnhfsPbj/Xf1uWh
	 s/g/iUU7J41UR4eSZI0sz0puMi6I/Mk97HMYtb7Vv08BIBqE2s4ZrI4uJguFSIoFvieIo
	 DiCnh4LnsDbXurWUVvTCliVRRhNqouIf0JRN0OJAL3CU1fDTdzl9J/neyO3Ki+51t2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795376059;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qX+JO5jC90ne1w9GzA8sIhprGIiKji7c9YgmThPrmfk=;
	b=SJPlMLOC8Fmb7EC4nQWK1R+mu8WbCn5VHRbE9nnmMnB2SJQWpPQqyk9GD4D5amf/fvkh
	 PX3oxCn6fJHgH0MFrveURdZBeQ6ERJ1sdp4psLorwg0SHFm7wQnpmIkgy841WmLfEDpd9
	 11bjMIBVAnibhE1ggxbFiPjC8fzcmlxBIdb2gNp4l1vriG/AXHnxKuaGZZtMjlaMO9JO0
	 aOzUjvTJK5qdOq/jTQbNiUKeHQmaSLeFKlp4k82zQxjV6VeqDGZRRCXRodCKQI+Pd5CaI
	 7ASBK+5AifaqD/WBrTGvWng3x4l7AsXVsgdRNn8AcqZMuMem0Ui5jEKLnlYmxXr6vGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gl1jsn4d;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A017D606A31D;
	Sun, 22 Nov 2026 19:34:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A017D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gl1jsn4d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795376058; x=1826912058;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OcnOgggz80lchgDCsw/UJF5qzDMq15FfU00b6PbHsOA=;
  b=gl1jsn4dp9bQ0YvUu+3Y60RR+ZnMYMBLH33+BmyZQBfFU3JGWA4h3d2T
   PaLijjZ6IMKGYV+4d7WwpGJyUT5JFNModGK+9JwgOYKpVH4lYmCYTugI6
   vcm+iQvt9BM20xQhD76HCdRV2B7ln0MTADB3jiRHLacgM+OXywZkFcdSx
   3GsPK9tcSglfTDKjFZ9GJeumTQe49M1iSkBXwb+n/8sYyEdTNwF3yQbKs
   kpXbBxZkeC2pjbm3wvuksomzIeFQYzKAGCPwHou46BZ1KMUe8oZ29Sqjy
   +e7bZVRwicJZXwU4NVq1Rb8ymfb8lM5W5sCHIAxWfINaSY9DFN/hLaake
   Q==;
X-CSE-ConnectionGUID: HJldRj4ISHmBopBI7zlipw==
X-CSE-MsgGUID: +Sqd6I87SdqolVXeWHaHWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4217503"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4217503"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 11:34:17 -0800
X-CSE-ConnectionGUID: gAq2B6slQ0+lEYWOW6A/mg==
X-CSE-MsgGUID: I+HzzRtrS9+9rAWJCGKcEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11109787"
Received: from debox1-desk4.jf.intel.com (HELO localhost) ([10.54.77.98])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 11:34:18 -0800
From: "David E. Box" <david.e.box@linux.intel.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/12] tools/arch/x86/pmtctl: Add pmtctl skeleton
Date: Sun, 22 Nov 2026 11:33:56 -0800
Message-ID: <bd7a852b721534fc09564587697d5b8727e7916a.1795374925.git.david.e.box@linux.intel.com>
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

Intel Platform Monitoring Technology (PMT) exposes hardware telemetry
through the pmt_telemetry driver in sysfs. Each telemetry device
provides a binary data file whose layout is described by
platform-specific metric definitions that are published separately.

Add the skeleton of pmtctl, a command-line tool for discovering PMT
telemetry devices and sampling their metrics: the build, the logging
helpers and the main entry point with global option handling. The
commands are added in follow-up patches.

The tool exits with 0 on success, 1 if the request is wrong (an invalid
option or value, or nothing matches the selection) and 2 if carrying it
out fails. Library code returns 0 or a negative errno, and each command
maps errors to an exit status.

Errors and warnings go to stderr as "pmtctl: <level>: <message>".

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
V2 changes:
  - New patch: the Makefile, logging and main() from v1 03 and 12, so
    the tool builds from the first patch.
  - Logging is errors and warnings only; -q and --debug are dropped (v1
    parsed them but never applied them).
  - Library code returns 0 or -errno and never calls exit(); commands
    map errors to the exit statuses 0/1/2.
  - One plain Makefile, like the other tools in tools/arch/x86.

 tools/arch/x86/pmtctl/.gitignore           |  2 +
 tools/arch/x86/pmtctl/Makefile             | 25 ++++++++
 tools/arch/x86/pmtctl/include/lib/log.h    | 23 +++++++
 tools/arch/x86/pmtctl/include/pmtctl_cli.h | 12 ++++
 tools/arch/x86/pmtctl/lib/log.c            | 41 ++++++++++++
 tools/arch/x86/pmtctl/src/main.c           | 72 ++++++++++++++++++++++
 6 files changed, 175 insertions(+)
 create mode 100644 tools/arch/x86/pmtctl/.gitignore
 create mode 100644 tools/arch/x86/pmtctl/Makefile
 create mode 100644 tools/arch/x86/pmtctl/include/lib/log.h
 create mode 100644 tools/arch/x86/pmtctl/include/pmtctl_cli.h
 create mode 100644 tools/arch/x86/pmtctl/lib/log.c
 create mode 100644 tools/arch/x86/pmtctl/src/main.c

diff --git a/tools/arch/x86/pmtctl/.gitignore b/tools/arch/x86/pmtctl/.giti=
gnore
new file mode 100644
index 000000000000..3bd0d7c1b61a
--- /dev/null
+++ b/tools/arch/x86/pmtctl/.gitignore
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+pmtctl
diff --git a/tools/arch/x86/pmtctl/Makefile b/tools/arch/x86/pmtctl/Makefile
new file mode 100644
index 000000000000..0595d6617920
--- /dev/null
+++ b/tools/arch/x86/pmtctl/Makefile
@@ -0,0 +1,25 @@
+# SPDX-License-Identifier: GPL-2.0
+# Makefile for Intel Platform Monitoring Technology (PMT) tool
+
+BINDIR ?=3D /usr/sbin
+
+CFLAGS =3D -Wextra
+
+override CFLAGS +=3D -O2 -Wall -D_GNU_SOURCE -Iinclude -I../../../include
+
+OBJS :=3D \
+	lib/log.o \
+	src/main.o
+
+pmtctl: $(OBJS)
+	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LDLIBS)
+
+$(OBJS): $(wildcard include/*.h include/lib/*.h)
+
+.PHONY: clean install
+clean:
+	@rm -f pmtctl $(OBJS)
+
+install: pmtctl
+	install -d $(DESTDIR)$(BINDIR)
+	install -m 755 -p pmtctl $(DESTDIR)$(BINDIR)/pmtctl
diff --git a/tools/arch/x86/pmtctl/include/lib/log.h b/tools/arch/x86/pmtct=
l/include/lib/log.h
new file mode 100644
index 000000000000..2006b5b50637
--- /dev/null
+++ b/tools/arch/x86/pmtctl/include/lib/log.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef PMTCTL_LOG_H
+#define PMTCTL_LOG_H
+
+#include <linux/compiler.h>
+
+enum pmtctl_log_level {
+	PMTCTL_LOG_ERROR,
+	PMTCTL_LOG_WARN,
+};
+
+void log_msg(enum pmtctl_log_level level, const char *fmt, ...) __printf(2=
, 3);
+
+/*
+ * Log an error with the strerror() text of @ret appended and return @ret.
+ * @ret must be a negative errno value.
+ */
+int log_ret(int ret, const char *fmt, ...) __printf(2, 3);
+
+#define log_err(fmt, ...)	log_msg(PMTCTL_LOG_ERROR, fmt, ##__VA_ARGS__)
+#define log_warn(fmt, ...)	log_msg(PMTCTL_LOG_WARN, fmt, ##__VA_ARGS__)
+
+#endif
diff --git a/tools/arch/x86/pmtctl/include/pmtctl_cli.h b/tools/arch/x86/pm=
tctl/include/pmtctl_cli.h
new file mode 100644
index 000000000000..550a61b97aca
--- /dev/null
+++ b/tools/arch/x86/pmtctl/include/pmtctl_cli.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef PMTCTL_CLI_H
+#define PMTCTL_CLI_H
+
+/* Process exit status, see EXIT STATUS in pmtctl(8) */
+enum pmtctl_exit {
+	PMTCTL_EXIT_OK,
+	PMTCTL_EXIT_USER,
+	PMTCTL_EXIT_SYSTEM,
+};
+
+#endif
diff --git a/tools/arch/x86/pmtctl/lib/log.c b/tools/arch/x86/pmtctl/lib/lo=
g.c
new file mode 100644
index 000000000000..87a24d076cb2
--- /dev/null
+++ b/tools/arch/x86/pmtctl/lib/log.c
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <stdarg.h>
+#include <stdio.h>
+#include <string.h>
+
+#include "lib/log.h"
+
+static const char * const log_tags[] =3D {
+	[PMTCTL_LOG_ERROR]	=3D "error",
+	[PMTCTL_LOG_WARN]	=3D "warning",
+};
+
+static __printf(3, 0)
+void log_vmsg(enum pmtctl_log_level level, int err, const char *fmt, va_li=
st ap)
+{
+	fprintf(stderr, "pmtctl: %s: ", log_tags[level]);
+	vfprintf(stderr, fmt, ap);
+	if (err)
+		fprintf(stderr, ": %s", strerror(-err));
+	fputc('\n', stderr);
+}
+
+void log_msg(enum pmtctl_log_level level, const char *fmt, ...)
+{
+	va_list ap;
+
+	va_start(ap, fmt);
+	log_vmsg(level, 0, fmt, ap);
+	va_end(ap);
+}
+
+int log_ret(int ret, const char *fmt, ...)
+{
+	va_list ap;
+
+	va_start(ap, fmt);
+	log_vmsg(PMTCTL_LOG_ERROR, ret, fmt, ap);
+	va_end(ap);
+
+	return ret;
+}
diff --git a/tools/arch/x86/pmtctl/src/main.c b/tools/arch/x86/pmtctl/src/m=
ain.c
new file mode 100644
index 000000000000..25aedef59cf5
--- /dev/null
+++ b/tools/arch/x86/pmtctl/src/main.c
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * pmtctl: query Intel Platform Monitoring Technology (PMT) telemetry
+ */
+#include <getopt.h>
+#include <stdio.h>
+#include <string.h>
+
+#include "lib/log.h"
+#include "pmtctl_cli.h"
+
+#define PMTCTL_VERSION	"2026.11.22"
+
+static void print_usage(FILE *out)
+{
+	fprintf(out,
+		"Usage: pmtctl [global options] <command> [command options] ...\n"
+		"\n"
+		"Query Intel Platform Monitoring Technology (PMT) metrics.\n"
+		"\n"
+		"Global options:\n"
+		"  -h, --help              Show this help and exit\n"
+		"  -V, --version           Show version and exit\n"
+		"\n"
+		"Run 'pmtctl <command> --help' for command-specific options.\n");
+}
+
+int main(int argc, char **argv)
+{
+	static const struct option long_opts[] =3D {
+		{ "help",	no_argument,	NULL, 'h' },
+		{ "version",	no_argument,	NULL, 'V' },
+		{}
+	};
+	const char *cmd;
+	int opt;
+
+	/* '+' stops at the first non-option: the command name */
+	while ((opt =3D getopt_long(argc, argv, "+hV", long_opts, NULL)) !=3D -1)=
 {
+		switch (opt) {
+		case 'h':
+			print_usage(stdout);
+			return PMTCTL_EXIT_OK;
+		case 'V':
+			printf("pmtctl version %s - David E. Box <david.e.box@linux.intel.com>\=
n",
+			       PMTCTL_VERSION);
+			return PMTCTL_EXIT_OK;
+		default:
+			/* getopt_long() already printed an error */
+			fprintf(stderr, "Try 'pmtctl --help' for usage.\n");
+			return PMTCTL_EXIT_USER;
+		}
+	}
+
+	if (optind >=3D argc) {
+		log_err("missing command");
+		print_usage(stderr);
+		return PMTCTL_EXIT_USER;
+	}
+
+	cmd =3D argv[optind];
+
+	if (!strcmp(cmd, "help")) {
+		print_usage(stdout);
+		return PMTCTL_EXIT_OK;
+	}
+
+	log_err("unknown command '%s'", cmd);
+	fprintf(stderr, "Run 'pmtctl --help' for a list of commands.\n");
+
+	return PMTCTL_EXIT_USER;
+}
--=20
2.53.0

