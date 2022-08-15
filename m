Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2798C00140
	for <platform-driver-x86@archiver.kernel.org>; Mon, 15 Aug 2022 15:02:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbiHOPCy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 15 Aug 2022 11:02:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbiHOPCw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 Aug 2022 11:02:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9C19420BEB
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Aug 2022 08:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660575770;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=g2yECLw+fKeeM6y1cLjr8I9qnE48sejea9S2eLZ2jxw=;
        b=DYaoWqEcjzM68l7IO2qNMbDpqKSxfS0uAUDB+oW8JIw/QtcvhSXrtrGY2/106pIbLvfcEU
        f4JyIBz+AfdZdnEwAFZ5SiBzohgpK2BcQC261iU09JOdP+a2aYHGKDTX5EmwKeKQ7hojSd
        Bsxkx4JU7mCFEpQOKFtswu/N9yqG8Fg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-494-eq9sRRK_M8uNRJehRzbsSg-1; Mon, 15 Aug 2022 11:02:49 -0400
X-MC-Unique: eq9sRRK_M8uNRJehRzbsSg-1
Received: by mail-ed1-f71.google.com with SMTP id y14-20020a056402440e00b0044301c7ccd9so4856969eda.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Aug 2022 08:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=g2yECLw+fKeeM6y1cLjr8I9qnE48sejea9S2eLZ2jxw=;
        b=QRl2PBAi9EHNPhqMSj1Eg6NDs5Z536Hq6uVOdErST2OCdS3cRa997e783vka1gH1Hs
         3vrTLwrouUcRqerGNbUDkafPzEz/iHFQJBkpoceich8LGQmHqRiGUdTMHHxpTstEZUaD
         O8w9PWe9OMvZZ6gWP+3k0p9msjmesf5i533gSiJRvQupOmWIKW7BTwMGVCRc580o7vn1
         OHkZvn0fyCX8+0Uf7EfHmNiukfHF5DBE+2HBy5J+N/V/opqa9Z4e5ob4JvOK7Wb5rCLm
         /BIrdn2N21aE/i2PQomGF7MYPmw05suMvEHGbIlAh+HZB6ieVW6/aI/5cS84l1tYG2pr
         cq4w==
X-Gm-Message-State: ACgBeo0SNrWTEf09ODY7Yxk6ofhtg1tRlztvwqlD3tVaSoHMzsEJyfnx
        vxOs8sLYdawbejwj4TuqBJ+of9vNDbiaak5fY1IHPOTJ2bXnVTmXEmMRZa5xouVWbxi4ozuJ4GX
        EvEL1RlngJTk+DpINUG571hg4mpxECwwSkA==
X-Received: by 2002:a17:906:8c7:b0:730:c1a9:e187 with SMTP id o7-20020a17090608c700b00730c1a9e187mr10882195eje.55.1660575767820;
        Mon, 15 Aug 2022 08:02:47 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5LD4zKo/+auF625gRYdARIrc/DRdPkN9y4NN8HFq9hC5uXTUuugQODOjmSg32Pk51BGX3O7g==
X-Received: by 2002:a17:906:8c7:b0:730:c1a9:e187 with SMTP id o7-20020a17090608c700b00730c1a9e187mr10882181eje.55.1660575767672;
        Mon, 15 Aug 2022 08:02:47 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id jz18-20020a170906bb1200b00718e4e64b7bsm4208038ejb.79.2022.08.15.08.02.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Aug 2022 08:02:47 -0700 (PDT)
Message-ID: <089e9d73-07c2-fcb4-fc76-b6e829e491cc@redhat.com>
Date:   Mon, 15 Aug 2022 17:02:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/6] asus-wmi: cleanup dgpu_disable, egpu_enable, panel_od
Content-Language: en-US
To:     "Luke D. Jones" <luke@ljones.dev>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220812222509.292692-1-luke@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220812222509.292692-1-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/13/22 00:25, Luke D. Jones wrote:
> This patch series does two things for previously added features:
> - dgpu_disable
> - egpu_enable
> - panel_od
> 
> The fixes add missing documentation, and the refactors vastly clean up how
> the features work, including reading the values from WMI methods on *_show()
> and checking the result correctly (these methods return 1 on success).

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


> 
> Luke D. Jones (6):
>   Fixes 98829e84dc67 ("asus-wmi: Add dgpu disable method")
>   Fixes: 382b91db8044 ("asus-wmi: Add egpu enable method")
>   Fixes: ca91ea34778f ("asus-wmi: Add panel overdrive functionality")
>   asus-wmi: Refactor disable_gpu attribute
>   asus-wmi: Refactor egpu_enable attribute
>   asus-wmi: Refactor panel_od attribute
> 
>  .../ABI/testing/sysfs-platform-asus-wmi       |  28 +++
>  drivers/platform/x86/asus-wmi.c               | 231 ++++++------------
>  2 files changed, 103 insertions(+), 156 deletions(-)
> 

