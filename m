Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD66569F10;
	Wed,  9 Sep 2026 16:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788970176; cv=none; b=KyEx6XjHzNzqy3mTY1DLyuBXrUZRu7yJKA1wCAL5VWvVaiwd15+8OPcSRVrbSzZY7CDuj6OrKcF2yNQ0Em86yoCcyIA3t0ANbWERHr1tNkOY2Oxvx/kWDRsOEge/wgbCtsYQB90B2UmTmFnp4c49D2g7DaBNMeT3OaY8QCyRuxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788970176; c=relaxed/simple;
	bh=gpwJmr1Z9wbFfmease5tSCUjsCGjlUWYcCBpIZOqQSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OgqfTaaXVSJf2WYRKvzwwTO18WFc0EOz0iw9arMtgKG5C5wM7gcWeoZluUqjd05bBiD9n2z/Nt6mciOJiXy8CiEGDe3OLlZ4ZbSJc5QMwzpUMPzIS5umPb9viMg5VgH9eTjxUNelbLUlNUlnIKKgPfsx+fXluIyJbSTcqNfft40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ThNtkhiW; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ThNtkhiW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788970175; x=1820506175;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gpwJmr1Z9wbFfmease5tSCUjsCGjlUWYcCBpIZOqQSM=;
  b=ThNtkhiWsZR/R2JA/EPik2SVrDmt+G3tb6vIKXkAHm8eYk4x87Q3CBuz
   q7bZ4sf4DMqLOFfYQS8HVlkgiH3EQyep2y/BZ5KyXbMMOJ8oxoOdlCo5v
   R5PFizX69rH1InFXOOpK5h6PHSrhg06C3/Q8DtpnqwsXYZ683Onir+hVQ
   EFuJ6qO9xfo8igg3huBmSY7hOj9raT6zDzHKl3Kx/QfNZxmrQfmAEyTT9
   vuDiR0P36chajzObSTEGQxXbVz4kgGuxHC0rBiRcukFeuejJlvdeXdgrY
   6+vwQrxTQ8CkdS++m97G6pT1YcPStofm2gt9XkaDctmkCks9fXXj1BvSj
   w==;
X-CSE-ConnectionGUID: 2UFgQ8fpQoWsIkgZbSwmVw==
X-CSE-MsgGUID: R9fiISb2RBGy/fMPseaRCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89330408"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89330408"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 09:09:35 -0700
X-CSE-ConnectionGUID: DDXEIkYQTISVk9zynfb0bA==
X-CSE-MsgGUID: gTxWnXohRXCvK9XR3GxAlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="301244590"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.249])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 09:09:31 -0700
Date: Wed, 9 Sep 2026 19:09:29 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: "D. Manresa" <dmanresa@gmail.com>, Thierry Chatard <tchatard@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH] mfd: intel-lpss: add Dell Latitude 7275 to the resource
 conflict quirk
Message-ID: <aqGEuTVpGolbznxN@ashevche-desk.local>
References: <20260831160754.9857-2-tchatard@gmail.com>
 <20260908161629.335223-1-dmanresa@gmail.com>
 <aqDkwTkAsvs8Escx@ashevche-desk.local>
 <20260909065104.15817-1-dmanresa@gmail.com>
 <20260909151027.GA2133376@google.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909151027.GA2133376@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 09, 2026 at 04:10:27PM +0100, Lee Jones wrote:
> On Wed, 09 Sep 2026, D. Manresa wrote:
> 
> > On Wed, 9 Sep 2026, Andy Shevchenko wrote:
> > > Do not fold, just add into the series this one as patch 2, for example.
> > 
> > Fine by me. Thierry, please carry it as patch 2 of v11 with Hans'
> > Reviewed-by; no need to change anything else.
> 
> Why can't I just apply it?

This patch on its own can't be applied as it relies on the one
in the other series. You can apply both patches, from that series
and this one. No objections from my side.

-- 
With Best Regards,
Andy Shevchenko


