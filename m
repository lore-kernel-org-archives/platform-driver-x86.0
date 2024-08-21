Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B2D26ACB;
	Wed, 21 Aug 2024 23:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724283157; cv=none; b=JKrbUSiG4GIUCwXjP0BV3G0waELZLfyxn23hw4F80DXYsN6sxJoKWiI7s9FTuVAB0U+sW3rOXPoeYT/m1lV+rCVRWme61XkuRjTOH0AGmb/UyxGrlU5Yghnkyr94nT7DTq2LhsFTOW6rmcin0/uYL0ZDYzHte2kv6SM1Ia6dfV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724283157; c=relaxed/simple;
	bh=9/kcCF94IymkHF4aMeWQBbvOSWBfpRt6oYxd9GzLtWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eZ298poCWsQcAhj1mYQqIeDVuMkYN97T5urI1HjsJPh77yHTkBfluTX0ArtFZbGN1NrRnvTQj5ER0Luy4LekGomiIksoopWM2PrvcvdnAH624ZLeyrjxYrR5mq5tKvzWMwIlD3tXt6w/VxrfbX4oswqlMbTc3IQty/Rm0haAODc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZQXLyIBx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZQXLyIBx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13607C32781;
	Wed, 21 Aug 2024 23:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1724283156;
	bh=9/kcCF94IymkHF4aMeWQBbvOSWBfpRt6oYxd9GzLtWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZQXLyIBxM8/2JsjLAr2QNmYAp1J5BfP2XxdxMWN/IUIzXah27bJHIzGMRWAcPtdxp
	 jpgpsWlkQMu1D34jW/zMaD6s2Y5eqP/phYF/h5Abg1O5ec2rvX3qi8NnnTk5oOPdUK
	 co6vqyHnNQ1G1tQUtqZNnPknjfz2lC93PDL0OyFA=
Date: Thu, 22 Aug 2024 07:32:33 +0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>,
	platform-driver-x86@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Scally <djrscally@gmail.com>
Subject: Re: [PATCH v1 1/4] driver core: Ignore 0 in dev_err_probe()
Message-ID: <2024082213-yogurt-kerosene-92e6@gregkh>
References: <20240821122233.3761645-1-andriy.shevchenko@linux.intel.com>
 <20240821122233.3761645-2-andriy.shevchenko@linux.intel.com>
 <1dde296b-045e-d56a-1734-a1333a84060b@linux.intel.com>
 <ZsXntvP6eBB_092w@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZsXntvP6eBB_092w@smile.fi.intel.com>

On Wed, Aug 21, 2024 at 04:12:22PM +0300, Andy Shevchenko wrote:
> On Wed, Aug 21, 2024 at 03:38:15PM +0300, Ilpo Järvinen wrote:
> > On Wed, 21 Aug 2024, Andy Shevchenko wrote:
> > 
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
> 
> ...
> 
> > This seems generally useful,
> > 
> > Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> 
> Thanks!
> 
> > A nit, the code sequence that dev_err_probe() is documented to replace is 
> > no longer matches with the behavior (the else would need if (err < 0) 
> > added).
> 
> Okay, let's wait what Greg says about it, if he is okay with the proposal,
> I'll amend documentation as well in v2.

I like it, and will be glad to take it if you update the documentation :)

thanks,

greg k-h
