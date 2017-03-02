From: Alex Hung <alex.hung@canonical.com>
Subject: Re: [PATCH 0/4] Improve intel-hid's self-consistency
Date: Thu, 2 Mar 2017 18:17:44 +0800
Message-ID: <CAJ=jquZo3ie0C-ZEzfC93_xXsXVaJYMD2o8G8VwYBMpctohujg@mail.gmail.com>
References: <20170224103309.19463-1-kernel@kempniu.pl> <CAHp75VdXeXmxNP=sy5Tsx3X=9PSpHK65ftPK9sExi_Pt-4ydhg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f182.google.com ([209.85.220.182]:35012 "EHLO
        mail-qk0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750779AbdCBKYK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Mar 2017 05:24:10 -0500
Received: by mail-qk0-f182.google.com with SMTP id m67so935710qkf.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Mar 2017 02:24:05 -0800 (PST)
In-Reply-To: <CAHp75VdXeXmxNP=sy5Tsx3X=9PSpHK65ftPK9sExi_Pt-4ydhg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Mar 2, 2017 at 7:03 AM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Fri, Feb 24, 2017 at 12:33 PM, Micha=C5=82 K=C4=99pie=C5=84 <kernel@ke=
mpniu.pl> wrote:
>> Commit 2cfa4b311acc ("platform/x86: intel-hid: Support 5 button array")
>> contains some coding style cleanups compared to the code it was based
>> on.  This patch series "backports" these cleanups to the rest of the
>> driver in order to make it more self-consistent and removes a redundant
>> set_bit() call as a bonus.
>>
>> This series was not tested on hardware supported by intel-hid.
>
> Alex, do you have an access to hardware to test? I wouldn't going to
> apply this until I get your tag(s) (in the best case
> Reviewed-and-tested-by).

The patches look good and tested on Latitude 7480

Reviewed-and-tested-by: Alex Hung <alex.hung@canonical.com>

>
> --
> With Best Regards,
> Andy Shevchenko
