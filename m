From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: [PATCH] embedded 1288 fcbga arrandale cpu not detected in ips
 module - no gpu turbo
Date: Fri, 4 Feb 2011 09:11:56 -0800
Message-ID: <20110204091156.1b8e76fb@jbarnes-desktop>
References: <BBC019D537C16342B2754DEB36395C0C013AB5EA@BUDMLVEM06.e2k.ad.ge.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cpoproxy2-pub.bluehost.com ([67.222.39.38]:56517 "HELO
	cpoproxy2-pub.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1751621Ab1BDRL7 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 4 Feb 2011 12:11:59 -0500
In-Reply-To: <BBC019D537C16342B2754DEB36395C0C013AB5EA@BUDMLVEM06.e2k.ad.ge.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Koerber, Philip (GE Intelligent Platforms)" <Philip.Koerber@ge.com>
Cc: platform-driver-x86@vger.kernel.org

On Fri, 4 Feb 2011 15:55:30 +0100
"Koerber, Philip (GE Intelligent Platforms)" <Philip.Koerber@ge.com>
wrote:

> Dear Kernel Maintainers,
> 
> I have observed, that on our SBC's the GPU turbo mode doesn't work. This happens only to those with embedded Arrandale (1288 FCBGA package) standard voltage (35W) CPU's. These CPU's do not have there an letter whereas the Mobile CPU has an M. So there seems to be a need to update the intel_ips.c in order to recognize the CPU's with  brand strings 'Intel(R) Core(TM) i7 CPU         610  @ 2.53GHz' and  'Intel(R) Core(TM) i5 CPU         520  @ 2.40GHz'. I have prepared therefor following patch:
> 
> 
> diff -urN linux-2.6.38-rc3/drivers/platform/x86/intel_ips.c linux/drivers/platform/x86/intel_ips.c
> --- linux-2.6.38-rc3/drivers/platform/x86/intel_ips.c	2011-02-01 04:05:49.000000000 +0100
> +++ linux/drivers/platform/x86/intel_ips.c	2011-02-04 15:25:40.205627688 +0100
> @@ -1399,6 +1399,10 @@
>  		limits = &ips_lv_limits;
>  	else if (strstr(boot_cpu_data.x86_model_id, "CPU       U"))
>  		limits = &ips_ulv_limits;
> +	else if (strstr(boot_cpu_data.x86_model_id, "CPU         610"))
> +		limits = &ips_sv_limits;
> +	else if (strstr(boot_cpu_data.x86_model_id, "CPU         520"))
> +		limits = &ips_sv_limits;
>  	else {
>  		dev_info(&ips->dev->dev, "No CPUID match found.\n");
>  		goto out;

Yep, that's fine with me, thanks for the patch!

Acked-by: Jesse Barnes <jbarnes@virtuousgeek.org>

-- 
Jesse Barnes, Intel Open Source Technology Center
