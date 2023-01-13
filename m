Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED28BC54EBE
	for <platform-driver-x86@archiver.kernel.org>; Fri, 13 Jan 2023 10:49:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234274AbjAMKtT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 13 Jan 2023 05:49:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241238AbjAMKql (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 13 Jan 2023 05:46:41 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEE013C0DC
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jan 2023 02:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673606616;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ak0h261f4T7rcGRiJ4shKTIundthOFJ3pMIxjN5AF3E=;
        b=BddPNX/K8LelIx4FJiaTv7wHJui0PfTV1ZU67Pqpeb+xyJMoVQPKpMW1CI/Ehh+H3851Su
        zf3aUzfLlHi5Bv5f4LS6vsRgXyor6xvEVQIdrsTFVsDHjg6H9dmwS5MvFzIhZ91PjewuMP
        KH3dr023yS12+mVONOwv/mT7+EQw94s=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-22-5BtdsuGROMGes9V_o1dZKA-1; Fri, 13 Jan 2023 05:43:33 -0500
X-MC-Unique: 5BtdsuGROMGes9V_o1dZKA-1
Received: by mail-ed1-f71.google.com with SMTP id r14-20020a05640251ce00b0047d67ab2019so14279896edd.12
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jan 2023 02:43:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ak0h261f4T7rcGRiJ4shKTIundthOFJ3pMIxjN5AF3E=;
        b=zninvFvjlFMZGK1VfHXgx59xtODOa4scqrzGDRxC2K0GcBxi7ZKfaR0201gl9+gMxk
         9duY10UOXDGdNAcC33vHeOR2S/ifYCEr4aOqMyB8iHpBFTHbEuTubV7CLf1GL2rbFO0K
         REqZDCltG/OYBgBtHKcNSo+JTCm+Ea5rWaar4Bq6/0XakuD1C6ZM8PbC9Fwqg/CnzGeo
         AlE9r60XKmonjeDfqIpVGNpQK/z660qgRCeTr+SF8Vk/+afG5n73KNJJTXs2JehyL56/
         IvwyM4TJtl67isKENKp/cXe/3ezAxRWuhENYPRj42KwHeOPOb+MEn4xNb80v65960KEn
         xVVQ==
X-Gm-Message-State: AFqh2kr7RWrQ3BNCHkIBqnHm4vzqVaD4Uz/lZije2M+7vFOXWl2gANS+
        KzBXkU4amDFnfsBmmRW6zCdC8rTyMynjHfsvL972pxHb7WgFZUAnELoFKUTlDpIg4fZcfAoshyX
        u+qUnh3CMT1q/M2TxpXquqePiyYZ4sDBNeA==
X-Received: by 2002:a17:907:a80d:b0:86a:4bb7:4cf8 with SMTP id vo13-20020a170907a80d00b0086a4bb74cf8mr2119173ejc.76.1673606605484;
        Fri, 13 Jan 2023 02:43:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuNMJVuLnBb+3hy5a+/tLotpQndOJjqkNtsuHoUOwdBEM+m4jE/h57QVjjntxr+AVnv58nI8w==
X-Received: by 2002:a17:907:a80d:b0:86a:4bb7:4cf8 with SMTP id vo13-20020a170907a80d00b0086a4bb74cf8mr2119163ejc.76.1673606605245;
        Fri, 13 Jan 2023 02:43:25 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ti5-20020a170907c20500b007c0cd272a06sm8361841ejc.225.2023.01.13.02.43.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 02:43:24 -0800 (PST)
Message-ID: <64651a75-6ce2-d4bc-def4-73105d548454@redhat.com>
Date:   Fri, 13 Jan 2023 11:43:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] platform/x86: thinkpad_acpi: Fix profile mode display
 in AMT mode
To:     Mark Pearson <mpearson-lenovo@squebb.ca>
Cc:     mario.limonciello@amd.com, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org
References: <mpearson-lenovo@squebb.ca>
 <20230112221228.490946-1-mpearson-lenovo@squebb.ca>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230112221228.490946-1-mpearson-lenovo@squebb.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/12/23 23:12, Mark Pearson wrote:
