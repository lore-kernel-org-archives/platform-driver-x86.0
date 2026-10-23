Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792723122;
	b=hR0VpiU3U9Z6M60WHmd8MQlj3M0365Dx1J787x2SP6X2BJFLuswyy3ibfU0zFL7O5Hkt
	 gZaFJsRaSctmn8adeehysZS6fWp4euUJVw+ZoGQy8EK2Upd2kKZ1WRd7yJ3c/lBBDEYW+
	 r4fCAyVwq2rWK72eKU+5Kg6tpB2Amz3hdVdulc5efvWyAVpzVSp3ofPaMlT00LXsOXuAG
	 4YbhtAH3fQ/B27L1V3PiaKwAPmU/6yWs8TnhoHudp0GTmEXqNTJMfTe7i57OI6VZy/flN
	 zGhSkcI55dYrpB7gGj3zqWl3nfo9ndYiiTm0Gvu9livvyNwo3PbkHVKL2d/Jg13+7Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792723122;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=cUKduWeLE+6rfUbACnsxd7p++5JnbeDyhOO3k20BJgc=;
	b=cS1DmazsRi7kSKdBtuZU0RmslXs1CogMOano+nNpCQhE0Y+J2+BSR6byxQHqHNfTCqn+
	 R6blPo2Ly9fTw/h7Cfi2Y/BOONpKrlntFGOW2c/KZJu7HTjBlmD2axLgOzHVzA5ZK9EHW
	 zQ7ss8m/klUrLlf70O6dvLSdxqnUmQRYmQehq4YamzyGb3QIHfwk0ws008LNAJEWxmL4v
	 bc++Cct0487BD0ukHDpfRFqHksGz96QWE7pJgp1klOz/9PgmrX0PWx3h/mwNxlxxdgtDl
	 vKGAO01ORZPpfnU/UYepT8eTELB9fsw0+0UyKm2PoZSjO3tny28vwWcimxSwS63RbKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d4ySrnuI;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1D4606A319;
	Fri, 23 Oct 2026 02:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D1D4606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d4ySrnuI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792723121; x=1824259121;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JudUA5oX2+JfvSm/1rbIjHDXApT3gjjz8ob0y0D4bwc=;
  b=d4ySrnuIIClkCBSpcFh/iEsgwdrFEikBR0gyak2P4EssMcpkmEIQUfT4
   CHf8DkJpIF25gSk4qZJwC6DyLGao5ueH6o77zuSFuf1tiV1jSB2sxmeev
   8MjGpztWPxWj8fZHkUhgKyhQApOkk/cEla6UblN632VSe3ghtSBKFsEXd
   rDX3Q7exZSANEXkfF6od4JgarmSExdF6Qh95ndNIzAMNFtF2cXYvCz4pH
   cQu3rj1oqvfN5XSQyEzjfQ/TzjQWuAwRzBqYXo4+jxFwln/c6X2Kd7Bhz
   rWAGJJztPAvc0ooG2ULh/BeGdQokvd8Fa1qEF5se2jHk0qyPDLMgKgjvM
   w==;
X-CSE-ConnectionGUID: dLkikPfkRK661fLS+awWEg==
X-CSE-MsgGUID: G87iUe3GTWas8oo2v6vVlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1356810"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1356810"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 19:38:40 -0700
X-CSE-ConnectionGUID: uND2meZtRc+pGmK/+JB5RQ==
X-CSE-MsgGUID: CZN8qKZmSZ6V6jWa5Vps8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3461556"
Received: from debox1-desk4.jf.intel.com ([10.54.77.98])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 19:38:41 -0700
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
Subject: [PATCH v2 0/1] platform/x86/intel/pmt: Notify userspace when crashlogs complete
Date: Thu, 22 Oct 2026 19:38:31 -0700
Message-ID: <cover.1792721526.git.david.e.box@linux.intel.com>
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

This patch adds a uevent so userspace can find out when an Intel PMT
crashlog is available without polling.

It emits a KOBJ_CHANGE uevent on the crashlog<x> device carrying
INTEL_PMT_CRASHLOG_COMPLETE. The value is 1 when a completed crashlog is
found at probe, or when a manually triggered capture completes. The value
is 0 when a manual trigger does not complete within the 5 second poll
window.  The ABI documentation is updated to match.

v1 was a three-patch series. Patches 1 and 2 are no longer part of it:

 - Patch 1 (NULL dereference when reading crashlog data) is dropped in
   favor of Michael's "platform/x86/intel/pmt: complete pcidev to
   device update" (b86e5062cb88), which fixes the same bug.

 - Patch 2 (inverted walk_header() test in get_features()) has been
   applied as 3678e39c6aae.

Both are in the base of this posting, review-ilpo-next. The patch also
applies cleanly to for-next.

Testing: the patch was tested in an emulated (QEMU) environment on a
kernel with CONFIG_PROVE_LOCKING, covering the probe-time event, the
event after a manual trigger completes, triggers rejected while a log
is complete or the device is disabled, clear, trigger=3D0 and rearm while
the trigger poll is running, expiry of the poll window, module removal
with the poll pending, and re-probe. Hardware with this crashlog
support is available, but testing on it is still pending.

V2 changes:
  - Replaced the two uevent variables with a single
    INTEL_PMT_CRASHLOG_COMPLETE. INTEL_PMT_CRASHLOG_EVENT=3DPRESENT and
    COMPLETE=3D1 were both fixed and carried no information beyond the
    event itself.
  - Emit COMPLETE=3D0 when a manual trigger does not complete within the
    poll window, so userspace is not left waiting.
  - Reject manual triggers until probe has finished setting up the
    entry. This closes a window where a trigger during
    intel_pmt_dev_create() could queue work against a device freed by
    its error path (reported by sashiko on v1).
  - Dropped the cancel_*_sync() calls on the intel_pmt_dev_create()
    failure and skip paths. They ran after the device was already
    freed, but with triggers now rejected until setup completes no work
    can be pending there.
  - End the trigger poll without an event when the log is cleared or
    rearmed while it is running.
  - Cancel a stale poll only after the new trigger has been written, so
    a failed trigger leaves the previous poll in place.
  - Run the probe-time check under control_mutex, in the same critical
    section that enables triggers.
  - Run the poll on the freezable workqueue so it does not read the
    device during suspend.
  - Rebased onto review-ilpo-next and adapted to the crashlog register
    helpers now returning errors (Michal's additions). A failed status
    read counts as not complete.
  - Rewrote the ABI

v1: https://lore.kernel.org/all/20261001220351.1592138-1-david.e.box@linux.=
intel.com/

David E. Box (1):
  platform/x86/intel/pmt: Notify userspace when crashlogs complete

 .../ABI/testing/sysfs-class-intel_pmt         |  32 ++++
 drivers/platform/x86/intel/pmt/crashlog.c     | 138 +++++++++++++++++-
 2 files changed, 165 insertions(+), 5 deletions(-)


base-commit: 9d3475065167197742b0882aff21cf8e78393277
--=20
2.43.0

