Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DFB4C001DE
	for <platform-driver-x86@archiver.kernel.org>; Wed, 26 Jul 2023 09:04:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233058AbjGZJEJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 26 Jul 2023 05:04:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231569AbjGZJDq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 26 Jul 2023 05:03:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24BC959EE
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 01:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690361952;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xeRT9Jy7eVenEoTjFFWWmP+a03yBpOH5hVPtQnivUcw=;
        b=Zznh+HXMDpeFSZHFoUVh3kcRMSjQyAe206Mmyr/4B7wyaZiyZjts0HgPtQ9J+E6de4tN2O
        SmibCdqonlhsrcPzeNwLdavvms2ollAeunD4IcDI/YeNeUpUto7+dAX1QP0D6PcF1xuGKJ
        TbSo/3OkUeVLFP5+02gsjKgsAmfHgQU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-xskdl_lnPRmaS-91FzyEPw-1; Wed, 26 Jul 2023 04:59:11 -0400
X-MC-Unique: xskdl_lnPRmaS-91FzyEPw-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-94a35b0d4ceso427900266b.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 01:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690361945; x=1690966745;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xeRT9Jy7eVenEoTjFFWWmP+a03yBpOH5hVPtQnivUcw=;
        b=A8y6hhcb/rPp9uLoDbBiRsFSIoOu7NAHvudBxTqYumX5n/0IVhyVZETv6bhuw3ii2K
         DdkGAPiFDt6UrtBrvHzyFM9KdAugvNuRICxVL9QJtqcRFtAqXFtX+/7rcYIzZaS/Z/SP
         54at21tD73eYpp3QH7YRjVds9k+D4DXFJUVRb7IiDAXyw3tMfxlSrg+FJm1Zj9aOiviD
         m2nJGE8F3HAHcSpdAbK76VBsyBCOLTvYBxY3feoszTi0TJa9i29+hKF2Wn3DH6OPMloR
         K8cXnQYPUhm8IbvUjYp0bWNaRRHOWZw3TnC5L+Xs9e46CUuZr/BquZQ6HAjsWBK7LUio
         U3AQ==
X-Gm-Message-State: ABy/qLbRmTTLAw3UDLkj+G3/6z27fg2pL/g62za4Hvn5OQss61ab3TQD
        F1mByp9zbF1QDU9i07FTfIayqINDFxJx1fSEKwU0fkXqHsu/hQQspI9qlpQxM/63Y4HN2ISvWka
        6M73+sM1GnZArUSZPR0Lkc2Jsj8+xBr5FlA==
X-Received: by 2002:a17:906:3098:b0:99b:b3a1:437b with SMTP id 24-20020a170906309800b0099bb3a1437bmr1128247ejv.40.1690361945545;
        Wed, 26 Jul 2023 01:59:05 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGce74iNdoqahohZBou7UapwNEzH+hZVT14Xqe7CfDrQV51dAMGR6N625plRzskQ5Ljavku+Q==
X-Received: by 2002:a17:906:3098:b0:99b:b3a1:437b with SMTP id 24-20020a170906309800b0099bb3a1437bmr1128238ejv.40.1690361945266;
        Wed, 26 Jul 2023 01:59:05 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a18-20020a1709065f9200b0096f6a131b9fsm9234448eju.23.2023.07.26.01.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 01:59:04 -0700 (PDT)
Message-ID: <4ef7791f-57f3-c27f-f414-9a39e014b86e@redhat.com>
Date:   Wed, 26 Jul 2023 10:59:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] platform: Explicitly include correct DT includes
Content-Language: en-US, nl
To:     Rob Herring <robh@kernel.org>, Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Mark Gross <markgross@kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Cc:     devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20230714174909.4062739-1-robh@kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230714174909.4062739-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/14/23 19:49, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

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
>  drivers/platform/chrome/cros_ec.c          | 1 +
>  drivers/platform/mellanox/mlxreg-hotplug.c | 1 -
>  drivers/platform/mellanox/mlxreg-io.c      | 1 -
>  3 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
> index 8b7949220382..5d36fbc75e1b 100644
> --- a/drivers/platform/chrome/cros_ec.c
> +++ b/drivers/platform/chrome/cros_ec.c
> @@ -12,6 +12,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
>  #include <linux/of_platform.h>
> +#include <linux/platform_device.h>
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_ec_proto.h>
>  #include <linux/slab.h>
> diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
> index b7dcc64cd238..6ddfea0d4c5b 100644
> --- a/drivers/platform/mellanox/mlxreg-hotplug.c
> +++ b/drivers/platform/mellanox/mlxreg-hotplug.c
> @@ -12,7 +12,6 @@
>  #include <linux/i2c.h>
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
>  #include <linux/platform_data/mlxreg.h>
>  #include <linux/platform_device.h>
>  #include <linux/spinlock.h>
> diff --git a/drivers/platform/mellanox/mlxreg-io.c b/drivers/platform/mellanox/mlxreg-io.c
> index ddc08abf398c..83ba037408cd 100644
> --- a/drivers/platform/mellanox/mlxreg-io.c
> +++ b/drivers/platform/mellanox/mlxreg-io.c
> @@ -11,7 +11,6 @@
>  #include <linux/hwmon.h>
>  #include <linux/hwmon-sysfs.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
>  #include <linux/platform_data/mlxreg.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>

