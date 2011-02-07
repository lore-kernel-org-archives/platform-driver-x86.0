From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] embedded 1288 fcbga arrandale cpu not detected in ips
	module - no gpu turbo
Date: Mon, 7 Feb 2011 19:13:21 +0000
Message-ID: <20110207191321.GA19838@srcf.ucam.org>
References: <BBC019D537C16342B2754DEB36395C0C013AB5EA@BUDMLVEM06.e2k.ad.ge.com> <20110204091156.1b8e76fb@jbarnes-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:38839 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754559Ab1BGTN2 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 7 Feb 2011 14:13:28 -0500
Content-Disposition: inline
In-Reply-To: <20110204091156.1b8e76fb@jbarnes-desktop>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: "Koerber, Philip (GE Intelligent Platforms)" <Philip.Koerber@ge.com>, platform-driver-x86@vger.kernel.org

On Fri, Feb 04, 2011 at 09:11:56AM -0800, Jesse Barnes wrote:
> > +++ linux/drivers/platform/x86/intel_ips.c	2011-02-04 15:25:40.205627688 +0100
> > @@ -1399,6 +1399,10 @@
> >  		limits = &ips_lv_limits;
> >  	else if (strstr(boot_cpu_data.x86_model_id, "CPU       U"))
> >  		limits = &ips_ulv_limits;
> > +	else if (strstr(boot_cpu_data.x86_model_id, "CPU         610"))
> > +		limits = &ips_sv_limits;
> > +	else if (strstr(boot_cpu_data.x86_model_id, "CPU         520"))
> > +		limits = &ips_sv_limits;
> >  	else {
> >  		dev_info(&ips->dev->dev, "No CPUID match found.\n");
> >  		goto out;
> 
> Yep, that's fine with me, thanks for the patch!

Are these the only two embedded Arrandales? Is there really no MSR that 
gives you the voltage range?

-- 
Matthew Garrett | mjg59@srcf.ucam.org
