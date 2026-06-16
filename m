Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54AF3168EE;
	Tue, 16 Jun 2026 12:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781612349; cv=none; b=aew7UL7CU8dE/xDaSbHEE+KoU1+4LV0PL0+1Lf+gQj/z8gnI4eGN9o1m7KArDwpioRSCfXDjK1cXkCcoL00RGspqUKa6Ms7rPT/3QNS1+Gm1VUxdkpaVywTM1WXo2Th/q4u1/BEKdqeK0rSBzfonBdgjIIz+3csLWr1Dw4uKXGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781612349; c=relaxed/simple;
	bh=BvMGllJkf+OOnbTILPdOgL3Aj4GRyHHnOqZ/2uY7aTo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Jncqzc+k+dkOFL7Wg+RLuIpqKv35Fx9Kp5AN06zlNuboA5iC0d9ME2qGfLw8bBJBsgqKRg1Dax/L0SPAkrtkD8H3qBjKPfwTO7AMllt/OdnAPwadtEB9Dohyo7bb+Tg4TY1VmoR5qTBj3aLf8ERi/3BfLHkiHlsohPdI+99LZ3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hK7nWVIr; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hK7nWVIr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781612348; x=1813148348;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=BvMGllJkf+OOnbTILPdOgL3Aj4GRyHHnOqZ/2uY7aTo=;
  b=hK7nWVIrrK3UcZxQSh6KcXjP0ISspzOc2pA/5I0l5TBaDIpuwwVdVknB
   CiYyMw6F5e++RvHYB9vjit0kpa8VzWy6gposrLtXhCVqGB3TdibwG75qr
   vEv3TdpaoqerIM648rZUszxnt4gPo967IqujSFwDDDAoKmxP42Qr6X9bJ
   spx7QcYZNn7oN2Fw87815FZ/M/AF0ZJ3p3gaJKL6uDNFbN8aiw4QFqXdS
   tpot2SYdBSckIZmmI/s8IR/FdCK1uYyH9ItnVYp+sIxnfLUc6+mVkLDc2
   pzJACOmyeJ2YQe+W9sXGjjU1uHrG8R61D09ZTpZq2Km5gOXCBF4F792is
   Q==;
X-CSE-ConnectionGUID: /V89sdw0T0e4Hx83WHBIlg==
X-CSE-MsgGUID: oJm06DfASgell/TRnfzgNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="93862581"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="93862581"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 05:19:07 -0700
X-CSE-ConnectionGUID: ObQzzPfHRquLf+hQUdxyNA==
X-CSE-MsgGUID: FlIxF7UkQ5y3ogJ6hDp8tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="247820463"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.171])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 05:19:06 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 16 Jun 2026 15:19:01 +0300 (EEST)
To: "M K, Muralidhara" <muralimk@amd.com>
cc: Muralidhara M K <muralidhara.mk@amd.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] platform/x86/amd/hsmp: Harden ACPI probe, metric
 DRAM, and socket teardown
In-Reply-To: <8b8ab5dd-3f9c-4f1e-b853-97c381c885da@amd.com>
Message-ID: <eb609912-1c42-6354-22e6-5ffd1f097e9f@linux.intel.com>
References: <20260613191755.2358969-1-muralidhara.mk@amd.com> <8b8ab5dd-3f9c-4f1e-b853-97c381c885da@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 16 Jun 2026, M K, Muralidhara wrote:

> Hi Ilpo,
> Could you please check and review.

Hi,

Please wait at least 2 weeks before inquiring about any series. And in 
any case, if the series is still listed in the platform drivers patchwork 
queue I'll eventually get to it (it won't be forgotten as long as it
appears in the patchwork).

In the meantime, you may want to check if sashiko.dev has found something 
that should be corrected. As sashiko is AI, it isn't always right so keep 
that in mind while reading it's findings. You don't need to address 
"pre-existing issue" reports sashiko gives nor defend against any of its 
findings unless a seasoned reviewer agrees with sashiko.

-- 
 i.

> On 6/14/2026 12:47 AM, Muralidhara M K wrote:
> > This series tightens concurrency and lifetime management in the ACPI-backed
> > AMD HSMP platform path so probe/remove races cannot corrupt global probe
> > state,
> > leak metric-table DRAM mappings, or tear down shared resources while readers
> > might still be active.
> > 
> > Patch 1 introduces a dedicated probe mutex around ACPI probe, remove, and
> > init_acpi(), replacing ad-hoc synchronization on the global is_probed
> > handshake.
> > lockdep_assert_held() documents the locking contract for init_acpi().
> > 
> > Patch 2 switches metric table DRAM from devm_ioremap() to ioremap() with
> > explicit init/teardown helpers, and embeds a per-socket mutex for metric
> > reads.
> > The legacy platform driver wires the same helpers so non-ACPI builds stay
> > consistent.
> > 
> > Patch 3 replaces the global is_probed flag with miscdevice registration
> > state,
> > refcounts ACPI socket platform devices with kref, and runs coordinated
> > release
> > on the final put: misc deregistration when appropriate, metric unmap, and
> > socket
> > array free. Socket storage uses kcalloc() with careful failure cleanup
> > before
> > any kref is published.
> > 
> > Muralidhara M K (3):
> >    platform/x86/amd/hsmp: Serialize ACPI HSMP is_probed with a probe
> >      mutex
> >    platform/x86/amd/hsmp: Add explicit metric DRAM mapping and per-socket
> >      mutexes
> >    platform/x86/amd/hsmp: ACPI HSMP refcounted sockets and coordinated
> >      release
> > 
> >   drivers/platform/x86/amd/hsmp/acpi.c | 87 +++++++++++++++++++++++-----
> >   drivers/platform/x86/amd/hsmp/hsmp.c | 38 +++++++++++-
> >   drivers/platform/x86/amd/hsmp/hsmp.h |  9 ++-
> >   drivers/platform/x86/amd/hsmp/plat.c |  3 +
> >   4 files changed, 119 insertions(+), 18 deletions(-)
> > 
> 
