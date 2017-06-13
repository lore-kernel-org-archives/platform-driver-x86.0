From: Darren Hart <dvhart@infradead.org>
Subject: Re: WMI and Kernel:User interface
Date: Tue, 13 Jun 2017 09:07:32 -0700
Message-ID: <20170613160732.GE27850@fury>
References: <20170509231639.GB11404@fury>
 <201706101236.40663@pali>
 <20170612170249.GA27850@fury>
 <201706130017.29023@pali>
 <20170613012435.GB27850@fury>
 <20170613125107.GH5248@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:49274 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751768AbdFMQHi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Jun 2017 12:07:38 -0400
Content-Disposition: inline
In-Reply-To: <20170613125107.GH5248@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Mario Limonciello <mario_limonciello@dell.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rafael Wysocki <rjw@rjwysocki.net>, Andy Lutomirski <luto@amacapital.net>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

On Tue, Jun 13, 2017 at 02:51:07PM +0200, Pali Rohár wrote:
> If function of that WMI method is in Windows world handled by userspace,
> it does not mean that in Linux we need to create way how to handle such
> thing in userspace -- argument "WMI was designed to access firmware
> functions from userspace" is not relevant in such Linux scenario.

We're looping now :-) We disagree on this point. That's OK, I think I
see a solution that will address both sides coming.

> > Ideally, we would provide a generic way for users/OEMs/vendors to successfully
> > support and maintain their own platforms, ideally with as little kernel changes
> > as possible. If we can get closer to that than we are today with this WMI work,
> > I think that is worth the effort.
> 
> If OEM vendors are uncooperative, why should be ever create some
> interface to call WMI methods? That looks like "we are going to cook

This line of thinking just leads to a stalemate in my opinion.

> something, we do not know who will eat it nor how it should taste".
> 
> I know only Mario from Dell and their need to call SMBIOS functions
> exported by one WMI GUID. Why no other OEM vendor entered into this
> discussion?

I'm really happy to see the level of interaction from Dell we are
seeing.  They're doing the right thing, engaging the kernel development
community in an open environment, at the right conferences, etc. That's
enough for me to engage and work on solving a problem with them.

> 
> Even if there are bugs, GPLv2 license of kernel allows anybody to fix
> them.
> 
> EULA of 3rd vendor closed userspace application not only disallow it,
> but also make it impossible (due to missing public sources).

You're conflating issues by assuming that any user of the WMI userspace
interface will be proprietary. Sure, some will, just as some kernel
modules are binary, but that argument can be applied to any interface.

> 
> > > Userspace applications, and if we are talking about WMI, would be 
> > > probably 3rd party vendor closed-source binaries compiled for one or two 
> > > specific Linux distributions. For me it is just "random userspace 
> > > application" which I do not thing that would be preinstalled or part of 
> > > Linux distributions, like it is for coreutils or X Server today.
> > 
> > That is certainly not the outcome we'd be aiming for.
> 
> Keep in mind that switching WMI to userspace for new features would mean
> need to install that software to make "new feature" work correctly. And
> user would be needed to install it from vendor after installation of
> system or distributions starts to packs ton of vendor closed source
> software... No I think having need for such blobs is really way to the
> hell for Linux world.

Again, you're assuming that if it isn't in the kernel it will be poor
quality, binary only, and distro dependent. Even if a vendor did attempt
something like that, there is nothing preventing interested users from
creating an open source solution that would be distro agnostic. And,
with the wmi method proxy concept, we could still just do it in the
kernel.

> > 
> > As to the "OK fine, but what are we actually going to do..." bit...
> > 
> > In order to support broad enabling, we should avoid Whitelists which would
> > require we add new GUIDs to the kernel as fast as vendors can add them.
> 
> Based on fact that whitelisting is trivial to manage and easy to
> implement, I do not think that avoiding whitelisting it a good idea.

As above, it isn't just the technical complexity, which is obviously
trivial, it's the timeline. It's possible dynamic IDs may address this.
I believe the proxy method also addresses the underlying concerns.

I don't see a compelling enough reason to manage GUID whitelists.

> 
> > If we require filtering, it should be along the lines of an ACCEPT/DENY filter,
> > which only denies specific accesses. Drivers which match a WMI GUID can register
> > a filter callback, returning true or false (accept or deny). This would allow
> > for the creation of management tools in cooperation with the existing
> > drivers, without precluding the development of userspace platform-daemons which
> > could handle all aspects of the WMI interface (if they conflict with an existing
> > driver, they would need to run without that driver, which would avoid loading
> > the WMI filter).
> 
> Yes, agree. And if filtering for current WMI kernel driver is hard (or
> impossible), then such filter implemented in WMI driver would DENY any
> call from userspace.
> 
> > Possible concerns, as before, we run the risk of a new driver being written, or
> > a new feature being added to an existing driver, that needs to add a filter
> > which would then deny userspace accesses previously allowed. It becomes a first
> > to support the platform race.
> 
> With whitelisting the risk is lower. And we can mark userspace interface
> as experimental for now and make part of interface that kernel can block
> arbitrary userspace request.

And finally, to the filter vs. proxy idea - phew! :-)

It occurred to me this morning while thinking about this problem and
considering Greg KH's previous comment about it's OK to change the
interface, so long as it doesn't break anything. If instead of DENYing a
method call, we allow a driver to PROXY a method call, we make the
change transparent to userspace, and still retain the ability for kernel
drivers to claim ownership of certain WMI method signatures, and ensure
consistent internal state.

When a WMI driver binds to a GUID, it can also register a
wmi_method_proxy for that GUID. When a method call is received, the
proxy is called with the method ID, input and output buffers. The proxy
can choose to handle the call itself and populate the output buffer, or
not, and let the WMI system execute it.

-- 
Darren Hart
VMware Open Source Technology Center
