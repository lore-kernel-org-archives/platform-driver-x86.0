From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] platform/x86: surface3_power: i2c_acpi_new_device()
 returns a PTR_ERR
Date: Tue, 21 Apr 2020 09:40:07 +0200
Message-ID: <b01d598f-f3ae-b092-3be8-07e178370289@redhat.com>
References: <20200420220421.171298-1-hdegoede@redhat.com>
 <CAHp75VfC7-saRXnGDpee1dxAqDSDcveHMoC872WN9-SL4sDH4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VfC7-saRXnGDpee1dxAqDSDcveHMoC872WN9-SL4sDH4Q@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 4/21/20 12:33 AM, Andy Shevchenko wrote:
> On Tue, Apr 21, 2020 at 1:04 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> i2c_acpi_new_device() never returns NULL, it either returns an i2c_client
>> or a PTR_ERR. Adjust the mshw0011_probe() error handling to take this
>> into account.
>>
>> Note the goto out_err will cause i2c_unregister_device() to get called
>> even though the i2c_acpi_new_device() fails, this is ok as it accepts
>> a NULL pointer argument (and treats it as a no-op).
>>
> 
> Thanks, I guess it repeats [1].
> 
> [1]: http://git.infradead.org/linux-platform-drivers-x86.git/commitdiff/4dbccb873f2b35ad1b26419ff88c80509e2d4cbb

I guess it does and Dan's solution for the error handling is
claner then mine, a direct return indeed is the proper thing
to do here.

Regards,

Hans



> 
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/platform/x86/surface3_power.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/surface3_power.c b/drivers/platform/x86/surface3_power.c
>> index 946ac2dc08ae..32e6e86e27dd 100644
>> --- a/drivers/platform/x86/surface3_power.c
>> +++ b/drivers/platform/x86/surface3_power.c
>> @@ -522,8 +522,10 @@ static int mshw0011_probe(struct i2c_client *client)
>>          strlcpy(board_info.type, "MSHW0011-bat0", I2C_NAME_SIZE);
>>
>>          bat0 = i2c_acpi_new_device(dev, 1, &board_info);
>> -       if (!bat0)
>> -               return -ENOMEM;
>> +       if (IS_ERR(bat0)) {
>> +               error = PTR_ERR(bat0);
>> +               goto out_err;
>> +       }
>>
>>          data->bat0 = bat0;
>>          i2c_set_clientdata(bat0, data);
>> --
>> 2.26.0
>>
> 
> 
