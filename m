Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AC82DB7B8;
	Tue, 26 May 2026 01:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779760081; cv=none; b=ICzzIbdfixpGWXqTH9y7DoMLnWqSQkM7VlslFy9yME0/9cRUebSvK6kpvNbvdSRlc7YpcL5do9AfbBU5qjah2OgPbCqifsku/OcLwPvLw1cOjDydA9MOvSVdrt+wzRmhUPl8zWR9hTWb1dY0Mv6IdeNzAvJytM/6gIkVqMwXVoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779760081; c=relaxed/simple;
	bh=HEKKUtnWMHrdSJ7wF0Eva25nxfUTbnjAbF9V+sQOCgw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ArIyjNaUFzgAG7IG7u7HJUEMDwy6/eG/Fo1IJrMJvynyXd3/Xh9yVmYcGGNcSJ4VW922och/vQv9aj2LCFylk7qaXaeARi0oMEz4OjRO4ZWapQprg92v0hbhsfNZCWcbM7yAxTqXpKnw4vttRI0qXN61k4seqDVS0GGDGhbJ2gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fe4QUtvw; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fe4QUtvw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779760074; x=1811296074;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=HEKKUtnWMHrdSJ7wF0Eva25nxfUTbnjAbF9V+sQOCgw=;
  b=fe4QUtvw9fcojgRLSleDoRgxtgtf68UQehjT4oFiTk6QeEKLko6OcTsX
   KQUpBFYST8uDHlhmeTOFRxmv7xXSKzN/7TKEHpFmvMuP649CyV6vgZGNR
   17vnc/zEmTQi5vIrxN0Yn/v6XBwanhHzHHHmPCURYhZM+rxMaNOHf6SUo
   fXG5+kScEL4ahbZqWoVkaHVhF43LMyrm5ofbyitpi+WqxNZc689fJSGkb
   C/fXOH/bpeCfqY1qbvXqkjweC59xpMR/DWuVKoQ8FQjh4DRlXnfVui/qJ
   h9h9OoiYNSsU3xVCQ0dHNnukUchc6MXcoEHR+1CgX/Pq5e3/TEsrqulD+
   w==;
X-CSE-ConnectionGUID: iF0v5y2/TaGqfUW0pWQAsg==
X-CSE-MsgGUID: ZN4xR4JLRNC20qrgMsUing==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80539896"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="80539896"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 18:47:33 -0700
X-CSE-ConnectionGUID: w7VGAvloQNKZIgXE50EjzQ==
X-CSE-MsgGUID: g6tlPOeRSC2UYCCP6uv4Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="272074979"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 18:47:33 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 11/17] tools/arch/x86/pmtctl: Add libpmtctl built-in metric definition support
Date: Mon, 25 May 2026 18:47:09 -0700
Message-ID: <20260526014719.2248380-12-david.e.box@linux.intel.com>
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

Add support for compiling PMT metric definitions directly into
libpmtctl_core so tools can operate without requiring external JSON
definition files at runtime.

Built-in definitions avoid a runtime dependency on host filesystem data by
embedding generated metric definition tables directly into the library.
When no path argument is provided, pmt_metrics_load() serves definitions
from the built-in table.

