Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2A42E888A;
	Tue, 26 May 2026 01:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779760085; cv=none; b=tujXeHzcGUdaf8YsVgzLarOI16NVSpqPXqakJ5rnydu8XZiWAklIROPZlojjpzI+XdPls+Mc4vLRmxJcSXpNY7DtKSJWQ0/3I3D3RmG7SFxFsHVTyK9hqYEtkSscfXHuetH5N5Y5oE4WmPUuRJ2hnGMY3eOdm4W2aNOpbzabBQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779760085; c=relaxed/simple;
	bh=O/SXPe7Lm/JLYIPnG6XWcWtqyvnpLBWXqv26dtwWyBk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X6cS+pQkW/WcMBh+iqI9A8Sxtiq6ydyvWu/FUCV3Mrpe3aKRGICew7/J7oaGSP6cggGvf/a4lGbE76sxZsiE4kAAqJhN5KbpEtkDuV/nTkVuuAr51WfmM5yCegOh5BNo8DcnMM7E5KhSy7weoFCR5vovQvqA3phygRHzDbNLjM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E4secd0q; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E4secd0q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779760083; x=1811296083;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=O/SXPe7Lm/JLYIPnG6XWcWtqyvnpLBWXqv26dtwWyBk=;
  b=E4secd0qoYzoFxs8fDwpAHPj4ss9UoZyc8OdbomMRHEG0tRp6RFawSdd
   pc8YUOG3/Rcc5qw2Zo4J6j+pczFmwMZCMqBA3t7C/6Ky0ZjeP1w5BQizQ
   BWaFqd8laB09ksmVk6pbQCy4snqew9NxQAMU5J2w98iAyxFHjbtIMaZ+X
   vct0wx7xuBtFoKnpzjA0msNPAJhfsZd6msYhjbLNFVc1+7LdKw0NtzsLe
   oGEdzw+6LXZDO8Dwe45kE3RV9K0VeexFXuxwj5GfSsu3gQM4J8gxd0JUu
   hDhH/A/YXBbNEmHBzT7QItMtiT2nLznb4Yr4WmemnJZGQYDp4eUHDU5jI
   w==;
X-CSE-ConnectionGUID: O9nqFNXoRwGLZGpjVIE9yg==
X-CSE-MsgGUID: ymckHMM/SHe6pzPZs+b58w==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80539901"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="80539901"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 18:47:34 -0700
X-CSE-ConnectionGUID: 8e5c7Q1kTdGjMSq+9ekewg==
X-CSE-MsgGUID: o8hVi09ATD+onB7fW6fObQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="272074984"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 18:47:33 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 16/17] tools/arch/x86/pmtctl: Add README.md
Date: Mon, 25 May 2026 18:47:14 -0700
Message-ID: <20260526014719.2248380-17-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526014719.2248380-1-david.e.box@linux.intel.com>
References: <20260526014719.2248380-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Add the user-facing README documenting pmtctl usage, supported
metric sources, and command-line options.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 tools/arch/x86/pmtctl/README.md | 276 ++++++++++++++++++++++++++++++++
 1 file changed, 276 insertions(+)
 create mode 100644 tools/arch/x86/pmtctl/README.md

