Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF095C433E0
	for <platform-driver-x86@archiver.kernel.org>; Mon,  1 Feb 2021 08:29:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B3FD64E24
	for <platform-driver-x86@archiver.kernel.org>; Mon,  1 Feb 2021 08:29:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231598AbhBAI3H (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 1 Feb 2021 03:29:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59398 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229558AbhBAI3G (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 Feb 2021 03:29:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612168060;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xtjxJNWYFyhtzCOjl9O0jIEw51IuhRGMOel2CdJ1YaA=;
        b=MZvS0WomgWj5uu9kp2DtHNwoBe1+GaCJzB8GpwSnS/dRghF3HzjRioF+efdE2epCVQRfBv
        3yNLO0OnKYiq/qp6LnN8Q3Mnbi5dWjlaHFhdGXw7N8tbCQ8NgTiZNlAxvEjdP+74LpY+pK
        Rc55BjO+ySlkOpfwUCimplz+W6TpcRQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-U-kPtqWrPta4XLiSlPAD3Q-1; Mon, 01 Feb 2021 03:27:39 -0500
X-MC-Unique: U-kPtqWrPta4XLiSlPAD3Q-1
Received: by mail-ej1-f72.google.com with SMTP id hx26so1582215ejc.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 01 Feb 2021 00:27:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xtjxJNWYFyhtzCOjl9O0jIEw51IuhRGMOel2CdJ1YaA=;
        b=PXSKws7Z2+6tW57Q819L6ptjtoND/QxV90ZIm0GKlj0zqy6IxD/ZQ9rFIZlkEcQ6Ku
         9+4/yFuV7Jj95zj4F4oXVT5c+SHbmhxgiwf7M6sf7B2zx9kCTqzrD8O0KQYQ1YO7MW1U
         3AIMOZ59qTEh8jnUrPOGbNI6G5kHBZz/WxrztcFi7ibMuCvc0NLI12VIsDSOxEZzTlzT
         VaWxGG8P3sMq7JgWHvG50sLH6Yuw3n2fKx6sVp6ZBlKSAfiE0kmPjLfcJ1IPYHOjXh3s
         CZxBoc8hiHKuN7y3TTxVtpMN7hztT+Js1AmPG6koptOKQEf/mapfKL4pnbIGZ8VRuni8
         bv+g==
X-Gm-Message-State: AOAM532rOapQ9daIn5w17LTnH/MOxMmsB+NPlpT9JQZ4ZqU21OBehoDf
        y5ISdkxB+c/3KMQfw6e8qWkudKJj65YjC3HqCtikdtrpV3iDEOyw7ouQ1o4e7Ku8NIrjDRykDpf
        Muj4QJEdNKsKajW27kYs28g+vzHUUw9ieM7XR2T38AH5FaNk0jVceL1YWBhM6pqqpnG8djA2Cqc
        80l6/3QEzouQ==
X-Received: by 2002:a17:906:87c3:: with SMTP id zb3mr16696130ejb.244.1612168057848;
        Mon, 01 Feb 2021 00:27:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHPc1RHxFcjF7LwmwUlAN5t4AyU108g/oTEVnrRPYdF3oVKhCSPSPSaQ8D934MYnyg1os+tA==
X-Received: by 2002:a17:906:87c3:: with SMTP id zb3mr16696118ejb.244.1612168057708;
        Mon, 01 Feb 2021 00:27:37 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id g16sm274365ejo.107.2021.02.01.00.27.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Feb 2021 00:27:37 -0800 (PST)
Subject: Re: [PATCH] platform/x86: dell-wmi-sysman: fix a NULL pointer
 dereference
To:     Perry Yuan <perry979106@gmail.com>,
        "Limonciello, Mario" <Mario.Limonciello@dell.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <20210129172654.2326751-1-mario.limonciello@dell.com>
 <0da9ca30-53b1-8d34-4fc7-62edb6423b26@redhat.com>
 <SA1PR19MB49263EE7ECF0D06962BE00ECFAB79@SA1PR19MB4926.namprd19.prod.outlook.com>
 <a371c1c9-d803-f2e6-dfca-607a0650345f@redhat.com>
 <8c51e60a-f5be-610a-ab13-84223d291a45@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d47f3a1f-e00d-469b-a8fe-3b9fd5f65fe3@redhat.com>
Date:   Mon, 1 Feb 2021 09:27:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <8c51e60a-f5be-610a-ab13-84223d291a45@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/1/21 3:36 AM, Perry Yuan wrote:

<snip>

> Hi Hans.
> Could you share your the commit link after you apply this patch to your for-next branch?

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?h=for-next&id=64b0efa18f8c3b1baac369b8d74d0fdae02bc4bc

Regards,

Hans

