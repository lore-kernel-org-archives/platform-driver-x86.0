From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 05/11] iio: light: cm32181: Clean up the probe
 function a bit
Date: Sun, 3 May 2020 12:00:19 +0100
Message-ID: <20200503120019.4cf7ecdd@archlinux>
References: <20200428172923.567806-1-hdegoede@redhat.com>
        <20200428172923.567806-5-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200428172923.567806-5-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "Rafael J . Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Len Brown <lenb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-acpi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, 28 Apr 2020 19:29:17 +0200
Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:

> 3 small cleanups to cm32181_probe():
> 
> 1. Do not log an error when we fail to allocate memory (as a general
> rule drivers do not log errors for this as the kernel will already
> have complained loudly that it could not alloc the mem).
> 
> 2. Remove the i2c_set_clientdata() call, we never use i2c_get_clientdata()
> or dev_get_drvdata() anywhere.
> 
> 3. Add a dev helper variable and use it in various places instead of
> &client->dev.
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
looks fine to me.

J

> ---
> Changes in v3:
> - This is a new patch in v3 of this patch-set
> ---
>  drivers/iio/light/cm32181.c | 22 ++++++++--------------
>  1 file changed, 8 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/iio/light/cm32181.c b/drivers/iio/light/cm32181.c
> index 065bc7a11f84..8fe49610fc26 100644
> --- a/drivers/iio/light/cm32181.c
> +++ b/drivers/iio/light/cm32181.c
> @@ -326,41 +326,35 @@ static const struct iio_info cm32181_info = {
>  
>  static int cm32181_probe(struct i2c_client *client)
>  {
> +	struct device *dev = &client->dev;
>  	struct cm32181_chip *cm32181;
>  	struct iio_dev *indio_dev;
>  	int ret;
>  
> -	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*cm32181));
> -	if (!indio_dev) {
> -		dev_err(&client->dev, "devm_iio_device_alloc failed\n");
> +	indio_dev = devm_iio_device_alloc(dev, sizeof(*cm32181));
> +	if (!indio_dev)
>  		return -ENOMEM;
> -	}
>  
>  	cm32181 = iio_priv(indio_dev);
> -	i2c_set_clientdata(client, indio_dev);
>  	cm32181->client = client;
>  
>  	mutex_init(&cm32181->lock);
> -	indio_dev->dev.parent = &client->dev;
> +	indio_dev->dev.parent = dev;
>  	indio_dev->channels = cm32181_channels;
>  	indio_dev->num_channels = ARRAY_SIZE(cm32181_channels);
>  	indio_dev->info = &cm32181_info;
> -	indio_dev->name = dev_name(&client->dev);
> +	indio_dev->name = dev_name(dev);
>  	indio_dev->modes = INDIO_DIRECT_MODE;
>  
>  	ret = cm32181_reg_init(cm32181);
>  	if (ret) {
> -		dev_err(&client->dev,
> -			"%s: register init failed\n",
> -			__func__);
> +		dev_err(dev, "%s: register init failed\n", __func__);
>  		return ret;
>  	}
>  
> -	ret = devm_iio_device_register(&client->dev, indio_dev);
> +	ret = devm_iio_device_register(dev, indio_dev);
>  	if (ret) {
> -		dev_err(&client->dev,
> -			"%s: regist device failed\n",
> -			__func__);
> +		dev_err(dev, "%s: regist device failed\n", __func__);
>  		return ret;
>  	}
>  
