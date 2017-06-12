From: Darren Hart <dvhart@infradead.org>
Subject: Re: WMI and Kernel:User interface
Date: Mon, 12 Jun 2017 10:02:49 -0700
Message-ID: <20170612170249.GA27850@fury>
References: <20170509231639.GB11404@fury>
 <20170609064151.GC17685@kroah.com>
 <20170610004641.GC22981@fury>
 <201706101236.40663@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201706101236.40663@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Mario Limonciello <mario_limonciello@dell.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rafael Wysocki <rjw@rjwysocki.net>, Andy Lutomirski <luto@amacapital.net>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Jun 10, 2017 at 12:36:40PM +0200, Pali Rohár wrote:
> On Saturday 10 June 2017 02:46:41 Darren Hart wrote:
> > On Fri, Jun 09, 2017 at 08:41:51AM +0200, Greg Kroah-Hartman wrote:
> > > On Sat, Jun 03, 2017 at 12:50:58PM -0700, Darren Hart wrote:
> > > > On Wed, May 10, 2017 at 07:13:41AM +0200, Greg Kroah-Hartman
> > > > wrote:
> > > > > On Tue, May 09, 2017 at 04:16:39PM -0700, Darren Hart wrote:
> > > > > > Linus and Greg,
> > > > > > 
> > > > > > We are in the process of redesigning the Windows Management
> > > > > > Instrumentation (WMI) [1] system in the kernel. WMI is the
> > > > > > Microsoft implementation of Web-Based Enterprise Management
> > > > > > (WBEM). We are looking to provide WMI access to userspace,
> > > > > > while allowing the kernel to filter requests that conflict
> > > > > > with its own usage. We'd like your take on how this approach
> > > > > > relates to our commitment to not break userspace.
> > > > > > 
> > > > > > For this discussion, we are specifically referring to ACPI
> > > > > > PNP0C14 WMI devices, consisting of a GUID and a set of
> > > > > > methods and events, as well as a precompiled intermediate
> > > > > > description of the methods and arguments (MOF). Exposed to
> > > > > > userspace, these methods provide for BIOS interaction and
> > > > > > are used for system management as well as LEDs, hot keys,
> > > > > > radio switches, etc. There is vendor interest in achieving
> > > > > > feature parity with Windows by exposing WMI methods to
> > > > > > userspace for system management.
> > > > > > 
> > > > > > While it appears WMI intended to be accessed from userspace,
> > > > > > we have made use of it in the kernel to support various
> > > > > > laptop features by connecting the WMI methods to other
> > > > > > subsystems, notably input, leds, and rfkill [2]. The
> > > > > > challenge is continuing to use WMI for these platform
> > > > > > features, while allowing userspace to use it for system
> > > > > > management tasks. Unfortunately, the WMI methods are not
> > > > > > guaranteed to be split up along granular functional lines,
> > > > > > and we will certainly face situations where the same
> > > > > > GUID::METHOD_ID will be needed for a kernel feature (say LED
> > > > > > support) as well as a system management task.
> > > > > > 
> > > > > > To address this, I have proposed [3] that exporting WMI be
> > > > > > opt-in, only done at the request of and in collaboration
> > > > > > with a vendor, with the kernel platform driver given the
> > > > > > opportunity to filter requests. This filtering would need to
> > > > > > be at the method and argument inspection level, such as
> > > > > > checking for specific bits in the input buffer, and
> > > > > > rejecting the request if they conflict with an in kernel
> > > > > > usage (that's worst case, in some cases just GUID or method
> > > > > > ID could be sufficient).
> > > > > > 
> > > > > > Because the kernel and the platform drivers are under
> > > > > > continual development, and new systems appear regularly, we
> > > > > > will encounter necessary changes to the platform driver WMI
> > > > > > request filters. These changes could be considered a change
> > > > > > to the kernel provided WMI interface to userspace. For
> > > > > > example, we could regularly accept a call to
> > > > > > $GUID::$METHOD_ID with bit 4 of the buffer set, and later
> > > > > > deny the call when we determine it interferes with kernel
> > > > > > usage.
> > > > > > 
> > > > > > In your view, is it acceptable to provide a chardev
> > > > > > interface, for example, exposing WMI methods to userspace,
> > > > > > with the understanding that the kernel may choose to filter
> > > > > > certain requests which conflict with its own use? And that
> > > > > > this filtering may change as new features are added to the
> > > > > > platform drivers?
> > > > > 
> > > > > So, for example, if a new driver for a "brightness key" were
> > > > > added to the kernel, all of a sudden the "raw" access to the
> > > > > wmi data through the chardev would filtered away by the kernel
> > > > > and not seen by userspace?
> > > > > 
> > > > > Why would you want to do that?  What's wrong with providing
> > > > > "raw" access through a chardev, and the current in-kernel
> > > > > access as well at the same time?
> > > > > 
> > > > > I don't really understand what would "break" over time here.
> > > > 
> > > > Just a bump now that we're out of the merge window in case either
> > > > Greg or Linus care to follow up with the responses to this.
> > > > 
> > > > To Greg's last point - any kernel state that is built up in
> > > > conjunction with the WMI interface could be invalidated by a
> > > > userspace application. It may or may not be recoverable,
> > > > depending on the WMI implementation. This would be true for
> > > > multiple WMI userspace applications as well, and I suppose the
> > > > question is, do we defend the kernel drivers against this, or do
> > > > we consider the kernel drivers on equal footing with WMI
> > > > applications, and say "don't do that then" when some combination
> > > > of apps and drivers don't play well together?
> > > 
> > > In the end, this shouldn't really matter, as long as nothing breaks
> 
> I have one objection here:
> 
> If two userspace applications start to fight and use one WMI device at 
> same time, then it is their (userspace) problem. In any case (how their 
> userspace fight finish) it does not affect kernel nor kernel drivers.
> 
> But once some "wrong" or "broken" userspace application starts to fight 
> with kernel WMI driver and kernel driver depends on internal WMI state, 
> then such application can cause problems to that kernel driver.
> 
> And we *must* avoid breakage of kernel drivers by just broken userspace 
> application. Such thing could be fatal for kernel and could case 
> problems in other kernel drivers (which depends on this WMI kernel 
> driver).
> 
> I think we cannot accept that some userspace application could use some 
> race condition in WMI/ACPI firmware to change internal state of kernel 
> WMI driver which could cause undefined behaviour of kernel.
> 

