Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF504A21;
	Fri, 13 Feb 2026 09:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770974206; cv=none; b=ExbWniJxDq74Kphvb8MJyqQTTLujSBkZp/wVasAgArhu9LCEksL0HdzO4FJmxG5uEf6X2eP3n3xAkS8vmAwpJZ2wQ581S3b6uuPDHkO/o6zxy9ojhpDWZEktsUi0TvtmxIrq49GA9UnKHk0QUwq3FAytIwSGSptRbS1MP7fqSew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770974206; c=relaxed/simple;
	bh=aOpsKlpfc5Zlu1R5ozLN/rwNj8CPUIcboPSZkhGavZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F0orYT3xO01aBYPSqwzD1YhZdV3aqZsY3QDw6Vry5qe22udNWsE+SQ/yYwQXvU/SzHeQ+d1XvBaOHgxICZhIUeVmDMF2J+66Stk1BMJMYYxWJCem1j5HN641h3XWRJaaNHYR+x+KK77dSKswERcdSfZ7Bj58EGgAnQwiTl8FWFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RV8XGcDa; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RV8XGcDa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770974205; x=1802510205;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aOpsKlpfc5Zlu1R5ozLN/rwNj8CPUIcboPSZkhGavZU=;
  b=RV8XGcDasNXY2SIWzxN8YoUJDNOctU5rKBf+XJHlsPE7tv9WT86PbxrP
   NHaqpDgqGyfMQ8ZdMwMysFDMXFC7aoNZEfyEuv0uaSqQujwcHGB7qTWqf
   PKqQkllRGCL8owwY6W3aB+UPp0UfnuqoGxopUm0UeVhgcP/uA/vr33cXE
   /KzIaX1rWCO6pJnccz60J0i1uimT3lPQ7gIEpw6uxP9gv5VVfOwYtuila
   zhid7Mn1wMVO6kvADu+EzS5pEwK304p1StPunym9MYQOLelbECpVJ+Rxl
   KU4FcNWx8Nrb8h+OpaZGAXhyLguPkLnLlLsQbLZYhlSTRJ0bD0Zfe+ozZ
   g==;
X-CSE-ConnectionGUID: bNvW0JE+RlSvDPKCxhO5Yg==
X-CSE-MsgGUID: yunN0aSFTc+Bb7hCFoQMxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="97615254"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="97615254"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 01:16:44 -0800
X-CSE-ConnectionGUID: UocEMbZDQFOmPyDj++sYGQ==
X-CSE-MsgGUID: b1L5MCxUQR+TidZAcLsH2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="212118814"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.242])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 01:16:42 -0800
Date: Fri, 13 Feb 2026 11:16:38 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Peter Tyser <ptyser@xes-inc.com>, Lee Jones <lee@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	brgl@kernel.org
Subject: Re: [PATCH 1/2] mfd: lpc_ich: expose the GPIO controller cell's
 software node
Message-ID: <aY7r9qr-ngFSw7MC@smile.fi.intel.com>
References: <20260213-meraki-swnodes-v1-0-8e032693456c@oss.qualcomm.com>
 <20260213-meraki-swnodes-v1-1-8e032693456c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213-meraki-swnodes-v1-1-8e032693456c@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Feb 13, 2026 at 09:25:24AM +0100, Bartosz Golaszewski wrote:
> One of the users of this driver - meraki-mx100 - abuses the software
> node API by setting up a dummy software node without any logical link to
> this GPIO controller and uses the fact that the GPIO core matches the
> controller's label against the swnode's name to make the lookup work.
> 
> We want to remove this behavior from GPIOLIB in favor of actual matching
> of firmware nodes but that would break this user. To facilitate that:
> create a software node for the GPIO controller cell and expose its
> address in the provided MFD header.

...

> +const struct software_node lpc_ich_gpio_swnode = {
> +	.name = "gpio_ich",
> +};
> +EXPORT_SYMBOL(lpc_ich_gpio_swnode);

Can we export in a dedicated namespace? Perhaps "LPC_ICH"?

-- 
With Best Regards,
Andy Shevchenko


