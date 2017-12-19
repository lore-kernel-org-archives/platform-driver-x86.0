From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-wmi: Add an event created by Dell
 Latitude 5495
Date: Tue, 19 Dec 2017 09:41:07 +0100
Message-ID: <20171219084107.37exqvmslrogfdvh@pali>
References: <1513654714-32175-1-git-send-email-sylee@canonical.com>
 <20171219083455.zekue2qqrf46rps6@pali>
 <CAApEhgh1XfzeoWL6JQN-oOn9yGvJWB74jdfFKtL==UEyhNQs7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:45932 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1761524AbdLSIlL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Dec 2017 03:41:11 -0500
Received: by mail-wr0-f194.google.com with SMTP id h1so17886092wre.12
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 Dec 2017 00:41:10 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CAApEhgh1XfzeoWL6JQN-oOn9yGvJWB74jdfFKtL==UEyhNQs7Q@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Shih-Yuan Lee (FourDollars)" <sylee@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>

On Tuesday 19 December 2017 16:38:32 Shih-Yuan Lee (FourDollars) wrote:
> On Tue, Dec 19, 2017 at 4:34 PM, Pali Rohár <pali.rohar@gmail.com> wrote:
> 
> > On Tuesday 19 December 2017 11:38:34 Shih-Yuan Lee (FourDollars) wrote:
> > > The Dell Latitude 5495 has the mic mute key.
> > >
> > > Signed-off-by: Shih-Yuan Lee (FourDollars) <sylee@canonical.com>
> > > ---
> > >  drivers/platform/x86/dell-wmi.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/platform/x86/dell-wmi.c
> > b/drivers/platform/x86/dell-wmi.c
> > > index fb25b20..d40f803 100644
> > > --- a/drivers/platform/x86/dell-wmi.c
> > > +++ b/drivers/platform/x86/dell-wmi.c
> > > @@ -261,6 +261,9 @@ static const u16 bios_to_linux_keycode[256] = {
> > >   * override them.
> > >   */
> > >  static const struct key_entry dell_wmi_keymap_type_0010[] = {
> > > +     /* Mic mute */
> > > +     { KE_KEY, 0x150, { KEY_F20 } },
> >
> > Hi! Are you sure that this key code needs to be in 0010 table? Because
> > primary this table is constructed from DMI information. See
> > array bios_to_linux_keycode[].
> >
> Because I saw "dell_wmi: Unknown key with type 0x0010 and code 0x0150
> pressed" in dmesg when pressing the mic mute key.

And do you see following message?
"firmware scancode 0x%x maps to unrecognized keycode 0x%x\n"

> >
> > > +
> > >       /* Fn-lock */
> > >       { KE_IGNORE, 0x151, { KEY_RESERVED } },
> > >
> >
> > --
> > Pali Rohár
> > pali.rohar@gmail.com
> >
> 
> 
> 

-- 
Pali Rohár
pali.rohar@gmail.com
