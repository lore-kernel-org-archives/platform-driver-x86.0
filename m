From: "Shih-Yuan Lee (FourDollars)" <sylee@canonical.com>
Subject: Re: [PATCH] platform/x86: dell-wmi: Add an event created by Dell
 Latitude 5495
Date: Tue, 19 Dec 2017 17:38:05 +0800
Message-ID: <CAApEhgisFsLsTncJxLz8BVmp28bvJo72CMaWaNiVM=mX1gfCCA@mail.gmail.com>
References: <1513654714-32175-1-git-send-email-sylee@canonical.com>
 <20171219090659.oosacrjr5igcvgiz@pali> <CAApEhgjSaMp85EYKZS3Oz_piOs=36vDUAhgMRLf4GsqDAsQ9sQ@mail.gmail.com>
 <20171219093317.cz6poduog7wsnrxq@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:42915 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1760132AbdLSJi1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Dec 2017 04:38:27 -0500
Received: from mail-vk0-f70.google.com ([209.85.213.70])
        by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <shih-yuan.lee@canonical.com>)
        id 1eRELy-0003Bk-Pi
        for platform-driver-x86@vger.kernel.org; Tue, 19 Dec 2017 09:38:26 +0000
Received: by mail-vk0-f70.google.com with SMTP id q198so2506212vkh.18
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 Dec 2017 01:38:26 -0800 (PST)
In-Reply-To: <20171219093317.cz6poduog7wsnrxq@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>

On Tue, Dec 19, 2017 at 5:33 PM, Pali Rohár <pali.rohar@gmail.com> wrote:
> On Tuesday 19 December 2017 17:17:24 Shih-Yuan Lee (FourDollars) wrote:
>> n Tue, Dec 19, 2017 at 5:06 PM, Pali Rohár <pali.rohar@gmail.com> wrote:
>> > On Tuesday 19 December 2017 11:38:34 Shih-Yuan Lee (FourDollars) wrote:
>> >> The Dell Latitude 5495 has the mic mute key.
>> >>
>> >> Signed-off-by: Shih-Yuan Lee (FourDollars) <sylee@canonical.com>
>> >> ---
>> >>  drivers/platform/x86/dell-wmi.c | 3 +++
>> >>  1 file changed, 3 insertions(+)
>> >>
>> >> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
>> >> index fb25b20..d40f803 100644
>> >> --- a/drivers/platform/x86/dell-wmi.c
>> >> +++ b/drivers/platform/x86/dell-wmi.c
>> >> @@ -261,6 +261,9 @@ static const u16 bios_to_linux_keycode[256] = {
>> >>   * override them.
>> >>   */
>> >>  static const struct key_entry dell_wmi_keymap_type_0010[] = {
>> >> +     /* Mic mute */
>> >> +     { KE_KEY, 0x150, { KEY_F20 } },
>> >
>> > Why F20 for mic mute? We have KEY_MICMUTE.
>> Because X Window System doesn't support KEY_MICMUTE [1] directly,
>
> This is not an argument why adding hacks into kernel code. If one
> userspace application is buggy and cannot handle new key code (e.g.
> KEY_MICMUTE), then userspace application needs to be fixed.
>
> There are also other userspace applications which uses input devices.
>
>> it
>> still relies on systemd/udev rule [2] to convert it to KEY_F20 again
>> in the user space.
>
> That sounds like another bug which should be fixed. Translating correct
> key to incorrect one is a bad idea.
>
>> So I am also wondering why not using KEY_F20 directly and I am also
>> thinking about changing the bios_to_linux_keycode's KEY_MICMUTE to
>> KEY_F20 for compatibility.
>
> NACK. This does not make sense as we already have a key code for mic
> mute. KEY_MICMUTE was created specially for mic mute key and KEY_F20 for
> F20 key. Those are two different keys.
>
> Also such change would be regression for all applications which expects
> KEY_MICMUTE for mic mute key.
OK. Let me send a different version for this patch.
>
>> [1]: https://bugs.freedesktop.org/show_bug.cgi?id=54171
>> [2]: https://github.com/systemd/systemd/commit/fc6e082622c73eb9a22ce16a278d8c4dd7594cbb
>> >
>> >> +
>> >>       /* Fn-lock */
>> >>       { KE_IGNORE, 0x151, { KEY_RESERVED } },
>> >>
>> >
>> > --
>> > Pali Rohár
>> > pali.rohar@gmail.com
>
> --
> Pali Rohár
> pali.rohar@gmail.com



-- 
Shih-Yuan Lee (FourDollars) | Software Engineer / Debian Developer |
Delivery | Customer Engineering | Devices | Canonical
