From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH 3/3] platform//x86/pcengines-apuv2: update gpio button
 definition
Date: Mon, 22 Jul 2019 13:27:56 +0200
Message-ID: <cca95ba1-6ac0-a2eb-9ae6-914a8783c1ad@metux.net>
References: <20190704090205.19400-1-fe@dev.tdt.de>
 <20190704090205.19400-4-fe@dev.tdt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190704090205.19400-4-fe@dev.tdt.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Eckert <fe@dev.tdt.de>, Eckert.Florian@googlemail.com, info@metux.net, dvhart@infradead.org, andy@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On 04.07.19 11:02, Florian Eckert wrote:
> * Add the gpio number, so the button subsystem can find the right gpio.
> * Change also the keycode from KEY_SETUP to KEY_RESTART, because it
>    seems more expressive to me and in the Alix-Board, which is the
>    predecessor, there isthis keycode defined too. I think this is also
>    intended by Pcengines. Also many embedded systems defined in the kernel
>    use this key code as well.
> 
> Signed-off-by: Florian Eckert <fe@dev.tdt.de>
> ---
>   drivers/platform/x86/pcengines-apuv2.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/pcengines-apuv2.c b/drivers/platform/x86/pcengines-apuv2.c
> index d50a50e9d34c..370fd2686d59 100644
> --- a/drivers/platform/x86/pcengines-apuv2.c
> +++ b/drivers/platform/x86/pcengines-apuv2.c
> @@ -116,7 +116,8 @@ struct gpiod_lookup_table gpios_led_table = {
>   
>   static struct gpio_keys_button apu2_keys_buttons[] = {
>   	{
> -		.code			= KEY_SETUP,
> +		.code			= KEY_RESTART,
> +		.gpio			= 508,
>   		.active_low		= 1,
>   		.desc			= "front button",
>   		.type			= EV_KEY,
> 

I'd like to ack only the keycode change, but not the deprecated .gpio 
field. I'll post a separate patch for the keycode change only.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
