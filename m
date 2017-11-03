From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v3] dell-laptop: Fix keyboard led max_brightness property
 for Dell Latitude E6410
Date: Thu, 2 Nov 2017 18:18:43 -0700
Message-ID: <20171103011843.GF7971@fury>
References: <1508349961-15051-1-git-send-email-pali.rohar@gmail.com>
 <1509654324-709-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:54621 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932657AbdKCBSt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Nov 2017 21:18:49 -0400
Content-Disposition: inline
In-Reply-To: <1509654324-709-1-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Andy Shevchenko <andy@infradead.org>, "Gabriel M. Elder" <gabriel@tekgnowsys.com>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Mario.Limonciello@dell.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Nov 02, 2017 at 09:25:24PM +0100, Pali Rohár wrote:
> This machine reports number of keyboard backlight led levels, instead of
> value of the last led level index. Therefore max_brightness properly needs
> to be subtracted by 1 to match led max_brightness API.
> 
> Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
> Reported-by: Gabriel M. Elder <gabriel@tekgnowsys.com>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=196913
> ---
> Changes since v2:
> * Rename quirk entry to kbd_led_levels_off_1
> Changes since v1:
> * Update kbd_info.levels at initialization time based on quirk
> ---
>  drivers/platform/x86/dell-laptop.c |   17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
> index f42159f..7424e53 100644
> --- a/drivers/platform/x86/dell-laptop.c
> +++ b/drivers/platform/x86/dell-laptop.c
> @@ -49,6 +49,7 @@
>  
>  struct quirk_entry {
>  	u8 touchpad_led;
> +	u8 kbd_led_levels_off_1;

I believe you and Andy agreed to use a boolean type here?

-- 
Darren Hart
VMware Open Source Technology Center
