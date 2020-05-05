From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] Add support for Vinga Twizzle J116 Silead touchscreen
Date: Tue, 5 May 2020 11:01:27 +0200
Message-ID: <f4aeeb2c-32c4-e2a8-193e-2b4d892da4db@redhat.com>
References: <20200504164514.18641-1-a@dun.ai>
 <72bd44ab-98a8-0cdc-b7e6-104a69ca3643@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <72bd44ab-98a8-0cdc-b7e6-104a69ca3643@infradead.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>, Andrew Dunai <a@dun.ai>, linux-kernel@vger.kernel.org, Platform Driver <platform-driver-x86@vger.kernel.org>
Cc: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 5/4/20 8:20 PM, Randy Dunlap wrote:
> Hi,
> 
> Usually you need to send patches to a maintainer who could then
> merge/apply them.

 From a code point-of-view this looks good to me.

Andrew, if you can resend this to the proper folks (including me)
with a proper Signed-off-by (*), then this should be ready for merging.

Regards,

Hans


*) that might have already been there, but it wasn't present in
the part quoted by Randy



> On 5/4/20 9:45 AM, Andrew Dunai wrote:
>> ---
>>   drivers/platform/x86/touchscreen_dmi.c | 21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
>> index 93177e6e5..a3ab19ab0 100644
>> --- a/drivers/platform/x86/touchscreen_dmi.c
>> +++ b/drivers/platform/x86/touchscreen_dmi.c
>> @@ -640,6 +640,20 @@ static const struct ts_dmi_data trekstor_surftab_wintron70_data = {
>>   	.properties	= trekstor_surftab_wintron70_props,
>>   };
>>   
>> +static const struct property_entry vinga_twizzle_j116_props[] = {
>> +	PROPERTY_ENTRY_U32("touchscreen-size-x", 1920),
>> +	PROPERTY_ENTRY_U32("touchscreen-size-y", 1280),
>> +	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-vinga-twizzle_j116.fw"),
>> +	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
>> +	PROPERTY_ENTRY_BOOL("silead,home-button"),
>> +	{ }
>> +};
>> +
>> +static const struct ts_dmi_data vinga_twizzle_j116_data = {
>> +	.acpi_name	= "MSSL1680:00",
>> +	.properties	= vinga_twizzle_j116_props,
>> +};
>> +
>>   /* NOTE: Please keep this table sorted alphabetically */
>>   static const struct dmi_system_id touchscreen_dmi_table[] = {
>>   	{
>> @@ -1054,6 +1068,13 @@ static const struct dmi_system_id touchscreen_dmi_table[] = {
>>   			DMI_MATCH(DMI_PRODUCT_NAME, "Y8W81"),
>>   		},
>>   	},
>> +	{
>> +		/* Vinga Twizzle J116 */
>> +		.driver_data = (void *)&vinga_twizzle_j116_data,
>> +		.matches = {
>> +			DMI_MATCH(DMI_PRODUCT_NAME, "VINGA Twizzle J116"),
>> +		},
>> +	},
>>   	{ },
>>   };
>>   
>>
> 
> thanks.
> 
