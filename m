From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v4 10/11] iio: light: cm32181: Add support for parsing
 CPM0 and CPM1 ACPI tables
Date: Tue, 12 May 2020 10:26:20 +0200
Message-ID: <7dc53183-d3e8-3437-5ac2-a5b74dea643e@redhat.com>
References: <20200504125551.434647-1-hdegoede@redhat.com>
 <20200504125551.434647-10-hdegoede@redhat.com>
 <20200511202023.45f2d130@archlinux>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200511202023.45f2d130@archlinux>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 5/11/20 9:20 PM, Jonathan Cameron wrote:
> On Mon,  4 May 2020 14:55:50 +0200
> Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> On ACPI based systems the CPLM3218 ACPI device node describing the
>> CM3218[1] sensor typically will have some extra tables with register
>> init values for initializing the sensor and calibration info.
>>
>> This is based on a newer version of cm32181.c, with a copyright of:
>>
>>   * Copyright (C) 2014 Capella Microsystems Inc.
>>   * Author: Kevin Tsai <ktsai@capellamicro.com>
>>   *
>>   * This program is free software; you can redistribute it and/or modify it
>>   * under the terms of the GNU General Public License version 2, as published
>>   * by the Free Software Foundation.
>>
>> Which is floating around on the net in various places, but the changes
>> from this newer version never made it upstream.
>>
>> This was tested on the following models: Acer Switch 10 SW5-012 (CM32181)
>> Asus T100TA (CM3218), Asus T100CHI (CM3218) and HP X2 10-n000nd (CM32181).
>>
>> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> Tiny thing 0-day picked up that I've just fixed and pushed out.
> 
>> ---
>> Changes in v2:
>> - Factor out the parsing into a separate helper function
>> ---
>>   drivers/iio/light/cm32181.c | 101 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 101 insertions(+)
>>
>> diff --git a/drivers/iio/light/cm32181.c b/drivers/iio/light/cm32181.c
>> index a0812e3cba9b..5eeefa3ee4f1 100644
>> --- a/drivers/iio/light/cm32181.c
>> +++ b/drivers/iio/light/cm32181.c
>> @@ -4,6 +4,7 @@
>>    * Author: Kevin Tsai <ktsai@capellamicro.com>
>>    */
>>   
>> +#include <linux/acpi.h>
>>   #include <linux/delay.h>
>>   #include <linux/err.h>
>>   #include <linux/i2c.h>
>> @@ -53,6 +54,15 @@
>>   
>>   #define SMBUS_ALERT_RESPONSE_ADDRESS	0x0c
>>   
>> +/* CPM0 Index 0: device-id (3218 or 32181), 1: Unknown, 2: init_regs_bitmap */
>> +#define CPM0_REGS_BITMAP		2
>> +#define CPM0_HEADER_SIZE		3
>> +
>> +/* CPM1 Index 0: lux_per_bit, 1: calibscale, 2: resolution (100000) */
>> +#define CPM1_LUX_PER_BIT		0
>> +#define CPM1_CALIBSCALE			1
>> +#define CPM1_SIZE			3
>> +
>>   struct cm32181_chip_info {
>>   	const char *name;
>>   	const int *als_it_bits;
>> @@ -61,6 +71,7 @@ struct cm32181_chip_info {
>>   };
>>   
>>   struct cm32181_chip {
>> +	struct device *dev;
>>   	struct i2c_client *client;
>>   	const struct cm32181_chip_info *info;
>>   	struct mutex lock;
>> @@ -95,6 +106,92 @@ const struct cm32181_chip_info cm32181_chip_info = {
>>   	.num_als_it = ARRAY_SIZE(cm32181_als_it_bits),
>>   };
>>   
>> +static int cm32181_read_als_it(struct cm32181_chip *cm32181, int *val2);
>> +
>> +#ifdef CONFIG_ACPI
>> +/**
>> + * cm32181_acpi_get_cpm() - Get CPM object from ACPI
>> + * @client	pointer of struct i2c_client.
>> + * @obj_name	pointer of ACPI object name.
>> + * @count	maximum size of return array.
>> + * @vals	pointer of array for return elements.
>> + *
>> + * Convert ACPI CPM table to array.
>> + *
>> + * Return: -ENODEV for fail.  Otherwise is number of elements.
>> + */
>> +static int cm32181_acpi_get_cpm(struct device *dev, char *obj_name,
>> +				u64 *values, int count)
>> +{
>> +	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
>> +	union acpi_object *cpm, *elem;
>> +	acpi_handle handle;
>> +	acpi_status status;
>> +	int i;
>> +
>> +	handle = ACPI_HANDLE(dev);
>> +	if (!handle)
>> +		return -ENODEV;
>> +
>> +	status = acpi_evaluate_object(handle, obj_name, NULL, &buffer);
>> +	if (ACPI_FAILURE(status)) {
>> +		dev_err(dev, "object %s not found\n", obj_name);
>> +		return -ENODEV;
>> +	}
>> +
>> +	cpm = buffer.pointer;
>> +	if (cpm->package.count > count)
>> +		dev_warn(dev, "%s table contains %d values, only using first %d values\n",
>> +			 obj_name, cpm->package.count, count);
> 
> cpm->package.count is unsigned.

Ok, thank you for letting me know.

Regards,

Hans
