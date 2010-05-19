From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH] drivers/platform/x86/eeepc-wmi.c: fix build warning
Date: Wed, 19 May 2010 14:06:46 +0200
Message-ID: <AANLkTimTjuQUEulo8g7clpECJVHwwDc29nkWskw6fWF-@mail.gmail.com>
References: <1274265421-26747-1-git-send-email-daniel@caiaq.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:38514 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756188Ab0ESMGv convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 19 May 2010 08:06:51 -0400
In-Reply-To: <1274265421-26747-1-git-send-email-daniel@caiaq.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Daniel Mack <daniel@caiaq.de>
Cc: linux-kernel@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, Yong Wang <yong.y.wang@intel.com>, Dmitry Torokhov <dtor@mail.ru>, Tejun Heo <tj@kernel.org>, platform-driver-x86@vger.kernel.org

On Wed, May 19, 2010 at 12:37 PM, Daniel Mack <daniel@caiaq.de> wrote:
> drivers/platform/x86/eeepc-wmi.c: In function =91eeepc_wmi_notify=92:
> drivers/platform/x86/eeepc-wmi.c:209: warning: =91new=92 may be used =
uninitialized in this function
> drivers/platform/x86/eeepc-wmi.c:209: note: =91new=92 was declared he=
re
>
> Signed-off-by: Daniel Mack <daniel@caiaq.de>
> Cc: Matthew Garrett <mjg@redhat.com>
> Cc: Yong Wang <yong.y.wang@intel.com>
> Cc: Corentin Chary <corentincj@iksaif.net>
> Cc: Dmitry Torokhov <dtor@mail.ru>
> Cc: Tejun Heo <tj@kernel.org>
> Cc: platform-driver-x86@vger.kernel.org
> ---
> =A0drivers/platform/x86/eeepc-wmi.c | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/=
eeepc-wmi.c
> index b227eb4..9dc50fb 100644
> --- a/drivers/platform/x86/eeepc-wmi.c
> +++ b/drivers/platform/x86/eeepc-wmi.c
> @@ -206,7 +206,7 @@ static int eeepc_wmi_backlight_notify(struct eeep=
c_wmi *eeepc, int code)
> =A0{
> =A0 =A0 =A0 =A0struct backlight_device *bd =3D eeepc->backlight_devic=
e;
> =A0 =A0 =A0 =A0int old =3D bd->props.brightness;
> - =A0 =A0 =A0 int new;
> + =A0 =A0 =A0 int new =3D old;
>
> =A0 =A0 =A0 =A0if (code >=3D NOTIFY_BRNUP_MIN && code <=3D NOTIFY_BRN=
UP_MAX)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0new =3D code - NOTIFY_BRNUP_MIN + 1;
> --
> 1.7.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe platform-dr=
iver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

Acked-By: Corentin Chary <corentincj@iksaif.net>

--=20
Corentin Chary
http://xf.iksaif.net
--
To unsubscribe from this list: send the line "unsubscribe platform-driv=
er-x86" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
