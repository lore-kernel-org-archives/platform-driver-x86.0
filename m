Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795376060;
	b=uIsKv/FL8k7z4N85baJ0R3rHlAbZUxQxEaBc3fUNNmdySMR1Ey/XcTTzhQkN+m4Qz78N
	 6USl26hYaUnilxhk8HuYKozkVBNcs0dEDeYwAywTP2hpet7NXjwa1FSJBsywRGZmZbiqE
	 h3Z28tPZoeRVMXjLsUGjia9ECq1ypqf7iEG64YK3Gq6oLZHFxti42CSbWzH7h+g3Jn/ST
	 QRqxnkwCQA6uw0OORJ47CjzzuPDyfuYqKIRynMB4MPpdfJbcL28Teqs9T0IJdvZXoJBJy
	 z2pRSRJWizXqm7F/SADEX+0q11bBi1NDBwVXjmsXxRDOEeF9YmiYAZmOLIAd57sW7og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795376060;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=ULicIa4N045djpBg+N+owj6l70eR+oLJUtpQhb3nDCc=;
	b=Jt5zcRP36dz0uDDRErld/Ky6nixN7EAj2LmZjH1Pm7bQJNIRI+6krRGigMrXr7/SgKBg
	 soMti+wvQgrSdXImk0OHD7gNTurNPnUIC3EYhXnAoeNWWjI6qnI40WOhokzXv3VOaMg23
	 Tt6g43si979aBlK604qBVZ2PsgI4FD7sqod90Jiurvfp9WHQaTQzKJYRPEshATLTKUgvG
	 XiTPJatpPb8tGxiEKj9hxmScbmlgRHBzYxDRrprrEZYwOJNeZomfjNn7JXiVmSqwtaj+n
	 tjKVgOd0UQT2fHZV+0yiHo9+/iBTHNbJRcxlM2zWKNfyRORJJd9nJd00hf+XjgzenIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VBulqJDK;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47090606A330;
	Sun, 22 Nov 2026 19:34:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47090606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VBulqJDK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795376059; x=1826912059;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tTd8+9TE00/MiwfqfbLFpR/3N6T7UxU8CbZI6vWOf6I=;
  b=VBulqJDKiUsTyEna/0Sp9rDicaQxcjD3jmDVuCzZirGVHW0H+yapLFHU
   KIK3EG9E0ridAZBOScMt13cZSrFZoNbxnXormLY7DBovteVAfJ8aGANaJ
   KC3og41JtLBMffvY/R6e9GjasodrQbaJuwky8FWPqz/sHJRHdD1D3dTxK
   cdvL5n5Mg2vv6soMcalsb/BM7y3LemBnMgpGLiKVqouwoJ2ysi519mNjh
   3Iop6PMxGWWDYjX0SE1QUOlQv5s5xRwK7oJpY3EyRvKnMb1Sm6cJkYSOB
   /teXNn5nvBRp+fmmaSy6Zf2TUxzhVW2l03OeDNV8SnRY4+1AwDHoGXWGa
   A==;
