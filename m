Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A747C4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Nov 2022 11:37:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbiKOLhI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Nov 2022 06:37:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbiKOLhH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Nov 2022 06:37:07 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AE2C64CB
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Nov 2022 03:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668512172;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+ZmbZNmaapkA++vaSMrdMGun6kawCSKpNCFCFhM1cUM=;
        b=TSLBV0QLthdN23ETp3F3TnabYYcQs4PySgZ03fJoTnx3/YxcLd/MuJdMC1G0zZ4shLClCz
        /mw5DBjCaBjOyQ7okHlESTUph4J7WEUFTO+N9x+6StotM7I4hv5UD9ddCVMutqR8fu7yut
        CBV3J+M1mm2H1K6EmpzBtB0wXzQOYUg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-433-IPq9yZyrPHuMNHJ6GhDGFw-1; Tue, 15 Nov 2022 06:36:10 -0500
X-MC-Unique: IPq9yZyrPHuMNHJ6GhDGFw-1
Received: by mail-ed1-f69.google.com with SMTP id l18-20020a056402255200b004633509768bso9774112edb.12
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Nov 2022 03:36:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ZmbZNmaapkA++vaSMrdMGun6kawCSKpNCFCFhM1cUM=;
        b=YfqzajcDtXPk48JMeMaERwJlQfUQ46hJ70/6ew40YHxbd5i4KlWUsgNr0XmQ7WfSd7
         Km1n8sVeMvJGUQ4RW04Vfn5vGHt7kxNmVJqDbErfWbCyhRI2prpfhXHm9LpyiRGVwWn+
         FnCK5Jwn/joom7oq93OVAHAIqv6dcFosJcvIKH9XldIJ1Ah1DpKf6L/ImCsj2/YRED23
         vjDWpNIOdySQQ6bJpG2T0ULEfUs46k3zVsT5WR9Dla8D8xCelWQY9D3VXqloJRcY7B1r
         UU4V1Kkp4iFlkimGKXdulBaOUvg8E85LhoZI0K8feiPmDcjJUYz1AwCBFvZga5xUQZg1
         UYMw==
X-Gm-Message-State: ANoB5pkTb8JzukUPzYpjXCl8sPffokLMGtijVFMAtoAmxHJRO3T9wBfs
        EA2JUCAan2eiv+5EpOCl6pQxc6DCq0TXenhvfBa4RNcdNoiTqKcSxQAMQCB2vvNIWXrtuIk+PvK
        LgJByESfzfIJlAplJD0smUP01m4P2eOVaKA==
X-Received: by 2002:a17:906:64a:b0:7ad:f0af:5b5b with SMTP id t10-20020a170906064a00b007adf0af5b5bmr13183051ejb.609.1668512169346;
        Tue, 15 Nov 2022 03:36:09 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6+xo7jlJt1FsmiFRSwyl7mWrlk9Enq7vC2wQ6kUXThw404rJ4Jk0lwxwtpzoNBilWFhvGVBg==
X-Received: by 2002:a17:906:64a:b0:7ad:f0af:5b5b with SMTP id t10-20020a170906064a00b007adf0af5b5bmr13183031ejb.609.1668512169103;
        Tue, 15 Nov 2022 03:36:09 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id x16-20020a170906135000b0078d793e7927sm5409288ejb.4.2022.11.15.03.36.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 03:36:08 -0800 (PST)
Message-ID: <0039ee53-d1a9-ba2f-2f4e-66d4fb820917@redhat.com>
Date:   Tue, 15 Nov 2022 12:36:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] platform/x86/amd: pmc: Remove more CONFIG_DEBUG_FS checks
Content-Language: en-US, nl
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc:     liyupeng@zbhlos.com, Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221108023323.19304-1-mario.limonciello@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221108023323.19304-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mario,

On 11/8/22 03:33, Mario Limonciello wrote:
> commit b37fe34c8309 ("platform/x86/amd: pmc: remove CONFIG_DEBUG_FS
> checks") removed most CONFIG_DEBUG_FS checks, but there were some
> left that were reported to cause compile test failures.
> 
> Remove the remaining checks, and also the unnecessary CONFIG_SUSPEND
> used in the same place.
> 
> Reported-by: liyupeng@zbhlos.com
> Fixes: b37fe34c8309 ("platform/x86/amd: pmc: remove CONFIG_DEBUG_FS checks")
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

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
>  drivers/platform/x86/amd/pmc.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
> index 96e790e639a2..3b44f2fff5be 100644
> --- a/drivers/platform/x86/amd/pmc.c
> +++ b/drivers/platform/x86/amd/pmc.c
> @@ -276,7 +276,6 @@ static const struct file_operations amd_pmc_stb_debugfs_fops_v2 = {
>  	.release = amd_pmc_stb_debugfs_release_v2,
>  };
>  
> -#if defined(CONFIG_SUSPEND) || defined(CONFIG_DEBUG_FS)
>  static int amd_pmc_setup_smu_logging(struct amd_pmc_dev *dev)
>  {
>  	if (dev->cpu_id == AMD_CPU_ID_PCO) {
> @@ -351,7 +350,6 @@ static int get_metrics_table(struct amd_pmc_dev *pdev, struct smu_metrics *table
>  	memcpy_fromio(table, pdev->smu_virt_addr, sizeof(struct smu_metrics));
>  	return 0;
>  }
> -#endif /* CONFIG_SUSPEND || CONFIG_DEBUG_FS */
>  
>  #ifdef CONFIG_SUSPEND
>  static void amd_pmc_validate_deepest(struct amd_pmc_dev *pdev)

