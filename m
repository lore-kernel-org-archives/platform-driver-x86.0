Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07E71A3029;
	Mon,  2 Sep 2024 16:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725293444; cv=none; b=Om4E/1xGj5UlVk4FGNn+tlzu278gDOHCdpS27NxxIH6U/cISBT/+sUNDO5UYxTwZEBdqRtu8QzcgOmLzt4WCiTzjyn+bCcqP+mFeJ+nAHdy0DciA/ElqFEqTYCyntIqq9Iacg+R0AR0Tx2XF6sDSsis3rKg+QafM3SehfZqyiac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725293444; c=relaxed/simple;
	bh=mA/5m1vT4go9SHXgOa8ntC2WafuD4Q9BAslIHx8wLbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LQzL0dGgAWOHzi4kxyuDVLac++uYxDPDZKEw9wTtEuWfCvlN4O4goH/1Uhz0IrzhmpHxnW6Kq2s9zL683cg1BUw+awmxhAB4LCoZvXK+alnsWKMXEu017xZ3qh7pnKXxi5nNnVpKo4CkMaGtftEL+oKCwVnY2guJ8aMPRf5Z6LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NmcmQjsN; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NmcmQjsN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725293443; x=1756829443;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=mA/5m1vT4go9SHXgOa8ntC2WafuD4Q9BAslIHx8wLbo=;
  b=NmcmQjsNDwFmqlhOWmktRqClsp46kK/SH0bNytLanYDmfkvpBFKloHjn
   L5w3LZLFXlP/UmSTu/WP/kOGPQk2IAUzHJS9wyc4yvV3BsAi99Oebsv3N
   uW1Q+IWfsNd8auwAgdeatBljjAkATFCtOyLsEwd0ushJ0xuR6kgRvNDU8
   GVgnNJpnpse8CZjRxDDbm6VWT1ybi/rTxr3Fz7lywoapCdSUKamZ9BmTN
   VPu5+819BHkN5GD1Txw/ksPQ/hl75jhvR4l4syMH+t2Dzq64K8Qjcv7ry
   PIEXArnyI5jat1eEEVY4JBvWuub0yW/iYvH/k8wkvP5c2EFNCKKDWjJbT
   A==;
X-CSE-ConnectionGUID: LIi1WJgDQPC6JIuJZxXtmA==
X-CSE-MsgGUID: VZDtbNoPRlWOSUo5CbJiyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="23745507"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="23745507"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 09:10:42 -0700
X-CSE-ConnectionGUID: cRBbmkcERmWy1Sm8SOABkA==
X-CSE-MsgGUID: e+YrE425SoWK1qyhwTIliA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="69286841"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 09:10:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sl9dV-00000004QP0-0nAq;
	Mon, 02 Sep 2024 19:10:37 +0300
Date: Mon, 2 Sep 2024 19:10:36 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Johan Hovold <johan@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Scally <djrscally@gmail.com>
Subject: Re: [PATCH v2 1/4] driver core: Ignore 0 in dev_err_probe()
Message-ID: <ZtXjfB115MN22aQi@smile.fi.intel.com>
References: <20240822130722.1261891-1-andriy.shevchenko@linux.intel.com>
 <20240822130722.1261891-2-andriy.shevchenko@linux.intel.com>
 <ce59c3c6-8729-469f-a0df-b6844792e324@stanley.mountain>
 <ZtXgmi0TDfDMwnlz@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZtXgmi0TDfDMwnlz@hovoldconsulting.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Sep 02, 2024 at 05:58:18PM +0200, Johan Hovold wrote:
> On Sat, Aug 31, 2024 at 11:25:54AM +0300, Dan Carpenter wrote:
> > On Thu, Aug 22, 2024 at 04:05:38PM +0300, Andy Shevchenko wrote:
> > > In the similar way, ignore 0 error code (AKA "success") in
> > > dev_err_probe(). This helps to simplify a code such as
> > > 
> > >   if (ret < 0)
> > >     return dev_err_probe(int3472->dev, ret, err_msg);
> > > 
> > >   return ret;
> > > 
> > > to
> > > 
> > >   return dev_err_probe(int3472->dev, ret, err_msg);
> > > 
> > > Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > 
> > This is a terrible idea because currently Smatch is able to detect about one
> > bug per month where someone unintentionally passes the wrong error variable
> > to dev_err_probe().
> > 
> > I really hate this.
> > 
> > NAKed-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> Regardless of any issues this may cause for tooling, I fully agree that
> this is a terrible idea that will only result in unreadable code.
> 
> 	return dev_err_probe(dev, ret, "registration failed\n");
> 
> Except it did not fail...
> 
> NAK

Fair enough. Thank you, guys, for reviewing.

-- 
With Best Regards,
Andy Shevchenko


