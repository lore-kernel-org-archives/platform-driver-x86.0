Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CFF5C678D4
	for <platform-driver-x86@archiver.kernel.org>; Tue,  7 Mar 2023 11:07:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230351AbjCGLH4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 7 Mar 2023 06:07:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230381AbjCGLHc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 7 Mar 2023 06:07:32 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B176746E0
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Mar 2023 03:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678186936;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BDXpVQCtQOIlmzO6ioTe8cdUScPgYtXM44balfNsDNo=;
        b=hyAbnfyRZ4Zc+/sr432onc6xCq5uFMftphMtDcWA6/LJR0e57+9jRNB7gQ0kxqnvVqBNkH
        VZErMwMjBIyN5ieAUgevXhEtaA6tc0G/ScwFDrx7oS2MMhTPbnQStXkA/oESR8nnx4e+jL
        oRlG8/Egas2K2QIIK3wDiYNakVVFwbQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-340-58Pla6j8PI6zY6okIFnJZQ-1; Tue, 07 Mar 2023 06:02:15 -0500
X-MC-Unique: 58Pla6j8PI6zY6okIFnJZQ-1
Received: by mail-ed1-f70.google.com with SMTP id da22-20020a056402177600b004c60694083eso18229898edb.5
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Mar 2023 03:02:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678186934;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BDXpVQCtQOIlmzO6ioTe8cdUScPgYtXM44balfNsDNo=;
        b=E5QLqYU2KEEKa32B2u5GmAA46DDI9Zke93uAXr/Z9movVd71uaX+rAeQQ9hWXx1u12
         QFhXlP0z6W8Y7T4H/KkEndbTfvZNd2GAzfvpYj3ZHxHxFuboWUVfmzcprJRHWPaIB6e6
         2KBkrF0AB0POyKOxHRKiFxgndUIKfjDb5krWYyhgkzisSg1q22jb8+ZRWiDbZUmlYcgs
         0srWpM5BSEX8NKfH62rAIyu22NT0I70NJKbY+7dF01PfhdzxMwnjXnC6G1XSv6vgSm86
         jbC0DUV79j85JkD4H5VnBAllVg8zj6WJeqy69uu32XFggGDV32EWko7tAtNbRyENRzQV
         AQIg==
X-Gm-Message-State: AO0yUKVNtOCJ4w7cPBHvUlp9gZASub6GBJm41b5Q/DP78rruNXg/kCum
        BwooQaFZt1YebUmrhtdQ8cMgNyucJxCRNY7FGyZ/tVp2pTY9ZTlOKS4AYbilnhS9rtVPtrhhJ9F
        I0s8Zzg4oPawb/6Ip3gWm1gLWG7p3M09luw==
X-Received: by 2002:a17:907:3e91:b0:8b2:b711:5e62 with SMTP id hs17-20020a1709073e9100b008b2b7115e62mr16191503ejc.52.1678186934710;
        Tue, 07 Mar 2023 03:02:14 -0800 (PST)
X-Google-Smtp-Source: AK7set9nJRFyyMSUSPpxbJwDWUspJLFE9XgiKxOVJCQqMy9LeMgxwcewIoOUdbCS7ZKCPD2GqektIg==
X-Received: by 2002:a17:907:3e91:b0:8b2:b711:5e62 with SMTP id hs17-20020a1709073e9100b008b2b7115e62mr16191477ejc.52.1678186934456;
        Tue, 07 Mar 2023 03:02:14 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id o13-20020a1709062e8d00b008e22978b98bsm5956978eji.61.2023.03.07.03.02.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 03:02:13 -0800 (PST)
Message-ID: <d3761f4a-6945-9a7e-03e9-bf0279c6f0f2@redhat.com>
Date:   Tue, 7 Mar 2023 12:02:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 0/8] Add Array BIST test support to IFS
Content-Language: en-US, nl
To:     Jithu Joseph <jithu.joseph@intel.com>, markgross@kernel.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        gregkh@linuxfoundation.org, rostedt@goodmis.org,
        ashok.raj@intel.com, tony.luck@intel.com,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        patches@lists.linux.dev, ravi.v.shankar@intel.com,
        thiago.macieira@intel.com, athenas.jimenez.gonzalez@intel.com,
        sohil.mehta@intel.com
References: <20230214234426.344960-1-jithu.joseph@intel.com>
 <20230301015942.462799-1-jithu.joseph@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230301015942.462799-1-jithu.joseph@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Jithu,

On 3/1/23 02:59, Jithu Joseph wrote:
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

Thank you for the new version. Given all the feedback on
the previous 2 versions I'm going to wait a bit to see if more
feedback comes in before reviewing this myself.

Regards,

Hans




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
> 
> Jithu Joseph (8):
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
>  drivers/platform/x86/intel/ifs/ifs.h          | 62 +++++++++----
>  drivers/platform/x86/intel/ifs/core.c         | 92 ++++++++++++++-----
>  drivers/platform/x86/intel/ifs/load.c         |  8 +-
>  drivers/platform/x86/intel/ifs/runtest.c      | 91 +++++++++++++++++-
>  drivers/platform/x86/intel/ifs/sysfs.c        | 17 ++--
>  .../ABI/testing/sysfs-platform-intel-ifs      |  8 +-
>  7 files changed, 221 insertions(+), 59 deletions(-)
> 

