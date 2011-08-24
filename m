From: =?UTF-8?Q?Ren=C3=A9_Bolldorf?= <xsecute@googlemail.com>
Subject: Re: Hi Rene,
Date: Wed, 24 Aug 2011 09:10:52 +0200
Message-ID: <CAEWqx5_U8wZhLFdkk2Qn-2sCE0LWXgzMjZwCqPvNG6g=HmG4gw@mail.gmail.com>
References: <CAEWqx59Hr=HBUGyDOstVbr7VEXc2JEaByCJfDZAcce5D3XiF5A@mail.gmail.com>
	<1314155562-4499-1-git-send-email-ike.pan@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qy0-f181.google.com ([209.85.216.181]:49464 "EHLO
	mail-qy0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750988Ab1HXHKx convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 24 Aug 2011 03:10:53 -0400
Received: by qyk34 with SMTP id 34so605689qyk.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Aug 2011 00:10:52 -0700 (PDT)
In-Reply-To: <1314155562-4499-1-git-send-email-ike.pan@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ike Panhc <ike.pan@canonical.com>
Cc: mjg@redhat.com, platform-driver-x86@vger.kernel.org

I agree with your approach, below is a new patch which apply clean on
top of v3.1-rc3.

Best regards

Ren=C3=A9

---
diff --git a/drivers/platform/x86/ideapad-laptop.c
b/drivers/platform/x86/ideapad-laptop.c
index 0c59541..0d94eec 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -493,6 +493,8 @@ static void ideapad_backlight_notify_power(struct
ideapad_private *priv)
       unsigned long power;
       struct backlight_device *blightdev =3D priv->blightdev;

+     if (!blightdev)
+             return;
       if (read_ec_data(ideapad_handle, 0x18, &power))
               return;
       blightdev->props.power =3D power ? FB_BLANK_UNBLANK : FB_BLANK_P=
OWERDOWN;
--

On Wed, Aug 24, 2011 at 5:12 AM, Ike Panhc <ike.pan@canonical.com> wrot=
e:
> Nice done. Thanks for finding the bug. I write most part of ideapad-l=
aptop.c
> though the maintainer is still Matthew.
>
> I think the patch attached below is much simple and we can avoid unne=
cessary
> read_ec_data if blightdev is not set. Since you are the one who find =
the bug
> and have the first patch, I would like to keep you as author and your=
 sign
> off. Of course I need your agree. (Hoping I do not break the sign-off=
 rule)
>
> Please review the patch below and reply if you agree with this or dis=
agree.
>
>
> Hi Matthew,
>
> When acpi_backlight=3Dvideo, priv->blightdev will be NULL and use it =
without
> checking will cause kernel oops. I suggest we shall have the fix in v=
3.1
> cycle.
>
>
> =3D=3D=3D=3D=3D=3D 8< =3D=3D=3D=3D=3D=3D
>
> From 8bd37cd5da31abaca4b906bc84eb45a0834678ea Mon Sep 17 00:00:00 200=
1
> From: Rene Bolldorf <xsecute@googlemail.com>
> Date: Wed, 24 Aug 2011 09:56:24 +0800
> Subject: [PATCH] ideapad: Check if acpi already handle backlight powe=
r in
> =C2=A0'ideapad_backlight_notify_power' to avoid a page fault
>
> This patch avoid a page fault in the ideapad-laptop extras when
> turning the backlight power on or off.
>
> Signed-off-by: Rene Bolldorf <xsecute@googlemail.com>
> Signed-off-by: Ike Panhc <ike.pan@canonical.com>
> ---
> =C2=A0drivers/platform/x86/ideapad-laptop.c | =C2=A0 =C2=A02 ++
> =C2=A01 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform=
/x86/ideapad-laptop.c
> index 0c59541..0d94eec 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -493,6 +493,8 @@ static void ideapad_backlight_notify_power(struct=
 ideapad_private *priv)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long power;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct backlight_device *blightdev =3D pri=
v->blightdev;
>
> + =C2=A0 =C2=A0 =C2=A0 if (!blightdev)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (read_ec_data(ideapad_handle, 0x18, &po=
wer))
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0blightdev->props.power =3D power ? FB_BLAN=
K_UNBLANK : FB_BLANK_POWERDOWN;
> --
> 1.7.5.4
>
>
