From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/2] platform/x86: silead_dmi - do not treat all devices
 as i2c_clients
Date: Tue, 4 Apr 2017 16:45:05 +0300
Message-ID: <CAHp75Vc62q7a+0CS3S9TNm+CVPodqG6HT9yoq0d8RBQ0B72REw@mail.gmail.com>
References: <20170404032514.31832-1-dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170404032514.31832-1-dmitry.torokhov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Apr 4, 2017 at 6:25 AM, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> I2C bus has both i2c clients and adapter devices, so we must be careful in
> notifier code and verify that we are actually dealing with an i2c client
> before using it as such.

> -static void silead_ts_dmi_add_props(struct device *dev)
> +static void silead_ts_dmi_add_props(struct i2c_client *client)
>  {

> -       struct i2c_client *client = to_i2c_client(dev);

I would replace this by
struct device *dev = &client->dev;

Otherwise looks good for me.

>         const struct dmi_system_id *dmi_id;
>         const struct silead_ts_dmi_data *ts_data;
>         int error;
> @@ -87,11 +86,13 @@ static void silead_ts_dmi_add_props(struct device *dev)
>                 return;
>
>         ts_data = dmi_id->driver_data;
> -       if (has_acpi_companion(dev) &&
> +       if (has_acpi_companion(&client->dev) &&
>             !strncmp(ts_data->acpi_name, client->name, I2C_NAME_SIZE)) {
> -               error = device_add_properties(dev, ts_data->properties);
> +               error = device_add_properties(&client->dev,
> +                                             ts_data->properties);
>                 if (error)
> -                       dev_err(dev, "failed to add properties: %d\n", error);
> +                       dev_err(&client->dev,
> +                               "failed to add properties: %d\n", error);
>         }



-- 
With Best Regards,
Andy Shevchenko
