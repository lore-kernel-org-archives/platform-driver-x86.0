Return-Path: <SRS0=isCl=DO=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E19C4363C
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Oct 2020 21:04:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 208FD2087D
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Oct 2020 21:04:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XoZMb/q6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726152AbgJGVEp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Oct 2020 17:04:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48340 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726013AbgJGVEp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Oct 2020 17:04:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602104684;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BNOu84dWUvQBEHc4qF4SN//+ZceXKU3mxM1gBSjtPLI=;
        b=XoZMb/q6hfgbPQ6KA69Q1lVjW9SEM5b2s8jJml+iHpnBU/ZvA6WIF2GgJj2zEu6/7OMfeH
        F6ynVattwJTklr39ZDXzKrsFRIHIIYnaGIKEuyMZNwIiYMGjx3/sEnniMgJgTtZMWQQalg
        WOu7+dXk2E7Th/tJoHYf3qy/Ra6QyiI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-jyjlc5F7PGibbCi7pFz0dw-1; Wed, 07 Oct 2020 17:04:41 -0400
X-MC-Unique: jyjlc5F7PGibbCi7pFz0dw-1
Received: by mail-ej1-f69.google.com with SMTP id f11so1267506eja.23
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Oct 2020 14:04:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BNOu84dWUvQBEHc4qF4SN//+ZceXKU3mxM1gBSjtPLI=;
        b=jrB2wsOtTHGAKclvQ95Fsx7hvNBEHBYBzbCsI4jGsbpV1HnJlD5R/RHix/DhTz3bke
         TC0zgwOkkS3EHc3JF5NSHsEdJStBhWMuutoGqLNc1uOVU0tR/7J+cMiKze4PeewR8C3M
         gqvSZBxAMURlhOpBuX70iyO2uz5G2Y4wXOPZm/koOS4aOexIecmjxtKSzdCrnV9eYXU1
         QqSYBLSXo744RkRO/WCiL9bXo2NvdcOwvrNl5pnoxJRUzlFXkiAVe1uFzOwRKwFzPHn8
         18tmkkZNunfmIEE/fbQTC8/ATblqdPqk0y//1NawxhVvIE2bMO7KU374MCQkqdODQGjs
         stfQ==
X-Gm-Message-State: AOAM532NOFc7m+f/fVhKEn4ZgDWH0yhFNx8rBBq2OBJU8WcEyOCwZoW3
        dmIvT/21Ccs2Ko6qN5EH+IBE8nHnPZg9kxouk7goZ1cp/eO/jMq78UNGMCsWMhSIL6bfivxQ/Hs
        YIylvcp5WOb3DK6SVZItIvCUhQbEQORP8fg==
X-Received: by 2002:a17:906:2dd7:: with SMTP id h23mr5519834eji.175.1602104679505;
        Wed, 07 Oct 2020 14:04:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCFL09nfUI7z1BKpF/EwIQ+csdNzQwJyrWPt4g2ohJwF/R17pLlmcGO4qBVwn7izJBZthQ8A==
X-Received: by 2002:a17:906:2dd7:: with SMTP id h23mr5519807eji.175.1602104679230;
        Wed, 07 Oct 2020 14:04:39 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id t15sm2228820eje.71.2020.10.07.14.04.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2020 14:04:38 -0700 (PDT)
Subject: Re: [GIT PULL]: tools/power/x86/intel-speed-select second pull
 request for 5.10-rc1
To:     "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "andy@infradead.org" <andy@infradead.org>,
        "prarit@redhat.com" <prarit@redhat.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Cc:     "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "srinivas.pandruvada@linux.intel.com" 
        <srinivas.pandruvada@linux.intel.com>,
        "dvhart@infradead.org" <dvhart@infradead.org>
References: <02c960a0ab75672007527e167b89b986ec5f9441.camel@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <845c315f-c781-b0ff-7dbb-6851fdfc7ddf@redhat.com>
Date:   Wed, 7 Oct 2020 23:04:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <02c960a0ab75672007527e167b89b986ec5f9441.camel@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/6/20 4:02 PM, Pandruvada, Srinivas wrote:
> The following changes since commit
> 720ef73d1a239e33c3ad8fac356b9b1348e68aaf:
> 
>    platform/x86: thinkpad_acpi: re-initialize ACPI buffer size when
> reuse (2020-10-05 12:20:42 +0300)
> 
> are available in the Git repository at:
> 
>    https://github.com/spandruvada/linux-kernel.git for-next
> 
> for you to fetch changes up to
> 1fe458617af45f7926ce338b7accec5c0fea1f5c:
> 
>    tools/power/x86/intel-speed-select: Update version for v5.10 (2020-
> 10-06 06:50:49 -0700)
> 
> ----------------------------------------------------------------
> Jonathan Doman (1):
>        tools/power/x86/intel-speed-select: Fix missing base-freq core
> IDs
> 
> Srinivas Pandruvada (1):
>        tools/power/x86/intel-speed-select: Update version for v5.10

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up there once I've pushed my local branch there,
which might take a while.

Once I've run some tests on this branch the patches there will be added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

