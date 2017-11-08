From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 4/4] platform/x86: topstar-laptop: add optional WLAN
 LED workaround
Date: Wed, 8 Nov 2017 12:26:00 +0200
Message-ID: <CAHp75Vdwq=zkrsf=ONV6KjpP1huZakQ11x6Z538C-5MFrMeMPQ@mail.gmail.com>
References: <cover.1509229280.git.gdouezangrard@gmail.com> <4bfdea8bba83cd8f7fcdfdeee283f24574e4866d.1509229280.git.gdouezangrard@gmail.com>
 <CAHp75VdN2PDDKsAM8qp1ssZB+K_zgwvJBKK7UEVvsSHV_cK73g@mail.gmail.com>
 <20171103150735.GA13165@localhost> <CAHp75VdGZPZbVUSavq7VwTprtedH7hP56UQf8zPWn9dp-ViJCg@mail.gmail.com>
 <20171105223443.GF24317@fury> <20171108002526.GA17436@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f177.google.com ([209.85.216.177]:43824 "EHLO
        mail-qt0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751081AbdKHK0B (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Nov 2017 05:26:01 -0500
In-Reply-To: <20171108002526.GA17436@localhost>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Guillaume_Dou=C3=A9zan=2DGrard?= <gdouezangrard@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Nov 8, 2017 at 2:25 AM, Guillaume Dou=C3=A9zan-Grard
<gdouezangrard@gmail.com> wrote:
> On Sun, Nov 05, 2017 at 02:34:43PM -0800, Darren Hart wrote:
>> On Sun, Nov 05, 2017 at 03:28:09PM +0200, Andy Shevchenko wrote:

> I replaced the module parameter with a board name/version DMI check,
> that will be included for the new patch serie.

Below is (as PoC) fine for me.
Though one comment.

> @@ -291,10 +289,16 @@ static int topstar_acpi_add(struct acpi_device *dev=
ice)
>         if (err)
>                 goto err_platform_exit;
>
> -       if (led_workaround) {
> +       /*
> +        * Enable software-based WLAN LED control on systems with defecti=
ve
> +        * hardware switch.
> +        */

> +       if (dmi_match(DMI_BOARD_NAME, "U931")
> +                       && dmi_match(DMI_BOARD_VERSION, "RVP7")) {

I would better to see dmi_system_id table with callback that sets this
boolean variable inside topstar structure.

Something like below (adapt it to better suit your needs):

static const struct dmi_system_id topstar_quirks[] =3D {
       {
               .callback =3D dmi_led_workaround,
               .ident =3D "Topstar ... BLA BLA BLA",
               .matches =3D {
                      DMI_MATCH(DMI_BOARD_NAME, "U931"),
                      DMI_MATCH(DMI_BOARD_VERSION, "RVP7"),
               },
               .driver_data =3D topstar,
       },
       {}
};

--=20
With Best Regards,
Andy Shevchenko
