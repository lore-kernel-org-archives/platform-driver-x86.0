From: joeyli <jlee@suse.com>
Subject: Re: Acer ES1-522 wifi blocked and Fn keys don't work (WMI)
Date: Tue, 24 Jan 2017 11:48:23 +0800
Message-ID: <20170124034823.GF16274@linux-l9pv.suse>
References: <3743f661-2ef2-1f54-819c-8dc15569f905@sieb.net>
 <20170122143657.GX10410@linux-l9pv.suse>
 <1c3c9754-70fa-039c-04f8-6a438b9c504b@sieb.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:48714 "EHLO
        smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750709AbdAXDtz (ORCPT
        <rfc822;groupwise-platform-driver-x86@vger.kernel.org:0:0>);
        Mon, 23 Jan 2017 22:49:55 -0500
Content-Disposition: inline
In-Reply-To: <1c3c9754-70fa-039c-04f8-6a438b9c504b@sieb.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Samuel Sieb <samuel@sieb.net>
Cc: platform-driver-x86@vger.kernel.org

Hi Samuel, 

On Mon, Jan 23, 2017 at 03:23:19PM -0800, Samuel Sieb wrote:
> On 01/22/2017 06:36 AM, joeyli wrote:
> >On Wed, Jan 18, 2017 at 12:05:52PM -0800, Samuel Sieb wrote:
> >>I have a user with an Acer ES1-522 laptop and the wifi isn't working. The
> >>driver detects it correctly, but rfkill says it's hard blocked.  The wifi
> >>toggle key doesn't have any effect.  The touchpad toggle button disables the
> >>touchpad, but doesn't enable it when pressed again. However, suspend/resume
> >>resets the touchpad to working again.  The acer-wmi module is loaded and an
> >>input device is created.  However, none of the listed keys actually provide
> >>any output.
> >>
> >>I blacklisted the acer_wmi module and now the wifi works.  Is there any
> >>further information I could provide that would help?
> >>
> >What is your kernel verion?
> >
> It's running Fedora 24, so the latest kernel at the time was probably
> 4.8.17.  I see that a 4.9.5 kernel is available for F24 now, so I can try
> that one if it would be helpful.
> 

I see.

> >And, did you see any messages in dmesg when you pressed those fn-keys?
> >
> I didn't see any messages at all.
> 
> Also, on all the Acer laptops I checked, the accelerometer device gives the
> "Operation not permitted" error.  Should I split that into a new thread?  It
> appears to be part of the acer-wmi module as well.
> 

Could you please create two bugs on https://bugzilla.kernel.org/ ? One for 
function key, another one for accelerometer. I prefer to collect debug 
messages/files on bugzilla for reference in the future. Please send bug
number to me after you created it.

On the other hand, please attach your acpidump result on bugzilla:
 # acpidump > acpidump.raw

I want to check the DSDT table for more detail.

Thanks a lot!
Joey Lee
