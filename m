From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH] eeepc-wmi: fix function return type to kill warning
Date: Wed, 15 Dec 2010 08:03:04 +0100
Message-ID: <AANLkTi=iCwE8E+KW17Skb2AfC99PenJOvjK8vYAfVFFc@mail.gmail.com>
References: <20101214162646.5dd1c0de.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ey0-f171.google.com ([209.85.215.171]:44807 "EHLO
	mail-ey0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752380Ab0LOHDG convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 15 Dec 2010 02:03:06 -0500
In-Reply-To: <20101214162646.5dd1c0de.randy.dunlap@oracle.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: lkml <linux-kernel@vger.kernel.org>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, akpm <akpm@linux-foundation.org>, Matthew Garrett <mjg@redhat.com>

On Wed, Dec 15, 2010 at 1:26 AM, Randy Dunlap <randy.dunlap@oracle.com>=
 wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
>
> Fix return type warning:
>
> drivers/platform/x86/eeepc-wmi.c:322: warning: initialization from in=
compatible pointer type
>
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> ---
> =C2=A0drivers/platform/x86/eeepc-wmi.c | =C2=A0 =C2=A02 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>
> --- lnx-2637-rc4.orig/drivers/platform/x86/eeepc-wmi.c
> +++ lnx-2637-rc4/drivers/platform/x86/eeepc-wmi.c
> @@ -298,7 +298,7 @@ static void eeepc_wmi_notify(u32 value,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(obj);
> =C2=A0}
>
> -static int store_cpufv(struct device *dev, struct device_attribute *=
attr,
> +static ssize_t store_cpufv(struct device *dev, struct device_attribu=
te *attr,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 const char *buf, size_t count)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int value;
>


Sorry, too late, :)

http://git.kernel.org/?p=3Dlinux/kernel/git/next/linux-next.git;a=3Dcom=
mitdiff;h=3Dda7fddf92985c2525260dfd6f70006e022f4457c

Still, Thanks
--=20
Corentin Chary
http://xf.iksaif.net
