From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 1/2] x86/quark: Add Quark embedded SRAM support
Date: Tue, 5 May 2015 13:07:48 -0700
Message-ID: <20150505200748.GA33977@fury.dvhart.com>
References: <1430705875-6990-1-git-send-email-pure.logic@nexus-software.ie>
 <1430705875-6990-2-git-send-email-pure.logic@nexus-software.ie>
 <alpine.DEB.2.11.1505041608530.4225@nanos>
 <5548CA17.1030002@nexus-software.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5548CA17.1030002@nexus-software.ie>
Sender: linux-kernel-owner@vger.kernel.org
To: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Cc: Thomas Gleixner <tglx@linutronix.de>, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, andy.schevchenko@gmail.com, boon.leong.ong@intel.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, derek.browne@intel.com, josef.ahmad@intel.com, erik.nyquist@intel.com
List-Id: platform-driver-x86.vger.kernel.org

On Tue, May 05, 2015 at 06:48:07AM -0700, Bryan O'Donoghue wrote:
> >>+ */
> >>+static int esram_dbgfs_state_show(struct seq_file *s, void *unused)
> >>+{
> >>+	struct esram_dev *edev = &esram_dev;
> >>+	u32 data;
> >>+	u32 reg = (u32)s->private;
> >
> >You really like to waste lines. What's wrong with:
> >
> >     	u32 data, reg = .....
> 
> Hmm, I had feedback when doing the IMR code *not* to do that, so kept that
> pattern for eSRAM. More than happy to rationalize the line-count here.
> 

This had come up in the IMR review, and several times in my other reviews, where
there was a strong preference for one variable per line.

I want to remain consistent with our lead maintainers, and I want to be able to
refer to something as the definitive source.

CodingStyle only has this to say in Chapter 8: Commenting:

  It's also important to comment data, whether they are basic types or derived
  types.  To this end, use just one data declaration per line (no commas for
  multiple data declarations).  This leaves you room for a small comment on each
  item, explaining its use.

Perhaps this ONLY applies if comments are used, but I didn't read it that way.

Personally, I prefer the one per line as it's the easiest to enforce and aligns
with the "decreasing line length" for declarations that Thomas has dinged me for
in the past.

Most importantly though, I just want to be consistent with how I review code so
I'm not guilty of telling Bryan one thing only for him to get dinged for
following it later (again).

Sorry about that Bryan :-)

-- 
Darren Hart
Intel Open Source Technology Center
