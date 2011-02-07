From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: [PATCH] embedded 1288 fcbga arrandale cpu not detected in ips
 module - no gpu turbo
Date: Mon, 7 Feb 2011 11:16:44 -0800
Message-ID: <20110207111644.73878813@jbarnes-desktop>
References: <BBC019D537C16342B2754DEB36395C0C013AB5EA@BUDMLVEM06.e2k.ad.ge.com>
	<20110204091156.1b8e76fb@jbarnes-desktop>
	<20110207191321.GA19838@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cpoproxy2-pub.bluehost.com ([67.222.39.38]:40509 "HELO
	cpoproxy2-pub.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1754559Ab1BGTQr (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 7 Feb 2011 14:16:47 -0500
In-Reply-To: <20110207191321.GA19838@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: "Koerber, Philip (GE Intelligent Platforms)" <Philip.Koerber@ge.com>, platform-driver-x86@vger.kernel.org

On Mon, 7 Feb 2011 19:13:21 +0000
Matthew Garrett <mjg59@srcf.ucam.org> wrote:

> On Fri, Feb 04, 2011 at 09:11:56AM -0800, Jesse Barnes wrote:
> > > +++ linux/drivers/platform/x86/intel_ips.c	2011-02-04 15:25:40.205627688 +0100
> > > @@ -1399,6 +1399,10 @@
> > >  		limits = &ips_lv_limits;
> > >  	else if (strstr(boot_cpu_data.x86_model_id, "CPU       U"))
> > >  		limits = &ips_ulv_limits;
> > > +	else if (strstr(boot_cpu_data.x86_model_id, "CPU         610"))
> > > +		limits = &ips_sv_limits;
> > > +	else if (strstr(boot_cpu_data.x86_model_id, "CPU         520"))
> > > +		limits = &ips_sv_limits;
> > >  	else {
> > >  		dev_info(&ips->dev->dev, "No CPUID match found.\n");
> > >  		goto out;
> > 
> > Yep, that's fine with me, thanks for the patch!
> 
> Are these the only two embedded Arrandales? Is there really no MSR that 
> gives you the voltage range?

AFAIK this is the same method the Windows driver uses, so I don't think
so.

Fortunately the on-die integration in Sandy Bridge makes all this
unnecessary, so I don't expect you'll have to continually add entries
to this list over time.

-- 
Jesse Barnes, Intel Open Source Technology Center
