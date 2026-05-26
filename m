Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8CE274B37;
	Tue, 26 May 2026 01:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779760061; cv=none; b=DVsuzDt2vJE7M5GvWM0b2yLwsJE4yYM2wI5jFDqKY2iZJjF8hadsHuUDmCwNvyUSnG7pTQDszHX7KBCYQbqWdSZu5eLd2M+M50n3jdxDGqSM5QtlE3zwF+Bc2RYIPsJzjyxFfxxTiQa5gtuuwWxb49K1AIUnfd+ny6JDPIW7IYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779760061; c=relaxed/simple;
	bh=iITgawWMoCWs/Z8dbVaaVSFC2RxjA2RmMeK7VZajiLQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UDHjBfkgI0mYcWbfglKajh1Si+eeIsecPgldhPyaxrVRncvtIPKNpG7wgHUciTL9B9VYzH01RX+D0qUqHHUGLSoLut5beoOFcdsMv1EZ+VzzguE9TEU0gtiEngTr8++MILdgvGU7MsZRjPf3h0EjY2OGdN9iV+8ETeAY7MO2aF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HFs+nfbb; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HFs+nfbb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779760057; x=1811296057;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iITgawWMoCWs/Z8dbVaaVSFC2RxjA2RmMeK7VZajiLQ=;
  b=HFs+nfbbk4eAHY6khbSjfY1FxT2quimMLZ5gGCE0STlLqAi/jQZJFQQq
   5VPpwkiw6Nm3y4jgsYT1YLHB0ZjBt3Mwp9Vz3Kq9xDVNgWmPJrlzqLyoi
   OJPJeLtCCUMHBEE9RKdBrEcMNodx8rh4EUHUdp+PTCNjfI1+rnm0mRr8y
   JUG0U1CsiEVRvm0BFF/yXIWykzAKVeck+dC51nFPFFYT/RZXQiRVdNTWB
   FRcXJBVsXUfDFFVcP6sYlSfUVhxihaxIgf2BZGg6ExiV+t5tsbSvmakSi
   oZcVS0c+0eae1+cP1WQ8Zr5Y5PR1AkbIP8MNiTolB8idwp2yPfWljxN/P
   w==;
X-CSE-ConnectionGUID: rqmRSyuRSqmRO0CC66aDtQ==
X-CSE-MsgGUID: /tPkMlTuRHiJnn46Aj+ENg==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80539885"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="80539885"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 18:47:33 -0700
X-CSE-ConnectionGUID: 6HqaQuvsQtm9t0IK2PhLXg==
X-CSE-MsgGUID: VMEJR8n7TESX6GI4bUBqcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="272074967"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 18:47:33 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 00/17] tools/arch/x86/pmtctl: Add Intel PMT command-line tool
Date: Mon, 25 May 2026 18:46:58 -0700
Message-ID: <20260526014719.2248380-1-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Intel Platform Monitoring Technology (PMT) exposes per-component telemetry
counters through sysfs via the pmt_telemetry auxiliary bus driver. Each
telemetry device provides a data file that can be read to sample the
underlying hardware telemetry data.  The meaning of each field within a
sample is described by platform-specific metric definitions.

This series adds pmtctl, a command-line tool for querying PMT metrics on
x86 Linux systems.  It lives under tools/arch/x86/pmtctl/ alongside other
platform-specific userspace tools.

The series introduces approximately 7k lines across the library, CLI
frontend, code generation scripts, and documentation. The changes are
intentionally split into small logical components so the architecture and
dependencies can be reviewed incrementally.

The implementation is split into a reusable library (libpmtctl_core) and a
thin CLI frontend:

  libpmtctl_core (lib/)
  - Device enumeration: scans /sys/bus/auxiliary/drivers/pmt_telemetry
    and reads GUID and telem data path from sysfs attributes.
  - Metric definitions: supports two loading modes:
      built-in  -- a C struct array compiled in at build time, generated
                   from perf-style JSON by scripts/gen_builtin_defs.py.
      runtime   -- loaded at invocation via -J/--json-file (requires
                   libjansson).
  - Metric DB: block-based container with flat-index accessors.
  - GUID intern table: canonical struct pmt_guid pointers shared between
    the built-in and JSON providers.

  CLI frontend (src/)
  - list: enumerate discovered PMT devices and/or metric definitions,
    with optional GUID intersection report (--guids) and device-only
    mode (--devices).
  - stat: perf-stat-like metric sampling with configurable interval,
    count, event selection, and raw-register mode.

Metric JSON files are not included in the tree. Users obtain them from
the Intel-PMT repository using Makefile targets that fetch XML metric
definitions over the network and convert them into the JSON format
expected by the tool.

