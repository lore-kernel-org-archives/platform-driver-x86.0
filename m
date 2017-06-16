From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH] platform/x86: dell-laptop: Fix bogus keyboard backlight
 sysfs interface
Date: Fri, 16 Jun 2017 17:46:58 +0800
Message-ID: <CAAd53p4xZw9vxrTf5wr86cG6apf61wB=+8cQ74cPghuBmj_b+A@mail.gmail.com>
References: <20170616073539.1185-1-kai.heng.feng@canonical.com> <20170616075220.GV5248@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f174.google.com ([209.85.128.174]:33297 "EHLO
        mail-wr0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753060AbdFPJrF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 16 Jun 2017 05:47:05 -0400
Received: by mail-wr0-f174.google.com with SMTP id r103so35614365wrb.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 16 Jun 2017 02:47:04 -0700 (PDT)
In-Reply-To: <20170616075220.GV5248@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: mjg59@srcf.ucam.org, dvhart@infradead.org, platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, Jun 16, 2017 at 3:52 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com> wro=
te:
> Should not this check to be rather:
>
> (kbd_token_bits !=3D 0 && (kbd_token_bits & BIT(KBD_LED_OFF_TOKEN)) !=3D =
BIT(KBD_LED_OFF_TOKEN))
>
> To express that we have at least one token at it is different from
> KBD_LED_OFF_TOKEN token?

Yes, this expresses the intention more clearly. I'll use it instead.

>
>>               kbd_led_present =3D true;
>>  }
>>
>
> And more important, there are three ways how to control keyboard
> backlight level:
>
> 1) Via SMBIOS token
> 2) Via SMBIOS call 4/11/0x2 (arg2, byte0)
> 3) Via SMBIOS call 4/11/0x2 (arg3, byte2)
>
> You are adding special case when only one SMBIOS toekn OFF is present
> which belongs to 1).
>
> Therefore there should be same check for 2) and 3) that there are more
> the one option to set...

I am not familiar with SMBIOS call.
Can you point out where 2) and 3) functions are?

>
> --
> Pali Roh=C3=A1r
> pali.rohar@gmail.com
