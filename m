From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: WMI and Kernel:User interface
Date: Tue, 13 Jun 2017 18:57:14 +0200
Message-ID: <20170613165714.GB32546@kroah.com>
References: <20170509231639.GB11404@fury>
 <201706101236.40663@pali>
 <20170612170249.GA27850@fury>
 <201706130017.29023@pali>
 <20170613012435.GB27850@fury>
 <20170613070535.GA13252@infradead.org>
 <20170613153857.GC27850@fury>
 <20170613155000.GA24483@kroah.com>
 <CALCETrUMegZYe8vnikoRw3yN2GqubX=Xi3b26wzB0p407QOfOQ@mail.gmail.com>
 <6e3ce02ce8b74710a3335b4cfa13b9af@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:51464 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752253AbdFMQ5X (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Jun 2017 12:57:23 -0400
Content-Disposition: inline
In-Reply-To: <6e3ce02ce8b74710a3335b4cfa13b9af@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: luto@kernel.org, dvhart@infradead.org, hch@infradead.org, pali.rohar@gmail.com, torvalds@linux-foundation.org, andriy.shevchenko@linux.intel.com, rjw@rjwysocki.net, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

On Tue, Jun 13, 2017 at 04:12:41PM +0000, Mario.Limonciello@dell.com wrote:
> > > So 2-3 months seems really long to me.
> > >
> > 
> 
> Unless you catch the cycle just right, 8 weeks is normal for the delay to 
> get a patch through a distro to an end user's machine.
> They go through their own stable testing and let it bake before it's promoted.

Then your distro sucks :)

And for a preinstall, you know this info way in advance of getting the
device out the door with the installed distro on it, right?  If not, you
need to work with a better company...

> > I should add that one thing that's really, really nice about Linux is
> > that, when you install it on a supported laptop, it works.  On
> > Windows, you end up with a horrible pile of bloated, buggy,
> > unsupported userspace crapware to make random buttons work.
> > 
> > While I'm all for improving the managability situation on Linux, let's
> > please make sure we don't regress the ordinary laptop functionality
> > story and make it as bad as it is on Windows.  We're currently in a
> > surprising situation in which laptops frequently work *better* on
> > Linux than Windows, and I think we should preserve that.
> 
> So it's worth mentioning the main impetus for this (at least from my
> company's perspective - but I expect others would share it) is to
> make manageability work out of the box without having to install
> additional proprietary tools.

Yeah, I think we all agree on this.

> Getting there requires work in a few areas:
> 1) The OEM/IBV exports the methods and the MOF (in binary form)
> that describes the objects that can be interacted with and what
> kind of data needs to be sent.

What do you mean by this?

> 2) Kernel needs to provide a way to userspace to get to this data

Why, what can userspace do with this?

> 3) A userspace OMI provider needs to be developed to read the 
> MOF and load the accessible objects into a repository.
> 4) OMI tools can then interact with the OMI repository.

English explaination for all of this please?

What does this have to do with hooking up the wifi and brightness keys?
What about the led controls?  What else is exposed here?

> On the Windows side, you can "in-box" do manageability if the
> OEM has done <1> this way.  You can use tools like powershell
> to directly interact with the OMI repository.

You ship powershell scripts to users?  And what do those scripts do?

> Why don't we want the same thing on the Linux side?  If you put
> up extra barriers to have to add ID's to a whitelist you are introducing
> delay and artificially making it more difficult for what?

I'm not trying to create any barriers, go add a blanket "all DELL
devices" to the whitelist now if you know what is going to be in your
future product path :)

Otherwise you will always have to add something to the kernel, as you
are creating brand new hardware interfaces all the time, and the
kernel's job is to mediate them and expose them to userspace in a common
manner.

thanks,

greg k-h
