From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 01/11] iio: light: cm32181: Switch to new style
 i2c-driver probe function
Date: Sun, 10 May 2020 10:48:06 +0100
Message-ID: <20200510104806.63ffeae5@archlinux>
References: <20200504125551.434647-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200504125551.434647-1-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "Rafael J . Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Len Brown <lenb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-acpi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon,  4 May 2020 14:55:41 +0200
Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:

> Switch to the new style i2c-driver probe_new probe function and drop the
> unnecessary i2c_device_id table (we do not have any old style board files
> using this).
> 
> This is a preparation patch for adding ACPI binding support.
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Hi Hans,

Seems these have all been sent with mime type of quoted-printable.
As git am really doesn't like that I ended up pulling these down from
patchwork.

Please try and sort that email issue out for future patch sets until
we get git am that works with it in standard distro packages (assuming
it ever does)

Otherwise, a bit of fuzz from the patch that dropped the of_match_ptr
protections.

Series applied to the togreg branch of iio.git and pushed out as testing for
the autobuilders to play with it.

Thanks,

Jonathan


> ---
> Changes in v4:
> - Set indio_dev->name to "cm32181" instead of setting it to dev_name(dev)
> 
> Changes in v3:
> - This is a new patch in v3 of this patch-set
> ---
>  drivers/iio/light/cm32181.c | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/iio/light/cm32181.c b/drivers/iio/light/cm32181.c
> index 5f4fb5674fa0..2c139d85ef0c 100644
> --- a/drivers/iio/light/cm32181.c
> +++ b/drivers/iio/light/cm32181.c
> @@ -294,8 +294,7 @@ static const struct iio_info cm32181_info = {
>  	.attrs			= &cm32181_attribute_group,
>  };
>  
> -static int cm32181_probe(struct i2c_client *client,
> -			const struct i2c_device_id *id)
> +static int cm32181_probe(struct i2c_client *client)
>  {
>  	struct cm32181_chip *cm32181;
>  	struct iio_dev *indio_dev;
> @@ -316,7 +315,7 @@ static int cm32181_probe(struct i2c_client *client,
>  	indio_dev->channels = cm32181_channels;
>  	indio_dev->num_channels = ARRAY_SIZE(cm32181_channels);
>  	indio_dev->info = &cm32181_info;
> -	indio_dev->name = id->name;
> +	indio_dev->name = "cm32181";
>  	indio_dev->modes = INDIO_DIRECT_MODE;
>  
>  	ret = cm32181_reg_init(cm32181);
> @@ -338,13 +337,6 @@ static int cm32181_probe(struct i2c_client *client,
>  	return 0;
>  }
>  
> -static const struct i2c_device_id cm32181_id[] = {
> -	{ "cm32181", 0 },
> -	{ }
> -};
> -
> -MODULE_DEVICE_TABLE(i2c, cm32181_id);
> -
>  static const struct of_device_id cm32181_of_match[] = {
>  	{ .compatible = "capella,cm32181" },
>  	{ }
> @@ -356,8 +348,7 @@ static struct i2c_driver cm32181_driver = {
>  		.name	= "cm32181",
>  		.of_match_table = of_match_ptr(cm32181_of_match),
>  	},
> -	.id_table       = cm32181_id,
> -	.probe		= cm32181_probe,
> +	.probe_new	= cm32181_probe,
>  };
>  
>  module_i2c_driver(cm32181_driver);
