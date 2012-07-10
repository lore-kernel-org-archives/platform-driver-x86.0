From: Seth Forshee <seth.forshee@canonical.com>
Subject: Re: [PATCH] apple-gmux: Restore switch registers on suspend/resume
Date: Tue, 10 Jul 2012 08:35:37 -0500
Message-ID: <20120710133537.GC10194@thinkpad-t410>
References: <1341891593-6485-1-git-send-email-arun.raghavan@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:49636 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755821Ab2GJNfl (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 10 Jul 2012 09:35:41 -0400
Content-Disposition: inline
In-Reply-To: <1341891593-6485-1-git-send-email-arun.raghavan@collabora.co.uk>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Arun Raghavan <arun.raghavan@collabora.co.uk>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jul 10, 2012 at 09:09:53AM +0530, Arun Raghavan wrote:
> After suspend and resume, the values of these registers seem to change
> from what they were at suspend time, potentially preventing the actual
> output lines from being enabled post-resume. This saves relevant state
> at suspend and restores it when resumed.
> 
> This is at least required on the MacBook Pro 8.2 when the Intel GPU is
> manually selected in GRUB config before the kernel is loaded.

I've got a couple of problems with this. The first is that the backlight
update_status callback isn't an appropriate place to do this. Adding
suspend/resume ops for the pnp_driver would be better.

But the more serious concern is whether or not its safe to simply
restore the register values. I know that the reverse engineering work
done on the gmux has revealed a particular sequence for selecting the
active GPU. A brute force restoration of the registers disregards this
sequencing, which doesn't seem like a good idea.

Seth
