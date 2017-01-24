From: Samuel Sieb <samuel@sieb.net>
Subject: Re: Acer ES1-522 wifi blocked and Fn keys don't work (WMI)
Date: Mon, 23 Jan 2017 20:41:18 -0800
Message-ID: <bdc877de-acda-1741-701d-1cf3145b9421@sieb.net>
References: <3743f661-2ef2-1f54-819c-8dc15569f905@sieb.net>
 <20170122143657.GX10410@linux-l9pv.suse>
 <1c3c9754-70fa-039c-04f8-6a438b9c504b@sieb.net>
 <20170124034823.GF16274@linux-l9pv.suse>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp-out-no.shaw.ca ([64.59.134.9]:34530 "EHLO
        smtp-out-no.shaw.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750709AbdAXElc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 23 Jan 2017 23:41:32 -0500
In-Reply-To: <20170124034823.GF16274@linux-l9pv.suse>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: joeyli <jlee@suse.com>
Cc: platform-driver-x86@vger.kernel.org

On 01/23/2017 07:48 PM, joeyli wrote:
 > Could you please create two bugs on https://bugzilla.kernel.org/ ? 
One for
 > function key, another one for accelerometer. I prefer to collect debug
 > messages/files on bugzilla for reference in the future. Please send bug
 > number to me after you created it.
 >
 > On the other hand, please attach your acpidump result on bugzilla:
 >  # acpidump > acpidump.raw
 >
 > I want to check the DSDT table for more detail.
 >
Ok, but the biggest problem is that the wifi is hard locked with the 
module installed with no way to turn that off.  I'll file a bug for that 
as well.
