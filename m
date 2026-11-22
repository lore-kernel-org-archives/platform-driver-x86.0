Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795376063;
	b=t6O2SCM30jDMMVK6EwH4AJUExF88H773ejfczt6I8ozhWopT2rOimc4vm0ouEg//u9x7
	 NiBP4hPeO/Mxz7wcSVrPgSzdBwm8q2x3yCLDV1id8bvVknlrDDoxQPEJMbmOg4tnYMMk6
	 fDa18rqrjdCaf/v3rq6p8bqluvQ6KwTE53eXpC5wgzzos85QVxzum7NydGKN5KqTRKIm7
	 G9xDO4y4D6/bqTYcSCo3dnvpucsUFGQC5XeLJbQKHnAwbTSWrc+18OIqFXiY/e6o7mdq/
	 YEFaRjHLJAfYOCIib0QEaeRQpSoakMN5miQBWsom0N4SC/LBQ2zkgL5c+7Cr68He+UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795376063;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ebxGRomDKancW4IdiZSc5iww/0mlTa9i37BIgRGP0Hk=;
	b=gN14/Aqks9OzaAelVtwvAMHuwYBECcB4b3tpFUhYh/70QtaX8jSrT4/bOz0Y3/Er9zS8
	 2lT4+2ESau81PczB/lRrOpqYHbA4RlY+XcZqXfq/VvcoIQ0I6jdIGE9yjiwe465L0K9k1
	 rSZpxqKTeJTDc1mcZXqS4TN4/Zkq+2QXtASD/PCpB5dqJP4tCNQ+z5gO+ZG+q7WNL/TVy
	 2c0iQ/HgOD+AQjr2l058otyriHaScLCuU5WMKzN2s5hgGbSRJvKUvLWj2wn22QbV9NLER
	 HrARtupcl+OHHV1ezP7YBmyh0p4PbHpfJMg+EkNV+UA5d282J4UQe1YJHTTmJ46BEtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GiJ+eyeI;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AE0606A6A5;
	Sun, 22 Nov 2026 19:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37AE0606A6A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GiJ+eyeI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795376063; x=1826912063;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fi/Ij34JtIirolXUTTzqq59KMgnjgz4bYUi8kuxSMFo=;
  b=GiJ+eyeI7vrL5jUIjyEHjtgAr/K4KA0Y3uFlf/Z7TPvQB/YzpCKzNFvg
   FZoxYdANp4PYYEfcLcOAwxS59H0EDuWfH7HRFuQFNjmXkbL86f8JtB/LG
   sZAbiMCjH6tLqJvkGAOqj2ilPnki/xVw4kJOogUSlFOQ7h0E+7MZO/3hc
   lNSakJFHGlBEC8pj4cUhTKuKCMrdINHmncI8taD2KRBbgq7Rlg9IS1+q4
   Q04L4f8rbRkJZssghlTUIFh2xesxZiav8SBkbmWVAR6JE1tjAO1MzDlzG
   xIaCnLlPVLUiJ0+bkTOitn4QFrNwq8TYXtd2bY5uxBk+vTGZ8iUfxpl0C
   Q==;
X-CSE-ConnectionGUID: hNdtKHsbTKOrfp6A1Nh5mA==
X-CSE-MsgGUID: W2W1fYgQQa6D7Echor8umA==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4217524"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4217524"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 11:34:23 -0800
X-CSE-ConnectionGUID: /rz/EzE+SWaX2EFOE85pZQ==
X-CSE-MsgGUID: L8iqB5gkT6O1SK/amTIHDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11109806"
Received: from debox1-desk4.jf.intel.com (HELO localhost) ([10.54.77.98])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 11:34:23 -0800
From: "David E. Box" <david.e.box@linux.intel.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/12] tools/arch/x86/pmtctl: Add man page
Date: Sun, 22 Nov 2026 11:34:06 -0800
Message-ID: <a5acc483018649a7fdd18dec50ab6fe875b12f85.1795374925.git.david.e.box@linux.intel.com>
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

Add the pmtctl(8) man page, which describes the global options, the
'list' and 'stat' commands with their options and output, the metric
definition files and the exit status. 'make install' installs it to
$(MANDIR)/man8, /usr/share/man/man8 by default, and the README refers
to it.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
V2 changes:
  - Replaces v1 17, rewritten for v2. v1 wrongly said -e and --raw were
    mutually exclusive.
  - Installed by 'make install'.

 tools/arch/x86/pmtctl/Makefile |   3 +
 tools/arch/x86/pmtctl/README   |   3 +
 tools/arch/x86/pmtctl/pmtctl.8 | 284 +++++++++++++++++++++++++++++++++
 3 files changed, 290 insertions(+)
 create mode 100644 tools/arch/x86/pmtctl/pmtctl.8

