Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 207CAC27C76
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Jan 2023 11:50:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234965AbjAYLu2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 25 Jan 2023 06:50:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234913AbjAYLu2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Jan 2023 06:50:28 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C81FA5EE
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Jan 2023 03:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674647384;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pcTEf/slHmnxXRwT1bpALpIrymGDCm67DwtPw757+9g=;
        b=Vrp+aozsk8b8IG5d0vN9cdNCqllqY6OMXpW8dnGpArsAs5EYvD4FZcnILxjiC6njEyTYbz
        +SXX5qyEYOAb3utI5crw8uXGFFoH18ueMLnHLAaTHAYRZ+xRAGWiPxefjj7OH5gKmXHoMl
        NUBkVTTQZyB12z9007i1QbG7dk/u6Xg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-589-jMiTDcDwO1qiEzFOLiFh0w-1; Wed, 25 Jan 2023 06:49:42 -0500
X-MC-Unique: jMiTDcDwO1qiEzFOLiFh0w-1
Received: by mail-ed1-f69.google.com with SMTP id c12-20020a05640227cc00b0049e2c079aabso12621930ede.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Jan 2023 03:49:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pcTEf/slHmnxXRwT1bpALpIrymGDCm67DwtPw757+9g=;
        b=4OZP6eD1mO2p4JYpmt9niNozW0lazADwtzpkSQUtdm6bQ49edlkaFkGMetiMGglBl9
         PA2C9K5a4WNiecK5NSlQ7bKiCssUYz0swtIWUks/0OIrt4c5F2ufp/gn2gtRlf/qzARF
         sgjj228lWt6UAqsmcMnRAn/OLfUFC8nh+FPSTaIJd1qbD5I0ZUaZLs759bdZH1y2qSIy
         KQYXz+C070G7rWww17Cu4StdxH+edMS3wHkVZBBRM7Bkset9BUuVLSKsPik9wXn1KySF
         YSqq2SA/SavrZ1tHaMOV4Ux249yuCd8keopqM06caW9i6NwNnQONMA84zORfRMRBHrX4
         MmbA==
X-Gm-Message-State: AFqh2krYeKb9XLemUpQPx95csPQifkkE5tI6Px33X9GhzI8RGyJOPM27
        uWN/2oTOwoOcGWACn5BZSUkVKpa4a3HQ2NjTexRmkyKsxvpAuCeIO70s9W6AH7DwcvlMVjiXZnQ
        ERRuBV5ArL+NFi3m+oTIVBNnI/6OIEsiDIw==
X-Received: by 2002:a05:6402:3894:b0:49e:45a8:1ac9 with SMTP id fd20-20020a056402389400b0049e45a81ac9mr32239049edb.24.1674647381364;
        Wed, 25 Jan 2023 03:49:41 -0800 (PST)
X-Google-Smtp-Source: AMrXdXst9iD7OxXP8xF07is68/0ZAr2fenB51u9OhV3j+QIOCaQM7dHvAWySjEXvFQ9rLeDy1l7x1w==
X-Received: by 2002:a05:6402:3894:b0:49e:45a8:1ac9 with SMTP id fd20-20020a056402389400b0049e45a81ac9mr32239037edb.24.1674647381192;
        Wed, 25 Jan 2023 03:49:41 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id r25-20020aa7da19000000b004a0afea4c9csm410737eds.18.2023.01.25.03.49.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 03:49:40 -0800 (PST)
Message-ID: <6a4ea30e-679d-2c14-83aa-3dbe9617e1c1@redhat.com>
Date:   Wed, 25 Jan 2023 12:49:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix profile modes on Intel
 platforms
Content-Language: en-US, nl
To:     Mark Pearson <mpearson-lenovo@squebb.ca>
Cc:     markgross@kernel.org, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org, stable@vger.kernel.org
References: <mpearson-lenovo@squebb.ca>
 <20230124153623.145188-1-mpearson-lenovo@squebb.ca>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230124153623.145188-1-mpearson-lenovo@squebb.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/24/23 16:36, Mark Pearson wrote:
> My last commit to fix profile mode displays on AMD platforms caused
> an issue on Intel platforms - sorry!
> 
> In it I was reading the current functional mode (MMC, PSC, AMT) from
> the BIOS but didn't account for the fact that on some of our Intel
> platforms I use a different API which returns just the profile and not
> the functional mode.
> 
> This commit fixes it so that on Intel platforms it knows the functional
> mode is always MMC.
> 
> I also fixed a potential problem that a platform may try to set the mode
> for both MMC and PSC - which was incorrect.
> 
> Tested on X1 Carbon 9 (Intel) and Z13 (AMD).
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=216963
> Fixes: fde5f74ccfc7 ("platform/x86: thinkpad_acpi: Fix profile mode display in AMT mode")
> 
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
>  drivers/platform/x86/thinkpad_acpi.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index a95946800ae9..6668d472df39 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -10496,8 +10496,7 @@ static int dytc_profile_set(struct platform_profile_handler *pprof,
>  			if (err)
>  				goto unlock;
>  		}
> -	}
> -	if (dytc_capabilities & BIT(DYTC_FC_PSC)) {
> +	} else if (dytc_capabilities & BIT(DYTC_FC_PSC)) {
>  		err = dytc_command(DYTC_SET_COMMAND(DYTC_FUNCTION_PSC, perfmode, 1), &output);
>  		if (err)
>  			goto unlock;
> @@ -10525,14 +10524,16 @@ static void dytc_profile_refresh(void)
>  			err = dytc_command(DYTC_CMD_MMC_GET, &output);
>  		else
>  			err = dytc_cql_command(DYTC_CMD_GET, &output);
> -	} else if (dytc_capabilities & BIT(DYTC_FC_PSC))
> +		funcmode = DYTC_FUNCTION_MMC;
> +	} else if (dytc_capabilities & BIT(DYTC_FC_PSC)) {
>  		err = dytc_command(DYTC_CMD_GET, &output);
> -
> +		/*Check if we are PSC mode, or have AMT enabled */
> +		funcmode = (output >> DYTC_GET_FUNCTION_BIT) & 0xF;
> +	}
>  	mutex_unlock(&dytc_mutex);
>  	if (err)
>  		return;
>  
> -	funcmode = (output >> DYTC_GET_FUNCTION_BIT) & 0xF;
>  	perfmode = (output >> DYTC_GET_MODE_BIT) & 0xF;
>  	convert_dytc_to_profile(funcmode, perfmode, &profile);
>  	if (profile != dytc_current_profile) {

