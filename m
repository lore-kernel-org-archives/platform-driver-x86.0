Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794449305;
	b=gHDuO7XoUfd7rYwQfqGe7eNdza3CZPGsrhuHvy0xcrDX34kKcDNtHQmSqQmKQuADc0CZ
	 fNUpq8z1tAUb0wD2yq2qYRO3vUQXcgULpXysOZeKMwXeZkLVhNO26FI2tEVQNKGzSRolJ
	 I/p6r1JJfL90JaistY98bO/cmEv0ezavlaYvhxbuqXH/dFmSWFmYvdyTDVzh9Yhgg98Yw
	 qB1dhFII6xiQNOOZQ2bypFzJDaCRsjyNL2S8DFi0tj5INX16EpbxVKmI2scKFNK+xjMg8
	 KTtoUoKjAa44vusyRbJ/nIcGe+x6wpbiK7sPbMlOBpSvOTfBa7jXDTYbmKRtcY4qQ8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794449305;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=iiMEBJzMd/bG2uOgX1x2thKuVAp4mQJsD3tStd5phSI=;
	b=SeheEopIBV7+ZuFdoImNi1kTl2dtRYtqDtnuLwy+bhHUT6HNs8Io7d+0abWmQfJFBfoB
	 sil8VAhE+ZWSpmqdpvwo/JvV/kMpp+tHv19BbC4nxENL88KKXgpAooEoPR+M7XfpCCXw9
	 hGXgEQk0rMyGTyUA+/bbgCXQ4jPhi+BiCLeIiytPy6YxaXN+BqurUgzHlVeZn4TeOQeil
	 +W3Ur4VG0Z4siXKD0tGl7zaEfSY6tAxl2R+qi773AvVU8C2GhyWMqeN+JdbNcIDtBSFz7
	 ppc3sxoB0jIr/5L+Trbvwvaso2ENaBc0/vgQnEvzF9kDCnHsbjoD5F7wjEAlOI4ioXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hjuMRGZ2;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19DE606A321;
	Thu, 12 Nov 2026 02:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F19DE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hjuMRGZ2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794449304; x=1825985304;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2eCm6TNf6VCq7tyohaBveL61StQ+ZHcdJP66Id+sN1c=;
  b=hjuMRGZ2wHAt+tQ2x+DGynu5utgl/uVbLdDhYf9YM/KaphptKN8T1cz5
   2gcsAZ35NHxCe3H3x9gVpwwXLgxdDhPEAEAbq8RdwaOWu123/0c5HUsft
   LQU9CdLbEfZkluelOyMIUn+Sr8uBJfu2e565+Vo9mtoajPPw0lxw4N7WV
   8BL+DXkuz8zoScO/GYrgmCVNSzz11bjaH5HXl8ckpA2Oedlq68TyT56dy
   zRjoH3tUHGVdaqeRo3ypsFeX+pEjV+ry7K0Z1Ue9bkQsj/0ZK0kx6lNSW
   ClvasCMCsLQ+2XhJupVE2C8cKn2BoY+i6RS5nQtdI33Ls+09OIUqtK0Ov
   A==;
X-CSE-ConnectionGUID: q1XfBk8MTEKf4AmzK9AJ6g==
X-CSE-MsgGUID: yh9NKtfvTPSeAGumDVI1MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3106749"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3106749"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 18:08:24 -0800
X-CSE-ConnectionGUID: gTIh4HKpQPeDww4lEhL3PQ==
X-CSE-MsgGUID: ibPpbHQ6T6O2tm6GXcy9hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8622628"
Received: from debox1-desk4.jf.intel.com (HELO localhost) ([10.54.77.98])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 18:08:24 -0800
From: "David E. Box" <david.e.box@linux.intel.com>
To: ilpo.jarvinen@linux.intel.com,
	david.e.box@linux.intel.com,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	rodrigo.vivi@intel.com,
	michael.j.ruhl@intel.com,
	ayaz.siddiqui@intel.com,
	syed.abdul.muqthyar.ahmed@intel.com,
	intel-xe@lists.freedesktop.org,
	hansg@kernel.org
