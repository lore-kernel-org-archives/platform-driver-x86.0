From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH 2/3] platform/x86: dell-wmi: add new keymap type 0x0012
Date: Fri, 19 Jun 2020 17:26:06 +0000
Message-ID: <1bf60afb825a4a4abd5b4e6c278ac710@AUSX13MPC105.AMER.DELL.COM>
References: <cover.1591584631.git.y.linux@paritcher.com>
 <0dc191a3d16f0e114f6a8976433e248018e10c43.1591584631.git.y.linux@paritcher.com>
 <83fe431cacbc4708962767668ac8f06f@AUSX13MPC105.AMER.DELL.COM>
 <79bd59ee-dd37-bdc5-f6b4-00f2c33fdcff@paritcher.com>
 <7f9f0410696141cfabb0237d33b7b529@AUSX13MPC105.AMER.DELL.COM>
 <20200609154938.udo7mn7ka7z7pr6c@pali>
 <20200609164533.qtup47io2aoc5hgl@earth.universe>
 <136a06e3-0f00-d252-ebdd-a76c8a575db8@redhat.com>
 <20200619153103.k4ewdaljqubcrvvc@earth.universe>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200619153103.k4ewdaljqubcrvvc@earth.universe>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: sebastian.reichel@collabora.com, hdegoede@redhat.com
Cc: pali@kernel.org, y.linux@paritcher.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-pm@vger.kernel.org, mjg59@srcf.ucam.org
List-Id: platform-driver-x86.vger.kernel.org

> >
> > This is not so much about non-genuine as about the adapter having
> > the wrong wattage. E.g. plugging a 65W adapter in a laptop which
> > has a 45W CPU + a 35W discrete GPU will not allow the laptop to
> > really charge while it is in use.
>=20
> Ok. So how much information is available over WMI? Exposing the
> max. input power via the power-supply API makes sense in any case.

WMI is event driven.  You plug in the adapter and the platform will
evaluate its power needs and advertise it to the OS in the event.

It's important to note this is not a fixed value.
For example if you have a dock connected the power needs might be higher.

>=20
> > One issue I see with doing this in the power_supply class is that
> > the charger is represented by the standard ACPI AC adapter stuff,
> > which does not have this info. This sort of extra info comes from
> > WMI. Now we could have the WMI driver register a second power_supply
> > device, but that means having 2 power_supply devices representing
> > the 1 AC adapter which does not feel right.
>=20
> I agree. WMI and ACPI information need to be merged and exposed
> as one device to userspace. It's not the first time we have this
> kind of requirement, but so far it was about merging battery info
> from two places. Unfortunately no code has been written so far to
> support this.
>=20
> > I was myself actually thinking more along the lines of adding a
> > new mechanism to the kernel where the kernel can send messages
> > to userspace (either with some special tag inside dmesg, or through
> > a new mechanism) indication that the message should be shown
> > as a notification (dialog/bubble/whatever) inside the UI.
> >
> > This could be useful for this adapter case, but e.g. also for
> > pluging a thunderbolt device into a non thunderbolt capable
> > Type-C port, a superspeed USB device into a USB-2 only USB
> > port and probably other cases.
> >
> > Rather then inventing separate userspace APIs for all these
> > cases having a general notification mechanism might be
> > quite useful for this (as long as the kernel does not
> > over use it).
>=20
> I don't think this is a good idea. It brings all kind of
> localization problems. Also the information is not machine
> parsable. It looks more like a hack to get things working
> quickly by avoiding using/designing proper APIs.

When you have the data to populate in sysfs at init time I
would agree, but at least in this case it's not always
static data that can be queried on demand.  You would have
to wait until the first event comes around and populate
some kernel structures for the sysfs attributes to read from
at that time.

As a similar suggestion to Hans', what about letting the kernel
advertise a table of fixed printf style strings for translation?
When the dynamic data comes in the event can just be an index to one
of those strings and the data in the following bytes.  Userland
could then map the strings accordingly.

Running with this concept, it could even be an overhaul to your typical
content in dmesg to allow errors and info messages to be translatable too.
