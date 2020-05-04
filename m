From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v3 01/11] iio: light: cm32181: Switch to new style
 i2c-driver probe function
Date: Mon, 4 May 2020 11:46:30 +0200
Message-ID: <4f6df1df-8c82-c14f-8862-c020d67d3df3@redhat.com>
References: <20200428172923.567806-1-hdegoede@redhat.com>
 <20200503115456.11a16411@archlinux>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20200503115456.11a16411@archlinux>
Content-Language: en-US
Sender: linux-acpi-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 5/3/20 12:54 PM, Jonathan Cameron wrote:
> On Tue, 28 Apr 2020 19:29:13 +0200
> Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> Switch to the new style i2c-driver probe_new probe function and drop the
>> unnecessary i2c_device_id table (we do not have any old style board files
>> using this).
>>
>> This is a preparation patch for adding ACPI binding support.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Changes in v3:
>> - This is a new patch in v3 of this patch-set
>> ---
>>   drivers/iio/light/cm32181.c | 15 +++------------
>>   1 file changed, 3 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/iio/light/cm32181.c b/drivers/iio/light/cm32181.c
>> index 5f4fb5674fa0..cc57190a24cb 100644
>> --- a/drivers/iio/light/cm32181.c
>> +++ b/drivers/iio/light/cm32181.c
>> @@ -294,8 +294,7 @@ static const struct iio_info cm32181_info = {
>>   	.attrs			= &cm32181_attribute_group,
>>   };
>>   
>> -static int cm32181_probe(struct i2c_client *client,
>> -			const struct i2c_device_id *id)
>> +static int cm32181_probe(struct i2c_client *client)
>>   {
>>   	struct cm32181_chip *cm32181;
>>   	struct iio_dev *indio_dev;
>> @@ -316,7 +315,7 @@ static int cm32181_probe(struct i2c_client *client,
>>   	indio_dev->channels = cm32181_channels;
>>   	indio_dev->num_channels = ARRAY_SIZE(cm32181_channels);
>>   	indio_dev->info = &cm32181_info;
>> -	indio_dev->name = id->name;
>> +	indio_dev->name = dev_name(&client->dev);
> 
> ABI breakage.  The name needs to be unaffected by this patch and I'm
> fairly sure it just gained the vendor prefix.
> 
> So to drop that table, you need to provide the 'clean' part number
> somewhere else.  Seeing as driver currently only supports one number,
> you could just provide it directly here. However, as you are
> going to add support for another part number later, you'll need
> to do something more clever when you introduce that.

Ok, I will fix this for the next version.

> I'll make this suggestion in that patch, but I think you should add
> a chip_info structure for each of the supported chips rather than using
> a switch to put a number of different elements in place.  The name
> would then go in there.

Ok, I will add a chip_info structure for the next version (version 4).

Regards,

Hans
