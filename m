From: Oleksandr Natalenko <oleksandr@natalenko.name>
Subject: Re: Failed IRQ assignment for INT0002 on Braswell
Date: Thu, 23 Nov 2017 22:15:50 +0100
Message-ID: <1518924.dC7gVaPWNF@natalenko.name>
References: <1902393.IdeYHqtVB8@natalenko.name> <2474990.QanOVckajO@natalenko.name> <CAHp75VcfOYmOwsYgH0ri0ZDNSP_5gb0QyttBKUMuBHm1qxhkUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VcfOYmOwsYgH0ri0ZDNSP_5gb0QyttBKUMuBHm1qxhkUw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On =C4=8Dtvrtek 23. listopadu 2017 22:08:29 CET Andy Shevchenko wrote:
> On Wed, Nov 22, 2017 at 8:13 PM, Oleksandr Natalenko
>=20
> <oleksandr@natalenko.name> wrote:
> > Hi, Hans.
> >=20
> > With this patch applied the warning is not emitted anymore with threadi=
rqs
> > enabled, and relevant kthread (irq/9-INT0002) is created.
> >=20
> > Feel free to add Reported-by/Tested-by from me once you do a submission.
>=20
> First of all, please stop top-posting.
>=20
> Second, we are using patchwork which can automatically add tags based
> on given in followup emails.
> So, if you wish to see your tag in the commit message at the end,
> please, send a reply with
>=20
> Reported-by:
> Tested-by:
>=20
> tags.
>=20
> Thanks.

Right.

Reported-by: Oleksandr Natalenko <oleksandr@natalenko.name>
Tested-by: Oleksandr Natalenko <oleksandr@natalenko.name>
