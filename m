From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 2/2] platform/x86: silead_dmi - abort early if DMI does
 not match
Date: Fri, 7 Apr 2017 00:47:15 +0300
Message-ID: <CAHp75VeZo-+x3azoZa005fkYSnDQ5dViitdqKAiobEv4cW7JFQ@mail.gmail.com>
References: <20170404032514.31832-1-dmitry.torokhov@gmail.com> <20170404032514.31832-2-dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:32803 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754065AbdDFVrR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 6 Apr 2017 17:47:17 -0400
In-Reply-To: <20170404032514.31832-2-dmitry.torokhov@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Apr 4, 2017 at 6:25 AM, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> There is no point in registering I2C bus notifier if DMI data does not
> match.
>

Both applied to testing.
Please check I didn't mess things up.

Thanks!

> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/platform/x86/silead_dmi.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/platform/x86/silead_dmi.c b/drivers/platform/x86/silead_dmi.c
> index 7f1049951d1c..0eeb49e51c43 100644
> --- a/drivers/platform/x86/silead_dmi.c
> +++ b/drivers/platform/x86/silead_dmi.c
> @@ -75,21 +75,16 @@ static const struct dmi_system_id silead_ts_dmi_table[] = {
>         { },
>  };
>
> +static const struct silead_ts_dmi_data *silead_ts_data;
> +
>  static void silead_ts_dmi_add_props(struct i2c_client *client)
>  {
> -       const struct dmi_system_id *dmi_id;
> -       const struct silead_ts_dmi_data *ts_data;
>         int error;
>
> -       dmi_id = dmi_first_match(silead_ts_dmi_table);
> -       if (!dmi_id)
> -               return;
> -
> -       ts_data = dmi_id->driver_data;
>         if (has_acpi_companion(&client->dev) &&
> -           !strncmp(ts_data->acpi_name, client->name, I2C_NAME_SIZE)) {
> +           !strncmp(silead_ts_data->acpi_name, client->name, I2C_NAME_SIZE)) {
>                 error = device_add_properties(&client->dev,
> -                                             ts_data->properties);
> +                                             silead_ts_data->properties);
>                 if (error)
>                         dev_err(&client->dev,
>                                 "failed to add properties: %d\n", error);
> @@ -122,8 +117,15 @@ static struct notifier_block silead_ts_dmi_notifier = {
>
>  static int __init silead_ts_dmi_init(void)
>  {
> +       const struct dmi_system_id *dmi_id;
>         int error;
>
> +       dmi_id = dmi_first_match(silead_ts_dmi_table);
> +       if (!dmi_id)
> +               return 0; /* Not an error */
> +
> +       silead_ts_data = dmi_id->driver_data;
> +
>         error = bus_register_notifier(&i2c_bus_type, &silead_ts_dmi_notifier);
>         if (error)
>                 pr_err("%s: failed to register i2c bus notifier: %d\n",
> --
> 2.12.2.715.g7642488e1d-goog
>



-- 
With Best Regards,
Andy Shevchenko
