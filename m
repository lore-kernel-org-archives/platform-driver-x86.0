Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 074F2CDB47E
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Oct 2023 13:53:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231849AbjJRNxB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 18 Oct 2023 09:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231821AbjJRNxB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Oct 2023 09:53:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4CA7FA
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Oct 2023 06:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697637136;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GFX9IShSPBe2fXyvm6X70837bX1bjLT0aLHBwBtLkXg=;
        b=iswdjTf2C8W7uFLfKBjqdx2RNPwHC0HGnbN28gYvlWtje8wCYqhKdfBcpwdXTJ0A39IN3N
        13MbYIhStrRuF2E6bgu+T6eTNKBek/8RyB71Os6AvbSg6981Pqe8pahlhM2SxJzYa8174A
        Rh2d86qPg07YX5okmu7zfBp4aw9zmVQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-9CRUjJRdNaaYUYhL-d7eVw-1; Wed, 18 Oct 2023 09:52:13 -0400
X-MC-Unique: 9CRUjJRdNaaYUYhL-d7eVw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9ae0bf9c0b4so520012266b.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Oct 2023 06:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697637132; x=1698241932;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GFX9IShSPBe2fXyvm6X70837bX1bjLT0aLHBwBtLkXg=;
        b=TjaNsIhX/hIwvvbmvVzz/t0yXMdQc+tz2KUydaBrV0/DIrM8x5y1+jsiNOAjAyMMS1
         reZCVT9ghrxmuy26+Vz7z80JDnmo+6NqC/GGE8f+v4ek3aAUcjhlJrMLVROLLyEFLqSm
         oQAuU4oLKvaMBQh4ZKMUZSWNZGsvp7xScjCfm9zguOzxv5FiQ/3L+QpL51Fis0WfLpKV
         GbJYArYxkjTqKRoGXuwiCkp/ooFiguFde/urSHwch5YmIyueMDgVrIkbBLUPFPKHL4IV
         2W9OxfvELFA+0ONfLYVWHMUkhlCCJRJtz//fNw9/KKPoJUF7RwB524Z+sWPp6B3MFpXS
         5M9w==
X-Gm-Message-State: AOJu0Yxhaxu1Jo1gzTUn1EXSJZwJnbxnzz+Uoc3dZf/+EdMpUCp9bTfC
        haorRWyYOy5QKfMin/vH/nXfRvIUDFWHd5JAouuZXvucYh8q+y6oqjP4MB06jjezb0fhwtj1Zhi
        wQ0h+4G46hCeoZtC5Q8fyCaxS6sva0HCnOtAxlTUeXA==
X-Received: by 2002:a17:907:7ea8:b0:9b6:50cd:a222 with SMTP id qb40-20020a1709077ea800b009b650cda222mr4460311ejc.54.1697637132329;
        Wed, 18 Oct 2023 06:52:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+5Jz0h7YexjjXuaQTBG7PJ9+HODBV7/QM56iznVKWDxgKx9S8ao0g4rJdEZhG8aGCpBez1A==
X-Received: by 2002:a17:907:7ea8:b0:9b6:50cd:a222 with SMTP id qb40-20020a1709077ea800b009b650cda222mr4460302ejc.54.1697637131994;
        Wed, 18 Oct 2023 06:52:11 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id c9-20020a170906528900b009b28ad521f4sm1764772ejm.4.2023.10.18.06.52.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 06:52:11 -0700 (PDT)
Message-ID: <c5c44896-9460-1e5f-51d1-ef8fca040011@redhat.com>
Date:   Wed, 18 Oct 2023 15:52:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.7-rc1
Content-Language: en-US, nl
To:     "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     "srinivas.pandruvada@linux.intel.com" 
        <srinivas.pandruvada@linux.intel.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <8680ce83af5ed5268bb05d87c579a42a1eeb97b4.camel@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <8680ce83af5ed5268bb05d87c579a42a1eeb97b4.camel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Srinivas, Ilpo,

On 10/18/23 00:06, Pandruvada, Srinivas wrote:
> Hi Hans,
> 
> Pull request for Intel Speed Select version v1.18.

Thanks, note I'm co-maintaining the pdx86 subsys with Ilpo
now the plan is that we alternate merging patches leading up to
the next merge-window. Ilpo is taking care of merging stuff for
the 6.7 merge-window. For future intel-speed-select pull-reqs it
is probably easiest to just send it to the both of us.

Ilpo, can you take care of merging this ?

Regards,

Hans





> 
> Summary of changes:
> - CPU 0 hotplug support is deprecated in the upstream kernel. This
> causes failures during level change for several customers. So, add a
> silent workaround to use Cgroup v2, without user option.
> - Increase number of CPUs in a single request
> - Fix turbo mode enable/disable issue
> - Error handling for invalid input options
> 
> The base branch for these changes
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
> branch: review-hans
> 
> 
> The following changes since commit
> 6cb9c8637c672584d4915559001020237840acba:
> 
>   platform/x86: think-lmi: Use strreplace() to replace a character by
> nul (2023-09-21 18:31:19 +0200)
> 
> are available in the Git repository at:
> 
>   https://github.com/spandruvada/linux-kernel.git intel-sst
> 
> for you to fetch changes up to
> a590ed62269a049a72484ce617fe2f34e2da66cf:
> 
>   tools/power/x86/intel-speed-select: v1.18 release (2023-10-17
> 14:54:44 -0700)
> 
> ----------------------------------------------------------------
> Srinivas Pandruvada (8):
>       tools/power/x86/intel-speed-select: Sanitize integer arguments
>       tools/power/x86/intel-speed-select: Update help for TRL
>       tools/power/x86/intel-speed-select: turbo-mode enable disable
> swapped
>       tools/power/x86/intel-speed-select: No TRL for non compute
> domains
>       tools/power/x86/intel-speed-select: Display error for core-power
> support
>       tools/power/x86/intel-speed-select: Increase max CPUs in one
> request
>       tools/power/x86/intel-speed-select: Use cgroup isolate for CPU 0
>       tools/power/x86/intel-speed-select: v1.18 release
> 
>  tools/power/x86/intel-speed-select/isst-config.c | 213
> ++++++++++++++++++++++++++++++++++----------
>  tools/power/x86/intel-speed-select/isst-daemon.c |   3 +-
>  tools/power/x86/intel-speed-select/isst.h        |   3 +-
>  3 files changed, 168 insertions(+), 51 deletions(-)
> 
> Thanks,
> Srinivas

