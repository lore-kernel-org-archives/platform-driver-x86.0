From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v3 0/4] dell-wmi: Changes in WMI event code handling
Date: Tue, 21 Jun 2016 09:27:23 -0700
Message-ID: <20160621162723.GC3685@f23x64.localdomain>
References: <1466020153-10877-1-git-send-email-pali.rohar@gmail.com>
 <20160616031958.GA54214@f23x64.localdomain>
 <20160616073302.GT29844@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160616073302.GT29844@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Gabriele Mazzotta <gabriele.mzt@gmail.com>, Andy Lutomirski <luto@kernel.org>, Alex Hung <alex.hung@canonical.com>, Matthew Garrett <mjg59@srcf.ucam.org>, =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Mario Limonciello <mario_limonciello@dell.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Jun 16, 2016 at 09:33:02AM +0200, Pali Roh=E1r wrote:
> On Wednesday 15 June 2016 20:19:58 Darren Hart wrote:
> > On Wed, Jun 15, 2016 at 09:49:09PM +0200, Pali Roh=E1r wrote:
> > > First patch describe problem about 0xe045 code. Second and third =
are just
> > > cosmetic and last rework code which processing WMI events. It sho=
uld be
> > > properly tested on more Dell machines, to check that everything i=
s still
> > > working correctly.
> >=20
> > Is this "should be properly tested on more Dell machines" still the=
 case? Are
> > you ready for this to go into linux-next?
>=20
> Series should be OK, but I would like to see if someone else test thi=
s
> series... Gabriele, Alex or Andy? Do you have time?

I've queued these to for-next to ensure we get several weeks there.

--=20
Darren Hart
Intel Open Source Technology Center
