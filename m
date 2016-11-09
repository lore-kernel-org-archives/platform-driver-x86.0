From: Hui Wang <hui.wang@canonical.com>
Subject: Re: [PATCH] thinkpad_acpi: adding new hotkey ID for Lenovo thinkpad
Date: Wed, 9 Nov 2016 08:34:59 +0800
Message-ID: <85ae5e74-ecb0-f851-8f5c-8a7859426347@canonical.com>
References: <1478592803-17522-1-git-send-email-hui.wang@canonical.com>
 <20161108134352.GG8609@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:57152 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751099AbcKIAfL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 8 Nov 2016 19:35:11 -0500
In-Reply-To: <20161108134352.GG8609@khazad-dum.debian.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: dvhart@linux.intel.com, platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net

On 11/08/2016 09:43 PM, Henrique de Moraes Holschuh wrote:
> On Tue, 08 Nov 2016, Hui Wang wrote:
>
>> laptops are not released to market yet), the issue is that the
>> thinkpad_acpi.ko can't be automatically loaded as before.
>>
>> Through debugging, we found the HKEY_HID is LEN0268 instead of
>> LEN0068 on those machines, and the MHKV is 0x200 instead of
>> 0x100. So adding the new ID into the driver.
> This usually means Lenovo expects to have different windows drivers.
> Does thinkpad-acpi work properly on these new thinkpads?

Yes, It works well as before.  And thanks for your review.

Cheers,
Hui.
>
> If it does, you have my
> Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
>
>> Signed-off-by: Hui Wang <hui.wang@canonical.com>
>> ---
>>   drivers/platform/x86/thinkpad_acpi.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
>> index b65ce75..dbd2e27 100644
>> --- a/drivers/platform/x86/thinkpad_acpi.c
>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>> @@ -128,6 +128,7 @@ enum {
>>   /* ACPI HIDs */
>>   #define TPACPI_ACPI_IBM_HKEY_HID	"IBM0068"
>>   #define TPACPI_ACPI_LENOVO_HKEY_HID	"LEN0068"
>> +#define TPACPI_ACPI_LENOVO_HKEY_V2_HID	"LEN0268"
>>   #define TPACPI_ACPI_EC_HID		"PNP0C09"
>>   
>>   /* Input IDs */
>> @@ -4143,6 +4144,7 @@ static int hotkey_write(char *buf)
>>   static const struct acpi_device_id ibm_htk_device_ids[] = {
>>   	{TPACPI_ACPI_IBM_HKEY_HID, 0},
>>   	{TPACPI_ACPI_LENOVO_HKEY_HID, 0},
>> +	{TPACPI_ACPI_LENOVO_HKEY_V2_HID, 0},
>>   	{"", 0},
>>   };
