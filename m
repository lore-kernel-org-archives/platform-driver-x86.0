From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [patch] samsung-laptop: cleanup return type: mode_t vs umode_t
Date: Thu, 15 Mar 2012 09:14:42 +0100
Message-ID: <CAHR064i9nWy+qagj9bcAR8h_HUTcVWBMWavWaz0BCmha=XzqTg@mail.gmail.com>
References: <20120315071020.GA3567@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:57598 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755610Ab2COIOo convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 15 Mar 2012 04:14:44 -0400
In-Reply-To: <20120315071020.GA3567@elgon.mountain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Mar 15, 2012 at 8:10 AM, Dan Carpenter <dan.carpenter@oracle.co=
m> wrote:
> This function returns a umode_t (unsigned short) instead of mode_t wh=
ich
> is an unsigned int on some architectures. =C2=A0Cleaning this up sile=
nces a
> compile warning:
>
> drivers/platform/x86/samsung-laptop.c:1108:2: warning: initialization
> =C2=A0 =C2=A0 =C2=A0 =C2=A0from incompatible pointer type [enabled by=
 default]
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform=
/x86/samsung-laptop.c
> index 7d7109f..0550bc5 100644
> --- a/drivers/platform/x86/samsung-laptop.c
> +++ b/drivers/platform/x86/samsung-laptop.c
> @@ -1086,7 +1086,7 @@ static int __init samsung_backlight_init(struct=
 samsung_laptop *samsung)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> =C2=A0}
>
> -static mode_t samsung_sysfs_is_visible(struct kobject *kobj,
> +static umode_t samsung_sysfs_is_visible(struct kobject *kobj,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct =
attribute *attr, int idx)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev =3D container_of(kobj, =
struct device, kobj);

Thanks for the patch.

Acked-by: Corentin Chary <corentincj@iksaif.net>

Matthew, could you grab that one too ?
Thanks,


--=20
Corentin Chary
http://xf.iksaif.net
