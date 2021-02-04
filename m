Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0290CC433DB
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 16:21:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE63F64E3F
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 16:21:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237866AbhBDQVR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 Feb 2021 11:21:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59437 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237135AbhBDQVO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Feb 2021 11:21:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612455585;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oniC19vIHs0GOyeonXQqZoxxZ4D9xyTI9e3aNUHMkGA=;
        b=R5sqHcpoZXqq6Minry8Gq9oCmyjiKgnP5frMdGuXL2cIxtzfEaL8Z0d7GrHI3vL08TYG6d
        6vMQQiOqL6JNnFzMV7ZWomJ41x20ZLU/jzPr87BsWBq066qTnBD/QsOrgzeBqzqgy7IhR4
        xWrt3PYXwNaEEsf8OWRVAUZsvudk4Kc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-T2ep6_eSMWus4M8sOYfToA-1; Thu, 04 Feb 2021 11:19:43 -0500
X-MC-Unique: T2ep6_eSMWus4M8sOYfToA-1
Received: by mail-ed1-f71.google.com with SMTP id f21so582043edx.10
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Feb 2021 08:19:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oniC19vIHs0GOyeonXQqZoxxZ4D9xyTI9e3aNUHMkGA=;
        b=cfGGaymRY0y1HyUlBzFlzi/A48JYLI8ZGi42K4yFQ90ZWP8Ui9P24Xvu05jnurZIdQ
         ElCXTKBcl2rFP7hnr2i75i09oOreq+54yleJhWm3OrUlOOmVcLO7oto5CnqSqrt0rLDx
         +Ws2PawMcOvAyXStJOETuu22rRSCGuJg3Tgc1B1R2qO2UfdlePsBl+vfSgP2NV1sMIk5
         Jjc48jLUd8/gCSdcs7TFQxwcWNAaNLRrirvd1GsOzILdxjWvimD3jwP+J9OKDjMHeDBk
         kIIcXrYQhzeuV3vlWkxqx1cWZo4iK1ALRvUFQ59ERoSjMfTT5r1aQNyObVv57OWh9smj
         ITIQ==
X-Gm-Message-State: AOAM530mMOK20m/2DxKlcxw0IeNevaF50MEE+VQBgAisu5NN6QCEio77
        ku2il6mTWBqVs2E+xu2DFbusj+IwVHJBCw6eT8QOx5L56Im7j7MX9MPGY8HeUGlXxebH9MKxPkq
        ec3iThBilthxH5rhrcEV4lhiXMgEUKQ+8MA==
X-Received: by 2002:aa7:cd61:: with SMTP id ca1mr3134602edb.76.1612455582594;
        Thu, 04 Feb 2021 08:19:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwAArxXtNfuS5wkH6IxZvH0OCR4b34syfGKiK4rM9d9z+bZoBZJMjdTHD93a8h+1YeN761Ljw==
X-Received: by 2002:aa7:cd61:: with SMTP id ca1mr3134572edb.76.1612455582282;
        Thu, 04 Feb 2021 08:19:42 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id t3sm2709511eds.89.2021.02.04.08.19.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Feb 2021 08:19:41 -0800 (PST)
Subject: Re: [PATCH] platform/x86: ideapad-laptop/thinkpad_acpi: mark
 conflicting symbols static
To:     Arnd Bergmann <arnd@kernel.org>, Ike Panhc <ike.pan@canonical.com>,
        Mark Gross <mgross@linux.intel.com>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Nitin Joshi <njoshi1@lenovo.com>, Tom Rix <trix@redhat.com>,
        Aaron Ma <aaron.ma@canonical.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        ibm-acpi-devel@lists.sourceforge.net
References: <20210204153924.1534813-1-arnd@kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <2c686820-817a-8728-66e0-cbf1b3e64e2d@redhat.com>
Date:   Thu, 4 Feb 2021 17:19:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210204153924.1534813-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Arnd,

On 2/4/21 4:38 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Three of the newly added functions are accidently not marked 'static' which
> causes a warning when building with W=1
> 
> drivers/platform/x86/thinkpad_acpi.c:10081:5: warning: no previous prototype for function 'dytc_profile_get' [-Wmissing-prototypes]
> drivers/platform/x86/thinkpad_acpi.c:10095:5: warning: no previous prototype for function 'dytc_cql_command' [-Wmissing-prototypes]
> drivers/platform/x86/thinkpad_acpi.c:10133:5: warning: no previous prototype for function 'dytc_profile_set' [-Wmissing-prototypes]
> 
> The functions are also present in two files, causing a link error when
> both are built into the kernel:

Thank you for your patch, but the issue has already been fixed in both drivers
in my review-hans branch (which will become for-next soon):

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

