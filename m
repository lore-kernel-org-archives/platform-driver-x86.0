From: "Shih-Yuan Lee (FourDollars)" <sylee@canonical.com>
Subject: Re: [PATCH] platform/x86: dell-wmi: Add an event created by Dell
 Latitude 5495
Date: Tue, 19 Dec 2017 17:02:52 +0800
Message-ID: <CAApEhgiSq-mK2P0ar=-PYW2WU6A1y8DzEeFtN30oWjj7hd+zMg@mail.gmail.com>
References: <1513654714-32175-1-git-send-email-sylee@canonical.com>
 <20171219083455.zekue2qqrf46rps6@pali> <CAApEhgh1XfzeoWL6JQN-oOn9yGvJWB74jdfFKtL==UEyhNQs7Q@mail.gmail.com>
 <20171219084107.37exqvmslrogfdvh@pali> <CAApEhggQ+UcritOcpyD-CjBf=kNap_uxryPJ0_8J3XYr6CtU8Q@mail.gmail.com>
 <20171219090013.dfm3zhx6ugiooq3k@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:42390 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752989AbdLSJDP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Dec 2017 04:03:15 -0500
Received: from mail-ua0-f199.google.com ([209.85.217.199])
        by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <shih-yuan.lee@canonical.com>)
        id 1eRDnt-0000KY-UK
        for platform-driver-x86@vger.kernel.org; Tue, 19 Dec 2017 09:03:14 +0000
Received: by mail-ua0-f199.google.com with SMTP id 7so11443429uap.5
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 Dec 2017 01:03:13 -0800 (PST)
In-Reply-To: <20171219090013.dfm3zhx6ugiooq3k@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>

On Tue, Dec 19, 2017 at 5:00 PM, Pali Rohár <pali.rohar@gmail.com> wrote:
> On Tuesday 19 December 2017 16:45:44 Shih-Yuan Lee (FourDollars) wrote:
>> On Tue, Dec 19, 2017 at 4:41 PM, Pali Rohár <pali.rohar@gmail.com> wrote:
>> > On Tuesday 19 December 2017 16:38:32 Shih-Yuan Lee (FourDollars) wrote:
>> >> On Tue, Dec 19, 2017 at 4:34 PM, Pali Rohár <pali.rohar@gmail.com> wrote:
>> >>
>> >> > On Tuesday 19 December 2017 11:38:34 Shih-Yuan Lee (FourDollars) wrote:
>> >> > > The Dell Latitude 5495 has the mic mute key.
>> >> > >
>> >> > > Signed-off-by: Shih-Yuan Lee (FourDollars) <sylee@canonical.com>
>> >> > > ---
>> >> > >  drivers/platform/x86/dell-wmi.c | 3 +++
>> >> > >  1 file changed, 3 insertions(+)
>> >> > >
>> >> > > diff --git a/drivers/platform/x86/dell-wmi.c
>> >> > b/drivers/platform/x86/dell-wmi.c
>> >> > > index fb25b20..d40f803 100644
>> >> > > --- a/drivers/platform/x86/dell-wmi.c
>> >> > > +++ b/drivers/platform/x86/dell-wmi.c
>> >> > > @@ -261,6 +261,9 @@ static const u16 bios_to_linux_keycode[256] = {
>> >> > >   * override them.
>> >> > >   */
>> >> > >  static const struct key_entry dell_wmi_keymap_type_0010[] = {
>> >> > > +     /* Mic mute */
>> >> > > +     { KE_KEY, 0x150, { KEY_F20 } },
>> >> >
>> >> > Hi! Are you sure that this key code needs to be in 0010 table? Because
>> >> > primary this table is constructed from DMI information. See
>> >> > array bios_to_linux_keycode[].
>> >> >
>> >> Because I saw "dell_wmi: Unknown key with type 0x0010 and code 0x0150
>> >> pressed" in dmesg when pressing the mic mute key.
>> >
>> > And do you see following message?
>> > "firmware scancode 0x%x maps to unrecognized keycode 0x%x\n"
>> No, do I put some specific kernel parameter to see it?
>
> It is print in same way as above Unknown key with type ...
OK, I saw "dell_wmi: Unknown key with type 0x0010 and code 0x0150 pressed".
There is no "firmware scancode 0x%x maps to unrecognized keycode 0x%x\n" at all.

-- 
Shih-Yuan Lee (FourDollars) | Software Engineer / Debian Developer |
Delivery | Customer Engineering | Devices | Canonical
