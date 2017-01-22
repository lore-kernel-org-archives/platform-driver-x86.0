From: joeyli <jlee@suse.com>
Subject: Re: Acer ES1-522 wifi blocked and Fn keys don't work (WMI)
Date: Sun, 22 Jan 2017 22:36:57 +0800
Message-ID: <20170122143657.GX10410@linux-l9pv.suse>
References: <3743f661-2ef2-1f54-819c-8dc15569f905@sieb.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:57708 "EHLO
        smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751025AbdAVOhS (ORCPT
        <rfc822;groupwise-platform-driver-x86@vger.kernel.org:0:0>);
        Sun, 22 Jan 2017 09:37:18 -0500
Content-Disposition: inline
In-Reply-To: <3743f661-2ef2-1f54-819c-8dc15569f905@sieb.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Samuel Sieb <samuel@sieb.net>
Cc: platform-driver-x86@vger.kernel.org

Hi Samuel, 

What is your kernel verion?

Joey Lee 

On Wed, Jan 18, 2017 at 12:05:52PM -0800, Samuel Sieb wrote:
> I have a user with an Acer ES1-522 laptop and the wifi isn't working. The
> driver detects it correctly, but rfkill says it's hard blocked.  The wifi
> toggle key doesn't have any effect.  The touchpad toggle button disables the
> touchpad, but doesn't enable it when pressed again. However, suspend/resume
> resets the touchpad to working again.  The acer-wmi module is loaded and an
> input device is created.  However, none of the listed keys actually provide
> any output.
> 
> I blacklisted the acer_wmi module and now the wifi works.  Is there any
> further information I could provide that would help?
>
What is your kernel verion?

And, did you see any messages in dmesg when you pressed those fn-keys?

Thanks
Joey Lee 
