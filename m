From: Dmitry Tunin <hanipouspilot@gmail.com>
Subject: Re: [PATCH] ideapad_laptop: Lenovo G50-30 fix rfkill always reports
 wireless blocked
Date: Mon, 08 Dec 2014 20:53:40 +0300
Message-ID: <5485E5A4.9070805@gmail.com>
References: <547753DE.9050809@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <547753DE.9050809@gmail.com>
Sender: stable-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Is anything wrong with this patch?
It was made against last mainline kernel at the moment.
If a patch against linux-next needed, I can make it.
Without this patch wireless is always blocked.

Regards,

Dmitry.

27.11.2014 19:39, Dmitry Tunin =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Rfkill always shows wireless blocked unless ideapad_laptop is blackli=
sted.
> Add a quirk.
>
> Cc: stable@vger.kernel.org
> BugLink:https://bugs.launchpad.net/bugs/1397021
> Signed-off-by: Dmitry Tunin <hanipouspilot@gmail.com>
> ---
>   drivers/platform/x86/ideapad-laptop.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform=
/x86/ideapad-laptop.c
> index ed494f3..9958de6 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -844,6 +844,13 @@ static const struct dmi_system_id no_hw_rfkill_l=
ist[] =3D {
>               DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo YOGA 3 Pro-1370"=
),
>           },
>       },
> +    {
> +        .ident =3D "Lenovo G50-30",
> +        .matches =3D {
> +            DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +            DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo G50-30"),
> +        },
> +    },
>       {}
>   };
>
