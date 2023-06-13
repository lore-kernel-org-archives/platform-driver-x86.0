Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A0E3C88CB4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 13 Jun 2023 10:39:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241566AbjFMKj3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 13 Jun 2023 06:39:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239323AbjFMKj0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Jun 2023 06:39:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E89ED92
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Jun 2023 03:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686652715;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fHn2Cp4t0XjaJjUOorn/rOHW+RZTATHi0qvjyHSPOgg=;
        b=JrU1Lgd5ib0oGgB3rhtv4ZRvtRQ28ENX3TF10kcxFfXsMprxOZ2qb2A82NsLBhcTzozlUZ
        JapoWbrbntBYtXm1LdJf7e/4AQ0R6BgUsAY7g2ZAffS4v4lIB46zcSFeEQ7nYco5rrCSRm
        QnCj5UKvlJUnMr2t9Ey10wa2+wYEbM4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-zDgdWnzdM7y-flOm_w2GWg-1; Tue, 13 Jun 2023 06:38:33 -0400
X-MC-Unique: zDgdWnzdM7y-flOm_w2GWg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9749b806f81so489747066b.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Jun 2023 03:38:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686652712; x=1689244712;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fHn2Cp4t0XjaJjUOorn/rOHW+RZTATHi0qvjyHSPOgg=;
        b=W+xLtD1W60+Lq3LqWJMdwedOwUs2v53qi1ffNRjArqK58tLMWOyfxtWNrRhJh2N74+
         Om1SFC4Aj74XXGQ37jc/Gp9HR0kr5bqmk+Bj1vE3wJKr8zw8cBoMbSohf0McQYjFnPk3
         QInYWlQlTenNVuxAi5bG4VPr63DigsnLGL5NMGzOYxTV4Yqdpi37tQx1EKJC4CicTkqW
         1oZo0f6uK3zthdc31MJ12azD32pMXGTdRmdXgF/pyCnlGatD6gvZRsTFJr2WwglSmNxR
         jtl9BpGUjEwIXe7jcNOUCAhY38tpdR89dkRKGqAOFda8Zn64O7QpL4GSuPAaGuGxTe17
         fbaA==
X-Gm-Message-State: AC+VfDzuP2fhH2T4De3yAyFcw8p8nTQIj/l5nPkomynn1Jrf8BqFIm0f
        BdzzxamYKHMx2kdBIBqcKMChvWlG+XBTxzLnlcJddMyf+Ey9J003wDwxUmXtGSmn2ytI5pG3pcS
        g6OcVi5yw3K9ynkcqZ7K44rlW5r6htQg8AG8PNgnFwA==
X-Received: by 2002:a17:907:7f0f:b0:97e:ab93:b246 with SMTP id qf15-20020a1709077f0f00b0097eab93b246mr8866641ejc.66.1686652712566;
        Tue, 13 Jun 2023 03:38:32 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6X6wbfVu3y3yv+RDMbjxzDtJMWcHWp3uQisW6ZXqmC/XlOuBwkoJmUpuo+7HmDhkjXgPQRwA==
X-Received: by 2002:a17:907:7f0f:b0:97e:ab93:b246 with SMTP id qf15-20020a1709077f0f00b0097eab93b246mr8866631ejc.66.1686652712254;
        Tue, 13 Jun 2023 03:38:32 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id jw15-20020a17090776af00b00977e66ff323sm6456454ejc.75.2023.06.13.03.38.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 03:38:31 -0700 (PDT)
Message-ID: <db9f5d2c-b175-004b-b864-88c290ab7036@redhat.com>
Date:   Tue, 13 Jun 2023 12:38:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.5-rc1
Content-Language: en-US, nl
To:     "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>
Cc:     "srinivas.pandruvada@linux.intel.com" 
        <srinivas.pandruvada@linux.intel.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <3e334999c26d2e9a71f8ee62d78c8356c074c19a.camel@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <3e334999c26d2e9a71f8ee62d78c8356c074c19a.camel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/13/23 01:18, Pandruvada, Srinivas wrote:
> Hi Hans,
>  
> Pull request for Intel Speed Select version v1.16:
> 
> Summary of changes:
> - Fix JSON formatting of output
> - Fix core power configuration for non CPU dies
> 
> The base branch for these changes 
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
> branch: review-hans
> 
> 
> The following changes since commit
> 2515e54267c98dc91a6273765b4bbf560c52b770:

Thank you.

I've merged this into my review-hans branch now.

Regards,

Hans



> 
>   platform/x86: hp-wmi: Add thermal profile for Victus 16-d1xxx (2023-
> 06-08 11:00:17 +0200)
> 
> are available in the Git repository at:
> 
>   https://github.com/spandruvada/linux-kernel.git intel-sst
> 
> for you to fetch changes up to
> 7244720ac137e3193db11b009fc33c0dd4e999c9:
> 
>   tools/power/x86/intel-speed-select: v1.16 release (2023-06-12
> 16:11:04 -0700)
> 
> ----------------------------------------------------------------
> Srinivas Pandruvada (3):
>       tools/power/x86/intel-speed-select: Adjust scope of core-power
> config
>       tools/power/x86/intel-speed-select: Fix json formatting issue
>       tools/power/x86/intel-speed-select: v1.16 release
> 
>  tools/power/x86/intel-speed-select/isst-config.c    | 13 ++++++++-----
>  tools/power/x86/intel-speed-select/isst-core-tpmi.c | 43
> +++++++++++++++++++++++++++++++++++--------
>  2 files changed, 43 insertions(+), 13 deletions(-)
> 
> 
> Thanks,
> Srinivas

