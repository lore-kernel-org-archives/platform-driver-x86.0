Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1F03F88A8;
	Mon, 27 Jul 2026 11:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785150845; cv=none; b=OlXhtsxcGshzMPBD4JbbaY/mart9BLIZ6XW/DoQQM3n8Ns+81sT/DuluYmHmplflxafJmTm/A9DAkERMF1WycUZlzGL6NVJzNgSp6q8BMN4MkZ+hy1JVsR3gnr2s5GefU2Tg4gM9JLlATXsOvibjYGbynbcH2ZE1D5wUubgO1ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785150845; c=relaxed/simple;
	bh=V90ijxQ4BmhlF25qqo7qGPI0O23+ArhOp16dKrzKzQA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=TpYkjT2N0rj7gqFcbhAMSQNj4II9ZNtaFiV7UtX2xgFryUUA1Evnith5fS1c2tJ2ooebqItsi2UHWKSNt/ImYKbTBs5f+irkslgTCJ36e6cenTa9shE/LRLRegHEy7S3jSLAxXG46SdAbAqpXKargByEpUCqCp2+zYhjH4g2fms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j+fAR1+n; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j+fAR1+n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785150844; x=1816686844;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=V90ijxQ4BmhlF25qqo7qGPI0O23+ArhOp16dKrzKzQA=;
  b=j+fAR1+n/XOWA6FcSJ5+Cy1ayJuJQEsQJJEDVzs3vUkolkQduU0vCvHt
   VO+TmNPrUi3ghlOd+MhRBohUclHf37kTivKGO99KJk/AoLW9uHBaXLJlk
   6BcbzLsj0ciFi3BIIZgdrpicYemsp5VRU8CtmRTB5FcMpTXL28GfpBWX0
   FGGa8Vj6oYAW7XuliMt5HRI5GDN6lWeyzgAPRI/IIwenIIuRfBzIRft9g
   HiNSZn8CnnfyCKHtuHs7jUbHQ78vno7/77E+UL4DBgUbOFqLxQjSPHTny
   fva2EYdJZss0mvZheSrctAILzKs0A5FRkfIkKV30hwDisBWiWPepCq6Gp
   A==;
X-CSE-ConnectionGUID: PHDSA5jrQzOeFD+D4Thwqg==
X-CSE-MsgGUID: zKvKLSrCTeWFQbIxTHa2PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11857"; a="85759196"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="85759196"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 04:14:04 -0700
X-CSE-ConnectionGUID: wWVG8FrvRT6Nuq1WyWFcWg==
X-CSE-MsgGUID: Dn2iGYoSSjezDrcEON1qcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="262879071"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.226])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 04:14:02 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 27 Jul 2026 14:13:58 +0300 (EEST)
To: Muralidhara M K <muralidhara.mk@amd.com>
cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 0/8] platform/x86/amd/hsmp: Family 1Ah Model 50h-5Fh
 HSMP and metrics
In-Reply-To: <20260612042610.1629037-1-muralidhara.mk@amd.com>
Message-ID: <4306b8b9-e560-90fc-54e2-d694fdefa54c@linux.intel.com>
References: <20260612042610.1629037-1-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 12 Jun 2026, Muralidhara M K wrote:

> Hi,
> 
> This series extends the AMD HSMP platform driver and UAPI for Family 1Ah,
> Model 50h-5Fh: new HSMP message IDs (including PQoS-related IDs in the
> first patch), Zen 6 metric table layout in UAPI, relaxed response_sz
> handling against the descriptor table, firmware-reported metric table
> sizing for ioremap and reads, HSMP_IOCTL_GET_TELEMETRY_DATA on the
> existing character device for a single-shot full-table copy (avoiding
> sysfs PAGE_SIZE limits and torn reads), ACPI enablement for protocol
> version 7 tables, Spectre-v1 hardening on user-controlled indices, and
> coordinated metric-table access plus ACPI HSMP probe/remove lifetime
> fixes on the shared global socket array.  Documentation is updated in
> Documentation/arch/x86/amd_hsmp.rst.
> 
> v5 submission (lore.kernel.org)
> 
>   https://lore.kernel.org/platform-driver-x86/20260611052919.1095549-1-muralidhara.mk@amd.com/T/#t
> 
> Changes since v5
> 
> * Patch 6/8: Tighten the Spectre-v1 changelog and subject around
>   clamping ioctl and hsmp_send_message() indices; wrap the commit
>   description so scripts/checkpatch.pl stays quiet on line length.
> 
> * Patch 8/8: Broaden the final fix beyond sysfs metric locking alone.
>   Serialize metric table refresh and memcpy_fromio(), refcount ACPI
>   HSMP sockets with a probe mutex across init_acpi(), misc_register(),
>   and refcount_inc(), replace devm metric DRAM maps with explicit
>   ioremap()/mutex_init plus hsmp_metric_tbl_unmap_all() on last ACPI
>   remove, add hsmp_acpi_free_sock_alloc_if_idle() for early probe
>   failures, and order legacy platform remove so misc is deregistered
>   before metric unmap (matching ACPI teardown).
> 
> The series is bisect-safe: each commit was built with
>   make M=drivers/platform/x86/amd/hsmp
> after the previous commits, and scripts/checkpatch.pl -g <rev> was run on
> each change (0 errors / 0 warnings).
> 
> Thanks,
> Muralidhara M K
> 
> Muralidhara M K (8):
>   platform/x86/amd/hsmp: Add HSMP messages for Family 1Ah, Model 50h-5Fh
>   platform/x86/amd/hsmp: Add UAPI structures for Family 1Ah Model
>     50h-5Fh metrics table
>   platform/x86/amd/hsmp: Unify response_sz validation to an upper-bound
>     check
>   platform/x86/amd/hsmp: Source metric-table size from firmware
>   platform/x86/amd/hsmp: Add IOCTL_GET_TELEMETRY_DATA for metric table
>     reads
>   platform/x86/amd/hsmp: Clamp ioctl/send_message indices (Spectre v1)
>   platform/x86/amd/hsmp: Enable HSMP_PROTO_VER7 metric tables on the
>     ACPI driver via the IOCTL
>   platform/x86/amd/hsmp: Serialize metric table access and ACPI HSMP
>     teardown

Hi,

Could you please do a fresh iteration of this. It no longer seems to apply 
cleanly and maybe sashiko now figures we should have the locking in place
as well so we get a fresh review which hopefully does take the latest 
improvements into account.

-- 
 i.

