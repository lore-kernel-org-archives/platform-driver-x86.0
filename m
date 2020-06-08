From: Y Paritcher <y.linux@paritcher.com>
Subject: Re: [PATCH 1/3] platform/x86: dell-wmi: add new backlight events
Date: Mon, 8 Jun 2020 16:11:49 -0400
Message-ID: <e91bb21e-98fa-f469-cc24-abc9ae200e4d@paritcher.com>
References: <cover.1591584631.git.y.linux@paritcher.com>
 <7dbe4e9e5ed64e4704b1c4ae13ac84df644ccc13.1591584631.git.y.linux@paritcher.com>
 <20200608083503.l5g5iq52ezxkobvv@pali>
 <3e0d394545954ed79b8f883e1ac93338@AUSX13MPC105.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3e0d394545954ed79b8f883e1ac93338@AUSX13MPC105.AMER.DELL.COM>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mario.Limonciello@dell.com, pali@kernel.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, mjg59@srcf.ucam.org
List-Id: platform-driver-x86.vger.kernel.org

On 6/8/20 11:30 AM, Mario.Limonciello@dell.com wrote:
>> -----Original Message-----
>> From: platform-driver-x86-owner@vger.kernel.org <platform-driver-x86-
>> owner@vger.kernel.org> On Behalf Of Pali Rohár
>> Sent: Monday, June 8, 2020 3:35 AM
>> To: Y Paritcher
>> Cc: linux-kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org;
>> Matthew Garrett
>> Subject: Re: [PATCH 1/3] platform/x86: dell-wmi: add new backlight events
>>
>>
>> [EXTERNAL EMAIL]
>>
>> On Monday 08 June 2020 00:22:24 Y Paritcher wrote:
>>> Ignore events with a type of 0x0010 and a code of 0x57 / 0x58,
>>> this silences the following messages being logged on a
>>> Dell Inspiron 5593:
>>>
>>> dell_wmi: Unknown key with type 0x0010 and code 0x0057 pressed
>>> dell_wmi: Unknown key with type 0x0010 and code 0x0058 pressed
>>>
>>> Signed-off-by: Y Paritcher <y.linux@paritcher.com>
>>> ---
>>>  drivers/platform/x86/dell-wmi.c | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-
>> wmi.c
>>> index c25a4286d766..0b4f72f923cd 100644
>>> --- a/drivers/platform/x86/dell-wmi.c
>>> +++ b/drivers/platform/x86/dell-wmi.c
>>> @@ -252,6 +252,10 @@ static const struct key_entry
>> dell_wmi_keymap_type_0010[] = {
>>>  	/* Fn-lock switched to multimedia keys */
>>>  	{ KE_IGNORE, 0x1, { KEY_RESERVED } },
>>>
>>> +	/* Backlight brightness level */
>>> +	{ KE_KEY,    0x57, { KEY_BRIGHTNESSDOWN } },
>>> +	{ KE_KEY,    0x58, { KEY_BRIGHTNESSUP } },
>>> +
> 
> For these particular events are they emitted by another interface as well in this
> platform?
> 
> If so they should be KE_IGNORE so you don't end up with double notifications to
> userspace.
Thank you both for the review,
This is my first patch so if i am doing something wrong please let me know.

Both before and after this change they are only emitted once (verified via showkeys)
this is because `dell_wmi_process_key()` calls `acpi_video_handles_brightness_key_presses()`
for brightness events, and `acpi_video_handles_brightness_key_presses()` makes sure no duplicate acpi-video events are sent.
> 
>>>  	/* Keyboard backlight change notification */
>>>  	{ KE_IGNORE, 0x3f, { KEY_RESERVED } },
>>
>> Please, keep codes sorted.

Will fix
>>
>>>
>>> --
>>> 2.27.0
>>>
