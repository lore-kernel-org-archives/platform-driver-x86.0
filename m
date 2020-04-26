From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 7/8] iio: light: cm32181: Add support for parsing CPM0 and
 CPM1 ACPI tables
Date: Sun, 26 Apr 2020 20:50:21 +0300
Message-ID: <CAHp75Vdzu18gKaix2B5btEAz6YX7JZ3wJfeSR-MAV6nLeJUMzg@mail.gmail.com>
References: <20200426110256.218186-1-hdegoede@redhat.com> <20200426110256.218186-7-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20200426110256.218186-7-hdegoede@redhat.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Kevin Tsai <ktsai@capellamicro.com>, Jonathan Cameron <jic23@kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio <linux-iio@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Apr 26, 2020 at 2:03 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> On ACPI based systems the CPLM3218 ACPI device node describing the
> CM3218[1] sensor typically will have some extra tables with register
> init values for initializing the sensor and calibration info.
>
> This is based on a newer version of cm32181.c, with a copyright of:
>
>  * Copyright (C) 2014 Capella Microsystems Inc.
>  * Author: Kevin Tsai <ktsai@capellamicro.com>
>  *
>  * This program is free software; you can redistribute it and/or modify it
>  * under the terms of the GNU General Public License version 2, as published
>  * by the Free Software Foundation.
>
> Which is floating around on the net in various places, but the changes
> from this newer version never made it upstream.
>
> This was tested on the following models: Acer Switch 10 SW5-012 (CM32181)
> Asus T100TA (CM3218), Asus T100CHI (CM3218) and HP X2 10-n000nd (CM32181).
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/iio/light/cm32181.c | 98 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
>
> diff --git a/drivers/iio/light/cm32181.c b/drivers/iio/light/cm32181.c
> index e5674d4a8143..878fc13632d8 100644
> --- a/drivers/iio/light/cm32181.c
> +++ b/drivers/iio/light/cm32181.c
> @@ -4,6 +4,7 @@
>   * Author: Kevin Tsai <ktsai@capellamicro.com>
>   */
>
> +#include <linux/acpi.h>
>  #include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/i2c.h>
> @@ -53,6 +54,15 @@
>
>  #define SMBUS_ALERT_RESPONSE_ADDRESS   0x0c
>
> +/* CPM0 Index 0: device-id (3218 or 32181), 1: Unknown, 2: init_regs_bitmap */
> +#define CPM0_REGS_BITMAP               2
> +#define CPM0_HEADER_SIZE               3
> +
> +/* CPM1 Index 0: lux_per_bit, 1: calibscale, 2: resolution (100000) */
> +#define CPM1_LUX_PER_BIT               0
> +#define CPM1_CALIBSCALE                        1
> +#define CPM1_SIZE                      3
> +
>  /* CM3218 Family */
>  static const int cm3218_als_it_bits[] = { 0, 1, 2, 3 };
>  static const int cm3218_als_it_values[] = { 100000, 200000, 400000, 800000 };
> @@ -76,6 +86,56 @@ struct cm32181_chip {
>         const int *als_it_values;
>  };
>
> +static int cm32181_read_als_it(struct cm32181_chip *cm32181, int *val2);
> +
> +#ifdef CONFIG_ACPI
> +/**
> + * cm32181_acpi_get_cpm() - Get CPM object from ACPI
> + * @client     pointer of struct i2c_client.
> + * @obj_name   pointer of ACPI object name.
> + * @count      maximum size of return array.
> + * @vals       pointer of array for return elements.
> + *
> + * Convert ACPI CPM table to array.
> + *
> + * Return: -ENODEV for fail.  Otherwise is number of elements.
> + */
> +static int cm32181_acpi_get_cpm(struct i2c_client *client, char *obj_name,
> +                               u64 *values, int count)
> +{
> +       struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
> +       union acpi_object *cpm, *elem;
> +       acpi_handle handle;
> +       acpi_status status;
> +       int i;
> +
> +       handle = ACPI_HANDLE(&client->dev);
> +       if (!handle)
> +               return -ENODEV;
> +
> +       status = acpi_evaluate_object(handle, obj_name, NULL, &buffer);
> +       if (ACPI_FAILURE(status)) {
> +               dev_err(&client->dev, "object %s not found\n", obj_name);
> +               return -ENODEV;
> +       }
> +
> +       cpm = buffer.pointer;
> +       if (cpm->package.count > count)
> +               dev_warn(&client->dev, "%s table contains %d values, only using first %d values\n",
> +                        obj_name, cpm->package.count, count);
> +
> +       count = min_t(int, cpm->package.count, count);
> +       for (i = 0; i < count; i++) {
> +               elem = &(cpm->package.elements[i]);
> +               values[i] = elem->integer.value;
> +       }
> +
> +       kfree(buffer.pointer);
> +
> +       return count;
> +}
> +#endif /* CONFIG_ACPI */
> +
>  /**
>   * cm32181_reg_init() - Initialize CM32181 registers
>   * @cm32181:   pointer of struct cm32181.
> @@ -121,6 +181,44 @@ static int cm32181_reg_init(struct cm32181_chip *cm32181)
>         cm32181->lux_per_bit = CM32181_LUX_PER_BIT;
>         cm32181->lux_per_bit_base_it = CM32181_LUX_PER_BIT_BASE_IT;
>
> +#ifdef CONFIG_ACPI
> +       if (ACPI_HANDLE(&client->dev)) {
> +               u64 values[CPM0_HEADER_SIZE + CM32181_CONF_REG_NUM];
> +               int count;
> +
> +               count = cm32181_acpi_get_cpm(client, "CPM0",
> +                                            values, ARRAY_SIZE(values));
> +               if (count <= CPM0_HEADER_SIZE)
> +                       goto cpm_parsing_done;
> +
> +               count -= CPM0_HEADER_SIZE;
> +
> +               cm32181->init_regs_bitmap = values[CPM0_REGS_BITMAP];
> +               cm32181->init_regs_bitmap &= GENMASK(count - 1, 0);
> +               for (i = 0; i < count; i++) {
> +                       if (cm32181->init_regs_bitmap & BIT(i))
> +                               cm32181->conf_regs[i] =
> +                                       values[CPM0_HEADER_SIZE + i];
> +               }
> +
> +               count = cm32181_acpi_get_cpm(client, "CPM1",
> +                                            values, ARRAY_SIZE(values));
> +               if (count != CPM1_SIZE)
> +                       goto cpm_parsing_done;
> +
> +               cm32181->lux_per_bit = values[CPM1_LUX_PER_BIT];
> +
> +               /* Check for uncalibrated devices */
> +               if (values[CPM1_CALIBSCALE] == CM32181_CALIBSCALE_DEFAULT)
> +                       goto cpm_parsing_done;
> +
> +               cm32181->calibscale  = values[CPM1_CALIBSCALE];
> +               /* CPM1 lux_per_bit is for the current it value */
> +               cm32181_read_als_it(cm32181, &cm32181->lux_per_bit_base_it);
> +       }
> +cpm_parsing_done:

Perhaps factor out to a helper, will
a) allow to get rid of a label;
b) drop indentation level.

> +#endif /* CONFIG_ACPI */
> +
>         /* Initialize registers*/
>         for (i = 0; i < CM32181_CONF_REG_NUM; i++) {
>                 if (cm32181->init_regs_bitmap & BIT(i)) {
> --
> 2.26.0
>


-- 
With Best Regards,
Andy Shevchenko
