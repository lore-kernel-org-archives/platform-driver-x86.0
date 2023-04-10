Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 091F1C77B61
	for <platform-driver-x86@archiver.kernel.org>; Mon, 10 Apr 2023 10:37:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbjDJKh1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 10 Apr 2023 06:37:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjDJKh0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 10 Apr 2023 06:37:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F3703581
        for <platform-driver-x86@vger.kernel.org>; Mon, 10 Apr 2023 03:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681123001;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Sk0sI8FDf7E3z2jGNKcOpN6iOrOiDJislrHD2JrEsEU=;
        b=H98dTBSNr0G6gIllxGND0ZMcOvp5NQTd82gQInr3UfNdVgqvrxUfAgYG+pFIkNwdu/y+6+
        Vp5mBzVTfQfTI/CK4AfcDHSFTJ59DNknf1o4QCAXBW3+OKze/TvZbSgb5L4ElSL8EE+sqH
        XhvExxd5ehn097sj6FcYLgCkEnKj2FM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-PoMx14mBN-2qxc7Ye9eIgw-1; Mon, 10 Apr 2023 06:36:39 -0400
X-MC-Unique: PoMx14mBN-2qxc7Ye9eIgw-1
Received: by mail-ej1-f69.google.com with SMTP id tj6-20020a170907c24600b0093d7f81fd04so1112012ejc.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 10 Apr 2023 03:36:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681122998; x=1683714998;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sk0sI8FDf7E3z2jGNKcOpN6iOrOiDJislrHD2JrEsEU=;
        b=GRQ0O08HbC0ILmFjCKWxXHxZROn2/F5IIDXygOEjCyfXYnHTaRd0ZXZYylPDdSQsCM
         dYE2meVpp50vpAxXxCzE41G5CLNIwEZvnZtiT1qUY1MtumfMOOGb1A8QPoYCLiKLLHVn
         yITtEiPAXcpUOToHPY6KjoH+X/7P+rDsReLU0XjsOHu+DmpHDhpuQPPdbJtqXJxV4dom
         XMrRsiWtmeXzIJUN+YqtWnGzSUypcjB3nrGY3lDpu598qJOLaEFdHHQLn4iXrrNttlS6
         yg/OXD3+XQ8AV9pMQ87+7ilEaY4pR4S1eSlWm9N73vTNWh2JNZ4rr/HDOlkrT/ePlnY1
         gWAA==
X-Gm-Message-State: AAQBX9f/SGgLzPIJKbG4Oa0u9tvCc0BjhXyTD/F0RKrv6r3XUP/sxjRL
        tPMR0WcGOTsWG4E0LlLN98pNIcHvv4LXuvGoSjZYSCFbRfaYW8qdV9kLus4/k/yC7uCu3GOQPaD
        fAssDIPz1JSkTftgz11CaQP58Jb0l0POnSA==
X-Received: by 2002:a17:906:7312:b0:93d:ae74:fa9e with SMTP id di18-20020a170906731200b0093dae74fa9emr8221887ejc.7.1681122998774;
        Mon, 10 Apr 2023 03:36:38 -0700 (PDT)
X-Google-Smtp-Source: AKy350apUKyFpmWwi1vFg/wB2E4j7hUY4MZMgX8iLF3n6gRCV/Lp7AKFOBKoS8YfgitxTyz06LT4rg==
X-Received: by 2002:a17:906:7312:b0:93d:ae74:fa9e with SMTP id di18-20020a170906731200b0093dae74fa9emr8221873ejc.7.1681122998523;
        Mon, 10 Apr 2023 03:36:38 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id n14-20020a1709065dae00b009334219656dsm4942536ejv.56.2023.04.10.03.36.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Apr 2023 03:36:37 -0700 (PDT)
Message-ID: <16fc47de-2464-5862-73f7-38a80cd82df4@redhat.com>
Date:   Mon, 10 Apr 2023 12:36:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/8] platform/x86/amd/pmc: Updates to AMD PMC driver
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org,
        Mario Limonciello <mario.limonciello@amd.com>
Cc:     Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20230409185348.556161-1-Shyam-sundar.S-k@amd.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230409185348.556161-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Shyam, Mario,

On 4/9/23 20:53, Shyam Sundar S K wrote:
> This patch series includes:
> 
> 1. Fixes to Picasso from Mario
> 2. Change the SMN pair index for driver probing & STB init
> 3. New command ID for getting DRAM size from PMFW.
> 4. Change in smu metrics table data structure.

So patches 1-6 all seem to be bugfixes, but they don't seem
to be very urgent.  At least AFAICT they mostly just fix
some (harmless) warnings getting logged + future proof some
of the code for newer firmware revisions.

Given that rc6 has already been released it would be my
preference to just merge these into linux-next so that they
get merged into Linus tree for 6.4-rc1.

Either way (urgent should go to fixes, or -next is fine)
please let me know how to proceed with merging these.

Regards,

Hans






> 
> Mario Limonciello (4):
>   platform/x86/amd: pmc: Don't try to read SMU version on Picasso
>   platform/x86/amd: pmc: Hide SMU version and program attributes for
>     Picasso
>   platform/x86/amd: pmc: Don't dump data after resume from s0i3 on
>     picasso
>   platform/x86/amd: pmc: Move idlemask check into
>     `amd_pmc_idlemask_read`
> 
> Shyam Sundar S K (4):
>   platform/x86/amd: pmc: Utilize SMN index 0 for driver probe
>   platform/x86/amd: pmc: Move out of BIOS SMN pair for STB init
>   platform/x86/amd: pmc: Get STB DRAM size from PMFW
>   platform/x86/amd: pmc: update metrics table info for Pink Sardine
> 
>  drivers/platform/x86/amd/Kconfig |   2 +-
>  drivers/platform/x86/amd/pmc.c   | 240 ++++++++++++++++++-------------
>  2 files changed, 145 insertions(+), 97 deletions(-)
> 