diff --git a/tools/arch/x86/pmtctl/Makefile b/tools/arch/x86/pmtctl/Makefile
index 564931794086..5f07c3345b78 100644
--- a/tools/arch/x86/pmtctl/Makefile
+++ b/tools/arch/x86/pmtctl/Makefile
@@ -3,6 +3,7 @@
=20
 BINDIR ?=3D /usr/sbin
 DEFSDIR ?=3D /usr/share/pmtctl
+MANDIR ?=3D /usr/share/man
=20
 CFLAGS =3D -Wextra
=20
@@ -96,6 +97,8 @@ clean:
 install: pmtctl
 	install -d $(DESTDIR)$(BINDIR)
 	install -m 755 -p pmtctl $(DESTDIR)$(BINDIR)/pmtctl
+	install -d $(DESTDIR)$(MANDIR)/man8
+	install -m 644 -p pmtctl.8 $(DESTDIR)$(MANDIR)/man8/pmtctl.8
 	@# Metric definitions, if 'make defs-json-fetch' was run
 	@if ls $(DEFS_DIR)/*.json >/dev/null 2>&1; then \
 		install -d $(DESTDIR)$(DEFSDIR); \
diff --git a/tools/arch/x86/pmtctl/README b/tools/arch/x86/pmtctl/README
index 7d9a57cf3925..296dccba52ff 100644
--- a/tools/arch/x86/pmtctl/README
+++ b/tools/arch/x86/pmtctl/README
@@ -22,6 +22,8 @@ Debian and Ubuntu, jansson-devel on Fedora and RHEL).
 installs pmtctl to /usr/sbin, and the metric definitions, if they were
 fetched, to /usr/share/pmtctl. BINDIR and DEFSDIR change the locations,
 and DESTDIR is prefixed to both.
+The pmtctl(8) man page is installed to /usr/share/man/man8, under
+DESTDIR too, and MANDIR changes its location.
=20
=20
 Metric definitions
@@ -84,6 +86,7 @@ The telemetry data files can only be read by root, so 'st=
at' must run
 as root; 'list' doesn't need to.
=20
 'pmtctl --help' and 'pmtctl <command> --help' describe all options.
+The pmtctl(8) man page describes them in more detail.
=20
=20
 Exit status
diff --git a/tools/arch/x86/pmtctl/pmtctl.8 b/tools/arch/x86/pmtctl/pmtctl.8
new file mode 100644
index 000000000000..c547af73db1d
--- /dev/null
+++ b/tools/arch/x86/pmtctl/pmtctl.8
@@ -0,0 +1,284 @@
+.\" SPDX-License-Identifier: GPL-2.0-only
+.TH PMTCTL 8 "November 2026" "Linux" "System Administration"
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
+The driver registers a telemetry device,
+.BI telem N\fR,
+for each telemetry region of the platform. Its data is an array of
+64-bit samples, and its GUID identifies the layout: which bits of
+which sample hold which metric.
+.B pmtctl
+uses metric definitions, one JSON file per GUID, to name and decode
+the data. The definitions are generated from the layouts published in
+the Intel-PMT repository; see
+.BR FILES .
+.PP
+The telemetry data files can only be read by
+.BR root ,
+so
+.B stat
+must run as root.
+.B list
+does not need to.
+.SH GLOBAL OPTIONS
+.TP
+.BR \-h ", " \-\-help
+Show help and exit.
+.TP
+.BR \-V ", " \-\-version
+Show version and exit.
+.TP
+.BR \-J ", " "\-\-json\-file " \fIpath\fR
+Load the metric definitions from
+.IR path ,
+a definition file or a directory of them. Without
+.BR \-J ,
+the definitions installed in
+.I /usr/share/pmtctl
+(set with DEFSDIR at build time) are used, if that directory exists.
+.SH COMMANDS
+.SS list
+.B pmtctl list
+.RI [ options ]
+.PP
+List the metrics of the telemetry devices on the system. The metrics
+are grouped by GUID, each group with its platform, number of metrics
+and description, and a GUID shared by several devices is listed once.
+On a terminal, descriptions are wrapped to its width.
+.TP
+.BR \-h ", " \-\-help
+Show help for
+.B list
+and exit.
+.TP
+.BI "\-\-guid " hex
+Restrict the listing to the devices with this GUID.
+.TP
+.BI "\-\-device " name
+Restrict the listing to one device, for example
+.BR telem3 .
+.TP
+.B \-\-summary
+List the GUIDs and their devices instead of the metrics. This works
+without metric definitions.
+.SS stat
+.B pmtctl stat
+.RI [ options ]
+.B \-e
+.IR metric [,\fImetric\fR...]
+\&...
+.br
+.B pmtctl stat
+.RI [ options ]
+.BR \-\-raw\ id=3D \fIN\fR [,lsb=3D \fIN\fR ][,msb=3D \fIN\fR ]\ ...
+.PP
+Sample metrics, or raw sample values, of the telemetry devices at an
+interval, in a manner similar to
+.BR "perf stat" .
+Samples are scheduled from the start time, so the interval doesn't
+drift, and the time column shows when each sample was taken. A sample
+that is due before the previous one finished is skipped. Sampling ends
+after the given number of samples or on
+.BR SIGINT ,
+which takes effect immediately, even during a long interval.
+.TP
+.BR \-h ", " \-\-help
+Show help for
+.B stat
+and exit.
+.TP
+.BR \-e ", " "\-\-event " \fIspec\fR
+Metric name, or a comma-separated list of metric names. May be
+repeated and combined with
+.BR \-\-raw .
+.TP
+.B \-\-raw \fBid=3D\fIN\fR[\fB,lsb=3D\fIN\fR][\fB,msb=3D\fIN\fR]
+Read bits
+.B lsb
+to
+.B msb
+of sample
+.B id
+of each device, without metric definitions. The items are separated by
+commas, without spaces.
+.B lsb
+defaults to 0 and
+.B msb
+to 63, and 0 \(<=3D
+.B lsb
+\(<=3D
+.B msb
+\(<=3D 63. May be repeated and combined with
+.BR \-e .
+.TP
+.BI "\-\-guid " hex
+Restrict sampling to the devices with this GUID.
+.TP
+.BI "\-\-device " name
+Restrict sampling to one device, for example
+.BR telem3 .
+.TP
+.BR \-i ", " "\-\-interval " \fIms\fR
+Sampling interval in milliseconds. Must be greater than 0. Default
+is 1000 ms.
+.TP
+.BR \-c ", " "\-\-count " \fIN\fR
+Number of samples to take. Must be greater than 0. Default is to
+sample until interrupted.
+.TP
+.B \-\-no\-header
+Don't print the header.
+.TP
+.B \-\-hex
+Print sample values in hexadecimal.
+.TP
+.B \-\-vertical
+One line per value per sample: the sample number, the time in ms, the
+device, the metric and the value. Required when more than one value is
+requested. The default layout has one line per device per sample.
+.PP
+Metric names are looked up in the definitions of each device's GUID, so
+a metric is sampled on every selected device that has it, at that
+device's location. A device that has none of the requested values is
+left out. With
+.BR \-\-vertical ,
+a value that a device doesn't have is printed as
+.BR \- ,
+as is a
+.B \-\-raw
+sample outside the device's telemetry region. A metric or raw sample
+that no selected device has is an error. A value that can't be read is
+printed as
+.BR NaN ;
+.B stat
+fails only if no value could be read at all.
+.SH EXAMPLES
+List the metrics, using the installed definitions:
+.PP
+.RS 4
+.nf
+pmtctl list
+.fi
+.RE
+.PP
+List the GUIDs and devices of the system, with definitions from
+.IR defs/ :
+.PP
+.RS 4
+.nf
+pmtctl \-J defs list \-\-summary
+.fi
+.RE
+.PP
+Sample a metric every 500 ms until interrupted:
+.PP
+.RS 4
+.nf
+sudo pmtctl stat \-e package_energy \-\-interval 500
+.fi
+.RE
+.PP
+Take a single sample of a metric on the devices with one GUID:
+.PP
+.RS 4
+.nf
+sudo pmtctl stat \-e pch_temp \-\-guid 03086000 \-c 1
+.fi
+.RE
+.PP
+Sample two metrics five times (requires \fB\-\-vertical\fR):
+.PP
+.RS 4
+.nf
+sudo pmtctl stat \-e package_energy,pch_temp \-\-vertical \-c 5
+.fi
+.RE
+.PP
+Print a value in hexadecimal:
+.PP
+.RS 4
+.nf
+sudo pmtctl stat \-e firmware_version \-c 1 \-\-hex
+.fi
+.RE
+.PP
+Read raw sample values, slicing bit fields out of two samples:
+.PP
+.RS 4
+.nf
+sudo pmtctl stat \-\-vertical \-\-raw id=3D2,msb=3D7 \-\-raw id=3D3,lsb=3D=
8,msb=3D15
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
+.I /usr/share/pmtctl
+The installed metric definitions,
+.BI pmt_ guid .json
+for each GUID. They are generated from the Intel-PMT repository with
+.B make defs\-json\-fetch
+in the
+.B pmtctl
+source directory and installed with
+.BR "make install" .
+.SH EXIT STATUS
+.TP
+.B 0
+Success.
+.TP
+.B 1
+The request is wrong: an invalid option or value, or nothing matches
+the selection.
+.TP
+.B 2
+Something failed while carrying out the request, such as reading the
+devices or the metric definitions.
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
2.53.0

