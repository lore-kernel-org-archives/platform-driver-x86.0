From: Alex Hung <alex.hung@canonical.com>
Subject: Re: [PATCH] platform/x86: intel-hid: Use hp-wireless for rfkill on HP
 platforms
Date: Thu, 11 Jun 2020 09:53:15 -0600
Message-ID: <0c381c46-a4ab-b973-8ed6-4bc8aa06022a@canonical.com>
References: <20200610153747.27040-1-kai.heng.feng@canonical.com>
 <4d0714fe5e2548b6b638ea447ad19490@AUSX13MPC105.AMER.DELL.COM>
 <0affa00e-8a52-9e29-56d4-39dff952d736@canonical.com>
 <A98FC3F7-2295-4B49-95DD-1D861BC56B9A@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <A98FC3F7-2295-4B49-95DD-1D861BC56B9A@canonical.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc: Mario.Limonciello@dell.com, dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On 2020-06-11 1:24 a.m., Kai-Heng Feng wrote:
> 
> 
>> On Jun 11, 2020, at 01:41, Alex Hung <alex.hung@canonical.com> wrote:
>>
>> On 2020-06-10 9:49 a.m., Mario.Limonciello@dell.com wrote:
>>>> -----Original Message-----
>>>> From: platform-driver-x86-owner@vger.kernel.org <platform-driver-x86-
>>>> owner@vger.kernel.org> On Behalf Of Kai-Heng Feng
>>>> Sent: Wednesday, June 10, 2020 10:38 AM
>>>> To: alex.hung@canonical.com
>>>> Cc: Kai-Heng Feng; Darren Hart; Andy Shevchenko; open list:INTEL HID EVENT
>>>> DRIVER; open list
>>>> Subject: [PATCH] platform/x86: intel-hid: Use hp-wireless for rfkill on HP
>>>> platforms
>>>>
>>>>
>>>> [EXTERNAL EMAIL]
>>>>
>>>> Wireless hotkey on HP platforms can trigger two events, if both
>>>> hp-wireless and intel-hid are supported. Two events at the same time
>>>> renders wireless hotkey useless.
>>>>
>>>> HP confirmed that hp-wireless (HPQ6001) should always be the canonical
>>>> source of wireless hotkey event, so skip registering rfkill hotkey if
>>>> HPQ6001 is present.
>>>>
>>>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>>>> ---
>>>> drivers/platform/x86/intel-hid.c | 31 ++++++++++++++++++++++++++++++-
>>>> 1 file changed, 30 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/platform/x86/intel-hid.c b/drivers/platform/x86/intel-
>>>> hid.c
>>>> index 9ee79b74311c..31091c8faf70 100644
>>>> --- a/drivers/platform/x86/intel-hid.c
>>>> +++ b/drivers/platform/x86/intel-hid.c
>>>> @@ -25,6 +25,8 @@ static const struct acpi_device_id intel_hid_ids[] = {
>>>> };
>>>> MODULE_DEVICE_TABLE(acpi, intel_hid_ids);
>>>>
>>>> +static bool hp_wireless_present;
>>>> +
>>>> /* In theory, these are HID usages. */
>>>> static const struct key_entry intel_hid_keymap[] = {
>>>> 	/* 1: LSuper (Page 0x07, usage 0xE3) -- unclear what to do */
>>>> @@ -49,6 +51,29 @@ static const struct key_entry intel_hid_keymap[] = {
>>>> 	{ KE_END },
>>>> };
>>>>
>>>> +static const struct key_entry intel_hid_no_rfkill_keymap[] = {
>>>> +	/* 1: LSuper (Page 0x07, usage 0xE3) -- unclear what to do */
>>>> +	/* 2: Toggle SW_ROTATE_LOCK -- easy to implement if seen in wild */
>>>> +	{ KE_KEY, 3, { KEY_NUMLOCK } },
>>>> +	{ KE_KEY, 4, { KEY_HOME } },
>>>> +	{ KE_KEY, 5, { KEY_END } },
>>>> +	{ KE_KEY, 6, { KEY_PAGEUP } },
>>>> +	{ KE_KEY, 7, { KEY_PAGEDOWN } },
>>>> +	/* 8: rfkill -- use hp-wireless instead */
>>>> +	{ KE_KEY, 9, { KEY_POWER } },
>>>> +	{ KE_KEY, 11, { KEY_SLEEP } },
>>>> +	/* 13 has two different meanings in the spec -- ignore it. */
>>>> +	{ KE_KEY, 14, { KEY_STOPCD } },
>>>> +	{ KE_KEY, 15, { KEY_PLAYPAUSE } },
>>>> +	{ KE_KEY, 16, { KEY_MUTE } },
>>>> +	{ KE_KEY, 17, { KEY_VOLUMEUP } },
>>>> +	{ KE_KEY, 18, { KEY_VOLUMEDOWN } },
>>>> +	{ KE_KEY, 19, { KEY_BRIGHTNESSUP } },
>>>> +	{ KE_KEY, 20, { KEY_BRIGHTNESSDOWN } },
>>>> +	/* 27: wake -- needs special handling */
>>>> +	{ KE_END },
>>>> +};
>>>> +
>>>> /* 5 button array notification value. */
>>>> static const struct key_entry intel_array_keymap[] = {
>>>> 	{ KE_KEY,    0xC2, { KEY_LEFTMETA } },                /* Press */
>>>> @@ -317,7 +342,8 @@ static int intel_hid_input_setup(struct platform_device
>>>> *device)
>>>> 	if (!priv->input_dev)
>>>> 		return -ENOMEM;
>>>>
>>>> -	ret = sparse_keymap_setup(priv->input_dev, intel_hid_keymap, NULL);
>>>> +	ret = sparse_keymap_setup(priv->input_dev, hp_wireless_present ?
>>>> +			intel_hid_no_rfkill_keymap : intel_hid_keymap, NULL);
>>>> 	if (ret)
>>>> 		return ret;
>>>>
>>>> @@ -575,6 +601,9 @@ check_acpi_dev(acpi_handle handle, u32 lvl, void
>>>> *context, void **rv)
>>>> 			dev_info(&dev->dev,
>>>> 				 "intel-hid: created platform device\n");
>>>>
>>>> +	if (!strcmp(acpi_device_hid(dev), "HPQ6001"))
>>>> +		hp_wireless_present = true;
>>
>> (Resend with format removed)
>>
>> This can impact all HP systems that do not have this problem.
> 
> HP is certain that HPQ6001 should always be used over INT33D5.

and OEMs can change all the time.

> 
> If this patch breaks other platform, then we should fix HPQ6001 instead.

Looks like a firmware bug, and this is a workaround.

In this case, both HP6001 and INT33D5 receive wireless toggle events -
which is an incorrect firmware behaviour.

In scenario that both HP6001 and INT33D5 are present and wireless toggle
events are only sent to INT33D5 (a correct firmware behaviour), this
patch will break and this is concerning.

> 
>> How about
>> a DMI quirk that is limited to this particular system?
> 
> We should avoid using DMI quirk for this one, as this is to follow the HP's spec.

INT33D5 is defined by Intel, and HP spec says an event from HP6001, and
nothing about interactions with INT33D5.

Workarounds are unavoidable. It doesn't have to be DMI quirks but it has
to be done without affecting good systems.

> 
> Kai-Heng
> 
>>
>>
>>>
>>> Just having the ACPI device present doesn't actually mean that the user
>>> has a kernel compiled with hp-wireless or that it has finished initializing.
>>>
>>> I would think this needs a better handshake in case hp-wireless was unloaded
>>> or not present so the event could still come through intel-hid in this
>>> circumstance.
>>>
>>>> +
>>>> 	return AE_OK;
>>>> }
>>>>
>>>> --
>>>> 2.17.1
>>>
>>
>>
>> -- 
>> Cheers,
>> Alex Hung
> 


-- 
Cheers,
Alex Hung
