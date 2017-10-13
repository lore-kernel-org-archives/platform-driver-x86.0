From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v7 10/15] platform/x86: dell-smbios: add filtering
 capability for requests
Date: Fri, 13 Oct 2017 09:37:55 -0700
Message-ID: <20171013163755.GA18171@fury>
References: <cover.1507733291.git.mario.limonciello@dell.com>
 <83dc225624f1cde5ee1797aebc945732444ded91.1507733291.git.mario.limonciello@dell.com>
 <20171012110903.3ab4ed5e@alans-desktop>
 <20171013004645.GB1470@fury>
 <20171013094314.GB29864@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:42760 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751829AbdJMQiB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 13 Oct 2017 12:38:01 -0400
Content-Disposition: inline
In-Reply-To: <20171013094314.GB29864@kroah.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Alan Cox <gnomes@lxorguk.ukuu.org.uk>, Mario Limonciello <mario.limonciello@dell.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de

On Fri, Oct 13, 2017 at 11:43:14AM +0200, Greg KH wrote:

Hi Greg, first off - thanks for the response and the time you spent on
it. My reply is longer than I'd like, but I'm not having much luck
trimming it down without omitting things I think need to be noted. And
as I try, the thread keeps getting longer. Ahhhhh :-) So I'm sending
this now, and will continue with the rest of the thread. Yikes.

> On Thu, Oct 12, 2017 at 05:46:45PM -0700, Darren Hart wrote:
> > On Thu, Oct 12, 2017 at 11:09:03AM +0100, One Thousand Gnomes wrote:
> > > On Wed, 11 Oct 2017 11:27:36 -0500
> > > Mario Limonciello <mario.limonciello@dell.com> wrote:
> > > 
> > > > There are some categories of tokens and SMBIOS calls that it makes
> > > > sense to protect userspace from accessing.  These are calls that
> > > > may write to one time use fields or activate hardware debugging
> > > > capabilities.  They are not intended for general purpose use.
> > > > 
> > > > This same functionality may be be later extended to also intercept
> > > > calls that may cause kernel functionality to get out of sync if
> > > > the same functions are used by other drivers.
> > > 
> > > This doesn't work. You are creating an API. If you then have to remove
> > > parts of the API because it messes stuff up you break your API guarantee.
> > > 
> > > As I said before, this needs to be a whitelist of stuff that is safe, and
> > > it needs to have a security model. When you make a feature available you
> > > can't nicely take it away again as you'll break people's user space.
> > > 
> > > Start with a whitelist of the ones you know people want to use, or that
> > > your existing tooling you want to enable uses. Add others as needed in
> > > future releases of the kernel.
> > 
> > Hi Alan,
> > 
> > I've attempted to get a focused discussion on this topic a few times,
> > but have failed to get it the focus in really needs. Thanks for bringing
> > it up. I look forward to your thoughts on the following:
> > 
> > The core of the issue is we are trying to achieve feature parity with
> > Windows using the Windows Management Instrumentation (WMI) mechanism.
> > I'm trying to support vendors like Dell in their attempts to do so, and
> > acknowledging that this involves supporting a platform which was
> > designed according to the norms and standards of the windows ecosystem.
> 
> Note, we really don't care what Windows does, as I really doubt they
> care what we do, so this isn't a valid decision.  Do we also care about
> OS-X and how it handles WMI?  :)
> 
> > This WMI mechanism was designed to enable vendors to create management
> > tools which could talk to interfaces their firmware exposed for this
> > purpose without any platform specific OS driver or vendor specific
> > knowledge on the part of the OS driver [1].
> 
> That was how Microsoft designed it, due to totally different
> requirements of their ecosystem.  You really can't compare the two for
> obvious reasons, and I think that's the major disconnect here.
> 
> > The result of this design decision is as you would expect: there is no
> > consistency in design, no guarantee of interfaces with functional
> > boundaries, across the various WMI interface implementations across
> > vendors (or even within the interface of a given vendor on a given
> > platform).
> 
> See, different ecosystem, I like ours better :)
> 

I'm not sure if you're agreeing with me or arguing with me :-)

The point I'm trying to make is that the this platform (and most laptops
and PCs) was designed for the windows ecosystem, and is part of that
ecosystem. They are very different, as you say above, and that means
that it isn't reasonable to expect that platform to fit in nicely with
the Linux ecosystem when it was designed for a very different one. I
think that needs to be acknowledged as we try to support these
platforms. Round hole, square peg... legos and tinker toys... whatever
metaphor works.