Testing: functional testing requires a system with PMT-capable hardware
and /sys/bus/auxiliary/drivers/pmt_telemetry populated.  Reading telemetry
data (stat) requires elevated privileges (CAP_SYS_ADMIN / sudo); listing
metrics and devices (list) does not.

Summary

1. Infrastructure and meta:
   0001: Adds the MAINTAINERS entry for the new tool.

2. Library (libpmtctl_core, under lib/):
   0002=E2=80=930008: Introduce the core library, including shared types, l=
ogging,
              metric definitions, device enumeration, built-in and JSON
              metric providers, public API, and core logic.
   0009:      Adds the libpmtctl Makefile, pkg-config file, and README for
              the library.
   0010=E2=80=930011: Add usage samples and further built-in metric support=
 for the
              library.

3. CLI tool (under src/):
   0012:      Introduces the pmtctl CLI entry point, option parsing, and
              pager helpers.
   0013:      Adds the 'list' command.
   0014:      Adds the 'stat' command.

4. Scripts/codegen:
   0015:      Adds the pmtxml2json.py conversion tool for XML=E2=86=92JSON =
metric
              definitions.

5. Documentation and other:
   0016:      Adds README.md.
   0017:      Adds the man page.


David E. Box (17):
  tools/arch/x86/pmtctl: Add MAINTAINERS entry
  tools/arch/x86/pmtctl: Add libpmtctl shared type enumerations
  tools/arch/x86/pmtctl: Add libpmtctl internal logging and utility
    functions
  tools/arch/x86/pmtctl: Add libpmtctl metric definition database
  tools/arch/x86/pmtctl: Add libpmtctl device enumeration backend
  tools/arch/x86/pmtctl: Add libpmtctl built-in metric provider
  tools/arch/x86/pmtctl: Add libpmtctl JSON metric provider
  tools/arch/x86/pmtctl: Add libpmtctl public API and context
  tools/arch/x86/pmtctl: Add libpmtctl Makefile + pc + README
  tools/arch/x86/pmtctl: Add libpmtctl usage sample
  tools/arch/x86/pmtctl: Add libpmtctl built-in metric definition
    support
  tools/arch/x86/pmtctl: Add pmtctl CLI entry point and pager
  tools/arch/x86/pmtctl: Add pmtctl 'list' command
  tools/arch/x86/pmtctl: Add pmtctl 'stat' command
  tools/arch/x86/pmtctl: Add pmtxml2json conversion tool
  tools/arch/x86/pmtctl: Add README.md
  tools/arch/x86/pmtctl: Add man page

 MAINTAINERS                                   |   1 +
 tools/arch/x86/pmtctl/Makefile                | 204 ++++
 tools/arch/x86/pmtctl/README.md               | 279 ++++++
 tools/arch/x86/pmtctl/include/cmd_stat.h      |  75 ++
 .../arch/x86/pmtctl/include/cmd_stat_format.h |  11 +
 .../x86/pmtctl/include/lib/builtin_defs.h     |  14 +
 tools/arch/x86/pmtctl/include/lib/common.h    |  34 +
 tools/arch/x86/pmtctl/include/lib/device.h    |  53 ++
 tools/arch/x86/pmtctl/include/lib/log.h       |  80 ++
 .../arch/x86/pmtctl/include/lib/metrics_db.h  |  69 ++
 .../x86/pmtctl/include/lib/metrics_provider.h |  21 +
 tools/arch/x86/pmtctl/include/lib/pmt_guid.h  |  63 ++
 tools/arch/x86/pmtctl/include/lib/pmtctl.h    |  90 ++
 .../x86/pmtctl/include/lib/pmtctl_context.h   |  21 +
 .../x86/pmtctl/include/lib/pmtctl_types.h     |  16 +
 tools/arch/x86/pmtctl/include/pmtctl_cli.h    |  16 +
 tools/arch/x86/pmtctl/lib/Makefile            | 138 +++
 tools/arch/x86/pmtctl/lib/README              | 116 +++
 .../arch/x86/pmtctl/lib/builtin_defs_empty.c  |  13 +
 tools/arch/x86/pmtctl/lib/common.c            | 178 ++++
 tools/arch/x86/pmtctl/lib/device_telem.c      | 371 ++++++++
 tools/arch/x86/pmtctl/lib/log.c               |  80 ++
 tools/arch/x86/pmtctl/lib/metrics_db.c        |  62 ++
 tools/arch/x86/pmtctl/lib/metrics_provider.c  |  42 +
 .../x86/pmtctl/lib/metrics_provider_json.c    | 459 +++++++++
 tools/arch/x86/pmtctl/lib/pmt_guid.c          | 200 ++++
 tools/arch/x86/pmtctl/lib/pmtctl.c            | 327 +++++++
 tools/arch/x86/pmtctl/libpmtctl-core.pc.in    |  11 +
 tools/arch/x86/pmtctl/pmtctl.8                | 317 +++++++
 .../x86/pmtctl/samples/libpmtctl_sample.c     |  30 +
 .../x86/pmtctl/scripts/gen_builtin_defs.py    | 405 ++++++++
 tools/arch/x86/pmtctl/scripts/pmtxml2json.md  | 158 ++++
 tools/arch/x86/pmtctl/scripts/pmtxml2json.py  | 883 ++++++++++++++++++
 tools/arch/x86/pmtctl/src/cmd_list.c          | 786 ++++++++++++++++
 tools/arch/x86/pmtctl/src/cmd_stat.c          | 501 ++++++++++
 tools/arch/x86/pmtctl/src/cmd_stat_format.c   | 205 ++++
 tools/arch/x86/pmtctl/src/cmd_stat_run.c      | 528 +++++++++++
 tools/arch/x86/pmtctl/src/main.c              | 151 +++
 tools/arch/x86/pmtctl/src/pager.c             | 140 +++
 39 files changed, 7148 insertions(+)
 create mode 100644 tools/arch/x86/pmtctl/Makefile
 create mode 100644 tools/arch/x86/pmtctl/README.md
 create mode 100644 tools/arch/x86/pmtctl/include/cmd_stat.h
 create mode 100644 tools/arch/x86/pmtctl/include/cmd_stat_format.h
 create mode 100644 tools/arch/x86/pmtctl/include/lib/builtin_defs.h
 create mode 100644 tools/arch/x86/pmtctl/include/lib/common.h
 create mode 100644 tools/arch/x86/pmtctl/include/lib/device.h
 create mode 100644 tools/arch/x86/pmtctl/include/lib/log.h
 create mode 100644 tools/arch/x86/pmtctl/include/lib/metrics_db.h
 create mode 100644 tools/arch/x86/pmtctl/include/lib/metrics_provider.h
 create mode 100644 tools/arch/x86/pmtctl/include/lib/pmt_guid.h
 create mode 100644 tools/arch/x86/pmtctl/include/lib/pmtctl.h
 create mode 100644 tools/arch/x86/pmtctl/include/lib/pmtctl_context.h
 create mode 100644 tools/arch/x86/pmtctl/include/lib/pmtctl_types.h
 create mode 100644 tools/arch/x86/pmtctl/include/pmtctl_cli.h
 create mode 100644 tools/arch/x86/pmtctl/lib/Makefile
 create mode 100644 tools/arch/x86/pmtctl/lib/README
 create mode 100644 tools/arch/x86/pmtctl/lib/builtin_defs_empty.c
 create mode 100644 tools/arch/x86/pmtctl/lib/common.c
 create mode 100644 tools/arch/x86/pmtctl/lib/device_telem.c
 create mode 100644 tools/arch/x86/pmtctl/lib/log.c
 create mode 100644 tools/arch/x86/pmtctl/lib/metrics_db.c
 create mode 100644 tools/arch/x86/pmtctl/lib/metrics_provider.c
 create mode 100644 tools/arch/x86/pmtctl/lib/metrics_provider_json.c
 create mode 100644 tools/arch/x86/pmtctl/lib/pmt_guid.c
 create mode 100644 tools/arch/x86/pmtctl/lib/pmtctl.c
 create mode 100644 tools/arch/x86/pmtctl/libpmtctl-core.pc.in
 create mode 100644 tools/arch/x86/pmtctl/pmtctl.8
 create mode 100644 tools/arch/x86/pmtctl/samples/libpmtctl_sample.c
 create mode 100755 tools/arch/x86/pmtctl/scripts/gen_builtin_defs.py
 create mode 100644 tools/arch/x86/pmtctl/scripts/pmtxml2json.md
 create mode 100755 tools/arch/x86/pmtctl/scripts/pmtxml2json.py
 create mode 100644 tools/arch/x86/pmtctl/src/cmd_list.c
 create mode 100644 tools/arch/x86/pmtctl/src/cmd_stat.c
 create mode 100644 tools/arch/x86/pmtctl/src/cmd_stat_format.c
 create mode 100644 tools/arch/x86/pmtctl/src/cmd_stat_run.c
 create mode 100644 tools/arch/x86/pmtctl/src/main.c
 create mode 100644 tools/arch/x86/pmtctl/src/pager.c


base-commit: 5200f5f493f79f14bbdc349e402a40dfb32f23c8
--=20
2.43.0

