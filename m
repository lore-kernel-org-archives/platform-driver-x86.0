From: Seth Forshee <seth.forshee@canonical.com>
Subject: Re: linux-next: Tree for Aug 2 (drivers/platform/x86/apple-gmux.c)
Date: Thu, 2 Aug 2012 11:43:28 -0500
Message-ID: <20120802164328.GJ32395@thinkpad-t410>
References: <20120802141505.d30da7f7113e955679383acb@canb.auug.org.au>
 <501AA5A8.1070607@xenotime.net>
 <20120802161504.GG32395@thinkpad-t410>
 <501AA892.70207@xenotime.net>
 <20120802163154.GH32395@thinkpad-t410>
 <20120802163616.GI32395@thinkpad-t410>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120802163616.GI32395@thinkpad-t410>
Sender: linux-next-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Aug 02, 2012 at 11:36:16AM -0500, Seth Forshee wrote:
> On Thu, Aug 02, 2012 at 11:31:54AM -0500, Seth Forshee wrote:
> > On Thu, Aug 02, 2012 at 09:19:30AM -0700, Randy Dunlap wrote:
> > > On 08/02/2012 09:15 AM, Seth Forshee wrote:
> > > 
> > > > On Thu, Aug 02, 2012 at 09:07:04AM -0700, Randy Dunlap wrote:
> > > >> On 08/01/2012 09:15 PM, Stephen Rothwell wrote:
> > > >>
> > > >>> Hi all,
> > > >>>
> > > >>> Please do not add anything to linux-next included branches/series that is
> > > >>> destined for v3.7 until after v3.6-rc1 is released.
> > > >>>
> > > >>> Reminder: do not rebase your branches before asking Linus to pull them ...
> > > >>>
> > > >>> Changes since 20120731:
> > > >>>
> > > >>
> > > >>
> > > >> when CONFIG_ACPI is not enabled: (on i386)
> > > >>
> > > >> drivers/platform/x86/apple-gmux.c: In function 'gmux_probe':
> > > >> drivers/platform/x86/apple-gmux.c:196:2: error: implicit declaration of function 'acpi_video_dmi_promote_vendor'
> > > >> drivers/platform/x86/apple-gmux.c: In function 'gmux_remove':
> > > >> drivers/platform/x86/apple-gmux.c:219:2: error: implicit declaration of function 'acpi_video_dmi_demote_vendor'
> > > >>
> > > >>
> > > >> Full randconfig file is attached.
> > > > 
> > > > I sent Matthew a patch that should fix this [1], but he doesn't seem to
> > > > have picked it up yet.
> > > > 
> > > > Seth
> > > > 
> > > > [1] https://lkml.org/lkml/2012/7/2/257
> > > > 
> > > 
> > > 
> > > That patch does not fix this build error.
> > > There is still an implicit assumption in Kconfig and
> > > the driver source that ACPI is enabled.
> > 
> > The functions in question are built or not based off of ACPI_VIDEO,
> > which in turn depends on ACPI. So if ACPI=n, then ACPI_VIDEO=n and you
> > can't configure APPLE_GMUX=(m|y). Is that right, or am I missing
> > something?
> 
> Nevermind, I see what I missed.
> 
> This is kind of messy -- maybe those declartions should be extracted
> from the #ifdef CONFIG_ACPI to avoid this kind of Kconfig madness?

Eh, the driver doesn't make any sense without ACPI anyway, so I'll
refresh the patch with that dependency.

Seth
