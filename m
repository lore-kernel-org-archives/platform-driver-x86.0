From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: keyboard backlight max_brightness bug on Dell Latitude E6410
Date: Fri, 29 Sep 2017 18:19:59 +0300
Message-ID: <CAHp75VdBJxWKEsso1VrV_Q5UbU7oGx5G=DRX8SZ5K=qWx=6VBA@mail.gmail.com>
References: <20170929070823.669a95d04dbb6b53be537852cb8ecb8c.0314fabe33.wbe@email22.secureserver.net>
 <20170929141125.GO13546@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f180.google.com ([209.85.220.180]:46319 "EHLO
        mail-qk0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752242AbdI2PUA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 29 Sep 2017 11:20:00 -0400
In-Reply-To: <20170929141125.GO13546@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: "Gabriel M. Elder" <gabriel@tekgnowsys.com>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Mario Limonciello <Mario_Limonciello@dell.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Sep 29, 2017 at 5:11 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com> wro=
te:
> Yes, that would fix problem for you and break other machines...

I dunno what happened to you guys to use top-posting...

>> FYI, latest update and info relating to
>> https://bugzilla.kernel.org/show_bug.cgi?id=3D196913

Quick solution is to apply DMI to that.

--=20
With Best Regards,
Andy Shevchenko
