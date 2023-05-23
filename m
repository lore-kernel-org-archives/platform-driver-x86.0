Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 022F3C7EE26
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 May 2023 10:37:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236129AbjEWKhW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 May 2023 06:37:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235574AbjEWKhV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 May 2023 06:37:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15D60FD
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 May 2023 03:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684838197;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9XzWxLytFrRgFlT5QYBkMAZz6m+Zrsj6267mFCoSwY4=;
        b=ieSeGk+Uat3SZeJ0e6OSnf1vkwo5BUgyQVyDpWYhh9SzLzOKokixCVl9lYRImU2e17WrWB
        QnhCPi30V4FrfU79yKYZNlmkd0yLSZoDiqEFVnqrg+oWyPBgxEa9KSmdHJLDcvLWepFpH3
        rv11KNUlzI4rDv+nD0JOJyN+v0FBOZM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-437-xM1IZmFyP02roCfhNPqVBg-1; Tue, 23 May 2023 06:36:36 -0400
X-MC-Unique: xM1IZmFyP02roCfhNPqVBg-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-511b509b55bso980553a12.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 May 2023 03:36:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684838195; x=1687430195;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9XzWxLytFrRgFlT5QYBkMAZz6m+Zrsj6267mFCoSwY4=;
        b=ZLiyn1reXvC0WC9WjxRtpUOe4g9m4OnT89JSIUq3UcJQI8DV+ipXTFZChfuXLRm9Eo
         ARL97KVImxIGCzzdvZqqFIzYt+WW7CzMnKJ3BrYeYqweY2IwCezqK0OGquqDO2tfFdmK
         Eq79U1HEBwYpnV0Z5UUmD3aTXq56N2miFjQEgX3ao72WoLpceiNBFLnAKSeTAcjEgFEg
         RFrU6HPuhQa7PUzxaV9nlLUgDLuBY3n0yzXXvLihGO0jK5/GWY1s7AJVPd8nhaTcU0hY
         13jLQEH5J8rEPUR4GU28ROfHTbCWG66KySsiFZGafDFG5QI1Y3aKlHoSoBsBD86iB3JP
         MVTA==
X-Gm-Message-State: AC+VfDzo7CFElNX3RIGvEfGXan8iVYlAh+RvQ07hcormXgszC/mF4HZq
        JKqGPs6li4G1S7NV9K3WN5De4AvTEx6l/+95cM0336izQzZ6ZPCxlnq7Q35BAU9hqWAjmomIqrZ
        WwJUsEZgSZKE4pJYL3mG0WhPxQ5ZnXWM56A==
X-Received: by 2002:aa7:d31a:0:b0:509:c6e6:c002 with SMTP id p26-20020aa7d31a000000b00509c6e6c002mr9335574edq.39.1684838194949;
        Tue, 23 May 2023 03:36:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6jbGMwXieNd4nZpmQ/qAoQpisaFxStRS2NfNl5Fuu6ld9GKmz7vzRiUJNJSJDRxH86Z404+g==
X-Received: by 2002:aa7:d31a:0:b0:509:c6e6:c002 with SMTP id p26-20020aa7d31a000000b00509c6e6c002mr9335567edq.39.1684838194686;
        Tue, 23 May 2023 03:36:34 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id b7-20020aa7d487000000b00506b2af49fbsm3859733edr.81.2023.05.23.03.36.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 03:36:34 -0700 (PDT)
Message-ID: <283cc7f9-d88b-80cc-f81e-3166d7d6b269@redhat.com>
Date:   Tue, 23 May 2023 12:36:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 0/4] Updates to AMD PMC driver
Content-Language: en-US, nl
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org
References: <20230516091308.3905113-1-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230516091308.3905113-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Shyam,

On 5/16/23 11:13, Shyam Sundar S K wrote:
> Series includes fixes and feature updates to the PMC driver.
> Series has been split into 4 patches to incorporate the review
> remarks from v2.
> 
> v3:
>  - Based on review-hans branch
>  - Pass true/false instead of 1/0 the amd_pmc_send_cmd()
>  - Add helper for supported cpu id check as suggested by Ilpo.

Thank you for the new version.

Can you please prepare a v4 addressing Ilpo's small remarks
on patches 3/4 and 4/4 ?

Regards,

Hans




> 
> v2:
>  - Based on review-hans branch
>  - Add a switch for cpu-id check based on feedback from Mario.
> 
> Shyam Sundar S K (4):
>   platform/x86/amd: pmc: Pass true/false to bool argument
>   platform/x86/amd: pmc: Get STB DRAM size from PMFW
>   platform/x86/amd: pmc: Add helper function to check the cpu id
>   platform/x86/amd: pmc: Update metrics table info for Pink Sardine
> 
>  drivers/platform/x86/amd/pmc.c | 123 ++++++++++++++++++++++++++-------
>  1 file changed, 99 insertions(+), 24 deletions(-)
> 

