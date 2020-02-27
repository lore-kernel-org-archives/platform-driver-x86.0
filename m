From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] platform/x86: i2c-multi-instantiate: Replace zero-length
 array with flexible-array member
Date: Thu, 27 Feb 2020 20:01:25 +0100
Message-ID: <582c09ec-a6aa-72fe-7566-7fb70c156c4d@redhat.com>
References: <20200213005525.GA11420@embeddedor.com>
 <f8281f16-b47e-41d6-f67b-1300bc5affff@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f8281f16-b47e-41d6-f67b-1300bc5affff@embeddedor.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi,


On 2/27/20 8:03 PM, Gustavo A. R. Silva wrote:
> Hi all,
> 
> Friendly ping: who can take this?

FWIW, the patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> On 2/12/20 18:55, Gustavo A. R. Silva wrote:
>> The current codebase makes use of the zero-length array language
>> extension to the C90 standard, but the preferred mechanism to declare
>> variable-length types such as these ones is a flexible array member[1][2],
>> introduced in C99:
>>
>> struct foo {
>>          int stuff;
>>          struct boo array[];
>> };
>>
>> By making use of the mechanism above, we will get a compiler warning
>> in case the flexible array does not occur last in the structure, which
>> will help us prevent some kind of undefined behavior bugs from being
>> inadvertently introduced[3] to the codebase from now on.
>>
>> Also, notice that, dynamic memory allocations won't be affected by
>> this change:
>>
>> "Flexible array members have incomplete type, and so the sizeof operator
>> may not be applied. As a quirk of the original implementation of
>> zero-length arrays, sizeof evaluates to zero."[1]
>>
>> This issue was found with the help of Coccinelle.
>>
>> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
>> [2] https://github.com/KSPP/linux/issues/21
>> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
>>
>> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
>> ---
>>   drivers/platform/x86/i2c-multi-instantiate.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/platform/x86/i2c-multi-instantiate.c
>> index ffb8d5d1eb5f..6acc8457866e 100644
>> --- a/drivers/platform/x86/i2c-multi-instantiate.c
>> +++ b/drivers/platform/x86/i2c-multi-instantiate.c
>> @@ -28,7 +28,7 @@ struct i2c_inst_data {
>>   
>>   struct i2c_multi_inst_data {
>>   	int num_clients;
>> -	struct i2c_client *clients[0];
>> +	struct i2c_client *clients[];
>>   };
>>   
>>   static int i2c_multi_inst_count(struct acpi_resource *ares, void *data)
>>
> 
