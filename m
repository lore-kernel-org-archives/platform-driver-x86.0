Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5AE1FF5FB
	for <platform-driver-x86@vger.kernel.org>; Mon,  7 Apr 2025 14:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744035913; cv=none; b=o/GYT8oM4sMg4UZ97nnvfgqv/UqPSSdso8Jv/kj5XccCBngAMiOqc915xDkv5+oyOXQreheD384OpP5tG6T6GoertHioJfNzvirbiawnb3a+yS5cq+FHZIF84WlurcOTorW/jHSaiooNdDZ+8DEBqmEwGTPkpTg8YC3GRg8BhGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744035913; c=relaxed/simple;
	bh=hdqi2dfXH73MRPUuywUmchGns0gALCfAquzFJIgXhz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uUTq9LooyR1S/JceAl5ziW6Oa5vxZZXVhdRSYq+Io4mQgsPLacYuIjThZM6goYY2icxCikjNF7gqDxx9GxDJWugas+ONox/BIWNtQ0OARzXmHIc0h3x2K1Dc2B+a1pQHDcKthcIEQROPGEJHYkbI04OFN7sxfgzaYGpUhvZBJz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: 2ljTVzqFSsySgcTBdY5fuA==
X-CSE-MsgGUID: BnsRqgIWQDCMBYumOgnBPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49080332"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="49080332"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 07:25:10 -0700
X-CSE-ConnectionGUID: YbcOzC1pR7a85qCdbpLvzg==
X-CSE-MsgGUID: rXHd4S5BQWm8LhyQVwyv1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="133178613"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 07:25:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1u1nPO-0000000A5sy-2Qkc;
	Mon, 07 Apr 2025 17:25:06 +0300
Date: Mon, 7 Apr 2025 17:25:06 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/2] platform/x86: x86-android-tablets: Add "9v" to Vexia
 EDU ATLA 10 tablet symbols
Message-ID: <Z_PgQvvcZjZ-4fTS@smile.fi.intel.com>
References: <20250407092017.273124-1-hdegoede@redhat.com>
 <Z_OoouVSgw1xOpur@smile.fi.intel.com>
 <ba58d467-1525-496b-b8ba-b14aa04307a1@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba58d467-1525-496b-b8ba-b14aa04307a1@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 07, 2025 at 03:49:26PM +0200, Hans de Goede wrote:
> On 7-Apr-25 12:27, Andy Shevchenko wrote:
> > On Mon, Apr 07, 2025 at 11:20:15AM +0200, Hans de Goede wrote:
> >> The Vexia EDU ATLA 10 tablet comes in 2 different versions with
> >> significantly different mainboards. The only outward difference is that
> >> the charging barrel on one is marked 5V and the other is marked 9V.
> >>
> >> Both need to be handled by the x86-android-tablets code. Add 9v to
> >> the symbols for the existing support for the 9V Vexia EDU ATLA 10 tablet
> >> symbols to prepare for adding support for the 5V version.
> >>
> >> All this patch does is s/vexia_edu_atla10_info/vexia_edu_atla10_9v_info/
> > 
> > And period :-)
> > 
> > All this patch does is s/vexia_edu_atla10_info/vexia_edu_atla10_9v_info/.
> 
> It feels a bit silly to send a v2 just to add a period to the commit msg.

I agree, it can be tweaked whilst applying, but I'm not the one in charge here
:-)

> Ilpo do you want me to send a v2 of this series?

-- 
With Best Regards,
Andy Shevchenko


