From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH] x86: thinkpad_acpi.c: fix sparse warning
Date: Thu, 05 Feb 2015 12:53:06 -0200
Message-ID: <1423147986.596170.223515537.12875A88@webmail.messagingengine.com>
References: <1423147538-13377-1-git-send-email-prabhakar.csengg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:35816 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753475AbbBEOxH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 5 Feb 2015 09:53:07 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 3372320761
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Feb 2015 09:53:07 -0500 (EST)
In-Reply-To: <1423147538-13377-1-git-send-email-prabhakar.csengg@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Lad Prabhakar <prabhakar.csengg@gmail.com>, Darren Hart <dvhart@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

On Thu, Feb 5, 2015, at 12:45, Lad Prabhakar wrote:
> From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
> 
> this patch fixes following sparse warning:
> 
> thinkpad_acpi.c:3459:11: warning: symbol 'adaptive_keyboard_modes' was
> not declared. Should it be static?
> 
> Signed-off-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

> ---
>  Found this issue on linux-next (gcc  version 4.9.2,
>  sparse version  0.4.5-rc1) and applies on top linux-next.
> 
>  drivers/platform/x86/thinkpad_acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c
> b/drivers/platform/x86/thinkpad_acpi.c
> index c3d11fa..0e9262b 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -3456,7 +3456,7 @@ enum ADAPTIVE_KEY_MODE {
>  	LAYFLAT_MODE
>  };
>  
> -const int adaptive_keyboard_modes[] = {
> +static const int adaptive_keyboard_modes[] = {
>  	HOME_MODE,
>  /*      WEB_BROWSER_MODE = 2,
>  	WEB_CONFERENCE_MODE = 3, */
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe
> platform-driver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
