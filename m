Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46EE45C6E0;
	Fri, 16 Oct 2026 11:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792151236; cv=none; b=J1AKXTUEoeHUQM7q2/JyETdNxeoKVTBwTHZNhEVmn6Mm8iWMAxwhNH1WLzDPdmxuwsJjJs8w/N5t+1ZS1dcmgmPW1xIkSgG8YGaGXhO5T//LWXWxX3uSG8q6D69M2YMDuTxn8sNOS6Cn9aR4SvOt4LS0HkGfjY3DqTy6RliBbL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792151236; c=relaxed/simple;
	bh=HTxWURkNFjpXwaAsnQUTI3D0ESEGIk/BceEvJ64+arE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=KV2oaXw+8isl8p00U0w2HFqv9HENB1uGdyMlM9jWhmbn0K6MqJ8HBH4/oKRvbZleYs68Q5CFswU8XoHBPxgeQu98RuWJiBjqgNeis/p5tBK567jyiy4A1rf0Ff4rHvJR1I7WHcWwFf0ZjH3jQvusLemzSSuGpPPNKXzZ/5Uq1Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jbhGdssE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jbhGdssE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792151235; x=1823687235;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=HTxWURkNFjpXwaAsnQUTI3D0ESEGIk/BceEvJ64+arE=;
  b=jbhGdssEy4US8ylyb4aGjLurW8whzXM0TFKeNpv1Aa+an+cOq2wqv8Ju
   nKCnxn6EnwPpwl8qpVLUcvKJXLZVKvvuz7dSeb0KuVJmaOpfehuhyfK3x
   i0nh/PRJh0NvHKFoFPR9WONx8flLozGGAyfe9OvJPM3Th8Wexn4NI3izt
   kyEnDHTSWDYv6cWPBw+QKqNm6xTrzM6bF/u/TfjLe0Zza4ug94gAFi8D6
   UCUwds94abFLf/T3MIcDjZHcwoibLV0iUQM9XpHoxDLKkAythpQIbgPdP
   LeWavxk+/agJk54PZ4TXD0F5qNLhaNR5vYww0AmRlR3hCM3zRkmxEYfGd
   A==;
X-CSE-ConnectionGUID: AOmQ45tJS4Wy20X4/n/iWg==
X-CSE-MsgGUID: ixPpcru8TJeRr+W+ABFs3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="832246"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="832246"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 04:47:14 -0700
X-CSE-ConnectionGUID: +EOS7/mfSFaqZsLsOvJCqg==
X-CSE-MsgGUID: JNOtVUchQp62xemQt6+B2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1830574"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.34])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 04:47:11 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 16 Oct 2026 14:47:05 +0300 (EEST)
To: Muralidhara M K <muralidhara.mk@amd.com>
cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 0/4] platform/x86/amd/hsmp: Family 1Ah client
 support
In-Reply-To: <20261012085407.1202295-1-muralidhara.mk@amd.com>
Message-ID: <1b15803b-36ed-3af6-97c0-5689a1694975@linux.intel.com>
References: <20261012085407.1202295-1-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 Oct 2026, Muralidhara M K wrote:

> This series enables the HSMP driver on the Family 1Ah client platforms,
> Models 80h-8Fh and E0h-E3h.
> 
> The client parts probe through the same ACPI _CRS/_DSD as a server
> socket, but drive a different mailbox and speak the Ryzen Master SMC
> message set instead of server message IDs.
> 
> Patch 1 adds is_client_platform() and hides the pre-existing hwmon
> attributes, ACPI sysfs attributes, metrics_bin, and metric-table
> DRAM-base lookup on client platforms, and restricts /dev/hsmp to 0600
> there. Patch 2 adds the client message set and routes it through the
> existing MMIO path. Patch 3 wires the client metric-table messages
> into the metric-table read path. Patch 4 adds the client telemetry
> table.
> 
> Changes in v9:
> 
>   - Patch 1: fixed a build failure on CONFIG_ACPI=n configs reported
>     by the kernel test robot. is_client_platform() now gates the
>     acpi_gbl_FADT access with #if IS_ENABLED(CONFIG_ACPI) instead of a
>     runtime check, which does not stop the compiler type-checking the
>     dead branch.

Hi, 

I've taken this to the review-ilpo-next branch now.

But please do check the args[0] access mention from sashiko. It looks to 
me it results just incorrect error code at worst if num_args is 0 (-EPERM 
vs -EINVAL). As it also looked to be a pre-existing issue, I didn't want 
to delay this with yet another round because of it but it seems still 
worth to address if it turns out to be a valid observation.

--
 i.

