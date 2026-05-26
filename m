Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001852DB7A3;
	Tue, 26 May 2026 01:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779760081; cv=none; b=iRwLCcT6Da1k+1dZMXDX0HAz5x1vmAvMn0czitFNbcxo3rB3jv7+7p2Pe4SI1eSCoLLtf3wFTBH1Sf2r3S0rLLgW+SfnDCXEsfDid1SgcFd8IDfRg4fdMEn+7eptznQyC8dHHmxB0B4lDJBUnqy00H2d618R92ZJ+yIdPgn2ODY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779760081; c=relaxed/simple;
	bh=b2xgnGB7mGZqG+TaePZWTE5ho5OhbmsvCro9/+VGbiU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e+u42k3J79J6a5TVD79vQyfzEo03PERm3xekjhGOdztL4iUc+tvnlA/2BoB5yqqJIHXYH7Wuio4d9yXGpJL4TGOBELR+ySBl5gbUF85MhHNzP1b8bE8x520SA+8PwmE0UOziHaRNuLGM1fk2U9wVYCiARpRQn+hi/BuNfzSFAfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YkLbMIDr; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YkLbMIDr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779760075; x=1811296075;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=b2xgnGB7mGZqG+TaePZWTE5ho5OhbmsvCro9/+VGbiU=;
  b=YkLbMIDrjuBj6hYjbJTRrlMISTwDNEXX1BCLMdRjSTvOIq114s5i+/Fv
   i2RFlepAgjBXm4S7hWTmHshf5qBohNP2hCKVq111HROo4TpSacJzp6mKj
   dvdQRxstyiGXDeWl6Vy8WK6htOSvYd7QwOdH2DNF1kWvEL7TwNK05dpOh
   oF+QX6lEccFeR/5u+MLKmdrR6Elnv4XIYPxu29zstIbqac+wdHXcstI1Z
   Wg7GgZtsJW1gEWni6RmVtzcAqYngDLd6irGF7DidAg2AbGT/2BUdhmXXJ
   v5rdnv3jHNnBoFoKT+7FNOgHwtc76JDgWzsOdr0ki+IRo6lXqzP576NxB
   A==;
X-CSE-ConnectionGUID: Ws1SM+ZoTby/abc4jYYhQw==
X-CSE-MsgGUID: cHK0qRD7T5eWI+LlvAGn4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80539897"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="80539897"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 18:47:33 -0700
X-CSE-ConnectionGUID: 1iWBZtj/ThC1jjX3WrtdxA==
X-CSE-MsgGUID: dNqpaA+sQaKlEqtZTsPp5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="272074980"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 18:47:33 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 12/17] tools/arch/x86/pmtctl: Add pmtctl CLI entry point and pager
Date: Mon, 25 May 2026 18:47:10 -0700
Message-ID: <20260526014719.2248380-13-david.e.box@linux.intel.com>
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

Add the pmtctl command-line frontend, a user-facing binary built on top of
libpmtctl_core for discovering and inspecting Intel PMT telemetry devices.

Add a built-in pager so wide or lengthy telemetry output remains readable
without requiring users to pipe output through an external pager. The pager
is automatically disabled when output is redirected, preserving
scriptability.

This patch establishes the shared CLI infrastructure and global option
handling used by later subcommands. Subsequent patches add the 'list' and
'stat' commands for device enumeration and live telemetry sampling.

Add top-level Makefile integration so a single 'make' invocation builds
both the library and CLI.

Assisted-by: GitHub-Copilot:claude-opus-4.7
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 tools/arch/x86/pmtctl/Makefile             | 114 +++++++++++++++++
 tools/arch/x86/pmtctl/include/pmtctl_cli.h |  12 ++
 tools/arch/x86/pmtctl/src/main.c           | 134 ++++++++++++++++++++
 tools/arch/x86/pmtctl/src/pager.c          | 140 +++++++++++++++++++++
 4 files changed, 400 insertions(+)
 create mode 100644 tools/arch/x86/pmtctl/Makefile
 create mode 100644 tools/arch/x86/pmtctl/include/pmtctl_cli.h
 create mode 100644 tools/arch/x86/pmtctl/src/main.c
 create mode 100644 tools/arch/x86/pmtctl/src/pager.c

