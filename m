From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [patch] sony-laptop: fix a couple signedness bugs
Date: Thu, 7 Jun 2012 12:59:59 +0300
Message-ID: <20120607095959.GB13539@mwanda>
References: <20120607082221.GA7582@elgon.mountain>
 <4FD078B2.3060909@bfs.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from rcsinet15.oracle.com ([148.87.113.117]:39938 "EHLO
	rcsinet15.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756331Ab2FGKAQ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 7 Jun 2012 06:00:16 -0400
Content-Disposition: inline
In-Reply-To: <4FD078B2.3060909@bfs.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: walter harms <wharms@bfs.de>
Cc: Mattia Dongili <malattia@linux.it>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Jun 07, 2012 at 11:47:30AM +0200, walter harms wrote:
> 
> 
> Am 07.06.2012 10:22, schrieb Dan Carpenter:
> > These need to be signed to handle negative error codes.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
> > index 210d4ae..0a2f026 100644
> > --- a/drivers/platform/x86/sony-laptop.c
> > +++ b/drivers/platform/x86/sony-laptop.c
> > @@ -2113,7 +2113,7 @@ static ssize_t sony_nc_thermal_mode_show(struct device *dev,
> >  		struct device_attribute *attr, char *buffer)
> >  {
> >  	ssize_t count = 0;
> > -	unsigned int mode = sony_nc_thermal_mode_get();
> > +	int mode = sony_nc_thermal_mode_get();
> >  
> >  	if (mode < 0)
> >  		return mode;
> > @@ -2480,7 +2480,7 @@ static void sony_nc_backlight_ng_read_limits(int handle,
> >  	props->maxlvl = 0xff;
> >  
> >  	offset = sony_find_snc_handle(handle);
> 
> sony_find_snc_handle() should return an int, did something change ?

offset is a u64.  It has to be 64 bit.  I thought about changing it
to s64, but decided to just cast it here instead.

regards,
dan carpenter

> 
> > -	if (offset < 0)
> > +	if ((int)offset < 0)
> >  		return;
> >  
> >  	/* try to read the boundaries from ACPI tables, if we fail the above
> 
> 
> 
