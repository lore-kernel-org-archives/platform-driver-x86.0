From: <Mario_Limonciello@Dell.com>
Subject: Re: [PATCH] dell-wmi: Add events created by Dell Rugged 2-in-1s
Date: Wed, 27 Jul 2016 15:55:09 +0000
Message-ID: <1469634909478.10239@Dell.com>
References: <1469217684-6643-1-git-send-email-mario_limonciello@dell.com>
 <20160727051909.GC75806@f23x64.localdomain>,<20160727072350.GF29844@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa3.dell-outbound.iphmx.com ([68.232.153.94]:33089 "EHLO
	esa3.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753179AbcG0PzM convert rfc822-to-8bit
	(ORCPT <rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 27 Jul 2016 11:55:12 -0400
In-Reply-To: <20160727072350.GF29844@pali>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: pali.rohar@gmail.com, dvhart@infradead.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

> Hi! I'm not sure if KEY_PROG1/2/3 are good names here as we already use
>those for other actions (see bios_to_linux_keycode). Also there is:

I had missed this, do you have some recommendations on what would be
better codes to map this to?

I'll double check what the things that "were" mapping to KEY_PROG1 etc
actually were.  This might be a case of an expected clash if the functions
aren't in current generations.

>
>/* Wifi Catcher */
> { KE_KEY,    0xe011, { KEY_PROG2 } },
>

It's worth mentioning that Wifi Catcher hasn't been used for any Dell laptops
for a handful generations.  The rugged 2in1's are current generation that have 
these programmable buttons and don't have wifi catcher.

So there should be no "real" clash here.
   
> But probably we do not have better names...

In this particular case, I was thinking PROG1/2/3 were really the best option
and would be most intuitive because the keys really are labels "P1" "P2" and
"P3".

Here's the front of the tablet:
http://shop-media.intel.com/api/v2/helperservice/getimage?url=http://images.icecat.biz/img/norm/high/30031725-706.jpg&height=550&width=550

>
> Another small cosmetic change: align WMI codes, so 0x157 and 0x850 are
> at some column (similar like are formatted other actions).

OK.