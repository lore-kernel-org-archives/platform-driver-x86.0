From: Mario Limonciello <mario_limonciello@dell.com>
Subject: Re: [PATCH 3/3] Capture cable events created by Alienware GFX Amplifier.
Date: Thu, 28 May 2015 13:50:02 -0500
Message-ID: <5567635A.9060607@dell.com>
References: <1432755422-26024-1-git-send-email-mario_limonciello@dell.com> <1432755422-26024-4-git-send-email-mario_limonciello@dell.com> <5566573D.4000300@dell.com> <20150528183036.GB25345@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150528183036.GB25345@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: "matthew.garrett@nebula.com" <matthew.garrett@nebula.com>, LKML <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org



On 05/28/2015 01:30 PM, Greg KH wrote:
> On Wed, May 27, 2015 at 06:46:05PM -0500, Mario Limonciello wrote:
> Then fix the GPU drivers.
>
> Fix the GPU drivers.
>
> Fix the GPU drivers.
>
> Nope, fix the GPU drivers.
>
> With a fix for the GPU drivers?  Great, that's the only acceptable
> solution.
>
> thanks,
>
> greg k-h
Thanks for the feedback, point taken that you don't want to see the 
system restart when the xGPU is removed from the system.  Can you please 
help to advise me the flow you would realistically like to see here?  
I'm looking for the best experience for the end user with what the 
situation is with the Xorg architecture.
Also, there's two factors I'd like to draw attention to that the Other 
OS can support.

1) It supports something called Heterogenous graphics.  That means that 
you can actually have a GPU from Intel, NVIDIA, and AMD all in the 
system at the same time with acceleration active.  If one drops off the 
bus, the OS moves the apps rendering to that GPU over (or kills them if 
they can't be moved).  Xorg supports having multiple GPU's via Xinerama, 
but HW acceleration is disabled.  No one on a gaming PC would actually 
use Xinerama.
So you can-not simultaneously use an NVIDIA, AMD and Intel GPU in a 
gaming PC on Linux's Xorg architecture.  Even if you got to the ideal 
scenario of using all 3 GPU's with open source drivers, this is still a 
problem for Linux w/ Xorg.


2) If the xGPU is the active GPU on the system and someone removes the 
cable what should happen?  Remember, you can only have one GPU active in 
Xorg.  There "might" be a second GPU in the system, but again in order 
to use you would have to restart Xorg.  If it turns out that GPU is not 
the same vendor as the GPU in your xGPU you'll also have to reconfigure 
Xorg and possibly install different drivers.
