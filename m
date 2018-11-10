From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v4 1/3] x86: add support for Huawei WMI hotkeys.
Date: Sat, 10 Nov 2018 16:25:49 +0200
Message-ID: <CAHp75Vc0H6Cd=knnx3Sv2zLXfqPp2J48VQDFBo4miLo5vMVftg@mail.gmail.com>
References: <20181109234526.4280-1-ayman.bagabas@gmail.com> <20181109234526.4280-2-ayman.bagabas@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181109234526.4280-2-ayman.bagabas@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ayman Bagabas <ayman.bagabas@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Nov 10, 2018 at 1:45 AM Ayman Bagabas <ayman.bagabas@gmail.com> wrote:
>
> This driver adds support for missing hotkeys on some Huawei laptops.
> Currently, only Huawei Matebook X and Matebook X Pro is supported.

>  drivers/platform/x86/huawei_wmi.c            | 215 +++++++++++++++++++
>  include/linux/platform_data/x86/huawei_wmi.h |   9 +

So, please use a de facto pattern, i.e. <VENDOR>-wmi.c, so for *.h.

> +config HUAWEI_LAPTOP

This better to be consistent with the module name.

> +       help
> +         This driver provides support for Huawei WMI hotkeys.
> +         It enables the missing keys and adds support to the micmute
> +         LED found on some of these laptops.

Here we usually put a line how module will be called.

> +// SPDX-License-Identifier: GPL-2.0

You need to choose proper license either here, or in MODULE_LICENSE()
line. For now they are not in align.

> +MODULE_LICENSE("GPL");

> +       /*
> +        * MBX uses code 0x80 to indicate a hotkey event.
> +        * The actual key is fetched from the method WQ00

Period is missed.

> +        */

> +static void huawei_wmi_notify(u32 value, void *context)
> +{
> +       struct acpi_buffer response = { ACPI_ALLOCATE_BUFFER, NULL };
> +       union acpi_object *obj;
> +       acpi_status status;

> +       struct input_dev *inputdev = (struct input_dev *)context;

No need an explicit casting.
Also, move this to be first line in the definition block.

> +       status = wmi_get_event_data(value, &response);
> +       if (ACPI_FAILURE(status)) {
> +               dev_err(&inputdev->dev, "Bad event status 0x%x\n", status);
> +               return;
> +       }

> +}

> +       err = sparse_keymap_setup(inputdev,
> +                       huawei_wmi_keymap, NULL);

Would it be one line?

> +       if (err)
> +               goto err_free_dev;
> +

-- 
With Best Regards,
Andy Shevchenko
