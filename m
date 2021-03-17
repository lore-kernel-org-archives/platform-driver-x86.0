Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5429DC433E6
	for <platform-driver-x86@archiver.kernel.org>; Wed, 17 Mar 2021 17:48:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E5E064F0C
	for <platform-driver-x86@archiver.kernel.org>; Wed, 17 Mar 2021 17:48:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232227AbhCQRrl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 17 Mar 2021 13:47:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40796 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232678AbhCQRrO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 17 Mar 2021 13:47:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616003234;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=C9dOkUTln4r0Gj3+3gqTTjBhzkRmDBouD59jvisuBCU=;
        b=dr7P2cNQI+82RPNswJTM9AtiMuT9s1SC+8tppnlAP0aworOumrKndTJ4GBOftaWJ9esFQ/
        tGENMhld9c4A3FwqUCRlRNLu78QA1Qsqj+OfJHaVLtfrwiXtP29fg6/Td4BE1z/F+KmLFu
        E5EvwFzeXwC5JXvzl54yTECymvkhvPo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-yMHhoxzePcOdNcLM_k0sow-1; Wed, 17 Mar 2021 13:47:12 -0400
X-MC-Unique: yMHhoxzePcOdNcLM_k0sow-1
Received: by mail-ej1-f69.google.com with SMTP id e13so15471904ejd.21
        for <platform-driver-x86@vger.kernel.org>; Wed, 17 Mar 2021 10:47:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=C9dOkUTln4r0Gj3+3gqTTjBhzkRmDBouD59jvisuBCU=;
        b=le3CXvteH6qYC2IxV/OrVxIOc/6dLBGi7ifQHNDZs3XBVAhr8W1RPFgJmL9K8EaOc+
         wPpUz1PPXAbIferKEHfLDSLPvi/0TKX2vh7XWqwNpZUUX9RPGUyiemEZDwr6bFarbz+c
         mH/hXChd8xxD5qgND72g2fBv1Y6KoLqN4wSlJSX6IIyCIeRRHV6BRwUSfyUEdLSQdaLh
         97ratxTatLXKvaYATFRtHPtFZHB/mhillZTrnEQCJWsi81/rtsVxY+SFRmnV3zyh2q0G
         EoomqNR0R33slL8m2S5kTAXJqphboaTZ0uez5C7C2yv11yy57PIW68CoraiNHRQeavK5
         mGGQ==
X-Gm-Message-State: AOAM531HeE6ISmkv5rRqRAXuweaVBsWPpAWGVNxmvUBRqLOwK0PFzjfV
        6mTxvYfoMZU1/F0G/4TCI9blhU1CXo0nJSONFwAVxjCFmbaW05LfL+tOL/ueiIFDBryb4nBAmN3
        ZNwG9NgDs2vf6ZW+HeW2tQNRFixMhuRAQ5A==
X-Received: by 2002:aa7:c7da:: with SMTP id o26mr26587688eds.244.1616003231128;
        Wed, 17 Mar 2021 10:47:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpCj5Mfn1CSF/zpDxQRKMf2ghZMltaucO+43fOdTzLm5Os82pWnRnmI5Av9l8qR0xNvisUcA==
X-Received: by 2002:aa7:c7da:: with SMTP id o26mr26587676eds.244.1616003231006;
        Wed, 17 Mar 2021 10:47:11 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id c15sm6290011ejm.52.2021.03.17.10.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Mar 2021 10:47:10 -0700 (PDT)
Subject: Re: [PATCH] platform/surface: aggregator_registry: Add support for
 Surface Pro 7+
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210309162550.302161-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <dff36756-9de4-750e-b7af-f65c97acc42c@redhat.com>
Date:   Wed, 17 Mar 2021 18:47:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210309162550.302161-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/9/21 5:25 PM, Maximilian Luz wrote:
> The Surface Pro 7+ is essentially a refresh of the Surface Pro 7 with
> updated hardware and a new WSID identifier.
> 
> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> ---
>  drivers/platform/surface/surface_aggregator_registry.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
> index cdb4a95af3e8..c42b97f61a57 100644
> --- a/drivers/platform/surface/surface_aggregator_registry.c
> +++ b/drivers/platform/surface/surface_aggregator_registry.c
> @@ -191,7 +191,7 @@ static const struct software_node *ssam_node_group_sp6[] = {
>  	NULL,
>  };
>  
> -/* Devices for Surface Pro 7. */
> +/* Devices for Surface Pro 7 and Surface Pro 7+. */
>  static const struct software_node *ssam_node_group_sp7[] = {
>  	&ssam_node_root,
>  	&ssam_node_bat_ac,
> @@ -521,6 +521,9 @@ static const struct acpi_device_id ssam_platform_hub_match[] = {
>  	/* Surface Pro 7 */
>  	{ "MSHW0116", (unsigned long)ssam_node_group_sp7 },
>  
> +	/* Surface Pro 7+ */
> +	{ "MSHW0119", (unsigned long)ssam_node_group_sp7 },
> +
>  	/* Surface Book 2 */
>  	{ "MSHW0107", (unsigned long)ssam_node_group_sb2 },
>  
> 

