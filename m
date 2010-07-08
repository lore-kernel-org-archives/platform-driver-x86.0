From: Anisse Astier <anisse@astier.eu>
Subject: Re: [PATCH] msi-wmi: make needlessly global symbols static
Date: Thu, 8 Jul 2010 10:34:42 +0200
Message-ID: <20100708103442.28520f6f@destiny.ordissimo>
References: <1278553830.7162.9.camel@mola>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:51790 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754647Ab0GHIoI (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 8 Jul 2010 04:44:08 -0400
In-Reply-To: <1278553830.7162.9.camel@mola>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Axel Lin <axel.lin@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Matthew Garrett <mjg@redhat.com>, Thomas Renninger <trenn@suse.de>, Richard Purdie <rpurdie@linux.intel.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, platform-driver-x86@vger.kernel.org

Hi Axel,

On Thu, 08 Jul 2010 09:50:30 +0800, Axel Lin <axel.lin@gmail.com> wrote :

> backlight is needlessly defined global.
> This patch makes the symbol static.
> 
> Signed-off-by: Axel Lin <axel.lin@gmail.com>
Acked-by: Anisse Astier <anisse@astier.eu>

Thanks,

Anisse

> ---
>  drivers/platform/x86/msi-wmi.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/msi-wmi.c
> index d173600..42a5469 100644
> --- a/drivers/platform/x86/msi-wmi.c
> +++ b/drivers/platform/x86/msi-wmi.c
> @@ -57,7 +57,7 @@ static struct key_entry msi_wmi_keymap[] = {
>  };
>  static ktime_t last_pressed[ARRAY_SIZE(msi_wmi_keymap) - 1];
>  
> -struct backlight_device *backlight;
> +static struct backlight_device *backlight;
>  
>  static int backlight_map[] = { 0x00, 0x33, 0x66, 0x99, 0xCC, 0xFF };
>  
