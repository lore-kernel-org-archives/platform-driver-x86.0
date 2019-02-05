From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform: x86: Add check for led_classdev_register
Date: Tue, 5 Feb 2019 18:21:11 +0200
Message-ID: <CAHp75VeT5hH+rfpndW_i1H9nEV5pJyeP=26-oHnJYcq64NE4TQ@mail.gmail.com>
References: <20181224220737.27539-1-pakki001@umn.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181224220737.27539-1-pakki001@umn.edu>
Sender: linux-kernel-owner@vger.kernel.org
To: Aditya Pakki <pakki001@umn.edu>
Cc: kjlu@umn.edu, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Dec 25, 2018 at 12:08 AM Aditya Pakki <pakki001@umn.edu> wrote:
>
> In function alienware_zone_init, the function led_classdev_register
> can return an error on failure. The fix checks the error and frees
> the allocated resources.
>

I'm not sure about this.
Is the LED registration fatal?

> Signed-off-by: Aditya Pakki <pakki001@umn.edu>
> ---
>  drivers/platform/x86/alienware-wmi.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/alienware-wmi.c b/drivers/platform/x86/alienware-wmi.c
> index f10af5c383c5..63ab6a2eb613 100644
> --- a/drivers/platform/x86/alienware-wmi.c
> +++ b/drivers/platform/x86/alienware-wmi.c
> @@ -441,6 +441,7 @@ static int alienware_zone_init(struct platform_device *dev)
>         u8 zone;
>         char buffer[10];
>         char *name;
> +       int ret;
>
>         if (interface == WMAX) {
>                 lighting_control_state = WMAX_RUNNING;
> @@ -492,7 +493,17 @@ static int alienware_zone_init(struct platform_device *dev)
>         zone_attrs[quirks->num_zones] = &dev_attr_lighting_control_state.attr;
>         zone_attribute_group.attrs = zone_attrs;
>
> -       led_classdev_register(&dev->dev, &global_led);
> +       ret = led_classdev_register(&dev->dev, &global_led);
> +       if (ret < 0) {
> +               if (zone_dev_attrs) {
> +                       for (zone = 0; zone < quirks->num_zones; zone++)
> +                               kfree(zone_dev_attrs[zone].attr.name);
> +               }
> +               kfree(zone_dev_attrs);
> +               kfree(zone_data);
> +               kfree(zone_attrs);
> +               return ret;
> +       }
>
>         return sysfs_create_group(&dev->dev.kobj, &zone_attribute_group);
>  }
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
