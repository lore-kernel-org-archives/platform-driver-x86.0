Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C24D4EB64DD
	for <platform-driver-x86@archiver.kernel.org>; Sun, 30 Jul 2023 07:10:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbjG3HKe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 30 Jul 2023 03:10:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjG3HKd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 30 Jul 2023 03:10:33 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 392EC10FE;
        Sun, 30 Jul 2023 00:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
        t=1690701029; bh=ATqRlo8LtsDvVCdJdSwTHcECxAmz60tFbmxDsJJ7stk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lMvY8YgC6MMin+su5szDVx5+GH27Z03H3fi88ErT0IWNceW+A6l/zDlwAYtH8qEkV
         tIM/26C3LLAdA3L0fb1VpezrHQbwXTlN4/46HTAPKG+0nKs1wpz3MrhZ+nb19vNshv
         GUGy1CxhFkI3WRD+smpEZCaZoDcVFOdgUgR9TcwQ=
Date:   Sun, 30 Jul 2023 09:10:29 +0200
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To:     Armin Wolf <W_Armin@gmx.de>
Cc:     hdegoede@redhat.com, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] platform/x86: wmi-bmof: Use device_create_bin_file()
Message-ID: <5dc6355a-dedd-4471-abab-6b0c4ea434b1@t-8ch.de>
References: <20230730043817.12888-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230730043817.12888-1-W_Armin@gmx.de>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 2023-07-30 06:38:15+0200, Armin Wolf wrote:
> Use device_create_bin_file() instead of sysfs_create_bin_file()
> to avoid having to access the device kobject.
> 
> Tested on a ASUS PRIME B650-PLUS.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>
Tested-by: Thomas Weißschuh <linux@weissschuh.net>

> ---
>  drivers/platform/x86/wmi-bmof.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/wmi-bmof.c b/drivers/platform/x86/wmi-bmof.c
> index 80137afb9753..d0516cacfcb5 100644
> --- a/drivers/platform/x86/wmi-bmof.c
> +++ b/drivers/platform/x86/wmi-bmof.c
> @@ -75,7 +75,7 @@ static int wmi_bmof_probe(struct wmi_device *wdev, const void *context)
>  	priv->bmof_bin_attr.read = read_bmof;
>  	priv->bmof_bin_attr.size = priv->bmofdata->buffer.length;
> 
> -	ret = sysfs_create_bin_file(&wdev->dev.kobj, &priv->bmof_bin_attr);
> +	ret = device_create_bin_file(&wdev->dev, &priv->bmof_bin_attr);
>  	if (ret)
>  		goto err_free;
> 
> @@ -90,7 +90,7 @@ static void wmi_bmof_remove(struct wmi_device *wdev)
>  {
>  	struct bmof_priv *priv = dev_get_drvdata(&wdev->dev);
> 
> -	sysfs_remove_bin_file(&wdev->dev.kobj, &priv->bmof_bin_attr);
> +	device_remove_bin_file(&wdev->dev, &priv->bmof_bin_attr);
>  	kfree(priv->bmofdata);
>  }
> 
> --
> 2.39.2
> 
