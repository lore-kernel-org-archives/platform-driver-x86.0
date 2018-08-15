From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] platform/x86: acer-wmi: refactor function has_cap
Date: Wed, 15 Aug 2018 12:54:51 +0300
Message-ID: <CAHp75VeWpXGaMTEmcqCHojEMBUR_k1oHMXZ3+Vc-ydPkH1gW=Q@mail.gmail.com>
References: <20180806203832.GA11751@embeddedor.com> <20180809004410.GF13767@linux-l9pv.suse>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180809004410.GF13767@linux-l9pv.suse>
Sender: linux-kernel-owner@vger.kernel.org
To: joeyli <jlee@suse.com>
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Joe Perches <joe@perches.com>, David Laight <David.Laight@aculab.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Aug 9, 2018 at 3:44 AM, joeyli <jlee@suse.com> wrote:
> Hi Gustavo,
>
> Sorry for my delay!
>
> On Mon, Aug 06, 2018 at 03:38:32PM -0500, Gustavo A. R. Silva wrote:
>> Refactor function has_cap in order to avoid returning integer
>> values, when instead it should return booleans.
>>
>> This code was detected with the help of Coccinelle.
>>
>> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
>
> Thanks for your patch and also thank Andy and Joe's help.
>
> Please feel free to add:
>
> Reviewed-by: "Lee, Chun-Yi" <jlee@suse.com>
>

Pushed to my review and testing queue, thanks!

> Joey Lee
>
>> ---
>> Changes in v2:
>>       Remove parentheses and unnecessary code. Thank you all for
>>       the feedback!
>>
>>  drivers/platform/x86/acer-wmi.c | 5 +----
>>  1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
>> index 8952173..3294bb2 100644
>> --- a/drivers/platform/x86/acer-wmi.c
>> +++ b/drivers/platform/x86/acer-wmi.c
>> @@ -672,10 +672,7 @@ static void __init find_quirks(void)
>>
>>  static bool has_cap(u32 cap)
>>  {
>> -     if ((interface->capability & cap) != 0)
>> -             return 1;
>> -
>> -     return 0;
>> +     return interface->capability & cap;
>>  }
>>
>>  /*
>> --
>> 2.7.4
>>



-- 
With Best Regards,
Andy Shevchenko
