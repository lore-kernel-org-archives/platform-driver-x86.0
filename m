From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 1/2] hp-wmi: fix unregister order in
 hp_wmi_rfkill_setup() once again
Date: Tue, 8 Mar 2016 04:39:16 -0800
Message-ID: <20160308123649.GC31742@dvhart-mobl5.amr.corp.intel.com>
References: <56DCB16C.80608@maciej.szmigiero.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56DCB16C.80608@maciej.szmigiero.name>
Sender: linux-kernel-owner@vger.kernel.org
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Kirill Tkhai <tkhai@yandex.ru>
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Mar 06, 2016 at 11:38:36PM +0100, Maciej S. Szmigiero wrote:
> rfkill registration order in hp_wmi_rfkill_setup() is:
> 1) WiFi,
> 2) BT,
> 3) WWAN,
> 5) GPS.
> 
> Unregistration when cleaning up on error return should happen
> in reverse order.
> 
> This means that:
> If BT rfkill fails to be allocated we possibly need to
> first unregister WiFi rfkill before destroying it.
> 
> The same goes with (WWAN, BT) and (GPS, WWAN) pairs.
> 
> Also, if WWAN rfkill fails to register we need to (possibly)
> unregister BT not the GPS one.
> And if GPS rfkill fails to register we need to unregister WWAN
> not the BT one.
> 
> We never need to unregister GPS rfkill here since if GPS rfkill
> registration succeeds this function returns without error so no
> cleanup is necessary.

Thank you for clearly articulating the problem.

> 
> Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
> ---
>  drivers/platform/x86/hp-wmi.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> index fb4dd7b3ee71..78cebc0e358c 100644
> --- a/drivers/platform/x86/hp-wmi.c
> +++ b/drivers/platform/x86/hp-wmi.c
> @@ -746,7 +746,7 @@ static int __init hp_wmi_rfkill_setup(struct platform_device *device)
>  						(void *) HPWMI_BLUETOOTH);
>  		if (!bluetooth_rfkill) {
>  			err = -ENOMEM;
> -			goto register_wifi_error;
> +			goto register_bluetooth_error;

In this and all cases below, the goto label should match the situation, jumping
to register_bluetooth_error would be incorrect as we experienced a wifi error. A
better solution would be to reorder the labels in the exit block such that they
enforce the necessary reverse order.

>  		}
>  		rfkill_init_sw_state(bluetooth_rfkill,
>  				     hp_wmi_get_sw_state(HPWMI_BLUETOOTH));
> @@ -764,7 +764,7 @@ static int __init hp_wmi_rfkill_setup(struct platform_device *device)
>  					   (void *) HPWMI_WWAN);
>  		if (!wwan_rfkill) {
>  			err = -ENOMEM;
> -			goto register_bluetooth_error;
> +			goto register_wwan_error;
>  		}
>  		rfkill_init_sw_state(wwan_rfkill,
>  				     hp_wmi_get_sw_state(HPWMI_WWAN));
> @@ -782,7 +782,7 @@ static int __init hp_wmi_rfkill_setup(struct platform_device *device)
>  						(void *) HPWMI_GPS);
>  		if (!gps_rfkill) {
>  			err = -ENOMEM;
> -			goto register_wwan_error;
> +			goto register_gps_error;
>  		}
>  		rfkill_init_sw_state(gps_rfkill,
>  				     hp_wmi_get_sw_state(HPWMI_GPS));
> @@ -797,13 +797,13 @@ static int __init hp_wmi_rfkill_setup(struct platform_device *device)
>  register_gps_error:
>  	rfkill_destroy(gps_rfkill);
>  	gps_rfkill = NULL;
> -	if (bluetooth_rfkill)
> -		rfkill_unregister(bluetooth_rfkill);
> +	if (wwan_rfkill)
> +		rfkill_unregister(wwan_rfkill);
>  register_wwan_error:
>  	rfkill_destroy(wwan_rfkill);
>  	wwan_rfkill = NULL;
> -	if (gps_rfkill)
> -		rfkill_unregister(gps_rfkill);
> +	if (bluetooth_rfkill)
> +		rfkill_unregister(bluetooth_rfkill);
>  register_bluetooth_error:
>  	rfkill_destroy(bluetooth_rfkill);
>  	bluetooth_rfkill = NULL;
> 

-- 
Darren Hart
Intel Open Source Technology Center