X-CSE-ConnectionGUID: 3a9MYWlwSqaDrNUpIAjmSQ==
X-CSE-MsgGUID: MgB9ifh1RZS1OPfvFD29VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4217507"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4217507"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 11:34:18 -0800
X-CSE-ConnectionGUID: JS8zkJP3QlWYVYBoWF6USQ==
X-CSE-MsgGUID: RhVISWzURuSAc9MUbame4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11109789"
Received: from debox1-desk4.jf.intel.com (HELO localhost) ([10.54.77.98])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 11:34:19 -0800
From: "David E. Box" <david.e.box@linux.intel.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/12] tools/arch/x86/pmtctl: Add pmtxml2json conversion tool
Date: Sun, 22 Nov 2026 11:33:58 -0800
Message-ID: <82b74c6bcc8da5d08bce4cec8757b048d69dac17.1795374925.git.david.e.box@linux.intel.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The layout of each PMT telemetry region is described by aggregator XML
files published in the Intel-PMT repository
(https://github.com/intel/Intel-PMT). Each file lists the samples of
one GUID with their sample ID, bit range and description.

Add pmtxml2json.py, which converts these files into JSON metric
definitions that pmtctl can load at runtime. Each aggregator becomes a
pmt_<guid>.json file holding the GUID, its platform and description,
and one event per sample with its name, description, sample ID and bit
range. Event names are derived from the sample names. Where a name
would collide, the samples of the subgroups involved are all prefixed
with their subgroup, so the members of a subgroup are named alike.
Reserved samples are skipped. The rules are described in
pmtxml2json.md.

The aggregator files include shared data type definitions from a
*_common.xml file through an external XML entity. pmtxml2json doesn't
need those definitions, so it parses the XML with lxml with entity
resolution turned off, leaving the entity unresolved. The standard
library parser can't do that.

Add Makefile targets to fetch the repository into a local cache and
convert it into defs/, replacing the definitions of an earlier run:

  make defs-json-fetch   # clone (once) and convert
  make defs-json-pull    # update the clone and convert again
  make defs-clean        # remove defs/

The fetch targets are not part of the default build, to avoid
unexpected network access.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
V2 changes:
  - Replaces v1 15.
  - New output format: one pmt_<guid>.json per GUID with only what
    pmtctl uses. The perf-style PMU, ConfigCode and MetricGroup fields
    and the pmt_guids.json sidecar are gone.
  - GUIDs written without 0x and with decimal digits only are read as
    hex; v1 converted 7 published GUIDs under the wrong number.
  - Names that differ only in case are disambiguated, and all members
    of a subgroup with a colliding name are prefixed together.
  - XML is parsed with entity resolution turned off; lxml is checked
    for and documented.
  - Fetching again removes stale definitions; the Makefile has fetch
    targets only, with no C code generation.
  - Dead code removed.

 tools/arch/x86/pmtctl/.gitignore             |   1 +
 tools/arch/x86/pmtctl/Makefile               |  55 +-
 tools/arch/x86/pmtctl/scripts/pmtxml2json.md | 189 ++++++
 tools/arch/x86/pmtctl/scripts/pmtxml2json.py | 639 +++++++++++++++++++
 4 files changed, 883 insertions(+), 1 deletion(-)
 create mode 100644 tools/arch/x86/pmtctl/scripts/pmtxml2json.md
 create mode 100755 tools/arch/x86/pmtctl/scripts/pmtxml2json.py

diff --git a/tools/arch/x86/pmtctl/.gitignore b/tools/arch/x86/pmtctl/.giti=
gnore
index 3bd0d7c1b61a..45f94e0b3900 100644
--- a/tools/arch/x86/pmtctl/.gitignore
+++ b/tools/arch/x86/pmtctl/.gitignore
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 pmtctl
+defs/
diff --git a/tools/arch/x86/pmtctl/Makefile b/tools/arch/x86/pmtctl/Makefile
index bf422b84fd34..2d66e4e036cc 100644
--- a/tools/arch/x86/pmtctl/Makefile
+++ b/tools/arch/x86/pmtctl/Makefile
@@ -19,7 +19,60 @@ pmtctl: $(OBJS)
=20
 $(OBJS): $(wildcard include/*.h include/lib/*.h)
=20
-.PHONY: clean install
+# --- XML -> JSON step (network-bound; opt-in) ---
+#
+# Fetches the Intel-PMT git repo (cached under $(PMT_CACHE_DIR)) and
+# converts every aggregator XML into JSON under $(DEFS_DIR)/,
+# for use with 'pmtctl -J $(DEFS_DIR)'.
+# Not wired into 'all' on purpose: avoid surprise network access.
+PYTHON		?=3D python3
+DEFS_DIR	?=3D defs
+PMT_CACHE_DIR	?=3D $(HOME)/.cache/pmtctl
+
+XML2JSON_SCRIPT	:=3D scripts/pmtxml2json.py
+
+# Stamp marks "the XML->JSON conversion has run". The exact set of
+# generated files is not known up front, so we depend on a single stamp.
+# It is redone when the script changes; use defs-json-pull to update the
+# XML, or defs-clean to start over.
+DEFS_JSON_STAMP	:=3D $(DEFS_DIR)/.stamp
+
+defs-json-fetch: $(DEFS_JSON_STAMP)
+
+# Fail early, with the package to install, if python3 or lxml is missing
+XML2JSON_CHECK =3D @$(PYTHON) -c 'import lxml' 2>/dev/null || { \
+	echo "$(XML2JSON_SCRIPT) needs $(PYTHON) with lxml (package python3-lxml)=
" >&2; \
+	exit 1; }
+
+$(DEFS_JSON_STAMP): $(XML2JSON_SCRIPT)
+	@echo "defs-json-fetch: converting Intel-PMT XML from $(PMT_CACHE_DIR) (c=
loned if missing)"
+	$(XML2JSON_CHECK)
+	@mkdir -p $(DEFS_DIR)
+	@rm -f $(DEFS_DIR)/pmt_*.json
+	$(PYTHON) $(XML2JSON_SCRIPT) \
+		--fetch-pmt-repo \
+		--pmt-cache-dir $(PMT_CACHE_DIR) \
+		--output-dir $(DEFS_DIR)
+	@touch $@
+
+# Run 'git pull' on the cached Intel-PMT repo, then regenerate JSON.
+defs-json-pull: $(XML2JSON_SCRIPT)
+	@echo "defs-json-pull: running 'git pull' on $(PMT_CACHE_DIR)"
+	$(XML2JSON_CHECK)
+	@mkdir -p $(DEFS_DIR)
+	@rm -f $(DEFS_DIR)/pmt_*.json
+	$(PYTHON) $(XML2JSON_SCRIPT) \
+		--fetch-pmt-repo --refresh-pmt-repo \
+		--pmt-cache-dir $(PMT_CACHE_DIR) \
+		--output-dir $(DEFS_DIR)
+	@touch $(DEFS_JSON_STAMP)
+
+# Separate from 'clean' so a routine clean does not throw away the
+# (potentially slow) fetched/converted JSON tree.
+defs-clean:
+	rm -rf $(DEFS_DIR)
+
+.PHONY: clean install defs-json-fetch defs-json-pull defs-clean
 clean:
 	@rm -f pmtctl $(OBJS)
=20
diff --git a/tools/arch/x86/pmtctl/scripts/pmtxml2json.md b/tools/arch/x86/=
pmtctl/scripts/pmtxml2json.md
new file mode 100644
index 000000000000..edfaab6fd2f7
--- /dev/null
+++ b/tools/arch/x86/pmtctl/scripts/pmtxml2json.md
@@ -0,0 +1,189 @@
+# pmtxml2json: XML =E2=86=92 JSON conversion
+
+[`pmtxml2json.py`](pmtxml2json.py) converts Intel PMT (Platform Monitoring
+Technology) Aggregator XML files into JSON metric definitions
+that `pmtctl` loads with `-J <dir>`.
+
+This document focuses on the **EventName naming convention** =E2=80=94 the=
 rule used
+to derive an event name from each `<TELC:sample>` element.
+
+## Requirements and usage
+
+The script needs Python 3 and [lxml](https://lxml.de). The aggregator files
+include their `*_common.xml` data types through an external entity; lxml c=
an
+leave it unresolved, which the standard library XML parser cannot.
+
+Normally it is run by `make defs-json-fetch`, which clones the Intel-PMT
+repository into a cache directory and writes the definitions to `defs/`. It
+can also convert a local copy:
+
+```sh
+scripts/pmtxml2json.py --by-path <Intel-PMT>/xml --output-dir defs
+```
+
+See `--help` for all options. The exit status is 0 on success, 1 if any
+aggregator could not be converted, and 2 for a usage or fetch error.
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
+(`pmt_<guid>.json`), **not** for naming.
+
+`sampleID`, `sampleGroupID`, `lsb`, `msb`, and `productid` are not used to
+build `EventName`. They describe bit layout, packaging, or platform
+identity rather than the metric's identity, and using them would either
+produce names that change when the XML is regenerated or names that
+duplicate information already stored in `guid`, `sample_id`, `lsb` and
+`msb`.
+
+## Pre-filter: reserved samples
+
+Before naming, a sample is dropped if
+
+- its `name` attribute or `<TELC:sampleSubGroup>` text contains `reserved`
+  or `rsvd` (case-insensitive, optionally with trailing digits) as a separ=
ate
+  token, or
+- its sample or group `<TELC:description>` is just `reserved` or `rsvd`
+  (optionally with digits). Descriptions are prose, so a mention elsewhere=
 in
+  the text doesn't count.
+
+Reserved samples never receive an `EventName`.
+
+## Naming rule (lazy prefix, per subgroup)
+
+Within a single aggregator XML, a `name` **collides** if more than one
+non-reserved sample has it after `sanitize()`, so names that differ only in
+case collide. A subgroup is **prefixed** if any of its samples has a colli=
ding
+name. For each surviving sample:
+
+1. If its subgroup is prefixed and the subgroup differs from `name`:
+   `EventName =3D sanitize(sampleSubGroup) + "." + sanitize(name)`
+2. Otherwise:
+   `EventName =3D sanitize(name)`
+
+All samples of a prefixed subgroup are named alike, so related metrics stay
+together in `pmtctl list`, which sorts them by name.
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
+The lazy rule borrows `sampleSubGroup` **only for subgroups with a collidi=
ng
+name**, yielding clean labels in the common case and disambiguated ones wh=
en
+needed.
+
+### `sanitize()`
+
+`_sanitize_token()` lowercases the text and replaces each run of characters
+other than letters and digits with a single `_`, without a leading or
+trailing `_`. A sanitized token therefore never contains `__` or `.`.
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
+| Sample                   | Rule                      | EventName        =
                     |
+| ------------------------ | ------------------------- | -----------------=
-------------------- |
+| `RTL_VERSION`            | (2) subgroup not prefixed | `rtl_version`    =
                     |
+| `IA_SCALABILITY` (CORE0) | (1) prefixed subgroup     | `ia_scalability_c=
ore0.ia_scalability` |
+| `IA_SCALABILITY` (CORE7) | (1) prefixed subgroup     | `ia_scalability_c=
ore7.ia_scalability` |
+
+Note that `RTL_VERSION` is **not** prefixed with its `INTEL_VERSION_2`
+container, even though `sampleSubGroup` is set =E2=80=94 because no sample=
 of that
+subgroup has a colliding name.
+
+The prefix applies to a whole subgroup. With samples `CORE0` and `GT` in
+subgroup `IA_CLUSTER_CSTATES`, and `CORE0` and `MODULE0` in `CDYN_LEVEL`,
+only `CORE0` collides, but both subgroups are prefixed:
+`ia_cluster_cstates.core0`, `ia_cluster_cstates.gt`, `cdyn_level.core0` and
+`cdyn_level.module0`.
+
+## Output shape
+
+Each aggregator becomes one `pmt_<guid>.json` file:
+
+```json
+{
+  "guid": "0x<guid>",
+  "platform": "<optional, from the --by-path directory>",
+  "description": "<optional, the aggregator's <TELEM:description>>",
+  "events": [
+    {
+      "EventName": "<name per rule above>",
+      "description": "<sample or group description>",
+      "sample_id": <sampleID>,
+      "lsb": <lsb>,
+      "msb": <msb>
+    }
+  ]
+}
+```
+
+`sample_id` selects a 64-bit sample of the telemetry region and `lsb` and
+`msb` give the event's bit range within it.
+
+`platform` is the first directory under the `--by-path` root, uppercased
+(`PTL/0/ptl_aggregator.xml` gives `PTL`). An event without a description in
+the XML gets one made from its name and width, such as `Core Temp (8b)`.
+
+## EventName uniqueness
+
+Within a single aggregator XML the rule above resolves the collisions in t=
he
+Intel-PMT data. If two samples still share the same `EventName` =E2=80=94 =
for example
+because neither has a usable `sampleSubGroup` =E2=80=94 the converter appl=
ies a
+last-resort ordinal suffix
+`__0`, `__1`, =E2=80=A6 and emits a `WARN` line to stderr.  The double-und=
erscore is
+chosen to be visually distinct from any XML field so it is not mistaken fo=
r a
+meaningful part of the metric name.
+
+Across **different** GUIDs, names may repeat =E2=80=94 they live in distin=
ct
+files and are disambiguated by the file's `guid`.
diff --git a/tools/arch/x86/pmtctl/scripts/pmtxml2json.py b/tools/arch/x86/=
pmtctl/scripts/pmtxml2json.py
new file mode 100755
index 000000000000..144aed9894c4
--- /dev/null
+++ b/tools/arch/x86/pmtctl/scripts/pmtxml2json.py
@@ -0,0 +1,639 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-only
+"""Convert Intel PMT aggregator XML files into pmtctl JSON metric definiti=
ons.
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
+import subprocess
+import sys
+
+from collections import Counter
+from dataclasses import dataclass
+from typing import Dict, List, Optional, Set, Tuple
+
+from lxml import etree  # pylint: disable=3Dc-extension-no-member
+
+INTEL_PMT_REPO_URL =3D "https://github.com/intel/Intel-PMT"
+
+# Every PMT sample is one 64-bit word
+SAMPLE_BITS =3D 64
+
+
+def _expand_path(path: str) -> str:
+    """Return an absolute path with user home expansion applied."""
+    return os.path.abspath(os.path.expanduser(path))
+
+
+def _base_dir(path: str) -> str:
+    """Return path if it is a directory, else the directory containing it.=
"""
+    if os.path.isfile(path):
+        return os.path.dirname(path) or "."
+    return path
+
+
+def _repo_dir_name_from_url(repo_url: str) -> str:
+    """Return a deterministic cache directory name for a git repository UR=
L."""
+    cleaned =3D repo_url.rstrip("/")
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
+class SampleDef:
+    """Normalized representation of one PMT sample field definition."""
+
+    sample_id: int
+    sample_name: str
+    lsb: int
+    msb: int
+    description: Optional[str]
+    sample_subgroup: Optional[str]
+
+
+def norm(tag) -> str:
+    """Return XML tag name without namespace prefix.
+
+    Non-element nodes (comments, unresolved entities) have no string tag
+    and return an empty name.
+    """
+    if not isinstance(tag, str):
+        return ""
+    return tag[tag.rfind("}") + 1 :] if "}" in tag else tag
+
+
+def _text(el) -> str:
+    """Return the stripped text of an XML element."""
+    return (el.text or "").strip()
+
+
+def parse_xml(xml_path: str):
+    """Parse and return the XML root element for the given file path.
+
+    The aggregator files include their *_common.xml data types through an
+    external entity. Those definitions are not needed for the conversion,
+    so entities are left unresolved.
+    """
+    # pylint: disable-next=3Dc-extension-no-member
+    parser =3D etree.XMLParser(resolve_entities=3DFalse)
+    # pylint: disable-next=3Dc-extension-no-member
+    root =3D etree.parse(xml_path, parser).getroot()
+
+    return root
+
+
+def get_guid(root) -> int:
+    """Extract the telemetry GUID from <uniqueid>."""
+    for e in root.iter():
+        if norm(e.tag).lower() =3D=3D "uniqueid":
+            v =3D _text(e)
+            if not v:
+                break
+
+            # GUIDs are hex, with or without the 0x prefix
+            return int(v, 16)
+
+    raise ValueError("Missing <TELEM:uniqueid>")
+
+
+def get_description(root) -> Optional[str]:
+    """Return the aggregator's top-level <TELEM:description>, if any."""
+    for e in root:
+        if norm(e.tag).lower() =3D=3D "description":
+            return _text(e) or None
+
+    return None
+
+
+def _is_reserved(sname: str, ssubgroup: Optional[str], desc: Optional[str]=
) -> bool:
+    """Return True for reserved/rsvd samples by name, sampleSubGroup, or d=
escription."""
+    if RESERVED_RX.search(sname):
+        return True
+    if ssubgroup and RESERVED_RX.search(ssubgroup):
+        return True
+    return bool(desc and DESC_RESERVED_RX.fullmatch(desc))
+
+
+def parse_sample(s, sample_id: int, group_desc: Optional[str]) -> Optional=
[SampleDef]:
+    """Parse one <Sample> element; return None for reserved samples."""
+    sname =3D (s.attrib.get("name") or f"sample_{sample_id}").strip()
+
+    lsb =3D None
+    msb =3D None
+    sdesc =3D None
+    ssubgroup =3D None
+
+    for ch in s:
+        t =3D norm(ch.tag).lower()
+        if t =3D=3D "lsb":
+            lsb =3D int(_text(ch), 0)
+        elif t =3D=3D "msb":
+            msb =3D int(_text(ch), 0)
+        elif t =3D=3D "description":
+            sdesc =3D _text(ch)
+        elif t =3D=3D "samplesubgroup":
+            ssubgroup =3D _text(ch)
+
+    if lsb is None or msb is None:
+        raise ValueError(f"{sname} (sampleID=3D{sample_id}): missing lsb/m=
sb")
+
+    if not 0 <=3D lsb <=3D msb < SAMPLE_BITS:
+        raise ValueError(
+            f"{sname} (sampleID=3D{sample_id}): invalid bit range {lsb}-{m=
sb}"
+        )
+
+    desc_text =3D sdesc if sdesc else group_desc
+
+    if _is_reserved(sname, ssubgroup, desc_text):
+        return None
+
+    return SampleDef(
+        sample_id=3Dsample_id,
+        sample_name=3Dsname,
+        lsb=3Dlsb,
+        msb=3Dmsb,
+        description=3Ddesc_text,
+        sample_subgroup=3Dssubgroup,
+    )
+
+
+def parse_sample_group(sg) -> List[SampleDef]:
+    """Parse one <SampleGroup> element into its non-reserved samples."""
+    sid_txt =3D sg.attrib.get("sampleID") or sg.attrib.get("sampleid")
+    if sid_txt is None:
+        raise ValueError("SampleGroup missing sampleID")
+
+    sample_id =3D int(sid_txt, 0)
+    group_name =3D (sg.attrib.get("name") or "").strip() or f"group_{sampl=
e_id}"
+    group_len =3D None
+    group_desc =3D None
+
+    for child in sg:
+        t =3D norm(child.tag).lower()
+        if t =3D=3D "length":
+            group_len =3D int(_text(child), 0)
+        elif t =3D=3D "description":
+            group_desc =3D _text(child)
+
+    if group_len is not None and group_len !=3D SAMPLE_BITS:
+        raise ValueError(
+            f"{group_name} sampleID=3D{sample_id} length=3D{group_len} "
+            f"(expected {SAMPLE_BITS})"
+        )
+
+    out: List[SampleDef] =3D []
+    for s in sg:
+        if norm(s.tag).lower() !=3D "sample":
+            continue
+        sample =3D parse_sample(s, sample_id, group_desc)
+        if sample:
+            out.append(sample)
+
+    return out
+
+
+def parse_samples(root) -> List[SampleDef]:
+    """Parse SampleGroup/Sample entries into filtered SampleDef records."""
+    out: List[SampleDef] =3D []
+
+    for sg in root.iter():
+        if norm(sg.tag).lower() =3D=3D "samplegroup":
+            out.extend(parse_sample_group(sg))
+
+    return out
+
+
+def _sanitize_token(s: str) -> str:
+    """Lowercase s, replacing each run of non-alphanumerics with one '_'."=
""
+    return re.sub(r"[^0-9a-zA-Z]+", "_", s).strip("_").lower()
+
+
+def event_description(s: SampleDef) -> str:
+    """Build the description of an event, with whitespace collapsed."""
+    if s.description:
+        return re.sub(r"\s+", " ", s.description)
+
+    width =3D s.msb - s.lsb + 1
+
+    return f"{s.sample_name.replace('_', ' ').title()} ({width}b)"
+
+
+def make_event(s: SampleDef, prefixed: Set[str]) -> Dict[str, object]:
+    """Create one event dictionary for a sample.
+
+    A sample of a subgroup in @prefixed is named subgroup.name, unless the
+    subgroup has the sample's own name.
+    """
+    name =3D _sanitize_token(s.sample_name)
+    group =3D _sanitize_token(s.sample_subgroup) if s.sample_subgroup else=
 ""
+    if s.sample_subgroup in prefixed and group and group !=3D name:
+        name =3D f"{group}.{name}"
+
+    return {
+        "EventName": name,
+        "description": event_description(s),
+        "sample_id": s.sample_id,
+        "lsb": s.lsb,
+        "msb": s.msb,
+    }
+
+
+def _resolve_duplicate_event_names(
+    out: List[Dict[str, object]], guid: int, agg_xml: str
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
+            f"WARN: {agg_xml}: GUID=3D0x{guid:08x}: "
+            f"EventName '{name}' collision ({len(indices)} entries); "
+            f"renaming as {name}__0 .. {name}__{len(indices) - 1}",
+            file=3Dsys.stderr,
+        )
+        for ordinal, idx in enumerate(indices):
+            out[idx]["EventName"] =3D f"{name}__{ordinal}"
+
+
+def _parse_args(argv: List[str]) -> argparse.Namespace:
+    """Parse command-line arguments."""
+    ap =3D argparse.ArgumentParser(
+        description=3D"Convert Intel PMT Aggregator XML to pmtctl JSON met=
ric definitions"
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
+        help=3D(
+            "Git URL of the Intel-PMT repository used by --fetch-pmt-repo "
+            f"(default: {INTEL_PMT_REPO_URL})."
+        ),
+    )
+    ap.add_argument("--debug", action=3D"store_true")
+
+    return ap.parse_args(argv)
+
+
+def _rel_parts_from_root(d: str, root: str) -> List[str]:
+    """Return sanitized relative path segments from root to d."""
+    try:
+        rel =3D os.path.relpath(os.path.normpath(d), os.path.normpath(root=
))
+    except ValueError:
+        return []
+    if rel in (".", "") or rel.startswith(".."):
+        return []
+
+    def _seg(s: str) -> str:
+        s =3D (s or "").strip().lower()
+        s =3D re.sub(r"[^0-9a-z]+", "-", s)
+        return re.sub(r"-+", "-", s).strip("-")
+
+    out: List[str] =3D []
+    for seg in rel.split(os.sep):
+        if seg in (".", ".."):
+            continue
+        s =3D _seg(seg)
+        if s:
+            out.append(s)
+    return out
+
+
+def _discover_all_xml_sets_by_path(p: str) -> List[Tuple[str, List[str]]]:
+    """Return a (aggregator, rel_parts) work item for each *_aggregator.xm=
l under p."""
+    base =3D _base_dir(p)
+    aggs =3D glob.glob(os.path.join(base, "**", "*_aggregator.xml"), recur=
sive=3DTrue)
+
+    return [(a, _rel_parts_from_root(os.path.dirname(a), base)) for a in s=
orted(aggs)]
+
+
+def _collect_work_items(args: argparse.Namespace) -> List[Tuple[str, List[=
str]]]:
+    """Return the (aggregator, rel_parts) items selected by the arguments.=
"""
+    if args.by_path and args.xml is None:
+        work_items =3D _discover_all_xml_sets_by_path(args.by_path)
+        if args.debug:
+            print(
+                f"# by-path discovered {len(work_items)} aggregator(s)",
+                file=3Dsys.stderr,
+            )
+        return work_items
+
+    if not args.xml:
+        return []
+
+    # Single file, optionally placed relative to --by-path
+    rel_parts: List[str] =3D []
+    if args.by_path:
+        rel_parts =3D _rel_parts_from_root(os.path.dirname(args.xml) or ".=
", args.by_path)
+    return [(args.xml, rel_parts)]
+
+
+def _deepest_by_path_folder(by_path: str) -> str:
+    """Return the last component of the --by-path directory."""
+    return os.path.basename(os.path.normpath(_base_dir(by_path)))
+
+
+def _output_dir_for(args: argparse.Namespace) -> Optional[str]:
+    """Determine the output directory.
+
+    If --output-dir is given, use it verbatim; outputs are written flat
+    by GUID (pmt_<guid>.json). If omitted, fall back to a folder
+    named after the deepest --by-path directory (lowercased).
+    """
+    if args.output_dir:
+        return args.output_dir
+
+    if args.by_path:
+        deepest_folder =3D _deepest_by_path_folder(args.by_path)
+        return "jsons" if deepest_folder.lower() =3D=3D "xml" else deepest=
_folder.lower()
+
+    return None
+
+
+def _platform_group_for(rel_parts: List[str], by_path: Optional[str]) -> O=
ptional[str]:
+    """Return the platform group for an aggregator.
+
+    Derived from the aggregator's location under the discovery root
+    (e.g. "alderlake-s"). Falls back to the by-path basename for the
+    single-mode case.
+    """
+    if rel_parts:
+        return rel_parts[0].upper()
+
+    if by_path:
+        deepest_folder =3D _deepest_by_path_folder(by_path)
+        if deepest_folder and deepest_folder.lower() !=3D "xml":
+            return deepest_folder.upper()
+
+    return None
+
+
+def make_events(root, guid: int, agg_xml: str) -> List[Dict[str, object]]:
+    """Return the events of an aggregator, with unique EventNames."""
+    samples =3D parse_samples(root)
+
+    # When a name is shared by several samples, every sample of their
+    # subgroups is prefixed, so the members of a subgroup are named alike
+    name_counts =3D Counter(_sanitize_token(s.sample_name) for s in sample=
s)
+    prefixed =3D {
+        s.sample_subgroup
+        for s in samples
+        if name_counts[_sanitize_token(s.sample_name)] > 1
+    }
+
+    events =3D [make_event(s, prefixed) for s in samples]
+
+    _resolve_duplicate_event_names(events, guid, agg_xml)
+
+    return events
+
+
+def convert_aggregator(
+    agg_xml: str,
+    rel_parts: List[str],
+    args: argparse.Namespace,
+    output_dir: Optional[str],
+    written_by_guid: Dict[int, str],
+) -> None:
+    """Convert one aggregator XML into a pmt_<guid>.json file."""
+    root =3D parse_xml(agg_xml)
+    guid =3D get_guid(root)
+
+    out_filename =3D os.path.join(output_dir or "", f"pmt_{guid:08x}.json")
+
+    # GUIDs are globally unique to a telemetry layout; a duplicate
+    # across aggregators indicates a source-data bug, not something
+    # to silently paper over by namespacing the output.
+    prior =3D written_by_guid.get(guid)
+    if prior is not None:
+        raise ValueError(
+            f"duplicate GUID 0x{guid:08x} from {agg_xml}; "
+            f"previously emitted by {prior}"
+        )
+
+    events =3D make_events(root, guid, agg_xml)
+    platform_group =3D _platform_group_for(rel_parts, args.by_path)
+
+    doc: Dict[str, object] =3D {"guid": f"0x{guid:08x}"}
+    if platform_group:
+        doc["platform"] =3D platform_group
+    description =3D get_description(root)
+    if description:
+        doc["description"] =3D description
+    doc["events"] =3D events
+
+    with open(out_filename, "w", encoding=3D"utf-8") as f:
+        json.dump(doc, f, indent=3D2)
+        f.write("\n")
+
+    written_by_guid[guid] =3D agg_xml
+    print(f"# wrote {out_filename}", file=3Dsys.stderr)
+    print(f"# GUID=3D0x{guid:08x} events=3D{len(events)}", file=3Dsys.stde=
rr)
+
+
+def main(argv: List[str]) -> int:
+    """CLI entry point: discover XML files, convert, and write JSON output=
s."""
+    args =3D _parse_args(argv)
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
+    work_items =3D _collect_work_items(args)
+
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
+    output_dir =3D _output_dir_for(args)
+    if output_dir:
+        os.makedirs(output_dir, exist_ok=3DTrue)
+        if args.debug:
+            print(f"# output directory: {output_dir}", file=3Dsys.stderr)
+
+    any_failed =3D False
+    written_by_guid: Dict[int, str] =3D {}
+
+    for agg_xml, rel_parts in work_items:
+        try:
+            convert_aggregator(agg_xml, rel_parts, args, output_dir, writt=
en_by_guid)
+        # pylint: disable-next=3Dc-extension-no-member
+        except (ValueError, OSError, etree.XMLSyntaxError) as ex:
+            any_failed =3D True
+            print(
+                f"ERROR: failed processing aggregator=3D{agg_xml}: {ex}",
+                file=3Dsys.stderr,
+            )
+
+    return 1 if any_failed else 0
+
+
+if __name__ =3D=3D "__main__":
+    sys.exit(main(sys.argv[1:]))
--=20
2.53.0

