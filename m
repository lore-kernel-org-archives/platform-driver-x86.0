Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 593AEC433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 11 May 2022 16:04:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344272AbiEKQE1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 11 May 2022 12:04:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344293AbiEKQET (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 11 May 2022 12:04:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EED9D1A15D8
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 May 2022 09:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652285054;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/5E5ae+fiX+8fhds4+yHVslnnnzZ+qVMHnlGIRP/rgo=;
        b=FlPfgS1HpYSzsI0nmOjgWmEKqCSkF7Hj1kvO2ZBGncSWFG01JrEw3zsSUE6PDgwlvCypct
        2uVPpvRBAInVIULvAQG2msrRtpyKAN7AejgLLrwnAKySgA0rI3iJmIwFZGn0DvJNrTC8Fl
        Qq1ng0yRv1EJdK4NglONK197f4N9In0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-utSA69JfNx6kr8dOpYFmhw-1; Wed, 11 May 2022 12:04:13 -0400
X-MC-Unique: utSA69JfNx6kr8dOpYFmhw-1
Received: by mail-ed1-f70.google.com with SMTP id r8-20020a056402018800b00428b43999feso1604502edv.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 May 2022 09:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/5E5ae+fiX+8fhds4+yHVslnnnzZ+qVMHnlGIRP/rgo=;
        b=oyiBEqeJBrQQs+4T2bWf79fKvjkqssiSXFNi1YNDormgf/nh0GKmEQdOBIKGO1+/nP
         XuSN3LgmtCr7Xc4JxSpFqymPcxvNvgL07OLgyZE8YEKhQQv+BPEmnCFKSnZA/QuuuAoS
         G6tE+mvK0zJgcd0p0MkOqOJSE1UVroOgrtAtLBSfVwyzXbAZtZBxHRn47zbDkDeJzijm
         MBy0tqQ2SP+jeJhYZjgDmupYcdhqpA2icsLPhfhw44YkcSvphfrIvrrNbpwPaYsgUqOh
         9NH2fgM4/1DtyCu7ksjIs3TgcC7AAHPcpL+0wCOA0cNyrSsqL3ig1IGqQX2omAC4XWHY
         JWTQ==
X-Gm-Message-State: AOAM530R8FoLE/vorQnITrYWTueYm1eW5YHSV6SLnIrd0c9ckkNQOY/y
        ttALvqCx/a3bjVp1BuMEAlrV6XCMQiT7x0XjrRbSZ7C+7+TZTwP8YJAEJxpefLFCQb4zgx9cnW8
        iOmB8bOUYymbv7xXe3H/z3F1aZXuiJc4JHQ==
X-Received: by 2002:a17:907:2cc4:b0:6f5:28ea:83f with SMTP id hg4-20020a1709072cc400b006f528ea083fmr24163749ejc.255.1652285052542;
        Wed, 11 May 2022 09:04:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4FYhwaUmeTEVBmeSUYIufRa7f3HQ22CFzDmAHIL5LOnpIxLtX0aUZqjA+oZOOPoQ2QWcJwg==
X-Received: by 2002:a17:907:2cc4:b0:6f5:28ea:83f with SMTP id hg4-20020a1709072cc400b006f528ea083fmr24163736ejc.255.1652285052373;
        Wed, 11 May 2022 09:04:12 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id k8-20020a1709065fc800b006f3ef214e71sm1121435ejv.215.2022.05.11.09.04.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 09:04:12 -0700 (PDT)
Message-ID: <6c848c9f-5099-b565-0d33-2ab4c6b9fff0@redhat.com>
Date:   Wed, 11 May 2022 18:04:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH V2] toshiba_acpi: use kobj_to_dev()
Content-Language: en-US
To:     cgel.zte@gmail.com, andy.shevchenko@gmail.com
Cc:     chi.minghao@zte.com.cn, coproscefalo@gmail.com,
        linux-kernel@vger.kernel.org, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org, zealci@zte.com.cn
References: <CAHp75VfzbWAS6phV3eB7ehe50NrXitkuS54sYjdVK-OqqYVieA@mail.gmail.com>
 <20220511021638.1488650-1-chi.minghao@zte.com.cn>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220511021638.1488650-1-chi.minghao@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/11/22 04:16, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Use kobj_to_dev() instead of open-coding it.
> 
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>

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
> v1->v2:
> 	remove Reported-by: Zeal Robot <zealci@zte.com.cn>
> 
>  drivers/platform/x86/toshiba_acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/toshiba_acpi.c
> b/drivers/platform/x86/toshiba_acpi.c
> index f113dec98e21..0fc9e8b8827b 100644
> --- a/drivers/platform/x86/toshiba_acpi.c
> +++ b/drivers/platform/x86/toshiba_acpi.c
> @@ -2353,7 +2353,7 @@ static struct attribute *toshiba_attributes[] = {
>  static umode_t toshiba_sysfs_is_visible(struct kobject *kobj,
>  					struct attribute *attr, int idx)
>  {
> -	struct device *dev = container_of(kobj, struct device, kobj);
> +	struct device *dev = kobj_to_dev(kobj);
>  	struct toshiba_acpi_dev *drv = dev_get_drvdata(dev);
>  	bool exists = true;
>  

