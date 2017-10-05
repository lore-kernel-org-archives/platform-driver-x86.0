From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v4 05/14] platform/x86: dell-wmi-descriptor: split WMI
 descriptor into it's own driver
Date: Thu, 5 Oct 2017 14:47:15 +0000
Message-ID: <5a114243f6844133a89d060347d5d390@ausx13mpc120.AMER.DELL.COM>
References: <cover.1507156392.git.mario.limonciello@dell.com>
 <ff211830e3953c70aa8e0d43614619f1fb423668.1507156392.git.mario.limonciello@dell.com>
 <20171005010909.GC25018@fury>
 <CAHp75Vc0umEt0cGn5-NWva6j1T0yry1Ag7Egnn4iSvz=cs_kTg@mail.gmail.com>
 <20171005071153.GA31452@fury>
 <CAHp75VdYj8A3DDNfXcXPMa7oAxfWhaAyAB-Kf_LB+oyzONyaYQ@mail.gmail.com>
 <3be9670de8404523be04e2e319f1c1b3@ausx13mpc120.AMER.DELL.COM>
 <20171005141448.GB31452@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa2.dell-outbound.iphmx.com ([68.232.149.220]:57979 "EHLO
        esa2.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751043AbdJEOrR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Oct 2017 10:47:17 -0400
In-Reply-To: <20171005141448.GB31452@fury>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, greg@kroah.com

> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Thursday, October 5, 2017 9:15 AM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: andy.shevchenko@gmail.com; linux-kernel@vger.kernel.org; platform-
> driver-x86@vger.kernel.org; luto@kernel.org; quasisec@google.com;
> pali.rohar@gmail.com; rjw@rjwysocki.net; mjg59@google.com; hch@lst.de;
> greg@kroah.com
> Subject: Re: [PATCH v4 05/14] platform/x86: dell-wmi-descriptor: split WM=
I
> descriptor into it's own driver
>=20
> On Thu, Oct 05, 2017 at 01:59:36PM +0000, Mario.Limonciello@dell.com wrot=
e:
> > > -----Original Message-----
> > > From: Andy Shevchenko [mailto:andy.shevchenko@gmail.com]
> > > Sent: Thursday, October 5, 2017 3:48 AM
> > > To: Darren Hart <dvhart@infradead.org>
> > > Cc: Limonciello, Mario <Mario_Limonciello@Dell.com>; LKML <linux-
> > > kernel@vger.kernel.org>; Platform Driver <platform-driver-
> > > x86@vger.kernel.org>; Andy Lutomirski <luto@kernel.org>;
> > > quasisec@google.com; Pali Roh=E1r <pali.rohar@gmail.com>; Rafael J. W=
ysocki
> > > <rjw@rjwysocki.net>; mjg59@google.com; Christoph Hellwig <hch@lst.de>=
;
> > > Greg KH <greg@kroah.com>
> > > Subject: Re: [PATCH v4 05/14] platform/x86: dell-wmi-descriptor: spli=
t WMI
> > > descriptor into it's own driver
> > >
> > > On Thu, Oct 5, 2017 at 10:11 AM, Darren Hart <dvhart@infradead.org> w=
rote:
> > > > On Thu, Oct 05, 2017 at 08:29:10AM +0300, Andy Shevchenko wrote:
> > > >> On Thu, Oct 5, 2017 at 4:09 AM, Darren Hart <dvhart@infradead.org>
> wrote:
> > >
> > > >> > You'll want to add something like:
> > > >> >
> > > >> > #ifdef CONFIG_DELL_WMI_DESCRIPTOR_MODULE
> > > >> >         if (request_module("dell_wmi_descriptor"))
> > > >> >                 /* FAIL */
> > > >> > #endif
> > > >> >
> > > >> > During init.
> > > >>
> > > >> I don't think #ifdef is needed.
> > > >
> > > > Without the ifdef, we can't distinguish between request_module fail=
ing
> > > > to load the module because it isn't available and because it is
> > > > built-in.
> > > >
> > > >>
> > > >> We may just request module.
> > > >>
> > > >> But looking in the code it seems that we simple need to select tha=
t
> > > >> module. No request_module will be needed.
> > > >
> > > > The select will ensure the module is built, but there is not guaran=
tee
> > > > to module load order. The intent of the above is to ensure the symb=
ols
> > > > from the required module are loaded.
> > > >
> > > >> Did I miss something?
> > > >
> > > > Or I did :-) Is there something about this module which ensures
> > > > dell_wmi_descriptor is loaded first?
> > >
> > > If there is an optional *run-time* dependency we need to use somelike
> > > request_module(). For example, this is the case for idma64
> > > (drivers/dma) vs intel-lpss (drivers/mfd).
> > >
> > > If it's mandatory run-time dependency, then we need to add stubs to
> > > the header and select the callee's module in Kconfig.
> > >
> > > In case they are both modules, depmod keeps an ordering.
> > >
> > > So, the corner case here is when the caller is builtin while callee i=
s module.
> > >
> > > This is a bit tricky to add to Kconfig (we also have such cases
> > > between I2C DesignWare and acpi_lpss AFAIR).
> > >
> > > --
> > > With Best Regards,
> > > Andy Shevchenko
> >
> > So I believe it should be a mandatory runtime dependency due to needing
> > the symbol dell_wmi_get_interface_version.  Depmod should be handling
> > this then no?
>=20
> This was nagging me all night, and I was thinking the last time I had to
> use this it was indeed a runtime dependency. Sorry for the noise on
> this.
>=20
> The kconfig needs to be setup such that dell-wmi-descriptor cannot be a
> module if the dependent drivers are modules.
>=20
> --
> Darren Hart
> VMware Open Source Technology Center

Even if the others are modules shouldn't module ordering from depmod still =
DTRT?
You still won't be able to load dell-wmi.ko until dell-wmi-descriptor.ko wa=
s loaded.
