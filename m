From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v3 01/11] iio: light: cm32181: Switch to new style
 i2c-driver probe function
Date: Sun, 3 May 2020 11:54:56 +0100
Message-ID: <20200503115456.11a16411@archlinux>
References: <20200428172923.567806-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20200428172923.567806-1-hdegoede@redhat.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, 28 Apr 2020 19:29:13 +0200
Hans de Goede <hdegoede@redhat.com> wrote:

> Switch to the new style i2c-driver probe_new probe function and drop the
> unnecessary i2c_device_id table (we do not have any old style board files
> using this).
> 
> This is a preparation patch for adding ACPI binding support.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v3:
> - This is a new patch in v3 of this patch-set
> ---
>  drivers/iio/light/cm32181.c | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/iio/light/cm32181.c b/drivers/iio/light/cm32181.c
> index 5f4fb5674fa0..cc57190a24cb 100644
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
> +	indio_dev->name = dev_name(&client->dev);

ABI breakage.  The name needs to be unaffected by this patch and I'm 
fairly sure it just gained the vendor prefix.

So to drop that table, you need to provide the 'clean' part number
somewhere else.  Seeing as driver currently only supports one number,
you could just provide it directly here. However, as you are
going to add support for another part number later, you'll need
to do something more clever when you introduce that. 

I'll make this suggestion in that patch, but I think you should add
a chip_info structure for each of the supported chips rather than using
a switch to put a number of different elements in place.  The name
would then go in there.

Jonathan


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
