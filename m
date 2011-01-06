From: "Joey Lee" <jlee@novell.com>
Subject: Re: [PATCH] platform-driver-x86: ACPI EC Extra driver for
 Oaktrail
Date: Thu, 06 Jan 2011 04:35:54 -0700
Message-ID: <4D2643CA020000230002685F@novprvlin0050.provo.novell.com>
References: <20110106025949.GJ9496@kai-debian>
 <AANLkTi=B1XeBTogjVPWqOSFgJMD72gTpNZgg4znAR0t3@mail.gmail.com>
 <20110106105003.GO9496@kai-debian>
 <AANLkTimyz5VQPwRucrmfKsQtC3sA58mCZKWJNJrZLGhq@mail.gmail.com>
 <4D2642F40200002300026856@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <4D2642F40200002300026856@novprvlin0050.provo.novell.com>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: kangkai.yin@linux.intel.com
Cc: corentin.chary@gmail.com, bing.wei.liu@intel.com, yong.y.wang@intel.com, Gary Lin <GLin@novell.com>, mjg@redhat.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

Hi Yin Kangkai,=20

=E6=96=BC =E5=9B=9B=EF=BC=8C2011-01-06 =E6=96=BC 04:32 -0700=EF=BC=8CJo=
ey Lee =E6=8F=90=E5=88=B0=EF=BC=9A
> Hi Yin Kangkai,=20
>=20
> =E6=96=BC =E5=9B=9B=EF=BC=8C2011-01-06 =E6=96=BC 11:54 +0100=EF=BC=8C=
Corentin Chary =E6=8F=90=E5=88=B0=EF=BC=9A
> > On Thu, Jan 6, 2011 at 11:50 AM, Yin Kangkai
> > <kangkai.yin@linux.intel.com> wrote:
> > > On 2011-01-06, 08:29 +0100, Corentin Chary wrote:
> > >> > + * gps - GPS subsystem enabled: contains either 0 or 1. (rw)
> > >> > + * wifi - WiFi subsystem enabled: contains either 0 or 1. (rw=
)
> > >> > + * wwan - WWAN (3G) subsystem enabled: contains either 0 or 1=
=2E (rw)
> > >>
> > >> Is there a reason do add these files in /sys/devices/platform wh=
ile the
> > >> functionality is already provided by rfkill ?
> > >
> > > This is not the same functionality.
> > >
> > > enable/disable using files in /sys/devices/platform will complete=
ly
> > > cut power of those components. For example, if disabled, you can =
not
> > > list out those components using lsusb. Can we achieve this using
> > > rfkill?
> > >
> >=20
> > oh, sorry then, I didn't understood that.
> >=20
> > So, you're lucky, you can control both the device and the radio. I'=
m
> > not sure what's
> > the best thing to do here, you can probably keep these files here.
> >=20
> > CCing Matthew, he may have something to say about that.
> >=20
> >=20
>=20
> We should used rfkill to provide interface to userland for
> enable/disable wlan/bluetooth/wwan. You can set the killswitch state =
to
> soft block when your driver call EC function to disable devices.
>=20
> Udev/HAL will forward the killswitch change event to userland, then
> userland application can do some response, e.g. show up OSD.
> And, userland app also can control killswitch by /dev/rfkill.
>=20
> There also have a urfkill daemon to provide DBus to userland app for
> control killswitch:
>  http://freedesktop.org/wiki/Software/urfkill
>=20
> Use rfkill interface is more standard then create special sysfs file
> in /sys/devices/platform/intel_oaktrail.=20
>=20

Sorry, forgot said.=20
I think the rfkill is good enough for userland and don't need have
special sysfs interface in /sys/devices/platform...


Thank's a lot
Joey Lee
