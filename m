Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613C23BBA0B;
	Mon, 24 Aug 2026 10:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787566681; cv=none; b=YkUjjBstYB+KMNs5pLYVen3OkVDSj7XZlsyuoW2aL89EPz4sST8cDGs1KJoIyIY1AQT/mraIqeMrOuULOQHQwfOqJY9CXLctHs/EG3GA30e4TciF8f6699xuH1U9H5BpvaGVpoXJ2jglxuGEXPiPTdskpbz5xdUgQf02NlgOwc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787566681; c=relaxed/simple;
	bh=L89DQYNHhPi0ryMmECklnMP0ugnNj5NOww5ZoPJqnuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lA1l200kkgxR9mLOiD8TPOWh++32WRe7Rg6P2b2+GIcCMd6UD4gqtfqG5/7NOrs7K/UmcZ65b8diQqKPenuLQ7QqmuDERVhQHJkzXXWgWfbVFVCjYvCqq1EN1nLguOBXYvWgZobHWyOuy1Ap1cnzscLuML6NOhj9NkK3E4s2boI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q8nvrR9r; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q8nvrR9r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787566680; x=1819102680;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=L89DQYNHhPi0ryMmECklnMP0ugnNj5NOww5ZoPJqnuk=;
  b=Q8nvrR9rbXmDVtZbXwRrWxDjmAM063ElTf9DjjQ8B7gtZcc+BfNAemnR
   RhbT4SllTq98+RHGbw+wYm3ItEXRqgaJtyAov2SAM/QepeurZWd3BDb+K
   M1A6R58QuQWJdOGQQtP3OtT+CWOX8qtMJIT3cCxo3bR+nsruuhluFAJtM
   6H0lZGmXMRbm/0fJN85S7/MfNOLz3MODQeDbXyxGy1ljNxGjdBGZiz3Cm
   kT1c/TkVZiEViF1I/BTh2v7/aocRENd3m20mUgShpErJK3RkYpHOJo+lb
   6EuPV/r8JxRyCwsD2Kq+Rf/QjIUW/8cd/cIPZ6cLuRSCihb+0aG8NfZgX
   w==;
X-CSE-ConnectionGUID: d171asFhR02wz2ws4LOhlA==
X-CSE-MsgGUID: NY0R8swkSnO9K/MJZdsAOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="98606665"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="98606665"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 03:17:59 -0700
X-CSE-ConnectionGUID: BDlN6/PiQSyyOepC1J9AzA==
X-CSE-MsgGUID: 3ARUTNPAQAWFB35SjEtoTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="271174683"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.180])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 03:17:57 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6BD4011F82E;
	Mon, 24 Aug 2026 13:18:07 +0300 (EEST)
Date: Mon, 24 Aug 2026 13:18:07 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 2/2] platform/x86: int3472: Fix uninitialised variable
 warning
Message-ID: <aowaX-bWo24pvj7t@kekkonen.localdomain>
References: <20260820205148.2910639-1-sakari.ailus@linux.intel.com>
 <20260820205148.2910639-3-sakari.ailus@linux.intel.com>
 <ca97b754-795e-e579-8705-9f2e3d66287b@linux.intel.com>
 <aoifU8ddCczzKHz4@kekkonen.localdomain>
 <c3a8ff50-2288-1117-d2af-c2485bffbb9c@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c3a8ff50-2288-1117-d2af-c2485bffbb9c@linux.intel.com>

On Mon, Aug 24, 2026 at 10:43:12AM +0300, Ilpo Järvinen wrote:
> On Fri, 21 Aug 2026, Sakari Ailus wrote:
> 
> > Moi,
> > 
> > Thanks for the review.
> > 
> > On Fri, Aug 21, 2026 at 11:34:06AM +0300, Ilpo Järvinen wrote:
> > > On Thu, 20 Aug 2026, Sakari Ailus wrote:
> > > 
> > > > Fix a smatch warning about uninitialised err_msg variable, by printing the
> > > > error where it is handled.
> > > > 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >  drivers/platform/x86/intel/int3472/discrete.c | 21 +++++++++----------
> > > >  1 file changed, 10 insertions(+), 11 deletions(-)
> > > > 
> > > > diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> > > > index 6c729fcfce5d..cf8a58ef963b 100644
> > > > --- a/drivers/platform/x86/intel/int3472/discrete.c
> > > > +++ b/drivers/platform/x86/intel/int3472/discrete.c
> > > > @@ -329,7 +329,6 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
> > > >  	unsigned long gpio_flags;
> > > >  	union acpi_object *obj;
> > > >  	struct gpio_desc *gpio;
> > > > -	const char *err_msg;
> > > >  	const char *con_id;
> > > >  	int ret;
> > > >  
> > > > @@ -375,7 +374,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
> > > >  	case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
> > > >  		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, con_id, gpio_flags);
> > > >  		if (ret)
> > > > -			err_msg = "Failed to map GPIO pin to sensor\n";
> > > > +			dev_err(int3472->dev, "Failed to map GPIO pin to sensor\n");
> > > >  
> > > >  		break;
> > > >  	case INT3472_GPIO_TYPE_CLK_ENABLE:
> > > > @@ -387,7 +386,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
> > > >  		gpio = skl_int3472_gpiod_get_from_temp_lookup(int3472, agpio, con_id, gpio_flags);
> > > >  		if (IS_ERR(gpio)) {
> > > >  			ret = PTR_ERR(gpio);
> > > > -			err_msg = "Failed to get GPIO\n";
> > > > +			dev_err(int3472->dev, "Failed to get GPIO\n");
> > > >  			break;
> > > >  		}
> > > >  
> > > 
> > > ssahiko is not happy about dev_err_probe() -> dev_err() conversion.
> > 
> > I was wondering, too, whether I should keep it, but then again returning
> > the error won't help here (as of now at least) and it is probably not
> > possible -EPROBE_DEFER would be returned in these cases. I can keep using
> > dev_err_probe() though if you prefer that.
> 
> If sashiko is wrong and skl_int3472_gpiod_get_from_temp_lookup() cannot 
> ever return -EPROBE_DEFER, then it doesn't matter. (But it seems 
> reasonably good at tracking the callchains so you might want to check the 
> detailed log if it actually found how it can return that). If it does 
> return -EPROBE_DEFER, dev_err_probe() should be kept.

I presume -EPROBE_DEFER comes from the gpiolib but it shouldn't happen
here.

I think I'll still switch back to dev_err_probe() just in case, as the
intention here is to avoid a build warning while cleaning up things a
little.

-- 
Sakari Ailus
