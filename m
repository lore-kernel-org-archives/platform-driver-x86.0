From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/8] iio: light: cm32181: Handle ACPI instantiating a
 cm32181 client on the SMBus ARA
Date: Sun, 26 Apr 2020 20:43:32 +0300
Message-ID: <CAHp75VezxOatMRyLa8DQEYOK=QT8RgD3ET_kqDp+tL9q9fJw1g@mail.gmail.com>
References: <20200426110256.218186-1-hdegoede@redhat.com> <20200426110256.218186-3-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200426110256.218186-3-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "Rafael J . Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Len Brown <lenb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Kevin Tsai <ktsai-GubuWUlQtMwciDkP5Hr2oA@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, ACPI Devel Maling List <linux-acpi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, linux-iio <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Apr 26, 2020 at 2:03 PM Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>
> Some ACPI systems list 2 I2C resources for the CM3218 sensor. On these
> systems the first I2cSerialBus ACPI-resource points to the SMBus Alert
> Response Address (ARA, 0x0c) and the second I2cSerialBus ACPI-resource
> points to the actual CM3218 sensor address.
>
> From the ACPI/x86 side devices with more then 1 I2cSerialBus ACPI-resource
> are handled by the drivers/platform/x86/i2c-multi-instantiate.c code.
> This code will instantiate "cm32181" i2c_client-s for both resources.
>
> Add a check to cm32181_probe() for the client's address being the ARA
> address, and in that case fail the probe with -ENODEV.
>
> On these ACPI systems the sensor may have a SMBus Alert asserted at boot,
> if this is the case the sensor will not respond to any i2c_transfers on
> its actual address until we read from the ARA register to clear the Alert.
>
> Therefor we must (try to) read a byte from the client with the ARA
> register, before returning -ENODEV, so that we clear the Alert and when
> we get called again for the client instantiated for the second
> I2cSerialBus ACPI-resource the sensor will respond to our i2c-transfers.
>
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/iio/light/cm32181.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/drivers/iio/light/cm32181.c b/drivers/iio/light/cm32181.c
> index fd371b36c7b3..e8be20d3902c 100644
> --- a/drivers/iio/light/cm32181.c
> +++ b/drivers/iio/light/cm32181.c
> @@ -51,6 +51,8 @@
>  #define CM32181_CALIBSCALE_RESOLUTION  1000
>  #define MLUX_PER_LUX                   1000
>
> +#define SMBUS_ALERT_RESPONSE_ADDRESS   0x0c
> +
>  static const u8 cm32181_reg[CM32181_CONF_REG_NUM] = {
>         CM32181_REG_ADDR_CMD,
>  };
> @@ -333,6 +335,20 @@ static int cm32181_probe(struct i2c_client *client,
>         struct iio_dev *indio_dev;
>         int ret;
>
> +       /*
> +        * Some ACPI systems list 2 I2C resources for the CM3218 sensor, the
> +        * SMBus Alert Response Address (ARA, 0x0c) and the actual I2C address.
> +        * drivers/platform/x86/i2c-multi-instantiate.c instantiates "cm32181"

> +        * i2c_client-s for both resources, ignore the ARA client.

A nit: 'I2C clients'

> +        * On these systems the sensor may have a SMBus Alert asserted at boot,
> +        * in that case the ARA must be read to clear the Alert otherwise the
> +        * sensor will not respond on its actual I2C address.
> +        */
> +       if (client->addr == SMBUS_ALERT_RESPONSE_ADDRESS) {
> +               i2c_smbus_read_byte(client);
> +               return -ENODEV;
> +       }
> +
>         indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*cm32181));
>         if (!indio_dev) {
>                 dev_err(&client->dev, "devm_iio_device_alloc failed\n");
> --
> 2.26.0
>


-- 
With Best Regards,
Andy Shevchenko
