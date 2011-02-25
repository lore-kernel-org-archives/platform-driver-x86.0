From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH] eeepc-wmi: set the touchpad toggle key code to F21
Date: Fri, 25 Feb 2011 07:52:11 +0100
Message-ID: <AANLkTim_JKQU9J3OJ0FRQ_ZVPktAPbnzr2t8SvhL2Uzj@mail.gmail.com>
References: <1298611140-21573-1-git-send-email-keng-yu.lin@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:46273 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752127Ab1BYGwM convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 25 Feb 2011 01:52:12 -0500
In-Reply-To: <1298611140-21573-1-git-send-email-keng-yu.lin@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Keng-Yu Lin <keng-yu.lin@canonical.com>
Cc: Matthew Garrett <mjg@redhat.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, tyson.chen@canonical.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>

On Fri, Feb 25, 2011 at 6:19 AM, Keng-Yu Lin <keng-yu.lin@canonical.com=
> wrote:
> Signed-off-by: Keng-Yu Lin <keng-yu.lin@canonical.com>
> ---
> =C2=A0drivers/platform/x86/eeepc-wmi.c | =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> https://bugs.freedesktop.org/show_bug.cgi?id=3D31333
>
> diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/=
eeepc-wmi.c
> index d399775..da00cbc 100644
> --- a/drivers/platform/x86/eeepc-wmi.c
> +++ b/drivers/platform/x86/eeepc-wmi.c
> @@ -113,7 +113,7 @@ static const struct key_entry eeepc_wmi_keymap[] =
=3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0{ KE_KEY, 0x32, { KEY_MUTE } },
> =C2=A0 =C2=A0 =C2=A0 =C2=A0{ KE_KEY, 0x5c, { KEY_F15 } }, /* Power Ge=
ar key */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0{ KE_KEY, 0x5d, { KEY_WLAN } },
> - =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0x6b, { KEY_F13 } }, /* Disable Touc=
hpad */
> + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0x6b, { KEY_F21 } }, /* Disable Touc=
hpad */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0{ KE_KEY, 0x82, { KEY_CAMERA } },
> =C2=A0 =C2=A0 =C2=A0 =C2=A0{ KE_KEY, 0x83, { KEY_CAMERA_ZOOMIN } },
> =C2=A0 =C2=A0 =C2=A0 =C2=A0{ KE_KEY, 0x88, { KEY_WLAN } },

Hum, I'm not very comfortable with this patch now that we got
KEY_TOUCHPAD_TOGGLE.
I know, it doesn't work with current Xorg, but if we continue to
workaround that, it'll never be fixed.

Dmitry, Matthew, any advice ?
--=20
Corentin Chary
http://xf.iksaif.net
