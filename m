From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH 3/3] dell_wmi: Improve unknown hotkey handling
Date: Fri, 20 Nov 2015 16:34:17 -0800
Message-ID: <CALCETrUn6R2p_3tcY0OM1k68FQcmF52Q0qQ4U2zoq5t3eR-MPw@mail.gmail.com>
References: <cover.1447479930.git.luto@kernel.org> <b7fd494ac6d51c13a66fec20ec336080479b0f5f.1447479930.git.luto@kernel.org>
 <20151114093341.GC25957@pali> <CALCETrUXJfKEEAwk1-cBhDrEtgp6nP0pBGOhuoQc-XRohKtLwA@mail.gmail.com>
 <20151121002904.GK7413@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:36587 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752011AbbKUAei convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 20 Nov 2015 19:34:38 -0500
Received: by obdgf3 with SMTP id gf3so100390848obd.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2015 16:34:37 -0800 (PST)
In-Reply-To: <20151121002904.GK7413@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>

On Fri, Nov 20, 2015 at 4:29 PM, Darren Hart <dvhart@infradead.org> wro=
te:
> On Mon, Nov 16, 2015 at 05:35:44PM -0800, Andy Lutomirski wrote:
>> On Sat, Nov 14, 2015 at 1:33 AM, Pali Roh=C3=A1r <pali.rohar@gmail.c=
om> wrote:
>> > On Friday 13 November 2015 21:49:32 Andy Lutomirski wrote:
>> >> If DMI lists a hotkey that we don't recognize, log and ignore it
>> >> instead of trying to map it to keycode 0.  I haven't seen this ha=
ppen,
>> >> but it will help maintain the key map in the future and it will h=
elp
>> >> avoid sending bogus events.
>> >>
>> >> This also improves the message that we log when we get an unknown=
 key
>> >> event.
>> >>
>> >> Signed-off-by: Andy Lutomirski <luto@kernel.org>
>> >> ---
>> >>  drivers/platform/x86/dell-wmi.c | 7 ++++++-
>> >>  1 file changed, 6 insertions(+), 1 deletion(-)
>> >>
>> >> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x=
86/dell-wmi.c
>> >> index 92b0149fa4a7..e43228a35f6b 100644
>> >> --- a/drivers/platform/x86/dell-wmi.c
>> >> +++ b/drivers/platform/x86/dell-wmi.c
>> >> @@ -180,7 +180,7 @@ static void dell_wmi_process_key(int reported=
_key)
>> >>       key =3D sparse_keymap_entry_from_scancode(dell_wmi_input_de=
v,
>> >>                                               reported_key);
>> >>       if (!key) {
>> >> -             pr_info("Unknown key %x pressed\n", reported_key);
>> >> +             pr_info("Unknown key with scancode 0x%x pressed\n",=
 reported_key);
>> >>               return;
>> >>       }
>> >>
>> >> @@ -343,6 +343,11 @@ static const struct key_entry * __init dell_=
wmi_prepare_new_keymap(void)
>> >>                                   bios_to_linux_keycode[bios_entr=
y->keycode] :
>> >>                                   KEY_RESERVED;
>> >>
>> >> +             if (keycode =3D=3D 0) {
>> >> +                     pr_info("firmware scancode %d maps to unrec=
ognized keycode %d\n", bios_entry->keycode, bios_entry->scancode);
>> >> +                     continue;
>> >> +             }
>> >> +
>> >
>> > This line is too long and checkpatch.pl will probably blame you.
>>
>> I split it.  The first bit (with the quoted string) is still a bit
>> above 80, but that's better than splitting the string itself and
>> breaking grep.
>
> So I've taken care of this in my branch (and the one above too).
>
>>
>> >
>> > Anyway, have you already found some missing mapping which comes fr=
om
>> > bios/firmware (because your patches do not change that bios table)=
?
>> >
>>
>> I don't see a DMI entry that maps to something outside the table,
>> though, so this warning doesn't trigger.  My best guess is that Dell
>> simply didn't bother to update the DMI table and has it hardcoded in
>> their driver.  Admittedly, I've never played with the official drive=
r
>> at all.
>
> Pali, was this something you wanted to discuss more before I merge it=
?

=46WIW, my current partial understanding of what changed between
previous laptops and the 9350 is that there's Yet Another New Hotkey
Mechanism (tm).  I'm not sure whether I should comment on exactly what
it does, but if you dig around in the DSDT, it's not all that hard to
get a decent idea.

The upshot is that, on Windows, it's probably still the case that all
of the hotkeys that are supposed to be handled through WMI on the 9350
are, indeed, in the DMI table.  Presumably the Windows driver doesn't
visibly warn about unexpected scancodes.

Since we *do* warn about unexpected scancodes, we need to silence the
warnings.  We could do it with a fancy table-driven approach that can
actually generate keystrokes as in this patch (which gives us full
support for the 9350's rfkill key), or we could just make a little
list of scancodes that aren't worth warning about and add a while new
platform driver for the new mechanism.  Either way works.

--Andy
