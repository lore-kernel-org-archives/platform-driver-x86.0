From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [patch -next 1/2] drivers, samsung-laptop: fix initialization of
 sabi_data in sabi_set_commandb
Date: Wed, 14 Mar 2012 08:12:19 +0100
Message-ID: <CAHR064gzke5o4C8cg2qH1d4VuXTMmqV-sAaiOv5O650qjc01sw@mail.gmail.com>
References: <alpine.DEB.2.00.1203132258160.5229@chino.kir.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:40928 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752229Ab2CNHMV convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 14 Mar 2012 03:12:21 -0400
In-Reply-To: <alpine.DEB.2.00.1203132258160.5229@chino.kir.corp.google.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: David Rientjes <rientjes@google.com>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Mar 14, 2012 at 6:59 AM, David Rientjes <rientjes@google.com> w=
rote:
> Fields d0, d1, d2, and d3 are members of an anonymous struct inside a=
n
> anonymous union inside struct sabi_data. =C2=A0Initialization must be=
 done by
> wrapping the anonymous union and structs with brackets to avoid a bui=
ld
> error:
>
> drivers/platform/x86/samsung-laptop.c: In function =E2=80=98sabi_set_=
commandb=E2=80=99:
> drivers/platform/x86/samsung-laptop.c:433: error: unknown field =E2=80=
=98d0=E2=80=99 specified in initializer
> drivers/platform/x86/samsung-laptop.c:433: warning: missing braces ar=
ound initializer
> drivers/platform/x86/samsung-laptop.c:433: warning: (near initializat=
ion for =E2=80=98in.<anonymous>=E2=80=99)
> ...
>
> Signed-off-by: David Rientjes <rientjes@google.com>
> ---
> =C2=A0drivers/platform/x86/samsung-laptop.c | =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform=
/x86/samsung-laptop.c
> --- a/drivers/platform/x86/samsung-laptop.c
> +++ b/drivers/platform/x86/samsung-laptop.c
> @@ -430,7 +430,7 @@ exit:
> =C2=A0static int sabi_set_commandb(struct samsung_laptop *samsung,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u16 command, u8 data)
> =C2=A0{
> - =C2=A0 =C2=A0 =C2=A0 struct sabi_data in =3D { .d0 =3D 0, .d1 =3D 0=
, .d2 =3D 0, .d3 =3D 0 };
> + =C2=A0 =C2=A0 =C2=A0 struct sabi_data in =3D { { { .d0 =3D 0, .d1 =3D=
 0, .d2 =3D 0, .d3 =3D 0 } } };
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0in.data[0] =3D data;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return sabi_command(samsung, command, &in,=
 NULL);


Acked-by: Corentin Chary <corentincj@iksaif.net>

David, just in case, I found this mail in my spam folder, probably
because your smtp server is not allowed to send @google.com mails.

Also, with which version of gcc is this necessary ? Old version worked
with 4.5 and 4.6.

Matthew, could you merge that one and the other directly in your tree ?=
 Thanks
--=20
Corentin Chary
http://xf.iksaif.net
