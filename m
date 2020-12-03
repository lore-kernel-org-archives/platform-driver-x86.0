Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA643C433FE
	for <platform-driver-x86@archiver.kernel.org>; Thu,  3 Dec 2020 21:18:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76B3122262
	for <platform-driver-x86@archiver.kernel.org>; Thu,  3 Dec 2020 21:18:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726071AbgLCVSk convert rfc822-to-8bit (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 3 Dec 2020 16:18:40 -0500
Received: from piie.net ([80.82.223.85]:57192 "EHLO piie.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725885AbgLCVSk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 3 Dec 2020 16:18:40 -0500
Received: from mail.piie.net (_gateway [172.17.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
        (Client did not present a certificate)
        by piie.net (Postfix) with ESMTPSA id 967AB2A18F0;
        Thu,  3 Dec 2020 22:17:58 +0100 (CET)
MIME-Version: 1.0
Date:   Thu, 03 Dec 2020 21:17:58 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
X-Mailer: RainLoop/1.14.0
From:   "=?utf-8?B?UGV0ZXIgS8Okc3RsZQ==?=" <peter@piie.net>
Message-ID: <973e8be431d60986e8257320d9acf997@piie.net>
Subject: Re: [PATCH v2 1/2] platform/x86/drivers/acerhdf: Use
 module_param_cb to set/get polling interval
To:     "Daniel Lezcano" <daniel.lezcano@linaro.org>, hdegoede@redhat.com,
        mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20201203071738.2363701-1-daniel.lezcano@linaro.org>
References: <20201203071738.2363701-1-daniel.lezcano@linaro.org>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

3. Dezember 2020 08:17, "Daniel Lezcano" <daniel.lezcano@linaro.org> schrieb:

> The module parameter can be set by using ops to get and set the
> values. The change will allow to check the correctness of the interval
> value everytime it is changed instead of checking in the get_temp
> function.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Acked-by: Peter Kaestle <peter@piie.net>

> ---
> drivers/platform/x86/acerhdf.c | 10 ++++++++--
> 1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf.c
> index 44b6bfbd32df..19fc8ff2225c 100644
> --- a/drivers/platform/x86/acerhdf.c
> +++ b/drivers/platform/x86/acerhdf.c
> @@ -84,8 +84,6 @@ static struct platform_device *acerhdf_dev;
> 
> module_param(kernelmode, uint, 0);
> MODULE_PARM_DESC(kernelmode, "Kernel mode fan control on / off");
> -module_param(interval, uint, 0600);
> -MODULE_PARM_DESC(interval, "Polling interval of temperature check");
> module_param(fanon, uint, 0600);
> MODULE_PARM_DESC(fanon, "Turn the fan on above this temperature");
> module_param(fanoff, uint, 0600);
> @@ -824,3 +822,11 @@ MODULE_ALIAS("dmi:*:*Acer*:pnExtensa*5420*:");
> 
> module_init(acerhdf_init);
> module_exit(acerhdf_exit);
> +
> +static const struct kernel_param_ops interval_ops = {
> + .set = param_set_uint,
> + .get = param_get_uint,
> +};
> +
> +module_param_cb(interval, &interval_ops, &interval, 0600);
> +MODULE_PARM_DESC(interval, "Polling interval of temperature check");
> -- 
> 2.25.1
