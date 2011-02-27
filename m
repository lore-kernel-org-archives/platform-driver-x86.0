From: Carlos Corbacho <carlos@strangeworlds.co.uk>
Subject: Re: [PATCH] acer-wmi: Fix WMI ID
Date: Sun, 27 Feb 2011 10:31:06 +0000
Message-ID: <201102271031.06527.carlos@strangeworlds.co.uk>
References: <AANLkTimNT2s_fxsE_uwq=xJeJXTRh1ts_YTU1vk7Vq51@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:64607 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751884Ab1B0KbV convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 27 Feb 2011 05:31:21 -0500
Received: by wyg36 with SMTP id 36so2842953wyg.19
        for <platform-driver-x86@vger.kernel.org>; Sun, 27 Feb 2011 02:31:20 -0800 (PST)
In-Reply-To: <AANLkTimNT2s_fxsE_uwq=xJeJXTRh1ts_YTU1vk7Vq51@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: platform-driver-x86@vger.kernel.org

On Saturday 26 Feb 2011 20:20:19 Pali Roh=C3=A1r wrote:
> --- a/drivers/platform/x86/acer-wmi.c	2011-01-30 00:28:04.000000000 +=
0100
> +++ b/drivers/platform/x86/acer-wmi.c	2011-01-30 01:30:02.000000000 +=
0100
> @@ -91,11 +91,11 @@ struct acer_quirks {
>   */
>  #define AMW0_GUID1		"67C3371D-95A3-4C37-BB61-DD47B491DAAB"
>  #define AMW0_GUID2		"431F16ED-0C2B-444C-B267-27DEB140CF9C"
> -#define WMID_GUID1		"6AF4F258-B401-42fd-BE91-3D4AC2D7C0D3"
> -#define WMID_GUID2		"95764E09-FB56-4e83-B31A-37761F60994A"
> +#define WMID_GUID1		"6AF4F258-B401-42FD-BE91-3D4AC2D7C0D3"

You'll need to rebase against the platform-x86 tree - Matthew has alrea=
dy=20
fixed WMID_GUID1.

-Carlos
