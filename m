From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: asus-wmi: Only Tell EC the OS will handle
 display hotkeys from asus_nb_wmi
Date: Fri, 24 May 2019 19:43:30 +0300
Message-ID: <CAHp75Vf6qzq3O1qz481FRuT1MN2EZOV43FpoSCC-vqATzyRF8w@mail.gmail.com>
References: <20190521062837.3887-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190521062837.3887-1-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, May 21, 2019 at 9:28 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Commit 78f3ac76d9e5 ("platform/x86: asus-wmi: Tell the EC the OS will
> handle the display off hotkey") causes the backlight to be permanently of=
f
> on various EeePC laptop models using the eeepc-wmi driver (Asus EeePC
> 1015BX, Asus EeePC 1025C).
>
> The asus_wmi_set_devstate(ASUS_WMI_DEVID_BACKLIGHT, 2, NULL) call added
> by that commit is made conditional in this commit and only enabled in
> the quirk_entry structs in the asus-nb-wmi driver fixing the broken
> display / backlight on various EeePC laptop models.
>

Hmm... doesn't apply.

> Cc: Jo=C3=A3o Paulo Rechi Vita <jprvita@endlessm.com>
> Fixes: 78f3ac76d9e5 ("platform/x86: asus-wmi: Tell the EC the OS will han=
dle the display off hotkey")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/asus-nb-wmi.c | 8 ++++++++
>  drivers/platform/x86/asus-wmi.c    | 2 +-
>  drivers/platform/x86/asus-wmi.h    | 1 +
>  3 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/as=
us-nb-wmi.c
> index b6f2ff95c3ed..59f3a37a44d7 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -78,10 +78,12 @@ static bool asus_q500a_i8042_filter(unsigned char dat=
a, unsigned char str,
>
>  static struct quirk_entry quirk_asus_unknown =3D {
>         .wapf =3D 0,
> +       .wmi_backlight_set_devstate =3D true,
>  };
>
>  static struct quirk_entry quirk_asus_q500a =3D {
>         .i8042_filter =3D asus_q500a_i8042_filter,
> +       .wmi_backlight_set_devstate =3D true,
>  };
>
>  /*
> @@ -92,26 +94,32 @@ static struct quirk_entry quirk_asus_q500a =3D {
>  static struct quirk_entry quirk_asus_x55u =3D {
>         .wapf =3D 4,
>         .wmi_backlight_power =3D true,
> +       .wmi_backlight_set_devstate =3D true,
>         .no_display_toggle =3D true,
>  };
>
>  static struct quirk_entry quirk_asus_wapf4 =3D {
>         .wapf =3D 4,
> +       .wmi_backlight_set_devstate =3D true,
>  };
>
>  static struct quirk_entry quirk_asus_x200ca =3D {
>         .wapf =3D 2,
> +       .wmi_backlight_set_devstate =3D true,
>  };
>
>  static struct quirk_entry quirk_asus_ux303ub =3D {
>         .wmi_backlight_native =3D true,
> +       .wmi_backlight_set_devstate =3D true,
>  };
>
>  static struct quirk_entry quirk_asus_x550lb =3D {
> +       .wmi_backlight_set_devstate =3D true,
>         .xusb2pr =3D 0x01D9,
>  };
>
>  static struct quirk_entry quirk_asus_forceals =3D {
> +       .wmi_backlight_set_devstate =3D true,
>         .wmi_force_als_set =3D true,
>  };
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-=
wmi.c
> index ee1fa93708ec..a66e99500c12 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -2131,7 +2131,7 @@ static int asus_wmi_add(struct platform_device *pde=
v)
>                 err =3D asus_wmi_backlight_init(asus);
>                 if (err && err !=3D -ENODEV)
>                         goto fail_backlight;
> -       } else
> +       } else if (asus->driver->quirks->wmi_backlight_set_devstate)
>                 err =3D asus_wmi_set_devstate(ASUS_WMI_DEVID_BACKLIGHT, 2=
, NULL);
>
>         status =3D wmi_install_notify_handler(asus->driver->event_guid,
> diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-=
wmi.h
> index 6c1311f4b04d..57a79bddb286 100644
> --- a/drivers/platform/x86/asus-wmi.h
> +++ b/drivers/platform/x86/asus-wmi.h
> @@ -44,6 +44,7 @@ struct quirk_entry {
>         bool store_backlight_power;
>         bool wmi_backlight_power;
>         bool wmi_backlight_native;
> +       bool wmi_backlight_set_devstate;
>         bool wmi_force_als_set;
>         int wapf;
>         /*
> --
> 2.21.0
>


--=20
With Best Regards,
Andy Shevchenko
