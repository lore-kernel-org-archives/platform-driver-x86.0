Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7813D2F0680;
	Tue, 26 May 2026 01:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779760086; cv=none; b=UyBTgfpLxZlLrkq9ksa8JfYQz2gT+gPHqy7bwFe5qzt3to/Mzb7ibWDGFQAsP+IZ5sDZr5xYDDjNcgsyGOcacW5Ew9G334UwAajdyh6gETKKSrRJxXkVGu2L2CZeFCh0BIwDgXv22GhCfdO763KaaH9M0oR/0gFnrMTpqBhip20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779760086; c=relaxed/simple;
	bh=Q0kZd9AkRIAylBdB4iLSZsHpcU63wKqzvCk3k2oCk6g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hhg6JCO5T3Rb4dYXHjlqPOvZF3JVXApCL6PJOWxkihRhPQVnINclC6CM0jlAChcv5e9kYIPFb52JJ4DV8J2HvjRnicD6U1pjwvl1VRx/JwGDIuxhnmfwk1UO9eX0EhLzrMR0VInm08xaEXRyRD8/CBV+qB0Ak2ogIkGS9Boh0ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UjY5nVfr; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UjY5nVfr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779760085; x=1811296085;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Q0kZd9AkRIAylBdB4iLSZsHpcU63wKqzvCk3k2oCk6g=;
  b=UjY5nVfrey6fiGPGnIH+p8C4YcFHvpyHh+cJT2liLZOQ6X4yjl6tQvdR
   5JkZx8BNzN9Ru/xCF0WwzN0eK1dMSyzT418ruCFw/CJHgmSuIQLyZKjqO
   AGfugy9w8PoaKkYlvvNQBl/GhdP/U2O+95zUkggTlsWA2LMZ3/UxZjj9w
   DKJipKLVIrs2EEgllvF8h8kfUZSjYIfg9LgKN3xzSsTswBmIv+lfy5z6v
   SonNCS+cVbeRODJyXqKUTOgbXoB/iEu/BmFm7/mStFPRVGQdHNN76W191
   uffyAbZ0uY0uHidhRG657fvhcikzAXnpoHhVwAjf6XLGM7t5hgLUThJj5
   Q==;
X-CSE-ConnectionGUID: BdAHf3oUQ0i7NxLzmY8BAg==
X-CSE-MsgGUID: IX592ymrQPOb1yq2EKGZGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80539902"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="80539902"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 18:47:34 -0700
X-CSE-ConnectionGUID: X3mLTRc+SVKYBWWbLYYa2g==
X-CSE-MsgGUID: +4QSEVGTQsijiEa0S9T+Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="272074985"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 18:47:33 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 17/17] tools/arch/x86/pmtctl: Add man page
Date: Mon, 25 May 2026 18:47:15 -0700
Message-ID: <20260526014719.2248380-18-david.e.box@linux.intel.com>
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

Add a man page for pmtctl describing the command-line interface, the
list and stat subcommands, common options, and output formats.

Assisted-by: GitHub-Copilot:claude-opus-4.7
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 tools/arch/x86/pmtctl/Makefile  |   6 +
 tools/arch/x86/pmtctl/README.md |   3 +
 tools/arch/x86/pmtctl/pmtctl.8  | 317 ++++++++++++++++++++++++++++++++
 3 files changed, 326 insertions(+)
 create mode 100644 tools/arch/x86/pmtctl/pmtctl.8

diff --git a/tools/arch/x86/pmtctl/Makefile b/tools/arch/x86/pmtctl/Makefile
index d55819372f79..a8e76e84d7c5 100644
--- a/tools/arch/x86/pmtctl/Makefile
+++ b/tools/arch/x86/pmtctl/Makefile
@@ -152,6 +152,7 @@ $(GENERATED_DIR)/builtin_defs.c: $(GEN_DEFS_SCRIPT) $(D=
EFS_JSON)
 # Install settings
 PREFIX ?=3D /usr/local
 DESTDIR ?=3D
+MANDIR ?=3D $(PREFIX)/share/man
=20
=20
 .PHONY: install uninstall install-lib install-headers install-pkgconfig un=
install-lib uninstall-headers uninstall-pkgconfig
@@ -159,7 +160,10 @@ DESTDIR ?=3D
 install: $(TARGET) install-lib install-headers install-pkgconfig
 	install -d $(DESTDIR)$(PREFIX)/bin
 	install -m 0755 $(TARGET) $(DESTDIR)$(PREFIX)/bin
