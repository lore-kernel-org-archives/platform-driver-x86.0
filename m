Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 839F2C4167B
	for <platform-driver-x86@archiver.kernel.org>; Mon, 12 Dec 2022 09:37:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbiLLJhM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 12 Dec 2022 04:37:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231392AbiLLJhJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Dec 2022 04:37:09 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 865DA1126
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Dec 2022 01:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670837774;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2KUELeKmljunJTroYRAME1A+aHuRMujTAsqDtNdtlfc=;
        b=Br+rf2ap6V2DI3e5em1e4P2KWOAWTr7zl8WZCSw+Vn07FVbJOD2DUSM8E2oBzN1F4GwKBw
        qxFaU6Bn4qPhmL0BBSm4+a5qi7zsIPotjOVLxnYcJUToStZKFH2prwIXE1miyaUg/kZglm
        0Ch7KPaQDzN4sROoRM27p/ZkYqi3OWU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-269-Lxcg-uBRN8S5vDcHwtsGhQ-1; Mon, 12 Dec 2022 04:36:13 -0500
X-MC-Unique: Lxcg-uBRN8S5vDcHwtsGhQ-1
Received: by mail-ed1-f69.google.com with SMTP id f17-20020a056402355100b00466481256f6so4683387edd.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Dec 2022 01:36:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2KUELeKmljunJTroYRAME1A+aHuRMujTAsqDtNdtlfc=;
        b=IJzDf5oo8KEiglBIiMuo//v0rKVhuMZm4YypKtVZBYfMf2/VdCagrjYN1OSY9Bqddt
         xEJ+XiLsR0VLudVEFBMAVsc3rtzv7XQLkqlhRS9+pw4Y8GgiAF2MVl5vY71etvUd280W
         Ii4ecDVmTzPSL8X//4Wn/lfkWDAkYMafgIxdnRAjc+44ACHJHknYjLELBU5l9PwI4Snz
         +ZQ47HTq787ke6F0qP/+undIeAC0ERHxXq+M9on1iBPSxo74O/kIypK5/9IpXOUf7XSQ
         PdW4rFK9hkvqxvJHqsFoqLiL/uZtNzR9WZK+E8oJQTrFfnDPTTiZa/fR2JKAxrbI5LCY
         lWrg==
X-Gm-Message-State: ANoB5plSNdgm7FFGbdJnbNJjz0Cky+ONTvEDePIHTjBoHTC2APu/KAF5
        sXvGjC+0bj5Vef4r1RQtejITquOBK6bcJwlV+cm+aOcJshlmyfd7W/uQphrGFFLo8ZWJZ/oogld
        +hcsX3S0xRRt7W9cKNx4j63CRabv/d21/vA==
X-Received: by 2002:a17:907:c688:b0:7bb:af66:f38c with SMTP id ue8-20020a170907c68800b007bbaf66f38cmr12962846ejc.10.1670837772144;
        Mon, 12 Dec 2022 01:36:12 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7b4L3oDcExS8fiXn0n2mTN1JhoLWlmkKf3o6uQoEQ/bXXapsRRgWHDInEsCAnxbywPyBG+Fg==
X-Received: by 2002:a17:907:c688:b0:7bb:af66:f38c with SMTP id ue8-20020a170907c68800b007bbaf66f38cmr12962837ejc.10.1670837771965;
        Mon, 12 Dec 2022 01:36:11 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id i17-20020a1709064ed100b007c0dcade045sm3073485ejv.43.2022.12.12.01.36.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 01:36:11 -0800 (PST)
Message-ID: <95864fee-ade9-d3a8-8dba-01afc4e4d87c@redhat.com>
Date:   Mon, 12 Dec 2022 10:36:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1 1/1] platform/mellanox: mlxbf-pmc: Fix event typo
Content-Language: en-US
To:     James Hurley <jahurley@nvidia.com>, jdelvare@suse.com,
        linux@roeck-us.net, linux-kernel@vger.kernel.org,
        markgross@kernel.org, vadimp@nvidia.com,
        platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org
Cc:     David Thompson <davthompson@nvidia.com>,
        Shravan Kumar Ramani <shravankr@nvidia.com>
References: <aadacdbbd3186c55e74ea9456fe011b77938eb6c.1670535330.git.jahurley@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <aadacdbbd3186c55e74ea9456fe011b77938eb6c.1670535330.git.jahurley@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/9/22 15:35, James Hurley wrote:
> Had a duplicate event typo, so just fixed the 1 character typo.
> 
> Fixes: 1a218d312e65 ("platform/mellanox: mlxbf-pmc: Add Mellanox BlueField PMC driver")
> Signed-off-by: James Hurley <jahurley@nvidia.com>
> Reviewed-by: David Thompson <davthompson@nvidia.com>
> Reviewed-by: Shravan Kumar Ramani <shravankr@nvidia.com>

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
>  drivers/platform/mellanox/mlxbf-pmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/mellanox/mlxbf-pmc.c b/drivers/platform/mellanox/mlxbf-pmc.c
> index 65b4a819f1bd..c2c9b0d3244c 100644
> --- a/drivers/platform/mellanox/mlxbf-pmc.c
> +++ b/drivers/platform/mellanox/mlxbf-pmc.c
> @@ -358,7 +358,7 @@ static const struct mlxbf_pmc_events mlxbf_pmc_hnfnet_events[] = {
>  	{ 0x32, "DDN_DIAG_W_INGRESS" },
>  	{ 0x33, "DDN_DIAG_C_INGRESS" },
>  	{ 0x34, "DDN_DIAG_CORE_SENT" },
> -	{ 0x35, "NDN_DIAG_S_OUT_OF_CRED" },
> +	{ 0x35, "NDN_DIAG_N_OUT_OF_CRED" },
>  	{ 0x36, "NDN_DIAG_S_OUT_OF_CRED" },
>  	{ 0x37, "NDN_DIAG_E_OUT_OF_CRED" },
>  	{ 0x38, "NDN_DIAG_W_OUT_OF_CRED" },

