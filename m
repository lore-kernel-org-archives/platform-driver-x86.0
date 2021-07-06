Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36454C07E96
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Jul 2021 10:08:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1648F619A1
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Jul 2021 10:08:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231255AbhGFKLQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 6 Jul 2021 06:11:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39243 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231194AbhGFKLQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 6 Jul 2021 06:11:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1625566117;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fkUL5b8YgAi/G+425pjIUtZ7clWR3x75JHUPwUSdKOA=;
        b=OkMJxT42psywl/dxtdB5uTyHxR3V/Ck19+LaunFWSUVlVMIaQJOpMZhxmTDjA1H4NtufXB
        pyd01ylQGDBG1FHJNLilmCOMzEdxDUdLSRBdfrNuJk2UzP1BgqBa6UzBtHHftZIhtsQawB
        unlsloh2o9DyBXeqrpgt3DefF4yKkac=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-7YbvK13uMyeVIUFPwH1W9w-1; Tue, 06 Jul 2021 06:08:36 -0400
X-MC-Unique: 7YbvK13uMyeVIUFPwH1W9w-1
Received: by mail-ej1-f72.google.com with SMTP id hy7-20020a1709068a67b02904cdf8737a75so4789768ejc.9
        for <platform-driver-x86@vger.kernel.org>; Tue, 06 Jul 2021 03:08:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fkUL5b8YgAi/G+425pjIUtZ7clWR3x75JHUPwUSdKOA=;
        b=Xx6wn9jWG0W02zavsKx02FCo3MKUlbRkuLhPap52Y4ay+NRcN+qbRFaQn3qbPKbm9w
         rA1/+mjV19iJWVzmr+XbqzKm49Mk2c5fsydLO6yIu6zFjAiFmSSiJGACAzZGupsJHYIi
         nmfH9XE4Q7qM6lS7rjcjA9ucSARa6fAzBj+qGd0t9njk5Tikzjz70YYpTIk4D/ox+oBO
         5bvyGp9jLXhiAr2t8D455S0rWAOwS5QdpHgvF8cnir5eFxtR94Zm3eQROCY06YcHjRAo
         lxm1zfnI7SXh9OoFCmNoTaP9mS5dSCx7Gj6oIy4o7t+Cz+WJV/qd55C+qThBpEiVDY+H
         dnpw==
X-Gm-Message-State: AOAM532r6ymCsbMzxtci3UocR4d1ggYBvQPYyYuicxcplVnpw5Y/0XlH
        S0pu//LYmCCJRreE42YkzIB1chdfp6y37swz/gT0/qzLgK6Ex+x/g0+ttV66F10Lk1Ml4HAXwgN
        Ek4ycIV8mnOLOfEwNyT/OO6fvvle1SdqPWg==
X-Received: by 2002:a17:906:1284:: with SMTP id k4mr13111089ejb.329.1625566115564;
        Tue, 06 Jul 2021 03:08:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyI2oIY2Q+GKYwex6EIiIxA4L1dDu4N//GmIomNoCTAnkVBF4rfHyYmntgD3gGsPyBHTM8GOA==
X-Received: by 2002:a17:906:1284:: with SMTP id k4mr13111077ejb.329.1625566115426;
        Tue, 06 Jul 2021 03:08:35 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id t27sm5442382eje.86.2021.07.06.03.08.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jul 2021 03:08:35 -0700 (PDT)
Subject: Re: [PATCH 1/3] asus-wmi: Add panel overdrive functionality
To:     "Luke D. Jones" <luke@ljones.dev>
Cc:     corentin.chary@gmail.com, mgross@linux.intel.com,
        jdelvare@suse.com, linux@roeck-us.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210704222148.880848-1-luke@ljones.dev>
 <20210704222148.880848-2-luke@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <176320b4-7461-3a97-2958-0c35dbdac0ae@redhat.com>
Date:   Tue, 6 Jul 2021 12:08:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210704222148.880848-2-luke@ljones.dev>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

One more remark inline:

On 7/5/21 12:21 AM, Luke D. Jones wrote:
> Some ASUS ROG laptops have the ability to drive the display panel
> a a higher rate to eliminate or reduce ghosting.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> ---
>  drivers/platform/x86/asus-wmi.c            | 92 ++++++++++++++++++++++
>  include/linux/platform_data/x86/asus-wmi.h |  1 +
>  2 files changed, 93 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index ebaeb7bb80f5..2468076d6cd8 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c

<snip>

> +static ssize_t panel_od_show(struct device *dev,
> +				   struct device_attribute *attr, char *buf)
> +{
> +	struct asus_wmi *asus = dev_get_drvdata(dev);
> +	u8 mode = asus->panel_overdrive;
> +
> +	return scnprintf(buf, PAGE_SIZE, "%d\n", mode);

As Barnabás pointed out in his review of patch 2/3, please
use sysfs_emit here.

Regards,

Hans

