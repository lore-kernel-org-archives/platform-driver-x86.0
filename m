From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH] dell-wmi: Stop storing pointers to DMI tables
Date: Mon, 18 Jan 2016 10:09:46 -0800
Message-ID: <CALCETrVqb4awUCvm4KYRqi2mgCW2O00=-2-T=NSngrtzEeH93g@mail.gmail.com>
References: <119170b95d373bc943eb4f16818239bac9fa6c59.1451832667.git.luto@kernel.org>
 <20160118164425.1e94185b@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:34204 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756116AbcARSKG (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 18 Jan 2016 13:10:06 -0500
Received: by mail-ob0-f180.google.com with SMTP id vt7so167930354obb.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Jan 2016 10:10:06 -0800 (PST)
In-Reply-To: <20160118164425.1e94185b@endymion.delvare>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jean Delvare <jdelvare@suse.de>
Cc: Andy Lutomirski <luto@kernel.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>

On Mon, Jan 18, 2016 at 7:44 AM, Jean Delvare <jdelvare@suse.de> wrote:
> Hi Andy,
>
> On Sun,  3 Jan 2016 06:52:28 -0800, Andy Lutomirski wrote:
>> The dmi_walk function maps the DMI table, walks it, and unmaps it.
>> This means that the dell_bios_hotkey_table that find_hk_type stores
>> points to unmapped memory by the time it gets read.
>>
>> I've been able to trigger crashes caused by the stale pointer a
>> couple of times, but never on a stock kernel.
>>
>> Fix it by generating the keymap in the dmi_walk callback instead of
>> storing a pointer.
>>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Andy Lutomirski <luto@kernel.org>
>
> Overall I like the idea.
>
>> ---
>>
>> This seems to work on my laptop.  It applies to platform-drivers-x86/for-next.
>>
>> drivers/platform/x86/dell-wmi.c | 69 +++++++++++++++++++++++++----------------
>>  1 file changed, 42 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
>> index 57402c4c394e..52db2721d7e3 100644
>> --- a/drivers/platform/x86/dell-wmi.c
>> +++ b/drivers/platform/x86/dell-wmi.c
>> @@ -116,7 +116,10 @@ struct dell_bios_hotkey_table {
>>
>>  };
>>
>> -static const struct dell_bios_hotkey_table *dell_bios_hotkey_table;
>> +struct dell_dmi_results {
>> +     int err;
>> +     struct key_entry *keymap;
>> +};
>>
>>  /* Uninitialized entries here are KEY_RESERVED == 0. */
>>  static const u16 bios_to_linux_keycode[256] __initconst = {
>> @@ -316,20 +319,34 @@ static void dell_wmi_notify(u32 value, void *context)
>>       kfree(obj);
>>  }
>>
>> -static const struct key_entry * __init dell_wmi_prepare_new_keymap(void)
>> +static void __init handle_dmi_table(const struct dmi_header *dm,
>
> This is really handling one DMI structure, not the whole table.

Renamed to handle_dmi_entry.

>
>> +                                 void *opaque)
>>  {
>> -     int hotkey_num = (dell_bios_hotkey_table->header.length - 4) /
>> -                             sizeof(struct dell_bios_keymap_entry);
>> +     struct dell_dmi_results *results = opaque;
>> +     struct dell_bios_hotkey_table *table;
>>       struct key_entry *keymap;
>> -     int i;
>> +     int hotkey_num, i;
>> +
>> +     if (results->err || results->keymap)
>> +             return;         /* We already found the hotkey table. */
>
> Can this actually happen?
>

Yes, I think, if Dell ships a laptop with two tables of type 0xB2.
There's no return code that says "I'm done", so I can't just stop
walking the DMI data after finding what I'm looking for.

>> +
>> +     if (dm->type != 0xb2 || dm->length <= 6)
>> +             return;
>> +
>> +     table = container_of(dm, struct dell_bios_hotkey_table, header);
>> +
>> +     hotkey_num = (table->header.length - 4) /
>> +                             sizeof(struct dell_bios_keymap_entry);
>
> The problem is not introduced by your patch, but the length check is
> inconsistent. sizeof(struct dell_bios_keymap_entry) is 4.

Yes, but sizeof(struct dell_bios_keymap_table) is 6.

> If we need at
> least one keymap entry then the minimum size would be 8, while the
> check above would accept 7. If 7 is fine (empty keymap) then 4, 5 and 6
> are equally fine and the length check can be dropped. If not, the
> length check should be fixed.

I think the length check is correct, but the hotkey_num calculation is
wrong.  The table is 84 bytes on my system, which makes perfect sense:
6 bytes of header and 78 == 13*6 bytes of entries.  But 84-4 is *not*
a multiple of 6.

It should be (table->header.length - sizeof(struct
dell_bios_hotkey_table) / sizeof(struct dell_bios_hotkey_enntry), I
think.

I'll add another patch to fix this up.

>> -     return keymap;
>> +     results->err = 0;
>
> The check at the beginning of the function assumes that results->err
> was already 0 originally.
>

Good catch.  I removed that line.

>> +     results->keymap = keymap;
>>  }
>>
>>  static int __init dell_wmi_input_setup(void)
>>  {
>> +     struct dell_dmi_results dmi_results = {};
>>       int err;
>>
>>       dell_wmi_input_dev = input_allocate_device();
>> @@ -373,20 +392,26 @@ static int __init dell_wmi_input_setup(void)
>>       dell_wmi_input_dev->phys = "wmi/input0";
>>       dell_wmi_input_dev->id.bustype = BUS_HOST;
>>
>> -     if (dell_new_hk_type) {
>> -             const struct key_entry *keymap = dell_wmi_prepare_new_keymap();
>> -             if (!keymap) {
>> -                     err = -ENOMEM;
>> -                     goto err_free_dev;
>> -             }
>> +     err = dmi_walk(handle_dmi_table, &dmi_results);
>> +     if (err)
>> +             goto err_free_dev;
>
> dmi_walk() returns -1 on error, not some -E value (I take the blame for
> that.) So you can't return it directly to the caller, otherwise it will
> be incorrectly interpreted as "Operation not permitted" (-1 == -EPERM.)
>
> So you must either hard-code your own -E value here, or first fix
> dmi_walk() to return something sane.

I'll submit a patch to change dmi_walk and dmi_walk_early.

>
>>
>> -             err = sparse_keymap_setup(dell_wmi_input_dev, keymap, NULL);
>> +     if (dmi_results.err) {
>> +             err = dmi_results.err;
>> +             goto err_free_dev;
>> +     }
>
> I think it would make sense to fix dmi_walk() so that it lets the
> decoding function return error codes. This would avoid the convoluted
> error code handling. Not sure why I didn't do that originally :(

I think that would make sense as a followup.  It'll probably have to
change the callback's signature, though.

--Andy
