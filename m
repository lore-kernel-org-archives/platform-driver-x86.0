From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v4 05/14] platform/x86: dell-wmi-descriptor: split WMI
 descriptor into it's own driver
Date: Thu, 5 Oct 2017 17:32:00 +0000
Message-ID: <15914f9166ad43b9af91f0fcf504ce80@ausx13mpc120.AMER.DELL.COM>
References: <cover.1507156392.git.mario.limonciello@dell.com>
 <ff211830e3953c70aa8e0d43614619f1fb423668.1507156392.git.mario.limonciello@dell.com>
 <20171005010909.GC25018@fury>
 <CAHp75Vc0umEt0cGn5-NWva6j1T0yry1Ag7Egnn4iSvz=cs_kTg@mail.gmail.com>
 <20171005071153.GA31452@fury>
 <CAHp75VdYj8A3DDNfXcXPMa7oAxfWhaAyAB-Kf_LB+oyzONyaYQ@mail.gmail.com>
 <3be9670de8404523be04e2e319f1c1b3@ausx13mpc120.AMER.DELL.COM>
 <20171005141448.GB31452@fury>
 <5a114243f6844133a89d060347d5d390@ausx13mpc120.AMER.DELL.COM>
 <20171005172210.GC31452@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa1.dell-outbound.iphmx.com ([68.232.153.90]:19907 "EHLO
        esa1.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751744AbdJERcD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Oct 2017 13:32:03 -0400
In-Reply-To: <20171005172210.GC31452@fury>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, greg@kroah.com

> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Thursday, October 5, 2017 12:22 PM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: andy.shevchenko@gmail.com; linux-kernel@vger.kernel.org; platform-
> driver-x86@vger.kernel.org; luto@kernel.org; quasisec@google.com;
> pali.rohar@gmail.com; rjw@rjwysocki.net; mjg59@google.com; hch@lst.de;
> greg@kroah.com
> Subject: Re: [PATCH v4 05/14] platform/x86: dell-wmi-descriptor: split WM=
I
> descriptor into it's own driver
>=20
> On Thu, Oct 05, 2017 at 02:47:15PM +0000, Mario.Limonciello@dell.com wrot=
e:
> > > >
> > > > So I believe it should be a mandatory runtime dependency due to nee=
ding
> > > > the symbol dell_wmi_get_interface_version.  Depmod should be handli=
ng
> > > > this then no?
> > >
> > > This was nagging me all night, and I was thinking the last time I had=
 to
> > > use this it was indeed a runtime dependency. Sorry for the noise on
> > > this.
> > >
> > > The kconfig needs to be setup such that dell-wmi-descriptor cannot be=
 a
> > > module if the dependent drivers are modules.
> > >
> > > --
> > > Darren Hart
> > > VMware Open Source Technology Center
> >
> > Even if the others are modules shouldn't module ordering from depmod st=
ill
> DTRT?
> > You still won't be able to load dell-wmi.ko until dell-wmi-descriptor.k=
o was
> loaded.
> >
>=20
> I worded that wrong *facepalm*, let me try again...
>=20
> The kconfig needs to be setup such that dell-wmi-descriptor cannot be a
> module if the dependent drivers are built-in.
>=20

OK got it.  I've got Kconfig adjusted for this.  Unlike DELL_SMBIOS,=20
DELL_WMI_DESCRIPTOR could still be used on it's own.
