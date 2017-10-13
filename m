From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH][next] platform/x86: intel_cht_int33fe: make a couple of
 local functions static
Date: Fri, 13 Oct 2017 15:52:04 +0200
Message-ID: <65275ae0-aa42-9b03-4d44-19de6d01a853@redhat.com>
References: <20171011093010.17173-1-colin.king@canonical.com>
 <CAHp75Vf99OOTVqaei6FUUH9P=soNO92XKub4sdDss21PNFGLng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:41944 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753258AbdJMNwH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 13 Oct 2017 09:52:07 -0400
In-Reply-To: <CAHp75Vf99OOTVqaei6FUUH9P=soNO92XKub4sdDss21PNFGLng@mail.gmail.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Colin King <colin.king@canonical.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi,

On 12-10-17 22:36, Andy Shevchenko wrote:
> +Cc: Hans
> 
> On Wed, Oct 11, 2017 at 12:30 PM, Colin King <colin.king@canonical.com> wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> The functions cht_int33fe_check_for_max17047 and cht_int33fe_find_max17047
>> are local to the source and do not need to be in global scope, so make
>> them static.
>>
>> Cleans up sparse warnings:
>> symbol 'cht_int33fe_check_for_max17047' was not declared. Should it be
>> static?
>> symbol 'cht_int33fe_find_max17047' was not declared. Should it be static?
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch looks good to me, thank you for catching this:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



>> ---
>>   drivers/platform/x86/intel_cht_int33fe.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/intel_cht_int33fe.c b/drivers/platform/x86/intel_cht_int33fe.c
>> index 94716b2fbc00..286c6207765d 100644
>> --- a/drivers/platform/x86/intel_cht_int33fe.c
>> +++ b/drivers/platform/x86/intel_cht_int33fe.c
>> @@ -42,7 +42,7 @@ struct cht_int33fe_data {
>>    * These helpers are used to work around this by checking if an i2c-client
>>    * for the max17047 has already been registered.
>>    */
>> -int cht_int33fe_check_for_max17047(struct device *dev, void *data)
>> +static int cht_int33fe_check_for_max17047(struct device *dev, void *data)
>>   {
>>          struct i2c_client **max17047 = data;
>>          struct acpi_device *adev;
>> @@ -62,7 +62,7 @@ int cht_int33fe_check_for_max17047(struct device *dev, void *data)
>>          return 1;
>>   }
>>
>> -struct i2c_client *cht_int33fe_find_max17047(void)
>> +static struct i2c_client *cht_int33fe_find_max17047(void)
>>   {
>>          struct i2c_client *max17047 = NULL;
>>
>> --
>> 2.14.1
>>
> 
> 
> 