diff --git a/tools/arch/x86/pmtctl/Makefile b/tools/arch/x86/pmtctl/Makefile
new file mode 100644
index 000000000000..83bca8c312e7
--- /dev/null
+++ b/tools/arch/x86/pmtctl/Makefile
@@ -0,0 +1,114 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+CC      ?=3D gcc
+
+BUILD	?=3D release
+
+CPPFLAGS +=3D -Iinclude -Ilib -I../../../include -D_GNU_SOURCE
+CFLAGS   +=3D -std=3Dgnu11 -Wall -Wextra
+
+WEXTRA_WARN :=3D -Wpedantic -Wmissing-prototypes -Wstrict-prototypes \
+               -Wunused-function -Wunused-variable -Wunused-parameter \
+               -Wunused-but-set-variable -Wunreachable-code
+
+ifeq ($(BUILD),debug)
+  CFLAGS +=3D -O0 -g3 -fno-omit-frame-pointer
+  CFLAGS +=3D $(WEXTRA_WARN)
+  CPPFLAGS +=3D -DDEBUG
+else ifeq ($(BUILD),release)
+  CFLAGS +=3D -O2 -g0 -DNDEBUG
+else
+  $(error unknown BUILD '$(BUILD)' (use release or debug))
+endif
+
+JANSSON_CFLAGS :=3D $(shell pkg-config --cflags jansson 2>/dev/null)
+JANSSON_LIBS   :=3D $(shell pkg-config --libs   jansson 2>/dev/null)
+ifeq ($(JANSSON_LIBS),)
+  $(error jansson not found: install libjansson-dev (Debian/Ubuntu) or jan=
sson-devel (Fedora/RHEL))
+endif
+CPPFLAGS +=3D $(JANSSON_CFLAGS)
+LDLIBS   :=3D $(JANSSON_LIBS) -lm
+
+SRCDIR  :=3D src
+BUILDDIR:=3D build/$(BUILD)
+TARGET  :=3D pmtctl
+LIBDIR  :=3D lib
+LIBPMTCTL_CORE      :=3D $(BUILDDIR)/lib/libpmtctl_core.a
+LIBPMTCTL_ARTIFACTS :=3D $(LIBPMTCTL_CORE)
+LIBPMTCTL_STAMP :=3D $(BUILDDIR)/lib/.built
+SAMPLE_SRC :=3D samples/libpmtctl_sample.c
+SAMPLE_TARGET :=3D $(BUILDDIR)/samples/libpmtctl_sample
+
+SRC :=3D \
+	$(SRCDIR)/main.c \
+	$(SRCDIR)/pager.c
+
+OBJ :=3D $(patsubst $(SRCDIR)/%.c,$(BUILDDIR)/%.o,$(SRC))
+CLEAN_BUILDS :=3D release debug
+
+.PHONY: all clean libpmtctl_core sample FORCE
+
+all: $(TARGET)
+
+$(TARGET): $(OBJ) $(LIBPMTCTL_ARTIFACTS)
+	$(CC) $(CFLAGS) -o $@ $(OBJ) $(LIBPMTCTL_ARTIFACTS) $(LDLIBS)
+
+libpmtctl_core: $(LIBPMTCTL_CORE)
+
+sample: $(SAMPLE_TARGET)
+
+# Build the sample with the public-header search path only, so its
+# `#include "pmtctl.h"` resolves the same way it would for an external
+# consumer linking against the installed libpmtctl_core.
+$(SAMPLE_TARGET): CPPFLAGS +=3D -Iinclude/lib
+$(SAMPLE_TARGET): $(SAMPLE_SRC) $(LIBPMTCTL_ARTIFACTS)
+	@mkdir -p $(dir $@)
+	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ $< $(LIBPMTCTL_ARTIFACTS) $(LDLIBS)
+
+$(LIBPMTCTL_ARTIFACTS): $(LIBPMTCTL_STAMP)
+
+$(LIBPMTCTL_STAMP): FORCE
+	$(MAKE) -C $(LIBDIR) BUILD=3D$(BUILD)
+	@mkdir -p $(dir $@)
+	@touch $@
+
+FORCE:
+
+# Install settings
+PREFIX ?=3D /usr/local
+DESTDIR ?=3D
+
+
+.PHONY: install uninstall install-lib install-headers install-pkgconfig un=
install-lib uninstall-headers uninstall-pkgconfig
+
+install: $(TARGET) install-lib install-headers install-pkgconfig
+	install -d $(DESTDIR)$(PREFIX)/bin
+	install -m 0755 $(TARGET) $(DESTDIR)$(PREFIX)/bin
+	@echo "Installed $(TARGET) to $(DESTDIR)$(PREFIX)/bin/"
+
+install-lib:
+	$(MAKE) -C $(LIBDIR) BUILD=3D$(BUILD) PREFIX=3D$(PREFIX) DESTDIR=3D$(DEST=
DIR) install-lib
+
+install-headers:
+	$(MAKE) -C $(LIBDIR) BUILD=3D$(BUILD) PREFIX=3D$(PREFIX) DESTDIR=3D$(DEST=
DIR) install-headers
+
+install-pkgconfig:
+	$(MAKE) -C $(LIBDIR) BUILD=3D$(BUILD) PREFIX=3D$(PREFIX) DESTDIR=3D$(DEST=
DIR) install-pkgconfig
+
+uninstall:
+	rm -f $(DESTDIR)$(PREFIX)/bin/$(TARGET)
+	$(MAKE) -C $(LIBDIR) BUILD=3D$(BUILD) PREFIX=3D$(PREFIX) DESTDIR=3D$(DEST=
DIR) uninstall-lib
+	$(MAKE) -C $(LIBDIR) BUILD=3D$(BUILD) PREFIX=3D$(PREFIX) DESTDIR=3D$(DEST=
DIR) uninstall-headers
+	$(MAKE) -C $(LIBDIR) BUILD=3D$(BUILD) PREFIX=3D$(PREFIX) DESTDIR=3D$(DEST=
DIR) uninstall-pkgconfig
+	@echo "Removed $(DESTDIR)$(PREFIX)/bin/$(TARGET) (if present)"
+
+$(BUILDDIR)/%.o: $(SRCDIR)/%.c
+	@mkdir -p $(BUILDDIR)
+	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@
+
+clean:
+	@for build_type in $(CLEAN_BUILDS); do \
+		$(MAKE) -C $(LIBDIR) BUILD=3D$$build_type clean; \
+		rm -rf build/$$build_type; \
+	done
+	rm -rf $(BUILDDIR) $(TARGET)
diff --git a/tools/arch/x86/pmtctl/include/pmtctl_cli.h b/tools/arch/x86/pm=
tctl/include/pmtctl_cli.h
new file mode 100644
index 000000000000..0b99dfe0ed64
--- /dev/null
+++ b/tools/arch/x86/pmtctl/include/pmtctl_cli.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef PMTCTL_CLI_H
+#define PMTCTL_CLI_H
+
+#include <stdio.h>
+
+#include "lib/pmtctl.h"
+
+FILE *pmtctl_start_pager(const struct pmt_global_opts *gopts);
+void pmtctl_finish_pager(FILE *out);
+
+#endif
diff --git a/tools/arch/x86/pmtctl/src/main.c b/tools/arch/x86/pmtctl/src/m=
ain.c
new file mode 100644
index 000000000000..e93b544d9343
--- /dev/null
+++ b/tools/arch/x86/pmtctl/src/main.c
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <stdbool.h>
+#include <getopt.h>
+
+#include "lib/log.h"
+
+#include "pmtctl_cli.h"
+
+#define PMTCTL_VERSION	"2026.05.19"
+#define OPT_DEBUG 256
+
+static struct pmt_global_opts gopts =3D {
+	.device_selector =3D NULL,
+	.json_path	=3D NULL,
+	.quiet		=3D false,
+	.debug		=3D false,
+};
+
+static void print_usage(FILE *out)
+{
+	fprintf(out,
+		"Usage: pmtctl [global options] <command> [command options] ...\n"
+		"\n"
+		"Query Intel Platform Monitoring Technology (PMT) metrics.\n"
+		"\n"
+		"Global options:\n"
+		"  -h, --help		   Show this help and exit\n"
+		"  -V, --version	   Show version and exit\n"
+		"\n"
+		"  -J, --json-file <path>  Metrics JSON file\n"
+		"                          If omitted, no metric definitions are loaded\=
n"
+		"                          or search a default path (e.g. $PMTCTL_JSON_P=
ATH).\n"
+		"\n"
+		"  -d, --device <selector> Restrict to a single endpoint.\n"
+		"                          Can be supplied either before the command (gl=
obal)\n"
+		"                          or after the command as a command-local fallb=
ack.\n"
+		"                          Global value takes precedence when both are g=
iven.\n"
+		"                          Selectors: guid=3D<hex>, ep=3D<endpoint_name>=
\n"
+		"\n"
+		"  -q, --quiet             Suppress non-essential messages\n"
+		"      --debug             Enable debug logging\n"
+	);
+}
+
+static void print_version(void)
+{
+	printf("pmtctl version %s - David E. Box <david.e.box@linux.intel.com>\n"=
, PMTCTL_VERSION);
+}
+
+static int cmd_dispatch(int argc, char **argv)
+{
+	const struct option long_options[] =3D {
+		{ "help",        no_argument,       0, 'h' },
+		{ "version",     no_argument,       0, 'V' },
+		{ "json-file",   required_argument, 0, 'J' },
+		{ "device",      required_argument, 0, 'd' },
+		{ "quiet",       no_argument,       0, 'q' },
+		{ "debug",       no_argument,       0,  OPT_DEBUG },
+		{ 0,             0,                 0,  0  }
+	};
+	const char *cmd;
+	int option_index =3D 0;
+	int opt;
+
+	while ((opt =3D getopt_long(argc, argv, "+hVJ:qd:", long_options, &option=
_index)) !=3D -1) {
+		switch (opt) {
+		case 'h':
+			print_usage(stdout);
+			return 0;
+		case 'V':
+			print_version();
+			return 0;
+		case 'J':
+			gopts.json_path =3D optarg;
+			break;
+		case 'd':
+			if (gopts.device_selector)
+				return log_ret(PMTCTL_ERR_CMD_PARSE,
+					   "multiple --device options are not allowed");
+			gopts.device_selector =3D optarg;
+			break;
+		case 'q':
+			gopts.quiet =3D true;
+			break;
+		case OPT_DEBUG:
+			gopts.debug =3D true;
+			break;
+		case '?':
+		default:
+			/* getopt_long already printed an error */
+			fprintf(stderr, "Try 'pmtctl --help' for usage.\n");
+			return PMTCTL_ERR_CMD_PARSE;
+		}
+	}
+
+	if (optind >=3D argc) {
+		fprintf(stderr, "pmtctl: missing command\n");
+		print_usage(stderr);
+		return PMTCTL_ERR_CMD_PARSE;
+	}
+
+	cmd =3D argv[optind];
+	if (!strcmp(cmd, "--help") || !strcmp(cmd, "help")) {
+		print_usage(stdout);
+		return 0;
+	}
+
+	fprintf(stderr, "pmtctl: unknown command '%s'\n", cmd);
+	fprintf(stderr, "Run 'pmtctl --help' for a list of commands.\n");
+	return PMTCTL_ERR_CMD_PARSE;
+}
+
+int main(int argc, char **argv)
+{
+	int ret =3D cmd_dispatch(argc, argv);
+
+	pmtctl_cleanup();
+
+	/*
+	 * Collapse internal error codes to conventional exit values.
+	 * Granular error details are printed to stderr by log_ret().
+	 * 0 =3D success, PMTCTL_EXIT_USER (1) =3D usage/user error,
+	 * PMTCTL_EXIT_SYSTEM (2) =3D device/system error.
+	 */
+	if (ret =3D=3D 0)
+		return 0;
+	else if (ret > 0)
+		return PMTCTL_EXIT_USER;
+	else
+		return PMTCTL_EXIT_SYSTEM;
+}
diff --git a/tools/arch/x86/pmtctl/src/pager.c b/tools/arch/x86/pmtctl/src/=
pager.c
new file mode 100644
index 000000000000..a9329293da84
--- /dev/null
+++ b/tools/arch/x86/pmtctl/src/pager.c
@@ -0,0 +1,140 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#define LOG_PREFIX "pager"
+#define _XOPEN_SOURCE 700
+#include <errno.h>
+#include <signal.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <sys/types.h>
+#include <sys/wait.h>
+
+#include "lib/pmtctl.h"
+#include "lib/common.h"
+#include "lib/log.h"
+
+#include "pmtctl_cli.h"
+
+static FILE *pager_fp;
+static pid_t pager_pid;
+
+/* Maximum number of whitespace-separated tokens parsed from $PAGER. */
+#define PAGER_ARGV_MAX	16
+
+static bool env_false(const char *v)
+{
+	return !*v || !strcmp(v, "0") || !strcasecmp(v, "false") || !strcasecmp(v=
, "no") ||
+	       !strcasecmp(v, "off");
+}
+
+FILE *pmtctl_start_pager(const struct pmt_global_opts *gopts)
+{
+	(void)gopts;
+
+	/* Ignore SIGPIPE to handle pager closing early */
+	signal(SIGPIPE, SIG_IGN);
+
+	/* Already using a pager? Just reuse it. */
+	if (pager_fp)
+		return pager_fp;
+
+	/* Don't page if stdout is not a TTY. */
+	if (!isatty(STDOUT_FILENO))
+		return stdout;
+
+	/* Opt-out env: PMTCTL_NOPAGER=3D1 */
+	const char *nopager =3D getenv("PMTCTL_NOPAGER");
+	const char *pager_env;
+	int fds[2];
+	pid_t pid;
+	FILE *fp;
+
+	if (nopager && !env_false(nopager))
+		return stdout;
+
+	/* Choose pager: PMTCTL_PAGER > PAGER > "less" */
+	pager_env =3D getenv("PMTCTL_PAGER");
+	if (!pager_env || !*pager_env)
+		pager_env =3D getenv("PAGER");
+	if (!pager_env || !*pager_env)
+		pager_env =3D "less";
+
+	if (pipe(fds) < 0) {
+		log_err(errno, "pipe for pager failed");
+		return stdout;
+	}
+
+	pid =3D fork();
+	if (pid < 0) {
+		log_err(errno, "fork for pager failed");
+		close(fds[0]);
+		close(fds[1]);
+		return stdout;
+	}
+
+	if (pid =3D=3D 0) {
+		/* Child: exec pager, reading from pipe */
+		close(fds[1]);
+
+		if (fds[0] !=3D STDIN_FILENO) {
+			if (dup2(fds[0], STDIN_FILENO) < 0)
+				_exit(1);
+			close(fds[0]);
+		}
+
+		/* build argv from pager_env (very simple split on spaces) */
+		char *argv[PAGER_ARGV_MAX];
+		char *cmd =3D strdup(pager_env);
+		char *tok;
+		int argc =3D 0;
+
+		if (!cmd)
+			_exit(1);
+
+		tok =3D strtok(cmd, " ");
+		while (tok && argc < (int)ARRAY_SIZE(argv) - 1) {
+			argv[argc++] =3D tok;
+			tok =3D strtok(NULL, " ");
+		}
+		argv[argc] =3D NULL;
+
+		execvp(argv[0], argv);
+		/* If exec fails */
+		_exit(1);
+	}
+
+	/* Parent */
+	close(fds[0]);
+	fp =3D fdopen(fds[1], "w");
+	if (!fp) {
+		log_err(errno, "fdopen for pager failed");
+		close(fds[1]);
+		/* We spawned a child; best effort wait and fall back */
+		int status;
+		(void)waitpid(pid, &status, 0);
+		return stdout;
+	}
+
+	pager_pid =3D pid;
+	pager_fp  =3D fp;
+	return pager_fp;
+}
+
+void pmtctl_finish_pager(FILE *out)
+{
+	if (!pager_fp || out !=3D pager_fp) {
+		/* No pager or not ours */
+		return;
+	}
+
+	fclose(pager_fp);
+	pager_fp =3D NULL;
+
+	if (pager_pid > 0) {
+		int status;
+		(void)waitpid(pager_pid, &status, 0);
+		pager_pid =3D 0;
+	}
+}
--=20
2.43.0

