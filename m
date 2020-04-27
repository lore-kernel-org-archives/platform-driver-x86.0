From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 1/8] iio: light: cm32181: Add some extra register
 defines
Date: Mon, 27 Apr 2020 20:29:17 +0200
Message-ID: <10122c2e-ea04-2be7-ac19-c070390d5335@redhat.com>
References: <20200427155037.218390-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20200427155037.218390-1-hdegoede@redhat.com>
Content-Language: en-US
Sender: linux-acpi-owner@vger.kernel.org
To: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Jonathan Cameron <jic23@kernel.org>
Cc: linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Hi ,

Self-nack for this series, specifically for the

[PATCH v2 3/8] iio: light: cm32181: Handle ACPI instantiating a cm32181 client on the SMBus ARA

Patch, I will reply to that patch with more details and I will prepare a v3
of this series with a better solution.

Regards,

Hans


On 4/27/20 5:50 PM, Hans de Goede wrote:
> These come from a newer version of cm32181.c, which is floating around
> the net, with a copyright of:
> 
>   * Copyright (C) 2014 Capella Microsystems Inc.
>   * Author: Kevin Tsai <ktsai@capellamicro.com>
>   *
>   * This program is free software; you can redistribute it and/or modify it
>   * under the terms of the GNU General Public License version 2, as published
>   * by the Free Software Foundation.
> 
> Note that this removes the bogus CM32181_CMD_ALS_ENABLE define, there
> is no enable bit, only a disable bit and enabled is the absence of
> being disabled.
> 
> This is a preparation patch for adding support for the older
> CM3218 model of the light sensor.
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   drivers/iio/light/cm32181.c | 15 +++++++++++----
>   1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iio/light/cm32181.c b/drivers/iio/light/cm32181.c
> index 5f4fb5674fa0..ee386afe811e 100644
> --- a/drivers/iio/light/cm32181.c
> +++ b/drivers/iio/light/cm32181.c
> @@ -18,6 +18,9 @@
>   
>   /* Registers Address */
>   #define CM32181_REG_ADDR_CMD		0x00
> +#define CM32181_REG_ADDR_WH		0x01
> +#define CM32181_REG_ADDR_WL		0x02
> +#define CM32181_REG_ADDR_TEST		0x03
>   #define CM32181_REG_ADDR_ALS		0x04
>   #define CM32181_REG_ADDR_STATUS		0x06
>   #define CM32181_REG_ADDR_ID		0x07
> @@ -26,9 +29,13 @@
>   #define CM32181_CONF_REG_NUM		0x01
>   
>   /* CMD register */
> -#define CM32181_CMD_ALS_ENABLE		0x00
> -#define CM32181_CMD_ALS_DISABLE		0x01
> -#define CM32181_CMD_ALS_INT_EN		0x02
> +#define CM32181_CMD_ALS_DISABLE		BIT(0)
> +#define CM32181_CMD_ALS_INT_EN		BIT(1)
> +#define CM32181_CMD_ALS_THRES_WINDOW	BIT(2)
> +
> +#define CM32181_CMD_ALS_PERS_SHIFT	4
> +#define CM32181_CMD_ALS_PERS_MASK	(0x03 << CM32181_CMD_ALS_PERS_SHIFT)
> +#define CM32181_CMD_ALS_PERS_DEFAULT	(0x01 << CM32181_CMD_ALS_PERS_SHIFT)
>   
>   #define CM32181_CMD_ALS_IT_SHIFT	6
>   #define CM32181_CMD_ALS_IT_MASK		(0x0F << CM32181_CMD_ALS_IT_SHIFT)
> @@ -82,7 +89,7 @@ static int cm32181_reg_init(struct cm32181_chip *cm32181)
>   		return -ENODEV;
>   
>   	/* Default Values */
> -	cm32181->conf_regs[CM32181_REG_ADDR_CMD] = CM32181_CMD_ALS_ENABLE |
> +	cm32181->conf_regs[CM32181_REG_ADDR_CMD] =
>   			CM32181_CMD_ALS_IT_DEFAULT | CM32181_CMD_ALS_SM_DEFAULT;
>   	cm32181->calibscale = CM32181_CALIBSCALE_DEFAULT;
>   
> 