+	install -d $(DESTDIR)$(MANDIR)/man8
+	install -m 0644 pmtctl.8 $(DESTDIR)$(MANDIR)/man8/pmtctl.8
 	@echo "Installed $(TARGET) to $(DESTDIR)$(PREFIX)/bin/"
+	@echo "Installed pmtctl.8 to $(DESTDIR)$(MANDIR)/man8/"
=20
 install-lib:
 	$(MAKE) -C $(LIBDIR) BUILD=3D$(BUILD) PREFIX=3D$(PREFIX) DESTDIR=3D$(DEST=
DIR) install-lib
@@ -172,10 +176,12 @@ install-pkgconfig:
=20
 uninstall:
 	rm -f $(DESTDIR)$(PREFIX)/bin/$(TARGET)
+	rm -f $(DESTDIR)$(MANDIR)/man8/pmtctl.8
 	$(MAKE) -C $(LIBDIR) BUILD=3D$(BUILD) PREFIX=3D$(PREFIX) DESTDIR=3D$(DEST=
DIR) uninstall-lib
 	$(MAKE) -C $(LIBDIR) BUILD=3D$(BUILD) PREFIX=3D$(PREFIX) DESTDIR=3D$(DEST=
DIR) uninstall-headers
 	$(MAKE) -C $(LIBDIR) BUILD=3D$(BUILD) PREFIX=3D$(PREFIX) DESTDIR=3D$(DEST=
DIR) uninstall-pkgconfig
 	@echo "Removed $(DESTDIR)$(PREFIX)/bin/$(TARGET) (if present)"
+	@echo "Removed $(DESTDIR)$(MANDIR)/man8/pmtctl.8 (if present)"
 defs: $(GENERATED_DIR)/builtin_defs.c
 	@if [ -f $(GENERATED_DIR)/builtin_defs.c ]; then \
 		echo "Generated defs in $(GENERATED_DIR)/builtin_defs.c"; \
diff --git a/tools/arch/x86/pmtctl/README.md b/tools/arch/x86/pmtctl/README=
.md
index 0827ff20fc86..865c7af2c266 100644
--- a/tools/arch/x86/pmtctl/README.md
+++ b/tools/arch/x86/pmtctl/README.md
@@ -260,6 +260,9 @@ Installs:
 - `lib/libpmtctl_core.a`
 - `include/pmtctl/{pmtctl.h,metrics_db.h,device.h}`
 - `lib/pkgconfig/libpmtctl-core.pc`
+- `share/man/man8/pmtctl.8`
+
+Override `MANDIR` (default `$(PREFIX)/share/man`) to relocate the man page.
=20
 Uninstall:
