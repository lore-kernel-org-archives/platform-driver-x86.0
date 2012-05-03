From: Ang Way Chuang <wcang79@gmail.com>
Subject: Re: [PATCH]: Dell Vostro 3350 touchpad LED
Date: Fri, 4 May 2012 04:13:10 +0800
Message-ID: <CAKJRshntbQN1_dW3pjVVV_=+4_LyPn+xv8n7dCiykYBZtrp3SA@mail.gmail.com>
References: <4F8663FF.8020302@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:42601 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754876Ab2ECUNL convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 3 May 2012 16:13:11 -0400
Received: by pbbrp8 with SMTP id rp8so2919873pbb.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 03 May 2012 13:13:10 -0700 (PDT)
In-Reply-To: <4F8663FF.8020302@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Matthew Garrett <mjg@redhat.com>

Hi,
   Can someone please look into this patch? I know that this is
basically a useless patch. It has been sitting there for more than 2
weeks. Thanks.


On Thu, Apr 12, 2012 at 1:11 PM, Ang Way Chuang <wcang79@gmail.com> wro=
te:
> Add Vostro 3350 into quirks so that the touchpad LED works.
>
> Signed-off-by: Ang Way Chuang <wcang79@gmail.com>
> ---
> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x8=
6/dell-laptop.c
> index a05fc9c..a25d8d9 100644
> --- a/drivers/platform/x86/dell-laptop.c
> +++ b/drivers/platform/x86/dell-laptop.c
> @@ -187,6 +187,15 @@ static struct dmi_system_id __devinitdata dell_q=
uirks[] =3D {
> =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.callback =3D dmi_matched,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ident =3D "Dell Vostro 3350",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .matches =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DMI_MATCH(DMI_SYS_VENDO=
R, "Dell Inc."),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DMI_MATCH(DMI_PRODUCT_N=
AME, "Vostro 3350"),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .driver_data =3D &quirk_dell_vostro_v13=
0,
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .callback =3D dmi_matched,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ident =3D "Dell Vostro 3555",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.matches =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0DMI_MATCH(DMI_SYS_VEND=
OR, "Dell Inc."),
