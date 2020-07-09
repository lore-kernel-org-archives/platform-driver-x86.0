From: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v4] platform: x86: Add ACPI driver for ChromeOS
Date: Thu, 9 Jul 2020 14:01:43 +0200
Message-ID: <CAJZ5v0hH5MFRWuJX=UjevXo1rHh=ca=skHazasKiEZxOVUw1VA@mail.gmail.com>
References: <20200413134611.478441-1-enric.balletbo@collabora.com>
 <CAJZ5v0gWZ27_DwWQadsJOUxLo4a0rAMe45d4AWXS2gHJZfgfKg@mail.gmail.com>
 <a2953d50-da22-279a-f1e4-faa796d815b1@collabora.com> <10490419.gsntqH5CaE@kreacher>
 <4e7f8bf3-b72b-d418-ec95-e1f8c3d61261@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <4e7f8bf3-b72b-d418-ec95-e1f8c3d61261@collabora.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, "Rafael J. Wysocki" <rafael@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Len Brown <lenb@kernel.org>, Collabora Kernel ML <kernel@collabora.com>, Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, Dmitry Torokhov <dtor@chromium.org>, Gwendal Grignou <gwendal@chromium.org>, vbendeb@chromium.org, Andy Shevchenko <andy@infradead.org>, Ayman Bagabas <ayman.bagabas@gmail.com>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, =?UTF-8?Q?Bla=C5=BE_Hrastnik?= <blaz@mxxn.io>, Darren Hart <dvhart@infradead.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jun 10, 2020 at 11:21 PM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> Hi Rafael,
>
> Many thanks for your feedback. See my answers inline.
>
> On 5/6/20 13:17, Rafael J. Wysocki wrote:
> > On Tuesday, April 14, 2020 4:35:38 PM CEST Enric Balletbo i Serra wrote:
> >> Hi Rafael,
> >>
> >> On 13/4/20 22:41, Rafael J. Wysocki wrote:
> >>> On Mon, Apr 13, 2020 at 3:46 PM Enric Balletbo i Serra
> >>> <enric.balletbo@collabora.com> wrote:
> >>>>
> >>>> This driver attaches to the ChromeOS ACPI device and then exports the values
> >>>> reported by the ACPI in a sysfs directory. These values are not exported
> >>>> via the standard ACPI tables, hence a specific driver is needed to do
> >>>> it.
> >>>
> >>> So how exactly are they exported?
> >>>
> >>
> >> They are exported through sysfs.
> >>
> >>>> The ACPI values are presented in the string form (numbers as decimal
> >>>> values) or binary blobs, and can be accessed as the contents of the
> >>>> appropriate read only files in the standard ACPI devices sysfs directory tree.
> >>>
> >>> My understanding based on a cursory look at the patch is that there is
> >>> an ACPI device with _HID equal to "GGL0001"  and one or more special
> >>> methods under it that return values which you want to export over
> >>> sysfs as binary attributes.  They appear to be read-only.
> >>>
> >>
> >> Exactly, there is an ACPI device equal to "GGL0001" and one special method
> >> called MLST that returns a list of the other control methods supported by the
> >> Chrome OS hardware device. The driver calls the special MLST method and goes
> >> through the list.
> >>
> >>> I guess that these data are to be consubed by user space?
> >>>
> >>
> >> Yes, this is used by user space, to be more specific ChromeOS userspace uses it.
> >
> > Well, let me start over.
> >
> > The subject and changelog of this patch are not precise enough IMO and there is
> > not enough information in the latter.
> >
>
> Ok, I can improve that.

Please do.

> > It is not clear what "ACPI driver for ChromeOS" means.  There may be many ACPI
> > drivers in a Linux-based system as a rule.
> >
> > It is unclear what the ChromeOS ACPI device is and why it is there.  Is there
> > any documentation of it you can point me to?
> >
>
> I'm afraid, I don't think there is any documentation, I'll ask around.
>
> > It is unclear what you mean by "These values are not exported via the standard
> > ACPI tables".
> >
> > It looks like (but it is not actually documented in any way) the idea is to
> > get to the ACPI device object with _HID returning "GGL0001", evaluate the
> > MLST method under it and then evaluate the methods listed by it and export the
> > data returned by them via sysfs, under the "GGL0001" device on the "acpi" bus.
> > Is this correct?
> >
>
> Yes, this is correct.
>
> > If so, there is a couple of issues here.
> >
> > First off, GGL0001 is not a valid ACPI device ID, because the GGL prefix is not

[cut]

> > Next, device attributes in sysfs are part of the kernel ABI and once defined,
> > they cannot change (exceptions happen, but rarely), so you must guarantee
> > that whatever appears in there, will always be present for devices with the
> > given device ID in the future in the same format.
> >
> > Can you actually guarantee that?  If so, what is that guarantee based on?
> >
>
> Although is not really documented, can we say that this is a standard "de facto"
> assuming that there are lots of devices in the field and for a long time with
> that? Can this be a guarantee?

I would like the firmware interface to be documented in
Documentation/firmware-guide/acpi/ in the first place, given the lack
of any existing documentation of it that can be pointed to.

Thanks!
