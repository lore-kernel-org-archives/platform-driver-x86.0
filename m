Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21BE5C7619A
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Mar 2023 13:11:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232323AbjC0NLj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Mar 2023 09:11:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbjC0NLi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Mar 2023 09:11:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50A96210D
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Mar 2023 06:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679922650;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/rJWR6N70Bb+OBzD3QtO0I9WNX7bLRShDPYahmlJY5Q=;
        b=NgDJj6tKrL1gu9a5EfdvnKd28KUkNVdXiqMsKfk09Bv0BuNa+0ULHFnCMuBm+gm0XrEGs7
        9bJvQA/hMjVVjrarTr81N+w8qVOx+5KQZOBP6YTVDcrJYLIuGTHtJhRC2861Rs1HLknPki
        jXO4YnE2GssIFkAkO0vJ7QdVKN3eaR8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-wYi7y50mNmicLzq28yij6A-1; Mon, 27 Mar 2023 09:10:49 -0400
X-MC-Unique: wYi7y50mNmicLzq28yij6A-1
Received: by mail-ed1-f69.google.com with SMTP id f15-20020a50a6cf000000b0050050d2326aso12444348edc.18
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Mar 2023 06:10:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679922648;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/rJWR6N70Bb+OBzD3QtO0I9WNX7bLRShDPYahmlJY5Q=;
        b=AgV2gSHzabnblpZt1PZUap9Ult5YhdzXaBuINOc4IW9YnKyd+DsNdrtXiCRlSv7V5u
         T8MZpPz0hzJvOwCxsmyV1LWUxLNg5vWCbHP/A6DspMjm3OMSalKpWKaVOgQjcHuKKf6c
         R45ipDD21HLK1fmulK1VmOK9urPuSpdGBIDlsNgzRmhbtK0JFnykd4M5r3VAZZh61erW
         V3iXbIof9MFk767HSHVjpIlcumJKu+GkoEr3SIvJZ/EeIG1gStf3RajoceYs77dH7VT9
         tSl4OzIf7pEIs1djHnTjBQ+0RqSsWNJWfqqatt27QozrvY79S/7fG7pL2Tw64ekGtDct
         VPyA==
X-Gm-Message-State: AAQBX9eR6fPQX5gEIhaL3Gpq1/rfsIzT4HfDsVulEutduMj/RqkdECDp
        bCtByIDZCQJZpgLseA0mKcWw9/dkSPi0LNWxdbCQ1gMyS0bFDx7Oe9PZAAjVxrtweyrmasvQUwt
        vLxZENC0WpcSZgEKZXKUwZBJCBAHrKx8o4w==
X-Received: by 2002:a17:906:341a:b0:931:de76:c2e8 with SMTP id c26-20020a170906341a00b00931de76c2e8mr13349478ejb.9.1679922648046;
        Mon, 27 Mar 2023 06:10:48 -0700 (PDT)
X-Google-Smtp-Source: AKy350aB29/5iaE0NAyBAJvdzJkZEbWcVqIjAphp8OhATqxxdTcyJL7WxoUABN0PaPnNFhZde5qYnQ==
X-Received: by 2002:a17:906:341a:b0:931:de76:c2e8 with SMTP id c26-20020a170906341a00b00931de76c2e8mr13349458ejb.9.1679922647711;
        Mon, 27 Mar 2023 06:10:47 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id l6-20020a50d6c6000000b004af62273b66sm14534168edj.18.2023.03.27.06.10.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 06:10:46 -0700 (PDT)
Message-ID: <49a3b712-bb17-0ec8-4598-fc40ae2ba15d@redhat.com>
Date:   Mon, 27 Mar 2023 15:10:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 0/9] Add Array BIST test support to IFS
Content-Language: en-US
To:     Jithu Joseph <jithu.joseph@intel.com>, markgross@kernel.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        gregkh@linuxfoundation.org, rostedt@goodmis.org,
        ashok.raj@intel.com, tony.luck@intel.com,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        patches@lists.linux.dev, ravi.v.shankar@intel.com,
        thiago.macieira@intel.com, athenas.jimenez.gonzalez@intel.com,
        sohil.mehta@intel.com
