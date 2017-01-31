From: Samuel Sieb <samuel@sieb.net>
Subject: Re: Acer ES1-522 wifi blocked and Fn keys don't work (WMI)
Date: Tue, 31 Jan 2017 14:07:23 -0800
Message-ID: <2203db7c-4b11-9766-2b97-a7adf3bda7bd@sieb.net>
References: <3743f661-2ef2-1f54-819c-8dc15569f905@sieb.net>
 <20170122143657.GX10410@linux-l9pv.suse>
 <1c3c9754-70fa-039c-04f8-6a438b9c504b@sieb.net>
 <20170124034823.GF16274@linux-l9pv.suse>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp-out-so.shaw.ca ([64.59.136.139]:33202 "EHLO
        smtp-out-so.shaw.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750914AbdAaWJg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 31 Jan 2017 17:09:36 -0500
In-Reply-To: <20170124034823.GF16274@linux-l9pv.suse>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: joeyli <jlee@suse.com>
Cc: platform-driver-x86@vger.kernel.org

On 01/23/2017 07:48 PM, joeyli wrote:
> Could you please create two bugs on https://bugzilla.kernel.org/ ? One for
> function key, another one for accelerometer. I prefer to collect debug
> messages/files on bugzilla for reference in the future. Please send bug
> number to me after you created it.
>
> On the other hand, please attach your acpidump result on bugzilla:
>  # acpidump > acpidump.raw
>
> I want to check the DSDT table for more detail.
>
Sorry for the delay.  I don't have physical access to the laptop right 
now, so I had to wait for someone to make it remotely available.

Wifi hard block: https://bugzilla.kernel.org/show_bug.cgi?id=193751
accelerometer: https://bugzilla.kernel.org/show_bug.cgi?id=193761

I will create another one for the function keys when I am on-site again, 
but that won't be for at least a month.
