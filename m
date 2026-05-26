Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3572E1C4E;
	Tue, 26 May 2026 01:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779760085; cv=none; b=VlXMld7c/6kwCIDvFfqhaRXf0E/MpScBqZgY+kPDmFLKOHnAuOLezAUXYMpuJfzIBJt382ms5FsR60CB0i5ON0wzjM4vKqdFX5ch2H42Ty3S1GzwmdDfT7o1W2psm82LNjhDH/Y+FJWcQcrdxniQnUjW3LEhLsMhXbCwscj98Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779760085; c=relaxed/simple;
	bh=Eqx3sPQmimyntbQGnmoT+3j2cwvX6jZKzpDM0yzNmIs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N6+Lyq6GWZIq3F/zncz30XSA+2YXZp29CocqKHQ29awyjHo35XHs0S0xKGvr1cU9RlQ0fqUQhRhOl/WMEC8l2ls8NyV07da3nDBLfUEhkaw1rUAeeNhzVpenojP3i5xHXkT0pXBG6gDa6b51L3gn2KhePJ7udohARAOXc+jMe6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FCxr3he3; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FCxr3he3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779760082; x=1811296082;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Eqx3sPQmimyntbQGnmoT+3j2cwvX6jZKzpDM0yzNmIs=;
  b=FCxr3he3nNxmSp2YtieTMRTuy5h0OQtxbIP2KrfMAlwv77bkV+h6x0P4
   eO4T+EkIODSFX7HIEMi8XqG6j+R3Z3HAl89blcyErfgSUNpKzkuPfxDro
   W9w9+IpOF2TAgJiyDaT/GfufSvjnF6+INjVKd/2YRjoBoeriyaWF4krKm
   H87jfvs/t2g5s5N6fQdLAFnqOrahj/gzNF49P15of8l6eLNHVGbpg5SHx
   3esnOD9LLRwSj8KP4WhaLnprspFWdpSK8rv9zRLMzvw/3++r6NvF+5C3u
   xWk25k0oYbXFvWqlH3PcCFZoc/KIVV4j/3FEa5RDcXoAdVpDtMq6IqYzI
   A==;
X-CSE-ConnectionGUID: PU55RF5VSZq2vAl2Td37iA==
X-CSE-MsgGUID: R1qHiojESBaLsB4i7CulhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80539900"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="80539900"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 18:47:34 -0700
X-CSE-ConnectionGUID: noPRNK9oRLKhKrqw/sAbOg==
X-CSE-MsgGUID: Uf1P7pN2QtOOW0AlTdcvdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="272074983"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 18:47:33 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 15/17] tools/arch/x86/pmtctl: Add pmtxml2json conversion tool
Date: Mon, 25 May 2026 18:47:13 -0700
Message-ID: <20260526014719.2248380-16-david.e.box@linux.intel.com>
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

Add a Python converter that turns Intel PMT XML metric definitions into the
pmtctl/perf-style JSON consumed by pmtctl and by the built-in metric
definition generator.

The converter supports two input modes:

  Local path: point it at an existing Intel-PMT xml tree (--by-path
              /path/to/Intel-PMT/xml) and convert in place.

  Fetch:      --fetch-pmt-repo clones the upstream Intel-PMT repository
              into a cache (default ~/.cache/pmtctl).

              --refresh-pmt-repo updates the cache.

Output JSON files are written under --output-dir, one file per metric
group, suitable for direct use with pmtctl -J or as input to
gen_builtin_defs.py for compiled-in definitions.

The document pmtxml2json.md provages usage examples covering the
different workflows.

Assisted-by: GitHub-Copilot:claude-sonnet-4.6
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 tools/arch/x86/pmtctl/Makefile               |  96 +-
 tools/arch/x86/pmtctl/scripts/pmtxml2json.md | 158 ++++
 tools/arch/x86/pmtctl/scripts/pmtxml2json.py | 883 +++++++++++++++++++
 3 files changed, 1129 insertions(+), 8 deletions(-)
 create mode 100644 tools/arch/x86/pmtctl/scripts/pmtxml2json.md
 create mode 100755 tools/arch/x86/pmtctl/scripts/pmtxml2json.py

diff --git a/tools/arch/x86/pmtctl/Makefile b/tools/arch/x86/pmtctl/Makefile
index 52e50597b5c1..d55819372f79 100644
--- a/tools/arch/x86/pmtctl/Makefile
+++ b/tools/arch/x86/pmtctl/Makefile
@@ -1,6 +1,27 @@
 # SPDX-License-Identifier: GPL-2.0-only
=20
+# Remove targets whose recipe exited non-zero so a failed codegen step
+# does not leave a truncated $@ behind that fools the next build.
+.DELETE_ON_ERROR:
+
 CC      ?=3D gcc
+PYTHON  ?=3D python3
+
+# Directories for the XML -> JSON -> C codegen pipeline.
+DEFS_DIR        ?=3D defs
+GENERATED_DIR   ?=3D generated
+PMT_CACHE_DIR   ?=3D $(HOME)/.cache/pmtctl
+
+XML2JSON_SCRIPT :=3D scripts/pmtxml2json.py
+GEN_DEFS_SCRIPT :=3D scripts/gen_builtin_defs.py
+
+# JSON sources that define built-in metrics. pmtxml2json.py writes
+# one subdirectory per platform under $(DEFS_DIR)/, so recurse.
+DEFS_JSON       ?=3D $(shell find $(DEFS_DIR) -name '*.json' 2>/dev/null)
+
+# Stamp marks "the XML->JSON conversion has run". The exact set of
+# generated files is not known up front, so we depend on a single stamp.
+DEFS_JSON_STAMP :=3D $(DEFS_DIR)/.stamp
=20
 BUILD	?=3D release
=20
@@ -35,7 +56,6 @@ TARGET  :=3D pmtctl
 LIBDIR  :=3D lib
 LIBPMTCTL_CORE      :=3D $(BUILDDIR)/lib/libpmtctl_core.a
 LIBPMTCTL_ARTIFACTS :=3D $(LIBPMTCTL_CORE)
-LIBPMTCTL_STAMP :=3D $(BUILDDIR)/lib/.built
 SAMPLE_SRC :=3D samples/libpmtctl_sample.c
 SAMPLE_TARGET :=3D $(BUILDDIR)/samples/libpmtctl_sample
=20
@@ -50,13 +70,21 @@ SRC :=3D \
 OBJ :=3D $(patsubst $(SRCDIR)/%.c,$(BUILDDIR)/%.o,$(SRC))
 CLEAN_BUILDS :=3D release debug
=20
-.PHONY: all clean libpmtctl_core sample FORCE
+.PHONY: all clean defs defs-json-fetch defs-json-pull defs-clean \
+        libpmtctl_core sample FORCE
=20
 all: $(TARGET)
