From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: intel-hid: Power button suspend on Dell
 Latitude 7275
Date: Mon, 25 Sep 2017 13:57:48 +0300
Message-ID: <CAHp75VdJXmif+pesu=EAJ5i9dWtaNLXr3QGJdQZiKp_tURtGYg@mail.gmail.com>
References: <20170917225712.12136-1-jerome.debretagne@gmail.com> <20170922234543.GB20327@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20170922234543.GB20327@fury>
Sender: linux-acpi-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Linux ACPI <linux-acpi@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Mario Limonciello <mario.limonciello@dell.com>, Alex Hung <alex.hung@canonical.com>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Sep 23, 2017 at 2:45 AM, Darren Hart <dvhart@infradead.org> wrote:
> On Mon, Sep 18, 2017 at 12:57:12AM +0200, J=C3=A9r=C3=B4me de Bretagne wr=
ote:

>> +             if (event =3D=3D 0xce) {
>> +                     input_report_key(priv->input_dev, KEY_POWER, 1);
>> +                     input_sync(priv->input_dev);
>> +                     return;
>> +             } else if (event =3D=3D 0xcf)
>> +                     return;
>
> Minor CodingStyle nit. If the if block uses parens, so does the else bloc=
k. In
> this case, since the if returns, just skip the else entirely.
>
> See Documentation/process/coding-style.rst
> The example immediatley *before* 3.1) Spaces.
>
> I've made this change and queued for testing.
>
>> +     }

Actually in this case even 'else' is redundant.

--=20
With Best Regards,
Andy Shevchenko
