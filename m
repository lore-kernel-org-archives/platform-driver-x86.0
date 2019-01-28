From: Mattias Jacobsson <2pi@mok.nu>
Subject: Re: [PATCH v2 1/3] platform/x86: wmi: move struct wmi_device_id to
 mod_devicetable.h
Date: Mon, 28 Jan 2019 14:54:37 +0100
Message-ID: <20190128135437.qetbebros3xkayyn@mok.nu>
References: <cover.1548610407.git.2pi@mok.nu>
 <b40da7d75a8cf02f78db7896e07859e315477120.1548610407.git.2pi@mok.nu>
 <CAHp75Vdsr8aY1ODpZUqR--jAfgRowJz8tbSGwS1SFTH-W4u0XA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75Vdsr8aY1ODpZUqR--jAfgRowJz8tbSGwS1SFTH-W4u0XA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 2pi@mok.nu
List-Id: platform-driver-x86.vger.kernel.org

Hi Andy,

Thanks for reviewing!

On 2019-01-27, Andy Shevchenko wrote:
> On Sun, Jan 27, 2019 at 9:04 PM Mattias Jacobsson <2pi@mok.nu> wrote:
> >
> > In preparation for adding WMI support to MODULE_DEVICE_TABLE() move the
> > definition of struct wmi_device_id to mod_devicetable.h and inline
> > guid_string in the struct.
> >
> > Changing guid_string to an inline char array changes the loop conditions
> > when looping over an array of struct wmi_device_id. Therefore update
> > wmi_dev_match()'s loop to check for an empty guid_string instead of a
> > NULL pointer.
> 
> Below some minor comments.
> 
> > -       while (id->guid_string) {
> > +       while (id->guid_string[0] != '\0') {
> 
> Hmm.. I would rather put it as
> 
> while (*id->guid_string) {

Sure.

> 
> > +#define WMI_MODULE_PREFIX      "wmi:"
> 
> > +#define WMI_GUID_STRING_LEN    36
> 
> Isn't this already defined in UUID namespace?
> (include/linux/uuid.h IIRC)  

Kind of, UUID_STRING_LEN is defined in uuid.h. It is included behind a
#ifdef __KERNEL__, but others seam to use things included through it so
I guess it is alright...

Let me know how you want it.

> 
> >  #include <linux/device.h>
> >  #include <linux/acpi.h>
> 
> > +#include <linux/mod_devicetable.h>
> 
> Not sure it's needed since acpi.h includes that.

It is included in acpi.h(behind CONFIG_ACPI), I thought it was cleaner
with it included explicitly. Plus that we aren't relying on others to
include it.

Let me know how you want it.

> 
> -- 
> With Best Regards,
> Andy Shevchenko

Thanks,
Mattias
