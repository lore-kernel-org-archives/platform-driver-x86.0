From: Gabriel C <nix.or.die@gmail.com>
Subject: Re: acer_wmi: Unknown function(s) on Acer Nitro 5 (AN515-43-R8BF)
Date: Wed, 25 Sep 2019 22:10:55 +0200
Message-ID: <CAEJqkgiZo6jyrpRnUYGUXY_hdtPQ1nmCXFkUQ0uyG4RKvV+W+w@mail.gmail.com>
References: <CAEJqkgjSes-4bSKbyfbNhXfcQwdEMzp8X4f72_SS=NpBoBtWmQ@mail.gmail.com>
 <20190925075026.GY3878@linux-l9pv.suse>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190925075026.GY3878@linux-l9pv.suse>
Sender: linux-kernel-owner@vger.kernel.org
To: Joey Lee <JLee@suse.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Am Mi., 25. Sept. 2019 um 09:53 Uhr schrieb Joey Lee <JLee@suse.com>:
>
> Hi Gabriel,
>
> On Mon, Sep 23, 2019 at 09:45:05PM +0200, Gabriel C wrote:
> > Hi guys,
> >
> > I noticed some warning in dmesg on this Laptop.
> >
> > Fn+right, Fn+left is BrightnessDown/Up and produce the following warning:
> >
> > acer_wmi: Unknown function number - 4 - 0
> >
> > The brightness has some other issue on this Laptop but not sure
> > who to blame on this. Probably amdgpu.?
> >
> > /sys/class/backlight/amdgpu_bl1/brightness <-> actual_brightness
> > seems to mismatch.  EG: when brightness is 0 actual_brightness is still 5140.
> >
>
> Base on _BCM and _BQC in your DSDT. The backlight control is handled by EC.
> But, in some Acer machines that the _BCM is broken. You can try to modify
> brighess by echo to sys/class/backlight/acpi_video0/brightness

Unfortunately, the only thing in /sys/class/backlight is amdgpu_bl1.
Basically I should have 2 , acpi_video0 & acpi_video1 however none there.

>
> > Unplugging the AC gives the following warning:
> >
> > acer_wmi: Unknown function number - 8 - 0
> >
> > When plugging the AC back I see;
> >
> > acer_wmi: Unknown function number - 8 - 1.
> >
> > I uploaded a dump of the acpi tables and dmidecode of the box.
> >
> > https://www.frugalware.org/~crazy/nitro5/ACPI
> > https://www.frugalware.org/~crazy/nitro5/DMI
> >
> > Please let me know if you need any other informations.
> >
>
> Thanks for your report the behavior for the function 4 and function 8.
> Maybe we can use the platform event to do something. e.g. expose key code
> to userland. Unfortunately my working list is too long that I do not have
> time for it currently.
>

Is fine, no worry. Take your time. Things are working more or less so no rush.

Just one thing. While it is fine to report the Unknow functions/keys by default
once reported upstream the user may want to silence these until implemented.
In my case using the keys for the brightness floods the dmesg with
these messages.

Would be  maybe is possible to have some 'do_not_bug_me' module
parameter to silence the
Unknow functions/keys messages?

> Thanks a lot!
> Joey Lee

BR,

Gabriel C
