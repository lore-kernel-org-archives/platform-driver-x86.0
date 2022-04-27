Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF40CC433FE
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Apr 2022 14:26:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237821AbiD0O3M (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Apr 2022 10:29:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237774AbiD0O3D (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Apr 2022 10:29:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0647229F
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Apr 2022 07:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651069550;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=meZFqi3CaO9c14DiZ4KXudhKEdsdw2cnBxB6ExEDL0M=;
        b=UsRMhiRghXxoNcFXsh+EUHLe9ux4AX99lK094W3fqVpZDVljdc5hpk1pA3dlU072m/n9e/
        2ayXqTg3ERKI2h5aMQt8NHE4V53F7BRfomc3jgshVzFZMXUzv+ofzqTM/XsoBdEQBaviaq
        4TanKleRR86NxREtdL3N5qVTSbDPj1M=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-v2By0uRZOFCL6Y1nto2v-A-1; Wed, 27 Apr 2022 10:25:46 -0400
X-MC-Unique: v2By0uRZOFCL6Y1nto2v-A-1
Received: by mail-ej1-f72.google.com with SMTP id sh14-20020a1709076e8e00b006f3b7adb9ffso1249791ejc.16
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Apr 2022 07:25:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=meZFqi3CaO9c14DiZ4KXudhKEdsdw2cnBxB6ExEDL0M=;
        b=ghYeoG7oHA0S6wKSbqmslo4uxYDkywz76sm2LLKaSHjEpynRvXqqU2EUm16af3F6in
         P+osz3Dw31MnOr2UG/0egGvqlyb9z34cvqa/1Q8pfdZ86hU/XDWi5KzMDgq08RLW2rOV
         Ohgw1Tp4ixf1V04Jkg1NBvRdXommpk5/79De0QZE7AYVHery5FD4ugvvDvwALHJ7gWaL
         W6u02+1iNzhapSfiR/UKdPDzB6jFq/XxSUpllMJ2Oe3sbW0yVlA/ayOJHEPlveaQO3Oy
         cgIWQ2icQ/fs/WSmTECpcWGe4AU3YDw+xYH/7bKJwbWV2+PQgW9TVnt1Q5XLQpxnaSlm
         xXsw==
X-Gm-Message-State: AOAM531ef5mYBZFwSokxn2s+22y8MAWdmIV1X4+TTHHNeaIdFyfB8zYW
        HjE+v0qc/9m/Rwv1zJoLvyrXzyR382cYI8/t/sXGfnIDVyli3fwRrjO7v6fZ4Hm64ssIKRb7GgX
        ZJ9CRJ2J7V3iT4lNHOkWMd5TSv/TY9PAY+Q==
X-Received: by 2002:a17:907:9958:b0:6e7:f67a:a1e7 with SMTP id kl24-20020a170907995800b006e7f67aa1e7mr25754849ejc.400.1651069545029;
        Wed, 27 Apr 2022 07:25:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9XKL0rxhNeXaJaz/zgQG2tvcs8GubQ2HP1+7At1pUpLGpAmENJVs5SaOdECl5AuxYCPQTlQ==
X-Received: by 2002:a17:907:9958:b0:6e7:f67a:a1e7 with SMTP id kl24-20020a170907995800b006e7f67aa1e7mr25754825ejc.400.1651069544772;
        Wed, 27 Apr 2022 07:25:44 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id o5-20020a170906974500b006dfc781498dsm6907231ejy.37.2022.04.27.07.25.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 07:25:44 -0700 (PDT)
Message-ID: <362138c7-7d6a-69b5-1e0f-0d6e29b1b958@redhat.com>
Date:   Wed, 27 Apr 2022 16:25:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] platform/x86: amd-pmc: Shuffle location of
 amd_pmc_get_smu_version()
Content-Language: en-US
To:     Nathan Chancellor <nathan@kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@lists.linux.dev
References: <20220418213800.21257-1-nathan@kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220418213800.21257-1-nathan@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/18/22 23:38, Nathan Chancellor wrote:
> When CONFIG_DEBUG_FS is disabled, amd_pmc_get_smu_version() is unused:
> 
>   drivers/platform/x86/amd-pmc.c:196:12: warning: unused function 'amd_pmc_get_smu_version' [-Wunused-function]
>   static int amd_pmc_get_smu_version(struct amd_pmc_dev *dev)
>              ^
>   1 warning generated.
> 
> Eliminate the warning by moving amd_pmc_get_smu_version() to the
> CONFIG_DEBUG_FS block where it is used.
> 
> Fixes: b0c07116c894 ("platform/x86: amd-pmc: Avoid reading SMU version at probe time")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

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
>  drivers/platform/x86/amd-pmc.c | 40 +++++++++++++++++-----------------
>  1 file changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index 668a1d6c11ee..e266492d3ef7 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -193,26 +193,6 @@ struct smu_metrics {
>  	u64 timecondition_notmet_totaltime[SOC_SUBSYSTEM_IP_MAX];
>  } __packed;
>  
> -static int amd_pmc_get_smu_version(struct amd_pmc_dev *dev)
> -{
> -	int rc;
> -	u32 val;
> -
> -	rc = amd_pmc_send_cmd(dev, 0, &val, SMU_MSG_GETSMUVERSION, 1);
> -	if (rc)
> -		return rc;
> -
> -	dev->smu_program = (val >> 24) & GENMASK(7, 0);
> -	dev->major = (val >> 16) & GENMASK(7, 0);
> -	dev->minor = (val >> 8) & GENMASK(7, 0);
> -	dev->rev = (val >> 0) & GENMASK(7, 0);
> -
> -	dev_dbg(dev->dev, "SMU program %u version is %u.%u.%u\n",
> -		dev->smu_program, dev->major, dev->minor, dev->rev);
> -
> -	return 0;
> -}
> -
>  static int amd_pmc_stb_debugfs_open(struct inode *inode, struct file *filp)
>  {
>  	struct amd_pmc_dev *dev = filp->f_inode->i_private;
> @@ -417,6 +397,26 @@ static int s0ix_stats_show(struct seq_file *s, void *unused)
>  }
>  DEFINE_SHOW_ATTRIBUTE(s0ix_stats);
>  
> +static int amd_pmc_get_smu_version(struct amd_pmc_dev *dev)
> +{
> +	int rc;
> +	u32 val;
> +
> +	rc = amd_pmc_send_cmd(dev, 0, &val, SMU_MSG_GETSMUVERSION, 1);
> +	if (rc)
> +		return rc;
> +
> +	dev->smu_program = (val >> 24) & GENMASK(7, 0);
> +	dev->major = (val >> 16) & GENMASK(7, 0);
> +	dev->minor = (val >> 8) & GENMASK(7, 0);
> +	dev->rev = (val >> 0) & GENMASK(7, 0);
> +
> +	dev_dbg(dev->dev, "SMU program %u version is %u.%u.%u\n",
> +		dev->smu_program, dev->major, dev->minor, dev->rev);
> +
> +	return 0;
> +}
> +
>  static int amd_pmc_idlemask_show(struct seq_file *s, void *unused)
>  {
>  	struct amd_pmc_dev *dev = s->private;
> 
> base-commit: b0c07116c894325d40a218f558047f925e4b3bdb