diff --git a/tools/arch/x86/pmtctl/README.md b/tools/arch/x86/pmtctl/README=
.md
new file mode 100644
index 000000000000..0827ff20fc86
--- /dev/null
+++ b/tools/arch/x86/pmtctl/README.md
@@ -0,0 +1,276 @@
+# pmtctl
+Intel Platform Monitoring Technology (PMT) command-line tool for Linux
+
+## Overview
+
+pmtctl is a small command-line utility to query Intel Platform Monitoring
+Technology (PMT) metrics via the telem telemetry interface. It can load
+metric definitions from JSON files or use built-in definitions.
+
+The project is split into a CLI frontend and a reusable library:
+
+- `src/`: CLI frontend (`pmtctl`, commands, formatting, pager)
+- `lib/`: reusable PMT library implementation (`libpmtctl_core.a`)
+   - transport/enumeration/binding core
+   - metric DB container operations
+   - built-in and runtime-JSON metric-definition providers
+
+Core ownership model:
+
+- Core library owns PMT source selection, device enumeration, telem reads,
+   metric DB container operations, and both metric-definition providers
+   (built-in compiled defs and runtime JSON parsing/loading).
+
+## Prerequisites
+
+- A C toolchain (gcc/clang)
+- make
+- python3 (for JSON metric generation)
+- libjansson (JSON parsing library)
+- Linux (dev/test on systems with `/sys/bus/auxiliary/drivers/pmt_telemetr=
y` for telem)
+
+## Build Instructions
+
+The built-in metrics pipeline has two opt-in stages, then the build:
+
+```text
+Intel-PMT repo (XML)  --[pmtxml2json.py]-->  defs/*.json
+                                                |
+                                   [gen_builtin_defs.py]
+                                                v
+                                generated/builtin_defs.c  -->  make  -->  =
pmtctl
+```
+
+Each stage is a separate Make target so a routine `make` never hits the
+network and never re-runs codegen unnecessarily.
+
+### Option 1: Build with built-in metrics (recommended)
+
+First-time setup (the `defs-json-fetch` step git clones the Intel-PMT repo=
 into
+`~/.cache/pmtctl` and converts every aggregator XML to perf-style JSON):
+
+```bash
+make defs-json-fetch  # git clone Intel-PMT (cached) and produce defs/*.js=
on
+make defs             # JSON -> generated/builtin_defs.c
+make                  # build pmtctl with built-in metric definitions
+```
+
+If you already have JSON files of your own, drop them under `defs/`
+and skip straight to `make defs && make`.
+
+To update from upstream Intel-PMT later:
+
+```bash
+make defs-json-pull   # git pull the cache and regenerate JSON
+make defs             # regenerate generated/builtin_defs.c
+make                  # rebuild
+```
+
+### Option 2: Build without built-in metrics
+
+If you don't have metric JSONs or prefer to load them at runtime:
+
+```bash
+make
+```
+
+This uses the empty stub (`lib/builtin_defs_empty.c`); load metrics at
+runtime with `-J/--json-file`.
+
+### Make targets (summary)
+
+| Target              | Purpose                                           =
 |
+|---------------------|---------------------------------------------------=
-|
+| `all` (default)     | Build `pmtctl` and `libpmtctl_core.a`             =
 |
+| `defs-json-fetch`   | git clone Intel-PMT (cached) and emit `defs/*.json=
` |
+| `defs-json-pull`    | Same as above, but git pull the cache first       =
 |
+| `defs`              | Generate `generated/builtin_defs.c` from JSON     =
 |
+| `defs-clean`        | Remove `defs/` and `generated/builtin_defs.c`     =
 |
+| `clean`             | Remove build outputs (keeps `defs/` intact)       =
 |
+| `install` /         | Install or remove `pmtctl`, lib, headers, .pc     =
 |
+| `uninstall`         |                                                   =
 |
