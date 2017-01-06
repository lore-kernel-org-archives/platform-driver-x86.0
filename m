From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: fujitsu-laptop: rework logolamp_set() to
 properly handle errors
Date: Fri, 6 Jan 2017 22:48:09 +0200
Message-ID: <CAHp75VemT--HrzFv3MGDzKNVUBX3y0HV81YPTM32MJ744LWZrQ@mail.gmail.com>
References: <20170105131129.5750-1-kernel@kempniu.pl> <CAHp75VfGOW9sD-SLssDqvzbqEmw=21JPZAz_stgm2pRpm5GNrQ@mail.gmail.com>
 <20170106192431.GB756@kmp-mobile.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f182.google.com ([209.85.216.182]:35196 "EHLO
        mail-qt0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1760911AbdAFUsK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 6 Jan 2017 15:48:10 -0500
In-Reply-To: <20170106192431.GB756@kmp-mobile.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jan 6, 2017 at 9:24 PM, Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempni=
u.pl> wrote:
>> On Thu, Jan 5, 2017 at 3:11 PM, Micha=C5=82 K=C4=99pie=C5=84 <kernel@kem=
pniu.pl> wrote:

>> > +       int ret, poweron =3D FUNC_LED_OFF, always =3D FUNC_LED_OFF;
>> > +

Don't know if you are already about to send v2, though I would see two
lines of above instead of one.
int ...;
int ret;


--=20
With Best Regards,
Andy Shevchenko
