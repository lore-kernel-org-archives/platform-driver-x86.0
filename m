Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5DA0C7EE23
	for <platform-driver-x86@archiver.kernel.org>; Tue, 30 May 2023 09:10:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbjE3JKb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 30 May 2023 05:10:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229701AbjE3JKa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 30 May 2023 05:10:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2100DF9
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 May 2023 02:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685437778;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/iJrK51J5PADdE/kybjA9N+s+evRLT7tl/nMpFSwFbQ=;
        b=Yof2KEP72LDFFrYC+WUM72KAXftinKqnG68v0wFbJFZ9wl3rKDM/b3H4le0YHDEOTQAcBK
        FWYOvBXtJXgpVOL1FqGIazRBrp9aOZHKAbbYjZFU4pnFK0/qcXI94MOaFEz+PgBOS/ntWO
        aV8ftw8b+qZCABdd9MU74MxDgxHlNfM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-CpgEzfBNPo2eIN8Uq3ApCA-1; Tue, 30 May 2023 05:09:36 -0400
X-MC-Unique: CpgEzfBNPo2eIN8Uq3ApCA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-96fd3757c1dso456751766b.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 May 2023 02:09:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685437775; x=1688029775;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/iJrK51J5PADdE/kybjA9N+s+evRLT7tl/nMpFSwFbQ=;
        b=X4fgZkBlSiyJ0rCuC1DFFZJsQtt/ayBSiW1DtetIy+7+/RsFkXgphuOVV6t5I3kiLw
         Dr2XzaiKZe7qJ/XF1E4NkCCzYkwxkXwyGCwVDpEH5fsy/9DLYT9/ovx4IWVpbWSPj4Q+
         nh1DOYNydaDtDA0NeH3lrLQ1s6Eru2e/U1UU67QkcIMC4T3kY5MJNyzDaR9X/mIR/2+7
         K9vkmBDzE9hePZNoVIe7VZLbFyQzczyMlormaMD7vAvKZfXDUVGi/CN05mgDc7afu8Vp
         t4wnPuVqLdazON3g0aQm0qsmYjmba62VyG0u5sxrmxWUJpTwKzz79ymAlIR5CPHmeYOM
         tntA==
X-Gm-Message-State: AC+VfDwbwNLJl4yASSTl+S/tKaLmi+8Sth4EETzzN0mh52iTSD0NpFsM
        xxMJ6KLs7Zl0xOT0BRyHUNM1W3JvonDU3qr31bBvk3KEkFBfFkz1iVqgQAFw5xbTfymHeSLR9on
        bohXRJTeWRyMEPQLylkikFVr4t4ihRFDGrA==
X-Received: by 2002:a17:907:3e8f:b0:96f:181b:87d3 with SMTP id hs15-20020a1709073e8f00b0096f181b87d3mr1989952ejc.37.1685437775780;
        Tue, 30 May 2023 02:09:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ516t9yDSxbU9B3F/l9WWgnZUyIJ2qPMBODZE3SRxwNqb4o581lHEU2AQWHUE2jSR1OiZlY5w==
X-Received: by 2002:a17:907:3e8f:b0:96f:181b:87d3 with SMTP id hs15-20020a1709073e8f00b0096f181b87d3mr1989931ejc.37.1685437775479;
        Tue, 30 May 2023 02:09:35 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id p18-20020a170906a01200b00966447c76f3sm7088353ejy.39.2023.05.30.02.09.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 02:09:34 -0700 (PDT)
Message-ID: <ca818604-0e8c-19b2-8407-0c1c226a3e85@redhat.com>
Date:   Tue, 30 May 2023 11:09:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5 0/4] Updates to AMD PMC driver
Content-Language: en-US, nl
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org
References: <20230525141929.866385-1-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230525141929.866385-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/25/23 16:19, Shyam Sundar S K wrote:
> Series includes fixes and feature updates to the PMC driver.
> Series has been split into 4 patches to incorporate the review
> remarks from v2.

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





> v5:
>  - Change amd_pmc_is_cpu_supported() to amd_pmc_is_stb_supported()
> 
> v4:
>  - Based on review-hans branch
>  - Address review remarks from Ilpo on the commit-msg and function names
> 
> v3:
>  - Based on review-hans branch
>  - Pass true/false instead of 1/0 the amd_pmc_send_cmd()
>  - Add helper for supported cpu id check as suggested by Ilpo.
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

