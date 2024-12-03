Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C619C1FA178
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Dec 2024 19:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733253849; cv=none; b=ReAbHpFkkjpGuI6Fk2ixqGQAXY+T7QmVN+zAAsHjA4tU4T4NbVE6ung063+PSK62q/Q3RjKOL93s/r4Udrad8FRkda29eV0e3BfVWyvEtesnvJcfNJ+9A4dK0C/nm0DPLZ0apKufZAVkEd4KeKE+meUTF4DTNeRMJa+D1w04ti4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733253849; c=relaxed/simple;
	bh=uI/rqNyIWw60Vmoe6X7vlwQp/MpuwQ21/W6iUf+oxPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bvIzGDfKqaycDKoPDJxqYqLRHE7AF/Kvvt3TUESkGI0plfQAN3YAJcTBiytLWwEEWPFrHd0GT5pYys/3eogEH/1Vj5b5K/FZX19rDehN6gj+WMW+7H9YGqClVzwa2V4EvrEkO3R01NGO0SfTRW9bvoj49bLQx4zK0x8s/I9EpGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
X-CSE-ConnectionGUID: wciF1M00Ro6ifc90jIGevg==
X-CSE-MsgGUID: TpuhTv/cSZum1jdxeWfDWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="33366029"
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; 
   d="scan'208";a="33366029"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 11:24:07 -0800
X-CSE-ConnectionGUID: BjN7eChnRImL52qMXZurcw==
X-CSE-MsgGUID: j04yun15RuWz2M/B7a4/TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; 
   d="scan'208";a="116783841"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 11:24:07 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1tIYV9-00000003WtW-3wtp;
	Tue, 03 Dec 2024 21:24:03 +0200
Date: Tue, 3 Dec 2024 21:24:03 +0200
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 2/2] platform/x86: x86-android-tablets: Add Vexia EDU
 ATLA 10 EC battery driver
Message-ID: <Z09a08_jOUj_4WBz@smile.fi.intel.com>
References: <20241116121659.57487-1-hdegoede@redhat.com>
 <20241116121659.57487-2-hdegoede@redhat.com>
 <b5b40432-77ed-2466-7d30-ce35a239d0ae@linux.intel.com>
 <Z04ASf0znID9C1FN@smile.fi.intel.com>
 <040238ad-6f88-4c4a-814e-2b94b7a43116@redhat.com>
 <CAHp75VdJ_MfRXXX18c+rB943Saare6n_GEEwko+Hf31UW39XpA@mail.gmail.com>
 <c19e9043-0750-4eb0-b794-521d946317d6@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c19e9043-0750-4eb0-b794-521d946317d6@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Dec 03, 2024 at 05:09:57PM +0100, Hans de Goede wrote:
> On 3-Dec-24 1:58 PM, Andy Shevchenko wrote:
> > On Mon, Dec 2, 2024 at 11:48 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >> On 2-Dec-24 7:45 PM, Andy Shevchenko wrote:
> >>> On Mon, Dec 02, 2024 at 08:34:01PM +0200, Ilpo Järvinen wrote:
> >>>> On Sat, 16 Nov 2024, Hans de Goede wrote:

...

> >>>>> +struct atla10_ec_battery_state {
> >>>>> +   u8 status;                      /* Using ACPI Battery spec status bits */
> >>>>> +   u8 capacity;                    /* Percent */
> > 
> > Then an obvious remark based on Hans' reply, why are these internal
> > kernel types and not external ones, i.e. __u8?
> 
> Because this is not a uapi header? 

Hmm... Yes and no. The protocols (on a wire) are kinda external to the kernel
even if they are part of the kernel project as we usually define endianess
there and other things (like packing the data). The same applicable to the SW
protocols to commumicate with FW. But I haven't seen a clear documentation
on these cases and I see examples of all possible combinations of the types.

-- 
With Best Regards,
Andy Shevchenko


