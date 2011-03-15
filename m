From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [patch 2/2] asus-wmi: potential NULL dereference in show_call()
Date: Tue, 15 Mar 2011 08:26:06 +0100
Message-ID: <AANLkTikPy_PM0yw06NNE5j6bBQbeX=Yz7ouPsurpKgrc@mail.gmail.com>
References: <20110315070737.GT2008@bicker>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:37269 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753093Ab1COH0I convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 15 Mar 2011 03:26:08 -0400
In-Reply-To: <20110315070737.GT2008@bicker>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dan Carpenter <error27@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Mar 15, 2011 at 8:07 AM, Dan Carpenter <error27@gmail.com> wrot=
e:
> In the earlier check we assumed that "obj" could be NULL. =C2=A0I loo=
ked at
> some of the other places that call evaluate_object() and they check
> for NULL as well.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> Can obj actually be NULL here? =C2=A0Perhaps a better fix would be to=
 remove
> the first check.

Yes I think it can.

> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/a=
sus-wmi.c
> index a038595..efc776c 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -1343,7 +1343,7 @@ static int show_call(struct seq_file *m, void *=
data)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0else
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0seq_printf(m, =
"%#x(%#x, %#x) =3D t:%d\n", asus->debug.method_id,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 asus->debug.dev_id, asus->debug.ctrl_param,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0obj->type);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0obj ? obj->type : -1);

Seems ok, I may change that later if we need to support more types.

Acked-by: Corentin Chary <corentin.chary@gmail.com>
--=20
Corentin Chary
http://xf.iksaif.net