=20
 $(TARGET): $(OBJ) $(LIBPMTCTL_ARTIFACTS)
 	$(CC) $(CFLAGS) -o $@ $(OBJ) $(LIBPMTCTL_ARTIFACTS) $(LDLIBS)
=20
+# If JSON definitions exist, ensure the generated built-in defs are up to
+# date before the lib sub-make runs. Without this, edits under defs/ would
+# not propagate into pmtctl until the user explicitly ran 'make defs'.
+ifneq ($(DEFS_JSON),)
+$(LIBPMTCTL_CORE): $(GENERATED_DIR)/builtin_defs.c
+endif
+
 libpmtctl_core: $(LIBPMTCTL_CORE)
=20
 sample: $(SAMPLE_TARGET)
@@ -69,15 +97,58 @@ $(SAMPLE_TARGET): $(SAMPLE_SRC) $(LIBPMTCTL_ARTIFACTS)
 	@mkdir -p $(dir $@)
 	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ $< $(LIBPMTCTL_ARTIFACTS) $(LDLIBS)
=20
-$(LIBPMTCTL_ARTIFACTS): $(LIBPMTCTL_STAMP)
-
-$(LIBPMTCTL_STAMP): FORCE
+# Recurse into lib/ on every invocation. The sub-make is incremental and
+# does nothing when up to date. Because $(LIBPMTCTL_CORE) has its own
+# recipe here, GNU make re-stats it afterwards, so any mtime advance from
+# sub-make correctly propagates to $(TARGET) and triggers a relink.
+$(LIBPMTCTL_CORE): FORCE
 	$(MAKE) -C $(LIBDIR) BUILD=3D$(BUILD)
-	@mkdir -p $(dir $@)
-	@touch $@
=20
 FORCE:
=20
+# --- XML -> JSON step (network-bound; opt-in) ---
+#
+# Fetches the Intel-PMT git repo (cached under $(PMT_CACHE_DIR)) and
+# converts every aggregator XML into perf-style JSON under $(DEFS_DIR)/.
+# Not wired into 'all' on purpose: avoid surprise git clones.
+defs-json-fetch: $(DEFS_JSON_STAMP)
+
+$(DEFS_JSON_STAMP): $(XML2JSON_SCRIPT)
+	@echo "defs-json-fetch: git cloning Intel-PMT into $(PMT_CACHE_DIR)"
+	@command -v $(PYTHON) >/dev/null 2>&1 || { \
+		echo "$(PYTHON) is required for $(XML2JSON_SCRIPT)" >&2; exit 1; }
+	@mkdir -p $(DEFS_DIR)
+	$(PYTHON) $(XML2JSON_SCRIPT) \
+		--fetch-pmt-repo \
+		--pmt-cache-dir $(PMT_CACHE_DIR) \
+		--output-dir $(DEFS_DIR)
+	@touch $@
+
+# Run 'git pull' on the cached Intel-PMT repo, then regenerate JSON.
+defs-json-pull: $(XML2JSON_SCRIPT)
+	@echo "defs-json-pull: running 'git pull' on $(PMT_CACHE_DIR)"
+	@mkdir -p $(DEFS_DIR)
+	$(PYTHON) $(XML2JSON_SCRIPT) \
+		--fetch-pmt-repo --refresh-pmt-repo \
+		--pmt-cache-dir $(PMT_CACHE_DIR) \
+		--output-dir $(DEFS_DIR)
+	@touch $(DEFS_JSON_STAMP)
+
+# --- JSON -> C step (does NOT build pmtctl) ---
+#
+# DEFS_JSON is expanded at parse time, so 'make defs-json-fetch' must be r=
un
+# in a separate invocation before 'make defs' the first time.
+$(GENERATED_DIR)/builtin_defs.c: $(GEN_DEFS_SCRIPT) $(DEFS_JSON)
+	@mkdir -p $(GENERATED_DIR)
+	@if [ -z "$(DEFS_JSON)" ]; then \
+		echo "No JSON files under $(DEFS_DIR)/. Run 'make defs-json-fetch' first=
," >&2; \
+		echo "then re-run 'make defs'." >&2; \
+		exit 1; \
+	fi
+	@command -v $(PYTHON) >/dev/null 2>&1 || { \
+		echo "$(PYTHON) is required for $(GEN_DEFS_SCRIPT)" >&2; exit 1; }
+	$(PYTHON) $(GEN_DEFS_SCRIPT) $(DEFS_JSON) > $@
+
 # Install settings
 PREFIX ?=3D /usr/local
 DESTDIR ?=3D
@@ -105,6 +176,15 @@ uninstall:
 	$(MAKE) -C $(LIBDIR) BUILD=3D$(BUILD) PREFIX=3D$(PREFIX) DESTDIR=3D$(DEST=
DIR) uninstall-headers
 	$(MAKE) -C $(LIBDIR) BUILD=3D$(BUILD) PREFIX=3D$(PREFIX) DESTDIR=3D$(DEST=
DIR) uninstall-pkgconfig
 	@echo "Removed $(DESTDIR)$(PREFIX)/bin/$(TARGET) (if present)"
+defs: $(GENERATED_DIR)/builtin_defs.c
+	@if [ -f $(GENERATED_DIR)/builtin_defs.c ]; then \
+		echo "Generated defs in $(GENERATED_DIR)/builtin_defs.c"; \
+	fi
+
+# Separate from 'clean' so a routine clean does not throw away the
+# (potentially slow) fetched/converted JSON tree.
+defs-clean:
+	rm -rf $(DEFS_DIR) $(GENERATED_DIR)/builtin_defs.c
=20
 $(BUILDDIR)/%.o: $(SRCDIR)/%.c
 	@mkdir -p $(BUILDDIR)
@@ -115,4 +195,4 @@ clean:
 		$(MAKE) -C $(LIBDIR) BUILD=3D$$build_type clean; \
 		rm -rf build/$$build_type; \
 	done
-	rm -rf $(BUILDDIR) $(TARGET)
+	rm -rf $(BUILDDIR) $(TARGET) $(GENERATED_DIR)/builtin_defs.c
diff --git a/tools/arch/x86/pmtctl/scripts/pmtxml2json.md b/tools/arch/x86/=
pmtctl/scripts/pmtxml2json.md
new file mode 100644
index 000000000000..67eb08a83c86
--- /dev/null
+++ b/tools/arch/x86/pmtctl/scripts/pmtxml2json.md
@@ -0,0 +1,158 @@
+# pmtxml2json: XML =E2=86=92 perf JSON conversion
+
+[`pmtxml2json.py`](pmtxml2json.py) converts Intel PMT (Platform Monitoring
+Technology) Aggregator XML files into perf-style JSON event definitions
+consumed by `pmtctl` (via `gen_builtin_defs.py` =E2=86=92 `generated/built=
in_defs.c`).
+
+This document focuses on the **EventName naming convention** =E2=80=94 the=
 rule used