References: <20230301015942.462799-1-jithu.joseph@intel.com>
 <20230322003359.213046-1-jithu.joseph@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230322003359.213046-1-jithu.joseph@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/22/23 01:33, Jithu Joseph wrote:
> Changes in v4
>  - Hans de Goede
>      - Separate patch 1/9 (Separate ifs_pkg_auth) from reorganize
>         driver data patch
>      - Rework patch 2/9 (Reorganize driver data) to define const
>        ifs_test_caps struct and associate its pointer to miscdevice
>        and to remove dynamic allocation for ifs_data as was done in v3
>      - Move load check from run_test_store to do_core_test()
>      - Expand ABI doc to qualify which devices support which attribrutes
>        and the device instance to test mapping
> 
> V3 submission:
> Link: https://lore.kernel.org/lkml/20230301015942.462799-1-jithu.joseph@intel.com/
> 
> Changes in v3
>  - GregKH 
>     -  Separating read-only fields from rw fields in
>        struct ifs_device (patch 1/8)
>     -  Remove the subdirectory intel_ifs/<n> for devicenode (patch 2/8)
>     -  Replaced an enum with #define (patch 4/8)
>  - Dave Hansen
>     - Remove tracing patch
>     - ifs_array_test_core() (patch 6/8)
>         - fix an initialization bug
>         - other suggested changes
>     - Use basic types in ifs_array for first two fields. (kept
>       the union to avoid type castings)
> 
> v2 submission:
> Link: https://lore.kernel.org/lkml/20230214234426.344960-1-jithu.joseph@intel.com/
> 
> Changes in v2
>  - remove duplicate initializations from ifs_array_test_core()
>    (Dave Hansen, patch 4/7)
>  - remove bit parsing from tracing fast path to tracing 
>    output (Steven Rostedt, patch 5/7)
>  - move "ATTRIBUTE_GROUPS(plat_ifs_array)" to core.c and remove
>    exporting function ifs_get_array_groups() (Greg KH, patch 3/7)
>  - Generalized doc and ABI doc (Greg KH, patches 6/7 and 7/7)
> 
> v1 submission:
> Link: https://lore.kernel.org/lkml/20230131234302.3997223-1-jithu.joseph@intel.com/
> 
> Array BIST is a new type of core test introduced under the Intel Infield
> Scan (IFS) suite of tests.
> 
> Emerald Rapids (EMR) is the first CPU to support Array BIST.
> Array BIST performs tests on some portions of the core logic such as
> caches and register files. These are different portions of the silicon
> compared to the parts tested by Scan at Field (SAF).
> 
> Unlike SAF, Array BIST doesn't require any test content to be loaded.

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




> 
> Jithu Joseph (9):
>   platform/x86/intel/ifs: Separate ifs_pkg_auth from ifs_data
>   platform/x86/intel/ifs: Reorganize driver data
>   platform/x86/intel/ifs: IFS cleanup
>   x86/include/asm/msr-index.h: Add IFS Array test bits
>   platform/x86/intel/ifs: Introduce Array Scan test to IFS
>   platform/x86/intel/ifs: Sysfs interface for Array BIST
>   platform/x86/intel/ifs: Implement Array BIST test
>   platform/x86/intel/ifs: Update IFS doc
>   Documentation/ABI: Update IFS ABI doc
> 
>  arch/x86/include/asm/msr-index.h              |  2 +
>  drivers/platform/x86/intel/ifs/ifs.h          | 68 ++++++++++----
>  drivers/platform/x86/intel/ifs/core.c         | 81 +++++++++++-----
>  drivers/platform/x86/intel/ifs/load.c         |  9 +-
>  drivers/platform/x86/intel/ifs/runtest.c      | 94 ++++++++++++++++++-
>  drivers/platform/x86/intel/ifs/sysfs.c        | 21 ++---
>  .../ABI/testing/sysfs-platform-intel-ifs      | 17 +++-
>  7 files changed, 229 insertions(+), 63 deletions(-)
> 
> 
> base-commit: e8d018dd0257f744ca50a729e3d042cf2ec9da65

