From: Mario Limonciello <mario_limonciello@dell.com>
Subject: Re: [PATCH v4 0/1] Drop individual LED nodes for colors
Date: Fri, 28 Feb 2014 15:42:15 -0600
Message-ID: <531102B7.1010205@dell.com>
References: <1393533182-2725-1-git-send-email-mario_limonciello@dell.com> <1393533948.14900.57.camel@x230> <530FA738.9080207@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ausc60pc101.us.dell.com ([143.166.85.206]:23361 "EHLO
	ausc60pc101.us.dell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751729AbaB1VmR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 28 Feb 2014 16:42:17 -0500
In-Reply-To: <530FA738.9080207@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>


On 02/27/2014 02:59 PM, Mario Limonciello wrote:
>
> On 02/27/2014 02:45 PM, Matthew Garrett wrote:
>> Hm. I'm not a huge fan of this approach - do any other drivers do it the
>> same way? It seems like this forces userspace code to special-case this
>> system.
>>
>
> Well i'm not aware of any other kernel drivers that control multi color LED zones like this.  This is the first alienware kernel driver.  The older MCU driven systems don't (yet) have a kernel module and instead there is a libusb driven project out there for them.
>
> The expectation is that the user-space color switcher that's written will have a color palette like this:
> http://www.nexthardware.com/repository/recensioni/611/immagini/img_AlienwareM17x-R3ControlCenter2_324312453106921989.jpg
>
> The tool will need to know how much of each color to mix to make the different colors in the palette anyway so how it's packed shouldn't matter.
>
> Also it shouldn't be a special case for this single system.  I'm pushing for the same BIOS interface to be used for any future Alienware systems without an MCU (some are in development).
>
> If you would still prefer that I revert to having individual color nodes I can switch it back, I'm just trying to avoid that situation where the user will need to have the system jump between multiple colors if they pick from two different ends of the spectrum in that palette.
>
> Also, any other feedback on the driver implementation?
Matthew,

I searched a little bit more in the kernel and found hid/hid-thingm.c.  The recent (2013) ThingM blink1 driver is for controlling an RGB LED.  The way they did it was having the LED device together with a separate sysfs interface both.  The LED device is used only for controlling the brightness whereas the sysfs interface is for accepting a 24-bit hexadecimal value for RGB.

So there has been a bunch of different methods I've implemented or come across.  Now that I've presented several, which of these would you like to see me use in this driver?

* custom RGB sysfs interface for color / LED class for brightness (ThingM style)
* Packed value in brightness node of LED class with all 32 bits used (v4 implementation)
* LED node for every color, brightness and state (v3 implementation)
* All custom sysfs nodes (v1 implementation)

Or something else?

I'm leaning on following the ThingM style and resubmitting with that.  It should then allow atomic commits as well as let me keep a separate node to control the state for the customization being made.
