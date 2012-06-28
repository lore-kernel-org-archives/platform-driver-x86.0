From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] backlight: add support for disabling backlights via
 sysfs
Date: Thu, 28 Jun 2012 20:10:43 +0100
Message-ID: <20120628191043.GA9777@srcf.ucam.org>
References: <1340910426-13269-1-git-send-email-seth.forshee@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:52128 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752207Ab2F1TKq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 28 Jun 2012 15:10:46 -0400
Content-Disposition: inline
In-Reply-To: <1340910426-13269-1-git-send-email-seth.forshee@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Seth Forshee <seth.forshee@canonical.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Corentin Chary <corentin.chary@gmail.com>

On Thu, Jun 28, 2012 at 02:07:06PM -0500, Seth Forshee wrote:

> Rather than trying to address this situation in a piecemeal fashion, we
> should find a solution that deal with disabling broken backlights more
> generically. This patch does so by adding an "enabled" attribute to
> sysfs for backlight devices. Writing 0 to this attribute disables the
> backlight, blocking most attempts to change the state. Tools like udev
> can set use this attribute to disable known broken backlight interfaces,
> and tools like gnome-settings-daemon can query the attribute to avoid
> using disabled backlights.

I'm not entirely thrilled by this, especially because in several cases I 
suspect that we're just going to end up disabling acpi_backlight rather 
than fixing any of the range of integration bugs we still have with it. 
If anyone has links with OEMs then I'd love to know how Windows handles 
backlight control policy, but otherwise I think Corentin's approach of 
having the vendor drivers promote or demote themselves makes more sense 
than pushing the problem out to userspace.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
