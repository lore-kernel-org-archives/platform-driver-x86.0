From: "Shih-Yuan Lee (FourDollars)" <sylee@canonical.com>
Subject: Re: [PATCH] platform/x86: dell-wmi: Add an event created by Dell
 Latitude 5495
Date: Tue, 19 Dec 2017 17:17:24 +0800
Message-ID: <CAApEhgjSaMp85EYKZS3Oz_piOs=36vDUAhgMRLf4GsqDAsQ9sQ@mail.gmail.com>
References: <1513654714-32175-1-git-send-email-sylee@canonical.com> <20171219090659.oosacrjr5igcvgiz@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:42598 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933300AbdLSJRq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Dec 2017 04:17:46 -0500
Received: from mail-vk0-f69.google.com ([209.85.213.69])
        by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <shih-yuan.lee@canonical.com>)
        id 1eRE1x-0001Q0-NZ
        for platform-driver-x86@vger.kernel.org; Tue, 19 Dec 2017 09:17:45 +0000
Received: by mail-vk0-f69.google.com with SMTP id b62so9210857vke.23
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 Dec 2017 01:17:45 -0800 (PST)
In-Reply-To: <20171219090659.oosacrjr5igcvgiz@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>

n Tue, Dec 19, 2017 at 5:06 PM, Pali Rohár <pali.rohar@gmail.com> wrote:
> On Tuesday 19 December 2017 11:38:34 Shih-Yuan Lee (FourDollars) wrote:
>> The Dell Latitude 5495 has the mic mute key.
>>
>> Signed-off-by: Shih-Yuan Lee (FourDollars) <sylee@canonical.com>
>> ---
>>  drivers/platform/x86/dell-wmi.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
>> index fb25b20..d40f803 100644
>> --- a/drivers/platform/x86/dell-wmi.c
>> +++ b/drivers/platform/x86/dell-wmi.c
>> @@ -261,6 +261,9 @@ static const u16 bios_to_linux_keycode[256] = {
>>   * override them.
>>   */
>>  static const struct key_entry dell_wmi_keymap_type_0010[] = {
>> +     /* Mic mute */
>> +     { KE_KEY, 0x150, { KEY_F20 } },
>
> Why F20 for mic mute? We have KEY_MICMUTE.
Because X Window System doesn't support KEY_MICMUTE [1] directly, it
still relies on systemd/udev rule [2] to convert it to KEY_F20 again
in the user space.
So I am also wondering why not using KEY_F20 directly and I am also
thinking about changing the bios_to_linux_keycode's KEY_MICMUTE to
KEY_F20 for compatibility.

[1]: https://bugs.freedesktop.org/show_bug.cgi?id=54171
[2]: https://github.com/systemd/systemd/commit/fc6e082622c73eb9a22ce16a278d8c4dd7594cbb
>
>> +
>>       /* Fn-lock */
>>       { KE_IGNORE, 0x151, { KEY_RESERVED } },
>>
>
> --
> Pali Rohár
> pali.rohar@gmail.com
-- 
Shih-Yuan Lee (FourDollars) | Software Engineer / Debian Developer |
Delivery | Customer Engineering | Devices | Canonical
