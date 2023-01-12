Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ACDDC54EBE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Jan 2023 22:32:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232665AbjALWcP convert rfc822-to-8bit (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 12 Jan 2023 17:32:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240568AbjALWbn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Jan 2023 17:31:43 -0500
Received: from smtprelay03.ispgateway.de (smtprelay03.ispgateway.de [80.67.18.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 515F5272B
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jan 2023 14:31:21 -0800 (PST)
Received: from [80.82.223.85] (helo=mail.piie.net)
        by smtprelay03.ispgateway.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <peter@piie.net>)
        id 1pG5tK-0005YO-35; Thu, 12 Jan 2023 23:17:46 +0100
MIME-Version: 1.0
Date:   Thu, 12 Jan 2023 22:16:29 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
X-Mailer: RainLoop/1.16.0
From:   "=?utf-8?B?UGV0ZXIgS8Okc3RsZQ==?=" <peter@piie.net>
Message-ID: <d56b68898db555c9226d2862d7e75242@piie.net>
Subject: Re: [PATCH 1/3] platform/x86: acerhdf: Drop empty platform remove
 function
To:     "=?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?=" 
        <u.kleine-koenig@pengutronix.de>,
        "Hans de Goede" <hdegoede@redhat.com>,
        "Mark Gross" <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, kernel@pengutronix.de
In-Reply-To: <20221213162359.651529-2-u.kleine-koenig@pengutronix.de>
References: <20221213162359.651529-2-u.kleine-koenig@pengutronix.de>
 <20221213162359.651529-1-u.kleine-koenig@pengutronix.de>
X-Df-Sender: cGV0ZXJAcGlpZS5uZXQ=
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Uwe,

thanks for the reminder and sorry for not answering in first place. Somehow this mail slipped through.

13. Dezember 2022 17:24, "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de> schrieb:

> A remove callback just returning 0 is equivalent to no remove callback
> at all. So drop the useless function.

Makes sense to me, could you please point me to the code, which is actually calling the remove function. I'd like to understand how it's handling drivers without registered remove callback.

Thanks.

> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> drivers/platform/x86/acerhdf.c | 6 ------
> 1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf.c
> index d2c0fc38c201..ed49393d22ed 100644
> --- a/drivers/platform/x86/acerhdf.c
> +++ b/drivers/platform/x86/acerhdf.c
> @@ -565,11 +565,6 @@ static int acerhdf_probe(struct platform_device *device)
> return 0;
> }
> 
> -static int acerhdf_remove(struct platform_device *device)
> -{
> - return 0;
> -}
> -
> static const struct dev_pm_ops acerhdf_pm_ops = {
> .suspend = acerhdf_suspend,
> .freeze = acerhdf_suspend,
> @@ -581,7 +576,6 @@ static struct platform_driver acerhdf_driver = {
> .pm = &acerhdf_pm_ops,
> },
> .probe = acerhdf_probe,
> - .remove = acerhdf_remove,
> };
> 
> /* check hardware */
> -- 
> 2.38.1

-- 
--peter;
