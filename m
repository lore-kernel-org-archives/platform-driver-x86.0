Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE7DBC433E6
	for <platform-driver-x86@archiver.kernel.org>; Wed, 17 Mar 2021 10:42:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 97E4664F4D
	for <platform-driver-x86@archiver.kernel.org>; Wed, 17 Mar 2021 10:42:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbhCQKmW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 17 Mar 2021 06:42:22 -0400
Received: from trem.minaslivre.org ([195.201.159.152]:37790 "EHLO
        grilo.cascardo.info" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230256AbhCQKmR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 17 Mar 2021 06:42:17 -0400
X-Greylist: delayed 454 seconds by postgrey-1.27 at vger.kernel.org; Wed, 17 Mar 2021 06:42:16 EDT
Received: from siri.cascardo.eti.br (unknown [IPv6:2804:431:e7c5:4bc1:6a17:29ff:fe00:4f38])
        by grilo.cascardo.info (Postfix) with ESMTPSA id A0B33200156;
        Wed, 17 Mar 2021 10:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cascardo.eti.br;
        s=mail; t=1615977273;
        bh=054+NtLT3avzruiBiKwFLs2LAnxdQ1eXdhwm1LKFnbM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SVkzbYlHbJFCTIMaf+HuouUA2ISO2IEqgXWekvQ+KL2WN7AiZ98XrJC/Xk+3DJuDS
         JPAxDWbKtaG6yE+IFPlWLqyef8uwfJsijX/GT+RVYTU9cKUZvF78bCpyCXEI39ZT/7
         cEfdtIX8PMgvt/qsTOVuKoh/rozFT3YqD1gznaFcbcvt/MNExBSlgZOI6liTi1cRN6
         P9QZjdi7nymHG2PQmB+K6SS3aa1cruCw5C1l4x3Uf0ShaAEMQiuGIY4HvwVLPRvNCV
         EKRZbGtwKfbgn7x0r60UwYaqo4UE3rolapulHjJrILQMBh07c0hGlq3jIddxIp3VhO
         z/1PLdIhsY96A==
Date:   Wed, 17 Mar 2021 07:34:18 -0300
From:   Thadeu Lima de Souza Cascardo <cascardo@cascardo.eti.br>
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     don@syst.com.br, hdegoede@redhat.com, mgross@linux.intel.com,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        rdunlap@infradead.org
Subject: Re: [PATCH] platform: x86: Typo fix in the file classmate-laptop.c
Message-ID: <YFHbKkyOrBLW6BCY@siri.cascardo.eti.br>
References: <20210317084343.3788084-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210317084343.3788084-1-unixbhaskar@gmail.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Mar 17, 2021 at 02:13:43PM +0530, Bhaskar Chowdhury wrote:
> 
> s/derefence/dereference/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Thadeu Lima de Souza Cascardo <cascardo@cascardo.eti.br>

> ---
>  drivers/platform/x86/classmate-laptop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/classmate-laptop.c b/drivers/platform/x86/classmate-laptop.c
> index 3e03e8d3a07f..9309ab5792cb 100644
> --- a/drivers/platform/x86/classmate-laptop.c
> +++ b/drivers/platform/x86/classmate-laptop.c
> @@ -956,7 +956,7 @@ static int cmpc_ipml_add(struct acpi_device *acpi)
>  	/*
>  	 * If RFKILL is disabled, rfkill_alloc will return ERR_PTR(-ENODEV).
>  	 * This is OK, however, since all other uses of the device will not
> -	 * derefence it.
> +	 * dereference it.
>  	 */
>  	if (ipml->rf) {
>  		retval = rfkill_register(ipml->rf);
> --
> 2.30.2
> 
