Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795422431;
	b=h2weotyJZqijo+2YtRrBVkHfsklVlBEfYYgTdd4bY9bZMK6g32KmyFoqfEgv485gXHxX
	 2PVGcyRpXokLYfDOlxO6YlNmIRIhC3IS+/SmM1KseVddOJ2rAqtmXF7XpuaMdLkLsBjV0
	 tV9IP7QQTgeZ1YQOVe6kQ0lsHuZlunzrik5wCE9onykrl6ut0SJ/1BRvAX2euHKgVVFTQ
	 FHqIic3Y3P9XeqUQ2+fNNIVW9jRTwSkGruY4wIPo15vwk+zvynYwv76RAzmTXEFuKEkt8
	 UsDIlTC8GmKONtw9o+W5jQdFkK+gDWqFYAwxuLxH0oBYPddHy9nuvGVCAI6s2ANGW1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795422431;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=iaKJpebPoWiTy3xYOH8r5uGcGdu++drvzYa6KsXjvYI=;
	b=p0Bll4wqPoNdpIFupUkP0kU73gdc8jST5yK1UzZrbgNuNN3YJIHb3ScN+jRHjv9Bt9uK
	 BxTio5HuhE+QLKF9yw8MQVUtupAZN6naQ8iNpUW8CFv9fgVEO1yF6k/I0+n8F/yCET+Ez
	 5AoVJRgsIGp4uc2w2vL1gxF78jaZANj+rLJX0tFHh7Lr0qZglC76x+94PiWmTkg5rERoX
	 U/XBtFaFZKLYoHr7tShNhkGAc3HsICaFSPfEFHE7y5MYFuiBRfAJVRzg4Olow0JL4n7Yu
	 X+9BmZprKdZyi71QWIXdEYSDITDAU+fYxJAsmsGmATGgF1qhMGubhpofF2oagIQL0hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j3HPGSp4;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9226F606A31A;
	Mon, 23 Nov 2026 08:27:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9226F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j3HPGSp4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795422430; x=1826958430;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WiUTeEmdKlq/QgGj49FvwDtTeW5BpnQOdZls9z+zFNk=;
  b=j3HPGSp463MCW9Ai3awYHP/6BoRO38jOB3F6c0iUVRGeO8J9gw58pjOK
   hSGbb81u2FW+03rIk5PTUt8T48bsaSFqdwUvvdb6yufiGZyWL9zvLmGZ8
   uEsaiLxjKKklzmJs+13NCy9h4AG6klGHrVSVD0Ak4hIICyz5qSCUEDLWa
   Ya8ep2YPchHQN4jXAI9zHuHFYdUtp5Q+tK345Evws+BdvCyzHZ4i8GiDN
   8kqxAQg9JhIwhsBzAn4LXDNhYahDJZRjAnEqrfv+HcHDntuYJIq/xoW6x
   fZLXKNuUEa07LaMLTkJJxOiTmnwxKRI4F5y2q0Nh3ooNT45ZsS953DyK5
   g==;
X-CSE-ConnectionGUID: /HdvkTkRRaK3DM3EHTkylg==
X-CSE-MsgGUID: D0rb60WBTVaaWl59EFh/gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4108152"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4108152"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 00:26:56 -0800
X-CSE-ConnectionGUID: MB7dB4WDQ7yF7vVZ4K+IhQ==
X-CSE-MsgGUID: pHpiAhb6REuVofPLzY441Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11448062"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.204])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 00:26:54 -0800
Date: Mon, 23 Nov 2026 10:26:51 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	Xi Pardee <xi.pardee@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] platform/x86/intel/pmc: Do not decode the summary
 rows in ltr_show
Message-ID: <awP4y1W38Nd-atua@ashevche-desk.local>
References: <20261121090614.677144-1-pmenzel@molgen.mpg.de>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261121090614.677144-1-pmenzel@molgen.mpg.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Nov 21, 2026 at 10:06:11AM +0100, Paul Menzel wrote:
> On an Intel Tiger Lake laptop Dell XPS 13 9310, the first read of
> `/sys/kernel/debug/pmc_core/ltr_show` after loading the driver logs:
> 
>     intel_pmc_core: Invalid LTR scale factor 7 (only 0-5 are valid per PCIe spec)
> 
> The value comes from the last row, AGGREGATED_SYSTEM (CNP_PMC_LTR_CUR_ASLT,
> 0x1b54). In 120 reads over 30 seconds, it read 0x7fffdff, 0x7fffc1f or
> 0x7fffc23 (117 times), and 0x40201ff or 0x402001f (3 times); another read
> gave 0x7ffffff. Decoded as an LTR message, the snoop half of the first
> group has the reserved bits 14:13 set and scale 7, and the second group is
> CURRENT_PLATFORM (0x40201) shifted left by eight with the low byte filled.
> So these two PMC registers do not seem to hold the PCIe LTR payload the
> per-IP rows carry, and decoding them only produces the warning (the decoded
> value is 0 anyway).
> 
> All ltr_show maps end with CURRENT_PLATFORM and AGGREGATED_SYSTEM, which
> pmc_core_send_ltr_ignore() already relies on. Print only the raw value of
> these two rows, as for rows without a requirement bit set, and keep the
> warning for the per-IP rows.

> With the change, 200 reads with AGGREGATED_SYSTEM bit 15 set in 199 of them
> log nothing, and the CNV row is still decoded (0x89fe89fe, 522240 ns).

This paragraph better to be in the comment block, after '---' line below.
We will have this information being archived by lore.kernel.org.

> Fixes: 8122e7cd806d ("platform/x86: intel_pmc_core: Decode Snoop / Non Snoop LTR")
> Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
> ---
> 
> Notes:
>     Claude Code (claude-opus-5-5) helped analyse the register values, write
>     the patch, and test it on the Dell XPS 13 9310.

>  drivers/platform/x86/intel/pmc/core.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)

...

> +/*
> + * Every ltr_show map ends with CURRENT_PLATFORM and AGGREGATED_SYSTEM. Unlike
> + * the per-IP rows, these PMC registers do not hold an LTR message payload as
> + * defined by PCIe; on Tiger Lake, for example, AGGREGATED_SYSTEM has the
> + * reserved bits 14:13 set and reads 0x7fffdff. Do not decode them.
> + */
> +static bool pmc_core_ltr_is_summary(const struct pmc_bit_map *map,
> +				    unsigned int index)
> +{
> +	return !map[index + 1].name || !map[index + 2].name;

How do we know that the index is not out-of-boundary?

> +}

...

>  		for (index = 0; map[index].name; index++) {
>  			bool ltr_ign_data;
> +			bool summary = pmc_core_ltr_is_summary(map, index);

Same question and keep this to be in reversed xmas tree order.

-- 
With Best Regards,
Andy Shevchenko


