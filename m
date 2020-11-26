Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC4F1C56202
	for <platform-driver-x86@archiver.kernel.org>; Thu, 26 Nov 2020 10:45:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 600E1208CA
	for <platform-driver-x86@archiver.kernel.org>; Thu, 26 Nov 2020 10:45:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CtQ3Up2Y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731264AbgKZKov (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 26 Nov 2020 05:44:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57517 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729386AbgKZKov (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 26 Nov 2020 05:44:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606387489;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=f74I7B0oYWxV5Wlbe91BOc7t2kit6ZIk87Mc2GruqJ0=;
        b=CtQ3Up2Ypm+fNJg37OeQ4uJgJlERZvNOrCAGohgNibmAyxsxLufjPpCx6C44KBwC8sfKN6
        sX3wrXOwLchvcso9I2WK+5J75YPrO8bzlx+5c0FQLztQ0+hoTGuDg+HWn+g4y82pzTzvIy
        XH2AxRSouF9y8ZdXMrW1kr3n64Y6PPA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-4E97NfvsMTSc6BzpSWerKQ-1; Thu, 26 Nov 2020 05:44:47 -0500
X-MC-Unique: 4E97NfvsMTSc6BzpSWerKQ-1
Received: by mail-ed1-f70.google.com with SMTP id s7so877737eds.17
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2020 02:44:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=f74I7B0oYWxV5Wlbe91BOc7t2kit6ZIk87Mc2GruqJ0=;
        b=Op7byq/XlKEqZs3pcv06AGn+IBw41aBU7fR1QCNo48sKaBHWTF0EWJWRPiiwdli984
         GEqXSOi8R5xhuomPEB6VKgpEKZYbfjUSWLRwfXgTfpyu4MOfRNEk6cUPFNunaVSId5eA
         l4qTz8TXqMs6DEciEuCX6aYrtO1Y3BN0Kq3ih6coCrfI6gXs15BehUJYMf2eidNZPchE
         gGsThsmGaiFNET44H1gnzLQXLCyT7x2o2juIZAvFHIGgbeydjSMBzUrCPCCTrClwFPu2
         KqYF5bHtkQQVyvLE0b5LOE1xZ4Fc1dOnAkiBme4p+VRQsYRBfsaBWoZDJS8VCR5Or8sF
         lXNw==
X-Gm-Message-State: AOAM531+3oXJFR+MbvvILOfmye6PM5F/eXkBZ2mdTetEq2fXQkx6gp0V
        edMZnl3/JzEwrfiH8Fj8dc4wwfzPTI52rYWtSXR0sTAukjhuJazTMW2GNRrm8bHn6ViLhp3hwV2
        crxOMvRvF+om5uvtrBrmWrXg6OA9v/+relf4ioeq/8x1AWk4tNGerWo7Nn1idLr76/jE5cROdRw
        dgCwhvkzQFGw==
X-Received: by 2002:a17:907:94c6:: with SMTP id dn6mr2104470ejc.13.1606387486415;
        Thu, 26 Nov 2020 02:44:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxPnOJBMgWd0HEVl9SUT3jmZ1HXa/sGHf5+sS9raCr0gVbh2sGuByEK0SG8QghzbMibd/LupA==
X-Received: by 2002:a17:907:94c6:: with SMTP id dn6mr2104441ejc.13.1606387486155;
        Thu, 26 Nov 2020 02:44:46 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id o17sm2939501edz.10.2020.11.26.02.44.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2020 02:44:45 -0800 (PST)
Subject: Re: [PATCH 0/5] x86/platform/uv: Move UV procfs leaves to sysfs
To:     Mike Travis <mike.travis@hpe.com>,
        Justin Ernst <justin.ernst@hpe.com>,
        Mark Gross <mgross@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, Steve Wahl <steve.wahl@hpe.com>
Cc:     Dimitri Sivanich <dimitri.sivanich@hpe.com>,
        Russ Anderson <russ.anderson@hpe.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Ilya Dryomov <idryomov@gmail.com>,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20201125172907.240996-1-mike.travis@hpe.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <815f9d40-6c17-9bd3-f3c8-626d007b8597@redhat.com>
Date:   Thu, 26 Nov 2020 11:44:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201125172907.240996-1-mike.travis@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/25/20 6:29 PM, Mike Travis wrote:
> 
> Duplicate the current UV procfs leaves to the uv_sysfs driver so they show
> up under /sys/firmware/sgi_uv.  Show a 'deprecated' warning message if
> any of the old /proc/sgi_uv leaves are used.
> 
> These patches depend on the prior set sent by Justin Ernst <justin.ernst@hpe.com>
> 	x86/platform/uv: Remove existing /sys/firmware/sgi_uv/ interface
> 	x86/platform/uv: Add and export uv_bios_* functions
> 	x86/platform/uv: Add new uv_sysfs platform driver
> 	x86/platform/uv: Update ABI documentation of /sys/firmware/sgi_uv/
> 	x86/platform/uv: Update MAINTAINERS for uv_sysfs driver
> 
> Mike Travis (5):
>   x86/platform/uv: Add kernel interfaces for obtaining system info.
>   x86/platform/uv: Add sysfs leaves to replace those in procfs
>   x86/platform/uv: Add sysfs hubless leaves
>   x86/platform/uv: Add deprecated messages to /proc info leaves
>   x86/platform/uv: Update sysfs document file
> 
>  .../ABI/testing/sysfs-firmware-sgi_uv         | 16 +++++
>  arch/x86/include/asm/uv/bios.h                |  2 +
>  arch/x86/kernel/apic/x2apic_uv_x.c            | 38 +++++++++-
>  drivers/platform/x86/uv_sysfs.c               | 70 ++++++++++++++++++-
>  4 files changed, 123 insertions(+), 3 deletions(-)

This series depends on the:

[PATCH v3 0/5] x86/platform/uv: Add uv_sysfs platform driver

Series, next time when such a thing is the case, please add a note
about this to the cover letter.

Like with the "[PATCH v3 0/5] x86/platform/uv: Add uv_sysfs platform driver" series,
this series too should be merged in its entirety through the x86/tip tree (once the
other series is merged). Please also add this info to the cover letter.

I've one remark to patch 4 (which I send in a reply to that). So a v2 is going
to be necessary. Please include the above bits in the v2 cover-letter.

Regards,

Hans

