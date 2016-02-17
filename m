From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 1/2] ideapad: No hardware switch after 2016
Date: Tue, 16 Feb 2016 23:15:01 -0800
Message-ID: <20160217071501.GA22091@dvhart-mobl5.amr.corp.intel.com>
References: <1455531813-1256-1-git-send-email-ike.pan@canonical.com>
 <1455531863-1294-1-git-send-email-ike.pan@canonical.com>
 <87r3gew4zw.fsf@nemi.mork.no>
 <56C20556.7040900@canonical.com>
 <877fi5x4k6.fsf@nemi.mork.no>
 <56C28392.7060706@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:39580 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756463AbcBQHPC (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 17 Feb 2016 02:15:02 -0500
Content-Disposition: inline
In-Reply-To: <56C28392.7060706@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ike Panhc <ike.pan@canonical.com>
Cc: =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Feb 16, 2016 at 10:04:02AM +0800, Ike Panhc wrote:
> On 02/16/2016 01:32 AM, Bj=F8rn Mork wrote:
> > Ike Panhc <ike.pan@canonical.com> writes:
> >> On 02/15/2016 08:08 PM, Bj=F8rn Mork wrote:
> >>> Ike Panhc <ike.pan@canonical.com> writes:
> >>>
> >>>> There are complains on few ideapads that wireless is always hard
> >>>> blocked but there is no physical radio switch. For now, we need
> >>>> each user to report its dmi information and ignore hard blocks
> >>>> on their ideapad. With more and more ideapads available in marke=
t
> >>>> to maintain the dmi table becomes never-ended job.
> >>>>
> >>>> I've checked lenovo website and for recent design none of the
> >>>> ideapads has radio switch. I do not believe there will be in the
> >>>> future. Therefore to disable hard block according to BIOS date i=
s
> >>>> reasonable approach.
> >>>>
> >>>> This patch will disable rfkill hardblock if BIOS year > 2015.
> >>>
> >>> Huh?  And what happens when a user upgrades the BIOS on older har=
dware?
> >>>
> >>
> >> That's why I believe > 2015 is a better choice, not > 2014.
> >>
> >> Ideapads in market now carries BIOS year 2015 and I found no radio=
 switch
> >> on them. And I don't believe anyone will receive or upgrade BIOS f=
or more
> >> then 1y old machine. In fact I haven't heard anyone upgrading BIOS=
 for a
> >> long time.
> >=20
> > Now I don't know this platform, but that assumption seems terribly
> > fragile to me.
>=20
> Maybe I do not say why I propose this patch clearly. User can not use
> wireless with network manager if hardblock reports yes faultily. For
> now, more then half of ideapad models has no ethernet port and even
> with ethernet, user will only find out wireless does not work. User
> without ability to blacklist ideapad_laptop will consider Linux fault=
y
> and choose other solution.
>=20
> >=20
> > Do you own a crystal ball?  Are BIOS updates for older machines so
> > unlikely that you don't even have to consider the possibility?  Wha=
t
> > about a security flaw affecting the BIOS of a large number of older
> > machines?  Has that never happened?
>=20
> Upgrading BIOS might brick the machine. Laptop seller likes that even
> less.

I'm going to have to concur with Bj=F8rn Mork here. While vendors do no=
t upgrade
their firmware as frequently as they should or as we would like, we rea=
lly
should avoid penalizing them if they do choose to provide an update!

>=20
> >=20
> > Sorry, but I don't think it's very nice to owners of older ideapads=
 to
> > just let their rfkill devices disappear silently if they ever upgra=
de
> > their BIOS after 2015.  Yes, that may not be possible right now.  A=
nd it
> > might never become possible.  I don't know.  But what exactly is yo=
ur
> > plan *if* it becomes possible?
>=20
> This is very close to impossible. In this case, I can introduce a new
> dmi tables to whitelist those models.
>=20

The long list DMI whitelist is particularly tedious to generate and mai=
ntain.

> >=20
> > And are you sure there is no proper way to fix this issue?  I know
> > firmware engineers are evil ;) But it would be surprising if they d=
idn't
> > put some clue about the physical switch into the BIOS tables.  I se=
e
> > that you check flags for wlan/bt/3g existence.  Maybe there is anot=
her
> > flag indicating the switch existence? Or maybe some other acpi meth=
od?
>=20
> Indeed. They are evil.
>=20
> I've asked acpidump for one of the ideapads[1] and find out those fla=
gs[2]
> are from EC register[3] which is blackbox to us.
>=20
> [1] https://bugs.launchpad.net/bugs/1528299
> [2] http://pastebin.ubuntu.com/15088110/
> [3] http://pastebin.ubuntu.com/15088128/
>=20
> >=20
> > At the very least, I am convinced there are other hardware you can
> > correlate the switch existence with.
>=20
> I believe so but I do not believe they are ideapads.

I think his point is that you may be able to detect a newer ideapad by =
the
presence or absence of another device. Heck, CPU ID would give a reason=
able idea
regarding date of manufacture if all else fails.

--=20
Darren Hart
Intel Open Source Technology Center
