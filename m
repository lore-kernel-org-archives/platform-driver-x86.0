Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 143F8C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue,  8 Mar 2022 21:36:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241473AbiCHVg6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 8 Mar 2022 16:36:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232088AbiCHVg4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 8 Mar 2022 16:36:56 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7EC854FA6
        for <platform-driver-x86@vger.kernel.org>; Tue,  8 Mar 2022 13:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=ZK2wx0jndJ6aUb4odh4PBQssSBT8ZmCXlS8UExtgL7Y=; b=QZHeIWyACHxDeB1tq9mSKxuKOk
        t2fZ6eRjbCwXWRjfDgOeohN9y/O4PCpzYS2wFvAvjRLzNqej+FCdJEkEtnSElZSC8cpwKuYoO/aT8
        wPysdo/KRQ1iXeSfgi6F0Kmqj0FnQC+kUH4L6ku7EMj1MWRfAysOQhFAZyAYjLv9A8tNFpHaRpw5A
        4GLIWeyNViSyFSJdJKWpHeUfiYqh/u7I5emHB3ioMCTLLRF/7zIqIb/TbTyj7anZAPF9ZszpjaTUT
        ENO3hwgKPpvEJd/nlTehDKCzn8sIB7YJ1wXa4I77yL/eze/h2aFNDKFa7M80SzXNPSBkY1IDluFvt
        Jx7NSgfQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nRhUp-00GYZh-Gr; Tue, 08 Mar 2022 21:35:56 +0000
Message-ID: <6b2b0e8e-a2c5-c1cd-f34c-51eb62370b11@infradead.org>
Date:   Tue, 8 Mar 2022 13:35:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] platform/x86: x86-android-tablets: Depend on EFI and SPI
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20220308152942.262130-1-hdegoede@redhat.com>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220308152942.262130-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 3/8/22 07:29, Hans de Goede wrote:
> The recently added support for Lenovo Yoga Tablet 2 tablets uses
> symbols from EFI and SPI add "depends on EFI && SPI" to the
> X86_ANDROID_TABLETS Kconfig entry.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

thanks.

> ---
>  drivers/platform/x86/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 0d51011d5d90..5d9dd70e4e0f 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1041,7 +1041,7 @@ config TOUCHSCREEN_DMI
>  
>  config X86_ANDROID_TABLETS
>  	tristate "X86 Android tablet support"
> -	depends on I2C && SERIAL_DEV_BUS && ACPI && GPIOLIB
> +	depends on I2C && SPI && SERIAL_DEV_BUS && ACPI && EFI && GPIOLIB
>  	help
>  	  X86 tablets which ship with Android as (part of) the factory image
>  	  typically have various problems with their DSDTs. The factory kernels

-- 
~Randy
