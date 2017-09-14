From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v3] Add driver to force WMI Thunderbolt controller power
 status
Date: Thu, 14 Sep 2017 14:52:27 +0000
Message-ID: <58820c0d563845659030881cd44cfe97@ausx13mpc120.AMER.DELL.COM>
References: <1504884191-16528-1-git-send-email-mario.limonciello@dell.com>
 <20170913172024.GA8782@wunner.de>
 <27f4070678744d0f80761a95579b4cd3@ausx13mpc120.AMER.DELL.COM>
 <20170914091416.GA28049@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa1.dell-outbound.iphmx.com ([68.232.153.90]:9989 "EHLO
        esa1.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751733AbdINOxr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 14 Sep 2017 10:53:47 -0400
In-Reply-To: <20170914091416.GA28049@wunner.de>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: lukas@wunner.de
Cc: dvhart@infradead.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, hughsient@gmail.com, yehezkelshb@gmail.com, mika.westerberg@linux.intel.com

> -----Original Message-----
> From: Lukas Wunner [mailto:lukas@wunner.de]
> Sent: Thursday, September 14, 2017 4:14 AM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: dvhart@infradead.org; linux-kernel@vger.kernel.org; platform-driver-
> x86@vger.kernel.org; hughsient@gmail.com; yehezkelshb@gmail.com;
> mika.westerberg@linux.intel.com
> Subject: Re: [PATCH v3] Add driver to force WMI Thunderbolt controller po=
wer
> status
>=20
> On Thu, Sep 14, 2017 at 06:42:03AM +0000, Mario.Limonciello@dell.com wrot=
e:
> > > On Fri, Sep 08, 2017 at 10:23:11AM -0500, Mario Limonciello wrote:
> > > > +static const struct wmi_device_id intel_wmi_thunderbolt_id_table[]=
 =3D {
> > > > +	{ .guid_string =3D INTEL_WMI_THUNDERBOLT_GUID },
> > > > +	{ },
> > > > +};
> > >
> > > I'm not familiar with WMI, but don't you need a MODULE_DEVICE_TABLE h=
ere?
> > > How does user space know which module to load upon receiving the ueve=
nt?
> >
> > Some macros for WMI bus devices.
> >
> https://github.com/torvalds/linux/blob/e0f25a3f2d052e36ff67a9b4db835c3e27=
e9
> 50d8/include/linux/wmi.h#L55
> > https://github.com/torvalds/linux/blob/master/include/linux/device.h#L1=
487
>=20
> No, the init and exit hooks defined by this macro are executed
> *after* the module has been loaded.  The question was, how does
> the module get loaded in the first place?
>=20
> Looking at drivers/platform/x86/wmi.c:wmi_dev_uevent() it seems that
> a modalias consisting of "wmi:" followed by the GUID is sent to udevd.
> For udevd to then load the module, I suspect you need to add a
> MODULE_DEVICE_TABLE(wmi, ...) to your driver.

Ah, you're looking for this code from the WMI bus driver:
https://github.com/torvalds/linux/blob/master/drivers/platform/x86/wmi.c#L7=
24

That happens when the bus is initialized.
