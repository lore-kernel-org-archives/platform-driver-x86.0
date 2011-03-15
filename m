From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [patch 1/2] asus-wmi: signedness bug in read_brightness()
Date: Tue, 15 Mar 2011 08:27:19 +0100
Message-ID: <AANLkTikEQdjPBKbGAB_mVqSVqx0_Ba6hw0rQh400KPZM@mail.gmail.com>
References: <20110315070623.GS2008@bicker>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:51523 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754573Ab1COH1i convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 15 Mar 2011 03:27:38 -0400
In-Reply-To: <20110315070623.GS2008@bicker>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dan Carpenter <error27@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Mar 15, 2011 at 8:06 AM, Dan Carpenter <error27@gmail.com> wrot=
e:
> "err" needs to be signed for the error handling to work.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/a=
sus-wmi.c
> index 5b779a9..a038595 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -946,7 +946,8 @@ static int read_brightness_max(struct asus_wmi *a=
sus)
> =C2=A0static int read_brightness(struct backlight_device *bd)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct asus_wmi *asus =3D bl_get_data(bd);
> - =C2=A0 =C2=A0 =C2=A0 u32 retval, err;
> + =C2=A0 =C2=A0 =C2=A0 u32 retval;
> + =C2=A0 =C2=A0 =C2=A0 int err;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D asus_wmi_get_devstate(asus, ASUS_W=
MI_DEVID_BRIGHTNESS, &retval);

Hm, Thanks,

Acked-by: Corentin Chary <corentin.chary@gmail.com>

--=20
Corentin Chary
http://xf.iksaif.net
