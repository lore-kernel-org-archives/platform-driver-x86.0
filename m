From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 2/2] platform/x86: silead_dmi - abort early if DMI does
 not match
Date: Tue, 4 Apr 2017 11:54:41 +0200
Message-ID: <2290de15-f841-6815-969c-b80ffc77b01c@redhat.com>
References: <20170404032514.31832-1-dmitry.torokhov@gmail.com>
 <20170404032514.31832-2-dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170404032514.31832-2-dmitry.torokhov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 04-04-17 05:25, Dmitry Torokhov wrote:
> There is no point in registering I2C bus notifier if DMI data does not
> match.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Good idea, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/platform/x86/silead_dmi.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/platform/x86/silead_dmi.c b/drivers/platform/x86/silead_dmi.c
> index 7f1049951d1c..0eeb49e51c43 100644
> --- a/drivers/platform/x86/silead_dmi.c
> +++ b/drivers/platform/x86/silead_dmi.c
> @@ -75,21 +75,16 @@ static const struct dmi_system_id silead_ts_dmi_table[] = {
>  	{ },
>  };
>
> +static const struct silead_ts_dmi_data *silead_ts_data;
> +
>  static void silead_ts_dmi_add_props(struct i2c_client *client)
>  {
> -	const struct dmi_system_id *dmi_id;
> -	const struct silead_ts_dmi_data *ts_data;
>  	int error;
>
> -	dmi_id = dmi_first_match(silead_ts_dmi_table);
> -	if (!dmi_id)
> -		return;
> -
> -	ts_data = dmi_id->driver_data;
>  	if (has_acpi_companion(&client->dev) &&
> -	    !strncmp(ts_data->acpi_name, client->name, I2C_NAME_SIZE)) {
> +	    !strncmp(silead_ts_data->acpi_name, client->name, I2C_NAME_SIZE)) {
>  		error = device_add_properties(&client->dev,
> -					      ts_data->properties);
> +					      silead_ts_data->properties);
>  		if (error)
>  			dev_err(&client->dev,
>  				"failed to add properties: %d\n", error);
> @@ -122,8 +117,15 @@ static struct notifier_block silead_ts_dmi_notifier = {
>
>  static int __init silead_ts_dmi_init(void)
>  {
> +	const struct dmi_system_id *dmi_id;
>  	int error;
>
> +	dmi_id = dmi_first_match(silead_ts_dmi_table);
> +	if (!dmi_id)
> +		return 0; /* Not an error */
> +
> +	silead_ts_data = dmi_id->driver_data;
> +
>  	error = bus_register_notifier(&i2c_bus_type, &silead_ts_dmi_notifier);
>  	if (error)
>  		pr_err("%s: failed to register i2c bus notifier: %d\n",
>