Subject: [PATCH v3 0/1] platform/x86/intel/pmt: Notify userspace when crashlogs complete
Date: Wed, 11 Nov 2026 18:08:17 -0800
Message-ID: <cover.1794444671.git.david.e.box@linux.intel.com>
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

This patch adds a uevent so userspace can find out when an Intel PMT
crashlog is available without polling.

It emits a KOBJ_CHANGE uevent on the crashlog<x> device carrying
INTEL_PMT_CRASHLOG_COMPLETE. The value is 1 when a completed crashlog is
found at probe, or when a manually triggered capture completes. The value
is 0 when a manual trigger does not complete within the 5 second poll
window. The ABI documentation is updated to match.

The main change in v3 is that the probe-time check no longer reads the
crashlog registers from probe. The register access callbacks added by
Michael's "platform/x86/intel/pmt: Add register access callbacks"
(7fdfccf87676) are there for the upcoming xe support for Crescent Island
(CRI). That support implements read_reg() and holds the lock it takes
across intel_vsec_register() when it registers late, after its firmware
is ready. With pmt_crashlog already loaded, crashlog probe runs
synchronously inside that call, and the v2 probe-time read deadlocked on
the lock its own caller held. Michael found this on CRI. In v3 the check
runs from a work item, which waits for registration to finish.

One rule follows from this and is noted in the code: a parent must not
hold its read_reg() lock while removing the crashlog device, because
remove waits for these work items. The CRI xe code only removes the
device under that lock if devm_add_action_or_reset() fails inside
intel_vsec_add_aux().

Testing: Michael tested v3 on CRI hardware. It was also tested in QEMU
on a kernel with CONFIG_PROVE_LOCKING, covering the cases listed for v2
plus disabling the crashlog during the trigger poll. A test parent
driver modelled the CRI late-bind path: read_reg() callbacks under a
mutex held across intel_vsec_register(), a slow registration that keeps
the lock held after the device appears, and a trigger that reaches
control_mutex before the probe-time check.

Tool use: an LLM coding assistant was used to analyze the deadlock,
draft the changes and the QEMU tests, and review the patch with
sashiko. I reviewed and tested the result.

V3 changes:
  - Run the probe-time check from a work item queued at the end of
    probe instead of from probe, so a read_reg() callback is never
    called from a synchronous probe that may run under the parent's
    lock (reported and tested by Michael on CRI).
  - Queue the probe-time check on the freezable workqueue, like the
    poll (sashiko).
  - Enable triggers once probe has created every entry, rather than per
    entry, so abort_probe never waits on a work item blocked on its
    caller's lock.
  - If a trigger is accepted before the probe-time check runs, the
    check skips its notification. The trigger's poll reports the
    capture, so it is not also reported as found at probe.
  - Disabling the crashlog while the trigger poll runs ends the poll
    without an event, like clear and rearm (sashiko).
  - ABI: note that events may be merged, list writing 0 to trigger and
    disabling as ending the poll, and update Date and KernelVersion.
  - Rebased onto review-ilpo-next. The patch also applies cleanly to
    for-next.

v2: https://lore.kernel.org/all/cover.1792721526.git.david.e.box@linux.inte=
l.com/
v1: https://lore.kernel.org/all/20261001220351.1592138-1-david.e.box@linux.=
intel.com/

David E. Box (1):
  platform/x86/intel/pmt: Notify userspace when crashlogs complete

 .../ABI/testing/sysfs-class-intel_pmt         |  35 ++++
 drivers/platform/x86/intel/pmt/crashlog.c     | 180 +++++++++++++++++-
 2 files changed, 209 insertions(+), 6 deletions(-)


base-commit: 5680519168f65666d2c03cc6ed8fe2b7052aee12
--=20
2.53.0

