From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: intel-wmi-thunderbolt: Add dynamic debugging
Date: Wed, 26 Sep 2018 22:25:40 +0300
Message-ID: <CAHp75VeCA1riXHHGjVz78BP0je+a5a6bgpXP5qdK+QxfHQpxdg@mail.gmail.com>
References: <1537978258-2907-1-git-send-email-mario.limonciello@dell.com> <20180926183429.GP2664@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180926183429.GP2664@lahna.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@intel.com>
Cc: Mario Limonciello <mario.limonciello@dell.com>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Sep 26, 2018 at 9:34 PM Mika Westerberg
<mika.westerberg@intel.com> wrote:
>
> On Wed, Sep 26, 2018 at 11:10:58AM -0500, Mario Limonciello wrote:
> > Some users have been reporting issues with thunderbolt being turned off
> > before fully initialized.  This is suspected to be caused by userspace
> > turning off the Thunderbolt controller using intel-wmi-thunderbolt
> > prematurely.
> >
> > Details are available here:
> > https://bugzilla.kernel.org/show_bug.cgi?id=201227
> > https://bugzilla.kernel.org/show_bug.cgi?id=199631
> >
> > Userspace has already made some mitigiations for this situation:
>                                   ^^^^^^^^^^^^
> mitigations?

I've fixed that, but in any case I need to add your tag, thanks!


>
> > https://github.com/hughsie/fwupd/commit/ef6f1d76983c9b66
> > https://github.com/hughsie/fwupd/commit/c07ce5b4889a5384
> >
> > To allow easier debugging of this situation add output that can be turned
> > on with dynamic debugging to better root cause this problem.
> >
> > Suggested-by: Mika Westerberg <mika.westerberg@intel.com>
> > Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>



-- 
With Best Regards,
Andy Shevchenko
