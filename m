Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0BE8C6FA93
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Sep 2022 10:48:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230203AbiISKss (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 19 Sep 2022 06:48:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbiISKsU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Sep 2022 06:48:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66F0E2A739
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Sep 2022 03:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663583945;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cXleTUSpIcidngi4Jm3sq6Z/07mi9++wM3Sx89Lt8V0=;
        b=Jc3ideNZ7ysONNQOkhKKYstW1QykydiWotbjOL/b3FHk61uR3+wMaOISD53eHOTtZ3ozZS
        gL/ZNNdeyR0xfNycmz648sCQW6jNsjYQfB+Z8Su4tfznaPP05x2gZ+RdPP7SQ3DsEDZ8NB
        I7QPXAC0IOT7/Q5w5Pv5B1vjzW3DXSc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-54-zx7Wh5E7P-W7UjXNsZZuMw-1; Mon, 19 Sep 2022 06:39:04 -0400
X-MC-Unique: zx7Wh5E7P-W7UjXNsZZuMw-1
Received: by mail-ej1-f71.google.com with SMTP id he41-20020a1709073da900b00780bff831ebso1555625ejc.6
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Sep 2022 03:39:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=cXleTUSpIcidngi4Jm3sq6Z/07mi9++wM3Sx89Lt8V0=;
        b=oPHKE14i1PltdwQpMN7vif7RLU6ZfxhkUExI32xfY/uxRokzD9RDhySjfDJlaWV1pz
         EHJzQ7xqDFfbCI75q8ng7bKvKfmdRKcAtkXvgEl6m+u5tCeoW/NzoyrjzSxS5kQTjmun
         w83FWUtbUgnNkVPmx5XmHnucvcZSy8m9/aDX7tJCJzXyWdqOKFj8CsF8SVPsss22eDQ4
         lm7djO/6EAzMNuCm0416j9U2qBRS9At6/M0RvU+tbqZLk/3x5VScGzWkW4Apz3jV+A69
         eJhq6DP0jU5wPkWPwPtGwRfDMwpJSv/EcxampBTv6v8uaxlrh4bW2r9267lcFzsNTl8G
         czJQ==
X-Gm-Message-State: ACrzQf0sXA3vwIuOgK5+Vv2Wex66EA78oV/FpIvezPo2mBOrU3vijQ6m
        fflPjcQy1EUcPNaHEof/JA0DAPQwe9mRoNkaOOxI+B/4QmEE935AfKDOw3gn/nvCrodXI9MeaMq
        BYCQSFBtowKMUQ+SRwVtvPCGMbJ9GYsNqzQ==
X-Received: by 2002:a05:6402:17c7:b0:44e:8bd8:73ca with SMTP id s7-20020a05640217c700b0044e8bd873camr15455985edy.141.1663583943236;
        Mon, 19 Sep 2022 03:39:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4pqr+L9OV7qsC3iY5HLKaqr5RVu4X18zy3IeRDNM1iSnaI+RFo2cEIBZcHNgH/M22lAFJI0A==
X-Received: by 2002:a05:6402:17c7:b0:44e:8bd8:73ca with SMTP id s7-20020a05640217c700b0044e8bd873camr15455972edy.141.1663583943090;
        Mon, 19 Sep 2022 03:39:03 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id u22-20020a170906781600b007305d408b3dsm15401765ejm.78.2022.09.19.03.39.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 03:39:02 -0700 (PDT)
Message-ID: <f5ee8870-b0bf-3102-c177-984d729e0ebe@redhat.com>
Date:   Mon, 19 Sep 2022 11:39:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2 4/4] MAINTAINERS: Update ABI doc path for AMD PMF
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        bnocera@redhat.com
References: <20220912090641.111658-1-Shyam-sundar.S-k@amd.com>
 <20220912090641.111658-5-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220912090641.111658-5-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/12/22 10:06, Shyam Sundar S K wrote:
> Update the MAINTAINERS file with ABI doc path for AMD PMF driver.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d74bf90f5056..255527be7e24 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1026,6 +1026,7 @@ AMD PMF DRIVER
>  M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/ABI/testing/sysfs-amd-pmf
>  F:	drivers/platform/x86/amd/pmf/
>  
>  AMD HSMP DRIVER

Please squash this change into patch 3/4 which introduces this new file.

Regards,

Hans

