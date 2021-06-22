Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0132AC2B9F4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Jun 2021 13:28:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D69C86128C
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Jun 2021 13:28:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229988AbhFVNao (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Jun 2021 09:30:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46263 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229907AbhFVNan (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Jun 2021 09:30:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624368507;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dkpg2sKtqpq15jMgsfLQwv+OYanXgN65EUyAFmp9K8c=;
        b=GVMkZstXpivsnHVNbx6nwpNHhCUMtPbgRxAkYyLC3NCl9PBRjNG+CpaPVcvTRwMUgRI06G
        pMjUNzwe7OBApQ+bTZg3JH6dP4ylDFoDBLqdXd7yREMJ8fu4uXg4LZRipw6GDwSoD6PG5P
        3abjzAs/RWZ2qylkZJkWlyXZGi9cmeU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-AXVvWc4TPkCg3FWJ0JGXYg-1; Tue, 22 Jun 2021 09:28:26 -0400
X-MC-Unique: AXVvWc4TPkCg3FWJ0JGXYg-1
Received: by mail-ej1-f71.google.com with SMTP id u4-20020a1709061244b02904648b302151so1060264eja.17
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Jun 2021 06:28:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dkpg2sKtqpq15jMgsfLQwv+OYanXgN65EUyAFmp9K8c=;
        b=pyUJ2wA6TIyGT+Kh2y0dTADcI4DZq1TYH9SDa1flbj2eFc6PjBexigJ0q0f/J42OvV
         jD/qnrE4rdW4PxXLJkPyEX6OdGZJ588nWzXj/8no637yWDkPBdfnlzoK/Fy9ZuB1XNpI
         csGqills47eZO4RjhMRTPolSdi/dK0XdB85ZYl34waScrhEggnreblK7uwRvhoy8+ncy
         0xoCweWm+LGTt70+mMqLhmwtrGQ392OMbSKqPCVOX92c85mowTIRqT2hczWLUJ9bWVbl
         ccUVp/USPHh6+anIBYlFMI00XTVDXxe/IpoIYZGDyJmRd+W72xP0Vwj2HSVP2GSAdBKR
         VOCA==
X-Gm-Message-State: AOAM5323RncVR3+4dK9jDciQPT/g7yJx4Zs8HvpDlAk3mrjLj4x1JfF/
        s50Q17+WAFMVo93zVy0qHumTkuqRLsdYmn56VdnMyqAj6JJKohr40bXbOLttj5bkyW+x4rIdlzp
        zWPczF+JyIHnjIiZPbhaRcU4xzUEpb/H3rMDVtYKrJHto6dreodddzXMe6kwqlgFWlWydkRYWPe
        g3gfbSbyz46A==
X-Received: by 2002:a17:906:254d:: with SMTP id j13mr4126090ejb.27.1624368504746;
        Tue, 22 Jun 2021 06:28:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+18Ag09GPkx9puWXPFoKp25Ld0aZLHplxSz/XBI4zZ6Lq9/lEiikrCmGFW7+edb045C5dgQ==
X-Received: by 2002:a17:906:254d:: with SMTP id j13mr4126075ejb.27.1624368504571;
        Tue, 22 Jun 2021 06:28:24 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id f18sm12228607edu.5.2021.06.22.06.28.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jun 2021 06:28:24 -0700 (PDT)
Subject: Re: [PATCH 0/6] updates to amd-pmc driver
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org
References: <20210617113040.1603970-1-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <b720bcaa-3b6f-2727-2159-a2bee82faeff@redhat.com>
Date:   Tue, 22 Jun 2021 15:28:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210617113040.1603970-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/17/21 1:30 PM, Shyam Sundar S K wrote:
> Couple of existing issues on the completion codes to SMU
> and a newer way to get the s0ix statistics are introduced.
> 
> Also, add acpi ids for current and future revisions of the
> pmc controller.
> 
> Shyam Sundar S K (6):
>   platform/x86: amd-pmc: Fix command completion code
>   platform/x86: amd-pmc: Fix SMU firmware reporting mechanism
>   platform/x86: amd-pmc: Add support for logging SMU metrics
>   platform/x86: amd-pmc: Add support for logging s0ix counters
>   platform/x86: amd-pmc: Add support for ACPI ID AMDI0006
>   platform/x86: amd-pmc: Add new acpi id for future PMC controllers

Thanks, other then my remarks on patch 2/6, the rest of
the series looks good to me, so you may add my:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

To patches 1/6 and [3-6]/6 .

Regards,

Hans

