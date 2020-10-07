Return-Path: <SRS0=isCl=DO=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAB00C4363C
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Oct 2020 21:24:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9144B2083B
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Oct 2020 21:24:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S2tJ3p4z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728229AbgJGVYf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Oct 2020 17:24:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23175 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728172AbgJGVYf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Oct 2020 17:24:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602105873;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hUjXSYPOek0PeZuncG6d9Rj/8KjF9/1xv7QVV58o3gU=;
        b=S2tJ3p4zo81hYx4c0+E00OywR43jrywP3mXbxOyp1JxUrYIVZd1b9yA3+YUjwCQ2JHowZC
        oQKnzipkY9qf8c2hlFIrutg2Hb8ckqiPcOD1v7Kcs3x4wpMD7ZtcVbxxZkrS/F5MBxRot9
        HlKE4VGYX471OA0YZYA42URmlf1karQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-7gfNm4_6N-mUiq8EuWMZSA-1; Wed, 07 Oct 2020 17:24:32 -0400
X-MC-Unique: 7gfNm4_6N-mUiq8EuWMZSA-1
Received: by mail-ej1-f69.google.com with SMTP id m14so1304708ejc.9
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Oct 2020 14:24:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hUjXSYPOek0PeZuncG6d9Rj/8KjF9/1xv7QVV58o3gU=;
        b=fLpUj8oBsVqdoqF+sFw/Q6h2bmfMzZTkm1faYZ8loQYG0efNbBJqjOeMcR+tohhkAZ
         F6Ha1FEsrTxHYBxp6KHbF9is9ZpVIGsPm7GGjTYONitr/825e4JBEEr5MoDoo9chM2jh
         e+PgzS3fY6Hvvz44w9qFc4cc1Wv4Le4K4TWjq0SPPr8IbCC2nqRXKmC4pM8XzpwaEHbA
         NlS6RogYqwUx2lpM01og78+ZTpDtR9AvZX1tJctR3VCr7x7cH1rfGwnxaNvu5po9V2sc
         Yq3nWAnBu6ILjfqymzmu20UEYg//BIe5dUQVCxXNC0EU787MVonMyPXXL5eWnvtQpg8l
         vaKA==
X-Gm-Message-State: AOAM533GsUqi4B40Hpyq1AsWt7Ev8pYcJvJ3PoXERL121EWRqA27iw4l
        2Kjq1iA1n7TZI3oFu068jcWBTFDhnEaM0kjFqmkC6v+xWIad5fg6KznKtpydxVnuw77iET1XNuh
        Z9TRfgNnNOuS1PRqDGTQ9/h8wmONbILZJRw==
X-Received: by 2002:a05:6402:22ae:: with SMTP id cx14mr5841564edb.73.1602105870457;
        Wed, 07 Oct 2020 14:24:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOe0hehn5AUxB3964P2pBgCdUiprm4itDu5ioGnxdUmYgCuGjr7qlbZ8PNsLiLycB9WqIz8A==
X-Received: by 2002:a05:6402:22ae:: with SMTP id cx14mr5841548edb.73.1602105870282;
        Wed, 07 Oct 2020 14:24:30 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id q3sm2346350edt.1.2020.10.07.14.24.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2020 14:24:29 -0700 (PDT)
Subject: Re: [PATCH platform-next 0/5] platform/x86: mlx-platform: Topology
 fixes and configuration updates
To:     Vadim Pasternak <vadimp@nvidia.com>, andy.shevchenko@gmail.com,
        dvhart@infradead.org
Cc:     platform-driver-x86@vger.kernel.org
References: <20200923172053.26296-1-vadimp@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <dfaef0aa-80ac-f5ba-ae18-6273363dcee4@redhat.com>
Date:   Wed, 7 Oct 2020 23:24:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200923172053.26296-1-vadimp@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/23/20 7:20 PM, Vadim Pasternak wrote:
> The patchset provides topology fixes for power units related structure
> and extension of FAN structure with capability field.
> The patchset includes:
> Patch#1 - Removes PSU EEPROM configuration for systems class equipped
> 	  with 200x32Gb switch.
> Patch#2 - Changes topology for the next generation systems.
> Patch#3 - Updates module license to SPDX.
> Patches#4-#5 - Add capability field for core platform data structure.
> 
> Vadim Pasternak (5):
>    platform/x86: mlx-platform: Remove PSU EEPROM configuration
>    platform/x86: mlx-platform: Fix extended topology configuration for
>      power supply units
>    platform_data/mlxreg: Update module license
>    platform_data/mlxreg:  Extend core platform structure
>    platform/x86: mlx-platform: Add capability field to platform FAN
>      description

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up there once I've pushed my local branch there,
which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

