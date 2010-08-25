From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH] asus-laptop: remove no longer used keycode_map field
Date: Wed, 25 Aug 2010 16:59:02 +0200
Message-ID: <AANLkTikv3nsgGjTWgnLQ+odH=W80iJPFzW4DXsBy-6AE@mail.gmail.com>
References: <20100825144545.GA5752@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:38049 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751854Ab0HYO7F convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 25 Aug 2010 10:59:05 -0400
Received: by gyd8 with SMTP id 8so229102gyd.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Aug 2010 07:59:03 -0700 (PDT)
In-Reply-To: <20100825144545.GA5752@core.coreip.homeip.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org

On Wed, Aug 25, 2010 at 4:45 PM, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> The driver uses sparse keymap library and does not use this field
> anymore.
>
> Signed-off-by: Dmitry Torokhov <dtor@mail.ru>
> ---
>
> =A0drivers/platform/x86/asus-laptop.c | =A0 =A01 -
> =A01 files changed, 0 insertions(+), 1 deletions(-)
>
>
> diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x8=
6/asus-laptop.c
> index b756e07..56e162b 100644
> --- a/drivers/platform/x86/asus-laptop.c
> +++ b/drivers/platform/x86/asus-laptop.c
> @@ -236,7 +236,6 @@ struct asus_laptop {
> =A0 =A0 =A0 =A0u8 light_level; =A0 =A0 =A0 =A0 /* light sensor level =
*/
> =A0 =A0 =A0 =A0u8 light_switch; =A0 =A0 =A0 =A0/* light sensor switch=
 value */
> =A0 =A0 =A0 =A0u16 event_count[128]; =A0 /* count for each event TODO=
 make this better */
> - =A0 =A0 =A0 u16 *keycode_map;
> =A0};
>
> =A0static const struct key_entry asus_keymap[] =3D {
> --
> To unsubscribe from this list: send the line "unsubscribe platform-dr=
iver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

Acked-by: Corentin Chary <corentincj@iksaif.net>


--=20
Corentin Chary
http://xf.iksaif.net
