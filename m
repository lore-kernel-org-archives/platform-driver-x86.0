From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Subject: Re: [PATCH 2/2] platform/x86: Add Intel Galileo platform specific
 setup
Date: Fri, 09 Jan 2015 11:17:43 +0000
Message-ID: <54AFB8D7.6020306@nexus-software.ie>
References: <1419873783-5161-1-git-send-email-pure.logic@nexus-software.ie> <1419873783-5161-3-git-send-email-pure.logic@nexus-software.ie> <20150109044613.GB9311@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from outbound-smtp03.blacknight.com ([81.17.249.16]:40850 "EHLO
	outbound-smtp03.blacknight.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754100AbbAILRq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 9 Jan 2015 06:17:46 -0500
Received: from mail.blacknight.com (pemlinmail04.blacknight.ie [81.17.254.17])
	by outbound-smtp03.blacknight.com (Postfix) with ESMTPS id 21A5A2F8330
	for <platform-driver-x86@vger.kernel.org>; Fri,  9 Jan 2015 11:17:44 +0000 (UTC)
In-Reply-To: <20150109044613.GB9311@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On 09/01/15 04:46, Darren Hart wrote:
>> +	/* Try overlap - IMR_ALIGN */
>> +	base = base + size - IMR_ALIGN;
>> +	if (imr_add(base, size, IMR_NON_SMM, IMR_NON_SMM, true) == 0)
>> +		pr_err(SANITY "overlapped IMR @ (0x%08lx - 0x%08lx)\n",
>> +		       base, base + size);
>> +}
>> +#endif
>
> I'd rather see this as CONFIG_DEBUG_IMR under Kernel Hacking.
>
> What about this sanity test is galileo specific?

Exactly nothing.

I think it's a fair point to make this
* CONFIG_DEBUG_IMR
* Embedded in the IMR init code

>> +	/* BIOS releases 0.7.5 and 0.8.0 do not provide DMI strings */
>> +	if (system_id != NULL) {
>> +		type = (int)system_id->driver_data;
>> +	} else {
>> +		pr_info("Galileo Gen1 BIOS version <= 0.8.0\n");
>> +		type = GALILEO_QRK_GEN1;
>
> So this will load on any Quark device, Galileo or not, that doesn't provide a
> system_id. Is there any reason we need to support 0.8.0 and earlier firmware?

Every Galileo Gen1 device ships with firmware version 0.7.5. You can do 
an EFI capsule update to 0.8.0 which still isn't DMI-enabled - or you 
can go and get a firmware greater than 0.9.0 and get DMI strings.

> I'd prefer not to successfully load a driver on the wrong platform because we
> assume the user knows what they are doing :-) This effective converts this from
> a "platform driver" to a "board file" - the bad kind.

That would be a problem if there were any other X1000 boards that don't 
provide DMI strings but only Galileo Gen1 out of the box is DMI 
deprived, so for that reason I think falling back to assume Gen1 when 
you've identified a Quark X1000 is the right thing to do.

Right now the only Quark X1000 devices that real users in the field have 
are Galileo boards which either identify with DMI strings (Gen2 and 
upgraded Gen1 boards) - or don't identify with DMI strings Gen1 @ 0.7.5 
and 0.8.0

Also consider that any new X1000 based systems running Linux will be 
based on the latest reference firmware from Intel which provides DMI 
identifiers, so Galileo Gen3 if it is in the making will have a DMI 
string to identify itself as a Gen3, same with a Gen2 and upgraded Gen1.

The only X1000 based boards without DMI strings are going to be Galileo 
Gen1 devices @ firmware version 0.7.5 and 0.8.0, so I don't think we 
will end up in a situation of loading the wrong platform code, rather 
we'll accommodate the older firmware this way

All that said - there *is* an alternative for 0.7.5 and 0.8.0 firmware 
but, I know you won't like it.

Prior to 0.9.0 firmware Galileo boards were identified by

1. Mapping a section of SPI flash
2. Finding a specific header at a know location on SPI flash
3. Extracting a unique platform ID field from that header
4. Examining that platform ID field and loading Galileo specific drivers 
if found

So in theory we could go this route if you feel that fallback the 
fallback described above isn't robust enough.

I'm OK to add that code in for V2 and we can decide which is the more 
desirable way to do it - fallback or extract of platform id from SPI 
flash and then finalise at V3

--
BOD
