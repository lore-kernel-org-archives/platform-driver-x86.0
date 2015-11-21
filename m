From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH 1/3] dell_wmi: Support new hotkeys on the XPS 13 Skylake
Date: Fri, 20 Nov 2015 16:12:58 -0800
Message-ID: <CALCETrVz+4CX=rjY5OZfCSGQDcgW1oQe6t8d9940ubQKDv-Eqg@mail.gmail.com>
References: <cover.1447479930.git.luto@kernel.org> <db83b63cc163ecc640d5d1c5554f8aa87beaadfc.1447479930.git.luto@kernel.org>
 <20151121000636.GG7413@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:34119 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760692AbbKUANS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 20 Nov 2015 19:13:18 -0500
Received: by obbbj7 with SMTP id bj7so99001024obb.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2015 16:13:18 -0800 (PST)
In-Reply-To: <20151121000636.GG7413@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Andy Lutomirski <luto@kernel.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Jared_Dominguez@dell.com

On Fri, Nov 20, 2015 at 4:06 PM, Darren Hart <dvhart@infradead.org> wrote:
> On Fri, Nov 13, 2015 at 09:49:30PM -0800, Andy Lutomirski wrote:
>> The XPS 13 Skylake has an rfkill button and a switchvideomode button
>> that aren't enumerated in the DMI table AFAICT.  Add a table listing
>> extra un-enumerated hotkeys.  To avoid breaking things that worked
>> before, these un-enumerated hotkeys won't be used if the DMI table
>> maps them to something else.
>>
>> This also adds the Fn-lock key as a KE_IGNORE entry.
>>
>> Signed-off-by: Andy Lutomirski <luto@kernel.org>
>> ---
>>  drivers/platform/x86/dell-wmi.c | 48 +++++++++++++++++++++++++++++++++++------
>>  1 file changed, 41 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
>> index f2d77fe696ac..5be1abec4f64 100644
>> --- a/drivers/platform/x86/dell-wmi.c
>> +++ b/drivers/platform/x86/dell-wmi.c
>> @@ -142,6 +142,16 @@ static const u16 bios_to_linux_keycode[256] __initconst = {
>>       0, 0, 0, 0, 0, 0, 0, 0, 0, KEY_PROG3
>>  };
>>
>> +/* These are applied if the hk table is present and doesn't override them. */
>> +static const struct key_entry dell_wmi_extra_keymap[] __initconst = {
>> +     /* Fn-lock -- no action is required by the kernel. */
>> +     { KE_IGNORE, 0x151, { KEY_RESERVED } },
>> +
>> +     /* Keys that need our help (on XPS 13 Skylake and maybe others. */
>> +     { KE_KEY, 0x152, { KEY_SWITCHVIDEOMODE } },
>> +     { KE_KEY, 0x153, { KEY_RFKILL } },
>> +};
>> +
>>  static struct input_dev *dell_wmi_input_dev;
>>
>>  static void dell_wmi_process_key(int reported_key)
>> @@ -300,9 +310,10 @@ static const struct key_entry * __init dell_wmi_prepare_new_keymap(void)
>>       int hotkey_num = (dell_bios_hotkey_table->header.length - 4) /
>>                               sizeof(struct dell_bios_keymap_entry);
>>       struct key_entry *keymap;
>> -     int i;
>> +     int i, pos = 0, num_bios_keys;
>
> Just a nit, "reverse christmas tree" order (longest line length first) please.
> (only if you resend after this review for other reasons)

Will do if I resubmit.

>
>>
>> -     keymap = kcalloc(hotkey_num + 1, sizeof(struct key_entry), GFP_KERNEL);
>> +     keymap = kcalloc(hotkey_num + ARRAY_SIZE(dell_wmi_extra_keymap),
>
> This previously allocated kotkey_num + 1, but you dropeed the +1, making it
> eactly the size of hotkey_num + the new entries you added.
>
> Why don't we need the +1 anymore? (it isn't clear to me why we needed to before
> actually, but I want to confirm you considered it).

Whoops!  It's for the KE_END entry.

Jared, want to give us some guidance as to whether this code is
correct at all and, if so, whether we should actually send a
KEY_RFKILL event from dell-wmi when the key is pressed?

IOW, should we allow dell-wmi to handle rfkill or should we wait for
the other mechanism?

--Andy
