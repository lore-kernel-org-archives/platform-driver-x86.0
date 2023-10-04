Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2107E7C4D0
	for <platform-driver-x86@archiver.kernel.org>; Wed,  4 Oct 2023 15:11:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243011AbjJDPLp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 4 Oct 2023 11:11:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243021AbjJDPLp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 4 Oct 2023 11:11:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB90ABD
        for <platform-driver-x86@vger.kernel.org>; Wed,  4 Oct 2023 08:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696432256;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5dw+22+QBaq3uQiZhUVBNqHy85FFEFStSH8ldnFqzdY=;
        b=YvZjpdSmzmGPEuz2QiGuASzo7yVuYitK2xLmeSSLQRCWCsy+fzMCQV2PxzymJLTs0yab2o
        6aSZJBXHcdQkqez/M6BytNzxm1V36qBp5Kd5xfVMIBLULdx2WKFJOuKNty1fqzOLMw8L4W
        yyoNX7LVtLRSjgIWTjrKyKaR25AB66U=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-g7hKa3z2MVCBWTnf59k-6w-1; Wed, 04 Oct 2023 11:10:55 -0400
X-MC-Unique: g7hKa3z2MVCBWTnf59k-6w-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-533ca50404bso1895457a12.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Oct 2023 08:10:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696432254; x=1697037054;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5dw+22+QBaq3uQiZhUVBNqHy85FFEFStSH8ldnFqzdY=;
        b=ePsBqRBkNICpXP7xOxcGT4K8/KEnF8KybksWWrisIFnXGUKbjq6jlMgNNm+/IECazm
         UvXSvNxsN5LhFwJQNqkEpB9PjtsQN8FF3wPHv7D+rp5K+JyrGL5mFQ8/Q5KD80qNsRx/
         32SCMXew65o5Y8sgJRzBmXTPpVLtobGBGjB+La6snONoBskxoZlAe+YGf0MF00dCe7gz
         ESip/h50E4cVBlstR+juRyFpGZmcYs3M9bX96Nphhj2GovWWx88q8ypDU4rhddUlVqzh
         nB38xRFsHBnOTmu4ID3I24Q9VN4UAg0prfcBSq4Jvry63r5ld0xeTVTM9WmRqnljAM+L
         A5oA==
X-Gm-Message-State: AOJu0YyvxRuNRYeMKDHvL41tXdgoRy5q8FFNUJ7zYwgfoQewtxFV+5Hi
        LW+FJXNarrx0zv5j/z6OH3EUGW+cyvpwDMABn9TJefCzEz3Z/ny0XbHhOxT4UIuc/4X+jbyStWV
        8oTSzpxDWRS+KSz1WliIUdHVawEN7RH45gw==
X-Received: by 2002:a17:907:1b11:b0:9ae:6ffd:bdf7 with SMTP id mp17-20020a1709071b1100b009ae6ffdbdf7mr2754142ejc.39.1696432254245;
        Wed, 04 Oct 2023 08:10:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpTCpkTwmdSP8LfjFW2dFubb76nmzZ1CWrQd7OoRIwsrYDSabGXi3FpijN1ouLYWn8ajo1JQ==
X-Received: by 2002:a17:907:1b11:b0:9ae:6ffd:bdf7 with SMTP id mp17-20020a1709071b1100b009ae6ffdbdf7mr2754119ejc.39.1696432253850;
        Wed, 04 Oct 2023 08:10:53 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id dt26-20020a170906b79a00b0099290e2c163sm2938866ejb.204.2023.10.04.08.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Oct 2023 08:10:53 -0700 (PDT)
Message-ID: <47babe3e-052f-d816-9789-5c8ae4728e78@redhat.com>
Date:   Wed, 4 Oct 2023 17:10:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 2/2] platform/x86/amd/pmc: Add dump_custom_stb module
 parameter
Content-Language: en-US, nl
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org,
        =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org,
        Harsh Jain <Harsh.Jain@amd.com>
References: <20230910142034.2967110-1-Shyam-sundar.S-k@amd.com>
 <20230910142034.2967110-2-Shyam-sundar.S-k@amd.com>
 <b3e4acdc-c031-cf00-b972-bc11e3933799@redhat.com>
 <ac5a328e-48ab-4e21-ad8a-72518d0952cb@amd.com>
 <5c6625ba-c2f0-6510-c1ea-3005a9c16e14@redhat.com>
 <844d0ef1-a09c-4c8a-aa14-d3487e3289f9@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <844d0ef1-a09c-4c8a-aa14-d3487e3289f9@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Shyam,

On 10/4/23 14:11, Shyam Sundar S K wrote:

<snip>

> Thank you for the detailed feedback. I will make these changes and see
> if that helps - will need some time do tests and come back on this.
> 
> Meanwhile, is it OK for you to take changes in v4 1/2 atleast? So that
> I don't need to respin it again (assuming there are no remarks for 1/2).

Note I have a new pdx86 co-maintainer Ilpo who is merging the patches
leading up to the 6.7 merge window (Ilpo and I plan to take turns for this).

IMHO it will be easier for Ilpo to merge the whole series in one
go when it is ready.

Note when addressing my remarks please split any fixes for the existing
functionality out into separate patches vs the new dump_custom_stb
support.

Regards,

Hans



