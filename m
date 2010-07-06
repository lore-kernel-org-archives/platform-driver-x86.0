From: Thomas Renninger <trenn@suse.de>
Subject: Re: [PATCH] hp-wmi: add return value checking for input_allocate_device()
Date: Tue, 6 Jul 2010 09:56:45 +0200
Message-ID: <201007060956.45726.trenn@suse.de>
References: <1278383426.12801.15.camel@mola>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-6"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:44166 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751194Ab0GFH4t (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 6 Jul 2010 03:56:49 -0400
In-Reply-To: <1278383426.12801.15.camel@mola>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Axel Lin <axel.lin@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Matthew Garrett <mjg@redhat.com>, Len Brown <len.brown@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Frans Pop <elendil@planet.nl>, Anisse Astier <anisse@astier.eu>, platform-driver-x86@vger.kernel.org

Hi,

it's incredible how much cleanups and fixes you find in this
handful of drivers... It's very much appreciated!

On Tuesday 06 July 2010 04:30:26 Axel Lin wrote:
> Add error checking and return -ENOMEM if input_allocate_device() fail.
> 
> Signed-off-by: Axel Lin <axel.lin@gmail.com>
> ---
>  drivers/platform/x86/hp-wmi.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> index 51c07a0..c508e20 100644
> --- a/drivers/platform/x86/hp-wmi.c
> +++ b/drivers/platform/x86/hp-wmi.c
> @@ -402,6 +402,8 @@ static int __init hp_wmi_input_setup(void)
>  	int err;
>  
>  	hp_wmi_input_dev = input_allocate_device();
> +	if (!hp_wmi_input_dev)
> +		return -ENOMEM;
>  
>  	hp_wmi_input_dev->name = "HP WMI hotkeys";
>  	hp_wmi_input_dev->phys = "wmi/input0";
But also hp_wmi_input_setup() call should get checked and if it
fails, the previous wmi_install_notify_handler() must get uninstalled
again. Hm, probably the whole driver shouldn't load then and
the error code from hp_wmi_input_setup() can be returned in
hp_wmi_init(void).

Do you mind to incorporate above if you agree.

Thanks,

   Thomas
