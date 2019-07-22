From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH 1/3] platform/x86/pcengines-apuv2: add mpcie reset gpio
 export
Date: Mon, 22 Jul 2019 13:25:23 +0200
Message-ID: <ca916de8-dab3-66d7-806b-b43a2df6cffb@metux.net>
References: <20190704090205.19400-1-fe@dev.tdt.de>
 <20190704090205.19400-2-fe@dev.tdt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190704090205.19400-2-fe@dev.tdt.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Eckert <fe@dev.tdt.de>, Eckert.Florian@googlemail.com, info@metux.net, dvhart@infradead.org, andy@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On 04.07.19 11:02, Florian Eckert wrote:
> On APUx we have also mpcie2/mpcie3 reset pins. To make it possible to reset
> the ports from the userspace, add the definition to this platform
> device. The gpio can then be exported by the legancy gpio subsystem to
> toggle the mpcie reset pin.
> 
> Signed-off-by: Florian Eckert <fe@dev.tdt.de>
> ---
>   drivers/platform/x86/pcengines-apuv2.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/platform/x86/pcengines-apuv2.c b/drivers/platform/x86/pcengines-apuv2.c
> index c1ca931e1fab..f6d8ed100cab 100644
> --- a/drivers/platform/x86/pcengines-apuv2.c
> +++ b/drivers/platform/x86/pcengines-apuv2.c
> @@ -32,6 +32,8 @@
>   #define APU2_GPIO_REG_LED3		AMD_FCH_GPIO_REG_GPIO59_DEVSLP1
>   #define APU2_GPIO_REG_MODESW		AMD_FCH_GPIO_REG_GPIO32_GE1
>   #define APU2_GPIO_REG_SIMSWAP		AMD_FCH_GPIO_REG_GPIO33_GE2
> +#define APU2_GPIO_REG_MPCIE2		AMD_FCH_GPIO_REG_GPIO59_DEVSLP0
> +#define APU2_GPIO_REG_MPCIE3		AMD_FCH_GPIO_REG_GPIO51
>   
>   /* order in which the gpio lines are defined in the register list */
>   #define APU2_GPIO_LINE_LED1		0
> @@ -39,6 +41,8 @@
>   #define APU2_GPIO_LINE_LED3		2
>   #define APU2_GPIO_LINE_MODESW		3
>   #define APU2_GPIO_LINE_SIMSWAP		4
> +#define APU2_GPIO_LINE_MPCIE2		5
> +#define APU2_GPIO_LINE_MPCIE3		6
>   
>   /* gpio device */
>   
> @@ -48,6 +52,8 @@ static int apu2_gpio_regs[] = {
>   	[APU2_GPIO_LINE_LED3]		= APU2_GPIO_REG_LED3,
>   	[APU2_GPIO_LINE_MODESW]		= APU2_GPIO_REG_MODESW,
>   	[APU2_GPIO_LINE_SIMSWAP]	= APU2_GPIO_REG_SIMSWAP,
> +	[APU2_GPIO_LINE_MPCIE2]		= APU2_GPIO_REG_MPCIE2,
> +	[APU2_GPIO_LINE_MPCIE3]		= APU2_GPIO_REG_MPCIE3,
>   };
>   
>   static const char * const apu2_gpio_names[] = {
> @@ -56,6 +62,8 @@ static const char * const apu2_gpio_names[] = {
>   	[APU2_GPIO_LINE_LED3]		= "front-led3",
>   	[APU2_GPIO_LINE_MODESW]		= "front-button",
>   	[APU2_GPIO_LINE_SIMSWAP]	= "simswap",
> +	[APU2_GPIO_LINE_MPCIE2]		= "mpcie2_reset",
> +	[APU2_GPIO_LINE_MPCIE3]		= "mpcie3_reset",
>   };
>   
>   static const struct amd_fch_gpio_pdata board_apu2 = {
> 

Acked-by: Enrico Weigelt <info@metux.net>

But note that these gpio's later will be bound to an appropriate
driver. I've got a patch in the queue that uses LED subsystem, but
haven't sorted out whether it's better to go via reset subsystem
(and add a gpio-based reset driver first).

--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
