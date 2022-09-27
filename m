Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD22AC6FA83
	for <platform-driver-x86@archiver.kernel.org>; Tue, 27 Sep 2022 13:26:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232620AbiI0N0m (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 27 Sep 2022 09:26:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232692AbiI0N0X (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 27 Sep 2022 09:26:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D57105C97A
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Sep 2022 06:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664284827;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zHFV4zOF9SLYs9fGDVw/oQlj8tVoB1/HYc81ESDSTu0=;
        b=BkRH7QJ12knA06g5dhn8ptu6Hb182ILJD2uR6GChhTaqcTOsjPUmbaoe3lVG9ISLnGrddv
        tjmt9LGJ/4eVCA3rKkln/dSjwTtSwRhNJmq4Vp4HhjB29ybb5+gUZxp7NxkAp1rr0Gf7a7
        HotNZD5CHiE9PHEuCweMS2FdvjyQfrU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-470--kCZeE3tONOttmW-rc0c8A-1; Tue, 27 Sep 2022 09:20:26 -0400
X-MC-Unique: -kCZeE3tONOttmW-rc0c8A-1
Received: by mail-ej1-f71.google.com with SMTP id he8-20020a1709073d8800b007838dd153f4so2716219ejc.12
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Sep 2022 06:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=zHFV4zOF9SLYs9fGDVw/oQlj8tVoB1/HYc81ESDSTu0=;
        b=M7GL5jGmdf7UrIOzOsQnJo8P9hoiH234v/gH8E5EO+k2WkV0LCc2H0tKM9acvUwAqS
         EBnlzTL4sGSVo9h1+XJTqj6zVOqGD5chPXlTYPGVmROuDid3nGqPUWsyWWHW+otRdKht
         t+BXUtYvsdgwzqT122Zd1wCLbXwVUgDGNh2dJ1ZKLAO2A6KNL34ptKGrn6YGOtPjuYTj
         +cxa9en8IsEYD990GicdqA8tuGy5Wp92TQpk7xPHTQhO1e/k1LEQ4bRcliEiJx1av8kR
         xaWcVNcxnjQ39jr3igH5Fa0ZQCxiZ93MaTHYkfCICesk3v9XBeXUX94GSGVhHkmZpQa5
         KKKw==
X-Gm-Message-State: ACrzQf1Apw5ED0lEZkIygOHjn1XMfE43XrtgAJT4TDei1TYu1RpZ4UcV
        IWId8Dg9OShKL1BlDDm+CDxgfnEq9WQp8RrUMkCSBV49n+d/Dy314gRGgPAu1UmzMlkYQDwx/ov
        dPzoVz6BsQFa+wPxmM+TQWNI9r1RAFA/QdA==
X-Received: by 2002:a17:907:3e93:b0:783:d969:f303 with SMTP id hs19-20020a1709073e9300b00783d969f303mr5176066ejc.379.1664284825296;
        Tue, 27 Sep 2022 06:20:25 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5BkrF0KNvRFbnSqncQZLSA9JbFuC6F9ndYdYQPA2RRCdc6+43KQOfCM7ZXhSJJ8ezRL1U7hg==
X-Received: by 2002:a17:907:3e93:b0:783:d969:f303 with SMTP id hs19-20020a1709073e9300b00783d969f303mr5176052ejc.379.1664284825109;
        Tue, 27 Sep 2022 06:20:25 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id r17-20020a17090609d100b00781d411a63csm772373eje.151.2022.09.27.06.20.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 06:20:23 -0700 (PDT)
Message-ID: <0ef25c3b-91e4-d3ad-9cb5-7ad503179073@redhat.com>
Date:   Tue, 27 Sep 2022 15:20:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] platform/x86/amd: pmc: remove CONFIG_DEBUG_FS checks
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org,
        Sanket.Goswami@amd.com
Cc:     platform-driver-x86@vger.kernel.org
References: <20220922175608.630046-1-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220922175608.630046-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/22/22 19:56, Shyam Sundar S K wrote:
> Since linux/debugfs.h already has the stubs for the used debugfs
> functions when debugfs is not enabled, remove the #ifdef CONFIG_DEBUG_FS
> checks.
> 
> Fixes: 156ec4731cb22 ("platform/x86: amd-pmc: Add AMD platform support for S2Idle")
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

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
>  drivers/platform/x86/amd/pmc.c | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
> index e47e54b095af..047e47449ff9 100644
> --- a/drivers/platform/x86/amd/pmc.c
> +++ b/drivers/platform/x86/amd/pmc.c
> @@ -153,9 +153,7 @@ struct amd_pmc_dev {
>  	struct device *dev;
>  	struct pci_dev *rdev;
>  	struct mutex lock; /* generic mutex lock */
> -#if IS_ENABLED(CONFIG_DEBUG_FS)
>  	struct dentry *dbgfs_dir;
> -#endif /* CONFIG_DEBUG_FS */
>  };
>  
>  static bool enable_stb;
> @@ -429,7 +427,6 @@ static struct attribute *pmc_attrs[] = {
>  };
>  ATTRIBUTE_GROUPS(pmc);
>  
> -#ifdef CONFIG_DEBUG_FS
>  static int smu_fw_info_show(struct seq_file *s, void *unused)
>  {
>  	struct amd_pmc_dev *dev = s->private;
> @@ -544,15 +541,6 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
>  					    &amd_pmc_stb_debugfs_fops);
>  	}
>  }
> -#else
> -static inline void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
> -{
> -}
> -
> -static inline void amd_pmc_dbgfs_unregister(struct amd_pmc_dev *dev)
> -{
> -}
> -#endif /* CONFIG_DEBUG_FS */
>  
>  static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
>  {

