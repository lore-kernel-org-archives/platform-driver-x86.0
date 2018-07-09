From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v2] platform/x86: intel-hid: Add support for Device
 Specific Methods
Date: Mon, 9 Jul 2018 21:08:56 +0000
Message-ID: <b79253ee160b4d08a48ac0a805939296@ausx13mpc120.AMER.DELL.COM>
References: <20180628181906.54910-1-srinivas.pandruvada@linux.intel.com>
 <74ac9bf130074e0a8f86a7904783d091@ausx13mpc120.AMER.DELL.COM>
 <95b3748fcb911c7305bd2bbcfd4e368f044f8b14.camel@linux.intel.com>
 <CAHp75VdX+i_N_GttiL3QZrpivpUeJa0ofGfeJR1FkfuiBWocqA@mail.gmail.com>
 <cc4bc804434a40d9bdd2fa03bbb875aa@ausx13mpc120.AMER.DELL.COM>
 <CAHp75VerxQrPwHTU9PF_q_8xkRm7=cBTPf2tb_5xPEoBQKcL8A@mail.gmail.com>
 <20180706235907.GE3041@fury>
 <ccb18d853b254f680895c45862274ec8bdd70ab0.camel@linux.intel.com>
 <1dfb07bd3461414e8db492e643d7de88@ausx13mpc120.AMER.DELL.COM>
 <20180709210646.GA30247@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180709210646.GA30247@fury>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org
Cc: srinivas.pandruvada@linux.intel.com, andy.shevchenko@gmail.com, alex.hung@canonical.com, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, rjw@rjwysocki.net
List-Id: platform-driver-x86.vger.kernel.org

> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Monday, July 9, 2018 4:07 PM
> To: Limonciello, Mario
> Cc: srinivas.pandruvada@linux.intel.com; andy.shevchenko@gmail.com;
> alex.hung@canonical.com; andy@infradead.org; platform-driver-
> x86@vger.kernel.org; linux-kernel@vger.kernel.org; rjw@rjwysocki.net
> Subject: Re: [PATCH v2] platform/x86: intel-hid: Add support for Device S=
pecific
> Methods
>=20
> On Mon, Jul 09, 2018 at 04:38:16AM +0000, Mario.Limonciello@dell.com wrot=
e:
> > > -----Original Message-----
> > > From: Srinivas Pandruvada [mailto:srinivas.pandruvada@linux.intel.com=
]
> > > Sent: Saturday, July 7, 2018 8:44 AM
> > > To: Darren Hart; Andy Shevchenko
> > > Cc: Limonciello, Mario; Alex Hung; Andy Shevchenko; Platform Driver; =
Linux
> Kernel
> > > Mailing List; Rafael J. Wysocki
> > > Subject: Re: [PATCH v2] platform/x86: intel-hid: Add support for Devi=
ce Specific
> > > Methods
> > >
> > > On Fri, 2018-07-06 at 16:59 -0700, Darren Hart wrote:
> > > > On Mon, Jul 02, 2018 at 05:06:14PM +0300, Andy Shevchenko wrote:
> > > > > On Mon, Jul 2, 2018 at 4:51 PM,  <Mario.Limonciello@dell.com>
> > > > > wrote:
> ...
> > > Mario can add more.
> > > But I think Dell has released a BIOS fix, so that power button can
> > > still work using non _DSM way. So I think we can wait for normal
> > > release cycle.
> >
> > Yeah, I added some comments on a separate reply already indicating this=
.
> >
> > The affected system we know about has reverted the new interface.
> >
> > This all stems from an expectation that the _DSM has been there for "ma=
ny"
> > releases on the Windows side.  Long enough that even all the corporate
> downgrade
> > scenarios to older Windows versions and the drivers with them all worke=
d
> properly.
> >
> > If this doesn't end up being a candidate for backporting to stable we'l=
l probably
> > end up asking our various OS partners to backport it as a SAUCE type pa=
tch in
> distro
> > kernels to eventually be able to turn this back on.
>=20
> Thanks Mario. We'll skip the RC. We can discuss -stable as a separate
> issue.  This patch fixes a demonstrable bug, the biggest obstacle here
> is the size. At 240 lines with context, it more than doubles the maximum
> patch size for stable.
>=20
> My recommendation is that we treat the stable backport of this as a
> special case, e.g. Andy and I don't tag it, but you or Srinivas propose
> it and specifically make the case for why an exception should be made to
> Greg.
>=20
> How self contained and isolated this change is will be an important part
> of the argument. On the one hand, it's all one file, on the other hand,
> this is a fairly generic driver in use in more and more platforms, with
> the potential for widespread impact if this introduces a new bug.
>=20

In that case, how about we let it bake for a while and maybe by the time
4.19 comes out is when we do the proposal of a stable backport?
