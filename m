From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [patch -next 2/2] drivers, samsung-laptop: fix usage of isalnum
Date: Wed, 14 Mar 2012 08:12:32 +0100
Message-ID: <CAHR064hOBPToe6XzyKV6dfXM0sXgMcGWtM-+xyezsUQe1JzXtg@mail.gmail.com>
References: <alpine.DEB.2.00.1203132258160.5229@chino.kir.corp.google.com>
	<alpine.DEB.2.00.1203132258460.5229@chino.kir.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:40928 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756856Ab2CNHMd convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 14 Mar 2012 03:12:33 -0400
In-Reply-To: <alpine.DEB.2.00.1203132258460.5229@chino.kir.corp.google.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: David Rientjes <rientjes@google.com>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Mar 14, 2012 at 6:59 AM, David Rientjes <rientjes@google.com> w=
rote:
> linux/ctype.h is needed for isalnum() to avoid a build error:
>
> drivers/platform/x86/samsung-laptop.c: In function =E2=80=98samsung_s=
abi_diag=E2=80=99:
> drivers/platform/x86/samsung-laptop.c:1306: error: implicit declarati=
on of function =E2=80=98isalnum=E2=80=99
>
> Signed-off-by: David Rientjes <rientjes@google.com>
> ---
> =C2=A0drivers/platform/x86/samsung-laptop.c | =C2=A0 =C2=A01 +
> =C2=A01 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform=
/x86/samsung-laptop.c
> --- a/drivers/platform/x86/samsung-laptop.c
> +++ b/drivers/platform/x86/samsung-laptop.c
> @@ -25,6 +25,7 @@
> =C2=A0#include <linux/acpi.h>
> =C2=A0#include <linux/seq_file.h>
> =C2=A0#include <linux/debugfs.h>
> +#include <linux/ctype.h>
>
> =C2=A0/*
> =C2=A0* This driver is needed because a number of Samsung laptops do =
not hook

Acked-by: Corentin Chary <corentincj@iksaif.net>

--=20
Corentin Chary
http://xf.iksaif.net
