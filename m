From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH 3/3] Capture cable events created by Alienware GFX
 Amplifier.
Date: Thu, 28 May 2015 13:34:50 -0700
Message-ID: <20150528203450.GA26895@kroah.com>
References: <1432755422-26024-1-git-send-email-mario_limonciello@dell.com>
 <1432755422-26024-4-git-send-email-mario_limonciello@dell.com>
 <5566573D.4000300@dell.com>
 <20150528183036.GB25345@kroah.com>
 <5567635A.9060607@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:58298 "EHLO
	out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754530AbbE1UfA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 28 May 2015 16:35:00 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id AA4AF20E9B
	for <platform-driver-x86@vger.kernel.org>; Thu, 28 May 2015 16:34:59 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <5567635A.9060607@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario_limonciello@dell.com>
Cc: "matthew.garrett@nebula.com" <matthew.garrett@nebula.com>, LKML <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

On Thu, May 28, 2015 at 01:50:02PM -0500, Mario Limonciello wrote:
> 
> 
> On 05/28/2015 01:30 PM, Greg KH wrote:
> >On Wed, May 27, 2015 at 06:46:05PM -0500, Mario Limonciello wrote:
> >Then fix the GPU drivers.
> >
> >Fix the GPU drivers.
> >
> >Fix the GPU drivers.
> >
> >Nope, fix the GPU drivers.
> >
> >With a fix for the GPU drivers?  Great, that's the only acceptable
> >solution.
> >
> >thanks,
> >
> >greg k-h
> Thanks for the feedback, point taken that you don't want to see the system
> restart when the xGPU is removed from the system.  Can you please help to
> advise me the flow you would realistically like to see here?  I'm looking
> for the best experience for the end user with what the situation is with the
> Xorg architecture.

I suggest asking about xorg specifics to the xorg developers, they know
this much better than kernel developers do :)

> Also, there's two factors I'd like to draw attention to that the Other OS
> can support.
> 
> 1) It supports something called Heterogenous graphics.  That means that you
> can actually have a GPU from Intel, NVIDIA, and AMD all in the system at the
> same time with acceleration active.  If one drops off the bus, the OS moves
> the apps rendering to that GPU over (or kills them if they can't be moved).
> Xorg supports having multiple GPU's via Xinerama, but HW acceleration is
> disabled.  No one on a gaming PC would actually use Xinerama.
> So you can-not simultaneously use an NVIDIA, AMD and Intel GPU in a gaming
> PC on Linux's Xorg architecture.  Even if you got to the ideal scenario of
> using all 3 GPU's with open source drivers, this is still a problem for
> Linux w/ Xorg.

Take it up with the xorg developers, but I think this might already
work, as there are laptops that do allow switching between gpus pretty
easily.  Well, "easily" is relative, it depends on the specific laptop.

But in no case is the solution "reboot the box", never do that.

> 2) If the xGPU is the active GPU on the system and someone removes the cable
> what should happen?  Remember, you can only have one GPU active in Xorg.

Again, take this up with the xorg developers, this isn't a kernel
limitation from what I can tell.

best of luck,

greg k-h
