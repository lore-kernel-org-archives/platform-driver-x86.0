From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 0/4] Improve intel-hid's self-consistency
Date: Fri, 3 Mar 2017 20:27:30 +0200
Message-ID: <CAHp75Vdk2f0Xu5szTnP+x4UQ-Qaz-3To743Z-mJajJLn4DDadA@mail.gmail.com>
References: <20170224103309.19463-1-kernel@kempniu.pl> <CAHp75VdXeXmxNP=sy5Tsx3X=9PSpHK65ftPK9sExi_Pt-4ydhg@mail.gmail.com>
 <CAJ=jquZo3ie0C-ZEzfC93_xXsXVaJYMD2o8G8VwYBMpctohujg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJ=jquZo3ie0C-ZEzfC93_xXsXVaJYMD2o8G8VwYBMpctohujg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alex Hung <alex.hung@canonical.com>
Cc: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Mar 2, 2017 at 12:17 PM, Alex Hung <alex.hung@canonical.com> wrote:
> On Thu, Mar 2, 2017 at 7:03 AM, Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>> On Fri, Feb 24, 2017 at 12:33 PM, Micha=C5=82 K=C4=99pie=C5=84 <kernel@k=
empniu.pl> wrote:
>>> Commit 2cfa4b311acc ("platform/x86: intel-hid: Support 5 button array")
>>> contains some coding style cleanups compared to the code it was based
>>> on.  This patch series "backports" these cleanups to the rest of the
>>> driver in order to make it more self-consistent and removes a redundant
>>> set_bit() call as a bonus.
>>>
>>> This series was not tested on hardware supported by intel-hid.
>>
>> Alex, do you have an access to hardware to test? I wouldn't going to
>> apply this until I get your tag(s) (in the best case
>> Reviewed-and-tested-by).
>
> The patches look good and tested on Latitude 7480
>
> Reviewed-and-tested-by: Alex Hung <alex.hung@canonical.com>

Pushed to testing.
Thanks.

--=20
With Best Regards,
Andy Shevchenko
