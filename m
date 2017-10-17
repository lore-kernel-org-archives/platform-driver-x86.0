From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [patch v4 3/3] platform/mellanox: mlxreg-hotplug: modify to use
 regmap intreface
Date: Tue, 17 Oct 2017 22:24:07 +0300
Message-ID: <CAHp75VfaU-GUvgFwx=+M-=DX2NRO9A3uQkxcmtY0FVRow+S9zA@mail.gmail.com>
References: <1508264554-184107-1-git-send-email-vadimp@mellanox.com> <1508264554-184107-4-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1508264554-184107-4-git-send-email-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, =?UTF-8?B?SmnFmcOtIFDDrXJrbw==?= <jiri@resnulli.us>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Oct 17, 2017 at 9:22 PM, Vadim Pasternak <vadimp@mellanox.com> wrote:
> It includes:
> - restructuring  of mlxreg header file for unification of hotplug items
>   definition;
> - unification of hotplug items to allow any kind of item (power
>   controller, fan eeprom, psu eeprom, asic health in common way);
> - utilization of regmap interface to allow independency of underlying
>   hardware. It allows to support hotplug event functionality over
>   programmable devices logic, when these devices can be attached to
>   different interfaces types, like I2C, LPC, SPI.
>
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> -#define PRIV_ATTR(i) priv->mlxreg_hotplug_attr[i]
> -#define PRIV_DEV_ATTR(i) priv->mlxreg_hotplug_dev_attr[i]

> -static int mlxreg_hotplug_attr_init(struct mlxreg_hotplug_priv_data *priv)
> +static int
> +mlxreg_hotplug_attr_init(struct mlxreg_hotplug_priv_data *priv)

This is kinda noisy change.

>  {

> -       for (i = 0; i < num_attrs; i++) {
> -               PRIV_ATTR(i) = &PRIV_DEV_ATTR(i).dev_attr.attr;
> -
> -               if (i < priv->plat->psu_count) {
> -                       PRIV_ATTR(i)->name = devm_kasprintf(&priv->pdev->dev,
> -                                               GFP_KERNEL, "psu%u", i + 1);
> -                       PRIV_DEV_ATTR(i).nr = MLXREG_HOTPLUG_ATTR_TYPE_PSU;
> -               } else if (i < priv->plat->psu_count + priv->plat->pwr_count) {
> -                       PRIV_ATTR(i)->name = devm_kasprintf(&priv->pdev->dev,
> -                                               GFP_KERNEL, "pwr%u", i %
> -                                               priv->plat->pwr_count + 1);
> -                       PRIV_DEV_ATTR(i).nr = MLXREG_HOTPLUG_ATTR_TYPE_PWR;
> -               } else {
> -                       PRIV_ATTR(i)->name = devm_kasprintf(&priv->pdev->dev,
> -                                               GFP_KERNEL, "fan%u", i %
> -                                               priv->plat->fan_count + 1);
> -                       PRIV_DEV_ATTR(i).nr = MLXREG_HOTPLUG_ATTR_TYPE_FAN;
> -               }
> -
> -               if (!PRIV_ATTR(i)->name) {
> -                       dev_err(&priv->pdev->dev, "Memory allocation failed for sysfs attribute %d.\n",
> -                               i + 1);
> -                       return -ENOMEM;
> +       for (i = 0; i < pdata->counter; i++, item++) {
> +               data = item->data;
> +               for (j = 0; j < item->count; j++, data++, id++) {
> +                       priv->mlxreg_hotplug_attr[id] =
> +                       &priv->mlxreg_hotplug_dev_attr[id].dev_attr.attr;
> +                       priv->mlxreg_hotplug_attr[id]->name =
> +                               devm_kasprintf(&priv->pdev->dev, GFP_KERNEL,
> +                                              data->label);
> +
> +                       if (!priv->mlxreg_hotplug_attr[id]->name) {
> +                               dev_err(priv->dev, "Memory allocation failed for attr %d.\n",
> +                                       id);
> +                               return -ENOMEM;
> +                       }
> +

> +                       priv->mlxreg_hotplug_dev_attr[id].dev_attr.attr.mode =
> +                                                                       0444;
> +                       priv->mlxreg_hotplug_dev_attr[id].dev_attr.show =
> +                                               mlxreg_hotplug_attr_show;
> +                       priv->mlxreg_hotplug_dev_attr[id].nr = i;
> +                       priv->mlxreg_hotplug_dev_attr[id].index = j;

Why you drop macros usage here?

>                 }
> -
> -               PRIV_DEV_ATTR(i).dev_attr.attr.name = PRIV_ATTR(i)->name;
> -               PRIV_DEV_ATTR(i).dev_attr.attr.mode = S_IRUGO;
> -               PRIV_DEV_ATTR(i).dev_attr.show = mlxreg_hotplug_attr_show;
> -               PRIV_DEV_ATTR(i).index = i;
> -               sysfs_attr_init(&PRIV_DEV_ATTR(i).dev_attr.attr);


>  #define MLXPLAT_CPLD_LPC_I2C_BASE_ADRR         0x2000
>  #define MLXPLAT_CPLD_LPC_REG_BASE_ADRR         0x2500
> -#define MLXPLAT_CPLD_LPC_REG_AGGR_ADRR         0x253a
> -#define MLXPLAT_CPLD_LPC_REG_PSU_ADRR          0x2558
> -#define MLXPLAT_CPLD_LPC_REG_PWR_ADRR          0x2564
> -#define MLXPLAT_CPLD_LPC_REG_FAN_ADRR          0x2588

> +#define MLXPLAT_CPLD_LPC_REG_AGGR_ADRR         0x3a
> +#define MLXPLAT_CPLD_LPC_REG_PSU_ADRR          0x58
> +#define MLXPLAT_CPLD_LPC_REG_PWR_ADRR          0x64
> +#define MLXPLAT_CPLD_LPC_REG_FAN_ADRR          0x88

These now by the fact *offsets*.

-- 
With Best Regards,
Andy Shevchenko
