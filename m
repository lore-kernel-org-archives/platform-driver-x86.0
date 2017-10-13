From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH v7 10/15] platform/x86: dell-smbios: add filtering
 capability for requests
Date: Fri, 13 Oct 2017 11:43:14 +0200
Message-ID: <20171013094314.GB29864@kroah.com>
References: <cover.1507733291.git.mario.limonciello@dell.com>
 <83dc225624f1cde5ee1797aebc945732444ded91.1507733291.git.mario.limonciello@dell.com>
 <20171012110903.3ab4ed5e@alans-desktop>
 <20171013004645.GB1470@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171013004645.GB1470@fury>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Alan Cox <gnomes@lxorguk.ukuu.org.uk>, Mario Limonciello <mario.limonciello@dell.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Oct 12, 2017 at 05:46:45PM -0700, Darren Hart wrote:
> On Thu, Oct 12, 2017 at 11:09:03AM +0100, One Thousand Gnomes wrote:
> > On Wed, 11 Oct 2017 11:27:36 -0500
> > Mario Limonciello <mario.limonciello@dell.com> wrote:
> > 
> > > There are some categories of tokens and SMBIOS calls that it makes
> > > sense to protect userspace from accessing.  These are calls that
> > > may write to one time use fields or activate hardware debugging
> > > capabilities.  They are not intended for general purpose use.
> > > 
> > > This same functionality may be be later extended to also intercept
> > > calls that may cause kernel functionality to get out of sync if
> > > the same functions are used by other drivers.
> > 
> > This doesn't work. You are creating an API. If you then have to remove
> > parts of the API because it messes stuff up you break your API guarantee.
> > 
> > As I said before, this needs to be a whitelist of stuff that is safe, and
> > it needs to have a security model. When you make a feature available you
> > can't nicely take it away again as you'll break people's user space.
> > 
> > Start with a whitelist of the ones you know people want to use, or that
> > your existing tooling you want to enable uses. Add others as needed in
> > future releases of the kernel.
> 
> Hi Alan,
> 
> I've attempted to get a focused discussion on this topic a few times,
> but have failed to get it the focus in really needs. Thanks for bringing
> it up. I look forward to your thoughts on the following:
> 
> The core of the issue is we are trying to achieve feature parity with
> Windows using the Windows Management Instrumentation (WMI) mechanism.
> I'm trying to support vendors like Dell in their attempts to do so, and
> acknowledging that this involves supporting a platform which was
> designed according to the norms and standards of the windows ecosystem.

Note, we really don't care what Windows does, as I really doubt they
care what we do, so this isn't a valid decision.  Do we also care about
OS-X and how it handles WMI?  :)

> This WMI mechanism was designed to enable vendors to create management
> tools which could talk to interfaces their firmware exposed for this
> purpose without any platform specific OS driver or vendor specific
> knowledge on the part of the OS driver [1].

That was how Microsoft designed it, due to totally different
requirements of their ecosystem.  You really can't compare the two for
obvious reasons, and I think that's the major disconnect here.

> The result of this design decision is as you would expect: there is no
> consistency in design, no guarantee of interfaces with functional
> boundaries, across the various WMI interface implementations across
> vendors (or even within the interface of a given vendor on a given
> platform).

See, different ecosystem, I like ours better :)

> The result is a mechanism which is fundamentally incompatible with
> standard Linux kernel approach to isolating userspace from the firmware.
> WMI enumerates available data, methods, and events, and shepherds a
> buffer of bits back and forth between firmware and userspace through
> these methods.
> 
> Over the last few months, I've worked with Mario, Pali, Andy L, and
> others to try and find an acceptable way to support Dell in their
> efforts, while respecting Linux's design principles.
> 
> The first concession was to agree not to automatically publish a WMI
> interface to userspace. This series includes the mechanism which
> requires a GUID-specific driver to be written and to provide the file
> ops structure, explicitly requesting the character device. This creates
> a WMI GUID granular whitelist. I'm willing to deny any such driver which
> is sent for review without the explicit collaboration of the vendor, to
> ensure they are doing their due diligence with respect to their firmware
> implementation. There has been some discussion in this thread regarding
> Dell's firmware testing, and the access these interfaces have to
> critical hardware resources.

How are you going to prevent out-of-tree drivers from using this same
api to directly get access to the WMI interface without using any type
of whitelist or review?

> The second concession was to acknowledge that some features implemented
> in WMI are rightly the domain of the Linux kernel. LEDs, RFKill,
> Backlight control, hotkey support, etc. When an exported GUID is used
> for these purposes in addition to whatever purpose userspace requires
> (see my comment above about a lack of functional boundaries in the
> exported interfaces), we will provide a way to filter these usages. As
> Mario said, we can either return an error, or we can attempt to handle
> the request via the appropriate Linux kernel subsystem connections.

That's great, but I don't see that in the patches posted, did I miss it?

> From the Linux kernel side, the ask is that we acknowledge that it is
> not practical to audit every WMI interface to present a set of
> functional knobs to userspace - because they were specifically designed
> without that requirement.

Not true, we can audit whatever we want.  whitelists are good for this
very reason.  Just because a vendor is used to replacing any part of the
OS with their own custom api direct to the hardware in other operating
systems, doesn't mean that we have to also emulate that crazy api as
well, especially given that it can be easily abused, as we discussed
before.

> The platform was designed in this way specifically to optimize the
> software support effort on the part of the vendor. They don't write
> Windows OS drivers for these mechanisms, it is unrealistic to expect
> them to write them for Linux.

Note, we write drivers for hardware for free if asked, so is it
unrealistic to require a kernel driver if we offer to do it for them? :)

> I believe we need to arrive at a compromise which allows a vendor to
> work upstream like Mario is doing on behalf of Dell to fully enable
> their platforms as they were designed on Linux, while ensuring we don't
> adversely affect the functionality or security of other platforms. I
> believe the whitelist and blacklist above provides for this compromise.
> 
> Perhaps an additional concession we should consider is to make exporting
> WMI interfaces a configuration option. If not set, the drivers will
> continue to work, but the WMI bus driver will not create the character
> device, even if requested. This would allow vendors to create a fully
> supported platform using upstream code, while allowing individuals the
> control to disable WMI userspace functionality if they don't trust the
> mechanism.

config options do not work, distros have to turn them all on, you know
that...

> The alternative seems to be that we accept these features will not be
> available on Linux for these platforms, or that vendors will develop a
> single wmi mapping driver out of tree, likely without the noted
> concessions.

So you are saying they are blackmailing us that if we do not provide
these wide-open api, then they just will take their toys and go home?
In other words, back where we are today?  :)

I understand the goal here of getting this to all work properly, but
note that this is a different type of an operating system, and for some
things, maybe we just do not allow direct userspace access for the
obvious reasons (security, maintance, auditability, long-term-support,
etc.)  A whitelist of known-good commands sounds like a good place to
start, why not start with that and go from there?

thanks,

greg k-h
