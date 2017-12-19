From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v2] platform/x86: dell-wmi: Add an event created by Dell
 Latitude 5495
Date: Tue, 19 Dec 2017 15:44:31 +0100
Message-ID: <20171219144431.p5cbwmqnhylso7ge@pali>
References: <1513676389-29624-1-git-send-email-sylee@canonical.com>
 <CAHp75Vd+mnXVniQO5uNAuGOZY2P6sc0LAb+KVXud_hmcdRhdnw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33230 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1763817AbdLSOod (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Dec 2017 09:44:33 -0500
Received: by mail-wm0-f67.google.com with SMTP id g130so11744343wme.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 Dec 2017 06:44:33 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CAHp75Vd+mnXVniQO5uNAuGOZY2P6sc0LAb+KVXud_hmcdRhdnw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: "Shih-Yuan Lee (FourDollars)" <sylee@canonical.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>

On Tuesday 19 December 2017 16:42:57 Andy Shevchenko wrote:
> On Tue, Dec 19, 2017 at 11:39 AM, Shih-Yuan Lee (FourDollars)
> <sylee@canonical.com> wrote:
> > The Dell Latitude 5495 has the mic mute key.
> >
> 
> Pali, I assumed this one is settled and I go ahead to apply it to my
> review and testing queue, thanks!
> 
> Feel free to comment / object / ACK (it will be not published for a
> while anyway)

Reviewed-by: Pali Rohár <pali.rohar@gmail.com>

> > Signed-off-by: Shih-Yuan Lee (FourDollars) <sylee@canonical.com>
> > ---
> >  drivers/platform/x86/dell-wmi.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
> > index fb25b20..2c99274 100644
> > --- a/drivers/platform/x86/dell-wmi.c
> > +++ b/drivers/platform/x86/dell-wmi.c
> > @@ -261,6 +261,9 @@ static const u16 bios_to_linux_keycode[256] = {
> >   * override them.
> >   */
> >  static const struct key_entry dell_wmi_keymap_type_0010[] = {
> > +       /* Mic mute */
> > +       { KE_KEY, 0x150, { KEY_MICMUTE } },
> > +
> >         /* Fn-lock */
> >         { KE_IGNORE, 0x151, { KEY_RESERVED } },
> >
> > --
> > 2.7.4
> >
> 

-- 
Pali Rohár
pali.rohar@gmail.com
