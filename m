From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 0/4] Improve intel-hid's self-consistency
Date: Thu, 2 Mar 2017 01:03:14 +0200
Message-ID: <CAHp75VdXeXmxNP=sy5Tsx3X=9PSpHK65ftPK9sExi_Pt-4ydhg@mail.gmail.com>
References: <20170224103309.19463-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f177.google.com ([209.85.220.177]:36047 "EHLO
        mail-qk0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754025AbdCBCQl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2017 21:16:41 -0500
In-Reply-To: <20170224103309.19463-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Feb 24, 2017 at 12:33 PM, Micha=C5=82 K=C4=99pie=C5=84 <kernel@kemp=
niu.pl> wrote:
> Commit 2cfa4b311acc ("platform/x86: intel-hid: Support 5 button array")
> contains some coding style cleanups compared to the code it was based
> on.  This patch series "backports" these cleanups to the rest of the
> driver in order to make it more self-consistent and removes a redundant
> set_bit() call as a bonus.
>
> This series was not tested on hardware supported by intel-hid.

Alex, do you have an access to hardware to test? I wouldn't going to
apply this until I get your tag(s) (in the best case
Reviewed-and-tested-by).

--=20
With Best Regards,
Andy Shevchenko
