From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: acer-wmi: use true and false for boolean values
Date: Mon, 6 Aug 2018 22:06:44 +0300
Message-ID: <CAHp75VcCDnVjBv_8aFt3y4=6XzX45KWRhc=LZjDPw0LbtMsR7w@mail.gmail.com>
References: <20180805001839.GA22975@embeddedor.com> <CAHp75Vc=HLMVhQ30z9LTM7z+nmYgYPSRJib0PVTVW8H25eYg5g@mail.gmail.com>
 <e92131c3b6e04a848f2a7922719f4747@AcuMS.aculab.com> <fa7980ee38e6cbb31883e1b942fa1e1d6f0e72b0.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <fa7980ee38e6cbb31883e1b942fa1e1d6f0e72b0.camel@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: David Laight <David.Laight@aculab.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, "Lee, Chun-Yi" <jlee@suse.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Aug 6, 2018 at 7:42 PM, Joe Perches <joe@perches.com> wrote:
> On Mon, 2018-08-06 at 16:41 +0000, David Laight wrote:
>> From: Andy Shevchenko
>> > Sent: 05 August 2018 11:26

>> > >  static bool has_cap(u32 cap)
>> > >  {
>> > >         if ((interface->capability & cap) != 0)
>> > > -               return 1;
>> > > +               return true;
>> > >
>> > > -       return 0;
>> > > +       return false;
>> > >  }
>> >
>> > this entire function can be oneliner:
>> >
>> > return !!(...);
>>
>> Why the !! ?? Just:
>>       return (interface->capability & cap) != 0;
>
> Because the return is bool you don't need the !! either.
> The compiler does that.

True, I use that pattern, but in most cases the return value is int
and this is just to guarantee the 0,1 possible range.

-- 
With Best Regards,
Andy Shevchenko
