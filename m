From: joeyli <jlee@suse.com>
Subject: Re: Acer ES1-522 wifi blocked and Fn keys don't work (WMI)
Date: Wed, 8 Feb 2017 11:34:38 +0800
Message-ID: <20170208033438.GN15025@linux-l9pv.suse>
References: <3743f661-2ef2-1f54-819c-8dc15569f905@sieb.net>
 <20170122143657.GX10410@linux-l9pv.suse>
 <1c3c9754-70fa-039c-04f8-6a438b9c504b@sieb.net>
 <20170124034823.GF16274@linux-l9pv.suse>
 <2203db7c-4b11-9766-2b97-a7adf3bda7bd@sieb.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:56482 "EHLO
        smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751618AbdBHDes (ORCPT
        <rfc822;groupwise-platform-driver-x86@vger.kernel.org:0:0>);
        Tue, 7 Feb 2017 22:34:48 -0500
Content-Disposition: inline
In-Reply-To: <2203db7c-4b11-9766-2b97-a7adf3bda7bd@sieb.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Samuel Sieb <samuel@sieb.net>
Cc: platform-driver-x86@vger.kernel.org

Hi Samuel, 

On Tue, Jan 31, 2017 at 02:07:23PM -0800, Samuel Sieb wrote:
> On 01/23/2017 07:48 PM, joeyli wrote:
> >Could you please create two bugs on https://bugzilla.kernel.org/ ? One for
> >function key, another one for accelerometer. I prefer to collect debug
> >messages/files on bugzilla for reference in the future. Please send bug
> >number to me after you created it.
> >
> >On the other hand, please attach your acpidump result on bugzilla:
> > # acpidump > acpidump.raw
> >
> >I want to check the DSDT table for more detail.
> >
> Sorry for the delay.  I don't have physical access to the laptop right now,
> so I had to wait for someone to make it remotely available.
> 

Thanks for your help to create bugs. I added comments on bugzilla.

> Wifi hard block: https://bugzilla.kernel.org/show_bug.cgi?id=193751

For this issue, please try Chris Chiu's patch:
	acer-wmi: Inform firmware that RF Button Driver is active

> accelerometer: https://bugzilla.kernel.org/show_bug.cgi?id=193761
>

For this one, please try this patch that it's merged to testing branch:
	platform/x86: acer-wmi: setup accelerometer when machine has appropriate notify event
 
> I will create another one for the function keys when I am on-site again, but
> that won't be for at least a month.

Thanks
Joey Lee
