From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] platform/x86: acer-wmi: use true and false for boolean
 values
Date: Mon, 6 Aug 2018 12:24:26 -0500
Message-ID: <bae13020-ca76-ca57-c14c-93e5f64c295d@embeddedor.com>
References: <20180805001839.GA22975@embeddedor.com>
 <CAHp75Vc=HLMVhQ30z9LTM7z+nmYgYPSRJib0PVTVW8H25eYg5g@mail.gmail.com>
 <e92131c3b6e04a848f2a7922719f4747@AcuMS.aculab.com>
 <fa7980ee38e6cbb31883e1b942fa1e1d6f0e72b0.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <fa7980ee38e6cbb31883e1b942fa1e1d6f0e72b0.camel@perches.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>, David Laight <David.Laight@ACULAB.COM>, 'Andy Shevchenko' <andy.shevchenko@gmail.com>
Cc: "Lee, Chun-Yi" <jlee@suse.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org



On 08/06/2018 11:42 AM, Joe Perches wrote:
> On Mon, 2018-08-06 at 16:41 +0000, David Laight wrote:
>> From: Andy Shevchenko
>>> Sent: 05 August 2018 11:26
>>>
>>> On Sun, Aug 5, 2018 at 3:18 AM, Gustavo A. R. Silva
>>> <gustavo@embeddedor.com> wrote:
>>>> Return statements in functions returning bool should use true or false
>>>> instead of an integer value.
>>>>
>>>> This code was detected with the help of Coccinelle.
>>>>  static bool has_cap(u32 cap)
>>>>  {
>>>>         if ((interface->capability & cap) != 0)
>>>> -               return 1;
>>>> +               return true;
>>>>
>>>> -       return 0;
>>>> +       return false;
>>>>  }
>>>
>>> this entire function can be oneliner:
>>>
>>> return !!(...);
>>
>> Why the !! ?? Just:
>> 	return (interface->capability & cap) != 0;
> 
> Because the return is bool you don't need the !! either.
> The compiler does that.
> 

Hi all,

I'll send v2 with the suggested improvements.

Thanks for your feedback.
--
Gustavo