> > The result is a mechanism which is fundamentally incompatible with
> > standard Linux kernel approach to isolating userspace from the firmware.
> > WMI enumerates available data, methods, and events, and shepherds a
> > buffer of bits back and forth between firmware and userspace through
> > these methods.
> > 
> > Over the last few months, I've worked with Mario, Pali, Andy L, and
> > others to try and find an acceptable way to support Dell in their
> > efforts, while respecting Linux's design principles.
> > 
> > The first concession was to agree not to automatically publish a WMI
> > interface to userspace. This series includes the mechanism which
> > requires a GUID-specific driver to be written and to provide the file
> > ops structure, explicitly requesting the character device. This creates
> > a WMI GUID granular whitelist. I'm willing to deny any such driver which
> > is sent for review without the explicit collaboration of the vendor, to
> > ensure they are doing their due diligence with respect to their firmware
> > implementation. There has been some discussion in this thread regarding
> > Dell's firmware testing, and the access these interfaces have to
> > critical hardware resources.
> 
> How are you going to prevent out-of-tree drivers from using this same
> api to directly get access to the WMI interface without using any type
> of whitelist or review?

I don't think that's the right question. The interface we're proposing
here is more complex than a simple wmi-mapping driver would be. If
someone were to create an out of tree driver, I suspect they would start
by writing that, and the rest is moot. Map all WMI calls to userspace,
export the MOF, done. Just like Windows. No need to write any platform
specific drivers at all. I'm not saying it's right or even a good idea,
but it's the shortest path to do what they want, and it's consistent
with what they already do, and would simplify the porting of the
userspace management applications.

> > The second concession was to acknowledge that some features implemented
> > in WMI are rightly the domain of the Linux kernel. LEDs, RFKill,
> > Backlight control, hotkey support, etc. When an exported GUID is used
> > for these purposes in addition to whatever purpose userspace requires
> > (see my comment above about a lack of functional boundaries in the
> > exported interfaces), we will provide a way to filter these usages. As
> > Mario said, we can either return an error, or we can attempt to handle
> > the request via the appropriate Linux kernel subsystem connections.
> 
> That's great, but I don't see that in the patches posted, did I miss it?
> 

New in v7. Patch 10/15 (this one). I would expect to see more of this in
the other and future *-wmi drivers where a MOF is available and methods
are used for both Linux internal things (LEDs, hotkeys) and for
management tasks. Hopefully we don't see a lot of those oversubscribed
GUIDs, but nothing in the spec discourages that - which means we'll see
more than we'd like I'm sure :-(

> > From the Linux kernel side, the ask is that we acknowledge that it is
> > not practical to audit every WMI interface to present a set of
> > functional knobs to userspace - because they were specifically designed
> > without that requirement.
> 
> Not true, we can audit whatever we want.  whitelists are good for this
> very reason.  Just because a vendor is used to replacing any part of the
> OS with their own custom api direct to the hardware in other operating
> systems, doesn't mean that we have to also emulate that crazy api as
> well, especially given that it can be easily abused, as we discussed
> before.

It's technically feasible, sure. My argument is that it isn't practical.
Meaning vendors won't do it. It's actively contrary to the intent of the
WMI mechanism, which means the interfaces won't have been designed to
facilitate audit by the OS, and these audits have the potential to turn
into incredibly complex bit checks. I discussed this previously here:

https://lkml.org/lkml/2017/6/13/147

| > > And filter layer which will accept only WMI calls which are safe for
| > > currently loaded/used kernel modules seems like a sane idea to ensure
| > > functionality of kernel plus allow userspace to do other things.
| >
| > My biggest concern with this approach is maintenance. Because we would be doing
| > something unforeseen by the specification, the various vendor implemented WMI
| > APIs are not likely to be amenable to filtering. I can see these filters
| > getting extremely complicated. They are "high touch", by which I mean each
| > generation of platform may require subtle tweaks, which will be difficult to
| > verify they don't break past generations.
|
| Agreed.  As mentioned before I think the only sensible approach is
| white listing GUIDs that have a valid userspace use case.  And use
| the dynamic IDs approach to add them for debugging and reverse
| engineering.

But, see the link for Christoph's full take on the subject :-)

> > The platform was designed in this way specifically to optimize the
> > software support effort on the part of the vendor. They don't write
> > Windows OS drivers for these mechanisms, it is unrealistic to expect
> > them to write them for Linux.
> 
> Note, we write drivers for hardware for free if asked, so is it
> unrealistic to require a kernel driver if we offer to do it for them? :)

In my opinion, yes, it is. The system was designed to be driver-less. No
company is going to place their product delivery schedule in the hands
of an unpaid contractor who gets to dictate to them how their platform
should be designed from the perspective of an OS with a tiny fraction of
their install base. This is fundamentally different from how their
entire organization is structured, and it's unrealistic to expect them
to change that to support Linux on a laptop. Even if there were a few
success stories, the model obviously can't scale. Vendors need to be
able to design and implement their platform support on their own
schedule and as independently as possible.

