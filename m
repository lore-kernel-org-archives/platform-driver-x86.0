From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH 3/3] dell_wmi: Improve unknown hotkey handling
Date: Mon, 16 Nov 2015 17:35:44 -0800
Message-ID: <CALCETrUXJfKEEAwk1-cBhDrEtgp6nP0pBGOhuoQc-XRohKtLwA@mail.gmail.com>
References: <cover.1447479930.git.luto@kernel.org> <b7fd494ac6d51c13a66fec20ec336080479b0f5f.1447479930.git.luto@kernel.org>
 <20151114093341.GC25957@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:33028 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751742AbbKQBgE convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 16 Nov 2015 20:36:04 -0500
Received: by obbww6 with SMTP id ww6so136271879obb.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2015 17:36:04 -0800 (PST)
In-Reply-To: <20151114093341.GC25957@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>

On Sat, Nov 14, 2015 at 1:33 AM, Pali Roh=C3=A1r <pali.rohar@gmail.com>=
 wrote:
> On Friday 13 November 2015 21:49:32 Andy Lutomirski wrote:
>> If DMI lists a hotkey that we don't recognize, log and ignore it
>> instead of trying to map it to keycode 0.  I haven't seen this happe=
n,
>> but it will help maintain the key map in the future and it will help
>> avoid sending bogus events.
>>
>> This also improves the message that we log when we get an unknown ke=
y
>> event.
>>
>> Signed-off-by: Andy Lutomirski <luto@kernel.org>
>> ---
>>  drivers/platform/x86/dell-wmi.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/=
dell-wmi.c
>> index 92b0149fa4a7..e43228a35f6b 100644
>> --- a/drivers/platform/x86/dell-wmi.c
>> +++ b/drivers/platform/x86/dell-wmi.c
>> @@ -180,7 +180,7 @@ static void dell_wmi_process_key(int reported_ke=
y)
>>       key =3D sparse_keymap_entry_from_scancode(dell_wmi_input_dev,
>>                                               reported_key);
>>       if (!key) {
>> -             pr_info("Unknown key %x pressed\n", reported_key);
>> +             pr_info("Unknown key with scancode 0x%x pressed\n", re=
ported_key);
>>               return;
>>       }
>>
>> @@ -343,6 +343,11 @@ static const struct key_entry * __init dell_wmi=
_prepare_new_keymap(void)
>>                                   bios_to_linux_keycode[bios_entry->=
keycode] :
>>                                   KEY_RESERVED;
>>
>> +             if (keycode =3D=3D 0) {
>> +                     pr_info("firmware scancode %d maps to unrecogn=
ized keycode %d\n", bios_entry->keycode, bios_entry->scancode);
>> +                     continue;
>> +             }
>> +
>
> This line is too long and checkpatch.pl will probably blame you.

I split it.  The first bit (with the quoted string) is still a bit
above 80, but that's better than splitting the string itself and
breaking grep.

>
> Anyway, have you already found some missing mapping which comes from
> bios/firmware (because your patches do not change that bios table)?
>

I don't see a DMI entry that maps to something outside the table,
though, so this warning doesn't trigger.  My best guess is that Dell
simply didn't bother to update the DMI table and has it hardcoded in
their driver.  Admittedly, I've never played with the official driver
at all.

--Andy
