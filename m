From: joeyli <jlee@suse.com>
Subject: Re: [PATCH] platform/x86: acer-wmi: add automatic keyboard
 background light toggle key as KEY_LIGHTS_TOGGLE
Date: Fri, 28 Aug 2020 18:08:39 +0800
Message-ID: <20200828100839.GK7501@linux-l9pv.suse>
References: <20200804001423.36778-1-timo.witte@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200804001423.36778-1-timo.witte@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Timo Witte <timo.witte@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "open list:ACER WMI LAPTOP EXTRAS" <platform-driver-x86@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi Timo,

On Tue, Aug 04, 2020 at 02:14:23AM +0200, Timo Witte wrote:
> Got a dmesg message on my AMD Renoir based Acer laptop:
> "acer_wmi: Unknown key number - 0x84" when toggling keyboard
> background light
> 
> Signed-off-by: Timo Witte <timo.witte@gmail.com>

Reviewed-by: "Lee, Chun-Yi" <jlee@suse.com>

Thanks for your help!
Joey Lee

> ---
>  drivers/platform/x86/acer-wmi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index 60c18f21588d..87797f785d6a 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -111,6 +111,7 @@ static const struct key_entry acer_wmi_keymap[] __initconst = {
>  	{KE_KEY, 0x64, {KEY_SWITCHVIDEOMODE} },	/* Display Switch */
>  	{KE_IGNORE, 0x81, {KEY_SLEEP} },
>  	{KE_KEY, 0x82, {KEY_TOUCHPAD_TOGGLE} },	/* Touch Pad Toggle */
> +	{KE_IGNORE, 0x84, {KEY_LIGHTS_TOGGLE} }, /* Automatic Keyboard background light toggle */
>  	{KE_KEY, KEY_TOUCHPAD_ON, {KEY_TOUCHPAD_ON} },
>  	{KE_KEY, KEY_TOUCHPAD_OFF, {KEY_TOUCHPAD_OFF} },
>  	{KE_IGNORE, 0x83, {KEY_TOUCHPAD_TOGGLE} },
> -- 
> 2.27.0
