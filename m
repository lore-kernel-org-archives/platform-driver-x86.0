From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH 1/2] ideapad-laptop: Ignore an unused VPC notification
Date: Mon, 11 Jul 2011 16:50:06 +0100
Message-ID: <20110711155006.GA14245@srcf.ucam.org>
References: <1309268154-6872-1-git-send-email-kengyu@canonical.com>
 <20110707151023.GA15366@srcf.ucam.org>
 <CADXHx7bnQ49yrL2Uoq=945V1UWMPq-FamCOT81t7Jn4mtEHpkQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CADXHx7bnQ49yrL2Uoq=945V1UWMPq-FamCOT81t7Jn4mtEHpkQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?iso-8859-1?Q?Keng-Y=FC?= Lin <kengyu@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, ike.pan@canonical.com, vanhoof@canonical.com, kent.lin@canonical.com, sylee@canonical.com
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jul 11, 2011 at 03:29:09PM +0800, Keng-Y=FC Lin wrote:
> On Thu, Jul 7, 2011 at 11:10 PM, Matthew Garrett <mjg59@srcf.ucam.org=
> wrote:
> > On Tue, Jun 28, 2011 at 02:35:53PM +0100, Keng-Yu Lin wrote:
> >> BIOS fires notifications in a constant period with VPC bit 1 set w=
hen the
> >> power cord is unplugged.
> >
> > How frequently? That's going to do bad things to power management. =
It'd
> > be nice to find a way to just make it stop doing that.
> >
>=20
> About every 22 seconds.

Ok, this seems fair then.

--=20
Matthew Garrett | mjg59@srcf.ucam.org
