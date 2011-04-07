From: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] acer-wmi: Fix capitalisation of GUID in module alias
Date: Thu, 7 Apr 2011 13:10:55 +0200
Message-ID: <BANLkTinCdB8YVus2VBO4VX_ccSN5UWV1SA@mail.gmail.com>
References: <1302082806-11807-1-git-send-email-jlee@novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qy0-f181.google.com ([209.85.216.181]:40433 "EHLO
	mail-qy0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751049Ab1DGLLi convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 7 Apr 2011 07:11:38 -0400
Received: by qyg14 with SMTP id 14so1673621qyg.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 Apr 2011 04:11:37 -0700 (PDT)
In-Reply-To: <1302082806-11807-1-git-send-email-jlee@novell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Cc: carlos@strangeworlds.co.uk, platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@novell.com>, Matthew Garrett <mjg@redhat.com>

2011/4/6 Lee, Chun-Yi <joeyli.kernel@gmail.com>:
> wmi:6AF4F258-B401-42Fd-BE91-3D4AC2D7C0D3 needs to be
> wmi:6AF4F258-B401-42FD-BE91-3D4AC2D7C0D3 in module alias for acer-wmi=
 is
> automatically loaded.
>
> Cc: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
> Cc: Matthew Garrett <mjg@redhat.com>
> Signed-off-by: Lee, Chun-Yi <jlee@novell.com>
> ---
> =C2=A0drivers/platform/x86/acer-wmi.c | =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/a=
cer-wmi.c
> index 0b23b75..fa8fa73 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -89,7 +89,7 @@ MODULE_LICENSE("GPL");
> =C2=A0#define ACERWMID_EVENT_GUID "676AA15E-6A47-4D9F-A2CC-1E6D18D140=
26"
>
> =C2=A0MODULE_ALIAS("wmi:67C3371D-95A3-4C37-BB61-DD47B491DAAB");
> -MODULE_ALIAS("wmi:6AF4F258-B401-42Fd-BE91-3D4AC2D7C0D3");
> +MODULE_ALIAS("wmi:6AF4F258-B401-42FD-BE91-3D4AC2D7C0D3");
> =C2=A0MODULE_ALIAS("wmi:676AA15E-6A47-4D9F-A2CC-1E6D18D14026");
>
> =C2=A0enum acer_wmi_event_ids {
> --
> 1.6.0.2
>
>

Tested-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
