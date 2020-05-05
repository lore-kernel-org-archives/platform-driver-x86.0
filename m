From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 0/4] support watchdog with longer timeout period
Date: Tue, 5 May 2020 23:24:43 +0300
Message-ID: <CAHp75VdnrUCiK-C9onZOQ0xV=a-ZrPRz-Xmg-euhCRp86tsM2Q@mail.gmail.com>
References: <20200504141427.17685-1-michaelsh@mellanox.com>
 <ac2c580c-7cc0-8091-f3bc-fce175478e50@roeck-us.net> <CAHp75VdN6PfCCmRB_FssTRCoXms7JTt_af59pMqZNgV4ygz_8w@mail.gmail.com>
 <AM6PR05MB50649F646F8A7870160D1973A2A70@AM6PR05MB5064.eurprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AM6PR05MB50649F646F8A7870160D1973A2A70-jHMdEEEsG3Ouy+I/uFoK4dqRiQSDpxhJvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Michael Shych <michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Wim Van Sebroeck <wim-Q8PRGTgFL9WUCWQAtAn6Ix2eb7JE58TQ@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, May 5, 2020 at 9:39 PM Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org> wrote:

> > > Guess the big question is now which branch to use to take this series.
> > > Thoughts, anyone ?
> >
> > count(watchdog) = 8
> > count(platform) = 6
> >
> > Thoughts?
>
> Hi Andy,
>
> We have some more patches we are going to send for platform
> drivers.
> Maybe it's better to take it to platform branch to make further
> merging easier?

It doesn't really matter. Cross subsystem pushes imply immutable branches.


-- 
With Best Regards,
Andy Shevchenko
