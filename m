From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v2] MAINTAINERS: Update for dcdbas driver
Date: Fri, 15 Jan 2016 15:08:15 +0100
Message-ID: <20160115140815.GZ11560@pali>
References: <56723AEE.1060007@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34253 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752290AbcAOOIS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 15 Jan 2016 09:08:18 -0500
Content-Disposition: inline
In-Reply-To: <56723AEE.1060007@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Srinivas_G_Gowda@Dell.com
Cc: linux-kernel@vger.kernel.org, libsmbios-devel@lists.us.dell.com, Douglas_Warzecha@Dell.com, platform-driver-x86@vger.kernel.org

On Thursday 17 December 2015 10:02:46 Srinivas_G_Gowda@Dell.com wrote:
> Update Srinivas Gowda as dcdbas driver Maintainer.
> Also adding relevant mailing list to this version of the patch
>=20
> Signed-off-by: Srinivas Gowda <srinivas_g_gowda@dell.com>
> Acked-by: Doug Warzecha <Douglas_Warzecha@dell.com>
> ---
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 79c2e48..60d598a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3390,7 +3390,8 @@ F:	drivers/hwmon/dell-smm-hwmon.c
>  F:	include/uapi/linux/i8k.h
>=20
>  DELL SYSTEMS MANAGEMENT BASE DRIVER (dcdbas)
> -M:	Doug Warzecha <Douglas_Warzecha@dell.com>
> +M:	Srinivas Gowda <srinivas_g_gowda@dell.com>
> +L:	libsmbios-devel@lists.us.dell.com
>  S:	Maintained
>  F:	Documentation/dcdbas.txt
>  F:	drivers/firmware/dcdbas.*

I see no response to this trivial v2 patch... Who will take it?

CCing platform-driver-x86@vger.kernel.org as dell-laptop.c driver is bi=
g
user of this dcdbas driver.

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
