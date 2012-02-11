From: Jonathan Nieder <jrnieder@gmail.com>
Subject: Re: [PATCH v2] acer-wmi: No wifi rfkill on Lenovo machines
Date: Sat, 11 Feb 2012 13:10:44 -0600
Message-ID: <20120211191044.GA7265@burratino>
References: <1327546404.15260.18.camel@linux-s257.site>
 <1328258799-19665-1-git-send-email-ike.pan@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:39983 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751317Ab2BKTLB (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 11 Feb 2012 14:11:01 -0500
Received: by iacb35 with SMTP id b35so1937187iac.19
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Feb 2012 11:11:00 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1328258799-19665-1-git-send-email-ike.pan@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ike Panhc <ike.pan@canonical.com>
Cc: joeyli <jlee@suse.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, mjg@redhat.com, platform-driver-x86@vger.kernel.org, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>, Seth Forshee <seth.forshee@canonical.com>, Andrey <andrey.k.p@gmail.com>

Hi,

Ike Panhc wrote:

> We have several reports which says acer-wmi is loaded on ideapads
> and register rfkill for wifi which can not be unblocked.
>
> Since ideapad-laptop also register rfkill for wifi and it works
> reliably, it will be fine acer-wmi is not going to register rfkill
> for wifi once VPC2004 is found.
[...]
> Signed-off-by: Ike Panhc <ike.pan@canonical.com>
> ---
>  drivers/platform/x86/acer-wmi.c |   30 +++++++++++++++++++++++++++++-
>  1 files changed, 29 insertions(+), 1 deletions(-)

Thanks!  As described at <http://bugs.debian.org/655941>, without this
patch, Andrey was not able to use wifi, getting the following message
in the kernel log instead:

	iwlagn 0000:03:00.0: RF_KILL bit toggled to enable radio.

rfkill list gave

	2: acer-wireless: Wireless LAN
	    Soft blocked: yes
	    Hard blocked: no

regardless of the state of the actual radio kill switch.  Unloading
the acer_wmi was a workaround.  With this patch, wifi works without
needing to unload acer_wmi, so:

	Tested-by: Andrey <andrey.k.p@gmail.com> # Ideapad Z570

He tested against the 3.2.y tree.

When applying this, please consider cc-ing stable@ so people using
point releases can benefit from the fix, too.

Happily,
Jonathan
