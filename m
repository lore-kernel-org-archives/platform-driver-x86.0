From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: Add new intel_atomisp2_led driver
Date: Sat, 30 May 2020 18:50:09 +0300
Message-ID: <CAHp75Veq65-xV1k3OODjQamLYJsztHT1fyCSDgm9JMGu7Qha9A@mail.gmail.com>
References: <20200509130707.219463-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200509130707.219463-1-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, May 9, 2020 at 4:07 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Many Bay Trail and Cherry Trail devices come with a camera attached to
> Intel's Image Signal Processor. Linux currently does not have a driver for
> these, so they do not work as a camera.
>
> Some of these camera's have a status LED which is controlled through a GPIO
> in some cases, e.g. on the Asus T100TA and Asus T200TA, there is a firmware
> issue where the LED gets turned on at boot.
>
> This commit adds a Linux LED driver for the camera LED on these devices.
> This driver will turn the LED off at boot and also allows controlling the
> LED (so the user can repurpose it) through the sysfs LED interface.
>
> Which GPIO is attached to the LED is usually not described in the ACPI
> tables, so this driver contains per-system info about the GPIO inside the
> driver. This means that this driver only works on systems the driver knows
> about.

> +static int __init atomisp2_led_init(void)
> +{
> +       const struct dmi_system_id *system;
> +
> +       system = dmi_first_match(atomisp2_led_systems);
> +       if (!system)
> +               return -ENODEV;
> +
> +       gpio_lookup = system->driver_data;
> +       gpiod_add_lookup_table(gpio_lookup);
> +
> +       pdev = platform_device_register_resndata(NULL,
> +                                                DEV_NAME, PLATFORM_DEVID_NONE,
> +                                                NULL, 0, &atomisp2_leds_pdata,
> +                                                sizeof(atomisp2_leds_pdata));
> +       if (IS_ERR(pdev)) {
> +               gpiod_remove_lookup_table(gpio_lookup);

> +               return PTR_ERR(pdev);
> +       }
> +
> +       return 0;

return PTR_ERR_OR_ZERO(...);

> +}

-- 
With Best Regards,
Andy Shevchenko
