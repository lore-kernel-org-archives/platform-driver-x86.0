From: Anisse Astier <anisse@astier.eu>
Subject: Re: [PATCH v4 08/12] msi-wmi: Avoid repeating constants
Date: Thu, 20 Dec 2012 17:59:36 +0100
Message-ID: <20121220175936.21b75b27@destiny.ordissimo>
References: <1355592696-15454-1-git-send-email-maxtram95@gmail.com>
	<1355592696-15454-9-git-send-email-maxtram95@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ee0-f47.google.com ([74.125.83.47]:40052 "EHLO
	mail-ee0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751228Ab2LTR3M (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 20 Dec 2012 12:29:12 -0500
Received: by mail-ee0-f47.google.com with SMTP id e51so1866628eek.6
        for <platform-driver-x86@vger.kernel.org>; Thu, 20 Dec 2012 09:29:11 -0800 (PST)
In-Reply-To: <1355592696-15454-9-git-send-email-maxtram95@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Maxim Mikityanskiy <maxtram95@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, jlee@suse.com

On Sat, 15 Dec 2012 19:31:32 +0200, Maxim Mikityanskiy <maxtram95@gmail.com> wrote :

> Use UUID defines in MODULE_ALIAS strings to avoid repeating strings.
> 
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
> Acked-by: Lee, Chun-Yi <jlee@suse.com>
Acked-by: Anisse Astier <anisse@astier.eu>


> ---
>  drivers/platform/x86/msi-wmi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/msi-wmi.c
> index b96766b..4db0c55 100644
> --- a/drivers/platform/x86/msi-wmi.c
> +++ b/drivers/platform/x86/msi-wmi.c
> @@ -34,14 +34,14 @@ MODULE_AUTHOR("Thomas Renninger <trenn@suse.de>");
>  MODULE_DESCRIPTION("MSI laptop WMI hotkeys driver");
>  MODULE_LICENSE("GPL");
>  
> -MODULE_ALIAS("wmi:551A1F84-FBDD-4125-91DB-3EA8F44F1D45");
> -MODULE_ALIAS("wmi:B6F3EEF2-3D2F-49DC-9DE3-85BCE18C62F2");
> -
>  #define DRV_NAME "msi-wmi"
>  
>  #define MSIWMI_BIOS_GUID "551A1F84-FBDD-4125-91DB-3EA8F44F1D45"
>  #define MSIWMI_EVENT_GUID "B6F3EEF2-3D2F-49DC-9DE3-85BCE18C62F2"
>  
> +MODULE_ALIAS("wmi:" MSIWMI_BIOS_GUID);
> +MODULE_ALIAS("wmi:" MSIWMI_EVENT_GUID);
> +
>  #define SCANCODE_BASE 0xD0
>  #define MSI_WMI_BRIGHTNESSUP   SCANCODE_BASE
>  #define MSI_WMI_BRIGHTNESSDOWN (SCANCODE_BASE + 1)
