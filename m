From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH RESEND] acer-wmi: No rfkill on HP wifi
Date: Wed, 5 Aug 2015 13:54:21 -0700
Message-ID: <20150805205421.GA38348@vmdeb7>
References: <1429824979.3169.58.camel@mentor.com>
 <1438556369.2931.153.camel@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:35264 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752806AbbHEUxn (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 5 Aug 2015 16:53:43 -0400
Content-Disposition: inline
In-Reply-To: <1438556369.2931.153.camel@mentor.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Powell, Michael" <Michael_Powell@mentor.com>
Cc: "jlee@suse.com" <jlee@suse.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

On Sun, Aug 02, 2015 at 10:59:29PM +0000, Powell, Michael wrote:
> Prevents acer-wmi from blocking wifi on HP Omen 15 laptops

Wow, you managed to miss both my automated scans for patches that fail
to Cc the maintainer :-) Patchwork caught it though.

Please Cc the maintainer listed in MAINTAINERS in the future per
Documentation/SubmittingPatches, section 5.

> 
> Signed-off-by: Michael Powell <michael_powell@mentor.com>
> ---
>  drivers/platform/x86/acer-wmi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/acer-wmi.c
> b/drivers/platform/x86/acer-wmi.c
> index 3ac29a1..3ad8077 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -807,6 +807,7 @@ static const struct acpi_device_id norfkill_ids[]
> __initconst = {
>         { "IBM0068", 0},
>         { "LEN0068", 0},
>         { "SNY5001", 0},        /* sony-laptop in charge */
> +	{ "HPQ6001", 0},
>         { "", 0},
>  };

I haven't determined the reason yet, but when saving this to apply, I get an
encoded blob of text instead of the patch. How did you send this email?

-- 
Darren Hart
Intel Open Source Technology Center
