From: rauchwolke@gmx.net
Subject: Re: [PATCH] thinkpad_acpi: Fix inconsistent mute LED after resume
Date: Thu, 13 Feb 2014 19:02:46 +0100
Message-ID: <0MGWR2-1W0rTh1wUC-00DE8E@mail.gmx.com>
References: <1392219165-20888-1-git-send-email-tiwai@suse.de>
	<1392237456.1201.2.camel@x230>
	<s5h7g8zfm0d.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.15]:59356 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752208AbaBMSDD (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 13 Feb 2014 13:03:03 -0500
Received: from rolle.lan ([80.109.73.20]) by mail.gmx.com (mrgmx101) with
 ESMTPSA (Nemesis) id 0LpwZn-1VZkSB3Kch-00fizx for
 <platform-driver-x86@vger.kernel.org>; Thu, 13 Feb 2014 19:03:01 +0100
In-Reply-To: <s5h7g8zfm0d.wl%tiwai@suse.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Matthew Garrett <matthew.garrett@nebula.com>, "david.henningsson@canonical.com" <david.henningsson@canonical.com>, "ibm-acpi-devel@lists.sourceforge.net" <ibm-acpi-devel@lists.sourceforge.net>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "ibm-acpi@hmh.eng.br" <ibm-acpi@hmh.eng.br>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi,

this patch doesn't work. The sound is now muted after the resume (light is on). 
But the userspace knows nothing about it. (kmix shows the volume as umuted)

Peter


On Thu, 13 Feb 2014 09:35:30 +0100
Takashi Iwai <tiwai@suse.de> wrote:

> At Wed, 12 Feb 2014 20:37:36 +0000,
> Matthew Garrett wrote:
> > 
> > On Wed, 2014-02-12 at 16:32 +0100, Takashi Iwai wrote:
> > > The mute LED states have to be restored after resume.
> > 
> > Oh, never mind, we're not doing this through the LED class, are we?
> 
> Good point.  It seems that leds_class has pm_ops but it's enabled only
> when a flag is set.
> 
> I added the original bug reporter to Cc.  (Don't know the name,
> Bugzilla shows only the email address.)
> Could you check the patch below works instead of the previous fix?
> 
> 
> Takashi
> 
> ---
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index defb6afc1409..16edf75d9c00 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -4796,6 +4796,7 @@ static struct tpacpi_led_classdev tpacpi_led_thinklight = {
>  		.name		= "tpacpi::thinklight",
>  		.brightness_set	= &light_sysfs_set,
>  		.brightness_get	= &light_sysfs_get,
> +		.flags		= LED_CORE_SUSPENDRESUME,
>  	}
>  };
>  
