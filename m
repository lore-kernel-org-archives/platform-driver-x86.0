Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E9BAC4361B
	for <platform-driver-x86@archiver.kernel.org>; Tue,  8 Dec 2020 15:32:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E26323A79
	for <platform-driver-x86@archiver.kernel.org>; Tue,  8 Dec 2020 15:32:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729936AbgLHPcy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 8 Dec 2020 10:32:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58549 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730072AbgLHPcx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 8 Dec 2020 10:32:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607441486;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+FMZUGLEZ8IR+pc7weB+jF6Ts3wWL1ODG+l+6NkEMl0=;
        b=KNwoYCI78sIK64UBxBu4NxjHkKk7nWnckyb/QSfiCNoTv6GkgCU2xfv2Sv0pThFQZ5qMaF
        gXScTHwQUe/pSt/LYtzZJTSFeB+m2U6u29nNojRWAdrB17hjngmw1k3MomqYCLmoVmzgCi
        Y1NuRsrx3vRB3MOYaSJSxd0UJ19pIcI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-nBkJtWjTNnClLXwwFJO81Q-1; Tue, 08 Dec 2020 10:31:24 -0500
X-MC-Unique: nBkJtWjTNnClLXwwFJO81Q-1
Received: by mail-ed1-f70.google.com with SMTP id bo22so2620622edb.15
        for <platform-driver-x86@vger.kernel.org>; Tue, 08 Dec 2020 07:31:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+FMZUGLEZ8IR+pc7weB+jF6Ts3wWL1ODG+l+6NkEMl0=;
        b=RZx/q4wBKxU9XdZ6NDX4njYVDX91WMjGXLQP4KrY149FjweDBDr/viNmDreBYv/jB3
         ro2hgrNFAuv/fUO8WiW3wrBWCZikFvQSB71CrTCj8CjYkN8tyew8lSUB/dUbjuQCNKOz
         aJWt9CLH885SI0NfqsV8MUJk8KwjsL1s61mbnK/gfdHG0McVElywtjDnmhclR5Qj7i1C
         /ZasY9S85rthnoTwZcvFHlFV2inDAgqVnWCWP7X8gSFcpfqACQKh+tjBWmq/aC5pEuDU
         PHqHhypJ3sv5muMa4PbYp/qim8INL2FU3Qi3KKNVS1zrarhpkvV79h1I4s2Fia0orFqa
         mmtg==
X-Gm-Message-State: AOAM533yPNMRILnoPqvDsjuL+K1zCxx47HI9jFYK2Hgp5LH3tw1rHn0d
        VnZ3l3epwUNFd4CkikWk42nWIuXlVSHd//OfTFnT8nylHW9oSgA7HHOmEtvYKz4V2aSnbNdDllf
        tT4AB0KrAlQ3xPLx6jpcg5EUzu4XUsPNpjw==
X-Received: by 2002:a50:f0dc:: with SMTP id a28mr25458357edm.291.1607441483384;
        Tue, 08 Dec 2020 07:31:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxtQU0RezIwC9tzXq31kmgXqVciy5sBw5mSMcppCnQP7N2IaRcQFo26XwXC19JRgWUuXan+jw==
X-Received: by 2002:a50:f0dc:: with SMTP id a28mr25458346edm.291.1607441483238;
        Tue, 08 Dec 2020 07:31:23 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id oq7sm6098333ejb.63.2020.12.08.07.31.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Dec 2020 07:31:22 -0800 (PST)
Subject: Re: [PATCH -next] platform/x86: ISST: Mark mmio_range_devid_0 and
 mmio_range_devid_1 with static keyword
To:     Zou Wei <zou_wei@huawei.com>, srinivas.pandruvada@linux.intel.com,
        mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1607430489-116200-1-git-send-email-zou_wei@huawei.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f9e29a7e-f5eb-afaf-1d29-4665be99046a@redhat.com>
Date:   Tue, 8 Dec 2020 16:31:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1607430489-116200-1-git-send-email-zou_wei@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/8/20 1:28 PM, Zou Wei wrote:
> Fix the following sparse warnings:
> 
> drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c:23:24: warning: symbol 'mmio_range_devid_0' was not declared. Should it be static?
> drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c:28:24: warning: symbol 'mmio_range_devid_1' was not declared. Should it be static?
> 
> Signed-off-by: Zou Wei <zou_wei@huawei.com>

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
>  drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c b/drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c
> index 2906cfe..ff49025 100644
> --- a/drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c
> +++ b/drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c
> @@ -20,12 +20,12 @@ struct isst_mmio_range {
>  	int end;
>  };
>  
> -struct isst_mmio_range mmio_range_devid_0[] = {
> +static struct isst_mmio_range mmio_range_devid_0[] = {
>  	{0x04, 0x14},
>  	{0x20, 0xD0},
>  };
>  
> -struct isst_mmio_range mmio_range_devid_1[] = {
> +static struct isst_mmio_range mmio_range_devid_1[] = {
>  	{0x04, 0x14},
>  	{0x20, 0x11C},
>  };
> 

