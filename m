From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] msi-laptop: use pr_<level> for messages
Date: Sat, 12 Mar 2011 22:31:01 -0800
Message-ID: <20110313063101.GE31566@core.coreip.homeip.net>
References: <1299754954-27787-1-git-send-email-jlee@novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:37437 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754222Ab1CMGbG (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 13 Mar 2011 01:31:06 -0500
Received: by pvg12 with SMTP id 12so678618pvg.19
        for <platform-driver-x86@vger.kernel.org>; Sat, 12 Mar 2011 22:31:05 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1299754954-27787-1-git-send-email-jlee@novell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Cc: mjg@redhat.com, platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@novell.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Corentin Chary <corentincj@iksaif.net>

On Thu, Mar 10, 2011 at 07:02:34PM +0800, Lee, Chun-Yi wrote:
> msi-laptop: use pr_<level> for messages
> 
> Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
> Cc: Matthew Garrett <mjg@redhat.com>
> Cc: Dmitry Torokhov <dtor@mail.ru>
> Cc: Corentin Chary <corentincj@iksaif.net>
> Signed-off-by: Lee, Chun-Yi <jlee@novell.com>
> ---
>  drivers/platform/x86/msi-laptop.c |   13 ++++++-------
>  1 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-laptop.c
> index 028d2c6..77a6c3b 100644
> --- a/drivers/platform/x86/msi-laptop.c
> +++ b/drivers/platform/x86/msi-laptop.c
> @@ -445,8 +445,7 @@ static struct platform_device *msipf_device;
>  
>  static int dmi_check_cb(const struct dmi_system_id *id)
>  {
> -	printk(KERN_INFO "msi-laptop: Identified laptop model '%s'.\n",
> -	       id->ident);
> +	pr_info("msi-laptop: Identified laptop model '%s'.\n", id->ident);

No, you need to add:

#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

at the very beginning of your driver (before includes) and then just do

	pr_info("Identified laptop model '%s'.\n", id->ident);

and pr_fmt() will ensure that alll your messages use consistent prefix.

Thanks.

-- 
Dmitry
