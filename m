Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D99D9C48BE6
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Jun 2021 18:13:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF0BA613B9
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Jun 2021 18:13:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231648AbhFPSPV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Jun 2021 14:15:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49568 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230055AbhFPSPV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Jun 2021 14:15:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623867194;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bm0IiH7MtaT1sCxdCaJY3YvNuRAnJrUlUEXfmameKws=;
        b=JdqDIBoegXjCS8lCi7/DS+vvxl4xhPVNlUWzcbMHyY+pxE4vS9yB+EQ7q15K0OF5geDVAA
        1/Wo5wB6ZU4NdFtYkozNKSa6hFi7tqL6265YCa4NCY3SqMgWU5ok/LPnFxvp7TUfU95n0s
        lnQLuzc0zUQqkAIampdDLgUYrrYgJkk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-R6HOlUsxP2G4QWFTKp5wLA-1; Wed, 16 Jun 2021 14:12:17 -0400
X-MC-Unique: R6HOlUsxP2G4QWFTKp5wLA-1
Received: by mail-ed1-f70.google.com with SMTP id f12-20020a056402150cb029038fdcfb6ea2so127079edw.14
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Jun 2021 11:12:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bm0IiH7MtaT1sCxdCaJY3YvNuRAnJrUlUEXfmameKws=;
        b=Fj1wx3KD70Fi/wqdUYhQwbpGfM1BPOJz7VPQg32SewN8B9UAk13CQgta3aTUQXuueV
         i68+KjD/FMIPF5uD2jBgxJT5of5vgQ/Xn3stBASiInpoe5b7hnf9FgsGlxR7yEQKsPdM
         uQqO/6qzCBd8+KOuGxSOV5vdXAei+/ywv/zLAjs5AlAbP2esQ9mCrP4aPa9hLTCkYRc0
         NBL7JXEeSYjjZX0/BVoEb5b2mNkS9gu8Mtk5JMf19aCHBXhIG6gjOhOmEDb9/gGzFMHJ
         3o/kTIYihMB5fKLty1HZ5mLli+LfCQbYPYYZ9ZwPtziC6DzEFHo0/4ESan2FQpcEfhZP
         NWQA==
X-Gm-Message-State: AOAM532cNusUIPc0EpmkO1HGbQQN5t43QbGw7eHk5Kv/z2i5TjCb1lJ3
        B+5n0wlJ1zFvnLGgPsXiFhLsXkltcU6bIaWpOvuXYjP42DOUs61TiFZYFXu4oj2qd89AUFjHRdn
        /nutD9Rlxo8OA8cyZpZOxg6tO5wSjARDXzFxhhIorchos3njBDxquZlhgB01ncP561vbnJv8JF6
        hqiGND33FGrA==
X-Received: by 2002:a05:6402:1c83:: with SMTP id cy3mr1222944edb.108.1623867136528;
        Wed, 16 Jun 2021 11:12:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1mVFaOYgb4wDss3idu9dlPNGastbMO5Kr+mHAKp3sUFfwqOqylR+8kQgyx6TpCWHJ3DOqXg==
X-Received: by 2002:a05:6402:1c83:: with SMTP id cy3mr1222914edb.108.1623867136303;
        Wed, 16 Jun 2021 11:12:16 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id u21sm1962834ejm.89.2021.06.16.11.12.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jun 2021 11:12:16 -0700 (PDT)
Subject: Re: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 5.14-rc1
To:     "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
Cc:     "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "srinivas.pandruvada@linux.intel.com" 
        <srinivas.pandruvada@linux.intel.com>,
        "prarit@redhat.com" <prarit@redhat.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <37f1eff940cdc2113e9d6ff9848a0165380b957d.camel@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <450ed147-995b-26fa-22f8-92640f48062b@redhat.com>
Date:   Wed, 16 Jun 2021 20:12:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <37f1eff940cdc2113e9d6ff9848a0165380b957d.camel@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/11/21 12:13 AM, Pandruvada, Srinivas wrote:
> Hi Hans,
> 
> These changes are on top of
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86/for-next
> 
> The following changes since commit
> 501f1864e6387bf0abc5d0bb22a89fdd9ed5b97f:
> 
>   platform/x86: think-lmi: Avoid potential read before start of the
> buffer (2021-06-09 17:18:25 +0200)
> 
> are available in the Git repository at:
> 
>   https://github.com/spandruvada/linux-kernel.git intel-sst
> 
> for you to fetch changes up to
> 019920d0deb06158a5ff48b5bc38a1e7c7809be5:
> 
>   tools/power/x86/intel-speed-select: v1.10 release (2021-06-10
> 14:37:28 -0700)
> 
> ----------------------------------------------------------------
> Srinivas Pandruvada (2):
>       tools/power/x86/intel-speed-select: Fix uncore memory frequency
> display
>       tools/power/x86/intel-speed-select: v1.10 release

Thank you. I've applied the 2 patches from this pull-req to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note this is rebased on top of 5.13-rc3 because I needed to merge
some immutable branches from other subsystems as deps for another
patch and one of those immutable branches was based on top of a
later 5.13-rc.

The cleanest way for me to deal with this is to base
platform-drivers-x86/review-hans and platform-drivers-x86/for-next 
on 5.13-rc3 instead.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

