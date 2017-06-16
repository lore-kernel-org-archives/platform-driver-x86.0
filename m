From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-laptop: Fix bogus keyboard backlight
 sysfs interface
Date: Fri, 16 Jun 2017 13:06:38 +0300
Message-ID: <CAHp75VdVyxpRjahy2rLmMD2wpCwuMRZ_K+U1ALfMhmveZFqPMw@mail.gmail.com>
References: <20170616073539.1185-1-kai.heng.feng@canonical.com> <20170616075220.GV5248@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f181.google.com ([209.85.216.181]:34103 "EHLO
        mail-qt0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753243AbdFPKGj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 16 Jun 2017 06:06:39 -0400
In-Reply-To: <20170616075220.GV5248@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>, Matthew Garrett <mjg59@srcf.ucam.org>, "dvhart@infradead.org" <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jun 16, 2017 at 10:52 AM, Pali Roh=C3=A1r <pali.rohar@gmail.com> wr=
ote:
> On Friday 16 June 2017 15:35:39 Kai-Heng Feng wrote:

>> -     if (kbd_token_bits !=3D 0 || ret =3D=3D 0)
>> +     /*
>> +      * If KBD_LED_OFF_TOKEN is the only token,
>> +      * consider there is no keyboard backlight.
>> +      */
>> +     if ((kbd_token_bits & ~BIT(5)) !=3D 0 || ret =3D=3D 0)
>
> Should not this check to be rather:
>
> (kbd_token_bits !=3D 0 && (kbd_token_bits & BIT(KBD_LED_OFF_TOKEN)) !=3D =
BIT(KBD_LED_OFF_TOKEN))
>
> To express that we have at least one token at it is different from
> KBD_LED_OFF_TOKEN token?

Isn't the same to

(kbd_token_bits ^ BIT(KBD_LED_OFF_TOKEN))

?

--=20
With Best Regards,
Andy Shevchenko
