From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v12 03/10] firmware: Rename FW_OPT_NOFALLBACK to
 FW_OPT_NOFALLBACK_SYSFS
Date: Fri, 20 Mar 2020 15:02:43 +0100
Message-ID: <20200320140243.GA636547@kroah.com>
References: <20200115163554.101315-1-hdegoede@redhat.com>
 <20200115163554.101315-4-hdegoede@redhat.com>
 <20200124085751.GA2957916@kroah.com>
 <d25d5d6e-0348-b19f-539e-048cfa70d6a6@redhat.com>
 <20200318132741.GA2794545@kroah.com>
 <8fa336bd-339f-40e0-08fe-e6b968736679@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8fa336bd-339f-40e0-08fe-e6b968736679@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Peter Jones <pjones@redhat.com>, Dave Olsthoorn <dave@bewaar.me>, x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-input@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Mar 18, 2020 at 02:56:23PM +0100, Hans de Goede wrote:
> Hi Greg,
> 
> On 3/18/20 2:27 PM, Greg Kroah-Hartman wrote:
> > On Fri, Jan 24, 2020 at 10:16:48AM +0100, Hans de Goede wrote:
> > > Hi,
> > > 
> > > On 1/24/20 9:57 AM, Greg Kroah-Hartman wrote:
> > > > On Wed, Jan 15, 2020 at 05:35:47PM +0100, Hans de Goede wrote:
> > > > > This is a preparation patch for adding a new platform fallback mechanism,
> > > > > which will have its own enable/disable FW_OPT_xxx option.
> > > > > 
> > > > > Note this also fixes a typo in one of the re-wordwrapped comments:
> > > > > enfoce -> enforce.
> > > > > 
> > > > > Acked-by: Luis Chamberlain <mcgrof@kernel.org>
> > > > > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > > > 
> > > > I've taken this in my tree for now in a quest to try to get others to
> > > > pay attention to this series...
> > > 
> > > Thank you.
> > > 
> > > As mentioned before I believe that this series is ready for merging now.
> > > 
> > > Andy Lutomirski had one last change request for v12 of the second
> > > patch in the series, specifically to replace the loop searching for
> > > the prefix with a memem, but the kernel does not have memmem.
> > > 
> > > Andy, are you ok with v12 as is, given that we don't have memmem ?
> > > 
> > > Assuming Andy is ok with v12 as is, then to merge this we need
> > > to probably wait for 5.6-rc1 and then have the x86/efi folks do
> > > an immutable branch with the first 2 patches of the series.
> > 
> > Did this every happen?  Or do I need to dump this all into my tree?
> 
> Ard has done a immutable branch with just the 2 patches:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git/tag/?h=stable-shared-branch-for-driver-tree
> 
> I did not see any mails about this being pulled / merged, but I just
> checked and this has landed in the tip tree 10 days ago:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/log/include/linux/efi.h?h=efi/core
> 
> So if you merge the stable-shared-branch-for-driver-tree tag and then
> merge patches 3-8 of this series (or rather 4-8 since you already
> merged 3 IIRC) that would be great.

Ok, I've merged the above branch with just the two patches, and the rest
of yours now, sorry this took so long.

greg k-h
