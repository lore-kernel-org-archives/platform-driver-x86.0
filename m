Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795376058;
	b=IzzAexPxMrfnvG5bBN3qmbtGnKt5slLjPVs8Uh1qdE2ztSR7YDsNdDqy/hg09S1ZFri6
	 GjeLEGmYXaj+vGWChEl6C4zeG1loaA7n05j8Wh5KleBxPAtcxaUhXvt4vAxjgSKsRpmxn
	 w+tYnvB3UF7o401abQNCOcRzigVqGOX+O1HDdFoSWcS5j8FvwngFsxJ0NYfwVRfBdkCFQ
	 Vau7w9D/x8xE31AflrRiTiL0RpLQ+cJ1Qz7bCJlfLr3tHs5dtg64WXWFcvAxi/RZwGqeO
	 7sGS1247ymJg4qHqpsOpYjUfSUxzaCkqekymwFCHMRfu+LmhxX+DAb7oRIYbHWj86RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795376058;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=pAv8wLVTHrLkaMIxq/tGVpbGZ6ThL8ki3qrjYRcF8og=;
	b=XZIUTKEzSpi7iLyRNHmQ6LdMyzSnlhU3uLs2fbDw7K26EIhsSOaeii4anEJJ6xBMyMT2
	 z7l1nc3bVhYMmu5KRt2dU9hPY8ffhkE8JyfYkjIFz0ls9dCGc+I0no7jKQqHMb94Zha/9
	 SdrT+OTyF7cLuTAnxcm6PykBllp1nPbVkAe+UbxvcXw4MOGyqBnkGjXBW/879Vz4mD1Ff
	 4TzbHhdUHZgTBa5lzTPrOAhXpMUtFNt8BYAU+s66GdL0j9Xs1ceW9iEJqPiivjiop/ipi
	 ja03KynB3feNtOVAVqoAtY0vdIzzPdjQNTWCORksj/l136fPLnMYKAdKTt6DUgvr3qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BwuI5pDr;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39DA606A31A;
	Sun, 22 Nov 2026 19:34:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B39DA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BwuI5pDr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795376057; x=1826912057;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=i5myBjjyS7oR+BajBaP0yRSInR3rNUUpMZFHzHNoFVM=;
  b=BwuI5pDr8WqjyGnLm0UUAPzFe5/TENmOg+diUgo6Q1Fnpj4Iva9nohrh
   YVZZMIrhApYzW0h2MBo57fKjxEl/RMWqPSeoazf0wb2w75XDx7XAefMK+
   ZSk/sMqMQbtVX49y7gZFF58sTbMBpC/tA1vjZzEm/vDJxTg4Q7RWQnhoE
   kvALVjVBEAGGUlNfWt0ZmVEcPXDhR0Z43AQB4mzM8PRIOirHmiqTWfKeN
   bgvTMSGt6MwplHw6s6aZMf4/3MutMzObI6KXYH1chb/OgMzl9z0akb+5Z
   cugQyWmaoS37EH+6fVLk9ykN6mg62rxGwT2ZLEuhPFignJ5+BUvIrUEVC
   g==;
X-CSE-ConnectionGUID: CL9OGrO1Rhml44W45b1Eiw==
X-CSE-MsgGUID: 03s2N1saSJK17c1ryZ/S0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4217502"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4217502"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 11:34:17 -0800
X-CSE-ConnectionGUID: kOnkRoPHRXqOaXn6sUSQOA==
X-CSE-MsgGUID: SMPG/PnTTcGkukzP4ME7hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11109786"
Received: from debox1-desk4.jf.intel.com (HELO localhost) ([10.54.77.98])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 11:34:17 -0800
From: "David E. Box" <david.e.box@linux.intel.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/12] tools/arch/x86/pmtctl: Add Intel PMT command-line tool
Date: Sun, 22 Nov 2026 11:33:55 -0800
Message-ID: <cover.1795374925.git.david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.53.0
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
through the pmt_telemetry auxiliary driver. Each telemetry device, telemN,
provides a data file of 64-bit samples, and its GUID identifies the layout
of the samples, which Intel publishes as XML in the Intel-PMT repository.

This series adds pmtctl, a command-line tool that lists the metrics of the
telemetry devices on a system and samples them, similar to 'perf stat'. It
lives under tools/arch/x86/pmtctl/ next to the other x86 platform tools.

  pmtctl list                         # metrics of the devices, by GUID
  pmtctl list --summary               # GUIDs and their devices
  pmtctl stat -e package_energy       # sample a metric once a second
  pmtctl stat --raw id=3D2,msb=3D7        # sample bits 0-7 of sample 2

The metric definitions are not part of the tree. 'make defs-json-fetch'
clones the Intel-PMT repository and converts its XML into one JSON file
per GUID with scripts/pmtxml2json.py; 'make install' installs them, and
pmtctl loads them at run time.

V2 is a rework of V1 following Ilpo's review, and about half its size
(3.9k lines).

Testing: on a Panther Lake system, where the metrics of both published
telemetry layouts were sampled and checked against --raw reads of the
same samples, and on a QEMU guest with an emulated PMT device (KASAN
kernel). Also with a fake sysfs tree under ASan/UBSan and
allocation-failure injection. Reading telemetry needs root, because the
kernel creates the data files with mode 0440; 'list' does not.

This rework was done with the help of an AI coding assistant (Claude
Code). I reviewed every patch by hand, and the structure, conventions and
behavior of the tool are my decisions.

Changes since v1, in summary (each patch's changelog has the details and
the v1 patches it replaces):