> Recently AMT mode was enabled (somewhat unexpectedly) on the Lenovo
> Z13 platform. The FW is advertising it is available and the driver tries
> to use it - unfortunately it reports the profile mode incorrectly.
> 
> Note, there is also some extra work needed to enable the dynamic aspect
> of AMT support that I will be following up with; but more testing is
> needed first. This patch just fixes things so the profiles are reported
> correctly.
> 
> Link: https://gitlab.freedesktop.org/hadess/power-profiles-daemon/-/issues/115
> Fixes: 46dcbc61b739 ("platform/x86: thinkpad-acpi: Add support for automatic mode transitions")
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Thank you for your patch, I've applied this patch to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in my fixes branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans



> ---
> v2: Corrected title and added link and fixes details
> 
>  drivers/platform/x86/thinkpad_acpi.c | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 1195293b22fd..a95946800ae9 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -10311,9 +10311,11 @@ static DEFINE_MUTEX(dytc_mutex);
>  static int dytc_capabilities;
>  static bool dytc_mmc_get_available;
>  
> -static int convert_dytc_to_profile(int dytcmode, enum platform_profile_option *profile)
> +static int convert_dytc_to_profile(int funcmode, int dytcmode,
> +		enum platform_profile_option *profile)
>  {
> -	if (dytc_capabilities & BIT(DYTC_FC_MMC)) {
> +	switch (funcmode) {
> +	case DYTC_FUNCTION_MMC:
>  		switch (dytcmode) {
>  		case DYTC_MODE_MMC_LOWPOWER:
>  			*profile = PLATFORM_PROFILE_LOW_POWER;
> @@ -10329,8 +10331,7 @@ static int convert_dytc_to_profile(int dytcmode, enum platform_profile_option *p
>  			return -EINVAL;
>  		}
>  		return 0;
> -	}
> -	if (dytc_capabilities & BIT(DYTC_FC_PSC)) {
> +	case DYTC_FUNCTION_PSC:
>  		switch (dytcmode) {
>  		case DYTC_MODE_PSC_LOWPOWER:
>  			*profile = PLATFORM_PROFILE_LOW_POWER;
> @@ -10344,6 +10345,14 @@ static int convert_dytc_to_profile(int dytcmode, enum platform_profile_option *p
>  		default: /* Unknown mode */
>  			return -EINVAL;
>  		}
> +		return 0;
> +	case DYTC_FUNCTION_AMT:
> +		/* For now return balanced. It's the closest we have to 'auto' */
> +		*profile =  PLATFORM_PROFILE_BALANCED;
> +		return 0;
> +	default:
> +		/* Unknown function */
> +		return -EOPNOTSUPP;
>  	}
>  	return 0;
>  }
> @@ -10492,6 +10501,7 @@ static int dytc_profile_set(struct platform_profile_handler *pprof,
>  		err = dytc_command(DYTC_SET_COMMAND(DYTC_FUNCTION_PSC, perfmode, 1), &output);
>  		if (err)
>  			goto unlock;
> +
>  		/* system supports AMT, activate it when on balanced */
>  		if (dytc_capabilities & BIT(DYTC_FC_AMT))
>  			dytc_control_amt(profile == PLATFORM_PROFILE_BALANCED);
> @@ -10507,7 +10517,7 @@ static void dytc_profile_refresh(void)
>  {
>  	enum platform_profile_option profile;
>  	int output, err = 0;
> -	int perfmode;
> +	int perfmode, funcmode;
>  
>  	mutex_lock(&dytc_mutex);
>  	if (dytc_capabilities & BIT(DYTC_FC_MMC)) {
> @@ -10522,8 +10532,9 @@ static void dytc_profile_refresh(void)
>  	if (err)
>  		return;
>  
> +	funcmode = (output >> DYTC_GET_FUNCTION_BIT) & 0xF;
>  	perfmode = (output >> DYTC_GET_MODE_BIT) & 0xF;
> -	convert_dytc_to_profile(perfmode, &profile);
> +	convert_dytc_to_profile(funcmode, perfmode, &profile);
>  	if (profile != dytc_current_profile) {
>  		dytc_current_profile = profile;
>  		platform_profile_notify();

