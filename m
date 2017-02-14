From: Alex Hung <alex.hung@canonical.com>
Subject: Re: [PATCH][V2] intel-hid: support 5 array button
Date: Tue, 14 Feb 2017 08:06:42 +0800
Message-ID: <CAJ=jquY4gd-3jrdOXox3EsCw0fs3Ri99Z7pXpR76amcPAsxoSg@mail.gmail.com>
References: <1485415981-20487-1-git-send-email-alex.hung@canonical.com>
 <20170204011439.GD38511@f23x64.localdomain> <CAJ=jquadR0-H0hjhqPCzj2QS=uv_zGKj=H2XenRJNp_x+Hc44A@mail.gmail.com>
 <20170213114312.GB1188@ozzy.nask.waw.pl> <CAHp75Vdjq16tM2Usy+iBTy=VqQu=7XWJK5noYhm5D_WvdpKLpA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f180.google.com ([209.85.216.180]:35938 "EHLO
        mail-qt0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751408AbdBNAGn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Feb 2017 19:06:43 -0500
Received: by mail-qt0-f180.google.com with SMTP id k15so98605681qtg.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Feb 2017 16:06:43 -0800 (PST)
In-Reply-To: <CAHp75Vdjq16tM2Usy+iBTy=VqQu=7XWJK5noYhm5D_WvdpKLpA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

On Tue, Feb 14, 2017 at 7:23 AM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Feb 13, 2017 at 1:43 PM, Micha=C5=82 K=C4=99pie=C5=84 <kernel@kem=
pniu.pl> wrote:
>>> Thanks for the review. I will send another patch to address all comment=
s later.
>
>> To avoid churn, perhaps the maintainers could do this for you while
>> moving this patch to for-next?  Or we can simply ignore this, as I said
>> this is just a minor annoyance.
>
> I would like to see simplification due to use of devm_input_allocate_devi=
ce().
>
> Alex, can you send v3 addressing latest comments?
> If you feel follow up patch would be better, please tell us.

Okay, I will send V3 shortly.

>
> --
> With Best Regards,
> Andy Shevchenko



--=20
Cheers,
Alex Hung
