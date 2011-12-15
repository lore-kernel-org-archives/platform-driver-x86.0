From: Corentin Chary <corentin.chary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] asus-wmi: explicitly set the wireless LED
Date: Thu, 15 Dec 2011 08:07:15 +0100
Message-ID: <CAHR064iBtSTv79BhXt9_mMWugD4U_xLCM4i1wE7PLnZM8pL57g@mail.gmail.com>
References: <1323244922-2673-1-git-send-email-kengyu@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1323244922-2673-1-git-send-email-kengyu-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Keng-Yu Lin <kengyu-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: Matthew Garrett <mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Dec 7, 2011 at 9:02 AM, Keng-Yu Lin <kengyu-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org> wrot=
e:
> On Asus K54C, the wireless LED is always off without setting explicit=
ly.
>
> Signed-off-by: Keng-Yu Lin <kengyu-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
> ---
> =C2=A0drivers/platform/x86/asus-wmi.c | =C2=A0 =C2=A03 +++
> =C2=A01 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/a=
sus-wmi.c
> index d1049ee..db514c4 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -726,6 +726,9 @@ static int asus_rfkill_set(void *data, bool block=
ed)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct asus_rfkill *priv =3D data;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 ctrl_param =3D !blocked;
>
> + =C2=A0 =C2=A0 =C2=A0 if (priv->dev_id =3D=3D ASUS_WMI_DEVID_WLAN)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 asus_wmi_set_devst=
ate(ASUS_WMI_DEVID_WIRELESS_LED, ctrl_param, NULL);
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return asus_wmi_set_devstate(priv->dev_id,=
 ctrl_param, NULL);
> =C2=A0}
>
> --
> 1.7.5.4
>

NACK

If this is only for K54C (works fine on my G73 anyway) then you must
do some kind of DMI matching right ? Or at least check that this led
is present. Do you have any list of laptops that export this LED and
how it behave ?

Anyway, you should use a led trigger for that, ideally the rfkill%d
led trigger, but for that you need the rfkill idx, which is not
exported, so you may need a new rfkill_idx() function. CCing rfkill
and led guys, they may have a better advice on that.
--=20
Corentin Chary
http://xf.iksaif.net
--
To unsubscribe from this list: send the line "unsubscribe linux-wireles=
s" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
