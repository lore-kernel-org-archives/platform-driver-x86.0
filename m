From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3] platform/x86: surface3_power: MSHW0011 rev-eng implementation
Date: Wed, 26 Sep 2018 12:58:09 +0300
Message-ID: <CAHp75VdELtEv4LYHXGRVqc+G=Mq0WzQrX1soK2_bApcc19jNWQ@mail.gmail.com>
References: <20180831151828.15175-1-benjamin.tissoires@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180831151828.15175-1-benjamin.tissoires@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Bastien Nocera <hadess@hadess.net>, Stephen Just <stephenjust@gmail.com>, Sebastian Reichel <sre@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Aug 31, 2018 at 6:18 PM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> The MSHW0011 device is a chip that replaces the battery firmware
> by using ACPI operation regions on the Surface 3.
> It is unclear whether or not the chip will be reused somewhere else
> (under Windows, the chip is called "Surface Platform Power Driver"
> and the driver is provided by Microsoft).
>
> The values have been obtained by reverse engineering, and are subject to
> errors. Looks like it works on overall pretty well.
>
> I couldn't manage to get the IRQ correctly triggered, so I am using a
> good old polling thread to check for changes. This is something
> to be fixed in a later version.

I have pushed to my review and testing queue for bots playing with it!
But below my review.

> Link: https://bugzilla.kernel.org/show_bug.cgi?id=106231
>

Remove this blank line.

> +// SPDX-License-Identifier: GPL-2.0+

> +

No need for this blank line either.

> +/*
> + * Supports for the power IC on the Surface 3 tablet.
> + *
> + * (C) Copyright 2016-2018 Red Hat, Inc
> + * (C) Copyright 2016-2018 Benjamin Tissoires <benjamin.tissoires@gmail.com>
> + * (C) Copyright 2016 Stephen Just <stephenjust@gmail.com>

> + *
...and for this.

> + */

> +#include <asm/unaligned.h>

I'm pretty sure this should go after linux/*.h ones

> +#include <linux/acpi.h>
> +#include <linux/freezer.h>
> +#include <linux/i2c.h>
> +#include <linux/kernel.h>
> +#include <linux/kthread.h>
> +#include <linux/slab.h>
> +#include <linux/uuid.h>


> +       char    model[10];
> +       char    serial[10];
> +       char    type[10];
> +       char    OEM[10];

These 10:s is something worth to define:

#define SURFACE_3_STRLEN 10

or alike.

> +
> +

One blank line is enough

> +#define MSHW0011_EV_2_5                        0x1ff

Is it mask? Value? Some threshold?

> +       static const guid_t mshw0011_guid =
> +               GUID_INIT(0x3F99E367, 0x6220, 0x4955,
> +                         0x8B, 0x0F, 0x06, 0xEF, 0x2A, 0xE7, 0x94, 0x12);

Can you move this outside of the function?

> +       char buf[10];

Same definition as I mentioned above?


> +       /* get serial number */
> +       ret = i2c_smbus_read_i2c_block_data(client, MSHW0011_BAT0_REG_SERIAL_NO,
> +                                           10, buf);

10 -> sizeof() ?

> +       if (ret != 10) {

Ditto.

> +               dev_err(&client->dev, "Error reading serial no: %d\n", ret);
> +               return ret;
> +       }

> +       snprintf(bix->serial, ARRAY_SIZE(bix->serial),
> +                "%*pE%*pE", 3, buf + 7, 6, buf);

It would be one line with format string as "%3pE%6pE" followed by two pointers.

> +       /* get OEM name */
> +       ret = i2c_smbus_read_i2c_block_data(client, MSHW0011_BAT0_REG_OEM,
> +                                           4, buf);
> +       if (ret != 4) {

4 to be defined? Or separate buffer?

> +               dev_err(&client->dev, "Error reading cycle count: %d\n", ret);
> +               return ret;
> +       }
> +       snprintf(bix->OEM, ARRAY_SIZE(bix->OEM), "%*pE", 3, buf);

Depending on the above it might be either "%3pE" or '...sizeof(buf) -
1, buf...'.

> +       status = ret;

> +

No need to have this blank line.

> +       if (status != cdata->charging)
> +               mshw0011_notify(cdata, cdata->notify_mask,
> +                               MSHW0011_NOTIFY_ADP1, &ret);

> +       bat_status = bst.battery_state;

> +

Ditto.

> +       if (bat_status != cdata->bat_charging)
> +               mshw0011_notify(cdata, cdata->notify_mask,
> +                               MSHW0011_NOTIFY_BAT0_BST, &ret);

> +       ret = mshw0011_bix(cdata, &bix);
> +       if (ret < 0)
> +               return ret;

Unlike here, would be nice to add a blank line.

> +       if (bix.last_full_charg_capacity != cdata->full_capacity)
> +               mshw0011_notify(cdata, cdata->notify_mask,
> +                               MSHW0011_NOTIFY_BAT0_BIX, &ret);

> +       if (!value64 || ares->type != ACPI_RESOURCE_TYPE_SERIAL_BUS) {
> +               ret = AE_BAD_PARAMETER;
> +               goto err;
> +       }
> +
> +       sb = &ares->data.i2c_serial_bus;
> +       if (sb->type != ACPI_RESOURCE_SERIAL_TYPE_I2C) {
> +               ret = AE_BAD_PARAMETER;
> +               goto err;
> +       }

Side note: It would be a good candidate to use my (not yet upstreamed) helper.

> +       handle = ACPI_HANDLE(&client->dev);

> +

Remove this blank line.

> +       if (!handle)
> +               return -ENODEV;

> +static void mshw0011_remove_space_handler(struct i2c_client *client)
> +{
> +       acpi_handle handle = ACPI_HANDLE(&client->dev);
> +       struct mshw0011_handler_data *data;
> +       acpi_status status;
> +

I would prefer to see handle assignment here followed by immediate check.

> +       if (!handle)
> +               return;

> +       struct i2c_board_info board_info;
> +       struct device *dev = &client->dev;
> +       struct i2c_client *bat0;

> +

Redundant.

> +       struct mshw0011_data *data;
> +       int error, mask;

> +       data->notify_mask = mask == MSHW0011_EV_2_5;

Since it's a mask, append _MASK and use GENMASK() above.

-- 
With Best Regards,
Andy Shevchenko
