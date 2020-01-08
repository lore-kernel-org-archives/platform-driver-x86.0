From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 2/2] platform/x86: GPD pocket fan: Allow somewhat
 lower/higher temperature limits
Date: Wed, 8 Jan 2020 14:05:49 +0100
Message-ID: <2df70a79-10e1-ea9e-0425-dcc46c1e28bc@redhat.com>
References: <20200106144219.525215-1-hdegoede@redhat.com>
 <20200106144219.525215-2-hdegoede@redhat.com>
 <CAHp75Ve5XF-UZw6D-OUCkgOPMYH0DgT1L5uVNGRuLmZ6Cjd1KA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Ve5XF-UZw6D-OUCkgOPMYH0DgT1L5uVNGRuLmZ6Cjd1KA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jason Anderson <jasona.594@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 08-01-2020 13:23, Andy Shevchenko wrote:
> On Mon, Jan 6, 2020 at 4:42 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Allow the user to configure the fan to turn on / speed-up at lower
>> thresholds then before (20 degrees Celcius as minimum instead of 40) and
>> likewise also allow the user to delay the fan speeding-up till the
>> temperature hits 90 degrees Celcius (was 70).
>>
>> Cc: Jason Anderson <jasona.594@gmail.com>
> 
>> Reported-by: Jason Anderson <jasona.594@gmail.com>
> 
> My understanding of this tag that the report assumes a bug to fix
> followed up with a corresponding Fixes tag.

Well in a way the old min/max for the limits being to strict a bug
and Jason pointed this out so I want to give him credit for that.

OTHO Fixes: feels a little bit to strong, even without a Cc: stable
tag, commits with Fixes: in there are almost guaranteed to be picked
up for the stable series and in this case that seems unnecessary to me.

If you do want to add a Fixes: tag then adding the one from patch 1/2
makes the most sense.

Regards,

Hans



> 
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/platform/x86/gpd-pocket-fan.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/gpd-pocket-fan.c b/drivers/platform/x86/gpd-pocket-fan.c
>> index 1e6a42f2ea8a..0ffcbf9bc18e 100644
>> --- a/drivers/platform/x86/gpd-pocket-fan.c
>> +++ b/drivers/platform/x86/gpd-pocket-fan.c
>> @@ -126,7 +126,7 @@ static int gpd_pocket_fan_probe(struct platform_device *pdev)
>>          int i;
>>
>>          for (i = 0; i < ARRAY_SIZE(temp_limits); i++) {
>> -               if (temp_limits[i] < 40000 || temp_limits[i] > 70000) {
>> +               if (temp_limits[i] < 20000 || temp_limits[i] > 90000) {
>>                          dev_err(&pdev->dev, "Invalid temp-limit %d (must be between 40000 and 70000)\n",
>>                                  temp_limits[i]);
>>                          temp_limits[0] = TEMP_LIMIT0_DEFAULT;
>> --
>> 2.24.1
>>
> 
> 
