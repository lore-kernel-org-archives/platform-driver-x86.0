From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: WMI and Kernel:User interface
Date: Tue, 13 Jun 2017 14:51:07 +0200
Message-ID: <20170613125107.GH5248@pali>
References: <20170509231639.GB11404@fury>
 <201706101236.40663@pali>
 <20170612170249.GA27850@fury>
 <201706130017.29023@pali>
 <20170613012435.GB27850@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f175.google.com ([209.85.128.175]:36013 "EHLO
        mail-wr0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752480AbdFMMvL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Jun 2017 08:51:11 -0400
Content-Disposition: inline
In-Reply-To: <20170613012435.GB27850@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Mario Limonciello <mario_limonciello@dell.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rafael Wysocki <rjw@rjwysocki.net>, Andy Lutomirski <luto@amacapital.net>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

On Monday 12 June 2017 18:24:35 Darren Hart wrote:
> > One thing is design of some system, another thing is real usage. We know 
> > that WMI is used for reporting events when some keys are pressed (e.g. 
> > Fn keys) or used for enabling/disabling of radio devices or controlling 
> > keyboard/LID backlight. All those parts are in Linux world handled by 
> > kernel (not userspace) and therefore WMI needs to be handled in Linux 
> > kernel.
> 
> These are examples of the subsystems I was referring to below. We can already
> assign LED triggers for some things. However, when the WMI method is
> specifically used as the mechanism for toggling the LED... yes, you make a good
> point.

I wanted to show that there are WMI methods doing functionality which is
handled by Linux kernel. And therefore it must be implemented in kernel.

If function of that WMI method is in Windows world handled by userspace,
it does not mean that in Linux we need to create way how to handle such
thing in userspace -- argument "WMI was designed to access firmware
functions from userspace" is not relevant in such Linux scenario.

> Ideally, we would provide a generic way for users/OEMs/vendors to successfully
> support and maintain their own platforms, ideally with as little kernel changes
> as possible. If we can get closer to that than we are today with this WMI work,
> I think that is worth the effort.

If OEM vendors are uncooperative, why should be ever create some
interface to call WMI methods? That looks like "we are going to cook
something, we do not know who will eat it nor how it should taste".

I know only Mario from Dell and their need to call SMBIOS functions
exported by one WMI GUID. Why no other OEM vendor entered into this
discussion?

> > > Arguably, implementing platform support with WMI through Linux kernel
> > > modules slows platform support as it is hindered by the barrier to
> > > entry and the kernel's release process - while a generic WMI
> > 
> > But we can say mainline kernel has better code quality as some random 
> > closed source 3rd vendor application.
> 
> While I think we work pretty hard at writing quality code, the code analysis
> studies I'm aware of (such as those being developed by the SIL2Linux MP project
> for the use of the Linux kernel in safety critical systems) support this
> statement for the most core code of the Linux kernel, the stuff that
> everything needs. This doesn't hold true of all parts of the kernel, however,
> with lower use drivers showing some of the highest bug rates of all subsystems
> (along with certain filesystems).

Even if there are bugs, GPLv2 license of kernel allows anybody to fix
them.

EULA of 3rd vendor closed userspace application not only disallow it,
but also make it impossible (due to missing public sources).

> > Userspace applications, and if we are talking about WMI, would be 
> > probably 3rd party vendor closed-source binaries compiled for one or two 
> > specific Linux distributions. For me it is just "random userspace 
> > application" which I do not thing that would be preinstalled or part of 
> > Linux distributions, like it is for coreutils or X Server today.
> 
> That is certainly not the outcome we'd be aiming for.

Keep in mind that switching WMI to userspace for new features would mean
need to install that software to make "new feature" work correctly. And
user would be needed to install it from vendor after installation of
system or distributions starts to packs ton of vendor closed source
software... No I think having need for such blobs is really way to the
hell for Linux world.

> > > > Question about API:
> > > > 
> > > > Are we going to export low-level ACPI methods? Or are we going to
> > > > implement BMOF parser in kernel and export high-level
> > > > class/function API to userspace with validation of input
> > > > parameters in kernel (to prevent passing garbage from userspace to
> > > > ACPI-WMI) like it is on Windows?
> > > 
> > > What we have discussed to date is exposing each WMI device as a
> > > character device. Userspace would select the method and pass a
> > > buffer formatted per the information provided by a userspace BMOF
> > > parser. This is consistent with the design goals of WMI, per the
> > > documentation. Specifically, that the mapping driver does not have
> > > any specific knowledge about the WMI GUIDs or methods.
> > 
> > Ok.
> > 
> 
> As to the "OK fine, but what are we actually going to do..." bit...
> 
> In order to support broad enabling, we should avoid Whitelists which would
> require we add new GUIDs to the kernel as fast as vendors can add them.

Based on fact that whitelisting is trivial to manage and easy to
implement, I do not think that avoiding whitelisting it a good idea.

> If we require filtering, it should be along the lines of an ACCEPT/DENY filter,
> which only denies specific accesses. Drivers which match a WMI GUID can register
> a filter callback, returning true or false (accept or deny). This would allow
> for the creation of management tools in cooperation with the existing
> drivers, without precluding the development of userspace platform-daemons which
> could handle all aspects of the WMI interface (if they conflict with an existing
> driver, they would need to run without that driver, which would avoid loading
> the WMI filter).

Yes, agree. And if filtering for current WMI kernel driver is hard (or
impossible), then such filter implemented in WMI driver would DENY any
call from userspace.

> Possible concerns, as before, we run the risk of a new driver being written, or
> a new feature being added to an existing driver, that needs to add a filter
> which would then deny userspace accesses previously allowed. It becomes a first
> to support the platform race.

With whitelisting the risk is lower. And we can mark userspace interface
as experimental for now and make part of interface that kernel can block
arbitrary userspace request.

-- 
Pali Rohár
pali.rohar@gmail.com
