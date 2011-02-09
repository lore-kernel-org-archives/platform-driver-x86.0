From: Carlos Corbacho <carlos@strangeworlds.co.uk>
Subject: Re: [PATCH] acer-wmi: Fix capitalisation of GUID
Date: Wed, 9 Feb 2011 21:47:07 +0000
Message-ID: <201102092147.08107.carlos@strangeworlds.co.uk>
References: <1297287712-14708-1-git-send-email-mjg@redhat.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:44626 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752162Ab1BIVrU (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 9 Feb 2011 16:47:20 -0500
Received: by wyb28 with SMTP id 28so670609wyb.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Feb 2011 13:47:19 -0800 (PST)
In-Reply-To: <1297287712-14708-1-git-send-email-mjg@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org

On Wednesday 09 Feb 2011 21:41:52 Matthew Garrett wrote:
> 6AF4F258-B401-42fd-BE91-3D4AC2D7C0D3 needs to be
> 6AF4F258-B401-42FD-BE91-3D4AC2D7C0D3 to match the hardware alias.
> 
> Signed-off-by: Matthew Garrett <mjg@redhat.com>

Acked-by: Carlos Corbacho <carlos@strangeworlds.co.uk>

> ---
>  drivers/platform/x86/acer-wmi.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/platform/x86/acer-wmi.c
> b/drivers/platform/x86/acer-wmi.c index c5c4b8c..d82b0f0 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -84,7 +84,7 @@ MODULE_LICENSE("GPL");
>   */
>  #define AMW0_GUID1		"67C3371D-95A3-4C37-BB61-DD47B491DAAB"
>  #define AMW0_GUID2		"431F16ED-0C2B-444C-B267-27DEB140CF9C"
> -#define WMID_GUID1		"6AF4F258-B401-42fd-BE91-3D4AC2D7C0D3"
> +#define WMID_GUID1		"6AF4F258-B401-42FD-BE91-3D4AC2D7C0D3"
>  #define WMID_GUID2		"95764E09-FB56-4e83-B31A-37761F60994A"
>  #define WMID_GUID3		"61EF69EA-865C-4BC3-A502-A0DEBA0CB531"
