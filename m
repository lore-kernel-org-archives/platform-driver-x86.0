From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 01/23] asus-wmi: Remove __init from asus_wmi_platform_init
Date: Thu, 31 Mar 2011 09:17:48 +0200
Message-ID: <AANLkTimmpL41yL5Z-Gb=iVxz83Q0ob6EOErh6TMHQ9Hb@mail.gmail.com>
References: <cover.1301436234.git.joe@perches.com>
	<ae73e8c570d9ee701af6bad5c1479c3615418826.1301436234.git.joe@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:64849 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757007Ab1CaHRu convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 31 Mar 2011 03:17:50 -0400
In-Reply-To: <ae73e8c570d9ee701af6bad5c1479c3615418826.1301436234.git.joe@perches.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Matthew Garrett <mjg@redhat.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Mar 30, 2011 at 12:21 AM, Joe Perches <joe@perches.com> wrote:
> It's used by a non-init function.
>
> Signed-off-by: Joe Perches <joe@perches.com>

Acked-by: Corentin Chary <corentincj@iksaif.net>

> ---
> =C2=A0drivers/platform/x86/asus-wmi.c | =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/a=
sus-wmi.c
> index efc776c..c382af6 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -1223,7 +1223,7 @@ static int asus_wmi_sysfs_init(struct platform_=
device *device)
> =C2=A0/*
> =C2=A0* Platform device
> =C2=A0*/
> -static int __init asus_wmi_platform_init(struct asus_wmi *asus)
> +static int asus_wmi_platform_init(struct asus_wmi *asus)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int rv;
>
> --
> 1.7.4.2.g597a6.dirty
>
>



--=20
Corentin Chary
http://xf.iksaif.net
