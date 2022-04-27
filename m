Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 631BFC433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Apr 2022 14:18:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237472AbiD0OVl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Apr 2022 10:21:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237730AbiD0OUm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Apr 2022 10:20:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 136065DE42
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Apr 2022 07:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651069049;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZMYRHkpnlvz3tweeyLDjJhnn1y6kPQ0I+KtiL14+HQk=;
        b=Dxk7TjQNZ6IuP8b0OZUmAy7W8UA1b8NpJ6Sq/oVHZ/waiB4i38BgcfNVNOQooODR/fHdxi
        2vbdEhz34H9SMY7P0+h2006mSCPSWQSULoY8W9Lf9nBkSrJ9dRxIRnbMXxC7+k8er84+vQ
        mvXJZednbjmSH0GZWnAsRmNqC5ruczs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-goslgeQ1Muaq1Wex8VE5KA-1; Wed, 27 Apr 2022 10:17:27 -0400
X-MC-Unique: goslgeQ1Muaq1Wex8VE5KA-1
Received: by mail-ej1-f71.google.com with SMTP id sg44-20020a170907a42c00b006f3a40146e8so1218390ejc.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Apr 2022 07:17:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZMYRHkpnlvz3tweeyLDjJhnn1y6kPQ0I+KtiL14+HQk=;
        b=dOtftLjk0kjEEzJv7Ub16Yjjbl695EifxhxVSCd5aaHbt84Y1P5y54BKFuN9iORja9
         VEvh0Aa1EMUhtYZHabqDOsHM2wkxnZmbv0NIDYialWnzO2Ti+sK+hjiz/5ldo3Ml26cJ
         wiGoV5U5Y0DhjpOybkp8m+dN7UhcHEpruJQgkY7emdRTmw3smZqw+QnKkzYTlH43rQNz
         pCPHlyXYGO0J0ZFeldZrIQ87928dZHSFZv5gye7pM4x2tB648Xuj3AG/RRpDHUoGJMOO
         NOqxePHMqDS5nseFhTY612qRNI1moGnnH6Jsu8X2U7H09TexQDqfhc6vbcrtPF1rrYae
         /hPQ==
X-Gm-Message-State: AOAM531/OvqE/mEzFirwwdJGMLjWRp2icTZVq7YgA/OxCELOGifCKJX+
        e0+hDioiGkKWCeoWUztmGyxt+ntYuPOQQNYqZCdghKB8v76qmhHuFSKm7eA2t4CMqK7OvxZiAmJ
        Y0LEqIAvrMqYQU4TAGardjCYbSWKG8fSDPA==
X-Received: by 2002:a17:906:9b8d:b0:6f3:c659:d3b0 with SMTP id dd13-20020a1709069b8d00b006f3c659d3b0mr3482859ejc.553.1651069046331;
        Wed, 27 Apr 2022 07:17:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwr+RQAoDyNvRnrvwC2n8w9S5aYy3NykouSfHCp50OR73nONs8uXJ9TeDyqzo1622L7hbHacw==
X-Received: by 2002:a17:906:9b8d:b0:6f3:c659:d3b0 with SMTP id dd13-20020a1709069b8d00b006f3c659d3b0mr3482836ejc.553.1651069046117;
        Wed, 27 Apr 2022 07:17:26 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id ot2-20020a170906ccc200b006ef9bb0d19bsm6842947ejb.71.2022.04.27.07.17.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 07:17:25 -0700 (PDT)
Message-ID: <45a59bff-7469-077b-d7cb-66ed1ccd5b37@redhat.com>
Date:   Wed, 27 Apr 2022 16:17:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] platform/x86: gigabyte-wmi: added support for B660 GAMING
 X DDR4 motherboard
Content-Language: en-US
To:     Darryn Anton Jordan <darrynjordan@icloud.com>,
        thomas@weissschuh.net, platform-driver-x86@vger.kernel.org
References: <Ylguq87YG+9L3foV@hark>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Ylguq87YG+9L3foV@hark>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/14/22 16:24, Darryn Anton Jordan wrote:
> This works on my system.
> 
> Signed-off-by: Darryn Anton Jordan <darrynjordan@icloud.com>

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
>  drivers/platform/x86/gigabyte-wmi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/gigabyte-wmi.c b/drivers/platform/x86/gigabyte-wmi.c
> index 658bab4b7964..e87a931eab1e 100644
> --- a/drivers/platform/x86/gigabyte-wmi.c
> +++ b/drivers/platform/x86/gigabyte-wmi.c
> @@ -148,6 +148,7 @@ static const struct dmi_system_id gigabyte_wmi_known_working_platforms[] = {
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550I AORUS PRO AX"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550M AORUS PRO-P"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550M DS3H"),
> +	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B660 GAMING X DDR4"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("Z390 I AORUS PRO WIFI-CF"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("X570 AORUS ELITE"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("X570 GAMING X"),