+
+Useful variables (override on the make command line):
+
+- `PYTHON` =E2=80=94 Python interpreter (default `python3`)
+- `DEFS_DIR` =E2=80=94 JSON output / input directory (default `defs`)
+- `GENERATED_DIR` =E2=80=94 codegen output directory (default `generated`)
+- `PMT_CACHE_DIR` =E2=80=94 Intel-PMT clone cache (default `~/.cache/pmtct=
l`)
+
+### Library artifacts produced
+
+Building `make` also builds the static library artifact under
+`build/<build-type>/lib/`:
+
+- `libpmtctl_core.a`
+
+## Usage (examples)
+
+General form:
+
+```text
+pmtctl [global options] <command> [command options]
+```
+
+Global options:
+
+- `-h, --help`              Show help and exit
+- `-V, --version`           Show version and exit
+- `-b, --source <mode>`     Data source: `telem` (pmu support is pending u=
pstream driver availability)
+- `-J, --json-file <path>`  Path to metrics JSON (file or directory) =E2=
=80=94 loads metrics at runtime
+- `-d, --device <selector>` Restrict to single endpoint (guid or ep name)
+
+Note: Metrics can be loaded in two ways:
+1. **Built-in** (compiled during build) =E2=80=94 see "Build with JSON met=
rics" above
+2. **Runtime** (loaded via `-J` option) =E2=80=94 useful for testing or us=
ing different metric sets
+
+Commands:
+
+- `list`  =E2=80=94 list known metrics and/or discovered devices
+- `stat`  =E2=80=94 sample/stream metrics over time (similar to `perf stat=
`)
+
+Examples (basic):
+
+```bash
+# list all metrics with built-in or runtime-loaded definitions
+./pmtctl list
+
+# list with GUIDs (useful for debugging metric definitions)
+./pmtctl list --guids
+
+# load metrics from a directory at runtime
+./pmtctl -J /path/to/metrics/ list --guids
+
+# load metrics from a single JSON file at runtime
+./pmtctl -J /path/to/metrics.json list --guids
+
+# list devices only
+./pmtctl list --devices
+
+# keep the last pager screen on exit (useful before running stat)
+./pmtctl list -X
+
+# sample a named metric at the default 1 s interval
+sudo ./pmtctl stat -e temp_socket
+
+# sample at 500 ms intervals
+sudo ./pmtctl stat -e socket_power --interval 500
+
+# take a single snapshot and exit
+sudo ./pmtctl stat -e fw_version_0 --once
+
+# sample multiple metrics (one line per metric per sample)
+sudo ./pmtctl stat -e temp_socket -e socket_power --vertical
+
+# restrict to a specific device by GUID
+sudo ./pmtctl -d guid=3D22806802 stat -e temp_core0
+
+# read raw sample data by sample id (no metric definitions required)
+sudo ./pmtctl stat --raw id=3D0,lsb=3D0,msb=3D31 --count 2
+
+# read multiple raw samples with bit slicing
+sudo ./pmtctl stat --raw id=3D2,msb=3D7 --raw id=3D3,lsb=3D8,msb=3D15
+
+# output values in hex
+sudo ./pmtctl stat -e fw_version_0 --once --hex
+```
+
+See `pmtctl_cli_spec.txt` in the repository root for the full CLI
+specification and additional example usage.
+
+## Developer Notes
+
+### Adding new C source files
+
+If you add new `.c` files:
+
+- CLI/frontend code goes in `src/` and is added to top-level `Makefile` `S=
RC`.
+- Reusable library core code goes in `lib/` and is added to `lib/Makefile`
+   `CORE_SRC`.
+- Built-in provider code goes in `lib/` and is added to `lib/Makefile`
+   `BUILTIN_OBJ` inputs.
+- JSON provider code goes in `lib/` and is added to `lib/Makefile` `JSON_O=
BJ`
+   inputs.
+
+This keeps transport and provider policy boundaries explicit.
+
+### Regenerating metrics from JSON
+
+The Makefile recursively tracks `*.json` under `defs/` (so per-platform
+subdirectories produced by `pmtxml2json.py` are picked up automatically):
+
+```bash
+# Re-generate after editing or adding JSON under defs/
+make defs
+
+# Throw away converted JSON + codegen output (does NOT touch the
+# Intel-PMT cache under ~/.cache/pmtctl)
+make defs-clean
+```
+
+`make clean` intentionally does *not* remove `defs/` =E2=80=94 the XML->JS=
ON step
+can be slow, so use `make defs-clean` when you really want to start over.
+
+The `scripts/gen_builtin_defs.py` script also runs standalone and accepts
+both files and directories:
+
+```bash
+python3 scripts/gen_builtin_defs.py defs/ > generated/builtin_defs.c
+```
+
+## PMTXML2JSON Conversion
+
+`scripts/pmtxml2json.py` turns Intel PMT XML definitions into pmtctl /
+perf-style JSON. The `make defs-json-fetch` target wraps the common case;
+invoke the script directly for one-off workflows:
+
+```bash
+# convert all XML groups under a local Intel-PMT xml tree
+python3 scripts/pmtxml2json.py --by-path /path/to/Intel-PMT/xml --output-d=
ir defs
+
+# auto-fetch Intel-PMT into cache, then convert from the fetched xml direc=
tory
+python3 scripts/pmtxml2json.py --fetch-pmt-repo --output-dir defs
+
+# refresh the cached Intel-PMT repository before converting
+python3 scripts/pmtxml2json.py --fetch-pmt-repo --refresh-pmt-repo --outpu=
t-dir defs
+```
+
+Fetch/cache behavior:
+
+- `--fetch-pmt-repo` is opt-in and preserves existing local-path workflows.
+- Default cache location is `~/.cache/pmtctl` (override with `--pmt-cache-=
dir`).
+- `--refresh-pmt-repo` only works with `--fetch-pmt-repo` and updates the =
cache explicitly.
+
+If `--fetch-pmt-repo` is used without a positional XML file and without
+`--by-path`, the converter automatically uses the fetched Intel-PMT `xml/`
+directory as the discovery root.
+
+## Install and Export
+
+Minimal install/export support is available for the CLI and static librari=
es:
+
+```bash
+# Stage install output
+make DESTDIR=3D$PWD/stage install
+```
+
+Installs:
+
+- `bin/pmtctl`
+- `lib/libpmtctl_core.a`
+- `include/pmtctl/{pmtctl.h,metrics_db.h,device.h}`
+- `lib/pkgconfig/libpmtctl-core.pc`
+
+Uninstall:
+
+```bash
+make DESTDIR=3D$PWD/stage uninstall
+```
+
+## Testing
+
+Stat commands require elevated privileges to read telemetry files:
+
+```bash
+sudo ./pmtctl stat -e <metric_name>
+```
--=20
2.43.0