- Restructured: the tool is built up in working steps, so every patch
  builds and adds one thing. v1 added library components bottom-up, and
  nothing built until patch 9.
- Smaller: no installed library, no pager, and no built-in definition
  tables (deferred to a follow-up). Definitions are JSON only, read from
  the installed directory or -J, in a format reduced to what pmtctl uses.
- Command line: per-command --guid and --device filters replace the -d
  selector; 'list --summary' replaces 'list --devices'; --guids, --once,
  --header, -q and --debug are gone. The tool says "device" throughout,
  as the sysfs ABI does.
- Code conventions follow the v1 review: errors are 0 or -errno and map
  to documented exit statuses, no exit() in library code, explicit
  context ownership, size_t for counts, and no hand-rolled arrays,
  string pools or magic numbers.
- Several v1 bugs are fixed, for example 7 published GUIDs converted
  under the wrong number, a directory load that depended on readdir
  order, and a time column computed instead of measured.

V1: https://lore.kernel.org/r/20260526014719.2248380-1-david.e.box@linux.in=
tel.com

David E. Box (12):
  tools/arch/x86/pmtctl: Add pmtctl skeleton
  tools/arch/x86/pmtctl: Add PMT telemetry device discovery
  tools/arch/x86/pmtctl: Add pmtxml2json conversion tool
  tools/arch/x86/pmtctl: Add JSON metric definition loading
  tools/arch/x86/pmtctl: Add 'list' command
  tools/arch/x86/pmtctl: Add 'list --summary'
  tools/arch/x86/pmtctl: Add 'stat' command
  tools/arch/x86/pmtctl: Add 'stat --hex'
  tools/arch/x86/pmtctl: Add 'stat --raw'
  tools/arch/x86/pmtctl: Add README
  tools/arch/x86/pmtctl: Add man page
  tools/arch/x86/pmtctl: Add MAINTAINERS entry

 MAINTAINERS                                  |   2 +
 tools/arch/x86/pmtctl/.gitignore             |   3 +
 tools/arch/x86/pmtctl/Makefile               | 107 +++
 tools/arch/x86/pmtctl/README                 |  99 ++
 tools/arch/x86/pmtctl/include/lib/common.h   |  71 ++
 tools/arch/x86/pmtctl/include/lib/device.h   |  21 +
 tools/arch/x86/pmtctl/include/lib/log.h      |  23 +
 tools/arch/x86/pmtctl/include/lib/pmtctl.h   |  52 ++
 tools/arch/x86/pmtctl/include/lib/tss.h      |  43 +
 tools/arch/x86/pmtctl/include/pmtctl_cli.h   |  19 +
 tools/arch/x86/pmtctl/lib/common.c           |  81 ++
 tools/arch/x86/pmtctl/lib/device_telem.c     | 297 ++++++
 tools/arch/x86/pmtctl/lib/log.c              |  41 +
 tools/arch/x86/pmtctl/lib/pmtctl.c           | 114 +++
 tools/arch/x86/pmtctl/lib/tss.c              |  45 +
 tools/arch/x86/pmtctl/lib/tss_json.c         | 406 +++++++++
 tools/arch/x86/pmtctl/pmtctl.8               | 284 ++++++
 tools/arch/x86/pmtctl/scripts/pmtxml2json.md | 189 ++++
 tools/arch/x86/pmtctl/scripts/pmtxml2json.py | 639 +++++++++++++
 tools/arch/x86/pmtctl/src/cmd_list.c         | 330 +++++++
 tools/arch/x86/pmtctl/src/cmd_stat.c         | 897 +++++++++++++++++++
 tools/arch/x86/pmtctl/src/main.c             |  91 ++
 22 files changed, 3854 insertions(+)
 create mode 100644 tools/arch/x86/pmtctl/.gitignore
 create mode 100644 tools/arch/x86/pmtctl/Makefile
 create mode 100644 tools/arch/x86/pmtctl/README
 create mode 100644 tools/arch/x86/pmtctl/include/lib/common.h
 create mode 100644 tools/arch/x86/pmtctl/include/lib/device.h
 create mode 100644 tools/arch/x86/pmtctl/include/lib/log.h
 create mode 100644 tools/arch/x86/pmtctl/include/lib/pmtctl.h
 create mode 100644 tools/arch/x86/pmtctl/include/lib/tss.h
 create mode 100644 tools/arch/x86/pmtctl/include/pmtctl_cli.h
 create mode 100644 tools/arch/x86/pmtctl/lib/common.c
 create mode 100644 tools/arch/x86/pmtctl/lib/device_telem.c
 create mode 100644 tools/arch/x86/pmtctl/lib/log.c
 create mode 100644 tools/arch/x86/pmtctl/lib/pmtctl.c
 create mode 100644 tools/arch/x86/pmtctl/lib/tss.c
 create mode 100644 tools/arch/x86/pmtctl/lib/tss_json.c
 create mode 100644 tools/arch/x86/pmtctl/pmtctl.8
 create mode 100644 tools/arch/x86/pmtctl/scripts/pmtxml2json.md
 create mode 100755 tools/arch/x86/pmtctl/scripts/pmtxml2json.py
 create mode 100644 tools/arch/x86/pmtctl/src/cmd_list.c
 create mode 100644 tools/arch/x86/pmtctl/src/cmd_stat.c
 create mode 100644 tools/arch/x86/pmtctl/src/main.c


base-commit: 9c82959c37bf69c2ace8a0f975cf2129ec1fd982
--=20
2.53.0

