From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: Re: [PATCH V3 3/5] misc/pvpanic: add MMIO support
Date: Tue, 30 Oct 2018 11:54:03 +0200
Message-ID: <CAHp75VfVitVWoXbUs0gQbv9Ny2gwccON-+qU06YaCs19tF9oAw@mail.gmail.com>
References: <CAHp75VcPmnKRdKVs8E+ov=h3roSvD-CKL7m9EZ6cGJWH1dyk1Q@mail.gmail.com>
 <201810301107515541204@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201810301107515541204@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: peng.hao2@zte.com.cn
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, hutao@cn.fujitsu.com, Linux Documentation List <linux-doc@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Oct 30, 2018 at 5:08 AM <peng.hao2@zte.com.cn> wrote:
> >On Mon, Oct 29, 2018 at 12:54 PM <peng.hao2@zte.com.cn> wrote:

> >I would consider it as a bug if on some architectures iounmap() is not
> >able to take a base got from ioport_map().

> I added TYPE_PVPANIC_MMIO in QEMU to the architecture that does not support IOPORT.
>  If some architectures does not support IOPORT, set TYPE_PVPANIC_MMIO in qemu. This setting is reflected in the kernel pvpanic driver
> and does not invoke ioport_map (calling ioremap).  So I think the situation you described above will not happen.

> But I should  resume one check like this to deal with the failure of ioremap/ioport_map.
>      if (base)
>            iounmap(base)

I'm a bit confused, how come that base == NULL when you about to call
iounmap()? Where you would like to put this check?

> The patch of QEMU is still in review.

-- 
With Best Regards,
Andy Shevchenko
