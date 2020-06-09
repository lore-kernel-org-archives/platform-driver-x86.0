From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 2/3] platform/x86: dell-wmi: add new keymap type 0x0012
Date: Tue, 9 Jun 2020 18:59:13 +0200
Message-ID: <136a06e3-0f00-d252-ebdd-a76c8a575db8@redhat.com>
References: <cover.1591584631.git.y.linux@paritcher.com>
 <0dc191a3d16f0e114f6a8976433e248018e10c43.1591584631.git.y.linux@paritcher.com>
 <83fe431cacbc4708962767668ac8f06f@AUSX13MPC105.AMER.DELL.COM>
 <79bd59ee-dd37-bdc5-f6b4-00f2c33fdcff@paritcher.com>
 <7f9f0410696141cfabb0237d33b7b529@AUSX13MPC105.AMER.DELL.COM>
 <20200609154938.udo7mn7ka7z7pr6c@pali>
 <20200609164533.qtup47io2aoc5hgl@earth.universe>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200609164533.qtup47io2aoc5hgl@earth.universe>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sebastian.reichel@collabora.com>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
Cc: Mario.Limonciello@dell.com, y.linux@paritcher.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-pm@vger.kernel.org, mjg59@srcf.ucam.org
List-Id: platform-driver-x86.vger.kernel.org

Hi Sebastian,

On 6/9/20 6:45 PM, Sebastian Reichel wrote:
> Hi,
> 
> On Tue, Jun 09, 2020 at 05:49:38PM +0200, Pali Rohár wrote:
>> On Monday 08 June 2020 20:36:58 Mario.Limonciello@dell.com wrote:
>>> Can you please comment here how you would like to see events like this should come
>>> through to userspace?
>>>
>>> * Wrong power adapter (you have X and should have Y)
>>> * You have plugged a dock into the wrong port
>>> * Fn-lock mode
>>
>> In my opinion, Fn-lock mode is related to input subsystem and should be
>> probably reported via input device. For a user, fn-lock is similar like
>> caps-lock, scroll-lock or num-lock. Also fn-lock is provided by other
>> laptops and therefore I would expect that kernel provide fn-lock state
>> for all laptops (thinkpad / latitude / ...) via same interface. And not
>> via dell-specific interface or general-vendor-message interface.
>>
>> Wrong power adapter sounds like something related to power subsystem.
>> Adding Sebastian to the loop, maybe he can provide some useful ideas
>> about it.
> 
> I'm missing a bit of context. I suppose this is about connecting a
> non-genuine power adapter rejected by the embedded controller?
> Support for that should be hooked into 'drivers/acpi/ac.c' (note:
> so far there is no standard power-supply class property for this).
> Also printing a warning to dmesg seems sensible.

This is not so much about non-genuine as about the adapter having
the wrong wattage. E.g. plugging a 65W adapter in a laptop which
has a 45W CPU + a 35W discrete GPU will not allow the laptop to
really charge while it is in use.

One issue I see with doing this in the power_supply class is that
the charger is represented by the standard ACPI AC adapter stuff,
which does not have this info. This sort of extra info comes from
WMI. Now we could have the WMI driver register a second power_supply
device, but that means having 2 power_supply devices representing
the 1 AC adapter which does not feel right.

I was myself actually thinking more along the lines of adding a
new mechanism to the kernel where the kernel can send messages
to userspace (either with some special tag inside dmesg, or through
a new mechanism) indication that the message should be shown
as a notification (dialog/bubble/whatever) inside the UI.

This could be useful for this adapter case, but e.g. also for
pluging a thunderbolt device into a non thunderbolt capable
Type-C port, a superspeed USB device into a USB-2 only USB
port and probably other cases.

Rather then inventing separate userspace APIs for all these
cases having a general notification mechanism might be
quite useful for this (as long as the kernel does not
over use it).

Regards,

Hans
