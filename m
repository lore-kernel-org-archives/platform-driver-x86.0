Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BB45EB64DC
	for <platform-driver-x86@archiver.kernel.org>; Fri, 14 Jul 2023 17:14:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235491AbjGNROi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 14 Jul 2023 13:14:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235256AbjGNROg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 14 Jul 2023 13:14:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCD2C2D47
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Jul 2023 10:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689354766;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7BMuFWFJgKkfR7qq+IS+D1jJJ6kY02AzOFZ4p3m+cLQ=;
        b=PItp1dz7PoFkK6jroFjJurKymtfoleGwQNgzUM0eUaNotBBtsBrr7lA6kBlKcW5c5yk/WM
        1GiiZ4c2OxUIJkxkRS3lsIqJJqZUYY6ub5MXecYx/eqLz6HjLTa6kwR/+IQcgwznxjBexE
        F0g1eX2obEImQFNV/02NZe1YIH1gZdU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-i14vqYYAM1ad8uw1h2CrAg-1; Fri, 14 Jul 2023 13:12:45 -0400
X-MC-Unique: i14vqYYAM1ad8uw1h2CrAg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-993eeb3a950so124185566b.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Jul 2023 10:12:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689354764; x=1691946764;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7BMuFWFJgKkfR7qq+IS+D1jJJ6kY02AzOFZ4p3m+cLQ=;
        b=ExbK0QXkivDFiyFURtCpsc6JjNpZcTE7F6RmFaMjw/qJ517I/wP8A7Qs7rj1sko6A7
         1jhIeDDdKuf7xmhFsAZagHmiJtPTnXBlVHTbY5EzdZecaIIgBamujcTs9GKympMD3FBE
         WAynHGzjQ/FhMZmFM+fiBZ1UPWy5yAUtFsu/yNrtyIj0hNwgU7vT1A9GowpNoOxbs+rs
         /jS8k5yut3y61gsy0apuzMbXv6yJlIM7+NcgIlaP5ufulMxpdVSvbfF8reECI7ZfKv5N
         w7hmgJYB715Qfjp0nC4vahG0suFsNTrffiak05DojsxLwIQTmtA2JpLw5RUQ1QZR9HJy
         +KXQ==
X-Gm-Message-State: ABy/qLaKwlZhCavuRuCXALCEPEhSv39RcA9Uvwt3+zosnIcvwZifC8uV
        eWG6HdCAoVCDTj/tOD/ayX/1BqIaOBvDfe2xHffIcKOwSZt9E2+idPw46LgH4QAEjER9Yu7g/n+
        87VEFVn4PPlnXZAAQQXpM+TxcZq2o/z+AUw==
X-Received: by 2002:a17:906:4e56:b0:992:91ce:4508 with SMTP id g22-20020a1709064e5600b0099291ce4508mr4795817ejw.53.1689354764562;
        Fri, 14 Jul 2023 10:12:44 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFzpCwemzaaWGrXx2MaiJix60YvtAU+adcTTgf7Cow4+cekofPzY2wpZ/2idlb0b3zeCKA44A==
X-Received: by 2002:a17:906:4e56:b0:992:91ce:4508 with SMTP id g22-20020a1709064e5600b0099291ce4508mr4795806ejw.53.1689354764302;
        Fri, 14 Jul 2023 10:12:44 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id pw20-20020a17090720b400b009786ae9ed50sm5651104ejb.194.2023.07.14.10.12.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 10:12:43 -0700 (PDT)
Message-ID: <abba29ad-1cdb-c48e-c5b4-2cad8c7a93be@redhat.com>
Date:   Fri, 14 Jul 2023 19:12:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/2] platform/x86/amd/pmf: reduce verbosity of
 apmf_get_system_params
Content-Language: en-US, nl
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        mario.limonciello@amd.com
References: <20230714144435.1239776-1-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230714144435.1239776-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/14/23 16:44, Shyam Sundar S K wrote:
> apmf_get_system_params() failure is not a critical event, reduce its
> verbosity from dev_err to dev_dbg.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thank you for your patch-series, I've applied the series to my
review-hans branch:
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
> v1->v2:
>  - Rebase to review-hans branch
> 
>  drivers/platform/x86/amd/pmf/acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index 081e84e116e7..732b15b392ab 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -289,7 +289,7 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
>  
>  	ret = apmf_get_system_params(pmf_dev);
>  	if (ret) {
> -		dev_err(pmf_dev->dev, "APMF apmf_get_system_params failed :%d\n", ret);
> +		dev_dbg(pmf_dev->dev, "APMF apmf_get_system_params failed :%d\n", ret);
>  		goto out;
>  	}
>  

