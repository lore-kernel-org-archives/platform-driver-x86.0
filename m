Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4682CC432BE
	for <platform-driver-x86@archiver.kernel.org>; Tue, 10 Aug 2021 11:44:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2191360EC0
	for <platform-driver-x86@archiver.kernel.org>; Tue, 10 Aug 2021 11:44:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240131AbhHJLoV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 10 Aug 2021 07:44:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44041 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240203AbhHJLoU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Aug 2021 07:44:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628595838;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=POv/Coih+TmbH68jiX1oKwFFmrU4E+GCK1cZ8fcdxcY=;
        b=D9EC3sBoB4hWMl2i93DQTnOd8JQjXKt+jLgI/vWdo+CdzmPB50cym/GlGjR8RxpO23GZZ0
        nW5m/hZMdfYkgd/aty4yiuLiNXm/gjtxTyLju7JNsehfJgZaOxxoGAwCsPP750Gk1tEu64
        IpkJhbfC7PGTdCGLaacgjiGgyLOQEwY=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-2t6KfCnoMO-qvBKRfVgY8w-1; Tue, 10 Aug 2021 07:43:57 -0400
X-MC-Unique: 2t6KfCnoMO-qvBKRfVgY8w-1
Received: by mail-lj1-f199.google.com with SMTP id m4-20020a2ea8840000b029018ba0baeb6eso4483679ljq.5
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Aug 2021 04:43:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=POv/Coih+TmbH68jiX1oKwFFmrU4E+GCK1cZ8fcdxcY=;
        b=QdQI6BFdaNPCIweVxSeG0Ro+AjkTQZPdMaDMWfenvhAkGbyeLm2kwVZQ2dl8adBsjf
         3SX/+oHfUQjt1tUdu2TcjC7CeX577zNXlVY0vEyxu9E4EyXJwiDDHh9WcmXBFRO6kxPm
         muWpUV1Ag5JPKpWWU6uWmOoz3K63vSrGKot0kc4V7w0SPqDeYNRsjOqeV+5WsjkCgXe6
         omB0G/IW/BScJRMDZiBv6NYWL0FJ9uxMpuEC6tKnMToVaHUphAuDUdp/xo/CLBifOdlv
         68nzNRV4qEoe5uS8Vy8+pbxri+XQx2MvwNkXZNvVtqxomC6eJymEumX8YciSReGGmBcX
         W80A==
X-Gm-Message-State: AOAM5302haxwWzeIc6MdD7P1LnzyY+U7o9fwh0drU4nAIU4H660qu8DN
        PLFyE5G7ppKRyAjRFxLCyJbD48TaK5qC6TM8Cu9nJwwVQxzpGZf6BWq2+Vnii7eYirtbz3zm2YR
        nGNkFDFcKvlKwRGF909w/j8xduFsWdjTlPYjvI3fy1IjFMrXtQg==
X-Received: by 2002:ac2:484c:: with SMTP id 12mr21647961lfy.31.1628595833810;
        Tue, 10 Aug 2021 04:43:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6D50ioyE6X0l+l4mykyWQGf5Yme/N88BVqC8wBZZQd2ykyLax+dJ9lpnUTYCPue0EfVLNwCOb4OfBjPxtsbo=
X-Received: by 2002:ac2:484c:: with SMTP id 12mr21647932lfy.31.1628595833523;
 Tue, 10 Aug 2021 04:43:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210810095832.4234-1-hpa@redhat.com> <20210810095832.4234-10-hpa@redhat.com>
 <YRJPebbK3uQBU9K8@lahna>
In-Reply-To: <YRJPebbK3uQBU9K8@lahna>
From:   Kate Hsuan <hpa@redhat.com>
Date:   Tue, 10 Aug 2021 19:43:42 +0800
Message-ID: <CAEth8oE5we991RS12AJdFHtfD4kJkzFd4A0wHdEFKkX-i6kmvg@mail.gmail.com>
Subject: Re: [PATCH 09/20] Move Intel SCU IPC of pdx86 to intel directory to
 increase readability.
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Alex Hung <alex.hung@canonical.com>,
        Sujith Thomas <sujith.thomas@intel.com>,
        Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
        David E Box <david.e.box@intel.com>,
        Zha Qipeng <qipeng.zha@intel.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        AceLan Kao <acelan.kao@canonical.com>,
        Jithu Joseph <jithu.joseph@intel.com>,
        Maurice Ma <maurice.ma@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Daniel Scally <djrscally@gmail.com>,
        linux-kernel@vger.kernel.org, Dell.Client.Kernel@dell.com,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mika,

Thanks for your suggestion.
I'll add them to the patches and resend them again.

Thank you.

BR,
Kate

Kate Hsuan

PhD

Senior Software Engineer

Red Hat APAC

Rm. 2708, 27F., No.9, Songgao Rd., Xinyi Dist., Taipei City 110

kate.hsuan@redhat.com
M: +886-919560388



On Tue, Aug 10, 2021 at 6:06 PM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi,
>
> No objections, I think this is good idea but..
>
> On Tue, Aug 10, 2021 at 05:58:21PM +0800, Kate Hsuan wrote:
>
> .. I suggest to add proper commit message here. Many maintainers ignore
> patches that don't have one.
>
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> > ---
> >  drivers/platform/x86/Kconfig                  | 47 -----------------
> >  drivers/platform/x86/Makefile                 |  6 +--
> >  drivers/platform/x86/intel/Kconfig            |  1 +
> >  drivers/platform/x86/intel/Makefile           |  5 ++
> >  drivers/platform/x86/intel/scu/Kconfig        | 52 +++++++++++++++++++
> >  drivers/platform/x86/intel/scu/Makefile       | 11 ++++
> >  .../x86/{ => intel/scu}/intel_scu_ipc.c       |  0
> >  .../x86/{ => intel/scu}/intel_scu_ipcutil.c   |  0
> >  .../x86/{ => intel/scu}/intel_scu_pcidrv.c    |  0
> >  .../x86/{ => intel/scu}/intel_scu_pltdrv.c    |  0
> >  .../x86/{ => intel/scu}/intel_scu_wdt.c       |  0
> >  11 files changed, 70 insertions(+), 52 deletions(-)
> >  create mode 100644 drivers/platform/x86/intel/scu/Kconfig
> >  create mode 100644 drivers/platform/x86/intel/scu/Makefile
> >  rename drivers/platform/x86/{ => intel/scu}/intel_scu_ipc.c (100%)
> >  rename drivers/platform/x86/{ => intel/scu}/intel_scu_ipcutil.c (100%)
> >  rename drivers/platform/x86/{ => intel/scu}/intel_scu_pcidrv.c (100%)
> >  rename drivers/platform/x86/{ => intel/scu}/intel_scu_pltdrv.c (100%)
> >  rename drivers/platform/x86/{ => intel/scu}/intel_scu_wdt.c (100%)
>