=20
diff --git a/tools/arch/x86/pmtctl/pmtctl.8 b/tools/arch/x86/pmtctl/pmtctl.8
new file mode 100644
index 000000000000..f79480f9febf
--- /dev/null
+++ b/tools/arch/x86/pmtctl/pmtctl.8
@@ -0,0 +1,317 @@
+.\" SPDX-License-Identifier: GPL-2.0-only
+.TH PMTCTL 8 "May 2026" "Linux" "System Administration"
+.SH NAME
+pmtctl \- query Intel Platform Monitoring Technology (PMT) telemetry metri=
cs
+.SH SYNOPSIS
+.B pmtctl
+.RI [ "global options" ]
+.B list
+.RI [ options ]
+.br
+.B pmtctl
+.RI [ "global options" ]
+.B stat
+.RI [ options ]
+.BR \-e\ \fImetric\fR[,\fImetric\fR...]\ ...
+.br
+.B pmtctl
+.RI [ "global options" ]
+.B stat
+.RI [ options ]
+.BR \-\-raw\ id=3D \fIN\fR [,lsb=3D \fIN\fR ][,msb=3D \fIN\fR ]\ ...
+.SH DESCRIPTION
+.B pmtctl
+is a command-line tool for inspecting and sampling Intel Platform
+Monitoring Technology (PMT) telemetry exposed through the kernel
+.B pmt_telemetry
+auxiliary driver
+.RB ( /sys/bus/auxiliary/drivers/pmt_telemetry ).
+.PP
+Metric definitions can come from one of two sources:
+.IP \(bu 2
+Built-in definitions compiled into the binary at build time from
+the Intel PMT XML descriptions (used when
+.B \-J
+is not given).
+.IP \(bu 2
+A runtime JSON file or directory supplied with
+.BR \-J / \-\-json\-file .
+.PP
+Most operations require access to PMT telemetry files and therefore
+typically need to be run as
+.BR root .
+.PP
+.B pmtctl
+also installs a reusable C library
+.RB ( libpmtctl_core )
+and public headers under
+.IR <prefix>/include/pmtctl/ ;
+see
+.B SEE ALSO
+below.
+.SH GLOBAL OPTIONS
+.TP
+.BR \-h ", " \-\-help
+Show help and exit.
+.TP
+.BR \-V ", " \-\-version
+Show version and exit.
+.TP
+.BR \-J ", " "\-\-json\-file " \fIpath\fR
+Load metric definitions from the given JSON file or directory at
+runtime. When omitted, the built-in definitions (if any) compiled
+into the binary are used.
+.TP
+.BR \-d ", " "\-\-device " \fIselector\fR
+Restrict operation to a single PMT endpoint. The selector takes one
+of the following forms:
+.RS
+.IP \fBguid=3D\fIhex\fR
+Match by 32-bit PMT GUID, e.g. \fBguid=3D27971628\fR.
+.IP \fBep=3D\fIname\fR
+Match by endpoint name as reported by \fBpmtctl list \-\-devices\fR.
+.RE
+.IP
+The selector may also be supplied after the command name as a
+fallback; if both are given, the global value takes precedence.
+.TP
+.BR \-q ", " \-\-quiet
+Suppress non-essential messages.
+.TP
+.B \-\-debug
+Enable debug logging on stderr.
+.SH COMMANDS
+.SS list
+.B pmtctl list
+.RI [ options ]
+.PP
+List PMT metrics known to
+.B pmtctl
+and, optionally, the PMT devices/endpoints discovered on the running
+system. Without options, metrics are grouped by GUID.
+.TP
+.BR \-h ", " \-\-help
+Show help for
+.B list
+and exit.
+.TP
+.BR \-d ", " "\-\-device " \fIselector\fR
+Restrict the listing to a single endpoint. See
+.B GLOBAL OPTIONS
+above for selector syntax.
+.TP
+.B \-\-devices
+List discovered PMT devices/endpoints only; do not list metric
+definitions.
+.TP
+.B \-\-guids
+Emit a report that shows the GUIDs present in the loaded metric
+definitions, the GUIDs discovered on the system, and the
+intersection of the two.
+.TP
+.BR \-X ", " \-\-keep
+Keep the last pager screen visible after quitting. Useful when
+the output will be referenced immediately (for example, to copy a
+metric name for use with
+.BR "pmtctl stat" ).
+.SS stat
+.B pmtctl stat
+.RI [ options ]
+.B \-e
+.IR metric [,\fImetric\fR...]
+\&...
+.br
+.B pmtctl stat
+.RI [ options ]
+.B \-\-raw
+.BI id=3D N
+.RI [,\fBlsb=3D\fP N ][,\fBmsb=3D\fP N ]
+\&...
+.PP
+Sample one or more PMT metrics (or raw sample values) over time, in
+a manner similar to
+.BR "perf stat" .
+On a metric read failure the value is printed as
+.BR NaN .
+.TP
+.BR \-h ", " \-\-help
+Show help for
+.B stat
+and exit.
+.TP
+.BR \-e ", " "\-\-event " \fIspec\fR
+Metric name, or a comma-separated list of metric names. May be
+repeated. When more than one metric is requested, the
+.B \-\-vertical
+output mode is required. Mutually exclusive with
+.BR \-\-raw .
+.TP
+.BR \-d ", " "\-\-device " \fIselector\fR
+Restrict to a single device/endpoint. See
+.B GLOBAL OPTIONS
+above for selector syntax.
+.TP
+.BR \-i ", " "\-\-interval " \fIms\fR
+Sampling interval in milliseconds. Must be greater than 0. Default
+is 1000 ms.
+.TP
+.BR \-c ", " "\-\-count " \fIN\fR
+Number of samples to take. Must be greater than 0. Default is to
+sample indefinitely.
+.TP
+.B \-\-once
+Take a single snapshot and exit (equivalent to
+.B "\-\-count 1"
+with no inter-sample delay).
+.TP
+.B \-\-raw \fBid=3D\fIN\fR[\fB,lsb=3D\fIN\fR][\fB,msb=3D\fIN\fR]
+Read raw sample values by sample
+.B id
+with optional bit-field slicing. Constraints:
+.B id
+must be \(>=3D 0;
+.B lsb
+defaults to 0 and
+.B msb
+defaults to 63; both must satisfy
+0 \(<=3D
+.B lsb
+\(<=3D
+.B msb
+\(<=3D 63. May be specified multiple times. Mutually exclusive with
+.BR \-e .
+.TP
+.BR \-\-header ", " \-\-no\-header
+Force header printing on or off.
+.TP
+.B \-\-hex
+Print sample values in hexadecimal.
+.TP
+.B \-\-vertical
+One line per metric per sample (sample index, time in ms, device,
+metric, value). Required when more than one metric is selected.
+.SH EXAMPLES
+List all known metrics (built-in or loaded via \fB\-J\fR):
+.PP
+.RS 4
+.nf
+pmtctl list
+.fi
+.RE
+.PP
+Show the GUID overlap between definitions and the running system:
+.PP
+.RS 4
+.nf
+pmtctl list \-\-guids
+.fi
+.RE
+.PP
+Load definitions from a directory at runtime and list devices only:
+.PP
+.RS 4
+.nf
+pmtctl \-J /path/to/metrics/ list \-\-devices
+.fi
+.RE
+.PP
+Keep the last screen visible on exit (handy before running stat):
+.PP
+.RS 4
+.nf
+pmtctl list \-X
+.fi
+.RE
+.PP
+Sample a single metric every 500 ms until interrupted:
+.PP
+.RS 4
+.nf
+sudo pmtctl stat \-e socket_power \-\-interval 500
+.fi
+.RE
+.PP
+Take a single snapshot and exit:
+.PP
+.RS 4
+.nf
+sudo pmtctl stat \-e fw_version_0 \-\-once
+.fi
+.RE
+.PP
+Take a single snapshot of a metric on a specific GUID:
+.PP
+.RS 4
+.nf
+sudo pmtctl stat \-e temp_core0 \-d guid=3D27971628 \-\-once
+.fi
+.RE
+.PP
+Sample multiple metrics (requires \fB\-\-vertical\fR):
+.PP
+.RS 4
+.nf
+sudo pmtctl stat \-e temp_socket,socket_power \-\-vertical \-c 5
+.fi
+.RE
+.PP
+Print a value in hexadecimal:
+.PP
+.RS 4
+.nf
+sudo pmtctl stat \-e fw_version_0 \-\-once \-\-hex
+.fi
+.RE
+.PP
+Read raw sample values, slicing bit fields out of two samples:
+.PP
+.RS 4
+.nf
+sudo pmtctl stat \-\-raw id=3D2,msb=3D7 \-\-raw id=3D3,lsb=3D8,msb=3D15
+.fi
+.RE
+.SH FILES
+.TP
+.B /sys/bus/auxiliary/drivers/pmt_telemetry
+Sysfs entry point for the kernel
+.B pmt_telemetry
+auxiliary driver that
+.B pmtctl
+reads from.
+.TP
+.IR <prefix>/include/pmtctl/
+Public C headers for
+.BR libpmtctl_core .
+.TP
+.IR <prefix>/lib/pkgconfig/libpmtctl\-core.pc
+pkg-config file for
+.BR libpmtctl_core .
+.SH EXIT STATUS
+.TP
+.B 0
+Success.
+.TP
+.B 1
+Usage or user error (for example, invalid command-line options).
+.TP
+.B 2
+Device, system, or runtime error (for example, the PMT telemetry
+driver is not loaded or a read failed).
+.SH SEE ALSO
+.BR perf (1),
+.BR turbostat (8)
+.PP
+Intel Platform Monitoring Technology XML metric definitions:
+.UR https://github.com/intel/Intel-PMT
+.UE .
+.SH AUTHORS
+.B pmtctl
+was written by David E. Box <david.e.box@linux.intel.com>.
+.SH REPORTING BUGS
+Report bugs via the Linux kernel mailing lists; see the
+.B MAINTAINERS
+file in the kernel source tree for current maintainers of the
+Intel PMT subsystem.
+.SH COPYRIGHT
+.B pmtctl
+is licensed under GPL-2.0-only.
--=20
2.43.0

