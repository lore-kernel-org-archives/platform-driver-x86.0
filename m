From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] Support intel-vbtn based tablet mode switch
Date: Mon, 22 Jan 2018 15:42:22 +0200
Message-ID: <CAHp75VeaoFhJ=nF2dfQZnfFjNTWy4_9rr6K4JpUYRVZnKDLkSQ@mail.gmail.com>
References: <1516625281-16547-1-git-send-email-notmart@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:37646 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750955AbeAVNmX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 22 Jan 2018 08:42:23 -0500
In-Reply-To: <1516625281-16547-1-git-send-email-notmart@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Martin <notmart@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Bhushan Shah <bhush94@gmail.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Mario Limonciello <mario.limonciello@dell.com>, Mario Limonciello <mario_limonciello@dell.com>

On Mon, Jan 22, 2018 at 2:48 PM, Marco Martin <notmart@gmail.com> wrote:
> some laptops such as Dell Inspiron 7000 series have the
> tablet mode switch implemented in intel acpi,
> the events to enter and exit the tablet mode are 0xCC and 0xCD

Thanks for an update.

For the future, please consider the following:
- use -v<N> to git format-patch to get a proper version of the patch
(-v2 in this case)
- use proper English grammar, i.e. capitalize sentences in the commit
message, put periods and so on
- CC: tag will look better if capitalized as a word, i.e. Cc:

> CC: platform-driver-x86@vger.kernel.org
> CC: Matthew Garrett <mjg59@srcf.ucam.org>
> CC: "Pali Roh=C3=A1r" <pali.rohar@gmail.com>
> CC: Darren Hart <dvhart@infradead.org>
> CC: Mario Limonciello <mario_limonciello@dell.com>
> CC: Andy Shevchenko <andy@infradead.org>
>

Before I will go somewhere with this version, I would like to hear
from Dmitry that the approach is correct per se.

Also, some style comments below.

> +       { KE_SW,  0xCC, { .sw =3D { SW_TABLET_MODE, 1 } } }, /* Tabletmod=
e in */
> +       { KE_SW,  0xCD, { .sw =3D { SW_TABLET_MODE, 0 } } }, /* Tabletmod=
e out */

Tabletmode -> Tablet mode

>         struct intel_vbtn_priv *priv;
>         acpi_status status;
>         int err;
> +       struct acpi_buffer vgbs_output =3D { ACPI_ALLOCATE_BUFFER, NULL }=
;

Please, locate this in a rule:
 long lines first, group of assignments even before them if it's
allowed by an execution path.

> +       status =3D acpi_evaluate_object(handle, "VGBS", NULL, &vgbs_outpu=
t);
> +       /* VGBS being present and returning something means
> +        * we have a tablet mode switch
> +        */
> +       if (ACPI_SUCCESS(status)) {
> +               union acpi_object *obj =3D vgbs_output.pointer;
> +
> +               input_set_capability(priv->input_dev, EV_SW, SW_TABLET_MO=
DE);
> +
> +               if (obj && obj->type =3D=3D ACPI_TYPE_INTEGER) {
> +                       if (obj->integer.value & TABLET_MODE_FLAG)
> +                               input_report_switch(priv->input_dev,

> +                                                       SW_TABLET_MODE,
> +                                                       0);

One line?

> +                       else
> +                               input_report_switch(priv->input_dev,

> +                                                       SW_TABLET_MODE,
> +                                                       1);

Ditto.

Besides that, if you have more then one line in the branches, use
curly braces =E2=80=94 if {} else {}.

--=20
With Best Regards,
Andy Shevchenko
