From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH 1/1] thinkpad-acpi: Reduce screen brightness user visible
 noise.
Date: Mon, 15 Jun 2015 14:06:42 -0300
Message-ID: <1434388002.1043361.296101137.662E7FE3@webmail.messagingengine.com>
References: <20150614022755.GB26753@khazad-dum.debian.net>
 <1434382154-3046-1-git-send-email-cramm0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:52951 "EHLO
	out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754427AbbFORGm (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 15 Jun 2015 13:06:42 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 6274720C26
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jun 2015 13:06:42 -0400 (EDT)
In-Reply-To: <1434382154-3046-1-git-send-email-cramm0@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ramiro Morales <cramm0@gmail.com>, dvhart@infradead.org
Cc: platform-driver-x86@vger.kernel.org

On Mon, Jun 15, 2015, at 12:29, Ramiro Morales wrote:
> Implement change in logging during screen brightness capabilities
> detection as suggested in
> https://www.mail-archive.com/ibm-acpi-devel%40lists.sourceforge.net/msg03484.html
> 
> Signed-off-by: Ramiro Morales <cramm0@gmail.com>

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

> ---
>  drivers/platform/x86/thinkpad_acpi.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c
> b/drivers/platform/x86/thinkpad_acpi.c
> index 28f3281..b48efc9 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -6450,19 +6450,16 @@ static void __init
> tpacpi_detect_brightness_capabilities(void)
>  	switch (b) {
>  	case 16:
>  		bright_maxlvl = 15;
> -               pr_info("detected a 16-level brightness capable
> ThinkPad\n");
>  		break;
>  	case 8:
>  	case 0:
>  		bright_maxlvl = 7;
> -               pr_info("detected a 8-level brightness capable
> ThinkPad\n");
>  		break;
>  	default:
> -               pr_err("Unsupported brightness interface, "
> -                      "please contact %s\n", TPACPI_MAIL);
>  		tp_features.bright_unkfw = 1;
>  		bright_maxlvl = b - 1;
>  	}
> +       pr_debug("firmware reports %d brightness levels\n",
> bright_maxlvl);
>  }
>  
>  static int __init brightness_init(struct ibm_init_struct *iibm)
> @@ -6482,6 +6479,9 @@ static int __init brightness_init(struct
> ibm_init_struct *iibm)
>  
>  	/* if it is unknown, we don't handle it: it wouldn't be safe */
>  	if (tp_features.bright_unkfw)
> +               dbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_BRGHT,
> +                          "Unsupported brightness mode, use acpi video "
> +                          "or gpu drivers");
>  		return 1;
>  
>  	if (!brightness_enable) {
> -- 
> 1.9.1
> 


-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
