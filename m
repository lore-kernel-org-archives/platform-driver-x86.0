From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] platform/x86: intel-hid: Add support for Device
 Specific Methods
Date: Fri, 6 Jul 2018 16:59:07 -0700
Message-ID: <20180706235907.GE3041@fury>
References: <20180628181906.54910-1-srinivas.pandruvada@linux.intel.com>
 <74ac9bf130074e0a8f86a7904783d091@ausx13mpc120.AMER.DELL.COM>
 <95b3748fcb911c7305bd2bbcfd4e368f044f8b14.camel@linux.intel.com>
 <CAHp75VdX+i_N_GttiL3QZrpivpUeJa0ofGfeJR1FkfuiBWocqA@mail.gmail.com>
 <cc4bc804434a40d9bdd2fa03bbb875aa@ausx13mpc120.AMER.DELL.COM>
 <CAHp75VerxQrPwHTU9PF_q_8xkRm7=cBTPf2tb_5xPEoBQKcL8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75VerxQrPwHTU9PF_q_8xkRm7=cBTPf2tb_5xPEoBQKcL8A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mario Limonciello <Mario.Limonciello@dell.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Alex Hung <alex.hung@canonical.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jul 02, 2018 at 05:06:14PM +0300, Andy Shevchenko wrote:
> On Mon, Jul 2, 2018 at 4:51 PM,  <Mario.Limonciello@dell.com> wrote:
> 
> >> > So there are some customers who will have issue with power button
> >> > without this patch, so it should be also marked for stable also.
> >> > Also this may be a candidate for 4.18-rcX.
> >> >
> >>
> >> I'm not sure Greg will take this selling point for rather big patch.
> >> From changelog, honestly, I don't see any regression description,
> >> looks like "it wasn't working before change anyway".
> >>
> >
> > Just for adding some context.
> >
> > Some platforms have moved to different interface in ASL in FW upgrade
> > due to deficiencies/bugs present with old interface.  So yes it's platform FW
> > change in behavior that leads to Linux kernel regression.  Windows driver has supported
> > both interfaces for a long time.  Linux kernel however doesn't support this interface until now.
> >
> >> For now, I pushed this to my review and testing queue as is, thanks!
> >
> > If not stable I think it would at least be ideal to try to bring this to 4.18-rcX if possible for
> > compatibility with more platforms that will come with this other interface instead.
> 
> Citing Linus:
> 
> --- 8< --- 8< ---
> So please, people, the "fixes" during the rc series really should be
> things that are _regressions_. If it used to work, and it no longer does,
> then fixing that is a good and proper fix. Or if something oopses or has a
> security implication, then the fix for that is a real fix.
> 
> But if it's something that has never worked, even if it "fixes" some
> behavior, then it's new development, and that should come in during the
> merge window. Just because you think it's a "fix" doesn't mean that it
> really is one, at least in the "during the rc series" sense.
> --- 8< --- 8< ---
> 
> So, if we can sell him that it used to work and firmware fix is a
> Linux regression I'm fine.
> 
> Darren, what do you think?

So if I understand this correctly, we have this timeline.

Linux v4.16
- Machine A works
Linux v4.17
- Machine A works
- Machine A updates firmware
- Machine A stops working
Linux v4.18
- Machine A still doesn't work

So it is not a *Linux kernel* regression.

The patch is too large for standard stable rules.

It is a regression from any user's perspective - the machine worked,
they followed good digital hygiene and updated their firmware, and now
it doesn't. This user will now think twice before they update their BIOS
again, since it may fundamentally change the platform, rather than
committing to only fixing things below the OS Interface layer. :-(

The risk of course is that this introduces new bugs - and as with
anything that still uses _DSM (sigh, why?) that is quite possible due to
the opaque interface. Very unfortunate to see _DSM ADDED to a previously
_DSM free implementation. Linus is right, this is not a fix, this is
feature development.

I strongly advocate for vendors to have more control over their drivers,
but this scenario really frustrates me. I don't think I can justify this
to Linus as a fix. But before we just say "no" (because hey, I want
these fixes available as early as possible too), let's ask Rafael if he
has an opinion or if there is precedent for this in his experience with
ACPI drivers in general:

Rafael?

Finally, we can also just ask Linus. The firmware update broke the power
button, we can get it working again by supporting the new API with this
patch... see what he says.

-- 
Darren Hart
VMware Open Source Technology Center