These are valid concerns in my opinion. They are, in part, of our own making
(see below re userspace daemons and the mapping driver). I believe we are at the
beginning of a fundamental shift in how we make use of WMI in the Linux world.
There will be some rough patches with the pre-existing WMI drivers within the
Linux kernel.

Admittedly, all of the dangerous corner cases are not evident - at least not to
me. This is in part why I proposed we take the first step, and use something
concrete to help expose such things.

> > > as far as a user notices.  And that's the key here, apis can
> > > change, but if you do it in a way that breaks something, or anyone
> > > notices, then it's not ok.
> > > 
> > > So I don't have a solid answer other than "good luck!" :)
> > > 
> > > greg k-h
> > 
> > Fair enough, thanks Greg.
> > 
> > To all involved. I propose we move forward with:
> > 
> > * Design the API
> >   - character device per WMI device
> >   - calling convention
> >   - platform proof of concept
> > 
> > Let's see this in practice. I hope this proves the point that we do
> > not have to filter these interfaces, since there is no clean way to
> > do this, and the kernel module is arguably no more valid a user of
> > WMI than a userspace application (perhaps less so given the intent
> > of the vendor and the mechanism itself).
> 
> What do you mean that kernel is no more valid user of WMI? We still have 
> a couple of WMI drivers and without correct functionality of them, lot 
> of notebooks would less usable for ordinary users.

Perhaps a poor choice of wording on my part. My point was just that for a system
like WMI, which was designed to expose firmware control to userspace, it is
inconsistent with the intent of the mechanism to grant the Linux kernel a
position of higher importance than that of a userspace management application.

Arguably, implementing platform support with WMI through Linux kernel modules
slows platform support as it is hindered by the barrier to entry and the
kernel's release process - while a generic WMI interface to userspace can be
readily used to write userspace drivers for these features. Obviously, there are
still some gaps with interaction with other subsystems.

WMI may prove to be another one of those subsystems where userspace drivers
facilitate faster innovation and platform enabling. This also helps reduce the
dead code we build up in the kernel supporting devices with relatively short
lifespans.

> I still think we need to some some filtering. Kernel and kernel modules 
> must not be confused by some random userspace application.

Keep in mind that WMI access will be a privileged operation, and I don't think
characterizing these as "random userspace applications" is any more valid than
"random kernel modules".

In hindsight, I suspect implementing more than the mapping driver in kernel
space will prove to have been a mistake. I understand why we did it, and why
that precedent expanded as it has, but at speed and scale, the support these
drivers provide would probably have been better implemented as userspace
platform daemons using the WMI interfaces.

> Question about API:
> 
> Are we going to export low-level ACPI methods? Or are we going to 
> implement BMOF parser in kernel and export high-level class/function API 
> to userspace with validation of input parameters in kernel (to prevent 
> passing garbage from userspace to ACPI-WMI) like it is on Windows?

What we have discussed to date is exposing each WMI device as a character
device. Userspace would select the method and pass a buffer formatted per the
information provided by a userspace BMOF parser. This is consistent with the
design goals of WMI, per the documentation. Specifically, that the mapping
driver does not have any specific knowledge about the WMI GUIDs or methods.

-- 
Darren Hart
VMware Open Source Technology Center
