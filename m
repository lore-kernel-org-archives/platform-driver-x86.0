From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH] platform-driver-x86: ACPI EC Extra driver for Oaktrail
Date: Thu, 6 Jan 2011 11:54:33 +0100
Message-ID: <AANLkTimyz5VQPwRucrmfKsQtC3sA58mCZKWJNJrZLGhq@mail.gmail.com>
References: <20110106025949.GJ9496@kai-debian>
	<AANLkTi=B1XeBTogjVPWqOSFgJMD72gTpNZgg4znAR0t3@mail.gmail.com>
	<20110106105003.GO9496@kai-debian>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:46092 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753104Ab1AFKye (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 6 Jan 2011 05:54:34 -0500
In-Reply-To: <20110106105003.GO9496@kai-debian>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Yin Kangkai <kangkai.yin@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, "Wang, Yong Y" <yong.y.wang@intel.com>, "Liu, Bing Wei" <bing.wei.liu@intel.com>, Matthew Garrett <mjg@redhat.com>

On Thu, Jan 6, 2011 at 11:50 AM, Yin Kangkai
<kangkai.yin@linux.intel.com> wrote:
> On 2011-01-06, 08:29 +0100, Corentin Chary wrote:
>> > + * gps - GPS subsystem enabled: contains either 0 or 1. (rw)
>> > + * wifi - WiFi subsystem enabled: contains either 0 or 1. (rw)
>> > + * wwan - WWAN (3G) subsystem enabled: contains either 0 or 1. (rw)
>>
>> Is there a reason do add these files in /sys/devices/platform while the
>> functionality is already provided by rfkill ?
>
> This is not the same functionality.
>
> enable/disable using files in /sys/devices/platform will completely
> cut power of those components. For example, if disabled, you can not
> list out those components using lsusb. Can we achieve this using
> rfkill?
>

oh, sorry then, I didn't understood that.

So, you're lucky, you can control both the device and the radio. I'm
not sure what's
the best thing to do here, you can probably keep these files here.

CCing Matthew, he may have something to say about that.


-- 
Corentin Chary
http://xf.iksaif.net
