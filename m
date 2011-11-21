From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] dell-wmi: Change debug statements from pr_info to
 pr_debug
Date: Mon, 21 Nov 2011 21:18:09 +0000
Message-ID: <20111121211809.GA14950@srcf.ucam.org>
References: <1321908536-5163-1-git-send-email-seth.forshee@canonical.com>
 <20111121205230.GA14467@srcf.ucam.org>
 <20111121211438.GH6736@thinkpad-t410>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:50116 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752512Ab1KUVSL (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 21 Nov 2011 16:18:11 -0500
Content-Disposition: inline
In-Reply-To: <20111121211438.GH6736@thinkpad-t410>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Nov 21, 2011 at 03:14:38PM -0600, Seth Forshee wrote:
> On Mon, Nov 21, 2011 at 08:52:30PM +0000, Matthew Garrett wrote:
> > They're intended to be there, in the same way that the keyboard code 
> > generates unknown scancode errors. We want to know when users have keys 
> > that don't work.
> 
> All right, but what about the unknown WMI events? Those are the bigger
> problem anyway, as at least one machine (the Latitude XT2) can generate
> a lot of these messages for unknown reasons. It doesn't appear that
> anyone has been making use of these messages since we still only support
> one event. Would you object to demoting that one?

Those can probably be ignored, but again it would be nice to find out 
what they actually mean so we know whether we can do anything with them. 
Any chance of you being able to work with Dell on that?

-- 
Matthew Garrett | mjg59@srcf.ucam.org
