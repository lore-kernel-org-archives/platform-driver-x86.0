From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 2/2] platform/mellanox: mlxreg-hotplug: convert to use i2c_new_client_device()
Date: Sun, 26 Apr 2020 11:34:00 +0300
Message-ID: <CAHp75VeRcT31WbVM6qXHFtT5aF+d6SbAVWVrH8g1_+ruNvv2sQ@mail.gmail.com>
References: <20200326210952.12857-1-wsa+renesas@sang-engineering.com>
 <20200326210952.12857-3-wsa+renesas@sang-engineering.com> <CAHp75Vfw4_0ttE2F-WxdULf7hRGsQvqzCLdCNVy7RBaFdEsCGA@mail.gmail.com>
 <20200425205407.GA6774@kunai>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200425205407.GA6774@kunai>
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c <linux-i2c@vger.kernel.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Vadim Pasternak <vadimp@mellanox.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Apr 25, 2020 at 11:54 PM Wolfram Sang <wsa@the-dreams.de> wrote:
>
> On Fri, Mar 27, 2020 at 09:38:21AM +0200, Andy Shevchenko wrote:
> > On Thu, Mar 26, 2020 at 11:10 PM Wolfram Sang
> > <wsa+renesas@sang-engineering.com> wrote:
> > >
> > > Move away from the deprecated API and return the shiny new ERRPTR where
> > > useful.
> > >
> >
> > Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>
> Thanks, Andy! Is there a platform-x86-tree where this can go in? Or
> shall I take it via the I2C tree?

platform/mellanox usually goes via other trees, so, feel free to carry on.

> Same question for the similar patch
> for x86/platform/intel-mid?

TIP maintainers usually take this. If I didn't tag it, feel free to add my Rb.

-- 
With Best Regards,
Andy Shevchenko
