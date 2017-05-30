From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: intel_cht_int33fe: Set supplied-from
 property on max17047 dev
Date: Tue, 30 May 2017 16:22:58 +0300
Message-ID: <CAHp75Vd9SemUag28T3hp==2ZyWLt8+1C0oeBfS69yRGpoBUQNw@mail.gmail.com>
References: <20170526105348.16763-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:36309 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751572AbdE3NXA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 30 May 2017 09:23:00 -0400
In-Reply-To: <20170526105348.16763-1-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, May 26, 2017 at 1:53 PM, Hans de Goede <hdegoede@redhat.com> wrote:
> Devices with the intel_cht_int33fe ACPI device use a max17047 fuel-gauge
> combined with a bq24272i charger, in order for the fuel-gauge driver to
> correctly display charging / discharging status it needs to know which
> charger is supplying the battery.
>
> This commit sets the supplied-from device property to the name of the
> bq24272i charger for this.

Pushed to testing, thanks!

>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/intel_cht_int33fe.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/platform/x86/intel_cht_int33fe.c b/drivers/platform/x86/intel_cht_int33fe.c
> index 6a1b2ca5b6fe..da706e2c4232 100644
> --- a/drivers/platform/x86/intel_cht_int33fe.c
> +++ b/drivers/platform/x86/intel_cht_int33fe.c
> @@ -34,6 +34,13 @@ struct cht_int33fe_data {
>         struct i2c_client *pi3usb30532;
>  };
>
> +static const char * const max17047_suppliers[] = { "bq24190-charger" };
> +
> +static const struct property_entry max17047_props[] = {
> +       PROPERTY_ENTRY_STRING_ARRAY("supplied-from", max17047_suppliers),
> +       { }
> +};
> +
>  static int cht_int33fe_probe(struct i2c_client *client)
>  {
>         struct device *dev = &client->dev;
> @@ -70,6 +77,7 @@ static int cht_int33fe_probe(struct i2c_client *client)
>
>         memset(&board_info, 0, sizeof(board_info));
>         strlcpy(board_info.type, "max17047", I2C_NAME_SIZE);
> +       board_info.properties = max17047_props;
>
>         data->max17047 = i2c_acpi_new_device(dev, 1, &board_info);
>         if (!data->max17047)
> --
> 2.13.0
>



-- 
With Best Regards,
Andy Shevchenko
