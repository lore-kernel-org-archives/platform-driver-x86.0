From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] platform/x86: acer-wmi: use true and false for boolean
 values
Date: Mon, 06 Aug 2018 09:42:56 -0700
Message-ID: <fa7980ee38e6cbb31883e1b942fa1e1d6f0e72b0.camel@perches.com>
References: <20180805001839.GA22975@embeddedor.com>
         <CAHp75Vc=HLMVhQ30z9LTM7z+nmYgYPSRJib0PVTVW8H25eYg5g@mail.gmail.com>
         <e92131c3b6e04a848f2a7922719f4747@AcuMS.aculab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e92131c3b6e04a848f2a7922719f4747@AcuMS.aculab.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Laight <David.Laight@ACULAB.COM>, 'Andy Shevchenko' <andy.shevchenko@gmail.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: "Lee, Chun-Yi" <jlee@suse.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, 2018-08-06 at 16:41 +0000, David Laight wrote:
> From: Andy Shevchenko
> > Sent: 05 August 2018 11:26
> > 
> > On Sun, Aug 5, 2018 at 3:18 AM, Gustavo A. R. Silva
> > <gustavo@embeddedor.com> wrote:
> > > Return statements in functions returning bool should use true or false
> > > instead of an integer value.
> > > 
> > > This code was detected with the help of Coccinelle.
> > >  static bool has_cap(u32 cap)
> > >  {
> > >         if ((interface->capability & cap) != 0)
> > > -               return 1;
> > > +               return true;
> > > 
> > > -       return 0;
> > > +       return false;
> > >  }
> > 
> > this entire function can be oneliner:
> > 
> > return !!(...);
> 
> Why the !! ?? Just:
> 	return (interface->capability & cap) != 0;

Because the return is bool you don't need the !! either.
The compiler does that.
