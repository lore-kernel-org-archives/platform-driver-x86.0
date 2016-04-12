From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH] fujitsu-laptop: Support radio LED
Date: Tue, 12 Apr 2016 22:19:20 +0930
Message-ID: <20160412124920.GB8195@marvin.atrad.com.au>
References: <1458127687-25366-1-git-send-email-kernel@kempniu.pl>
 <20160318120418.GA29889@marvin.atrad.com.au>
 <20160322133051.GA3379@eudyptula.hq.kempniu.pl>
 <20160324113513.GA5129@marvin.atrad.com.au>
 <20160410023020.GA27081@dvhart-mobl5.amr.corp.intel.com>
 <20160410105258.GA2922@marvin.atrad.com.au>
 <20160412120323.GA2583@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160412120323.GA2583@eudyptula.hq.kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Our posts have crossed in transit.

On Tue, Apr 12, 2016 at 02:03:23PM +0200, Micha?? K??pie?? wrote:
> > > Where are we with this? The above reads as "Doesn't appear to bre=
ak existing
> > > systems on hand". Jonathan, are you happy with this patch?
> >=20
> > Sorry, I got caught up over the last couple of weeks with other tas=
ks and
> > have not yet managed to confirm the lack of regressions on the S702=
0.  It
> > was on my list for this coming week though.  My comments quoted abo=
ve were
> > theoretical rather than based on an actual test.  The patch appears=
 fairly
> > innoculous given that BTNI bit 24 is not set on the S7020 but for
> > completeness I would prefer to give it a run on the S7020 before we=
 merge
> > the patch.  I will make an effort to fit this in over the next coup=
le of
> > days.
> >=20
> > > Micha??, do you have plans for a v2?
> >=20
> > I wasn't clear on this myself.  I suspect, given the lack of a v2 i=
n the
> > time since the last discussion, that there is no v2 planned at this=
 stage
> > and I will proceed with my testing accordingly.
>=20
> Jonathan, in one of my previous messages [1] I laid out my motivation
> for implementing this patch the way I did.  In your response [2], you
> wrote:
>=20
> > This is a quick reply with preliminary information.  I'll follow up=
 in the
> > next few days with further details.
>=20
> Thus, I have been patiently awaiting your response ever since as I se=
e
> no reason to rush this patch.

Thanks - I appreciate that.  My response is in the post I sent a few mi=
nutes
ago.  Code-wise I don't see a problem: it doesn't regress on the S7020 =
so I
think we're good to go in that respect.

> Darren, even if Jonathan is happy with v1 code-wise, I was planning t=
o
> post a v2 with an improved commit message (as hinted before [1]).  Ye=
t,
> the contents of that message may depend on the results of Jonathan's
> tests.

No problem.  You can use my posted suggestions as they are or edit as
appropriate.  Note the suggested comment in the code regarding the use =
of
BTNI bit 24 - again, feel free to use it as is or make changes as you s=
ee
fit.  Darren: I'm happy to wait for the v2 patch.

A couple of further comments based on your original explanation:

> Note that when called with Arg0 set to 0x00, S000 returns 0x00020320 =
on
> a Lifebook E744 (this is the value saved in the rfkill_supported fiel=
d
> of struct fujitsu_hotkey_t).  Bit 16 is not set on a Lifebook E8420, =
so
> it might mean that this is an indicator of a radio toggle button bein=
g
> present.=20

I feel that the BTNI bit 24 route is better at this stage: the above se=
ems
to require more assumptions which we are not in a position to definitel=
y
prove.

> While it's not essential, it would be nice to initialize soft rfkill
> state of all radio transmitters to the value of RFSW upon boot.  Note
> that this value is persisted between reboots until the battery is
> removed, but can be changed before the kernel is booted.  I haven't
> found an rfkill function which would enable one to set all rfkill
> devices to a chosen initial soft state (note that fujitsu-laptop does=
n't
> create any rfkill devices on its own).  Is this possible/desired or
> should this task simply be delegated to userspace?

Agreed that this would be nice.  As you said though, without the rfkill
function it could be difficult to do.  In any case, addressing this can=
 be
left for a follow up patch.  I have no objection to the idea if you wer=
e to
discover a way to do this.

> One last remark is that I think this LED would best be driven by an
> inverted airplane mode LED trigger (as proposed by Jo=C3=A3o Paulo Re=
chi
> Vita).  As the code for that trigger is not yet merged, I refrained f=
rom
> setting the default_trigger field in struct led_classdev radio_led.
> Perhaps it's a candidate for a follow-up patch in the future.

Agreed.

Regards
  jonathan
