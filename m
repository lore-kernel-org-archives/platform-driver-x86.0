Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10A021B9F6;
	Sun, 14 Jun 2026 23:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781479880; cv=none; b=J/1j+7ji2gSdjXF/HE8452G7ex9JDup2UHAZfo1ouZag5YpZyW2mYae1i4+xCYYSh40UEbWIyic04joUw4pLOJ3xALXW4dbh8dvBZFLHS1kQN9Si30rHkqgSOJ2Q6KYP1XFJTthx0gky/juT0yTt57ExDA6mz1W9F8M7WihzFh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781479880; c=relaxed/simple;
	bh=B5nvh2Kea7NEDumP/geQcnAY7QsIWW57myPD8jpdgMI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SuIhE/5zVbo658hu9Aar6FgJIPy0dvXWw6Hf1jIBkNLVsu2CE2eXdFDVvdJsAb1f0Xa0Oo7qO/+GrboZqClvmNvEdQc9gTvEMROlwqd+EQSI/VlfIABCwCuj6Y2KQP7tI2c4NZ5ZBFDDfYnWF5MZ+7k1fppLqE0fFUJe+uwzpAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T565ShL1; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T565ShL1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781479879; x=1813015879;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=B5nvh2Kea7NEDumP/geQcnAY7QsIWW57myPD8jpdgMI=;
  b=T565ShL171exGKldBc4wcOq/GT0d8JtaY7EbUfovpo4RZNxWird52f1R
   B9spyaw4YO3wQnTXxhFkGSuTD9eHgDoukaKiccgoAiJbHu+tO+Wfvw1uz
   PdGaagSYY3Z8iqQECmBbUnoJN5q7yIlvARv4b5gl6ezacwR5vchaf61Ia
   0LYulI0vm/eGS4UzrKu9CQKb727wACMCik7Q3vQXYCsIeo5kRL5mXnpPO
   RwOnQzPiIan8bj+OF4Tj+y1DZyzSGl1KQ9HWExmxs8ImS4rJQ3D9AyemB
   e+s1VsIiCcyTbMxFUGhxP4AiKuGbt6Sz5EpGgf/3zVD68aR+gX/JZ1A8Y
   Q==;
X-CSE-ConnectionGUID: SGeBoLSWTp217jjiQwfkQQ==
X-CSE-MsgGUID: v+Aatj5xT7u8OLBLuS7F2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82202270"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="82202270"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 16:31:18 -0700
X-CSE-ConnectionGUID: RPWl9S7lRkmEy82+RMrHiA==
X-CSE-MsgGUID: 1wePM9inSme/0cKUajwZ9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="240967072"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.228])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 16:31:15 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, irenic.rajneesh@gmail.com, 
 "David E. Box" <david.e.box@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 srinivas.pandruvada@linux.intel.com, xi.pardee@linux.intel.com
In-Reply-To: <cover.1781294741.git.david.e.box@linux.intel.com>
References: <cover.1781294741.git.david.e.box@linux.intel.com>
Subject: Re: [PATCH v8 00/15] Add ACPI-based PMT discovery support for
 Intel PMC
Message-Id: <178147987097.11062.13303916592797576023.b4-ty@b4>
Date: Mon, 15 Jun 2026 02:31:10 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Fri, 12 Jun 2026 14:01:41 -0700, David E. Box wrote:

> This series adds ACPI-based PMT discovery support and wires it into the
> Intel PMC telemetry stack for Nova Lake S.
> 
> Today, PMT discovery flow is primarily PCI-oriented. Some platforms expose
> PMT discovery via ACPI _DSD, and PMC telemetry needs to consume that path
> for both standalone and companion-device cases. This series addresses that
> in three logical steps:
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[01/15] platform/x86/intel/pmt: Add pre/post decode hooks around header parsing
        commit: acd3b94f8604aeee2b62f8fd18e95a0474546288
[02/15] platform/x86/intel/pmt/crashlog: Split init into pre-decode
        commit: b3de79d932bdcee4b2b9c8f9a058516699cf1c50
[03/15] platform/x86/intel/pmt/telemetry: Move overlap check to post-decode hook
        commit: 521460e6699557f2aa0e4818110e082b76809e98
[04/15] platform/x86/intel/pmt: Pass discovery index instead of resource
        commit: 4a87492cd137d158779923a034d7e742f7358952
[05/15] platform/x86/intel/pmt: Cache the telemetry discovery header
        commit: 4dfc7dca6e934ca414d8d3c70a84e79d13d9e750
[06/15] platform/x86/intel/pmt: Unify header fetch and add ACPI source
        commit: 13793c7f9e9ff30042a54bb680662b5cfa0f58fa
[07/15] platform/x86/intel/pmc: Add PMC SSRAM Kconfig description
        commit: 8ba4cf60c5ce4a3073126a6cbb09475010f8fa52
[08/15] platform/x86/intel/pmc: Add ACPI PWRM telemetry driver for Nova Lake S
        commit: adc5d98d9ff8b5d37e89e11a2ac5512595541329
[09/15] platform/x86/intel/pmc/ssram: Rename probe and PCI ID table for consistency
        commit: 90fd47d0d8109ef1301a60a44a7f85581a1e6efe
[10/15] platform/x86/intel/pmc/ssram: Add PCI platform data
        commit: d936dd2c605a17ab41826c1e7f738424d3d0bbfd
[11/15] platform/x86/intel/pmc/ssram: Refactor DEVID/PWRMBASE extraction into helper
        commit: f79e57e2677c7641e94d5a38d4b2c2165f5c385c
[12/15] platform/x86/intel/pmc/ssram: Switch to static array with per-index probe state
        commit: e3c9200a9c0e05532c495956883ba11fe23a3df0
[13/15] platform/x86/intel/pmc/ssram: Add ACPI discovery scaffolding
        commit: 08b94937c78aaa144e3afff659c6112bffea6bf0
[14/15] platform/x86/intel/pmc/ssram: Make PMT registration optional
        commit: 8a3607ece59fcf84cf4129bdf683cb09122e6b51
[15/15] platform/x86/intel/pmc: Add NVL PCI IDs for SSRAM telemetry discovery
        commit: 50022e56dc89fbf1ec22826edf03dc2e5b9076cc

--
 i.

