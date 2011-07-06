From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] platform-drivers-x86: msi-wmi: add missing
 sparse_keymap_free in msi_wmi_init error path
Date: Wed, 6 Jul 2011 13:04:31 -0700
Message-ID: <20110706200430.GD6086@core.coreip.homeip.net>
References: <1309921520.26847.3.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:44313 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755435Ab1GFUEf (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 6 Jul 2011 16:04:35 -0400
Content-Disposition: inline
In-Reply-To: <1309921520.26847.3.camel@phoenix>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Axel Lin <axel.lin@gmail.com>
Cc: linux-kernel@vger.kernel.org, Thomas Renninger <trenn@suse.de>, Anisse Astier <anisse@astier.eu>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org

On Wed, Jul 06, 2011 at 11:05:20AM +0800, Axel Lin wrote:
> Signed-off-by: Axel Lin <axel.lin@gmail.com>

Acked-by: Dmitry Torokhov <dtor@mail.ru>

> ---
>  drivers/platform/x86/msi-wmi.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/msi-wmi.c
> index c832e33..6f40bf2 100644
> --- a/drivers/platform/x86/msi-wmi.c
> +++ b/drivers/platform/x86/msi-wmi.c
> @@ -272,6 +272,7 @@ static int __init msi_wmi_init(void)
>  err_free_backlight:
>  	backlight_device_unregister(backlight);
>  err_free_input:
> +	sparse_keymap_free(msi_wmi_input_dev);
>  	input_unregister_device(msi_wmi_input_dev);
>  err_uninstall_notifier:
>  	wmi_remove_notify_handler(MSIWMI_EVENT_GUID);
> -- 
> 1.7.4.1
> 
> 
> 

-- 
Dmitry
