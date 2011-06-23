From: Ike Panhc <ike.pan@canonical.com>
Subject: Re: [PATCH 3/3] ideapad: add backlight driver
Date: Thu, 23 Jun 2011 11:38:56 +0800
Message-ID: <4E02B550.3030208@canonical.com>
References: <1308729781-2590-1-git-send-email-ike.pan@canonical.com> <1308730058-2703-1-git-send-email-ike.pan@canonical.com> <20110622194049.GB8861@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from adelie.canonical.com ([91.189.90.139]:52850 "EHLO
	adelie.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758238Ab1FWDjF (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 22 Jun 2011 23:39:05 -0400
In-Reply-To: <20110622194049.GB8861@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, corentin.chary@gmail.com, Richard Purdie <rpurdie@rpsys.net>

On 06/23/2011 03:40 AM, Matthew Garrett wrote:
>> +static int ideapad_backlight_get_brightness(struct backlight_device *blightdev)
>> +{
>> +	unsigned long now;
>> +
>> +	if (read_ec_data(ideapad_handle, 0x12, &now))
>> +		return -EAGAIN;
> 
> Description says you're using commands on the VPC2004 device, but it 
> looks like you're just poking the embedded controller? Are you sure the 
> EC offsets are stable?
> 

Yes, they are stable, though on some machine, some functions are not fully implement.
For example, on s10-3, the brightness control is no function but bl_power works fine.
on B550, the brightness control works fine but only get acpi notify when bl_power
turning on.

function read_ec_data will access VPCW and VPCR methods that exist in every VPC2004
devices. In this case, VPCW will write 0x12 to VCMD and then VPCR read the current
brightness value from VDAT.

So far as I have seen, there are two design for VDAT and VCMD. One way (eg, ideapad
B550) is they are EC registers and embedded controller will do all things. The other
way (eg, ideapad Y530) is they are variables in DSDT, and CPU/DSDT will correct 
informations into VDAT.

Both of the design are ok for ideapad-laptop because we only touch VPCW/VPCR methods
and let DSDT or EC do the rest.

I put DSDTs all I have at http://people.ubuntu.com/~ikepanhc/DSDTs  
