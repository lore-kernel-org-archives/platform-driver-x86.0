From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-laptop: fix phantom kbd backlight on
 Inspiron 10xx
Date: Thu, 12 Sep 2019 16:30:06 +0300
Message-ID: <CAHp75VcRBqBBQ6S6KAGv2=KMLk1Jbq3aYOYkM6qLHvDoGP0XdQ@mail.gmail.com>
References: <156824368856.28378.14511879419677114177@WARFSTATION> <20190912073358.n5bxqosowhky5uhb@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190912073358.n5bxqosowhky5uhb@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Mario Limonciello <mario.limonciello@dell.com>
Cc: Pacien TRAN-GIRARD <pacien.trangirard@pacien.net>, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

+Cc: Mario

On Thu, Sep 12, 2019 at 10:34 AM Pali Roh=C3=A1r <pali.rohar@gmail.com> wro=
te:
>
> On Thursday 12 September 2019 01:14:48 Pacien TRAN-GIRARD wrote:
> > This patch registers a quirk disabling keyboard backlight support
> > for the Dell Inspiron 1012 and 1018.
> >
> > Those models wrongly report supporting the KBD_LED_OFF_TOKEN and
> > KBD_LED_ON_TOKEN SMBIOS tokens, exposing keyboard brightness controls
> > through sysfs which freeze the system when used.
> >
> > The associated SMBIOS calls never return and cause the system to
> > hang, notably at boot when systemd-backlight tries to restore
> > previous brightness settings.
>
> Hi! This sounds like a firmware bug. Have you already reported it to Dell=
?
>
> > Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=3D107651
> > Signed-off-by: Pacien TRAN-GIRARD <pacien.trangirard@pacien.net>
>
> --
> Pali Roh=C3=A1r
> pali.rohar@gmail.com



--=20
With Best Regards,
Andy Shevchenko
