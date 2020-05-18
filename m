From: Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: your mail
Date: Mon, 18 May 2020 16:35:30 +0300
Message-ID: <20200518133530.GB1298122@kuha.fi.intel.com>
References: <526351589195104@mail.yandex.com>
 <20200511113506.GB2062175@kuha.fi.intel.com>
 <CAHp75VcwUcbtZFQExEoJg9sFFVa_ueUT71SiMCVWetgaQg6kDQ@mail.gmail.com>
 <5ee2b9ef-25e3-c049-3f82-d3d51d392824@redhat.com>
 <CAHp75VdUeBt++mJCvWkHm82XQ+ze1U6OpQ9fv8Hb2d1Nfsz3pw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAHp75VdUeBt++mJCvWkHm82XQ+ze1U6OpQ9fv8Hb2d1Nfsz3pw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jakub-FiUXBBwNs2Q@public.gmane.org
Cc: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, USB <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi Jakub,

On Mon, May 11, 2020 at 04:40:05PM +0300, Andy Shevchenko wrote:
> On Mon, May 11, 2020 at 3:29 PM Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> > On 5/11/20 1:44 PM, Andy Shevchenko wrote:
> 
> ...
> 
> > > I would rather disable them and issue a firmware bug.
> > > Vendors, including us, should do something sane about this.
> >
> > I have to partially disagree here. I agree that for future hardware
> > versions the firmware team of those devices should offer a saner
> > interface. But for the current hardware gen I guess we are stuck
> > with this and having a DMI table for popular models (well any model
> > a Linux user is willing to submit a quirk for) is better then simply
> > not having things working under Linux.
> >
> > I do wonder what Windows does here though. Perhaps the INT3513 device
> > has some ACPI methods to query for more info, like how many Type-C
> > controllers there actually are?
> 
> I think they do silly things there in usual obscure MS way, i.e.
> hardcoding everything in the driver per platform.
> That's why I'm really disappointed how things are going on.

I've been trying to figure out which exact NUC10i3 your NUC is? I
can't find a NUC10i3 that uses Comet Lake -S?

If your NUC isn't actually "-S" variant, then the ACPI device entry
with HID INT3515 should return 0 from its _STA method.

But can you please share the full name of your board (like NUC10i3FNH
or something like that - should read on the bottom of the device).
Also, dmesg output would be useful.

thanks,

-- 
heikki
