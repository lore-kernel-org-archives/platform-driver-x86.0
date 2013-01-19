From: Peter Meiser <meiser@gmx-topmail.de>
Subject: Re: Dell Vostro V131: special hotkey not working
Date: Sat, 19 Jan 2013 11:38:56 +0100
Message-ID: <50FA77C0.4060808@gmx-topmail.de>
References: <4F97FA4C.9040201@gmx-topmail.de> <20120425135328.GA13385@srcf.ucam.org> <4F980807.6000705@gmx-topmail.de> <20120425142205.GA14322@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.21]:50493 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750761Ab3ASKjA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 19 Jan 2013 05:39:00 -0500
Received: from mailout-de.gmx.net ([10.1.76.33]) by mrigmx.server.lan
 (mrigmx002) with ESMTP (Nemesis) id 0Lds7x-1TEL7Q0EpH-00j3Qj for
 <platform-driver-x86@vger.kernel.org>; Sat, 19 Jan 2013 11:38:59 +0100
In-Reply-To: <20120425142205.GA14322@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Rezwanul_Kabir@dell.com

Hi Matthew,

this topic is still valid. Could you help me debugging the hotkeys?

There're two issues:
1. The "Dell support center" hotkey generates keycode 0xEE, but this is done forever. That means that I don't see a release event.
2. The "Dell instant launch manager" hotkey doesn't generate anything.

Thanks a lot in advance,
Peter

Am 25.04.2012 16:22, schrieb Matthew Garrett:
> On Wed, Apr 25, 2012 at 04:19:51PM +0200, Peter Meiser wrote:
>> Hello Matthew,
>>
>> Am 25.04.2012 15:53, schrieb Matthew Garrett:
>>> watch -n 0.1 cat /proc/interrupts
>>
>> When running "watch -n 0,1 cat /proc/interrupts" (watch -n 0.1 errors out, maybe because of German environment???), the following row increases after each press:
>>
>>   9:          5          0          0          0   IO-APIC-fasteoi   acpi
> 
> Ok, so it's definitely being handled by ACPI somehow - probably via WMI, 
> but unsure. Rez, any chance you can look at the original message and let 
> us know if this is expected to work with the current driver?
> 