> Changes in v8:
> 
>   - Reordered the series per review from Ilpo Jarvinen: patch 1 now
>     adds is_client_platform() and every client-platform exclusion
>     (attribute hiding, DRAM-base lookup, /dev/hsmp mode) before
>     patch 2 adds client message routing.
>   - Patch 3 upgrades patch 1's defensive DRAM-base guard to the full
>     RYZEN_MASTER_PROTO_VER1/HSMP_PROTO_VER6 check.
>   - Patch 4 unchanged.
>   - Tightened commit messages and code comments to an imperative,
>     concise style.
> 
> Changes in v7:
> 
>   - The client message set no longer has a per-message descriptor
>     table (hsmp_client_msg_desc_table is gone).
>     Validate num_args and response_sz with HSMP_CLIENT_MAX_MSG_LEN.
>   - /dev/hsmp is now registered at 0600 on client platforms instead of
>     0644, since hsmp_ioctl_msg() has no per-message GET/SET gate there
>     and any opener could otherwise issue a destructive client SET
>     message; server platforms are unaffected.
>   - New patch 3: the pre-existing hwmon registration, ACPI sysfs
>     device attributes and metrics_bin visibility predate the client
>     message set and are wired to hardcoded server message IDs, which
>     mostly collide with unrelated client commands on a client
>     platform. Guard all three with is_client_platform(), keeping
>     smu_fw_version and protocol_version visible since they report the
>     same data on both message sets.
> 
> Changes in v6:
> 
>   - Patch 1: dropped "inline" from get_msg_desc() too, for the same
>     reason as hsmp_desc(): it does a range check and a reserved-type
>     check, not a trivial accessor, so let the compiler decide.
>   - Squashed what was patch 3 ("Add ACPI client support for Family
>     1Ah") into patch 2. Patches 1+2 alone, without the old patch 3,
>     would have left hsmp_metric_tbl_read_locked()'s new client message
>     routing unreachable: hsmp_get_tbl_dram_base() never runs on a
>     client platform until the ACPI DRAM-base gate lands, so the two
>     belong together as one atomic change.
>   - Patch 2 (now including the former patch 3): also guard the
>     pre-existing server proto_ver clause with !is_client_platform(),
>     not just the new client clause, per review. hsmp_pdev->proto_ver
>     is a small Ryzen Master interface version number today, but
>     nothing stops a future client interface version from reaching
>     HSMP_PROTO_VER6 (6) and making that clause spuriously true on a
>     client platform.
>   - Series is now 3 patches instead of 4, following the squash above
>     and addressed the review comments.
> 
> Changes in v5:
> 
>   - Patch 3: hsmp_pdev->proto_ver holds the Ryzen Master SMC interface
>     version on client platforms, a separate numbering space from the
>     server protocol versions in enum hsmp_proto_versions.
> 
> Changes in v4:
> 
>   - SMU now answers the interface version query on client platforms,
>     so hsmp_desc_client.proto_ver_msg goes back to
>     HSMP_CLIENT_GET_INTERFACE_VER instead of
>     HSMP_CLIENT_GET_METRICS_TABLE_VER. Patch 3 is back down to just
>     the ACPI metric-table-DRAM-base change, since that was the only
>     other thing it did.
> 
> Changes in v3:
> 
>   - is_client_platform() now tells client and server apart through the
>     ACPI-reported PM profile (FADT preferred_profile) instead of a
>     hardcoded Family 1Ah model range, the same signal amd-pstate
>     already keys off of. Future client generations are recognised as
>     long as firmware reports the right PM profile, with no driver
>     update needed.
>   - hsmp_desc() now resolves the running platform's descriptor once and
>     caches the pointer behind READ_ONCE()/WRITE_ONCE() instead of
>     recomputing it on every call. Concurrent first callers are benign,
>     since every one of them computes and stores that same pointer, so
>     the pair only needs to keep the load/store from being torn or
>     reordered by the compiler, not order it against anything else.
>   - The client message enum in amd_hsmp.h is now documented with
>     kernel-doc, one @member entry per message describing its inputs
>     and outputs, rather than a block comment plus a same-line comment
>     per enumerator. Noted there that not every platform supports every
>     message and that an unsupported one returns -ENOMSG.
>   - Patch 4: the Telemetry Table RM layout moved out of the .rst and
>     into amd_hsmp.h as real kernel-doc'd struct/enum declarations,
>     giving userspace one authoritative definition of the byte layout.
>     The .rst now just points at struct hsmp_telemetry_table_rm. The
>     structs are now also packed to a 4-byte boundary to match
>     firmware's actual layout, and the trailing NPU/PMF counters and
>     spare padding firmware carries after the overclocking fields are
>     no longer missing. Verified field-by-field against AMD's internal
>     metrics table header and end-to-end against a live snapshot off
>     Family 1Ah client hardware.
> 
> Each patch builds individually and is clean under checkpatch.pl --strict.
> 
> Muralidhara M K (4):
>   platform/x86/amd/hsmp: Recognize Family 1Ah client platforms and hide
>     server-only paths
>   platform/x86/amd/hsmp: Add HSMP client support for Family 1Ah
>   platform/x86/amd/hsmp: Route metric table through the client messages
>   platform/x86/amd/hsmp: Document and expose client telemetry table in
>     UAPI
> 
>  Documentation/arch/x86/amd_hsmp.rst  |  24 +-
>  arch/x86/include/uapi/asm/amd_hsmp.h | 420 +++++++++++++++++++++++++++
>  drivers/platform/x86/amd/hsmp/acpi.c |  31 +-
>  drivers/platform/x86/amd/hsmp/hsmp.c | 248 +++++++++++-----
>  drivers/platform/x86/amd/hsmp/hsmp.h |  24 ++
>  5 files changed, 676 insertions(+), 71 deletions(-)
> 
> 
> base-commit: 6c377d19d4a5116d9bec5203aa3c6c11523e7898
> 

-- 
 i.

