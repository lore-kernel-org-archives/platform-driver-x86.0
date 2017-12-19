From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-wmi: Add an event created by Dell
 Latitude 5495
Date: Tue, 19 Dec 2017 10:33:17 +0100
Message-ID: <20171219093317.cz6poduog7wsnrxq@pali>
References: <1513654714-32175-1-git-send-email-sylee@canonical.com>
 <20171219090659.oosacrjr5igcvgiz@pali>
 <CAApEhgjSaMp85EYKZS3Oz_piOs=36vDUAhgMRLf4GsqDAsQ9sQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:33062 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933151AbdLSJdU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Dec 2017 04:33:20 -0500
Received: by mail-wr0-f193.google.com with SMTP id v21so7575476wrc.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 Dec 2017 01:33:20 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CAApEhgjSaMp85EYKZS3Oz_piOs=36vDUAhgMRLf4GsqDAsQ9sQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Shih-Yuan Lee (FourDollars)" <sylee@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>

On Tuesday 19 December 2017 17:17:24 Shih-Yuan Lee (FourDollars) wrote:
> n Tue, Dec 19, 2017 at 5:06 PM, Pali Rohár <pali.rohar@gmail.com> wrote:
> > On Tuesday 19 December 2017 11:38:34 Shih-Yuan Lee (FourDollars) wrote:
> >> The Dell Latitude 5495 has the mic mute key.
> >>
> >> Signed-off-by: Shih-Yuan Lee (FourDollars) <sylee@canonical.com>
> >> ---
> >>  drivers/platform/x86/dell-wmi.c | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
> >> index fb25b20..d40f803 100644
> >> --- a/drivers/platform/x86/dell-wmi.c
> >> +++ b/drivers/platform/x86/dell-wmi.c
> >> @@ -261,6 +261,9 @@ static const u16 bios_to_linux_keycode[256] = {
> >>   * override them.
> >>   */
> >>  static const struct key_entry dell_wmi_keymap_type_0010[] = {
> >> +     /* Mic mute */
> >> +     { KE_KEY, 0x150, { KEY_F20 } },
> >
> > Why F20 for mic mute? We have KEY_MICMUTE.
> Because X Window System doesn't support KEY_MICMUTE [1] directly,

This is not an argument why adding hacks into kernel code. If one
userspace application is buggy and cannot handle new key code (e.g.
KEY_MICMUTE), then userspace application needs to be fixed.

There are also other userspace applications which uses input devices.

> it
> still relies on systemd/udev rule [2] to convert it to KEY_F20 again
> in the user space.

That sounds like another bug which should be fixed. Translating correct
key to incorrect one is a bad idea.

> So I am also wondering why not using KEY_F20 directly and I am also
> thinking about changing the bios_to_linux_keycode's KEY_MICMUTE to
> KEY_F20 for compatibility.

NACK. This does not make sense as we already have a key code for mic
mute. KEY_MICMUTE was created specially for mic mute key and KEY_F20 for
F20 key. Those are two different keys.

Also such change would be regression for all applications which expects
KEY_MICMUTE for mic mute key.

> [1]: https://bugs.freedesktop.org/show_bug.cgi?id=54171
> [2]: https://github.com/systemd/systemd/commit/fc6e082622c73eb9a22ce16a278d8c4dd7594cbb
> >
> >> +
> >>       /* Fn-lock */
> >>       { KE_IGNORE, 0x151, { KEY_RESERVED } },
> >>
> >
> > --
> > Pali Rohár
> > pali.rohar@gmail.com

-- 
Pali Rohár
pali.rohar@gmail.com
