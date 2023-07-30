Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ABEAC001DE
	for <platform-driver-x86@archiver.kernel.org>; Sun, 30 Jul 2023 07:11:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbjG3HLC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 30 Jul 2023 03:11:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbjG3HLA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 30 Jul 2023 03:11:00 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 897B910FE;
        Sun, 30 Jul 2023 00:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
        t=1690701058; bh=yulS4rR3/9Q6+dSOjLG0BLulTeeJYlS4fHudIoMOxEA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Kkd6eWwsFifOMNneRKkMAtip5nMc4Q2DAel8Qfpx72SbN2k9ZY24O7tlY2x+vkYxb
         coq2qk2FBk2BRY3NQ4akdzD4ne0UjnC+ZTCmIvAV7vIwxItdPpy9l5QWvjdBAObD7L
         Yb//MxD9eVK5+c8DYjcL2rO7254+8pkKKowQeVTo=
Date:   Sun, 30 Jul 2023 09:10:57 +0200
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To:     Armin Wolf <W_Armin@gmx.de>
Cc:     hdegoede@redhat.com, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] platform/x86: wmi-bmof: Simplify read_bmof()
Message-ID: <0754301f-d0a2-4ef6-8c4b-972fd4c9a759@t-8ch.de>
References: <20230730043817.12888-1-W_Armin@gmx.de>
 <20230730043817.12888-2-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230730043817.12888-2-W_Armin@gmx.de>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 2023-07-30 06:38:16+0200, Armin Wolf wrote:
> Replace offset handling code with a single call
> to memory_read_from_buffer() to simplify read_bmof().
> 
> Tested on a ASUS PRIME B650-PLUS.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>
Tested-by: Thomas Weißschuh <linux@weissschuh.net>

> ---
>  drivers/platform/x86/wmi-bmof.c | 22 +++++-----------------
>  1 file changed, 5 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/platform/x86/wmi-bmof.c b/drivers/platform/x86/wmi-bmof.c
> index d0516cacfcb5..644d2fd889c0 100644
> --- a/drivers/platform/x86/wmi-bmof.c
> +++ b/drivers/platform/x86/wmi-bmof.c
> @@ -25,25 +25,13 @@ struct bmof_priv {
>  	struct bin_attribute bmof_bin_attr;
>  };
> 
> -static ssize_t
> -read_bmof(struct file *filp, struct kobject *kobj,
> -	 struct bin_attribute *attr,
> -	 char *buf, loff_t off, size_t count)
> +static ssize_t read_bmof(struct file *filp, struct kobject *kobj, struct bin_attribute *attr,
> +			 char *buf, loff_t off, size_t count)
>  {
> -	struct bmof_priv *priv =
> -		container_of(attr, struct bmof_priv, bmof_bin_attr);
> +	struct bmof_priv *priv = container_of(attr, struct bmof_priv, bmof_bin_attr);
> 
> -	if (off < 0)
> -		return -EINVAL;
> -
> -	if (off >= priv->bmofdata->buffer.length)
> -		return 0;
> -
> -	if (count > priv->bmofdata->buffer.length - off)
> -		count = priv->bmofdata->buffer.length - off;
> -
> -	memcpy(buf, priv->bmofdata->buffer.pointer + off, count);
> -	return count;
> +	return memory_read_from_buffer(buf, count, &off, priv->bmofdata->buffer.pointer,
> +				       priv->bmofdata->buffer.length);
>  }
> 
>  static int wmi_bmof_probe(struct wmi_device *wdev, const void *context)
> --
> 2.39.2
> 
