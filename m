Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF7E5C433C1
	for <platform-driver-x86@archiver.kernel.org>; Mon, 22 Mar 2021 17:16:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AED6B61972
	for <platform-driver-x86@archiver.kernel.org>; Mon, 22 Mar 2021 17:16:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232097AbhCVRPv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 22 Mar 2021 13:15:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232135AbhCVRP1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 22 Mar 2021 13:15:27 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB240C061574;
        Mon, 22 Mar 2021 10:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=ALxpnIbdgwKGvYkCqePRJ4vCsE0PnfX/ZLHTWQ+BL/s=; b=lEd7EDNdly8b1md0i3XZkQA1SI
        W5o0Sj2W7RS3edUrPdN9tVQzgarXA9xHkWUsolYlh5DkBff4py6222RkWQRhz4EHKhGCDM4Q5+pAI
        CQeLedNNQI/zTGEKNYXtFDHrrC0rXgSYmfnty0HCDQDh4nzWPj/Gg+1xUlky/nUdw4F6hCjlmmCPN
        GC2fcs4Sst6o1r6vB63gnWcMFjKeOYosWF9y5PzGrCNAhAUKH6aYduS9RJO9GbZf50VtD210Czewf
        t/jtILBYdQt2a8haNPMMpDmNSBtA23FRHA0nPE4k4c0K/oFwjSbU6NIZY62cqPi6nXQ0zbhxXEoUz
        V3hq/k6A==;
Received: from [2601:1c0:6280:3f0::3ba4]
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lOO91-008pWu-Cr; Mon, 22 Mar 2021 17:15:15 +0000
Subject: Re: [PATCH v5 1/2] platform/x86: dell-privacy: Add support for Dell
 hardware privacy
To:     Perry Yuan <Perry.Yuan@dell.com>, pobrn@protonmail.com,
        pierre-louis.bossart@linux.intel.com, oder_chiou@realtek.com,
        perex@perex.cz, tiwai@suse.com, hdegoede@redhat.com,
        mgross@linux.intel.com, Mario.Limonciello@dell.com
Cc:     lgirdwood@gmail.com, broonie@kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20210322093841.11840-1-Perry_Yuan@Dell.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <a1bdec21-efd9-ebf5-1b45-c0a364e0914c@infradead.org>
Date:   Mon, 22 Mar 2021 10:15:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210322093841.11840-1-Perry_Yuan@Dell.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 3/22/21 2:38 AM, Perry Yuan wrote:
> From: Perry Yuan <perry_yuan@dell.com>
> 

> diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
> index e0a55337f51a..0e0f1eb35bd6 100644
> --- a/drivers/platform/x86/dell/Kconfig
> +++ b/drivers/platform/x86/dell/Kconfig
> @@ -204,4 +204,20 @@ config DELL_WMI_SYSMAN
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called dell-wmi-sysman.
>  
> +config DELL_PRIVACY
> +	tristate "Dell Hardware Privacy Support"
> +	depends on ACPI
> +	depends on ACPI_WMI
> +	depends on INPUT
> +	depends on DELL_LAPTOP
> +	depends on LEDS_TRIGGER_AUDIO
> +	select DELL_WMI
> +	help
> +	  This driver provides support for the "Dell Hardware Privacy" feature
> +	  of Dell laptops.
> +	  Support for a micmute and camera mute privacy will be provided as

better:
	                                                are provided as

> +	  hardware button Ctrl+F4 and Ctrl+F9 hotkey.

Does that say that Ctrl+F4 is a hardware button
and that Ctrl+F9 is a hotkey?
If so, what's the difference? and why?  Are they different
hardware implementations?  Does the user care?

> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called dell_privacy.
>  endif # X86_PLATFORM_DRIVERS_DELL
thanks.
-- 
~Randy

