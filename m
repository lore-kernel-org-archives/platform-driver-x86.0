From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 3/3] ideapad: Show negative when no camera
Date: Thu, 2 Jun 2011 11:43:25 +0200
Message-ID: <BANLkTimfu3pWedHJXtuV-q5risHTyQzNKOaR8P471jmsPfzODg@mail.gmail.com>
References: <1307006553-12667-1-git-send-email-ike.pan@canonical.com>
	<1307006687-12736-1-git-send-email-ike.pan@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:40881 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932843Ab1FBJn1 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 2 Jun 2011 05:43:27 -0400
In-Reply-To: <1307006687-12736-1-git-send-email-ike.pan@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ike Panhc <ike.pan@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Garrett <mjg@redhat.com>

On Thu, Jun 2, 2011 at 11:24 AM, Ike Panhc <ike.pan@canonical.com> wrot=
e:
> Signed-off-by: Ike Panhc <ike.pan@canonical.com>
> ---
> =C2=A0drivers/platform/x86/ideapad-laptop.c | =C2=A0 =C2=A05 +++++
> =C2=A01 files changed, 5 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform=
/x86/ideapad-laptop.c
> index 9c09891..4a54ed1 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -38,6 +38,7 @@
> =C2=A0#define CFG_BT_BIT =C2=A0 =C2=A0 (16)
> =C2=A0#define CFG_3G_BIT =C2=A0 =C2=A0 (17)
> =C2=A0#define CFG_WIFI_BIT =C2=A0 (18)
> +#define CFG_CAMERA_BIT (19)
>
> =C2=A0struct ideapad_private {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct rfkill *rfk[IDEAPAD_RFKILL_DEV_NUM]=
;
> @@ -199,6 +200,10 @@ static ssize_t show_ideapad_cam(struct device *d=
ev,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_attribute *attr=
,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *buf)
> =C2=A0{
> + =C2=A0 =C2=A0 =C2=A0 struct ideapad_private *priv =3D dev_get_drvda=
ta(dev);
> +
> + =C2=A0 =C2=A0 =C2=A0 if (!test_bit(CFG_CAMERA_BIT, &(priv->cfg)))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return sprintf(buf=
, "-1\n");
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return show_ideapad_helper(dev, attr, buf,=
 0x1D);
> =C2=A0}
>
> --
> 1.7.4.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe platform-dr=
iver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
>

I think it would be better to not add the file when the camera is not
available. Another option is to return -ENODEV. But printing -1
doesn't seems right.

--=20
Corentin Chary
http://xf.iksaif.net
