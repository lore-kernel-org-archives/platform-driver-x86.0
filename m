Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F801DB34E
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Dec 2024 17:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733162038; cv=none; b=m6ANFF1qjuvvXEfnoeDveFUjb3IGH+PHUoA6coKaV98v+wKK3iBLPfEatVTfOprtaGQLqsPxW39IG3Wzw7/POVl9lRJDRYmw/I/UmH1ez2Wt7AkP7YVnJayxop4GyzkD+8YWqOChvJ8AvBYhVkn/0x5H8S1Y3omlDThfuA5d1Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733162038; c=relaxed/simple;
	bh=1O8Jnzd2HEBru/xjRiEozNO8bodAz7JTcJ984l9oIFw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=cn++mAsa7zdibzgItIO+/MF1UOFnYc+8CrpJVB9JZ3kDblAoxZUb9jm5bk+ANIUDKKzSaKr2SUUWia2UXCoCJEqv4ubB6Wrm9M5J8Mfh2gleweiYRUENZ4ZVCjKHaShHE+B7B5tjoQ7WSaVNV7gOe1gCS8kWxT2NaAuPJxiZ7BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SzFC0uvO; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SzFC0uvO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733162037; x=1764698037;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=1O8Jnzd2HEBru/xjRiEozNO8bodAz7JTcJ984l9oIFw=;
  b=SzFC0uvOa5t1zkqP9KtWctwEPCv810sHYl7uRPLY8LLnDjFqPOK1gCLs
   Ed3sJYdtfi72Lm1xyzrNoEPW0BLm2uoZ9zkEQQLHArwhdyJ/H/4fhTYu+
   S4UwKP2Am4SYX5oX5j6aF7kxivb0bi4n5bEVCB6LOvFSxkCcvTOOBv6Qy
   m2mGGFWunGkUEwrltklh1/ONzA9N8aP5eiBsparkRBl8cjCbkNdyFyM1l
   SsTCnLMGPOJFsPnUOuE0oo+QOq1FdsQ/C7zCszHp8qS7k99McHb53wFkz
   +XkworWqwod9JFH7oEeOK0lOFTFQ9NcshSisddeIU7UjkdjPeQde1mprA
   A==;
X-CSE-ConnectionGUID: 1dUcx633R++DNoXL/PnYkA==
X-CSE-MsgGUID: UZuG7EqAT2eBc6+5X6f6qA==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="37011480"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="37011480"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 09:53:57 -0800
X-CSE-ConnectionGUID: m9tcufQcTjm4HsujONNzSQ==
X-CSE-MsgGUID: e3Ndsmc1Rwq+JuWZrzi1GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="94008746"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.61])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 09:53:54 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 2 Dec 2024 19:53:50 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, Sanket.Goswami@amd.com, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v5 00/10] platform/x86/amd/pmc: Updates to AMD PMC
 driver
In-Reply-To: <20241108070822.3912689-1-Shyam-sundar.S-k@amd.com>
Message-ID: <abf2b911-e3a1-f8fb-5edf-82cf989fc4ec@linux.intel.com>
References: <20241108070822.3912689-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 8 Nov 2024, Shyam Sundar S K wrote:

> Updates include:
> - Rework STB code and move into a separate file
> - Update the code with new IP block information for newer SoCs
> - Add STB support for new generation
> - Add STB support for Ryzen desktop variants
> - Updates to MAINTAINERS record.
> 
> v5:
> ----
>  - Merge patch1 and 2 of v4
>  - Update Ilpo tags
>  - drop explicit typecasting.
>  - Use switch() for getting the message port
>  - Rename function names

Thanks for the update. I applied v5 to review-ilpo-next branch. I ended up 
reordering ips_ptr and active_ips members in the struct amd_pmc_dev to 
group them together.

While checking this series out, I notice there's also one sparse warning
in amd/pmc dir:

drivers/platform/x86/amd/pmc/mp2_stb.c:105:30: warning: incorrect type in 
assignment (different address spaces)
drivers/platform/x86/amd/pmc/mp2_stb.c:105:30:    expected void [noderef] 
__iomem *vslbase
drivers/platform/x86/amd/pmc/mp2_stb.c:105:30:    got void *

If you could fix that please.

-- 
 i.

> 
> v4:
> ----
>   - Reorder patches as suggested by Mario and Ilpo
>   - Squash patches
>   - Update tags
> 
> v3:
> ----
>  - Split patch 1/8 of v2 into two more patches
>  - Add helper for printing S2D/PMC ports
>  - Use ARRAY_SIZE() for getting the number of IPs
>  - Address other remarks from Ilpo.
> 
> v2:
> ----
>  - Add Mario's Reviewed-by tags
>  - Add amd_stb_update_args() to simplify code handling
>  - use cpu_feature_enabled() instead of root port's cpu_id information.
> 
> Shyam Sundar S K (10):
>   platform/x86/amd/pmc: Move STB block into amd_pmc_s2d_init()
>   platform/x86/amd/pmc: Move STB functionality to a new file for better
>     code organization
>   platform/x86/amd/pmc: Update function names to align with new STB file
>   platform/x86/amd/pmc: Define enum for S2D/PMC msg_port and add helper
>     function
>   platform/x86/amd/pmc: Isolate STB code changes to a new file
>   platform/x86/amd/pmc: Use ARRAY_SIZE() to fill num_ips information
>   platform/x86/amd/pmc: Update IP information structure for newer SoCs
>   platform/x86/amd/pmc: Update S2D message id for 1Ah Family 70h model
>   platform/x86/amd/pmc: Add STB support for AMD Desktop variants
>   MAINTAINERS: Change AMD PMC driver status to "Supported"
> 
>  MAINTAINERS                            |   2 +-
>  drivers/platform/x86/amd/pmc/Makefile  |   2 +-
>  drivers/platform/x86/amd/pmc/mp1_stb.c | 332 ++++++++++++++++++++++
>  drivers/platform/x86/amd/pmc/pmc.c     | 377 +++++--------------------
>  drivers/platform/x86/amd/pmc/pmc.h     |  22 +-
>  5 files changed, 424 insertions(+), 311 deletions(-)
>  create mode 100644 drivers/platform/x86/amd/pmc/mp1_stb.c
> 
> 

