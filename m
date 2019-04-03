From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH] platform/x86: dell-laptop: fix rfkill functionality
Date: Wed, 3 Apr 2019 21:54:27 +0000
Message-ID: <643bcf131bc642cb821ba57f69707fc9@ausx13mpc120.AMER.DELL.COM>
References: <1553696734-31282-1-git-send-email-mario.limonciello@dell.com>
 <20190403202338.GB39081@wrath>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190403202338.GB39081@wrath>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org
Cc: andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> -----Original Message-----
> From: Darren Hart <dvhart@infradead.org>
> Sent: Wednesday, April 3, 2019 3:24 PM
> To: Limonciello, Mario
> Cc: Andy Shevchenko; LKML; platform-driver-x86@vger.kernel.org
> Subject: Re: [PATCH] platform/x86: dell-laptop: fix rfkill functionality
>=20
>=20
> [EXTERNAL EMAIL]
>=20
> On Wed, Mar 27, 2019 at 09:25:34AM -0500, Mario Limonciello wrote:
> > When converting the driver two arguments were transposed leading
> > to rfkill not working.
> >
> > BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=3D201427
> > Reported-by: Pepijn de Vos <pepijndevos@gmail.com>
> > Fixes: 549b49 ("platform/x86: dell-smbios: Introduce dispatcher for SMM=
 calls")
> > Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> > Acked-by: Pali Roh=E1r <pali.rohar@gmail.com>
>=20
> Looks like this broken in 4.14? So Cc stable back to then? I'm surprised =
it's
> been broken that long :-(
>=20

Not many "newer" platforms actually use this radio control anymore.  It's b=
een
superseded by other technologies.  So I think that would be the main reason=
.

Can you CC it to stable when it's committed or do I need to re-send or anyt=
hing?
