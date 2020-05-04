From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v3 06/11] iio: light: cm32181: Handle CM3218 ACPI devices
 with 2 I2C resources
Date: Mon, 4 May 2020 11:52:46 +0200
Message-ID: <447a98f7-ef54-98a9-6ac2-c6132a4b5b7d@redhat.com>
References: <20200428172923.567806-1-hdegoede@redhat.com>
 <20200428172923.567806-6-hdegoede@redhat.com>
 <20200503120439.113d2cd2@archlinux>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20200503120439.113d2cd2@archlinux>
Content-Language: en-US
Sender: linux-acpi-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 5/3/20 1:04 PM, Jonathan Cameron wrote:
> On Tue, 28 Apr 2020 19:29:18 +0200
> Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> Some ACPI systems list 2 I2C resources for the CM3218 sensor. On these
>> systems the first I2cSerialBus ACPI-resource points to the SMBus Alert
>> Response Address (ARA, 0x0c) and the second I2cSerialBus ACPI-resource
>> points to the actual CM3218 sensor address:
>>
>>   Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
>>   {
>>       Name (SBUF, ResourceTemplate ()
>>       {
> 
> I have a vague recollection that we had case of this where they could
> come in either order.  Could that happen here?

Not to the best of my knowledge. I've only seen this
construct on a couple of Asus models and they are all consistent.

> My mind may be playing tricks on me of course and that may never
> happen...
> 
> Did I ever mention how much the lack of spec for some of these corner
> cases annoys me?

Yes I think you have mentioned before. Unfortunately there
is nothing we can do about this, but I hear you.

Regards,

Hans


> 
> J
> 
>>           I2cSerialBusV2 (0x000C, ControllerInitiated, 0x00061A80,
>>               AddressingMode7Bit, "\\_SB.I2C3",
>>               0x00, ResourceConsumer, , Exclusive,
>>               )
>>           I2cSerialBusV2 (0x0048, ControllerInitiated, 0x00061A80,
>>               AddressingMode7Bit, "\\_SB.I2C3",
>>               0x00, ResourceConsumer, , Exclusive,
>>               )
>>           Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
>>           {
>>               0x00000033,
>>           }
>>       })
>>       Return (SBUF) /* \_SB_.I2C3.ALSD._CRS.SBUF */
>>   }
>>
>> Detect this and take the following step to deal with it:
>>
>> 1. When a SMBus Alert capable sensor has an Alert asserted, it will
>>     not respond on its actual I2C address. Read a byte from the ARA
>>     to clear any pending Alerts.
>>
>> 2. Create a "dummy" client for the actual I2C address and
>>     use that client to communicate with the sensor.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Changes in v3:
>> - Create and use a dummy client instead of relying on i2c-multi-instantiate
>>    to create 2 separate clients for the 2 I2C resources
>>
>> Changes in v2
>> - s/i2c_client-s/I2C clients/ in added comment
>> ---
>>   drivers/iio/light/cm32181.c | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>
>> diff --git a/drivers/iio/light/cm32181.c b/drivers/iio/light/cm32181.c
>> index 8fe49610fc26..c23a5c3a86a3 100644
>> --- a/drivers/iio/light/cm32181.c
>> +++ b/drivers/iio/light/cm32181.c
>> @@ -51,6 +51,8 @@
>>   #define CM32181_CALIBSCALE_RESOLUTION	1000
>>   #define MLUX_PER_LUX			1000
>>   
>> +#define SMBUS_ALERT_RESPONSE_ADDRESS	0x0c
>> +
>>   static const u8 cm32181_reg[CM32181_CONF_REG_NUM] = {
>>   	CM32181_REG_ADDR_CMD,
>>   };
>> @@ -335,6 +337,26 @@ static int cm32181_probe(struct i2c_client *client)
>>   	if (!indio_dev)
>>   		return -ENOMEM;
>>   
>> +	/*
>> +	 * Some ACPI systems list 2 I2C resources for the CM3218 sensor, the
>> +	 * SMBus Alert Response Address (ARA, 0x0c) and the actual I2C address.
>> +	 * Detect this and take the following step to deal with it:
>> +	 * 1. When a SMBus Alert capable sensor has an Alert asserted, it will
>> +	 *    not respond on its actual I2C address. Read a byte from the ARA
>> +	 *    to clear any pending Alerts.
>> +	 * 2. Create a "dummy" client for the actual I2C address and
>> +	 *    use that client to communicate with the sensor.
>> +	 */
>> +	if (ACPI_HANDLE(dev) && client->addr == SMBUS_ALERT_RESPONSE_ADDRESS) {
>> +		struct i2c_board_info board_info = { .type = "dummy" };
>> +
>> +		i2c_smbus_read_byte(client);
>> +
>> +		client = i2c_acpi_new_device(dev, 1, &board_info);
>> +		if (IS_ERR(client))
>> +			return PTR_ERR(client);
>> +	}
>> +
>>   	cm32181 = iio_priv(indio_dev);
>>   	cm32181->client = client;
>>   
> 
