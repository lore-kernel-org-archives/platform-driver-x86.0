From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] power: supply: olpc_battery: fix the power supply name
Date: Fri, 10 Jan 2020 22:52:49 +0200
Message-ID: <CAHp75VezK9xc4ZC3j_Ayaeyi16kntC_CE3K0-Qx-nAVbdY=dKg@mail.gmail.com>
References: <20191221071751.269025-1-lkundrak@v3.sk> <CAHp75VcYoWqvgLv-PmgxqhrHmYOH5=Nru6Msj3rryT=jL+y9xw@mail.gmail.com>
 <1bbf1ea76949f6ef4e856ed799f75d03bf20f293.camel@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1bbf1ea76949f6ef4e856ed799f75d03bf20f293.camel@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: Sebastian Reichel <sre@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Jan 10, 2020 at 10:00 PM Lubomir Rintel <lkundrak@v3.sk> wrote:
> On Thu, 2020-01-09 at 17:09 +0200, Andy Shevchenko wrote:
> > On Sat, Dec 21, 2019 at 9:18 AM Lubomir Rintel <lkundrak@v3.sk> wrote:
> > > The framework is unhappy about them, because it uses the names in sysfs
> > > attributes:
> > >
> > >   power_supply olpc-ac: hwmon: 'olpc-ac' is not a valid name attribute, please fix
> > >   power_supply olpc-battery: hwmon: 'olpc-battery' is not a valid name attribute, please fix
> >
> > I'm wondering if it's an ABI change and how user space is supposed to
> > cope with it.
>
> It changes the sysfs path. It is rather unlikely that udisks or
> anything else userspace cares.
>
> If it does, then I guess the warning that suggests that it's a bug that
> should be fixed should be removed instead.

That said, I'm fine with this as long as power_supply subsystem maintainer does.

-- 
With Best Regards,
Andy Shevchenko
