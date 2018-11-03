From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: Re: [PATCH V6 3/8] misc/pvpanic: add MMIO support
Date: Sat, 3 Nov 2018 17:51:04 +0200
Message-ID: <CAHp75Vc_Ohz9Yu6VbC3YnDTt0uNkqw5xkxusWDx9YjFYMqXGMA@mail.gmail.com>
References: <CAHp75VfxGpR1PWaP+FbTcgxsM8sRgyuCZBjTigZWbxJShFDrxQ@mail.gmail.com>
 <201811031027242806354@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201811031027242806354@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: peng.hao2@zte.com.cn
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, hutao@cn.fujitsu.com, Linux Documentation List <linux-doc@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Nov 3, 2018 at 4:27 AM <peng.hao2@zte.com.cn> wrote:
>
> >>
> >> On some architectures (e.g. arm64), it's preferable to use MMIO, since
> >> this can be used standalone. Add MMIO support to the pvpanic driver.
> >>
> >
> >0day complains b/c of 1st patch in the series.
> >
> >Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> >
> >> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> >
> >This wasn't suggested by me. It's your idea to support to MMIO.
> >
> oh, I just want to express that acpi_dev_resource_memory is your suggestion.
> I misunderstood the use of the "Suggested-by'.

No problem.

Actually there is a room for interpretation.

From my point of view Suggested-by can be used in the following cases:
- idea came from other person
- the implementation of something is heavily based on other person's
view (usually with provided code samples)

In the patch which converts to use specific API idea was mine, but
here I just reviewed one small part of the code, while idea is
completely yours IIUC.

Of course, you are free to give a credit if you would like to do so,
just be little more specific.

-- 
With Best Regards,
Andy Shevchenko