+to derive a perf-style event name from each `<TELC:sample>` element.
+
+## Inputs
+
+For each sample, only two XML inputs participate in naming:
+
+| Input             | XML source                                | Example =
value             |
+| ----------------- | ----------------------------------------- | --------=
----------------- |
+| `name`            | `name=3D` attribute on `<TELC:sample>`      | `IA_SC=
ALABILITY`          |
+| `sampleSubGroup`  | `<TELC:sampleSubGroup>` child text        | `IA_SCAL=
ABILITY_CORE7`    |
+
+The aggregator's `<TELEM:uniqueid>` (GUID) is used for the output filename
+(`pmt_ep_<guid>.json`), **not** for naming.
+
+`sampleID`, `sampleGroupID`, `lsb`, `msb`, and `productid` are not used to
+build `EventName`. They describe bit layout, packaging, or platform
+identity rather than the metric's identity, and using them would either
+produce names that change when the XML is regenerated or names that
+duplicate information already conveyed by `PMU` / `ConfigCode`.
+
+## Pre-filter: reserved samples
+
+Before naming, samples are dropped if any of the following match the
+case-insensitive pattern `reserved|rsvd` (optionally with trailing digits,
+not embedded in larger tokens):
+
+- the `name` attribute,
+- the `<TELC:sampleSubGroup>` text, or
+- the sample/group `<TELC:description>` text.
+
+Reserved samples never receive an `EventName`.
+
+## Naming rule (lazy prefix)
+
+Within a single aggregator XML, let `N(name)` be the number of non-reserved
+samples sharing the same `name`. For each surviving sample:
+
+1. **Unique name** =E2=80=94 `N(name) =3D=3D 1`:
+   `EventName =3D sanitize(name)`
+2. **Name collides** and `sampleSubGroup` is non-empty and `sampleSubGroup=
 !=3D name`:
+   `EventName =3D sanitize(sampleSubGroup) + "." + sanitize(name)`
+3. **Name collides** but `sampleSubGroup` is empty or equals `name`:
+   `EventName =3D sanitize(name)` (no disambiguation available)
+
+### Why lazy?
+
+`sampleSubGroup` plays two different roles in practice:
+
+- A **metric-instance index** =E2=80=94 e.g. `IA_SCALABILITY_CORE7` qualif=
ies a
+  per-core copy of `IA_SCALABILITY`. Prefixing is meaningful and useful.
+- A **container alias** =E2=80=94 e.g. `INTEL_VERSION_2` is just an enclos=
ing
+  container around an already-unique `RTL_VERSION`. Prefixing here would
+  produce a confusing label like `intel_version_2.rtl_version`.
+
+The lazy rule borrows `sampleSubGroup` **only when `name` actually collide=
s**,
+yielding clean labels in the common case and disambiguated ones when neede=
d.
+
+### `sanitize()`
+
+`_sanitize_token()` normalizes free-form text into a perf-friendly token:
+
+1. Strip leading/trailing whitespace.
+2. Replace any run of non-alphanumeric characters with a single `_`.
+3. Collapse repeated `_` and trim leading/trailing `_`.
+4. Lowercase.
+
+When concatenating subgroup and name, **each part is sanitized
+separately** and joined with a literal `.`, so the dot is preserved in the
+final `EventName` (e.g. `ia_scalability_core7.ia_scalability`).
+
+## Worked example
+
+Consider an aggregator XML containing three samples:
+
+```xml
+<TELC:sampleGroup sampleID=3D"0x0">
+  <TELC:sample name=3D"RTL_VERSION" ...>
+    <TELC:sampleSubGroup>INTEL_VERSION_2</TELC:sampleSubGroup>
+    <TELC:lsb>0</TELC:lsb><TELC:msb>15</TELC:msb>
+  </TELC:sample>
+</TELC:sampleGroup>
+
+<TELC:sampleGroup sampleID=3D"0x10">
+  <TELC:sample name=3D"IA_SCALABILITY" ...>
+    <TELC:sampleSubGroup>IA_SCALABILITY_CORE0</TELC:sampleSubGroup>
+    <TELC:lsb>0</TELC:lsb><TELC:msb>7</TELC:msb>
+  </TELC:sample>
+</TELC:sampleGroup>
+
+<TELC:sampleGroup sampleID=3D"0x11">
+  <TELC:sample name=3D"IA_SCALABILITY" ...>
+    <TELC:sampleSubGroup>IA_SCALABILITY_CORE7</TELC:sampleSubGroup>
+    <TELC:lsb>0</TELC:lsb><TELC:msb>7</TELC:msb>
+  </TELC:sample>
+</TELC:sampleGroup>
+```
+
+Per-aggregator name counts:
+
+| `name`           | count |
+| ---------------- | ----- |
+| `RTL_VERSION`    | 1     |
+| `IA_SCALABILITY` | 2     |
+
+Resulting `EventName`s:
+
+| Sample            | Rule branch                      | EventName        =
                      |
+| ----------------- | -------------------------------- | -----------------=
--------------------- |
+| `RTL_VERSION`     | (1) unique                       | `rtl_version`    =
                      |
