Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B39C433E0
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Feb 2021 19:54:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3971864E27
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Feb 2021 19:54:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238472AbhBBTy3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Feb 2021 14:54:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38047 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240090AbhBBTxb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Feb 2021 14:53:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612295524;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NxQodtgYcmc4QZjZKTAF3TCMHN4Ic1oSfzkOYjvIdZc=;
        b=b9tJ+SPpBPyF4CJVTCfvhfSZPAXWKZ0UHhLmYkVLJSvVqDYyni7O8fxsn5OWWlL/OrHTmW
        41NjJQjFixQlO1qY5n/73VbwlHAXNRa/WsxBdMPbZ+KeIIy316LdRGEAq1PS7GTpgMGMu/
        Nisv2MD6Blkc6lojrUl707zB+NUxSw8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-oWhFngdHON6bM1HJNKdXxA-1; Tue, 02 Feb 2021 14:52:02 -0500
X-MC-Unique: oWhFngdHON6bM1HJNKdXxA-1
Received: by mail-ej1-f71.google.com with SMTP id p1so10471707ejo.4
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Feb 2021 11:52:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NxQodtgYcmc4QZjZKTAF3TCMHN4Ic1oSfzkOYjvIdZc=;
        b=IaISjZEMDQ8nKQgdMCPAHeLe7RPB99Z5tQIo98k0jXElZlH1HsXT7pSgUcxsHNTI0w
         xPttFfg3a+TlqF+DAH2DiIL0Rl+DiLHEuK8hIXb9oLWoQK2SjkO1AaGv2/MWdf13O8C6
         Z+sZYSPqRtmwFIUg5gfZOf2G6X6Q08XDY0PUFNRTW7/dIkj7/xg52tir6oVlzsqdh/wg
         gke2G0KhEdt1scHXpuBRZ3mg7fQzVh6fKx6fU+jYWA3vl55tQBsSCAEo/Y/36Jh71Pqm
         A8Hs83ZUQCJembZ/IqpFEfMYh+YD/EZxdwIWNN9GKWOS5/n71Rvx9apb4ON14YLkwXVX
         DJ/Q==
X-Gm-Message-State: AOAM531+L3KCbBAEehA+SCIcGSnxKMnvJZsOzosj2yuqzmW9hqqHLUwT
        /GifzpbUDDk88dBsown/83oLIX3/BHnVh1myNGpMRvcHYXTG52MQXeSqcQceESXaBLAff6GP8d2
        W5UEzhInlyjlUB3jD54AuRelmaXWeEtha/Q==
X-Received: by 2002:aa7:d755:: with SMTP id a21mr493003eds.301.1612295521032;
        Tue, 02 Feb 2021 11:52:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyYfKVSviHVWCzOxE3Kc3e6aX+wFXb2mRq00duIqLVwYSo0WiW7GeLafvB3sL4pPLUfy/AWFw==
X-Received: by 2002:aa7:d755:: with SMTP id a21mr492993eds.301.1612295520859;
        Tue, 02 Feb 2021 11:52:00 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id g2sm9800386ejk.108.2021.02.02.11.52.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Feb 2021 11:52:00 -0800 (PST)
Subject: Re: [PATCH 0/3] Platform: OLPC: A couple of fixes
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210126073740.10232-1-lkundrak@v3.sk>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <9132ebf9-8665-4add-74a8-5e4d73ca7246@redhat.com>
Date:   Tue, 2 Feb 2021 20:51:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210126073740.10232-1-lkundrak@v3.sk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

hi,

On 1/26/21 8:37 AM, Lubomir Rintel wrote:
> Hi,
> 
> chained to this message is a couple of fixes related to OLPC EC platform
> code. Please take a look and consider applying to platform-drivers-x86.

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

