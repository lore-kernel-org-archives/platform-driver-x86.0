From: Anisse Astier <anisse@astier.eu>
Subject: Re: [PATCH v2 7/8] msi-wmi: Fix memory leak
Date: Fri, 30 Nov 2012 17:26:21 +0100
Message-ID: <20121130172621.6fb96829@destiny.ordissimo>
References: <1354291477-8788-1-git-send-email-maxtram95@gmail.com>
	<1354291477-8788-8-git-send-email-maxtram95@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:64985 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751602Ab2K3Qog (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 30 Nov 2012 11:44:36 -0500
Received: by mail-we0-f174.google.com with SMTP id x10so207051wey.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 30 Nov 2012 08:44:35 -0800 (PST)
In-Reply-To: <1354291477-8788-8-git-send-email-maxtram95@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Maxim Mikityanskiy <maxtram95@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, jlee@suse.com

On Fri, 30 Nov 2012 18:04:36 +0200, Maxim Mikityanskiy <maxtram95@gmail.com> wrote :

> Fix memory leak - don't forget to kfree ACPI object when returning from
> msi_wmi_notify() after suppressing key event.
> 
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
> ---
>  drivers/platform/x86/msi-wmi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/msi-wmi.c
> index 2264331..b96766b 100644
> --- a/drivers/platform/x86/msi-wmi.c
> +++ b/drivers/platform/x86/msi-wmi.c
> @@ -176,7 +176,7 @@ static void msi_wmi_notify(u32 value, void *context)
>  				pr_debug("Suppressed key event 0x%X - "
>  					 "Last press was %lld us ago\n",
>  					 key->code, ktime_to_us(diff));
> -				return;
> +				goto msi_wmi_notify_exit;
>  			}
>  			last_pressed[key->code - SCANCODE_BASE] = cur;
>  
> @@ -195,6 +195,8 @@ static void msi_wmi_notify(u32 value, void *context)
>  			pr_info("Unknown key pressed - %x\n", eventcode);
>  	} else
>  		pr_info("Unknown event received\n");
> +
> +msi_wmi_notify_exit:
>  	kfree(response.pointer);
>  }
>  

For this patch:

Acked-by: Anisse Astier <anisse@astier.eu>
