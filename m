From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 1/2] platform/x86: silead_dmi - do not treat all devices
 as i2c_clients
Date: Tue, 4 Apr 2017 11:54:24 +0200
Message-ID: <410e176d-7609-b38c-cd95-2284d152a82c@redhat.com>
References: <20170404032514.31832-1-dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:58020 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752603AbdDDJy0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 Apr 2017 05:54:26 -0400
In-Reply-To: <20170404032514.31832-1-dmitry.torokhov@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

On 04-04-17 05:25, Dmitry Torokhov wrote:
> I2C bus has both i2c clients and adapter devices, so we must be careful in
> notifier code and verify that we are actually dealing with an i2c client
> before using it as such.
>
> Fixes: cef9dd85acd7 ("platform/x86: add support for devices with Silead...")
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thank you for fixing this, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/platform/x86/silead_dmi.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/platform/x86/silead_dmi.c b/drivers/platform/x86/silead_dmi.c
> index 02e11fdbf375..7f1049951d1c 100644
> --- a/drivers/platform/x86/silead_dmi.c
> +++ b/drivers/platform/x86/silead_dmi.c
> @@ -75,9 +75,8 @@ static const struct dmi_system_id silead_ts_dmi_table[] = {
>  	{ },
>  };
>
> -static void silead_ts_dmi_add_props(struct device *dev)
> +static void silead_ts_dmi_add_props(struct i2c_client *client)
>  {
> -	struct i2c_client *client = to_i2c_client(dev);
>  	const struct dmi_system_id *dmi_id;
>  	const struct silead_ts_dmi_data *ts_data;
>  	int error;
> @@ -87,11 +86,13 @@ static void silead_ts_dmi_add_props(struct device *dev)
>  		return;
>
>  	ts_data = dmi_id->driver_data;
> -	if (has_acpi_companion(dev) &&
> +	if (has_acpi_companion(&client->dev) &&
>  	    !strncmp(ts_data->acpi_name, client->name, I2C_NAME_SIZE)) {
> -		error = device_add_properties(dev, ts_data->properties);
> +		error = device_add_properties(&client->dev,
> +					      ts_data->properties);
>  		if (error)
> -			dev_err(dev, "failed to add properties: %d\n", error);
> +			dev_err(&client->dev,
> +				"failed to add properties: %d\n", error);
>  	}
>  }
>
> @@ -99,10 +100,13 @@ static int silead_ts_dmi_notifier_call(struct notifier_block *nb,
>  				       unsigned long action, void *data)
>  {
>  	struct device *dev = data;
> +	struct i2c_client *client;
>
>  	switch (action) {
>  	case BUS_NOTIFY_ADD_DEVICE:
> -		silead_ts_dmi_add_props(dev);
> +		client = i2c_verify_client(dev);
> +		if (client)
> +			silead_ts_dmi_add_props(client);
>  		break;
>
>  	default:
>
