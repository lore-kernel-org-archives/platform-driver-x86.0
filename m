From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH] asus-laptop: Remove historic reminder of the pre
 sparse-keymap era
Date: Tue, 10 May 2011 12:56:09 +0200
Message-ID: <BANLkTikoG8Bs9P=pTfyZyVieOTRFz1h0qQ@mail.gmail.com>
References: <1304959675-19147-1-git-send-email-anisse@astier.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:63291 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751963Ab1EJK4L convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 10 May 2011 06:56:11 -0400
Received: by eyx24 with SMTP id 24so1788726eyx.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 May 2011 03:56:09 -0700 (PDT)
In-Reply-To: <1304959675-19147-1-git-send-email-anisse@astier.eu>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Anisse Astier <anisse@astier.eu>
Cc: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, Dmitry Torokhov <dtor@mail.ru>

On Mon, May 9, 2011 at 6:47 PM, Anisse Astier <anisse@astier.eu> wrote:
> Back when every driver managed it's own sparse keymap directly,
> asus_laptop needed to keep track of its keymap. Not anymore.
>
> Signed-off-by: Anisse Astier <anisse@astier.eu>
> ---
> =C2=A0drivers/platform/x86/asus-laptop.c | =C2=A0 =C2=A01 -
> =C2=A01 files changed, 0 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x8=
6/asus-laptop.c
> index c53b3ff..0379798 100644
> --- a/drivers/platform/x86/asus-laptop.c
> +++ b/drivers/platform/x86/asus-laptop.c
> @@ -198,7 +198,6 @@ struct asus_laptop {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct backlight_device *backlight_device;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct input_dev *inputdev;
> - =C2=A0 =C2=A0 =C2=A0 struct key_entry *keymap;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct asus_led mled;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct asus_led tled;
> --
> 1.7.4.3
>
>

I remember writing the exact same patch, but it seems that it was lost.

Acked-by: Corentin Chary <corentincj@iksaif.net>

--=20
Corentin Chary
http://xf.iksaif.net
