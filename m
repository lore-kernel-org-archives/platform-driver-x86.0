Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64FD2F7EF4;
	Wed,  8 Jul 2026 10:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783505227; cv=none; b=AEjs5kl4lIXSxQqlO2CTA2Z6/Sw7+V+1Lb/h8wGulFPDP5RPQdXlLdQln+tTAM1zmIBfB6emYdGxolQA9d7FLLnzUXQVRzVPlnYIQmJA7LDbZvBPpjVkTCz6ure0PATCf91n7PMW/wV7uOYDIRki7rL4R0XAy4D6kUQnESwFRxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783505227; c=relaxed/simple;
	bh=/9CurCDDIxrfsqy3CKWNTin/1Z1JhAcbWCO1kzN/BHw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=AtQfQVkKKiGP96WJ48qTVqSB/SgvtBbwZWc5pv5jR2SZe0gWCzUApv0c85RUp8cSKwJ/yrePr+hdsspkiqWdNOUKbtHe69rac27oFwsAeZgwcZ39rqvbbv4WumSsNkkEtYKgRm68lMLIxF0cGS1xJSUAG6MIZbRvutgX8gtJuwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l3HpkGFn; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l3HpkGFn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783505226; x=1815041226;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=/9CurCDDIxrfsqy3CKWNTin/1Z1JhAcbWCO1kzN/BHw=;
  b=l3HpkGFnAZWlAhoGd1Kmf1QeLWpDWdmqVVibm2vVW5BQ/O4bOwZMEMml
   MVe9s9hsK3oauLHGJnQxAQqH5iDKnq8/W+0or9WEU9T6kow1ipm9Cq3T4
   HglKdyhyhHm9PXfMKbk+HGLg6IK+EbFBM6z85naC2ZFAC/Ow8MVqF0hKJ
   FZaELSJCr0wii1jsizoQayQVPNkOnBx62tplCRMsw6QbFVNvqS72RYS37
   sWBLYza+QoYgnHbj4Z32zsdfx1WVaPEhZQbdBqo+REMXAp/Y3dk91tJhZ
   Urxx5cItrwL60+PDRiNofpaM/40oajgo/r2omF7Hz+NSfJ2K6AKZHyIVm
   Q==;
X-CSE-ConnectionGUID: lHPm8U0xQla5CA4gh8PLYQ==
X-CSE-MsgGUID: wd87BplOSpiOdLW+Mdw2yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="71684521"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="71684521"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 03:07:05 -0700
X-CSE-ConnectionGUID: PJas3+mHSQe+sg12AuhdGQ==
X-CSE-MsgGUID: 526PC9cbRa+8EVHp0sY55w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="249805880"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.169])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 03:07:03 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 8 Jul 2026 13:07:00 +0300 (EEST)
To: Muralidhara M K <muralidhara.mk@amd.com>
cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 0/6] platform/x86/amd/hsmp: Serialize the data plane
 against socket teardown
In-Reply-To: <20260708042405.3758294-1-muralidhara.mk@amd.com>
Message-ID: <c0ff9acc-5a29-1556-dc35-3df205bcf9ec@linux.intel.com>
References: <20260708042405.3758294-1-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 8 Jul 2026, Muralidhara M K wrote:

> This series makes the AMD HSMP driver safe against concurrent probe/remove
> of its per-socket devices and against the lock-free data plane (open
> /dev/hsmp fds and hwmon/sysfs reads) racing socket teardown.
> 
> The ACPI front-end binds one platform device per socket but shares a single
> socket array and a single /dev/hsmp misc device across them, while the data
> plane issues mailbox messages with no coordination with driver teardown.
> misc_deregister() does not drain already-open fds, so an in-flight message
> can touch a freed socket array or an unmapped mailbox on unbind.
> 
> The fix is built up in small, bisectable steps:
> 
>  1. Serialize the ACPI probe/remove handshake with a dedicated mutex.
>  2. Map the metric table with ioremap() and release it via a devres action,
>     so its lifetime is no longer pinned to a single per-socket devres scope.
>  3. Serialize the per-socket metric-table fill-and-copy with a mutex.
>  4. Clear mdev.this_device on deregister (independent hygiene fix that the
>     next patch relies on to track /dev/hsmp registration).
>  5. Track shared socket ownership with a refcount and a single coordinated
>     release helper, drop the is_probed flag and unparent /dev/hsmp.
>  6. Add hsmp_sock_rwsem: the data plane holds it for read, a teardown path
>     holds it for write to drain in-flight messages before freeing the socket
>     array or unmapping the mailbox.
> 
> Each patch builds on its own and the series is checkpatch --strict clean.
> 
> Changes since v3:
>  - Use guard()/scoped locking consistently for both the probe mutex and the
>    data-plane rwsem, from the first patch that introduces each lock.
>  - Platform teardown now uses devm_add_action_or_reset(): the metric-table
>    unmap and the per-socket mutex destroy run from a single devres action
>    instead of explicit remove()/probe-failure code. The ACPI array is shared
>    across per-socket devices and must outlive an individual unbind, so it
>    stays on explicit teardown.
>  - Split the mdev.this_device clear into its own patch (new patch 4).
>  - Drop dead defensive checks: the !sock guard in hsmp_unmap_metric_tbls()
>    and the if (sock) in hsmp_acpi_remove(). Keep and document the one in the
>    probe-failure path, where sock can legitimately be NULL.
>  - Replace the !--refs construct with a plain decrement-then-test.
>  - Explain why the probe path uses a separate mutex rather than the rwsem
>    write side: the probe path itself drives the data plane via hsmp_test(),
>    which takes the rwsem for read, so holding it for write across probe
>    would deadlock.

Hi,

Could we have xx_locked() variant function for hsmp_test() to use so the 
recursive locking problem is avoided?

>  - Comment cleanups: drop history and "patch N" references, drop
>    parenthetical function asides, single space after periods.
> 
> Muralidhara M K (6):
>   platform/x86/amd/hsmp: Serialize ACPI HSMP is_probed with a probe
>     mutex
>   platform/x86/amd/hsmp: Map the metric table with ioremap() and unmap
>     it explicitly
>   platform/x86/amd/hsmp: Serialize per-socket metric table reads with a
>     mutex
>   platform/x86/amd/hsmp: Clear mdev.this_device on deregister
>   platform/x86/amd/hsmp: ACPI HSMP refcounted sockets and coordinated
>     release
>   platform/x86/amd/hsmp: Serialize the data plane against socket
>     teardown
> 
>  drivers/platform/x86/amd/hsmp/acpi.c | 135 ++++++++++++++++++++++++---
>  drivers/platform/x86/amd/hsmp/hsmp.c | 107 ++++++++++++++++++++-
>  drivers/platform/x86/amd/hsmp/hsmp.h |  15 ++-
>  drivers/platform/x86/amd/hsmp/plat.c |  26 ++++++
>  4 files changed, 265 insertions(+), 18 deletions(-)
> 
> 
> base-commit: ff7836fa850c2f815bc219f1e48f6ec8699f4ae7
> 

-- 
 i.

