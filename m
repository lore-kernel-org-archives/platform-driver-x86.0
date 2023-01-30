Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0ECAC636CD
	for <platform-driver-x86@archiver.kernel.org>; Mon, 30 Jan 2023 13:58:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236695AbjA3N6F (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 30 Jan 2023 08:58:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236663AbjA3N6A (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 30 Jan 2023 08:58:00 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CEBB39CE6
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jan 2023 05:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675087030;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UwsCpcQb7jL16OwqaQcbrckTyYr05ltwPK/5yD4lWM0=;
        b=IDGUCrDgvW4jqXpat1V3PyWpRFWuxlS+r0VBsDeE8jv6TejhV4UWtxa59B2BhP7l1AN/xY
        Rv27DAlX/dTkSKKFiqesjj3rf+hwJUUyzmoXNgDWwA5flcq/qdKcF1BVIIUskclJb7/11P
        RvIcsVD2K4DpGIf0Txtajfs6hX8pAWE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-668-319iRFUMPzmw5C08uhzKIw-1; Mon, 30 Jan 2023 08:57:09 -0500
X-MC-Unique: 319iRFUMPzmw5C08uhzKIw-1
Received: by mail-ej1-f70.google.com with SMTP id kt9-20020a1709079d0900b00877f4df5aceso7489881ejc.21
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jan 2023 05:57:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UwsCpcQb7jL16OwqaQcbrckTyYr05ltwPK/5yD4lWM0=;
        b=L/pq5HU1zmZuuCucAmPmERqOVAzMZd4qFOf7E28nluFOGGN8vaKbLZClF+GvwRsxM7
         hffb7YMGwvYsX506vCw7uyg6Idk9lALE4cPAcrLJFrVsfe9b9I9sa+iPJDrsBvTlGwO0
         I+uiQekjjerlJSEHG1H4hvEgIwCA3lYb5RdkL3mr7vIxVMbRQpvYOq2IK11IOPqRlhmz
         B3XnURJMfNvA96pMeBBQ4B3SAHXgcggH1oQMM4q9Oir+3QF0XG9U4x3mKKgvY3tRCymg
         PLK7jYZHgyH/ROetPfRbgLkM3SLA5xvvbwnw+ZYSc2Zn/vPpGQwNFBXqOdoRoipYTV7o
         eIzQ==
X-Gm-Message-State: AFqh2koC1L/6Uu8Rhxxpf7O5WS8duKhCUd//ejcFKEhjsbuNvSXNGza5
        gFHbVmAwylZbwdm8gl2DFxW6KR0UO1nFIyqmapi1g2RMn+RXL86+taYfAt/PW5vC5gcvnsdlul1
        EgViTZQt8NDDYNLTVxIJ6yXPjh40L4t9pOA==
X-Received: by 2002:a17:906:26d7:b0:84c:a065:d723 with SMTP id u23-20020a17090626d700b0084ca065d723mr46916276ejc.44.1675087027998;
        Mon, 30 Jan 2023 05:57:07 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvu/zzxsescgEzTZLqz0M680r3UqD1mEw5dVKJYfEfxkjWQ0ZB2JS0+m1ARk4UBx9fJuNXV4w==
X-Received: by 2002:a17:906:26d7:b0:84c:a065:d723 with SMTP id u23-20020a17090626d700b0084ca065d723mr46916256ejc.44.1675087027725;
        Mon, 30 Jan 2023 05:57:07 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id p7-20020a170906b20700b0088478517830sm3333101ejz.83.2023.01.30.05.57.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 05:57:07 -0800 (PST)
Message-ID: <74aeaa7e-9620-a908-fc4c-ff5cc5221529@redhat.com>
Date:   Mon, 30 Jan 2023 14:57:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.3-rc1
Content-Language: en-US
To:     "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>
Cc:     "srinivas.pandruvada@linux.intel.com" 
        <srinivas.pandruvada@linux.intel.com>,
        "prarit@redhat.com" <prarit@redhat.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <46c25f3c9426d038ca773da56a273a03e237dc23.camel@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <46c25f3c9426d038ca773da56a273a03e237dc23.camel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/19/23 20:08, Pandruvada, Srinivas wrote:
> Hi Hans,
> 
> This release adds following change:
>     - Minor fixes for coverity static analysis
>     - Don't read cpufreq on offline CPUs
>     - SST turbo-freq enable on auto mode when user disables SMT from
>     kernel command line
>     - Fix uncore frequency display
>     - Set uncore frequency max/min limits on perf level change
> 
> Changes on top of
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86
> review-hans
> 
> The following changes since commit
> c6a41c14a9691ff356b7d3e0d8da3f9afd4b72cc:
> 
>   platform/x86: intel: punit_ipc: Drop empty platform remove function
> (2023-01-16 17:32:22 +0100)
> 
> are available in the Git repository at:
> 
>   https://github.com/spandruvada/linux-kernel.git intel-sst
> 
> for you to fetch changes up to
> 153c05bfda9914c721171b6aad35499f1507c83f:
> 
>   tools/power/x86/intel-speed-select: v1.14 release (2023-01-18
> 17:25:34 -0800)

Thank you, merged.

Note I've rebased this since our trees had diverted after you
send the pull-req.

Regards,

Hans






> 
> ----------------------------------------------------------------
> Srinivas Pandruvada (5):
>       tools/power/x86/intel-speed-select: cpufreq reads on offline CPUs
>       tools/power/x86/intel-speed-select: turbo-freq auto mode with SMT
> off
>       tools/power intel-speed-select: Fix display of uncore min
> frequency
>       tools/power/x86/intel-speed-select: Adjust uncore max/min
> frequency
>       tools/power/x86/intel-speed-select: v1.14 release
> 
> Zhang Rui (6):
>       tools/power/x86/intel-speed-select: Remove wrong check in
> set_isst_id()
>       tools/power/x86/intel-speed-select: Remove unused non_block flag
>       tools/power/x86/intel-speed-select: Handle open() failure case
>       tools/power/x86/intel-speed-select: Remove duplicate dup()
>       tools/power/x86/intel-speed-select: Use null-terminated string
>       tools/power/x86/intel-speed-select: Add Emerald Rapid quirk
> 
>  tools/power/x86/intel-speed-select/hfi-events.c   |  4 ----
>  tools/power/x86/intel-speed-select/isst-config.c  | 82
> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----
>  tools/power/x86/intel-speed-select/isst-core.c    | 24
> +++++++++++++++++++
>  tools/power/x86/intel-speed-select/isst-daemon.c  |  3 +--
>  tools/power/x86/intel-speed-select/isst-display.c | 11 +++++++--
>  tools/power/x86/intel-speed-select/isst.h         |  4 ++++
>  6 files changed, 116 insertions(+), 12 deletions(-)

