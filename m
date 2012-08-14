From: Seth Forshee <seth.forshee@canonical.com>
Subject: Re: [PATCH V2 2/2] apple_gmux: Add support for newer hardware
Date: Tue, 14 Aug 2012 10:15:43 -0500
Message-ID: <20120814151543.GD18992@thinkpad-t410>
References: <1344898369-4944-1-git-send-email-mjg@redhat.com>
 <1344898369-4944-2-git-send-email-mjg@redhat.com>
 <20120814004625.GB18992@thinkpad-t410>
 <502A5B40.9010303@vmars.tuwien.ac.at>
 <502A667B.2060100@vmars.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:58192 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756449Ab2HNPP7 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 14 Aug 2012 11:15:59 -0400
Content-Disposition: inline
In-Reply-To: <502A667B.2060100@vmars.tuwien.ac.at>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Bernhard Froemel <froemel@vmars.tuwien.ac.at>
Cc: Matthew Garrett <mjg@redhat.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

On Tue, Aug 14, 2012 at 04:53:47PM +0200, Bernhard Froemel wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Only in relation to Seth's future apple-gmux patch series about
> vgaswitcheroo and restoring the gmux device configuration across
> suspend/resume [1]:
> On resume the gmux registers 0x28 (DDC) and 0x10 (SWITCH_DISPLAY)
> (i.e., the first two writes) are not restored (result: the screen
> remains black after suspend/resume).
> 
> Of course, this does not happen with my patch proposal ;)
> Unfortunately, I have not the time to sort this out in the next couple
> of days -- on the other hand this is probably not a problem w.r.t.
> this patch, but needs to be taken care of in Seth's patch series.

The patch adding support for switcheroo *does* restore those registers
on resume. Are you saying that isn't happening when you use it?

Seth
