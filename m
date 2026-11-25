Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795602080;
	b=BRmVV0i5R7psn0R30V6y/OB+Sd7zwaH3yon14VTQqH7xsQv1Q1KyyvYMcQRev6bdNtUt
	 wkodfuLhwiHm28qYrOA8eoUeL/zsMFjVAfAUk8wwoQhK+S/3CLfcPNTwB409vdUANe/1W
	 +JebmsrXFz3uyCxFZ5FgSHmv4erIq2ZJncX28iy05abb90YKTgDyuLrTA5mvQv5pnQiR6
	 09AaTgwn+rkBbPDH56ppEBBx9oOH8eF/0rwuxQrIrjwwqFnHI+ijXyDk+/8jKtBDpbGRd
	 1MUnG0XvheekoQCkht2xrRRG/JqH5rVpfHzRKp+pzq6D+QuMgTgmMjb3hzAhDQa3SpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602080;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=JX8ruG2BUJdHdiCjZgfLy1u6oBW4NGOKTUFqTOXE38E=;
	b=crvdkicOJ317rC0fYBd3cvdzoUEV+VgSYtJq+Y5cwHPNvmR7EZuNrGZdhENzcQkZ3/Cd
	 w6PkBOM+71+f+TXkYKtTkF2FfH/VadyIAiBHRbmdhvS8eTLoZqb6pIyXTruGCaHSVyrfh
	 XsBqytJF2lt2uc0GORFEcXzExeCtBcgZliXn/iMthsSUOdkPg5neiNzngfk3usbi6k3xs
	 Kzrp4hfM2TWRG4Oeoci888VPSEZq3sktVJmlJWzamJB1veRzGZRI8Px3yGClLa+Dn15qz
	 KclDaOZPJuet8oVxwnTUFwcyTbUnRnkHGvk7nnEAfAtr7+Yh1CqgX73+8GBahUyZ5Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a2C4smF+;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55069606A31E;
	Wed, 25 Nov 2026 10:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55069606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a2C4smF+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795602080; x=1827138080;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x/ZcXBq7H7CT6eN8vSZOPj5enGMK9ZOiY3eYBhI3NK4=;
  b=a2C4smF+qnn5iGoOOIWyzJvGkMAsUx30mS4+EwuPHWAN3j8Wo+OpOMMz
   mggN+zZhIs9UyVdITmST3w3yKAuvY0DCKajYwg31YdKzjACsnRbp9S5bi
   qYMxA/xZGqzVQEZifUxrabsAz6f3FB+rGWfaDktOJ1gCT6Av5o85ZoE5i
   eiiiti3ur00QN2Qmhskl9BgZMa4QZ/upKEnYNkmjC2/m7TvFk67AiqJO8
   LTdbDeGkWCijlIsd3NGOYNJ4UCRelWJpn+XzaSg63I2SOqJvh/qYBmNby
   CJp79cdW/RFy9ln9lHZSor1lyWwTPgOdkwi+w+DR0PagGi+2KHIozZSPg
   A==;
X-CSE-ConnectionGUID: LQsW1L7tR42gM/54ZumOEw==
X-CSE-MsgGUID: btgEmjBAQXumpaQedl901Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4351423"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4351423"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 02:21:19 -0800
X-CSE-ConnectionGUID: MMiymBs5RlGN23KBM7cqSw==
X-CSE-MsgGUID: YFk1MnP+Ri2wM3twg4gaEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="11812335"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.73])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 02:21:16 -0800
Date: Wed, 25 Nov 2026 12:21:14 +0200
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
Message-ID: <awa2msC9gJdMsyu3@ashevche-desk.local>
References: <20261121090614.677144-1-pmenzel@molgen.mpg.de>
 <awP4y1W38Nd-atua@ashevche-desk.local>
 <1834d646-431b-4422-9909-d24ac8ce57a3@molgen.mpg.de>
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
In-Reply-To: <1834d646-431b-4422-9909-d24ac8ce57a3@molgen.mpg.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 25, 2026 at 12:19:45AM +0100, Paul Menzel wrote:
> Am 23.11.26 um 09:26 schrieb Andy Shevchenko:
> > On Sat, Nov 21, 2026 at 10:06:11AM +0100, Paul Menzel wrote:
> > > On an Intel Tiger Lake laptop Dell XPS 13 9310, the first read of

...

> > > +/*
> > > + * Every ltr_show map ends with CURRENT_PLATFORM and AGGREGATED_SYSTEM. Unlike
> > > + * the per-IP rows, these PMC registers do not hold an LTR message payload as
> > > + * defined by PCIe; on Tiger Lake, for example, AGGREGATED_SYSTEM has the
> > > + * reserved bits 14:13 set and reads 0x7fffdff. Do not decode them.
> > > + */
> > > +static bool pmc_core_ltr_is_summary(const struct pmc_bit_map *map,
> > > +				    unsigned int index)
> > > +{
> > > +	return !map[index + 1].name || !map[index + 2].name;
> > 
> > How do we know that the index is not out-of-boundary?

(My point was that you are iterating up to the record which has
map[index].name == NULL, but when iterating the previous one,
map[index + 2] is out of boundary.)

> The maps end with a { } sentinel, and the caller runs only for an index with
> map[index].name set, so map[index + 1] is the sentinel at the latest.
> map[index + 2] is only read if map[index + 1].name is set, so it is the
> sentinel at the latest, too. But indeed, it is not obvious when reading the
> code, so v2 counts the rows of the map once before the loop and checks
> `index + 2 >= num_rows` instead; the helper is gone.

So it heavily relies on a side-effect of || operation. This is fragile
approach.

> > > +}

-- 
With Best Regards,
Andy Shevchenko


