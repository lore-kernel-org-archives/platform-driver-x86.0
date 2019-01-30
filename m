From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 1/1] platform/mellanox: Add bootctl driver for Mellanox
 BlueField Soc
Date: Wed, 30 Jan 2019 23:17:09 +0200
Message-ID: <CAHp75VcsYsxSfUT6Sc9-59gXaQRXs0ugpPRAvAzFr2+DYJHeCg@mail.gmail.com>
References: <0b74e9ad12360b56bc0a3c2ca972798c424f2610.1548790896.git.lsun@mellanox.com>
 <CAHp75VfpmBMmR_zU8JxN3Apb__QyWXyU9wD8e03z0N3TTRpMYg@mail.gmail.com> <DB6PR05MB32230728A361BD68D14D7B69A1900@DB6PR05MB3223.eurprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB6PR05MB32230728A361BD68D14D7B69A1900@DB6PR05MB3223.eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liming Sun <lsun@mellanox.com>
Cc: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Vadim Pasternak <vadimp@mellanox.com>, David Woods <dwoods@mellanox.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jan 30, 2019 at 10:47 PM Liming Sun <lsun@mellanox.com> wrote:

> > First of all, is it a real watchdog with a driver? I think watchdog in
> > that case should be set up through standard watchdog facilities.
>
> This is not a watchdog driver itself. Instead, it provides interface to
> user-space and use ARM SMC calls to ATF to configure registers and
> watchdog. I'll update the commit message in v2 to clarify it.

Hmm... For example Intel MID platforms have SCU (system controller
unit) that provides a watchdog facility. In the kernel we have a
watchdog driver for that.
Can't you do similar for your case?

> > > +       if (mlxbf_bootctl_smc_call1(MLXBF_BOOTCTL_SET_POST_RESET_WDOG,
> > > +                                   watchdog) < 0)
> > > +               return -EINVAL;
> >
> > If that call returns an error it shouldn't be shadowed here.
>
> Not sure I understand this comment correctly or not.
> This function is defined by DRIVER_ATTR_RW(), which appears to expect
> ssize_t or an error code as return value according to other examples I saw.

What is returned by mlx...call1() should be propagated to the actual caller.
Same comment for all similar cases.

> > > +       lc_state &= (MLXBF_BOOTCTL_SB_MODE_TEST_MASK |
> > > +                    MLXBF_BOOTCTL_SB_MODE_SECURE_MASK);
> >
> > Better to split like
> >
> > xxx =
> >  (A | B);
>
> It seems hard to do "(A | B);" within 80 characters plus the indents.

Repeating myself, it's still better than your variant for readability.

> > > +       if (res.a0 != 0x89c036b4 || res.a1 != 0x11e6e7d7 ||
> > > +           res.a2 != 0x1a009787 || res.a3 != 0xc4bf00ca)
> >
> > What is this?!
> >
> > Can you use UUID API?
>
> Yes, it is UUID comparison. The SMC call returns four 'unsigned long' from ATF
> to represent the UUID. There seems no existing APIs in uapi/linux/uuid.h to
> compare such special format. How about replacing it with comment and MACROs
> instead of the hardcoded values to make it more readable?

Should be no magic numbers involved inside the function at the end.
Use descriptive definitions and I still recommend to give a look at
UUID API how it can be utilized here.
(hint: Thunderbolt hw is operating with integers, though driver uses
UUID API at the end)

-- 
With Best Regards,
Andy Shevchenko
