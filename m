Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 579C4C4167B
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Dec 2020 18:19:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C02C2389F
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Dec 2020 18:19:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726231AbgLGSTH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Dec 2020 13:19:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60347 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725816AbgLGSTH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Dec 2020 13:19:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607365060;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UOBmTGb65u1zbDQhSNHIQ5RWUBC279gK5SaIcPJyzDo=;
        b=MWq9kTB8nlSl74kX8UIJkIULwhI/ykx4IomgpzcWb3Ywfl+IZ1r5tb8ojhTiLk8Gv8wYAG
        7q18wgwbSVyYaQ7ZUeI9sFcvm2NtoZ8IUuI38U3Av4RYO1ejwTWhvNw3EZO5+JsVTwH1HV
        aWtAJWmtMsfcNm6ehlLvUgbVcIJeWc4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-k_L8wrHBP9Ox-SH5NKVg_Q-1; Mon, 07 Dec 2020 13:17:39 -0500
X-MC-Unique: k_L8wrHBP9Ox-SH5NKVg_Q-1
Received: by mail-ed1-f69.google.com with SMTP id dc6so6114237edb.14
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Dec 2020 10:17:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UOBmTGb65u1zbDQhSNHIQ5RWUBC279gK5SaIcPJyzDo=;
        b=uUwXYtp/dFzODMrUqog0w+eKXMxInM94q01yiR07ItxluzhgqqUQfPK6AfZ1v0C6ma
         rIwlNi1Ru/6Us73S8LS4UzO/9xuf8IytR0LECJNUqLza0/p1CUxVdVvOI777wtKxmsf2
         KNSpeTcbFWHJqdgfvFcI1j1fD/fDHoRCcmxp3vfXT+aH5P7z9zDfuSFvIyQ1EJoQkdsK
         x23umdqRjc0wkJEElZ9XkYtl281HjNJvAYSUgQBIoJwYoYXzawUL7ySTK5hRD6JfAaeO
         JPU8Z1iDkZKQ86KmT16aMQ/2fIbHcG/zMMX2ScmYEAdXQxBQgQFdAnj+nSekUhuX7fkv
         43IQ==
X-Gm-Message-State: AOAM5329R8IfuR0Mk06i1n4sH20tUonxR6RS6mAG85ApNdsxBOG4pb9d
        346jxJwPTTvqVVPQ5gkjJauCW2zFLbKu6H5eTglSIzJznwHbBXd0JNAY4CdTNfS/9l8piMAwPfv
        qDLyreOriUoMWeaQBZP6mcRw81NDPDlchHQ==
X-Received: by 2002:a17:906:60d4:: with SMTP id f20mr20589572ejk.156.1607365057897;
        Mon, 07 Dec 2020 10:17:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzZ2UVolp/mUMVoCZonZ/BlCiEw3d8F4JXSVAzGqtdkFNKFHLH4lljaPQwj3ehl2bSuTH0s/A==
X-Received: by 2002:a17:906:60d4:: with SMTP id f20mr20589563ejk.156.1607365057749;
        Mon, 07 Dec 2020 10:17:37 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id o13sm3915461edr.94.2020.12.07.10.17.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Dec 2020 10:17:37 -0800 (PST)
Subject: Re: [PATCH v2 0/3] Intel Speed Select interface changes for 5.11
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201207181531.1718148-1-srinivas.pandruvada@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <2f663d89-184b-f52e-6156-f485205f27f5@redhat.com>
Date:   Mon, 7 Dec 2020 19:17:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201207181531.1718148-1-srinivas.pandruvada@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/7/20 7:15 PM, Srinivas Pandruvada wrote:
> v2
> Fix sparse warnings reported by LKP.
> 
> Srinivas Pandruvada (3):
>   platform/x86: ISST: Check for unaligned mmio address
>   platform/x86: ISST: Allow configurable offset range
>   platform/x86: ISST: Change PCI device macros

I've already added these to the for-next branch of:

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/

Please send the changes in this v2 as (a) follow-up
patch(es).

Regards,

Hans

