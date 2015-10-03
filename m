From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 14/19] sony-laptop: fix handling sony_nc_hotkeys_decode
 result
Date: Sat, 3 Oct 2015 09:39:32 -0700
Message-ID: <20151003163932.GB110874@vmdeb7>
References: <1443103227-25612-1-git-send-email-a.hajda@samsung.com>
 <1443103227-25612-15-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1443103227-25612-15-git-send-email-a.hajda@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Mattia Dongili <malattia@linux.it>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Sep 24, 2015 at 04:00:22PM +0200, Andrzej Hajda wrote:
> The function can return negative value.
> 
> The problem has been detected using proposed semantic patch
> scripts/coccinelle/tests/assign_signed_to_unsigned.cocci [1].
> 
> [1]: http://permalink.gmane.org/gmane.linux.kernel/2046107
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>

Sorry for the delay Andrsej, and thank you for your patch. Given my delay, I've
made a couple of changes myself rather than asking you to resubmit. Please
review and let me know if you have any concerns.

First, The description above is incomplete and relies on context from the URL
to fully explain the problem you are fixing. In the future, please ensure the
commit message is self-sufficient.

I have changed the message to read:

    sony-laptop: Fix handling sony_nc_hotkeys_decode result

    sony_nv_hotkeys_decode can return a negative value. real_ev is a u32 variable.
    The check for real_ev > 0 is incorrect.

    Use an intermediate ret variable.

    The problem has been detected using proposed semantic patch
    scripts/coccinelle/tests/assign_signed_to_unsigned.cocci [1].

    [1]: http://permalink.gmane.org/gmane.linux.kernel/2046107

    Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
    [dvhart: clarify commit msg, drop superfluous else block]
    Signed-off-by: Darren Hart <dvhart@linux.intel.com>

See below for an additional change.

> ---
> Hi,
> 
> To avoid problems with too many mail recipients I have sent whole
> patchset only to LKML. Anyway patches have no dependencies.
> 
> Regards
> Andrzej
> ---
>  drivers/platform/x86/sony-laptop.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
> index aeb80d1..d8a2115 100644
> --- a/drivers/platform/x86/sony-laptop.c
> +++ b/drivers/platform/x86/sony-laptop.c
> @@ -1204,6 +1204,8 @@ static void sony_nc_notify(struct acpi_device *device, u32 event)
>  {
>  	u32 real_ev = event;
>  	u8 ev_type = 0;
> +	int ret;
> +
>  	dprintk("sony_nc_notify, event: 0x%.2x\n", event);
>  
>  	if (event >= 0x90) {
> @@ -1225,13 +1227,15 @@ static void sony_nc_notify(struct acpi_device *device, u32 event)
>  		case 0x0100:
>  		case 0x0127:
>  			ev_type = HOTKEY;
> -			real_ev = sony_nc_hotkeys_decode(event, handle);
> +			ret = sony_nc_hotkeys_decode(event, handle);
>  
> -			if (real_ev > 0)
> -				sony_laptop_report_input_event(real_ev);
> -			else
> +			if (ret > 0) {
> +				sony_laptop_report_input_event(ret);
> +				real_ev = ret;
> +			} else {
>  				/* restore the original event for reporting */
>  				real_ev = event;
> +			}

This 4 line else block is superfluous. real_ev is initialized to event and only changed here if ret > 0. Therefore, there is no need to set real_ev to event again. I have simply dropped the else block

-- 
Darren Hart
Intel Open Source Technology Center
