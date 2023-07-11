Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D736BEB64DC
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 Jul 2023 09:44:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231294AbjGKJo7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 11 Jul 2023 05:44:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231201AbjGKJo6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jul 2023 05:44:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6816D97
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jul 2023 02:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689068649;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3vCRTvkn5ZH82riXGsCDdYpG1boSEt6dLfoCx9K6sPw=;
        b=HN81mr75CIvZN2t66lNmRxSu2Ip6zYaIgjrZtpQNMIAqJatmikDEepp0v1nKcXtgnwxJFs
        g4Oe5wQNcmmmpHwGxaPETqb0o84s8f4Y//7UciLK6HnoHOX3SPk8uXqVAaZu+f9fiaPhxO
        NwEsAjfI7ObeELMBQ4Nrix3V8tIAf98=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-5GEf3beMN_We0zgA5goOvA-1; Tue, 11 Jul 2023 05:44:08 -0400
X-MC-Unique: 5GEf3beMN_We0zgA5goOvA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-94a35b0d4ceso317632966b.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jul 2023 02:44:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689068647; x=1691660647;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3vCRTvkn5ZH82riXGsCDdYpG1boSEt6dLfoCx9K6sPw=;
        b=BiwSq0QF6rfLWAaSWSeICFgsR2HgnCvYmMByRoxhaW8nw68fQej8vlPoNGbtNUZtnu
         7G1UiAsSGqvzoAmmvkPBgv7Cp1wtXVYmv9qfOdWHxVty4pNqs8vkQv0TCxkwIhXdln7b
         6uF1qv8R49vV+8J8wVLDvDzJijJwYAeRLsIyWOR80O1NiZjuwpVSfAU0owcaoKFukt1D
         2/MXJLD1Z3qMxYObollfCFzNUBO5FXYaqEZUqkKVFc3bT0OQRW/7Eh3tqWL20AfTuiPv
         oxHpQGCoz9fUz7WVgU+Fb3KQ/m2erE1MBpAE9eGACgV0cmO6NsC1QhelrHLi2QXbPS1X
         PXng==
X-Gm-Message-State: ABy/qLae1lbyM1Ym7OA2OIgnfWGrUBw8OlcEOaYXhIcIW9nJn5MguZUS
        aA+S1r8P+7Z6ctzmPoo4zSfQlBDa8aJP/hP3yNDZqkys/rBeNvS4v4lTCTfGAbOAgPQ6LUAVW2d
        Bd69tBpwLADUXczj2KtwXpBpJ3xfAGMj48Q==
X-Received: by 2002:a17:906:4ad2:b0:988:a986:b11c with SMTP id u18-20020a1709064ad200b00988a986b11cmr13936699ejt.29.1689068647556;
        Tue, 11 Jul 2023 02:44:07 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHetqx7htc1mmoAuyViXDXDIXvhQ3Mn8NXqdjkDdtzjYr7mDuO0xLjRYit8bbVWHcG1AyfWDA==
X-Received: by 2002:a17:906:4ad2:b0:988:a986:b11c with SMTP id u18-20020a1709064ad200b00988a986b11cmr13936690ejt.29.1689068647369;
        Tue, 11 Jul 2023 02:44:07 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id z26-20020a1709064e1a00b009937dbabbd5sm908730eju.220.2023.07.11.02.44.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 02:44:06 -0700 (PDT)
Message-ID: <d9c9d8d0-3b1f-8f8e-5fbf-84448c3a20e5@redhat.com>
Date:   Tue, 11 Jul 2023 11:44:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] platform/x86: int3472/discrete: set variable
 skl_int3472_regulator_second_sensor storage-class-specifier to static
Content-Language: en-US, nl
To:     Tom Rix <trix@redhat.com>, djrscally@gmail.com,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230702134419.3438361-1-trix@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230702134419.3438361-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/2/23 15:44, Tom Rix wrote:
> smatch reports
> drivers/platform/x86/intel/int3472/clk_and_regulator.c:263:28: warning: symbol
>   'skl_int3472_regulator_second_sensor' was not declared. Should it be static?
> 
> This variable is only used in its defining file, so it should be static.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/platform/x86/intel/int3472/clk_and_regulator.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> index 61aeca804ba2..ef4b3141efcd 100644
> --- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> +++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> @@ -260,7 +260,7 @@ static_assert(ARRAY_SIZE(skl_int3472_regulator_map_supplies) ==
>   * This DMI table contains the name of the second sensor. This is used to add
>   * entries for the second sensor to the supply_map.
>   */
> -const struct dmi_system_id skl_int3472_regulator_second_sensor[] = {
> +static const struct dmi_system_id skl_int3472_regulator_second_sensor[] = {
>  	{
>  		/* Lenovo Miix 510-12IKB */
>  		.matches = {


Thank you for your patch, I've applied this patch to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in my fixes branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans




