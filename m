From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v3] Add driver to force WMI Thunderbolt controller power
 status
Date: Fri, 15 Sep 2017 16:34:32 +0000
Message-ID: <614e119265294c4886bddf5c485f0c8c@ausx13mpc120.AMER.DELL.COM>
References: <1504884191-16528-1-git-send-email-mario.limonciello@dell.com>
 <20170913172024.GA8782@wunner.de>
 <27f4070678744d0f80761a95579b4cd3@ausx13mpc120.AMER.DELL.COM>
 <20170914091416.GA28049@wunner.de>
 <58820c0d563845659030881cd44cfe97@ausx13mpc120.AMER.DELL.COM>
 <20170914145919.GU2477@lahna.fi.intel.com> <20170915074439.GA17644@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170915074439.GA17644@wunner.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: lukas@wunner.de, mika.westerberg@linux.intel.com
Cc: dvhart@infradead.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, hughsient@gmail.com, yehezkelshb@gmail.com
List-Id: platform-driver-x86.vger.kernel.org

> -----Original Message-----
> From: Lukas Wunner [mailto:lukas@wunner.de]
> Sent: Friday, September 15, 2017 2:45 AM
> To: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Limonciello, Mario <Mario_Limonciello@Dell.com>; dvhart@infradead.org=
;
> linux-kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org;
> hughsient@gmail.com; yehezkelshb@gmail.com
> Subject: Re: [PATCH v3] Add driver to force WMI Thunderbolt controller po=
wer
> status
>=20
> On Thu, Sep 14, 2017 at 05:59:19PM +0300, Mika Westerberg wrote:
> > On Thu, Sep 14, 2017 at 02:52:27PM +0000, Mario.Limonciello@dell.com wr=
ote:
> > > > Looking at drivers/platform/x86/wmi.c:wmi_dev_uevent() it seems tha=
t
> > > > a modalias consisting of "wmi:" followed by the GUID is sent to ude=
vd.
> > > > For udevd to then load the module, I suspect you need to add a
> > > > MODULE_DEVICE_TABLE(wmi, ...) to your driver.
> > >
> > > Ah, you're looking for this code from the WMI bus driver:
> > >
> https://github.com/torvalds/linux/blob/master/drivers/platform/x86/wmi.c#=
L724
> > >
> > > That happens when the bus is initialized.
> >
> > That's right you get the uevent and whatnot but Lucas means that if you
> > don't have MODULE_DEVICE_TABLE(wmi, ...) in the driver, udev cannot loa=
d
> > the module automatically when the device appears.
>=20
> Digging a bit deeper I notice the wmi drivers seem to solve this by
> directly declaring a MODULE_ALIAS(), which is also present in Mario's
> driver.  Mario, have you tested if auto-loading works if compiled as
> a module?  If so, sorry for the noise.
>=20

Yes, I had tested that and that's why I was really baffled at needing to ad=
d
MODULE_DEVICE_TABLE.  I was going to dig further into this today, but I'm
glad you figured it out.
