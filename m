From: Y Paritcher <y.linux@paritcher.com>
Subject: Re: [PATCH 3/3] platform/x86: dell-wmi: add keys to
 bios_to_linux_keycode
Date: Mon, 8 Jun 2020 16:12:54 -0400
Message-ID: <e447a347-a2a2-4196-b3f8-01389323d268@paritcher.com>
References: <cover.1591584631.git.y.linux@paritcher.com>
 <13951508596a3f654c6d47f5380ddb4f38e2f6b5.1591584631.git.y.linux@paritcher.com>
 <20200608090017.4qgtbosz7oullex2@pali>
 <8baab72e3d2e407792c3ffa1d9fffba8@AUSX13MPC105.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8baab72e3d2e407792c3ffa1d9fffba8@AUSX13MPC105.AMER.DELL.COM>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mario.Limonciello@dell.com, pali@kernel.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, mjg59@srcf.ucam.org
List-Id: platform-driver-x86.vger.kernel.org

On 6/8/20 11:46 AM, Mario.Limonciello@dell.com wrote:
>> -----Original Message-----
>> From: platform-driver-x86-owner@vger.kernel.org <platform-driver-x86-
>> owner@vger.kernel.org> On Behalf Of Pali Rohár
>> Sent: Monday, June 8, 2020 4:00 AM
>> To: Y Paritcher
>> Cc: linux-kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org;
>> Matthew Garrett
>> Subject: Re: [PATCH 3/3] platform/x86: dell-wmi: add keys to
>> bios_to_linux_keycode
>>
>>
>> [EXTERNAL EMAIL]
>>
>> Hello!
>>
>> On Monday 08 June 2020 00:22:26 Y Paritcher wrote:
>>> Increase length of bios_to_linux_keycode to 2 bytes to allow for a new
>>> keycode 0xffff, this silences the following messages being logged at
>>> startup on a Dell Inspiron 5593
> 
> Which event type?  Can you show the whole WMI buffer that came through?
> 
>>>
>>> dell_wmi: firmware scancode 0x48 maps to unrecognized keycode 0xffff
>>> dell_wmi: firmware scancode 0x50 maps to unrecognized keycode 0xffff
>>>
>>> Signed-off-by: Y Paritcher <y.linux@paritcher.com>
>>> ---
>>>  drivers/platform/x86/dell-wmi.c | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-
>> wmi.c
>>> index f37e7e9093c2..5ef716e3034f 100644
>>> --- a/drivers/platform/x86/dell-wmi.c
>>> +++ b/drivers/platform/x86/dell-wmi.c
>>> @@ -196,7 +196,7 @@ struct dell_dmi_results {
>>>  };
>>>
>>>  /* Uninitialized entries here are KEY_RESERVED == 0. */
>>> -static const u16 bios_to_linux_keycode[256] = {
>>> +static const u16 bios_to_linux_keycode[65536] = {
>>
>> This change dramatically increase memory usage. I guess other that
>> maintainers would not like such change.
>>
>>>  	[0]	= KEY_MEDIA,
>>>  	[1]	= KEY_NEXTSONG,
>>>  	[2]	= KEY_PLAYPAUSE,
>>> @@ -237,6 +237,7 @@ static const u16 bios_to_linux_keycode[256] = {
>>>  	[37]	= KEY_UNKNOWN,
>>>  	[38]	= KEY_MICMUTE,
>>>  	[255]	= KEY_PROG3,
>>> +	[65535]	= KEY_UNKNOWN,
>>
>> Also it seems that this change is not complete. It looks like that you
>> map two different scancodes (0x48 and 0x50) to same keycodes, moreover
>> both are unknown.
>>
>> Could you please describe which key presses (or events) generate
>> delivering these WMI scancode events?
>>
>> Note that purpose of printing unknown/unrecognized keys messages is to
>> inform that current pressed key was not processed or that it was
>> ignored.
>>
>> For me it looks like this just just hide information that key was not
>> processed correctly as this change does not implement correct processing
>> of this key.


The dell_wmi: firmware scancode XXXX maps to unrecognized keycode XXXX
events are emitted at startup when processing DMI table entries that dell-wmi
does not recognize.

my DMI table contains among others:
48 00 FF FF 
50 00 FF FF

the scan/keycodes are 2 bytes the array was only 1 byte until now as there were
never any reported keycodes with the higher byte set.


unlike my other patches this one is not for key press events. None of the keys on my laptop correspond to these scancode/keycode.

the reason for this type of log event is in a comment:

/*
 * Log if we find an entry in the DMI table that we don't
 * understand.  If this happens, we should figure out what
 * the entry means and add it to bios_to_linux_keycode.
 */

therefore I tried adding this to the list of known keycodes.
As of now almost half of the keycodes in the list are KEY_UNKNOWN.

If anyone has a way of figuring out how to map this to a specific key,
i will try to identify it further.


>>
>> Also, could you share documentation about these 0x48/0x50 events? Or it
>> is under NDA?
>>

I am just a regular user. I have no clue what they are nor any inside info.
>>>  };
>>>
>>>  /*
>>> --
>>> 2.27.0
>>>
> 
> I would actually question if there is value to lines in dell-wmi.c like this:
> 
> pr_info("Unknown WMI event type 0x%x\n", (int)buffer_entry[1]);
> 
> and
> 
> pr_info("Unknown key with type 0x%04x and code 0x%04x pressed\n", type, code);
> 
> In both of those cases the information doesn't actually help the user, by default it's
> ignored by the driver anyway.  It just notifies the user it's something the driver doesn't
> comprehend.  I would think these are better suited to downgrade to debug.  And if
> a key combination isn't doing something expected the user can use dyndbg to turn it
> back on and can be debugged what should be populated or "explicitly" ignored.
> 

I agree with this. The only reason i am adding these definitions is to get rid of 
annoying log messages. They should really be debug. 