(note the ideapad fix is part of the big set of ideapad cleanups)

Regards,

Hans




> 
> ld.lld: error: duplicate symbol: dytc_cql_command
>>>> defined at ideapad-laptop.c
>>>>            platform/x86/ideapad-laptop.o:(dytc_cql_command) in archive drivers/built-in.a
>>>> defined at thinkpad_acpi.c
>>>>            platform/x86/thinkpad_acpi.o:(.text+0x20) in archive drivers/built-in.a
> 
> ld.lld: error: duplicate symbol: dytc_profile_get
>>>> defined at ideapad-laptop.c
>>>>            platform/x86/ideapad-laptop.o:(dytc_profile_get) in archive drivers/built-in.a
>>>> defined at thinkpad_acpi.c
>>>>            platform/x86/thinkpad_acpi.o:(.text+0x0) in archive drivers/built-in.a
> 
> ld.lld: error: duplicate symbol: dytc_profile_set
>>>> defined at ideapad-laptop.c
>>>>            platform/x86/ideapad-laptop.o:(dytc_profile_set) in archive drivers/built-in.a
>>>> defined at thinkpad_acpi.c
>>>>            platform/x86/thinkpad_acpi.o:(.text+0x220) in archive drivers/built-in.a
> 
> Mark these all as static to avoid both problems.
> 
> Fixes: eabe533904cb ("platform/x86: ideapad-laptop: DYTC Platform profile support")
> Fixes: c3bfcd4c6762 ("platform/x86: thinkpad_acpi: Add platform profile support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/platform/x86/ideapad-laptop.c | 11 ++++++-----
>  drivers/platform/x86/thinkpad_acpi.c  | 10 +++++-----
>  2 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index cc42af2a0a98..6095a4d54881 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -656,8 +656,8 @@ static int convert_profile_to_dytc(enum platform_profile_option profile, int *pe
>   * dytc_profile_get: Function to register with platform_profile
>   * handler. Returns current platform profile.
>   */
> -int dytc_profile_get(struct platform_profile_handler *pprof,
> -			enum platform_profile_option *profile)
> +static int dytc_profile_get(struct platform_profile_handler *pprof,
> +			    enum platform_profile_option *profile)
>  {
>  	struct ideapad_dytc_priv *dytc;
>  
> @@ -673,7 +673,8 @@ int dytc_profile_get(struct platform_profile_handler *pprof,
>   *  - enable CQL
>   *  If not in CQL mode, just run the command
>   */
> -int dytc_cql_command(struct ideapad_private *priv, int command, int *output)
> +static int dytc_cql_command(struct ideapad_private *priv, int command,
> +			    int *output)
>  {
>  	int err, cmd_err, dummy;
>  	int cur_funcmode;
> @@ -710,8 +711,8 @@ int dytc_cql_command(struct ideapad_private *priv, int command, int *output)
>   * dytc_profile_set: Function to register with platform_profile
>   * handler. Sets current platform profile.
>   */
> -int dytc_profile_set(struct platform_profile_handler *pprof,
> -			enum platform_profile_option profile)
> +static int dytc_profile_set(struct platform_profile_handler *pprof,
> +			    enum platform_profile_option profile)
>  {
>  	struct ideapad_dytc_priv *dytc;
>  	struct ideapad_private *priv;
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 18b390153e7f..42e0a497d69e 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -10078,8 +10078,8 @@ static int convert_profile_to_dytc(enum platform_profile_option profile, int *pe
>   * dytc_profile_get: Function to register with platform_profile
>   * handler. Returns current platform profile.
>   */
> -int dytc_profile_get(struct platform_profile_handler *pprof,
> -			enum platform_profile_option *profile)
> +static int dytc_profile_get(struct platform_profile_handler *pprof,
> +			    enum platform_profile_option *profile)
>  {
>  	*profile = dytc_current_profile;
>  	return 0;
> @@ -10092,7 +10092,7 @@ int dytc_profile_get(struct platform_profile_handler *pprof,
>   *  - enable CQL
>   *  If not in CQL mode, just run the command
>   */
> -int dytc_cql_command(int command, int *output)
> +static int dytc_cql_command(int command, int *output)
>  {
>  	int err, cmd_err, dummy;
>  	int cur_funcmode;
> @@ -10130,8 +10130,8 @@ int dytc_cql_command(int command, int *output)
>   * dytc_profile_set: Function to register with platform_profile
>   * handler. Sets current platform profile.
>   */
> -int dytc_profile_set(struct platform_profile_handler *pprof,
> -			enum platform_profile_option profile)
> +static int dytc_profile_set(struct platform_profile_handler *pprof,
> +			    enum platform_profile_option profile)
>  {
>  	int output;
>  	int err;
> 

