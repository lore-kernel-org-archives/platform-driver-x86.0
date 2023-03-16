Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ECFBC6FD19
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Mar 2023 14:21:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230271AbjCPOVx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Mar 2023 10:21:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230254AbjCPOVw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Mar 2023 10:21:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2BFD77E1B
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 07:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678976454;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=113VOl6g/Um4B9MBGyj5geqLbqYGpH05wrXrEmzMu7s=;
        b=gl/TcIEmtX/BA+dbLafZkbu2qJ4pHXVwDNVzv8OUOfIt7zQFipsA2YbHjWPKn/Yxb00v9c
        xOUazUXtmEOzIzzNFh855c5ZdPIBvmu2X8M8ET7fqKEXWztpPcbRp7lFOtpp6eIHZhfeGO
        upY1g1gONOebylHMIhA3cmgq7mZO0lY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-RyoasbIvOiGF0nZ4hPJYAw-1; Thu, 16 Mar 2023 10:20:53 -0400
X-MC-Unique: RyoasbIvOiGF0nZ4hPJYAw-1
Received: by mail-ed1-f69.google.com with SMTP id en6-20020a056402528600b004fa01232e6aso3276656edb.16
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 07:20:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678976452;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=113VOl6g/Um4B9MBGyj5geqLbqYGpH05wrXrEmzMu7s=;
        b=Y0+pep4YW5PRnUeGcoDrR3YKrvoYjSygsBbiSU1j16JWQSOSsIVcoaevUvNgWXka6W
         UmJp/Wo7FMzbUY2e5IVMI9JW0VuwTIVnVZA+EJElKKe7rBuET1ZnzxXJVDmoiLoQFIcb
         zc9sShudoasfgUCai9oIq9wqdSOVw7Wrmlh1SFVSoJnpVRbeboa3oA2lxLXnNy4AAwYr
         o/688ZGrMW9YXdWhaTshm0LSmXX976weSNtn+9PqldSr9IwFeC94jZrfyRGgsMeHjzb8
         I8Q4Ur648A9BG8fMI6pDBTk+/eGIUF9RXNbD+e48M1qCwb73jgL/hzq3TOCFd3I9LeUy
         cYEg==
X-Gm-Message-State: AO0yUKXSBYGMtMXzCi+wwXie6vBpsxWIujI+vNL5UQYJRSJXk7k1bHWw
        XJJ5cl/ZgM7cgUvoWklJMENcb0VFgsC5B1SifQdTE2jO4D3Umzsd6KYwHKN9WyNhGjUJT4XGETl
        aGsLUzWRIRwEZFlza8ADaEDSDj3z0J8b/Tbfv47QKnQ==
X-Received: by 2002:a17:907:c386:b0:92f:a00c:ee52 with SMTP id tm6-20020a170907c38600b0092fa00cee52mr4998888ejc.18.1678976452147;
        Thu, 16 Mar 2023 07:20:52 -0700 (PDT)
X-Google-Smtp-Source: AK7set8fgF6WLWQvKzCcD1oGtSffdrtuht1+wJdazGgVyWgXeqDxZyahUwz4C80eLgiLr8+PCkAdjA==
X-Received: by 2002:a17:907:c386:b0:92f:a00c:ee52 with SMTP id tm6-20020a170907c38600b0092fa00cee52mr4998871ejc.18.1678976451920;
        Thu, 16 Mar 2023 07:20:51 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id le20-20020a170906ae1400b00921c608b737sm3871820ejb.126.2023.03.16.07.20.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 07:20:51 -0700 (PDT)
Message-ID: <3e75eb2f-ff57-d7df-e189-730361a5fe66@redhat.com>
Date:   Thu, 16 Mar 2023 15:20:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 0/8] platform/x86: ISST: Use TPMI interface
Content-Language: en-US, nl
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230308070642.1727167-1-srinivas.pandruvada@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230308070642.1727167-1-srinivas.pandruvada@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/8/23 08:06, Srinivas Pandruvada wrote:
> This series implements TPMI as Intel Speed Select Technology (Intel SST)
> HW interface. TPMI has several advantages for Intel SST. This replaces
> legacy mailbox and MMIO with architectural interface over TPMI.
> 
> This improves performance for HPC type applications. One single IOCTL command
> replaces 10s of IOCTLs for mailboxes. This allowed to offer many more
> performance levels and SST configurations.
> 
> This series depends on previously posted series:
> - platform/x86/intel: Intel TPMI enumeration driver
> 
> Change History
> v2
> - Rebased on top of review-hans branch of platform-drivers-x86
> - Removed patches which are already present in this branch from the last review
> So number of patches are reduced from 12 to 8.
> - Rework patch for MSR 0x54 support
> - Use suggestion from Hans for suspend/resume callbacks
> - Add Reviewed-by and Test-by tags

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans





> Srinivas Pandruvada (8):
>   platform/x86: ISST: Add support for MSR 0x54
>   platform/x86: ISST: Enumerate TPMI SST and create framework
>   platform/x86: ISST: Parse SST MMIO and update instance
>   platform/x86: ISST: Add SST-CP support via TPMI
>   platform/x86: ISST: Add SST-PP support via TPMI
>   platform/x86: ISST: Add SST-BF support via TPMI
>   platform/x86: ISST: Add SST-TF support via TPMI
>   platform/x86: ISST: Add suspend/resume callbacks
> 
>  .../x86/intel/speed_select_if/Kconfig         |    4 +
>  .../x86/intel/speed_select_if/Makefile        |    2 +
>  .../intel/speed_select_if/isst_if_common.c    |   28 +
>  .../x86/intel/speed_select_if/isst_tpmi.c     |   72 +
>  .../intel/speed_select_if/isst_tpmi_core.c    | 1438 +++++++++++++++++
>  .../intel/speed_select_if/isst_tpmi_core.h    |   18 +
>  include/uapi/linux/isst_if.h                  |  303 ++++
>  7 files changed, 1865 insertions(+)
>  create mode 100644 drivers/platform/x86/intel/speed_select_if/isst_tpmi.c
>  create mode 100644 drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
>  create mode 100644 drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.h
> 

