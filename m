From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] dell-wmi: add module param to control Dell Instant
 Launch hotkey processing
Date: Thu, 26 Nov 2015 15:41:33 +0100
Message-ID: <20151126144130.GI14190@pali>
References: <1f6ac54784b39ebb6ce02a9fb9e944c840fddb7b.1448547341.git.kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:35237 "EHLO
	mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751065AbbKZOlf (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 26 Nov 2015 09:41:35 -0500
Content-Disposition: inline
In-Reply-To: <1f6ac54784b39ebb6ce02a9fb9e944c840fddb7b.1448547341.git.kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thursday 26 November 2015 15:18:32 Micha=C5=82 K=C4=99pie=C5=84 wrot=
e:
> On some laptop models (e.g. Dell Vostro V131), pressing the Dell Inst=
ant
> Launch hotkey does not raise an i8042 interrupt - only WMI event 0xe0=
25
> is generated.  As there is no flawless way to determine whether a giv=
en
> machine is capable of simulating a keypress when this hotkey is press=
ed,
> a new module parameter is added so that the user can decide whether t=
he
> WMI event should be processed or ignored.
>=20
> Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
> ---
> As my last message [1] in the rather lengthy thread failed to elicit =
any
> response, I guess I might just as well post the proposed patch so tha=
t
> we have something specific to discuss.
>=20
> [1] http://www.spinics.net/lists/platform-driver-x86/msg07679.html
>=20

Can you wait just a little bit? Till end of month two Dell kernel devs
are on vacation, so after that they maybe answer to question about new
hotkey format/support in kernel.

>  drivers/platform/x86/dell-wmi.c |    9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/d=
ell-wmi.c
> index 8cb0f57..e68ce3b 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -44,6 +44,10 @@ MODULE_LICENSE("GPL");
>  #define DELL_EVENT_GUID "9DBB5994-A997-11DA-B012-B622A1EF5492"
> =20
>  static int acpi_video;
> +static bool process_dil;
> +
> +module_param(process_dil, bool, 0644);
> +MODULE_PARM_DESC(process_dil, "Generate an input event when the WMI =
event for Dell Instant Launch hotkey is received");

I do not like name "dil". It takes me few minutes to interpret it as
Dell Instant Launch...

Also I do not know if this is the best approach.

>  	/* Shortcut and audio panel keys */
> -	{ KE_IGNORE, 0xe025, { KEY_RESERVED } },
> +	{ KE_KEY, 0xe025, { KEY_PROG4 } },
>  	{ KE_IGNORE, 0xe026, { KEY_RESERVED } },

I'm trying to figure out if those two keys are really reported via
keyboard controller or not. They were added 4 years ago in commit
f1566f0dc07ec9b5409b348070f5a700032d7881. But from bug report
http://bugs.launchpad.net/bugs/815914 there is no information if those
two keys are really reported by keyboard controller or not.

And if not our problem could be easier...

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
