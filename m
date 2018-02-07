From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v2] platform/x86: dell-laptop: Allocate buffer on heap
 rather than globally
Date: Wed, 7 Feb 2018 20:17:19 +0000
Message-ID: <4c711099e46e4bbd828d35bd9fbd612a@ausx13mpc120.AMER.DELL.COM>
References: <1517420855-19374-1-git-send-email-mario.limonciello@dell.com>
 <20180204120922.fds52i22griw2h6e@pali>
 <CAHp75VcnDKP=kNPh7pU1v_f0+oP64ByKAOmkZzXNUVaXg=wDSg@mail.gmail.com>
 <9b01161fb81043b79cf9ade8ec348fff@ausx13mpc120.AMER.DELL.COM>
 <20180206005733.GA11119@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa3.dell-outbound.iphmx.com ([68.232.153.94]:9651 "EHLO
        esa3.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1754281AbeBGURW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Feb 2018 15:17:22 -0500
In-Reply-To: <20180206005733.GA11119@fury>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: andy.shevchenko@gmail.com, pali.rohar@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Monday, February 5, 2018 6:58 PM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: andy.shevchenko@gmail.com; pali.rohar@gmail.com; linux-
> kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org
> Subject: Re: [PATCH v2] platform/x86: dell-laptop: Allocate buffer on hea=
p rather
> than globally
>=20
> On Mon, Feb 05, 2018 at 04:49:35PM +0000, Mario.Limonciello@dell.com wrot=
e:
> > > -----Original Message-----
> > > From: Andy Shevchenko [mailto:andy.shevchenko@gmail.com]
> > > Sent: Sunday, February 4, 2018 8:28 AM
> > > To: Pali Roh=E1r <pali.rohar@gmail.com>
> > > Cc: Limonciello, Mario <Mario_Limonciello@Dell.com>; Darren Hart
> > > <dvhart@infradead.org>; LKML <linux-kernel@vger.kernel.org>; Platform
> Driver
> > > <platform-driver-x86@vger.kernel.org>
> > > Subject: Re: [PATCH v2] platform/x86: dell-laptop: Allocate buffer on=
 heap
> rather
> > > than globally
> > >
> > > On Sun, Feb 4, 2018 at 2:09 PM, Pali Roh=E1r <pali.rohar@gmail.com> w=
rote:
> > > > On Wednesday 31 January 2018 11:47:35 Mario Limonciello wrote:
> > > >> There is no longer a need for the buffer to be defined in
> > > >> first 4GB physical address space.
> > > >>
> > > >> Furthermore there may be race conditions with multiple different f=
unctions
> > > >> working on a module wide buffer causing incorrect results.
> > > >>
> > > >> Fixes: 549b4930f057658dc50d8010e66219233119a4d8
> > >
> > > He-h, I had to notice this earlier...
> > >
> > > > Ok, you can add my:
> > > > Reviewed-by: Pali Roh=E1r <pali.rohar@gmail.com>
> > >
> > > Thanks and sorry, Pali, it's in for-next already, can't rebase.
> >
> > Andy,
> > Since it's already in for-next it's probably too late to add the stable=
 CC too right?
> >
> > So what's the proper time now to send this to @stable?  And should I ju=
st forward
> existing
> > patch?
>=20
> As a general rule, Andy and I should be adding Cc stable to most anything=
 that
> includes a Fixes tag that isn't from this review cycle. I've forgotten in=
 the
> past as well - sorry about that. Something we should add some tooling aro=
und I
> think, so we don't miss it when checking things in to our review branches=
.
>=20
> As to timing. As soon as this is merged to Linus' master, it can go to st=
able.
> Instructions for doing this are in Documentation/process/stable-kernel-ru=
les.rst
>=20
> --

Thanks, I see it's in Linuses' tree today so I sent something to stable for=
 it.
