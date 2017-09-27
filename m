From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v2 03/14] platform/x86: dell-wmi: Don't match on
 descriptor GUID modalias
Date: Wed, 27 Sep 2017 17:30:40 +0000
Message-ID: <342b1e384a8f4d26b236fe2ac8c25a18@ausx13mpc120.AMER.DELL.COM>
References: <cover.1506451187.git.mario.limonciello@dell.com>
 <b6153ced6dc75c057429a69f2d8994d784f9768e.1506451187.git.mario.limonciello@dell.com>
 <20170927172150.GH23572@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170927172150.GH23572@fury>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org
Cc: andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, quasisec@google.com, pali.rohar@gmail.com
List-Id: platform-driver-x86.vger.kernel.org

> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Wednesday, September 27, 2017 1:22 PM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>; LKML <linux-
> kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org;
> quasisec@google.com; pali.rohar@gmail.com
> Subject: Re: [PATCH v2 03/14] platform/x86: dell-wmi: Don't match on desc=
riptor
> GUID modalias
>=20
> On Tue, Sep 26, 2017 at 01:50:01PM -0500, Mario Limonciello wrote:
> > The descriptor GUID is not used to indicate that WMI notifications
> > in the dell-wmi driver work properly.  As such a modalias should
> > not be present that causes this driver to load on systems with this
> > GUID.
> >
> > Reviewed-by: Pali Pohar <pali.rohar@gmail.com>
> > Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
>=20
> I can do this manually, but for future reference:
>=20
> Nit, in general, the author's sign off should be first, followed by
> reviewers and testers. The maintainer will add their sign off at the end
> - this keeps things clear regarding the development and delivery path.
> In general, assume chronological order and you'll have the right idea.
>=20
> Informational tags, like Reported, Suggested, Tested, and Fixes can come
> before the Author sign off, which is consistent with the chronological
> order.
>=20

Operationally is there is a flag I'm missing in git-format-patch that does
this?  git format-patch -s puts my sign off at the very bottom, so this is =
a
manual action to re-order if I'm adding in Reviewed-by: in the patch
description.
