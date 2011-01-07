From: Yin Kangkai <kangkai.yin@linux.intel.com>
Subject: Re: [PATCH] platform-driver-x86: ACPI EC Extra driver for Oaktrail
Date: Fri, 7 Jan 2011 08:01:48 +0800
Message-ID: <20110107000148.GF30215@kai-debian>
References: <20110106025949.GJ9496@kai-debian>
 <AANLkTi=B1XeBTogjVPWqOSFgJMD72gTpNZgg4znAR0t3@mail.gmail.com>
 <20110106105003.GO9496@kai-debian>
 <AANLkTimyz5VQPwRucrmfKsQtC3sA58mCZKWJNJrZLGhq@mail.gmail.com>
 <4D2642F40200002300026856@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:48524 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753504Ab1AGABw (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 6 Jan 2011 19:01:52 -0500
Content-Disposition: inline
In-Reply-To: <4D2642F40200002300026856@novprvlin0050.provo.novell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joey Lee <jlee@novell.com>, "corentin.chary" <corentin.chary@gmail.com>
Cc: bing.wei.liu@intel.com, yong.y.wang@intel.com, Gary Lin <GLin@novell.com>, mjg@redhat.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

On 2011-01-06, 04:32 -0700, Joey Lee wrote:
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

My fault. they are actually the same. As you can see from function
oaktrail_rfkill_set(), when you use rfkill to block a component, it
write the bit in EC space, just exactly the same as writing files in
/sys/devices/platform..=20

> > oh, sorry then, I didn't understood that.
> >=20
> > So, you're lucky, you can control both the device and the radio. I'=
m
> > not sure what's
> > the best thing to do here, you can probably keep these files here.
> >=20
> > CCing Matthew, he may have something to say about that.

Sorry Corentin Chary, for the confusion.

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

Yeah, thanks Joey and Corentin for the comments, I will remove the
interface (wifi, 3g, bt, gps) from /sys/devices/platform.

Kangkai
