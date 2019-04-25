From: ibm-acpi@hmh.eng.br
Subject: =?UTF-8?Q?Re:_[PATCH]_platform/x86:_thinkpad=5Facpi:_Mark_expected_switc?=
 =?UTF-8?Q?h_fall-throughs?=
Date: Wed, 24 Apr 2019 20:55:05 -0400
Message-ID: <13ba6003-ff33-4e5b-b88e-ef93bc68dc48@www.fastmail.com>
References: <20190424181543.GA31200@embeddedor>
 <CAGXu5jKRO45m1TRDPA09sv0j+cZCC8e1w+oQty4YfOttKP3FYA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGXu5jKRO45m1TRDPA09sv0j+cZCC8e1w+oQty4YfOttKP3FYA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kees Cook <keescook@chromium.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Apr 24, 2019, at 16:05, Kees Cook wrote:
> On Wed, Apr 24, 2019 at 11:15 AM Gustavo A. R. Silva
> <gustavo@embeddedor.com> wrote:
> >
> > In preparation to enabling -Wimplicit-fallthrough, mark switch
> > cases where we are expecting to fall through.
> >
> > This patch fixes the following warnings:
> >
> > drivers/platform/x86/thinkpad_acpi.c: In function =E2=80=98thermal_g=
et_sensor=E2=80=99:
> > drivers/platform/x86/thinkpad_acpi.c:6316:6: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
> >    if (idx >=3D 8 && idx <=3D 15) {
> >       ^
> > drivers/platform/x86/thinkpad_acpi.c:6322:2: note: here
> >   case TPACPI_THERMAL_TPEC_8:
> >   ^~~~
> > drivers/platform/x86/thinkpad_acpi.c: In function =E2=80=98hotkey_no=
tify=E2=80=99:
> > drivers/platform/x86/thinkpad_acpi.c:4208:7: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
> >     if (tp_features.hotkey_wlsw &&
> >        ^
> > drivers/platform/x86/thinkpad_acpi.c:4216:3: note: here
> >    default:
> >    ^~~~~~~
> >
> > Warning level 3 was used: -Wimplicit-fallthrough=3D3
> >
> > Notice that, in this particular case, the code comments are modified=

> > in accordance with what GCC is expecting to find.
> >
> > This patch is part of the ongoing efforts to enable
> > -Wimplicit-fallthrough.
> >
> > Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
>=20
> Reviewed-by: Kees Cook <keescook@chromium.org>

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
