From: Mario Limonciello <mario_limonciello@dell.com>
Subject: Re: [PATCH 0/1] Add new driver for AlienFX control
Date: Wed, 05 Feb 2014 10:34:02 -0600
Message-ID: <52F267FA.8020001@dell.com>
References: <1391617343-2743-1-git-send-email-mario_limonciello@dell.com> <1391617484.1248.0.camel@x230>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ausxipps301.us.dell.com ([143.166.148.223]:21307 "EHLO
	ausxipps301.us.dell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752508AbaBEQeT (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 5 Feb 2014 11:34:19 -0500
In-Reply-To: <1391617484.1248.0.camel@x230>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

On 02/05/2014 10:24 AM, Matthew Garrett wrote:
> On Wed, 2014-02-05 at 10:22 -0600, Mario Limonciello wrote:
>
>> After digging further in, there actually is control for setting up the LEDs to
>> perform different tasks in S0 and S3 power states which becomes more difficult
>> to represent in the LED class.  So instead I've created a series of sysfs nodes
>> to represent the different colors in the different zones.
> Have you discussed the best way to represent this with the LED class
> maintainer?
No I haven't yet.  I initially coded it using the LED class, but I kept finding more details for it that didn't seem to match what the LED class provided properly.

The LED class is intended to represent the "brightness" of an individual LED.
There is a single brightness setting for each zone, but you can also individually choose the shade of every color.
Eg. you can pick from 0x00 to 0xFF for each color in the zone and brightness from 0x00 to 0xFF for the brightness of the zone.

I also mocked up having individual controls for each possible state and color in the LED class but it turned into about 36 different nodes in /sys/class/led/alienware-wmi and really confusing.
