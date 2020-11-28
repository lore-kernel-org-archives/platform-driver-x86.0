Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6698C83016
	for <platform-driver-x86@archiver.kernel.org>; Sat, 28 Nov 2020 22:17:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B5EDD21D40
	for <platform-driver-x86@archiver.kernel.org>; Sat, 28 Nov 2020 22:17:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="faTVOUeG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388856AbgK1Vtq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 28 Nov 2020 16:49:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37475 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1733242AbgK1SAs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 28 Nov 2020 13:00:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606586361;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4oHr7RZ6Qkbar7LjprzctLhseTfmkP0PXD4abO+7grA=;
        b=faTVOUeGozeTI1Ilnhhn5qFG8Jlm57V95vuDmpiyLWNec4IxDi05stbvBwy1VI3tE/Zbsd
        OTbX2x2r9NmLP17S2maLqiJKRfQvD1YY4IFI+A3LQ3kRkmyxKPFR3KBZaV8iejYXxi6B5v
        cl1wbRhkFGfHIKFUh85Z2OyOaq7huZg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-X5Vaz7zUOxObHg_KRJeo4w-1; Sat, 28 Nov 2020 05:57:40 -0500
X-MC-Unique: X5Vaz7zUOxObHg_KRJeo4w-1
Received: by mail-ed1-f70.google.com with SMTP id z20so1207311edl.21
        for <platform-driver-x86@vger.kernel.org>; Sat, 28 Nov 2020 02:57:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4oHr7RZ6Qkbar7LjprzctLhseTfmkP0PXD4abO+7grA=;
        b=NN3zd5Nea3pzuk7GgaJoKhcfCqn7bwg90WBd06Qxx/FJ9oxeInoZzKwnt/qjMA46/j
         PZ4WD7dIU+EseoeDfZVPFYRRPQ+U4x3RmTMyJyjhk3j0DFlBOwO3AhW4eF0SR01W2o8Q
         xRntpwHF7V6gOxgUf+mVQ6ZoLHL3Cra9ORE3PMHWgNcZpah83OdTeiSTP1T/uzfi50up
         RyZ/9PbtJsEHvt35LrhVx5Y8+oTVMaT8JesfMzClYZ9lOiELHG+LGGbsvL9KQwedocji
         plcwKnZqPGWWwtwIZejdXNQ70eCYRez9MfV1dcz7gAp6nJQB3PDAhfXzSzQxiOLVcvcx
         /+2w==
X-Gm-Message-State: AOAM53074hBcpoX1n6DxbQJpGkb6eZL5rRUu7ZBE9/gvvY/5Vs26q/1q
        6YQwSPnvTJHtBKzASFeHbo3H63CAk6qLSVluRFGicDx74Ki/rM4QzAroI/RthyHje2UzC4TJspq
        J2SIksbvE2pKKA4Sy7MXOTFFwMXfTJFYe330Qxn8jqF0st2hnolo3aKZHuuofnmHXJ0dqEO5RsY
        BIfXyAa+eJ4w==
X-Received: by 2002:a17:906:b307:: with SMTP id n7mr3971830ejz.102.1606561059135;
        Sat, 28 Nov 2020 02:57:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzuaaElZg+ATz7E5Mi3VYv9reMaB21XlwiQVOH4OwqCWatvZlbmY3Z/gU10f3MwTBNehUnKtA==
X-Received: by 2002:a17:906:b307:: with SMTP id n7mr3971808ejz.102.1606561058891;
        Sat, 28 Nov 2020 02:57:38 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id u23sm6034802ejc.46.2020.11.28.02.57.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Nov 2020 02:57:38 -0800 (PST)
Subject: Re: [PATCH v2 0/5] x86/platform/uv: Move UV procfs leaves to sysfs
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
References: <20201128034227.120869-1-mike.travis@hpe.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0d13eea0-c74d-4686-6eca-b5f4d012dc74@redhat.com>
Date:   Sat, 28 Nov 2020 11:57:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201128034227.120869-1-mike.travis@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/28/20 4:42 AM, Mike Travis wrote:
> 
> Duplicate the current UV procfs leaves to the uv_sysfs driver so they show
> up under /sys/firmware/sgi_uv.  Show a 'deprecated' warning message if
> any of the old /proc/sgi_uv leaves are used.
> 
> These patches depend on the prior v3 patchset sent by Justin Ernst <justin.ernst@hpe.com>
> 	x86/platform/uv: Remove existing /sys/firmware/sgi_uv/ interface
> 	x86/platform/uv: Add and export uv_bios_* functions
> 	x86/platform/uv: Add new uv_sysfs platform driver
> 	x86/platform/uv: Update ABI documentation of /sys/firmware/sgi_uv/
> 	x86/platform/uv: Update MAINTAINERS for uv_sysfs driver

AS with the previous series this series touches files under both
x86/platform and drivers/platform/x86. Like last time this is best merged
in its entirety through the x86/tip tree (which also has the previous set).
Here is my ack for the drivers/platform/x86 bits being merged through the
x86/tip tree:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans





> 
> v2: Updated to apply to v3 of dependency patch set listed above.
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
>  arch/x86/kernel/apic/x2apic_uv_x.c            | 26 ++++++-
>  drivers/platform/x86/uv_sysfs.c               | 70 ++++++++++++++++++-
>  4 files changed, 111 insertions(+), 3 deletions(-)
> 