Add a Python generator script to convert defs/*.json into a generated C
definition table used by the library build. An empty stub table remains
available for builds where generation is skipped, preserving the existing
runtime contract where pmt_metrics_load() returns PMTCTL_ERR_NOMETRICS when
no definitions are present.

Add a top-level 'make defs' target and update the README and CLI
documentation to describe the built-in definition workflow.

Assisted-by: GitHub-Copilot:claude-sonnet-4.6
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 tools/arch/x86/pmtctl/lib/Makefile            |  34 +-
 .../x86/pmtctl/scripts/gen_builtin_defs.py    | 405 ++++++++++++++++++
 2 files changed, 437 insertions(+), 2 deletions(-)
 create mode 100755 tools/arch/x86/pmtctl/scripts/gen_builtin_defs.py

diff --git a/tools/arch/x86/pmtctl/lib/Makefile b/tools/arch/x86/pmtctl/lib=
/Makefile
index e2aeff1935cf..2dbd4e5b95a0 100644
--- a/tools/arch/x86/pmtctl/lib/Makefile
+++ b/tools/arch/x86/pmtctl/lib/Makefile
@@ -1,5 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0-only
=20
+# Remove targets whose recipe exited non-zero so a failed codegen step
+# does not leave a truncated $@ behind that fools the next build.
+.DELETE_ON_ERROR:
+
 CC      :=3D gcc
 AR      :=3D ar
 RANLIB  :=3D ranlib
@@ -33,8 +37,7 @@ CORE_SRC :=3D \
 	metrics_db.c \
 	pmt_guid.c \
 	pmtctl.c \
-	metrics_provider.c \
-	builtin_defs_empty.c
+	metrics_provider.c
=20
 HAVE_JANSSON ?=3D 0
 ifeq ($(HAVE_JANSSON),1)
@@ -45,6 +48,17 @@ endif
=20
 CORE_OBJ :=3D $(patsubst %.c,$(BUILDDIR)/%.o,$(CORE_SRC))
=20
+# Built-in metric definitions: use the generated table when available,
+# otherwise fall back to the empty stub. Both sources export builtin_defs[]
+# and builtin_defs_count and are compiled to a fixed object name so the
+# choice is transparent to the rest of the library.
+# Use 'find' (recursive) to match the top-level Makefile; $(wildcard) would
+# silently miss any JSON files placed in defs/ subdirectories.
+DEFS_JSON ?=3D $(shell find ../defs -name '*.json' 2>/dev/null)
+BUILTIN_DEFS_SRC :=3D $(if $(wildcard ../generated/builtin_defs.c),../gene=
rated/builtin_defs.c,builtin_defs_empty.c)
+BUILTIN_DEFS_OBJ :=3D $(BUILDDIR)/builtin_defs.o
+CORE_OBJ +=3D $(BUILTIN_DEFS_OBJ)
+
 PREFIX ?=3D /usr/local
 DESTDIR ?=3D
 INCLUDEDIR ?=3D $(PREFIX)/include/pmtctl
@@ -77,6 +91,22 @@ $(BUILDDIR)/%.o: %.c
 	@mkdir -p $(BUILDDIR)
 	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@
=20
+$(BUILTIN_DEFS_OBJ): $(BUILTIN_DEFS_SRC)
+	@mkdir -p $(BUILDDIR)
+	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@
+
+../generated/builtin_defs.c: ../scripts/gen_builtin_defs.py $(DEFS_JSON)
+	@mkdir -p ../generated
+	@if [ -z "$(DEFS_JSON)" ]; then \
+		echo "No JSON files in defs/. Nothing to generate."; \
+	else \
+		if ! command -v python3 >/dev/null 2>&1; then \
+			echo "python3 is required to generate builtin defs but was not found." =
>&2; \
+			exit 1; \
+		fi; \
+		python3 ../scripts/gen_builtin_defs.py $(DEFS_JSON) > $@; \
+	fi
+
 install: all install-lib install-headers install-pkgconfig
=20
 install-lib: all
diff --git a/tools/arch/x86/pmtctl/scripts/gen_builtin_defs.py b/tools/arch=
/x86/pmtctl/scripts/gen_builtin_defs.py
new file mode 100755
index 000000000000..5e34c8f9a1b3
--- /dev/null
+++ b/tools/arch/x86/pmtctl/scripts/gen_builtin_defs.py
@@ -0,0 +1,405 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Auto-generate builtin_defs.c from PMT perf-style JSON files.
+#
+"""Auto-generate builtin_defs.c from PMT perf-style JSON event files."""
+
+import sys
+import re
+import json
+from pathlib import Path
+
+# We only sanity-check that these fields exist in struct pmt_metric_def.
+EXPECTED_FIELDS =3D [
+    "event_name",
+    "description",
+    "group",
+    "platform_group",
+    "guid",
+    "sample_id",
+    "lsb",
+    "msb",
+]
+
+PMT_GUIDS_JSON_NAME =3D "pmt_guids.json"
+
+
+def find_project_root(start: Path) -> Path:
+    """
+    Walk upward until we find 'include/lib/metrics_db.h'.
+    This allows running the generator from anywhere:
+    - project root
+    - tools/
+    - build system
+    - editor integration
+    """
+    cur =3D start.resolve()
+    root =3D cur.anchor
+
+    while True:
+        candidate =3D cur / "include" / "lib" / "metrics_db.h"
+        if candidate.exists():
+            return cur
+        if str(cur) =3D=3D root:
+            break
+        cur =3D cur.parent
+
+    sys.stderr.write(
+        "ERROR: Could not locate 'include/lib/metrics_db.h'. "
+        "Run from inside the project tree.\n"
+    )
+    sys.exit(1)
+
+
+PROJECT_ROOT =3D find_project_root(Path(__file__).parent)
+METRICS_DB_H =3D PROJECT_ROOT / "include" / "lib" / "metrics_db.h"
+
+
+def parse_struct_fields(header_path: Path):
+    """Parse struct pmt_metric_def from metrics_db.h and return [(type, na=
me), ...]."""
+
+    sys.stderr.write(f"Using metrics_db.h at: {header_path}\n")
+
+    text =3D header_path.read_text()
+
+    m =3D re.search(r"struct\s+pmt_metric_def\s*\{([^}]*)\}", text, re.S)
+    if not m:
+        sys.stderr.write(
+            "ERROR: could not find struct pmt_metric_def in metrics_db.h\n"
+        )
+        sys.exit(1)
+
+    block =3D m.group(1)
+    fields: list[tuple[str, str]] =3D []
+
+    for raw in block.splitlines():
+        line =3D raw.strip()
+        if not line:
+            continue
+        if line.startswith("/*") or line.startswith("//"):
+            continue
+        if ";" not in line:
+            continue
+
+        # Take text before ';'
+        before =3D line.split(";", 1)[0]
+
+        # Strip trailing // and /* ... */ comments crudely
+        before =3D before.split("//", 1)[0]
+        before =3D before.split("/*", 1)[0]
+        before =3D before.rstrip()
+        if not before:
+            continue
+
+        # Find the trailing identifier (the field name)
+        m_name =3D re.search(r"([A-Za-z_][A-Za-z0-9_]*)$", before)
+        if not m_name:
+            continue
+
+        name =3D m_name.group(1)
+        type_part =3D before[: m_name.start()].rstrip()
+        if not type_part:
+            continue
+
+        fields.append((type_part, name))
+
+    sys.stderr.write("Parsed fields in struct pmt_metric_def:\n")
+    for t, n in fields:
+        sys.stderr.write(f"  {t} {n}\n")
+
+    return fields
+
+
+def check_expected_fields(fields):
+    """Verify that all EXPECTED_FIELDS are present in the parsed struct fi=
elds."""
+    names =3D [name for (_ty, name) in fields]
+    missing =3D [f for f in EXPECTED_FIELDS if f not in names]
+    if missing:
+        sys.stderr.write(
+            "ERROR: metrics_db.h struct pmt_metric_def is missing fields: "
+            + ", ".join(missing)
+            + "\n"
+        )
+        sys.exit(1)
+
+
+def parse_guid_from_pmu(pmu_str: str) -> int:
+    """
+    Example PMU strings:
+        "pmt_ep_22806802"
+        "pmt_ep_22806802_s0_r0" (future)
+    We take the last underscore-separated token and interpret it as hex.
+    """
+
+    if not pmu_str:
+        return 0
+
+    parts =3D pmu_str.split("_")
+    tail =3D parts[-1]
+    try:
+        return int(tail, 16)
+    except ValueError:
+        # Fallback: unknown format, just 0 it for now
+        return 0
+
+
+def decode_config_code(cfg: int):
+    """
+    ConfigCode mapping (from your spec):
+
+        bits[15:0]   =3D sample_id
+        bits[23:16]  =3D lsb
+        bits[31:24]  =3D msb
+        bits[63:32]  =3D reserved/0
+    """
+
+    sample_id =3D cfg & 0xFFFF
+    lsb =3D (cfg >> 16) & 0xFF
+    msb =3D (cfg >> 24) & 0xFF
+    return sample_id, lsb, msb
+
+
+def load_events_from_json(path: Path):
+    """Load and return the list of event dicts from a JSON file."""
+    with path.open("r", encoding=3D"utf-8") as f:
+        data =3D json.load(f)
+
+    if not isinstance(data, list):
+        raise ValueError(f"{path}: expected top-level JSON array")
+
+    return data
+
+
+def emit_header():
+    """Print the C file header and includes."""
+    print("/* Auto-generated by tools/gen_builtin_defs.py; do not edit. */=
")
+    print('#include "lib/metrics_db.h"')
+    print('#include "lib/pmt_guid.h"')
+    print()
+
+
+def emit_guid_table(guids: list[dict]):
+    """Emit the builtin_guids[] array and its count."""
+    print("const struct pmt_guid builtin_guids[] =3D {")
+    for g in guids:
+        print("    {")
+        print(f"        .guid        =3D 0x{g['guid']:08x},")
+        print(f"        .name        =3D {c_str(g.get('name') or None)},")
+        print(f"        .description =3D {c_str(g.get('description') or No=
ne)},")
+        print("    },")
+    print("};")
+    print()
+    print(f"const int builtin_guids_count =3D {len(guids)};")
+    print()
+
+
+def emit_defs_open():
+    """Print the opening brace for builtin_defs[]."""
+    print("const struct pmt_metric_def builtin_defs[] =3D {")
+    print()
+
+
+def emit_footer(total: int):
+    """Print the closing brace and builtin_defs_count definition."""
+    print("};")
+    print()
+    print(f"const int builtin_defs_count =3D {total};")
+
+
+def c_str(s):
+    """Return s as a quoted C string literal, or NULL for None."""
+    if s is None:
+        return "NULL"
+    s =3D str(s)
+    s =3D s.replace("\\", "\\\\").replace('"', '\\"')
+    return f'"{s}"'
+
+
+def emit_entry(ev: dict, guid_index: dict[int, int]):
+    """Print one C struct initializer for the given event dict."""
+    pmu =3D ev.get("PMU", "")
+    name =3D ev.get("EventName", "")
+    brief =3D ev.get("BriefDescription", "")
+    group =3D ev.get("MetricGroup", "")
+    platform_group =3D ev.get("PlatformGroup", "")
+
+    cfg_s =3D ev.get("ConfigCode", "0")
+
+    try:
+        cfg =3D int(cfg_s, 0)
+    except (ValueError, TypeError):
+        cfg =3D 0
+
+    sample_id, lsb, msb =3D decode_config_code(cfg)
+    guid =3D parse_guid_from_pmu(pmu)
+    idx =3D guid_index[guid]
+
+    print("    {")
+    print(f"        .event_name =3D {c_str(name)},")
+    print(f"        .description =3D {c_str(brief)},")
+    print(f"        .group       =3D {c_str(group)},")
+    print(f"        .platform_group =3D {c_str(platform_group)},")
+    print(f"        .guid        =3D &builtin_guids[{idx}], /* 0x{guid:08x=
} */")
+    print(f"        .sample_id   =3D {sample_id},")
+    print(f"        .lsb         =3D {lsb},")
+    print(f"        .msb         =3D {msb},")
+    print("    },")
+    print()
+
+
+def expand_paths(paths: list[str]) -> tuple[list[Path], Path | None]:
+    """
+    Expand arguments into JSON file paths.
+    If an argument is a directory, find all .json files in it.
+    If an argument is a file, include it directly.
+
+    Returns (event_json_paths, pmt_guids_json_path_or_None). The
+    pmt_guids.json sidecar (if encountered) is routed separately and
+    is never treated as a metric-event file.
+    """
+    json_paths: list[Path] =3D []
+    pmt_guids_path: Path | None =3D None
+
+    def _consider(p: Path) -> None:
+        nonlocal pmt_guids_path
+        if p.name =3D=3D PMT_GUIDS_JSON_NAME:
+            if pmt_guids_path is not None and pmt_guids_path !=3D p:
+                sys.stderr.write(
+                    f"WARNING: multiple {PMT_GUIDS_JSON_NAME} found; "
+                    f"using {pmt_guids_path}, ignoring {p}\n"
+                )
+                return
+            pmt_guids_path =3D p
+            return
+        json_paths.append(p)
+
+    for p_str in paths:
+        p =3D Path(p_str)
+        if p.is_dir():
+            json_files =3D sorted(p.glob("*.json"))
+            if not json_files:
+                sys.stderr.write(f"WARNING: no .json files found in direct=
ory {p}\n")
+            for jp in json_files:
+                _consider(jp)
+        elif p.is_file():
+            _consider(p)
+        else:
+            sys.stderr.write(f"WARNING: path does not exist: {p}\n")
+
+    return json_paths, pmt_guids_path
+
+
+def load_pmt_guids(path: Path) -> list[dict]:
+    """Load and validate the pmt_guids.json sidecar."""
+    with path.open("r", encoding=3D"utf-8") as f:
+        data =3D json.load(f)
+    if not isinstance(data, list):
+        raise ValueError(f"{path}: expected top-level JSON array")
+
+    out: list[dict] =3D []
+    for entry in data:
+        guid_s =3D entry.get("guid")
+        if guid_s is None:
+            raise ValueError(f"{path}: entry missing 'guid'")
+        try:
+            guid =3D int(guid_s, 0) if isinstance(guid_s, str) else int(gu=
id_s)
+        except (TypeError, ValueError) as ex:
+            raise ValueError(f"{path}: invalid guid {guid_s!r}: {ex}") fro=
m ex
+        out.append(
+            {
+                "guid": guid,
+                "name": entry.get("name") or "",
+                "description": entry.get("description") or "",
+            }
+        )
+    return out
+
+
+def _load_guid_meta(pmt_guids_path: Path | None) -> dict[int, dict]:
+    """Load GUID metadata (name + description per GUID) if available."""
+    guid_meta: dict[int, dict] =3D {}
+    if pmt_guids_path is not None:
+        sys.stderr.write(f"Loading GUID metadata from {pmt_guids_path}\n")
+        for g in load_pmt_guids(pmt_guids_path):
+            guid_meta[g["guid"]] =3D g
+    else:
+        sys.stderr.write(
+            f"WARNING: {PMT_GUIDS_JSON_NAME} not provided; "
+            "builtin_guids[] will have empty name/description.\n"
+        )
+    return guid_meta
+
+
+def _collect_events(
+    json_paths: list[Path],
+) -> tuple[list[tuple[Path, list[dict]]], list[int], dict[int, int]]:
+    """Load events from JSON paths and assign a stable GUID index."""
+    loaded: list[tuple[Path, list[dict]]] =3D []
+    seen_guids: list[int] =3D []
+    guid_index: dict[int, int] =3D {}
+    for jp in json_paths:
+        sys.stderr.write(f"Processing {jp}\n")
+        events =3D load_events_from_json(jp)
+        loaded.append((jp, events))
+        for ev in events:
+            guid =3D parse_guid_from_pmu(ev.get("PMU", ""))
+            if guid not in guid_index:
+                guid_index[guid] =3D len(seen_guids)
+                seen_guids.append(guid)
+    return loaded, seen_guids, guid_index
+
+
+def _build_guid_table(seen_guids: list[int], guid_meta: dict[int, dict]) -=
> list[dict]:
+    """Build the ordered guid table; merge in metadata."""
+    guid_table: list[dict] =3D []
+    for guid in seen_guids:
+        meta =3D guid_meta.get(guid)
+        if meta is None:
+            sys.stderr.write(
+                f"WARNING: no metadata for GUID 0x{guid:08x}; "
+                "emitting empty name/description.\n"
+            )
+            meta =3D {"guid": guid, "name": "", "description": ""}
+        guid_table.append(meta)
+    return guid_table
+
+
+def main(argv: list[str]) -> int:
+    """Entry point: parse arguments, emit C source to stdout."""
+    if len(argv) < 2:
+        sys.stderr.write(
+            "Usage: gen_builtin_defs.py <json|folder> [<json|folder> ...]\=
n"
+        )
+        return 1
+
+    # Sanity-check metrics_db.h
+    check_expected_fields(parse_struct_fields(METRICS_DB_H))
+
+    json_paths, pmt_guids_path =3D expand_paths(argv[1:])
+
+    if not json_paths:
+        sys.stderr.write("ERROR: no JSON files found to process\n")
+        return 1
+
+    guid_meta =3D _load_guid_meta(pmt_guids_path)
+    loaded, seen_guids, guid_index =3D _collect_events(json_paths)
+    guid_table =3D _build_guid_table(seen_guids, guid_meta)
+
+    # Emit C source.
+    emit_header()
+    emit_guid_table(guid_table)
+    emit_defs_open()
+
+    total =3D 0
+    for _jp, events in loaded:
+        for ev in events:
+            emit_entry(ev, guid_index)
+            total +=3D 1
+
+    emit_footer(total)
+    return 0
+
+
+if __name__ =3D=3D "__main__":
+    raise SystemExit(main(sys.argv))
--=20
2.43.0

