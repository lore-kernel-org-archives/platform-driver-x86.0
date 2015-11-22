From: "D. Jared Dominguez" <Jared_Dominguez@dell.com>
Subject: Re: [PATCH 1/3] dell_wmi: Support new hotkeys on the XPS 13 Skylake
Date: Sat, 21 Nov 2015 20:04:15 -0600
Message-ID: <20151122020414.GR16374@dell.com>
References: <cover.1447479930.git.luto@kernel.org>
 <db83b63cc163ecc640d5d1c5554f8aa87beaadfc.1447479930.git.luto@kernel.org>
 <20151121000636.GG7413@malice.jf.intel.com>
 <CALCETrVz+4CX=rjY5OZfCSGQDcgW1oQe6t8d9940ubQKDv-Eqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from AUSXIPPS310.us.dell.com ([143.166.148.211]:4714 "EHLO
	ausxipps310.us.dell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752116AbbKVCNt (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 21 Nov 2015 21:13:49 -0500
Content-Disposition: inline
In-Reply-To: <CALCETrVz+4CX=rjY5OZfCSGQDcgW1oQe6t8d9940ubQKDv-Eqg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@amacapital.net>
Cc: Darren Hart <dvhart@infradead.org>, Andy Lutomirski <luto@kernel.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Mario Limonciello <Mario_Limonciello@Dell.com>

On Fri, Nov 20, 2015 at 06:12:58PM -0600, Andy Lutomirski wrote:
>On Fri, Nov 20, 2015 at 4:06 PM, Darren Hart <dvhart@infradead.org> wr=
ote:
>> On Fri, Nov 13, 2015 at 09:49:30PM -0800, Andy Lutomirski wrote:
>>> The XPS 13 Skylake has an rfkill button and a switchvideomode butto=
n
>>> that aren't enumerated in the DMI table AFAICT.  Add a table listin=
g
>>> extra un-enumerated hotkeys.  To avoid breaking things that worked
>>> before, these un-enumerated hotkeys won't be used if the DMI table
>>> maps them to something else.
>>>
>>> This also adds the Fn-lock key as a KE_IGNORE entry.
>>>
>>> Signed-off-by: Andy Lutomirski <luto@kernel.org>
>>> ---
>>>  drivers/platform/x86/dell-wmi.c | 48 +++++++++++++++++++++++++++++=
++++++------
>>>  1 file changed, 41 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86=
/dell-wmi.c
>>> index f2d77fe696ac..5be1abec4f64 100644
>>> --- a/drivers/platform/x86/dell-wmi.c
>>> +++ b/drivers/platform/x86/dell-wmi.c
>>> @@ -142,6 +142,16 @@ static const u16 bios_to_linux_keycode[256] __=
initconst =3D {
>>>       0, 0, 0, 0, 0, 0, 0, 0, 0, KEY_PROG3
>>>  };
>>>
>>> +/* These are applied if the hk table is present and doesn't overri=
de them. */
>>> +static const struct key_entry dell_wmi_extra_keymap[] __initconst =
=3D {
>>> +     /* Fn-lock -- no action is required by the kernel. */
>>> +     { KE_IGNORE, 0x151, { KEY_RESERVED } },
>>> +
>>> +     /* Keys that need our help (on XPS 13 Skylake and maybe other=
s. */
>>> +     { KE_KEY, 0x152, { KEY_SWITCHVIDEOMODE } },
>>> +     { KE_KEY, 0x153, { KEY_RFKILL } },
>>> +};
>>> +
>>>  static struct input_dev *dell_wmi_input_dev;
>>>
>>>  static void dell_wmi_process_key(int reported_key)
>>> @@ -300,9 +310,10 @@ static const struct key_entry * __init dell_wm=
i_prepare_new_keymap(void)
>>>       int hotkey_num =3D (dell_bios_hotkey_table->header.length - 4=
) /
>>>                               sizeof(struct dell_bios_keymap_entry)=
;
>>>       struct key_entry *keymap;
>>> -     int i;
>>> +     int i, pos =3D 0, num_bios_keys;
>>
>> Just a nit, "reverse christmas tree" order (longest line length firs=
t) please.
>> (only if you resend after this review for other reasons)
>
>Will do if I resubmit.
>
>>
>>>
>>> -     keymap =3D kcalloc(hotkey_num + 1, sizeof(struct key_entry), =
GFP_KERNEL);
>>> +     keymap =3D kcalloc(hotkey_num + ARRAY_SIZE(dell_wmi_extra_key=
map),
>>
>> This previously allocated kotkey_num + 1, but you dropeed the +1, ma=
king it
>> eactly the size of hotkey_num + the new entries you added.
>>
>> Why don't we need the +1 anymore? (it isn't clear to me why we neede=
d to before
>> actually, but I want to confirm you considered it).
>
>Whoops!  It's for the KE_END entry.
>
>Jared, want to give us some guidance as to whether this code is
>correct at all and, if so, whether we should actually send a
>KEY_RFKILL event from dell-wmi when the key is pressed?
>
>IOW, should we allow dell-wmi to handle rfkill or should we wait for
>the other mechanism?
>
>--Andy

I'm adding Mario since he's worked on our client systems much longer an=
d=20
knows more about the correct behavior for our hotkeys. I've not yet rea=
d=20
through any of our documentation about our hotkey behavior so wouldn't=20
be as qualified to answer that. Note that both Mario and I are on=20
vacation until the 30th, so he may not reply until then.

--Jared


--=20
Jared Dom=EDnguez
OS Architect
Linux Engineering
Dell | Client Software Group
