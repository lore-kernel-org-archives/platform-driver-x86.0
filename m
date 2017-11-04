From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH 2/2] platform/x86: dell-*wmi*: Relay failed initial probe
 to dependent drivers
Date: Sat, 4 Nov 2017 03:25:04 +0000
Message-ID: <41ef814bda1d41ab87880ab569aa48b3@ausx13mpc120.AMER.DELL.COM>
References: <cover.1509725778.git.mario.limonciello@dell.com>
 <6312b76d08d3b6b5562c773fce8e13d85036ddd5.1509725778.git.mario.limonciello@dell.com>
 <20171104005327.GC24317@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa2.dell-outbound.iphmx.com ([68.232.149.220]:33544 "EHLO
        esa2.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751216AbdKDDZG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Nov 2017 23:25:06 -0400
In-Reply-To: <20171104005327.GC24317@fury>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, pali.rohar@gmail.com

> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Friday, November 3, 2017 7:53 PM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>; LKML <linux-
> kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org;
> pali.rohar@gmail.com
> Subject: Re: [PATCH 2/2] platform/x86: dell-*wmi*: Relay failed initial p=
robe to
> dependent drivers
>=20
> On Fri, Nov 03, 2017 at 11:27:22AM -0500, Mario Limonciello wrote:
> > dell-wmi and dell-smbios-wmi are dependent upon dell-wmi-descriptor
> > finishing probe successfully to probe themselves.
> >
> > Currently if dell-wmi-descriptor fails probing in a non-recoverable way
> > (such as invalid header) dell-wmi and dell-smbios-wmi will continue to
> > try to redo probing due to deferred probing.
> >
> > To solve this have the dependent drivers query the dell-wmi-descriptor
> > driver whether the descriptor has been determined valid. The possible
> > results are:
> > -EPROBE_DEFER: Descriptor not yet probed, dependent driver should wait
> >  and use deferred probing
> > < 0: Descriptor probed, invalid.  Dependent driver should return an
> >  error.
> > 0: Successful descriptor probe, dependent driver can continue
> >
> > Successful descriptor probe still doesn't mean that the descriptor driv=
er
> > is necessarily bound at the time of initialization of dependent driver.
> > Userspace can unbind the driver, so all methods used from driver
>=20
> Userspace shouldn't be able to remove the dell-wmi-descriptor driver if a
> dependent driver is loaded. It isn't clear to me in which scenario we enc=
ounter
> this problem ??

Userspace can however unbind a bound GUID.  When this happens getting
the interface version and size will both fail.

>=20
>=20
> > should still be verified to return success values otherwise deferred
> > probing be used.
>=20
> The part after "otherwise" is breaking my English parser...
>=20
> Should this read: "Userspace can unbind the driver, so all methods used f=
rom the
> driver should still be verified to return successful values, falling back=
 to
> deferred probing in case of failure." ??

Yeah that's clearer and correct.

>=20
> > diff --git a/drivers/platform/x86/dell-wmi-descriptor.h
> b/drivers/platform/x86/dell-wmi-descriptor.h
> > index 5f7b69c2c83a..776cddd5e135 100644
> > --- a/drivers/platform/x86/dell-wmi-descriptor.h
> > +++ b/drivers/platform/x86/dell-wmi-descriptor.h
> > @@ -15,6 +15,13 @@
> >
> >  #define DELL_WMI_DESCRIPTOR_GUID "8D9DDCBC-A997-11DA-B012-
> B622A1EF5492"
> >
> > +/* possible return values:
>=20
> This should trigger a checkpatch error, but doesn't. Huh. For everything =
but
> "net", comment blocks should start with /* and not following text.
>=20

OK.

> /*
>  * First line.
>  * Second line.
>  */
>=20
> A nit, and I can clean up if no changes are deemed necessary here.
>=20
> > + *  -EPROBE_DEFER: probing for dell-wmi-descriptor not yet run
> > + *  0: valid descriptor, successfully probed
> > + *  < 0: invalid descriptor, don't probe dependent devices
> > + */
>=20
> --
> Darren Hart
> VMware Open Source Technology Center
