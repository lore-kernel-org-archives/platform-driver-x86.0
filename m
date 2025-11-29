Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D81B238C3A;
	Sat, 29 Nov 2025 08:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764404664; cv=none; b=ml3iJUBAfaU23jZDJ1EPdNXi6mZbbVgkAaLUU6ZezWXKzjiET3+lfPtZV/v0+/cBZ13D8YHzAgeECcFpejcJA1Aa2kWfznjFUVsk7DwuuodjfadskN/Bprn/OrjimiUiJAkjIr6cTfAEC4q/JHFF1jidewoHxMLkcoileRsKf2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764404664; c=relaxed/simple;
	bh=pVkD0RWZaWGV9WSYwUQmVrXkKYjgLOtCudaCL47K0rQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XySJjChO1Jb/6S94DkknvsX1kCIlBa0JddYcvliAPCo2Iwjo1H7FhedEfPruBGSbIl6ahy3Ld9LjaDlvsZaX9nJ7bXVBv1IOdnm+avxkoh68yZ8QKo7ztwpxsGJ+DeMiZOnqUCNvDAFhIxxGFKGrNN1BSxW7DVnmGbjEAHwVNGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ft6dkV90; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ft6dkV90"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764404664; x=1795940664;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pVkD0RWZaWGV9WSYwUQmVrXkKYjgLOtCudaCL47K0rQ=;
  b=ft6dkV90Q2kuh0k5yKbib/LrmHEOsYEGjMO5ctO1hWlVuHxFBBTj1vet
   zXeYcEUrnufijhj76/YLQ3JC+T1rKUVonftcIQN6VJ+1Yz8d2a5X+N+Sb
   rTY+KVw3LMmlYua3CI2vzK3AVT9pJKOxisI8fa+jCCY5XeUyQBlOCNbhA
   3spxJ+0BptTdr0IUarINL1PFD77P/NEYbDPDcZBTUbijI/EqnXh6sdwcg
   +r9wIkqR0MuR+0lC3uIBhJahWYmDc4tJgTmDdfmigsR9+fAfWVvuw75Gc
   8yWUPURgCin8EobhY+oJk8/oH+LE05vpXwhqBOzFEB1/BdkQNnGd5ujD3
   w==;
X-CSE-ConnectionGUID: 4+LsPO96Qbq7Mhhg+cyBTg==
X-CSE-MsgGUID: qpPiCUEtSCC1Xzz/KyXb/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="66363800"
X-IronPort-AV: E=Sophos;i="6.20,236,1758610800"; 
   d="scan'208";a="66363800"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 00:24:23 -0800
X-CSE-ConnectionGUID: wHv67Zo8Tv2G4ubuAuE7Vg==
X-CSE-MsgGUID: NR9McZ7MSKa6I0ByOuEUYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,236,1758610800"; 
   d="scan'208";a="224318465"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.50])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 00:24:21 -0800
Date: Sat, 29 Nov 2025 10:24:18 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anton Khirnov <anton@khirnov.net>
Cc: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <benato.denis96@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jian-Hong Pan <jian-hong@endlessm.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: asus-wmi: use brightness_set_blocking()
 for kbd led
Message-ID: <aSqtsuyIDtGrXLrx@smile.fi.intel.com>
References: <20251129040247.13411-1-anton@khirnov.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251129040247.13411-1-anton@khirnov.net>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Nov 29, 2025 at 05:02:46AM +0100, Anton Khirnov wrote:
> kbd_led_set() can sleep, and so may not be used as the brightness_set()
> callback.

> Fixes "BUG: scheduling while atomic" when using this led with a trigger.

It might be a bit confusing with (misspelled) Fixes tag, also it would be
better to provide a few (usually ~3-5) lines of the actual traceback.

...

> -static void kbd_led_set(struct led_classdev *led_cdev,
> -			enum led_brightness value)
> +static int kbd_led_set(struct led_classdev *led_cdev,
> +		       enum led_brightness value)

Now it's exactly 80 characters if located on a single line.

-- 
With Best Regards,
Andy Shevchenko