+| `IA_SCALABILITY` (CORE0) | (2) collision + distinct subgroup | `ia_scala=
bility_core0.ia_scalability`  |
+| `IA_SCALABILITY` (CORE7) | (2) collision + distinct subgroup | `ia_scala=
bility_core7.ia_scalability`  |
+
+Note that `RTL_VERSION` is **not** prefixed with its `INTEL_VERSION_2`
+container, even though `sampleSubGroup` is set =E2=80=94 because the name =
is
+already unique within the aggregator.
+
+## Output shape
+
+For each emitted sample, the JSON object is:
+
+```json
+{
+  "PMU": "pmt_ep_<guid>",
+  "EventName": "<name per rule above>",
+  "BriefDescription": "<sample or group description>",
+  "MetricGroup": "pmt",
+  "ConfigCode": "0x<msb><lsb><sampleID>",
+  "PlatformGroup": "<optional, from --by-path>"
+}
+```
+
+`ConfigCode` packs the perf config bits as:
+
+```
+bits  0..15  sampleID
+bits 16..23  lsb
+bits 24..31  msb
+```
+
+## EventName uniqueness
+
+Within a single aggregator XML the three-rule scheme above resolves most
+collisions.  If two samples still share the same `EventName` after
+subgroup-prefix disambiguation (rule 2) =E2=80=94 for example because neit=
her has a
+usable `sampleSubGroup` =E2=80=94 the converter applies a last-resort ordi=
nal suffix
+`__0`, `__1`, =E2=80=A6 and emits a `WARN` line to stderr.  The double-und=
erscore is
+chosen to be visually distinct from any XML field so it is not mistaken fo=
r a
+meaningful part of the metric name.
+
+Across **different** GUIDs, names may repeat =E2=80=94 they live in distin=
ct PMUs
+and are disambiguated by the `PMU` field.
diff --git a/tools/arch/x86/pmtctl/scripts/pmtxml2json.py b/tools/arch/x86/=
pmtctl/scripts/pmtxml2json.py
new file mode 100755
index 000000000000..31995f0fc72e
--- /dev/null
+++ b/tools/arch/x86/pmtctl/scripts/pmtxml2json.py
@@ -0,0 +1,883 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-only
+"""Convert Intel PMT aggregator XML files into perf JSON events.
+
+Provides core XML-to-event conversion plus optional Intel-PMT repository
+fetch/cache support.
+"""
+
+import argparse
+import glob
+import json
+import os
+import re
+import shutil
+import subprocess
+import sys
+import traceback
+
+from dataclasses import dataclass
+from typing import Dict, List, Optional, Tuple
+
+from lxml import etree  # pylint: disable=3Dc-extension-no-member
+
+METRIC_GROUP =3D "pmt"
+INTEL_PMT_REPO_URL =3D "https://github.com/intel/Intel-PMT"
+
+
+def _expand_path(path: str) -> str:
+    """Return an absolute path with user home expansion applied."""
+    return os.path.abspath(os.path.expanduser(path))
+
+
+def _repo_dir_name_from_url(repo_url: str) -> str:
+    """Return a deterministic cache directory name for a git repository UR=
L."""
+    cleaned =3D (repo_url or "").rstrip("/")
+    if cleaned.endswith(".git"):
+        cleaned =3D cleaned[: -len(".git")]
+
+    base =3D os.path.basename(cleaned) or "repo"
+    base =3D re.sub(r"[^0-9A-Za-z._-]+", "-", base).strip("-")
+    return base or "repo"
+
+
+def _fetch_intel_pmt_xml_root(
+    cache_dir: str,
+    refresh: bool =3D False,
+    debug: bool =3D False,
+    repo_url: str =3D INTEL_PMT_REPO_URL,
+) -> Optional[str]:
+    """Ensure Intel-PMT exists in cache and return its xml root path."""
+    cache_root =3D _expand_path(cache_dir)
+    repo_dir =3D os.path.join(cache_root, _repo_dir_name_from_url(repo_url=
))
+
+    os.makedirs(cache_root, exist_ok=3DTrue)
+
+    try:
+        if not os.path.isdir(repo_dir):
+            if debug:
+                print(
+                    f"# fetch: cloning {repo_url} into {repo_dir}",
+                    file=3Dsys.stderr,
+                )
+            subprocess.run(
+                ["git", "clone", "--depth", "1", repo_url, repo_dir],
+                check=3DTrue,
+                stdout=3Dsubprocess.PIPE,
+                stderr=3Dsubprocess.PIPE,
+                text=3DTrue,
+                timeout=3D300,
+            )
+        elif refresh:
+            if debug:
+                print(f"# fetch: refreshing cached repo at {repo_dir}", fi=
le=3Dsys.stderr)
+            subprocess.run(
+                ["git", "-C", repo_dir, "pull", "--ff-only"],
+                check=3DTrue,
+                stdout=3Dsubprocess.PIPE,
+                stderr=3Dsubprocess.PIPE,
+                text=3DTrue,
+                timeout=3D300,
+            )
+        elif debug:
+            print(f"# fetch: using cached repo at {repo_dir}", file=3Dsys.=
stderr)
+    except FileNotFoundError:
+        print("ERROR: git is not installed or not found in PATH.", file=3D=
sys.stderr)
+        return None
+    except subprocess.TimeoutExpired:
+        print("ERROR: fetching Intel-PMT timed out.", file=3Dsys.stderr)
+        return None
+    except subprocess.CalledProcessError as ex:
+        err =3D (ex.stderr or "").strip()
+        print("ERROR: failed to fetch Intel-PMT repository.", file=3Dsys.s=
tderr)
+        if err:
+            print(f"       git stderr: {err}", file=3Dsys.stderr)
+        return None
+
+    xml_root =3D os.path.join(repo_dir, "xml")
+    if not os.path.isdir(xml_root):
+        print(
+            (
+                "ERROR: fetched repository does not contain expected xml "
+                f"directory: {xml_root}"
+            ),
+            file=3Dsys.stderr,
+        )
+        return None
+
+    return xml_root
+
+
+def _find_pmt_xml(
+    fetched_xml_root: Optional[str], by_path: Optional[str]
+) -> Optional[str]:
+    """Locate pmt.xml in the Intel-PMT xml/ folder.
+
+    Prefer the fetched repo's xml root. Otherwise, walk upward from --by-p=
ath
+    looking for a pmt.xml sibling (xml/ folder root).
+    """
+    candidates: List[str] =3D []
+    if fetched_xml_root:
+        candidates.append(os.path.join(fetched_xml_root, "pmt.xml"))
+
+    if by_path:
+        start =3D by_path
+        if os.path.isfile(start):
+            start =3D os.path.dirname(start) or "."
+        start =3D os.path.abspath(start)
+        cur =3D start
+        while True:
+            candidates.append(os.path.join(cur, "pmt.xml"))
+            parent =3D os.path.dirname(cur)
+            if parent =3D=3D cur:
+                break
+            cur =3D parent
+
+    for c in candidates:
+        if os.path.isfile(c):
+            return c
+    return None
+
+
+# ---------- Reserved/RSVD skipping ----------
+# Name: match 'reserved' or 'rsvd' with optional digits, not embedded in l=
arger tokens
+RESERVED_RX =3D re.compile(
+    r"(?<![a-z0-9])(reserved|rsvd)(?:\d+)?(?![a-z0-9])", re.IGNORECASE
+)
+# Description: exact 'reserved' or 'rsvd' with optional trailing digits/wh=
itespace
+DESC_RESERVED_RX =3D re.compile(r"\s*(?:reserved|rsvd)(?:\s*\d+)?\s*$", re=
.IGNORECASE)
+
+
+@dataclass(frozen=3DTrue)
+class SampleDef:  # pylint: disable=3Dtoo-many-instance-attributes
+    """Normalized representation of one PMT sample field definition."""
+
+    guid: int
+    group_name: str
+    sample_id: int
+    sample_name: str
+    lsb: int
+    msb: int
+    datatype_idref: Optional[str]
+    description: Optional[str]
+    sample_type: Optional[str]
+    sample_subgroup: Optional[str]
+
+
+@dataclass
+class Counters:
+    """Per-file conversion counters for summary diagnostics."""
+
+    total: int =3D 0
+    emitted: int =3D 0
+    skipped: int =3D 0
+
+
+def norm(tag: str) -> str:
+    """Return XML tag name without namespace prefix."""
+    return tag[tag.rfind("}") + 1 :] if "}" in tag else tag
+
+
+def parse_xml(xml_path: str):
+    """Parse and return the XML root element for the given file path."""
+    # pylint: disable-next=3Dc-extension-no-member
+    parser =3D etree.XMLParser(load_dtd=3DTrue, resolve_entities=3DTrue, n=
o_network=3DFalse)
+    # pylint: disable-next=3Dc-extension-no-member
+    root =3D etree.parse(xml_path, parser).getroot()
+
+    return root
+
+
+def _basedir_to_name(basedir: str) -> str:
+    """Normalize pmt.xml <basedir> into the per-GUID short name.
+
+    Lowercases the string and replaces '/' with '_'. Other characters
+    (including existing hyphens like 'RMID-EE') are preserved.
+    """
+    if not basedir:
+        return ""
+    return basedir.strip().lower().replace("/", "_")
+
+
+def _parse_mapping_entry(
+    m,
+) -> Optional[Tuple[int, str, str]]:
+    """Extract (guid, name, description) from a <mapping> element.
+
+    Returns None if the mapping has no usable GUID.
+    """
+    guid_txt =3D m.attrib.get("guid")
+    if not guid_txt:
+        return None
+
+    try:
+        guid =3D int(guid_txt, 0)
+    except ValueError:
+        guid =3D int(guid_txt, 16)
+
+    description =3D ""
+    basedir =3D ""
+    for ch in m:
+        t =3D norm(ch.tag).lower()
+        if t =3D=3D "description":
+            description =3D (ch.text or "").strip()
+        elif t =3D=3D "xmlset":
+            for sub in ch:
+                if norm(sub.tag).lower() =3D=3D "basedir":
+                    basedir =3D (sub.text or "").strip()
+
+    return guid, _basedir_to_name(basedir), description
+
+
+def _merge_duplicate_mapping(existing: Dict[str, object], name: str) -> No=
ne:
+    """Merge a duplicate-GUID mapping's alternate name into existing recor=
d."""
+    if not name or name =3D=3D existing["name"]:
+        return
+    extra =3D f"(also: {name})"
+    if existing["description"]:
+        if extra not in existing["description"]:
+            existing["description"] =3D f"{existing['description']} {extra=
}"
+    else:
+        existing["description"] =3D extra
+
+
+def _parse_pmt_xml_guids(pmt_xml_path: str) -> List[Dict[str, object]]:
+    """Parse pmt.xml and return one record per unique <mapping> GUID.
+
+    Each record has: {"guid": int, "name": str, "description": str}.
+    When the same GUID appears in multiple <mapping> entries (unrelated
+    platforms occasionally reuse early GUIDs), the first occurrence wins
+    and subsequent ones are merged into the description (best-effort, for
+    diagnostics).
+    """
+    root =3D parse_xml(pmt_xml_path)
+    entries: List[Dict[str, object]] =3D []
+    by_guid: Dict[int, Dict[str, object]] =3D {}
+
+    for m in root.iter():
+        if norm(m.tag).lower() !=3D "mapping":
+            continue
+
+        parsed =3D _parse_mapping_entry(m)
+        if parsed is None:
+            continue
+        guid, name, description =3D parsed
+
+        existing =3D by_guid.get(guid)
+        if existing is None:
+            rec =3D {"guid": guid, "name": name, "description": descriptio=
n}
+            by_guid[guid] =3D rec
+            entries.append(rec)
+        else:
+            _merge_duplicate_mapping(existing, name)
+
+    entries.sort(key=3Dlambda e: e["guid"])
+    return entries
+
+
+def _write_pmt_guids_json(
+    pmt_xml_src: str, output_dir: str, debug: bool =3D False
+) -> None:
+    """Parse pmt.xml and write a sidecar pmt_guids.json into output_dir."""
+    entries =3D _parse_pmt_xml_guids(pmt_xml_src)
+    out_path =3D os.path.join(output_dir, "pmt_guids.json")
+    serial =3D [
+        {
+            "guid": f"0x{e['guid']:08x}",
+            "name": e["name"],
+            "description": e["description"],
+        }
+        for e in entries
+    ]
+    with open(out_path, "w", encoding=3D"utf-8") as f:
+        json.dump(serial, f, indent=3D2)
+        f.write("\n")
+    if debug:
+        print(f"# wrote {out_path} ({len(serial)} entries)", file=3Dsys.st=
derr)
+
+
+def get_guid(root) -> int:
+    """Extract the telemetry GUID from <uniqueid>."""
+    for e in root.iter():
+        if norm(e.tag).lower() =3D=3D "uniqueid":
+            v =3D (e.text or "").strip()
+            if not v:
+                break
+
+            try:
+                # works for "0x1234" or "1234" if decimal was intended
+                return int(v, 0)
+            except ValueError:
+                # force hex for values without prefix
+                return int(v, 16)
+
+    raise ValueError("Missing <TELEM:uniqueid>")
+
+
+# pylint: disable=3Dtoo-many-locals,too-many-branches,too-many-statements
+def parse_samples(
+    root,
+) -> List[SampleDef]:
+    """Parse SampleGroup/Sample entries into filtered SampleDef records."""
+    guid =3D get_guid(root)
+    out: List[SampleDef] =3D []
+
+    for sg in root.iter():
+        if norm(sg.tag).lower() !=3D "samplegroup":
+            continue
+
+        sid_txt =3D sg.attrib.get("sampleID") or sg.attrib.get("sampleid")
+        if sid_txt is None:
+            raise ValueError("SampleGroup missing sampleID")
+
+        sample_id =3D int(sid_txt, 0)
+        group_name =3D (sg.attrib.get("name") or "").strip() or f"group_{s=
ample_id}"
+        group_len =3D None
+        group_desc =3D None
+
+        for child in sg:
+            t =3D norm(child.tag).lower()
+            if t =3D=3D "length":
+                try:
+                    group_len =3D int((child.text or "").strip(), 0)
+                except (TypeError, ValueError):
+                    pass
+            elif t =3D=3D "description":
+                group_desc =3D (child.text or "").strip()
+
+        if group_len is not None and group_len !=3D 64:
+            raise ValueError(
+                f"{group_name} sampleID=3D{sample_id} length=3D{group_len}=
 (expected 64)"
+            )
+
+        samples =3D [c for c in sg if norm(c.tag).lower() =3D=3D "sample"]
+        if not samples:
+            continue
+
+        for s in samples:
+            sname =3D (s.attrib.get("name") or f"sample_{sample_id}").stri=
p()
+
+            lsb =3D None
+            msb =3D None
+            stype =3D None
+            sdesc =3D None
+            ssubgroup =3D None
+            dtype_ref =3D s.attrib.get("dataTypeIDREF") or s.attrib.get("d=
atatypeIDREF")
+
+            for ch in s:
+                t =3D norm(ch.tag).lower()
+                if t =3D=3D "lsb":
+                    lsb =3D int((ch.text or "").strip(), 0)
+                elif t =3D=3D "msb":
+                    msb =3D int((ch.text or "").strip(), 0)
+                elif t =3D=3D "sampletype":
+                    stype =3D (ch.text or "").strip()
+                elif t =3D=3D "description":
+                    sdesc =3D (ch.text or "").strip()
+                elif t =3D=3D "samplesubgroup":
+                    ssubgroup =3D (ch.text or "").strip()
+                elif t =3D=3D "datatypeidref" and not dtype_ref:
+                    dtype_ref =3D (ch.text or "").strip()
+
+            if lsb is None or msb is None:
+                raise ValueError(f"{sname} (sampleID=3D{sample_id}): missi=
ng lsb/msb")
+
+            if not 0 <=3D lsb <=3D msb < 64:
+                raise ValueError(
+                    f"{sname} (sampleID=3D{sample_id}): invalid bit range =
{lsb}-{msb}"
+                )
+
+            desc_text =3D sdesc if sdesc else group_desc
+
+            # Skip reserved/rsvd samples by name, sampleSubGroup, or descr=
iption
+            is_reserved_name =3D RESERVED_RX.search(sname)
+            is_reserved_sub =3D ssubgroup and RESERVED_RX.search(ssubgroup)
+            is_reserved_desc =3D desc_text and DESC_RESERVED_RX.fullmatch(=
desc_text)
+            if is_reserved_name or is_reserved_sub or is_reserved_desc:
+                continue
+
+            out.append(
+                SampleDef(
+                    guid=3Dguid,
+                    group_name=3Dgroup_name,
+                    sample_id=3Dsample_id,
+                    sample_name=3Dsname,
+                    lsb=3Dlsb,
+                    msb=3Dmsb,
+                    datatype_idref=3Ddtype_ref,
+                    description=3Ddesc_text,
+                    sample_type=3Dstype,
+                    sample_subgroup=3Dssubgroup,
+                )
+            )
+
+    return out
+
+
+def pack_config(sample_id: int, lsb: int, msb: int) -> int:
+    """Pack sample_id/lsb/msb into perf ConfigCode bit layout."""
+    return (sample_id & 0xFFFF) | ((lsb & 0xFF) << 16) | ((msb & 0xFF) << =
24)
+
+
+def _sanitize_token(s: str) -> str:
+    """Normalize free-form text into a lowercase underscore token."""
+    t =3D re.sub(r"[^0-9a-zA-Z]+", "_", s.strip()).lower()
+    t =3D re.sub(r"_+", "_", t).strip("_")
+
+    return t
+
+
+def brief_desc(s: SampleDef) -> str:
+    """Build a short description for perf JSON output."""
+    if s.description:
+        return re.sub(r"\s+", " ", s.description)[:240]
+
+    width =3D s.msb - s.lsb + 1
+
+    return f"{s.sample_name.replace('_', ' ').title()} ({width}b)"
+
+
+def make_event(
+    s: SampleDef,
+    pmu_name: str,
+    name_counts: Dict[str, int],
+    platform_group: Optional[str] =3D None,
+) -> Dict[str, str]:
+    """Create one perf event dictionary for a sample."""
+    cfg =3D pack_config(s.sample_id, s.lsb, s.msb)
+    # Lazy-prefix disambiguation: only borrow sampleSubGroup when the bare
+    # sample name collides with another non-reserved sample in this
+    # aggregator. sampleSubGroup is sometimes a metric-instance index
+    # (e.g. IA_SCALABILITY_CORE7) and sometimes a container alias
+    # (e.g. INTEL_VERSION_2); unconditional prefixing produces confusing
+    # labels in the latter case.
+    if name_counts.get(s.sample_name, 0) <=3D 1:
+        evname =3D _sanitize_token(s.sample_name)
+    elif s.sample_subgroup and s.sample_subgroup !=3D s.sample_name:
+        evname =3D (
+            f"{_sanitize_token(s.sample_subgroup)}.{_sanitize_token(s.samp=
le_name)}"
+        )
+    else:
+        # No subgroup available for disambiguation; return the bare name.
+        # The caller is responsible for detecting and resolving any result=
ing
+        # duplicate EventName via _resolve_duplicate_event_names().
+        evname =3D _sanitize_token(s.sample_name)
+
+    e =3D {
+        "PMU": pmu_name,
+        "EventName": evname,
+        "BriefDescription": brief_desc(s),
+        "MetricGroup": METRIC_GROUP,
+        "ConfigCode": f"0x{cfg:08x}",
+    }
+
+    if platform_group:
+        e["PlatformGroup"] =3D platform_group
+
+    return e
+
+
+def _resolve_duplicate_event_names(
+    out: List[Dict[str, str]], pmu_name: str, agg_xml: str
+) -> None:
+    """Detect duplicate EventNames and rename collisions as name__0, name_=
_1, ...
+
+    The subgroup-prefix disambiguation in make_event covers the common cas=
e.
+    This function is a last-resort safety net for names that could not be
+    disambiguated there (e.g. no usable sampleSubGroup).  The double-under=
score
+    suffix is intentionally distinct from any XML field so it is not mista=
ken
+    for a meaningful part of the metric name.
+    """
+    seen: Dict[str, List[int]] =3D {}
+    for i, e in enumerate(out):
+        name =3D e["EventName"]
+        seen.setdefault(name, []).append(i)
+
+    for name, indices in seen.items():
+        if len(indices) <=3D 1:
+            continue
+        print(
+            f"WARN: {agg_xml}: PMU=3D{pmu_name}: "
+            f"EventName '{name}' collision ({len(indices)} entries); "
+            f"renaming as {name}__0 .. {name}__{len(indices) - 1}",
+            file=3Dsys.stderr,
+        )
+        for ordinal, idx in enumerate(indices):
+            out[idx]["EventName"] =3D f"{name}__{ordinal}"
+
+
+# ------------------------------
+# main()
+# ------------------------------
+# pylint: disable=3Dtoo-many-locals,too-many-branches,too-many-statements
+def main(
+    argv: List[str],
+) -> int:
+    """CLI entry point: discover XML files, convert, and write JSON output=
s."""
+    ap =3D argparse.ArgumentParser(
+        description=3D"Convert Intel PMT Aggregator XML to perf JSON (inte=
l_pmt only)"
+    )
+    ap.add_argument(
+        "xml",
+        nargs=3D"?",
+        help=3D"Input PMT Aggregator XML file (optional when using --by-pa=
th)",
+    )
+    ap.add_argument(
+        "--by-path",
+        default=3DNone,
+        help=3D(
+            "Directory to auto-discover PMT XMLs. When used without a "
+            "positional XML, processes all *_aggregator.xml recursively "
+            "and emits one output per directory."
+        ),
+    )
+    ap.add_argument(
+        "--output-dir",
+        default=3DNone,
+        help=3D(
+            "Directory where JSON output files will be placed. Used "
+            "verbatim (files are written flat by GUID). If omitted, "
+            "the deepest folder name from --by-path is used (lowercased)."
+        ),
+    )
+    ap.add_argument(
+        "--fetch-pmt-repo",
+        action=3D"store_true",
+        help=3D(
+            "Fetch Intel-PMT repository and use its xml folder when "
+            "local xml/by-path inputs are not provided."
+        ),
+    )
+    ap.add_argument(
+        "--pmt-cache-dir",
+        default=3D"~/.cache/pmtctl",
+        help=3D(
+            "Cache directory for Intel-PMT repository clone "
+            "(default: ~/.cache/pmtctl)."
+        ),
+    )
+    ap.add_argument(
+        "--refresh-pmt-repo",
+        action=3D"store_true",
+        help=3D(
+            "Refresh cached Intel-PMT repository before conversion "
+            "(used with --fetch-pmt-repo)."
+        ),
+    )
+    ap.add_argument(
+        "--pmt-repo-url",
+        default=3DINTEL_PMT_REPO_URL,
+        help=3Dargparse.SUPPRESS,
+    )
+    ap.add_argument("--debug", action=3D"store_true")
+    args =3D ap.parse_args(argv)
+
+    if args.refresh_pmt_repo and not args.fetch_pmt_repo:
+        print(
+            "ERROR: --refresh-pmt-repo requires --fetch-pmt-repo.",
+            file=3Dsys.stderr,
+        )
+        return 2
+
+    fetched_xml_root: Optional[str] =3D None
+    if args.fetch_pmt_repo:
+        fetched_xml_root =3D _fetch_intel_pmt_xml_root(
+            cache_dir=3Dargs.pmt_cache_dir,
+            refresh=3Dargs.refresh_pmt_repo,
+            debug=3Dargs.debug,
+            repo_url=3Dargs.pmt_repo_url,
+        )
+        if fetched_xml_root is None:
+            return 2
+        if args.debug:
+            print(f"# fetch: xml root=3D{fetched_xml_root}", file=3Dsys.st=
derr)
+        if args.by_path is None and args.xml is None:
+            args.by_path =3D fetched_xml_root
+
+    # ------------------------------
+    # Auto-discovery helpers
+    # ------------------------------
+    def _pick_one(cands, label):
+        """Pick deterministically: shortest path first, then alphabetical.=
"""
+        if not cands:
+            return None
+
+        cands =3D sorted(cands, key=3Dlambda p: (len(p), p))
+        if args.debug and len(cands) > 1:
+            print(
+                (
+                    f"# by-path: multiple {label} matches, choosing: {cand=
s[0]} ; "
+                    f"others: {cands[1:]}"
+                ),
+                file=3Dsys.stderr,
+            )
+
+        return cands[0]
+
+    def _discover_xmls_by_path(p):
+        """Return (aggregator, common) or (None, None) if not found."""
+        if not p:
+            return (None, None)
+
+        base =3D p
+        if os.path.isfile(base):
+            base =3D os.path.dirname(base) or "."
+
+        # First, non-recursive search
+        agg =3D glob.glob(os.path.join(base, "*_aggregator.xml"))
+        com =3D glob.glob(os.path.join(base, "*_common.xml"))
+
+        # If any missing, try recursive
+        if not agg or not com:
+            agg =3D agg or glob.glob(
+                os.path.join(base, "**", "*_aggregator.xml"), recursive=3D=
True
+            )
+            com =3D com or glob.glob(
+                os.path.join(base, "**", "*_common.xml"), recursive=3DTrue
+            )
+
+        return (
+            _pick_one(agg, "aggregator"),
+            _pick_one(com, "common"),
+        )
+
+    def _rel_parts_from_root(d: str, root: str) -> List[str]:
+        """Return sanitized relative path segments from root to d."""
+        try:
+            rel =3D os.path.relpath(os.path.normpath(d), os.path.normpath(=
root))
+        except ValueError:
+            return []
+        if rel in (".", "") or rel.startswith(".."):
+            return []
+
+        def _seg(s: str) -> str:
+            s =3D (s or "").strip().lower()
+            s =3D re.sub(r"[^0-9a-z]+", "-", s)
+            return re.sub(r"-+", "-", s).strip("-")
+
+        out: List[str] =3D []
+        for seg in rel.split(os.sep):
+            if seg in (".", ".."):
+                continue
+            s =3D _seg(seg)
+            if s:
+                out.append(s)
+        return out
+
+    def _discover_all_xml_sets_by_path(
+        p: str,
+    ) -> List[Tuple[str, List[str]]]:
+        """Return a list of (aggregator, rel_parts) work items."""
+        if not p:
+            return []
+
+        base =3D p
+        if os.path.isfile(base):
+            base =3D os.path.dirname(base) or "."
+
+        # Find every directory that contains an *_aggregator.xml
+        agg_all =3D glob.glob(
+            os.path.join(base, "**", "*_aggregator.xml"), recursive=3DTrue
+        )
+        if not agg_all:
+            # allow the base directory itself
+            agg_all =3D glob.glob(os.path.join(base, "*_aggregator.xml"))
+
+        dir_to_aggs: Dict[str, List[str]] =3D {}
+        for a in agg_all:
+            d =3D os.path.dirname(a) or "."
+            dir_to_aggs.setdefault(d, []).append(a)
+
+        work: List[Tuple[str, List[str]]] =3D []
+        for d in sorted(dir_to_aggs.keys()):
+            agg =3D _pick_one(dir_to_aggs[d], "aggregator")
+            if not agg:
+                continue
+
+            rel_parts =3D _rel_parts_from_root(d, base)
+            work.append((agg, rel_parts))
+
+        return work
+
+    # Determine work items
+    work_items: List[Tuple[str, List[str]]] =3D []
+
+    if args.by_path and args.xml is None:
+        # Recursive multi-mode
+        work_items =3D _discover_all_xml_sets_by_path(args.by_path)
+        if args.debug:
+            print(
+                f"# by-path discovered {len(work_items)} aggregator direct=
ory(ies)",
+                file=3Dsys.stderr,
+            )
+    else:
+        # Single-mode (backwards compatible): by-path can auto-fill missin=
g files
+        if args.by_path:
+            a_auto, _ =3D _discover_xmls_by_path(args.by_path)
+            if args.xml is None:
+                args.xml =3D a_auto
+            if args.debug:
+                print(
+                    f"# by-path resolved: xml=3D{args.xml}",
+                    file=3Dsys.stderr,
+                )
+
+        if args.xml:
+            rel_parts: List[str] =3D []
+            if args.by_path:
+                rel_parts =3D _rel_parts_from_root(
+                    os.path.dirname(args.xml) or ".", args.by_path
+                )
+            work_items =3D [(args.xml, rel_parts)]
+
+    # Sanity check: we must have at least one aggregator XML to process
+    if not work_items:
+        print(
+            (
+                "ERROR: No aggregator XML specified or discovered. "
+                "Provide a file or use --by-path."
+            ),
+            file=3Dsys.stderr,
+        )
+        return 2
+
+    # Determine output directory.
+    #
+    # If --output-dir is given, use it verbatim; outputs are written flat
+    # by GUID (pmt_ep_<guid>.json). If omitted, fall back to a folder
+    # named after the deepest --by-path directory (lowercased).
+    output_dir: Optional[str] =3D None
+    if args.output_dir:
+        output_dir =3D args.output_dir
+    elif args.by_path:
+        by_path =3D args.by_path
+        if os.path.isfile(by_path):
+            by_path =3D os.path.dirname(by_path) or "."
+        deepest_folder =3D os.path.basename(os.path.normpath(by_path))
+        output_dir =3D (
+            "jsons" if deepest_folder.lower() =3D=3D "xml" else deepest_fo=
lder.lower()
+        )
+
+    # Create output directory if specified
+    if output_dir:
+        os.makedirs(output_dir, exist_ok=3DTrue)
+        if args.debug:
+            print(f"# output directory: {output_dir}", file=3Dsys.stderr)
+
+    # Copy pmt.xml from the Intel-PMT xml/ folder into the output directory
+    if output_dir:
+        pmt_xml_src =3D _find_pmt_xml(fetched_xml_root, args.by_path)
+        if pmt_xml_src:
+            pmt_xml_dst =3D os.path.join(output_dir, "pmt.xml")
+            shutil.copyfile(pmt_xml_src, pmt_xml_dst)
+            if args.debug:
+                print(
+                    f"# copied {pmt_xml_src} -> {pmt_xml_dst}",
+                    file=3Dsys.stderr,
+                )
+            _write_pmt_guids_json(pmt_xml_src, output_dir, debug=3Dargs.de=
bug)
+        elif args.debug:
+            print("# pmt.xml not found; skipping copy", file=3Dsys.stderr)
+
+    # Process each discovered set
+    any_failed =3D False
+    written_by_guid: Dict[int, str] =3D {}
+
+    for agg_xml, rel_parts in work_items:
+        try:
+            # Load the main aggregator XML
+            root =3D parse_xml(agg_xml)
+            guid =3D get_guid(root)
+
+            pmu_name =3D f"pmt_ep_{guid:08x}"
+            base_filename =3D f"{pmu_name}.json"
+            out_filename =3D (
+                os.path.join(output_dir, base_filename) if output_dir else=
 base_filename
+            )
+
+            # GUIDs are globally unique to a telemetry layout; a duplicate
+            # across aggregators indicates a source-data bug, not something
+            # to silently paper over by namespacing the output.
+            prior =3D written_by_guid.get(guid)
+            if prior is not None:
+                raise ValueError(
+                    f"duplicate GUID 0x{guid:08x} from {agg_xml}; "
+                    f"previously emitted by {prior}"
+                )
+
+            samples =3D parse_samples(root)
+            ctr =3D Counters(total=3Dlen(samples))
+
+            # Per-aggregator platform group derived from its location under
+            # the discovery root (e.g. "alderlake-s"). Falls back to the
+            # by-path basename for the single-mode case.
+            platform_group: Optional[str] =3D None
+            if rel_parts:
+                platform_group =3D rel_parts[0].upper()
+            elif args.by_path:
+                by_path =3D args.by_path
+                if os.path.isfile(by_path):
+                    by_path =3D os.path.dirname(by_path) or "."
+                deepest_folder =3D os.path.basename(os.path.normpath(by_pa=
th))
+                if deepest_folder and deepest_folder.lower() !=3D "xml":
+                    platform_group =3D deepest_folder.upper()
+
+            out =3D []
+
+            # Pre-pass: count bare sample-name occurrences within this
+            # aggregator so make_event can apply lazy-prefix disambiguatio=
n.
+            name_counts: Dict[str, int] =3D {}
+            for s in samples:
+                name_counts[s.sample_name] =3D name_counts.get(s.sample_na=
me, 0) + 1
+
+            for s in samples:
+                try:
+                    # Build event
+                    e =3D make_event(
+                        s,
+                        pmu_name,
+                        name_counts,
+                        platform_group=3Dplatform_group,
+                    )
+
+                    out.append(e)
+                    ctr.emitted +=3D 1
+                except Exception as ex:  # pylint: disable=3Dbroad-excepti=
on-caught
+                    ctr.skipped +=3D 1
+                    print(
+                        (
+                            f"WARN: skipping {s.sample_name} "
+                            f"(sampleID=3D{s.sample_id}): {ex}"
+                        ),
+                        file=3Dsys.stderr,
+                    )
+                    traceback.print_exc()
+
+            # Last-resort: detect and rename any duplicate EventNames that
+            # subgroup-prefix disambiguation could not resolve.
+            _resolve_duplicate_event_names(out, pmu_name, agg_xml)
+
+            # Write events JSON
+            with open(out_filename, "w", encoding=3D"utf-8") as f:
+                json.dump(out, f, indent=3D2)
+                f.write("\n")
+
+            written_by_guid[guid] =3D agg_xml
+            print(f"# wrote {out_filename}", file=3Dsys.stderr)
+            print(
+                (
+                    f"# PMU=3D{pmu_name} total=3D{ctr.total} "
+                    f"emitted=3D{ctr.emitted} skipped=3D{ctr.skipped}"
+                ),
+                file=3Dsys.stderr,
+            )
+
+        except Exception:  # pylint: disable=3Dbroad-exception-caught
+            any_failed =3D True
+            print(f"ERROR: failed processing aggregator=3D{agg_xml}", file=
=3Dsys.stderr)
+
+    return 1 if any_failed else 0
+
+
+if __name__ =3D=3D "__main__":
+    sys.exit(main(sys.argv[1:]))
--=20
2.43.0

