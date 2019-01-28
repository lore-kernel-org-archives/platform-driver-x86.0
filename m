From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: wmi: fix potential null pointer dereferences
Date: Mon, 28 Jan 2019 17:49:34 +0200
Message-ID: <CAHp75Vdjq5S3gdk7iPEsbmAvxL1nVxxNSnTQ1O0KLxZ4uTH_tw@mail.gmail.com>
References: <20190122200302.19861-1-2pi@mok.nu> <CAHp75Vfv1sMyAQn=ue0hroqAnbkhQayCj64xNBHO5PRRv53GSA@mail.gmail.com>
 <20190128143845.2gneic5ip5b56mwv@mok.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190128143845.2gneic5ip5b56mwv@mok.nu>
Sender: linux-kernel-owner@vger.kernel.org
To: Mattias Jacobsson <2pi@mok.nu>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jan 28, 2019 at 4:39 PM Mattias Jacobsson <2pi@mok.nu> wrote:
> On 2019-01-27, Andy Shevchenko wrote:
> > On Tue, Jan 22, 2019 at 10:04 PM Mattias Jacobsson <2pi@mok.nu> wrote:

> > > -       struct wmi_driver *wmi_driver =
> > > -               container_of(driver, struct wmi_driver, driver);
> >
> > AFAIU this is just a pointer arithmetics, no need to move it.
>
> That is my understanding too, it seamed backwards to do the NULL check
> afterwards, but we still have access to dev and driver. So why not...
>
> >
> > > -       struct wmi_block *wblock = dev_to_wblock(dev);
> >
> > > -       const struct wmi_device_id *id = wmi_driver->id_table;
> > > +       const struct wmi_device_id *id;
> > > +       struct wmi_block *wblock;
> > > +       struct wmi_driver *wmi_driver;
> > > +
> >
> > > +       if (dev == NULL || driver == NULL)
> > > +               return 0;
> >
> > On which circumstances this may ever happen?
>
> Nothing in particular. If there is a bug in the caller of this function,
> then that is when this will come into play. See my earlier mail to
> Darren too.

So, I suggest in these cases do not touch existing till the actual
problem will be discovered and proved.
I.o.w. touch only place which you have real problem, and describe this
issue in commit message.

-- 
With Best Regards,
Andy Shevchenko
