From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 1/3] platform/x86: wmi: move struct wmi_device_id to mod_devicetable.h
Date: Mon, 28 Jan 2019 18:01:42 +0200
Message-ID: <CAHp75Vco3sCDVC6QTf8FbOpwzOtoAO699fvdSCJv7G8HOVZEjg@mail.gmail.com>
References: <cover.1548610407.git.2pi@mok.nu> <b40da7d75a8cf02f78db7896e07859e315477120.1548610407.git.2pi@mok.nu>
 <CAHp75Vdsr8aY1ODpZUqR--jAfgRowJz8tbSGwS1SFTH-W4u0XA@mail.gmail.com> <20190128135437.qetbebros3xkayyn@mok.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190128135437.qetbebros3xkayyn@mok.nu>
Sender: linux-kernel-owner@vger.kernel.org
To: Mattias Jacobsson <2pi@mok.nu>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jan 28, 2019 at 3:55 PM Mattias Jacobsson <2pi@mok.nu> wrote:
> On 2019-01-27, Andy Shevchenko wrote:
> > On Sun, Jan 27, 2019 at 9:04 PM Mattias Jacobsson <2pi@mok.nu> wrote:

> > > +#define WMI_GUID_STRING_LEN    36
> >
> > Isn't this already defined in UUID namespace?
> > (include/linux/uuid.h IIRC)
>
> Kind of, UUID_STRING_LEN is defined in uuid.h. It is included behind a
> #ifdef __KERNEL__, but others seam to use things included through it so
> I guess it is alright...
>
> Let me know how you want it.

On one hand I think too many places with the same information is not
good. On the other hand WMI might change this limit in the future and
on top of this it seems you are sharing it with user space.
However, file2alias.c includes kernel header directly and uses a
duplicate definition for cases !__KERNEL__.

So, I would do that way.
Use in mod_devicetable.h the definition from uuid.h (which is already
included there), and duplicate the same definition in file2alias.c in
the way it's done for the rest UUID stuff there.

> > >  #include <linux/acpi.h>
> >
> > > +#include <linux/mod_devicetable.h>
> >
> > Not sure it's needed since acpi.h includes that.
>
> It is included in acpi.h(behind CONFIG_ACPI), I thought it was cleaner
> with it included explicitly. Plus that we aren't relying on others to
> include it.
>
> Let me know how you want it.

Since it's minor, it's up to you. Ideally we would better to split out
that inclusion from acpi.h and explicitly do this in all similar
cases, but it's not ours call here.
That said, your variant is okay.

-- 
With Best Regards,
Andy Shevchenko
