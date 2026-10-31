Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793410187;
	b=jq5EJtERRYeFd5C3J+XFae61fuIMH2nLrdwb6Eb9bsvKrH9a3d21GT7iulfz/HDwuXLE
	 ywXweynnVgELwJR2BZM5hxCkq1awdc3uUgCOI/v1Mlw+xOlbWPGy9smEKtB99dkIjdQtG
	 jr3tMXXehEbSEPbQZPDFwcjGdFq918LWxVnd2b05+d202aXk1rPnuk44F+VuBAPh/2Iiq
	 2wSNGzO4iWVq2wTXCWMG8CtStnnSPgCiD/seIZeo45WzxKnEujIQwyWI5EP85/wCyTdSE
	 cCzg2AGnAEQ6jAlHvBK/Zk67GShREKzFYUJf/Qq+UpeZUSZwDCgjt78MmZ5nwJlvCMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793410187;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=jF8wSoxLW5SkIOKdqm3Fjo8PCgof3ic+Ji9EzfyYGqE=;
	b=YEMJbK0KcY3cEv5Co6odmKrxe3h2W8r3QzdqGNWvf/jd3okipL0M67BJp0Ua8wozofuP
	 i2Ip2/PDfgjHa9QNqIGUNkiuXQ1B6ecjgXVuH3Yde/usvNVupTezSQvlXy/42FCEyUrDb
	 XT+KMHTtuuMLv5yRbclgj4iF2g387MrANjFHC6ez2qakJXByB1jdkHDfuOLGWoPHRuIxB
	 P4J3Y6OuycOLDhWUDsZynIeehr4rm/yNF01jB+GtLqc/vuQhe1WVR6c90TXEGSUn3JQoT
	 Oy4jK2dCnSa8mfSfDTqFklBzH6tiZqBaLhHogk8CMpaIMCWxfsp+QrIghGfr6fzByXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MYQDS3oc;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95B2606A31A;
	Sat, 31 Oct 2026 01:29:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E95B2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MYQDS3oc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793410186; x=1824946186;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uxebZQz0ocz9uOe3wR1oy9clAVn6B1/A4QshRfvjdSo=;
  b=MYQDS3ocTsvHh68ofd5e4Mwcf9NMp0SpwQu1RHyc3u8HFxfV5f7ICgaW
   ihAH72/+omPjeDby7gO4OcGSiSs6Ed6UBNaeZ3nF55Rg7jZfsflvh6eQ2
   odhMXNssl2+eIkc8LkQzQp99fIVlqrCGYU9kniL2jKo4XQ8wuN8tczvPI
   ittv+jjSe0ovSQpktschh0/OkajBOcbLw4IWV/XEynYGuC5756FeZDSE5
   +xmkX1nGnpaxIISpjIMZBgVOOceaSWAaupR5Esyt9JlAcUErwlLcx62jR
   OMdvPWEdJ/ki8/xCjCyTewEHu3HXAPyblsJ2lYB+QElmTxME1ZP6fExMi
   g==;
X-CSE-ConnectionGUID: 3N9MQHEdRQ26RHwIRloKjg==
X-CSE-MsgGUID: sXnuwDsIR0G2sg0qN3Pyfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2213325"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2213325"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 18:29:45 -0700
X-CSE-ConnectionGUID: 2glU4+2eSxGXl6sm8YxK7Q==
X-CSE-MsgGUID: sdnM2pEvT3uBBKDk+uG3KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="7397952"
Received: from debox1-desk4.jf.intel.com ([10.54.77.98])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 18:29:45 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] platform/x86/intel: Harden PMT discovery against malformed device data
Date: Fri, 30 Oct 2026 18:29:32 -0700
Message-ID: <20261031012939.377995-1-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

The Intel VSEC and PMT drivers build kernel copies and MMIO mappings from
discovery data read from the device:

  1. DVSEC/VSEC config space,
  2. the PMT discovery tables,
  3. the feature tables pointed to from the discovery tables.

Several of these fields are used without being validated against the
buffers or BARs they describe, so a device reporting out-of-spec values can
make the drivers write past kernel structures, index past arrays, or map
MMIO outside of their own BARs.

These issues were found during an internal AI-assisted review of the PMT
codebase. An LLM was also used to draft the fixes and to build the test
tooling described below. Each finding was verified against the code, and
each patch was reviewed and tested before posting.

Patches 1-3 fix memory safety issues in the PMT discovery driver:

  1. attr_size from the feature header sets the length of a
     memcpy_fromio() into the fixed-size struct feature_table. The only
     check was against the MMIO source size, which is also device
     controlled, allowing an overflow of up to 1020 bytes. Bound it by
     the destination, and skip the feature rather than failing probe.

  2. Replace a WARN() on a bad table size with dev_err_probe(), since
     malformed device data should not panic panic_on_warn systems.

  3. The feature id is used as a BIT() shift and as an index into
     pmt_feature_names[] before it is validated.

Patches 4-6 validate the MMIO ranges built from discovery data against
the BAR they claim to be in:

  4. In the vsec driver, reject a DVSEC/VSEC table BAR index (tbir) that
     is out of range or not a memory BAR, and discovery tables that
     extend past the end of their BAR. The discovery BAR is recorded and
     a helper is exported so the PMT drivers can apply the same check to
     the ranges they build.

  5. In the PMT discovery driver, check feature table resources against
     the discovery BAR before mapping them.

  6. In the PMT class driver, check telemetry and crashlog regions before
     they are mapped, and mmappable by userspace, including ACCESS_BARID
     regions whose BAR index can name the nonexistent BARs 6 and 7.

All patches carry Fixes tags. Patches 5 and 6 depend on the helper added
in patch 4.

Testing:

The malformed-data cases were tested on an emulated OOBMSM-style PMT device
in QEMU, extended with fault injection to corrupt one discovery field at a
time. With KASAN and UBSAN enabled, v7.3 showed each bug:

   - an oops from the attr_size overflow corrupting struct feature (1),
   - a WARN on a short table (2),
   - a shift-out-of-bounds from the unvalidated feature id (3),
     and discovery tables, feature tables and telemetry regions mapped
     outside the BAR (4-6).

With the series, every case was rejected with its message and
no warnings, sanitizer reports or out-of-BAR mappings.

For regressions, PMT state with and without the series was compared on

  - Diamond Rapids (OOBMSM with enhanaced discovery),
  - Tiger Lake (which uses early client flag, shifted table offset)
  - Nova Lake with a Battlemage card (VSEC data registered by xe).

The devices, telemetry and crashlog regions, and features were identical.
All regions read and mmapped in full and the discovery KUnit test passed.

The runtime testing above was done with the series on v7.3.=20

David E. Box (6):
  platform/x86/intel/pmt/discovery: Bound attr_size against
    feature_table capacity
  platform/x86/intel/pmt/discovery: Avoid WARN for malformed tables
  platform/x86/intel/pmt/discovery: Validate feature id before use
  platform/x86/intel/vsec: Validate discovery table bounds against the
    BAR
  platform/x86/intel/pmt/discovery: Validate feature table against the
    BAR
  platform/x86/intel/pmt: Validate telemetry regions against the BAR

 drivers/platform/x86/intel/pmt/class.c     | 21 +++++
 drivers/platform/x86/intel/pmt/discovery.c | 36 +++++++--
 drivers/platform/x86/intel/vsec.c          | 93 ++++++++++++++++++++--
 include/linux/intel_vsec.h                 |  8 ++
 4 files changed, 147 insertions(+), 11 deletions(-)


base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
--=20
2.43.0

