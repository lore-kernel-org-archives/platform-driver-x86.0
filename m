From: joeyli <jlee@suse.com>
Subject: Re: [PATCH 03/15] acer-wmi: Mark acer_wmi_keymap[] as __initconst
Date: Tue, 29 Jul 2014 11:21:17 +0800
Message-ID: <20140729032117.GM24967@linux-rxt1.site>
References: <1405532597-28262-1-git-send-email-minipli@googlemail.com>
 <1405532597-28262-4-git-send-email-minipli@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:33974 "EHLO
	smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751730AbaG2D0q (ORCPT
	<rfc822;groupwise-platform-driver-x86@vger.kernel.org:0:0>);
	Mon, 28 Jul 2014 23:26:46 -0400
Content-Disposition: inline
In-Reply-To: <1405532597-28262-4-git-send-email-minipli@googlemail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mathias Krause <minipli@googlemail.com>
Cc: Matthew Garrett <matthew.garrett@nebula.com>, platform-driver-x86@vger.kernel.org

On Wed, Jul 16, 2014 at 07:43:05PM +0200, Mathias Krause wrote:
> sparse_keymap_setup() will make a copy of the keymap, so we can release
> the master copy after initialization.
> 
> Signed-off-by: Mathias Krause <minipli@googlemail.com>
> Cc: "Lee, Chun-Yi" <jlee@suse.com>

Signed-off-by: "Lee, Chun-Yi" <jlee@suse.com>


Thanks a lot!
Joey Lee

> ---
>  drivers/platform/x86/acer-wmi.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index 31f4da5061..fde69ee63f 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -96,7 +96,7 @@ enum acer_wmi_event_ids {
>  	WMID_ACCEL_EVENT = 0x5,
>  };
>  
> -static const struct key_entry acer_wmi_keymap[] = {
> +static const struct key_entry acer_wmi_keymap[] __initconst = {
>  	{KE_KEY, 0x01, {KEY_WLAN} },     /* WiFi */
>  	{KE_KEY, 0x03, {KEY_WLAN} },     /* WiFi */
>  	{KE_KEY, 0x04, {KEY_WLAN} },     /* WiFi */
> -- 
> 1.7.10.4
> 
