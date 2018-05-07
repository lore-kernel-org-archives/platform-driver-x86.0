From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] dell-wmi: Set correct keycode for Fn + left arrow hotkey
Date: Mon, 7 May 2018 17:12:44 +0300
Message-ID: <CAHp75VdJ23PEY_7MBJ6o7DTj=Pk2no2KBkL_+sqWQry1q_pgYA@mail.gmail.com>
References: <20180501111154.9244-1-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180501111154.9244-1-pali.rohar@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Mario Limonciello <mario.limonciello@dell.com>, Henk <henk.vergonet@gmail.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, May 1, 2018 at 2:11 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com> wrot=
e:
> From: Henk <henk.vergonet@gmail.com>
>
> Fn + left arrow hotkey combination is used for enabling/disabling automat=
ic
> display brigthness based on integrated ALS sensor. For this purpose there
> is standard linux key KEY_BRIGHTNESS_AUTO so use it instead of KEY_UNKNOW=
N.
>
> Tested on Dell Lattitude E6500.
>

Pushed to my review and testing queue, thanks!


> Signed-off-by: Henk Vergonet <henk.vergonet@gmail.com>
> Reviewed-By: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> Reviewed-By: Mario Limonciello <mario.limonciello@dell.com>
> ---
> Changes since v1 by Pali
> * Update commit description
> ---
>  drivers/platform/x86/dell-wmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-=
wmi.c
> index 8d102195..7c918e37 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -233,7 +233,7 @@ static const u16 bios_to_linux_keycode[256] =3D {
>         [18]    =3D KEY_PROG1,
>         [19]    =3D KEY_BRIGHTNESSDOWN,
>         [20]    =3D KEY_BRIGHTNESSUP,
> -       [21]    =3D KEY_UNKNOWN,
> +       [21]    =3D KEY_BRIGHTNESS_AUTO,
>         [22]    =3D KEY_KBDILLUMTOGGLE,
>         [23]    =3D KEY_UNKNOWN,
>         [24]    =3D KEY_SWITCHVIDEOMODE,
> --
> 2.11.0
>



--=20
With Best Regards,
Andy Shevchenko
