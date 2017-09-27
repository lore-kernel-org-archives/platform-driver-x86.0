From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH 04/12] platform/x86: dell-smbios: Switch to a WMI-ACPI
 interface
Date: Wed, 27 Sep 2017 18:29:20 +0000
Message-ID: <251a8b3dccf64918a777a7898f14b8b8@ausx13mpc120.AMER.DELL.COM>
References: <cover.1505999739.git.mario.limonciello@dell.com>
 <4da87eb0d9722ed906615409586a8b4d7becd65c.1505999739.git.mario.limonciello@dell.com>
 <20170925161851.GK22190@pali>
 <12a6583cae694ae58b9b8c885958bcee@ausx13mpc120.AMER.DELL.COM>
 <20170927164615.GD23572@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa4.dell-outbound.iphmx.com ([68.232.149.214]:18647 "EHLO
        esa4.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751016AbdI0S3W (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Sep 2017 14:29:22 -0400
In-Reply-To: <20170927164615.GD23572@fury>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: pali.rohar@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, quasisec@google.com

> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Wednesday, September 27, 2017 12:46 PM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: pali.rohar@gmail.com; linux-kernel@vger.kernel.org; platform-driver-
> x86@vger.kernel.org; quasisec@google.com
> Subject: Re: [PATCH 04/12] platform/x86: dell-smbios: Switch to a WMI-ACP=
I
> interface
>=20
> On Mon, Sep 25, 2017 at 07:28:57PM +0000, Mario.Limonciello@dell.com wrot=
e:
> >
> >
> > > -----Original Message-----
> > > From: Pali Roh=E1r [mailto:pali.rohar@gmail.com]
> > > Sent: Monday, September 25, 2017 12:19 PM
> > > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > > Cc: dvhart@infradead.org; LKML <linux-kernel@vger.kernel.org>; platfo=
rm-
> driver-
> > > x86@vger.kernel.org; quasisec@google.com
> > > Subject: Re: [PATCH 04/12] platform/x86: dell-smbios: Switch to a WMI=
-ACPI
> > > interface
> > >
> > > On Thursday 21 September 2017 08:57:09 Mario Limonciello wrote:
> > > > The driver currently uses an SMI interface which grants direct acce=
ss
> > > > to physical memory to the platform via a pointer.
> > > >
> > > > Changing this to operate over WMI-ACPI will use an ACPI OperationRe=
gion
> > > > for a buffer of data storage when platform calls are performed.
> > > >
> > > > This is a safer approach to use in kernel drivers as the platform w=
ill
> > > > only have access to that OperationRegion.
> > >
> > > In my opinion direct access is safer then using ACPI wrapper for same
> > > functionality.
> >
> > I'd like to hear how this is safer.
>=20
> Again, I think the disconnect is around the term "platform". I think abov=
e you
> can s/platform/SMM/ right?
>=20

From my OEM hat we don't really refer to SMM as an entity, but "Yeah" if th=
at
makes it clearer I'd agree.
