From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 8/8] eeepc-laptop: don't assume get_acpi succeeds
Date: Mon, 27 Oct 2014 22:34:29 -0700
Message-ID: <20141028053429.GI60814@vmdeb7>
References: <1414005163-3461-1-git-send-email-fransklaver@gmail.com>
 <1414005163-3461-9-git-send-email-fransklaver@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1414005163-3461-9-git-send-email-fransklaver@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frans Klaver <fransklaver@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Oct 22, 2014 at 09:12:43PM +0200, Frans Klaver wrote:
> In eeepc_hotk_thaw, we assume that get_acpi() will effectively return a
> bool. However, it is possible that get_acpi() returns an error instead.
> We should not be writing error values to the ACPI device, even though
> it's quite possible that we couldn't contact the ACPI device in the
> first place.
> 
> Signed-off-by: Frans Klaver <fransklaver@gmail.com>
> ---
>  drivers/platform/x86/eeepc-laptop.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/eeepc-laptop.c b/drivers/platform/x86/eeepc-laptop.c
> index 275a239..14f79ef 100644
> --- a/drivers/platform/x86/eeepc-laptop.c
> +++ b/drivers/platform/x86/eeepc-laptop.c
> @@ -911,7 +911,7 @@ static int eeepc_hotk_thaw(struct device *device)
>  	struct eeepc_laptop *eeepc = dev_get_drvdata(device);
>  
>  	if (eeepc->wlan_rfkill) {
> -		bool wlan;
> +		int wlan;
>  
>  		/*
>  		 * Work around bios bug - acpi _PTS turns off the wireless led
> @@ -919,7 +919,8 @@ static int eeepc_hotk_thaw(struct device *device)
>  		 * we should kick it ourselves in case hibernation is aborted.
>  		 */
>  		wlan = get_acpi(eeepc, CM_ASL_WLAN);
> -		set_acpi(eeepc, CM_ASL_WLAN, wlan);
> +		if (wlan >= 0)
> +			set_acpi(eeepc, CM_ASL_WLAN, wlan);

And if not? Seems like we should be passing the error code along.

>  	}
>  
>  	return 0;
> -- 
> 2.1.0
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
