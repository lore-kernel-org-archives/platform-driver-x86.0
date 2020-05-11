From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: your mail
Date: Mon, 11 May 2020 16:40:05 +0300
Message-ID: <CAHp75VdUeBt++mJCvWkHm82XQ+ze1U6OpQ9fv8Hb2d1Nfsz3pw@mail.gmail.com>
References: <526351589195104@mail.yandex.com> <20200511113506.GB2062175@kuha.fi.intel.com>
 <CAHp75VcwUcbtZFQExEoJg9sFFVa_ueUT71SiMCVWetgaQg6kDQ@mail.gmail.com> <5ee2b9ef-25e3-c049-3f82-d3d51d392824@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5ee2b9ef-25e3-c049-3f82-d3d51d392824-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, jakub-FiUXBBwNs2Q@public.gmane.org, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, USB <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, May 11, 2020 at 3:29 PM Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> On 5/11/20 1:44 PM, Andy Shevchenko wrote:

...

> > I would rather disable them and issue a firmware bug.
> > Vendors, including us, should do something sane about this.
>
> I have to partially disagree here. I agree that for future hardware
> versions the firmware team of those devices should offer a saner
> interface. But for the current hardware gen I guess we are stuck
> with this and having a DMI table for popular models (well any model
> a Linux user is willing to submit a quirk for) is better then simply
> not having things working under Linux.
>
> I do wonder what Windows does here though. Perhaps the INT3513 device
> has some ACPI methods to query for more info, like how many Type-C
> controllers there actually are?

I think they do silly things there in usual obscure MS way, i.e.
hardcoding everything in the driver per platform.
That's why I'm really disappointed how things are going on.

-- 
With Best Regards,
Andy Shevchenko
