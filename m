Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8AE6C48BCF
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Jun 2021 15:31:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95E1861351
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Jun 2021 15:31:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232656AbhFIPc4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Jun 2021 11:32:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:56868 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233384AbhFIPc4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Jun 2021 11:32:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D544611CC;
        Wed,  9 Jun 2021 15:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623252661;
        bh=Tn5sGsqJ9rhswyilbUHFSzf4YqsMLWKhhv+b84cz6B4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=iQWMl6g0pvGxeam+u4tjfidPwRpFE06ns+7gCsgspVe9Ov1UFQo2jL2gfLzHFiR7t
         ebjg7Da+h86+vf9eEWJwZaPJ8EORML3pUB32952EA/ils9ybA8qJAhC9ybG7ABr0M3
         8sW17PYmsIbS64IVdiGeY1fbGTX+rKYX6svsdPXxF+8AyBKJkkZbuAlaQhaB8ksX5w
         VtfO6W4b0NN3fB9Az9FBl5owhTADDz9w/fMslX3DRx7yCfHVD37AtyuaNMt53BQ/50
         XFsV7UQhDDxODxJ4RykNyp7A3IeKm76+S5GpgHyM5xOrjYe3r5Kwqs8Yp35XvFlE1j
         hkBrXZ7H40eeQ==
Subject: Re: [PATCH] platform/x86: dell-wmi-sysman/think-lmi: Make
 fw_attr_class global static
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Mark Pearson <markpearson@lenovo.com>,
        Dell.Client.Kernel@dell.com
References: <20210609145952.113393-1-hdegoede@redhat.com>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <64af7560-689b-373c-607a-85e242a2b57c@kernel.org>
Date:   Wed, 9 Jun 2021 08:31:01 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210609145952.113393-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 6/9/2021 7:59 AM, Hans de Goede wrote:
> The dell-wmi-sysman and think-lmi kernel modules both have a global
> struct class *fw_attr_class variable, leading to the following compile
> errors when both are builtin:
> 
> ld: drivers/platform/x86/think-lmi.o:(.bss+0x0): multiple definition of `fw_attr_class'; drivers/platform/x86/dell/dell-wmi-sysman/sysman.o:(.bss+0x0): first defined here
> 
> In both cases the variable is only used in the file where it is declared.
> Make both declarations static to avoid the linker error.

I figured that would be the solution but I was not sure, hence just the 
report rather than this patch :)

> Cc: Mark Pearson <markpearson@lenovo.com>
> Cc: Dell.Client.Kernel@dell.com
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>   drivers/platform/x86/dell/dell-wmi-sysman/sysman.c | 2 +-
>   drivers/platform/x86/think-lmi.c                   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> index 1378c1878658..636bdfa83284 100644
> --- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> +++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> @@ -25,7 +25,7 @@ struct wmi_sysman_priv wmi_priv = {
>   /* reset bios to defaults */
>   static const char * const reset_types[] = {"builtinsafe", "lastknowngood", "factory", "custom"};
>   static int reset_option = -1;
> -struct class *fw_attr_class;
> +static struct class *fw_attr_class;
>   
>   
>   /**
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index 782d8e3fe7a1..c6413b906e4a 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -134,7 +134,7 @@ static const char * const encoding_options[] = {
>   	[TLMI_ENCODING_SCANCODE] = "scancode",
>   };
>   static struct think_lmi tlmi_priv;
> -struct class *fw_attr_class;
> +static struct class *fw_attr_class;
>   
>   /* ------ Utility functions ------------*/
>   /* Convert BIOS WMI error string to suitable error code */
> 