Note, from the same link above, Christoph disagrees with me strongly on
this point:

| Hell no!  The last thing we need on Linux is systems that once support
| us added don't just work out of the box because you're missing your
| vendor blob.

Note that Mario has already posted links to the sources for the tools
interacting with this interface, and the previous mechanism (libsmbios)
source have also been publicly available. Perhaps we continue to make
this a requirement to expose WMI features - an open source userspace
client which uses them (seems we do that for other interfaces anyway).

What I would tell Intel teams when trying to get them to work upstream
to enable customers to build designs with their products was: Enable
them to enable themselves, and get out of their way. I think a similar
approach is required here.

> > I believe we need to arrive at a compromise which allows a vendor to
> > work upstream like Mario is doing on behalf of Dell to fully enable
> > their platforms as they were designed on Linux, while ensuring we don't
> > adversely affect the functionality or security of other platforms. I
> > believe the whitelist and blacklist above provides for this compromise.
> > 
> > Perhaps an additional concession we should consider is to make exporting
> > WMI interfaces a configuration option. If not set, the drivers will
> > continue to work, but the WMI bus driver will not create the character
> > device, even if requested. This would allow vendors to create a fully
> > supported platform using upstream code, while allowing individuals the
> > control to disable WMI userspace functionality if they don't trust the
> > mechanism.
> 
> config options do not work, distros have to turn them all on, you know
> that...
> 

As I understand it, the distros will also take out of tree drivers and
patches to support hardware platforms for partners, so I think that
battle is already lost. I'd much rather have them integrating upstream
code we have some influence over.

If a CONFIG option is not acceptable, perhaps a runtime sysfs toggle?

Or something like the factory=1 module parameter Alan mentioned to
Mario.

> > The alternative seems to be that we accept these features will not be
> > available on Linux for these platforms, or that vendors will develop a
> > single wmi mapping driver out of tree, likely without the noted
> > concessions.
> 
> So you are saying they are blackmailing us that if we do not provide
> these wide-open api, then they just will take their toys and go home?
> In other words, back where we are today?  :)
> 

That's a fun sound byte, but not what I said. ;-) I'm trying to address
a practical reality. We're at a disadvantage because we're a minority OS
for these types of systems. I think we'd all like stronger support for
these platforms, and getting the vendors involved will help that.

If all they have to do on Windows to support these features is update
their management application, while on Linux they have to write a driver
for every platform and GUID, and on top of that perform an audit in the
kernel driver - all of which pushes more high maintenance platform
specific knowledge into the Linux kernel... (effort which duplicates
whatever they have done within the platform firmware already) I just
don't believe any vendor will be able to justify the expense.

> I understand the goal here of getting this to all work properly, but
> note that this is a different type of an operating system, and for some
> things, maybe we just do not allow direct userspace access for the
> obvious reasons (security, maintance, auditability, long-term-support,
> etc.)  A whitelist of known-good commands sounds like a good place to
> start, why not start with that and go from there?

This was my initial position on this as well. A clearly defined
functional interface from firmware which we can pick and choose how to
export to userspace would be the ideal. Unfortunately, that just isn't
what WMI is. As I mentioned above, at its core, WMI methods accept an
arbitrarily sized bucket of bits. The notion of a "command" doesn't
exist in the specification. I'm also not confident we can be sure these
interfaces don't change over time from platform to platform (just
another possible artifact from the design and intent of WMI).

I forgot to mention the third concession yesterday. For future drivers
for which the firmware provides a MOF (this one doesn't), we plan to do
the MOF parsing within the kernel instead of just in userspace to
provide some level of automated audit by the WMI subsystem - but it
isn't yet clear to me how useful that will really be (suspect we can
check types, but not values or ranges).

I understand our (kernel maintainers') desire to mediate between
userspace and firmware. I'm wondering if Alan's point about
CAP_SYS_RAWIO is something that needs more consideration. Windows has a
number of "namespace access settings" which limit the use of WMI,
perhaps this would provide a similar parallel?

https://msdn.microsoft.com/en-us/library/aa822575(v=vs.85).aspx

I also understand the vendors' position of owning their platforms and
using a common mechanism across OSes. In this case, and given the level
of involvement from Dell in particular and their publication of the
userspace tools and the whitelist and blacklist concessions, I think the
right thing, and the only practical way to see WMI supported through
upstream code, is to allow for WMI to be implemented in Linux in a way
that is compatible with how they designed their platforms.

-- 
Darren Hart
VMware Open Source Technology Center
