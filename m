Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 800C6C4338F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 11 Aug 2021 05:43:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F73460F11
	for <platform-driver-x86@archiver.kernel.org>; Wed, 11 Aug 2021 05:43:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234398AbhHKFoS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 11 Aug 2021 01:44:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51795 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234383AbhHKFoS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 11 Aug 2021 01:44:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628660634;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=4hIWA/ZAFS2MMOAAsU+N75I/sScSS4YfIRGrpwkpI0I=;
        b=fYx9yOA/a3Qav4Krj5/qF93HNRgStlfXm5wiODt30BhjIVBSg2CIFkscHQrE8BK3ZeyjCq
        +0k+O055RpLVQQHkv9nSJh25yY6oPPyZ3Cev5t8oT0j+XIe0zeWLp/sHPUu6kArJviGGXP
        CIP3wnOBgqCeiFyxlzcaTVzLWDlGnUY=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-2xOgm-IANgKd7nmBWo6MtQ-1; Wed, 11 Aug 2021 01:43:53 -0400
X-MC-Unique: 2xOgm-IANgKd7nmBWo6MtQ-1
Received: by mail-lf1-f72.google.com with SMTP id c22-20020a0565122396b02903baf09a3b2aso498362lfv.14
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Aug 2021 22:43:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4hIWA/ZAFS2MMOAAsU+N75I/sScSS4YfIRGrpwkpI0I=;
        b=otiEj8LEwduDDm3rOHYSq2mqOjLGedXy6q4DJy08So3nD4qWkoGKmfOLoOJh90a/A7
         B1H4pnRfXkvCi+qs++u8+VGSTye3eqyctNBvvgDXzXVmIoB9RHiMaNK9SFy1H+X8Mub1
         N7UilDmDQPmLBj6HCmiPYYYGg0J+EhQRmAoMvVdXxMto1b2I1+oyWHBjbHwD4n3ISZzI
         ecIYAqQvpKWGa4SGbLayKLCOE0DkcnrkBshvEPxutmWLtkPF5HVfwVLvzFArIfxwCxOs
         JkpYy0r39YkuZA1t50yQI8PB6oy+g3wged1R08hvbSn3FY3bw9s0PJKRTqSghznThTPY
         U00Q==
X-Gm-Message-State: AOAM531hc9jNNoIZhLKj4axkBGtOVDzgpfUi2xA8T1BqFtNrzz2C7dqE
        4OyfDSdFOXezDM7tHY1pv+YHWmQrTBoHIsZoq2u/Uhvv10bCfS+r+e8XeVpNejGdePsD+fOOlo+
        REqV5KGzHkrHiQubws+87zaPU5SNljevaoKXE5wuX3UqFx2K8xA==
X-Received: by 2002:ac2:4573:: with SMTP id k19mr1017193lfm.622.1628660631683;
        Tue, 10 Aug 2021 22:43:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyohZQmjblPe3qlUFBCjz5iykbwcJjsqfuKqDpXh/TOjU87ppME9Ue+1Uu60UjM65a7/Oiwkf4ep1bL4jQiR1k=
X-Received: by 2002:ac2:4573:: with SMTP id k19mr1017182lfm.622.1628660631321;
 Tue, 10 Aug 2021 22:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210810095832.4234-1-hpa@redhat.com> <20210810095832.4234-9-hpa@redhat.com>
 <eb2f2024e0f58cffab76d6551eec499420196617.camel@linux.intel.com>
In-Reply-To: <eb2f2024e0f58cffab76d6551eec499420196617.camel@linux.intel.com>
From:   Kate Hsuan <hpa@redhat.com>
Date:   Wed, 11 Aug 2021 13:43:40 +0800
Message-ID: <CAEth8oG9p-AZ1d21ByC-VvVDF-KKo=FHTw2pb41hK=dQE8PHvQ@mail.gmail.com>
Subject: Re: [PATCH 08/20] Move Intel P-Unit of pdx86 to intel/ directory to
 improve readability.
To:     david.e.box@linux.intel.com
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Alex Hung <alex.hung@canonical.com>,
        Sujith Thomas <sujith.thomas@intel.com>,
        Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
        David E Box <david.e.box@intel.com>,
        Zha Qipeng <qipeng.zha@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
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

Some commit mistakes. I'll correct this.

Thank you. :)

On Wed, Aug 11, 2021 at 12:55 AM David E. Box
<david.e.box@linux.intel.com> wrote:
>
> Hi,
>
> On Tue, 2021-08-10 at 17:58 +0800, Kate Hsuan wrote:
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> > ---
> >  drivers/platform/x86/Kconfig                  | 43 -----------------
> > --
> >  drivers/platform/x86/Makefile                 |  2 +-
> >  drivers/platform/x86/intel/Kconfig            |  1 +
> >  drivers/platform/x86/intel/Makefile           |  1 +
> >  drivers/platform/x86/intel/punit/Kconfig      | 10 +++++
> >  drivers/platform/x86/intel/punit/Makefile     |  6 +++
> >  .../x86/{ => intel/punit}/intel_punit_ipc.c   |  0
> >  7 files changed, 19 insertions(+), 44 deletions(-)
> >  create mode 100644 drivers/platform/x86/intel/punit/Kconfig
> >  create mode 100644 drivers/platform/x86/intel/punit/Makefile
> >  rename drivers/platform/x86/{ => intel/punit}/intel_punit_ipc.c
> > (100%)
> >
> > diff --git a/drivers/platform/x86/Kconfig
> > b/drivers/platform/x86/Kconfig
> > index b9a324ba17e3..00fa213e9adb 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -1086,49 +1086,6 @@ config INTEL_UNCORE_FREQ_CONTROL
> >           will be called intel-uncore-frequency.
> >
> >
> > -
> > -config INTEL_PMT_CLASS
> > -       tristate
> > -       help
> > -         The Intel Platform Monitoring Technology (PMT) class driver
> > provides
> > -         the basic sysfs interface and file hierarchy used by PMT
> > devices.
> > -
> > -         For more information, see:
> > -         <file:Documentation/ABI/testing/sysfs-class-intel_pmt>
> > -
> > -         To compile this driver as a module, choose M here: the
> > module
> > -         will be called intel_pmt_class.
> > -
> > -config INTEL_PMT_TELEMETRY
> > -       tristate "Intel Platform Monitoring Technology (PMT)
> > Telemetry driver"
> > -       depends on MFD_INTEL_PMT
> > -       select INTEL_PMT_CLASS
> > -       help
> > -         The Intel Platform Monitory Technology (PMT) Telemetry
> > driver provides
> > -         access to hardware telemetry metrics on devices that
> > support the
> > -         feature.
> > -
> > -         To compile this driver as a module, choose M here: the
> > module
> > -         will be called intel_pmt_telemetry.
> > -
> > -config INTEL_PMT_CRASHLOG
> > -       tristate "Intel Platform Monitoring Technology (PMT) Crashlog
> > driver"
> > -       depends on MFD_INTEL_PMT
> > -       select INTEL_PMT_CLASS
> > -       help
> > -         The Intel Platform Monitoring Technology (PMT) crashlog
> > driver provides
> > -         access to hardware crashlog capabilities on devices that
> > support the
> > -         feature.
> > -
> > -         To compile this driver as a module, choose M here: the
> > module
> > -         will be called intel_pmt_crashlog.
> > -
>
> Accidentally caught the above configs not part of P-Unit IPC driver.
>
> > -config INTEL_PUNIT_IPC
> > -       tristate "Intel P-Unit IPC Driver"
> > -       help
> > -         This driver provides support for Intel P-Unit Mailbox IPC
> > mechanism,
> > -         which is used to bridge the communications between kernel
> > and P-Unit.
> > -
> >  config INTEL_SCU_IPC
> >         bool
> >
> > diff --git a/drivers/platform/x86/Makefile
> > b/drivers/platform/x86/Makefile
> > index 1310b1ebc3f0..dbb62085e7f9 100644
> > --- a/drivers/platform/x86/Makefile
> > +++ b/drivers/platform/x86/Makefile
> > @@ -124,7 +124,7 @@ obj-
> > $(CONFIG_INTEL_UNCORE_FREQ_CONTROL)             += intel-uncore-
> > frequency.o
> >
> >
> >
> > -obj-$(CONFIG_INTEL_PUNIT_IPC)          += intel_punit_ipc.o
> > +
> >  obj-$(CONFIG_INTEL_SCU_IPC)            += intel_scu_ipc.o
> >  obj-$(CONFIG_INTEL_SCU_PCI)            += intel_scu_pcidrv.o
> >  obj-$(CONFIG_INTEL_SCU_PLATFORM)       += intel_scu_pltdrv.o
> > diff --git a/drivers/platform/x86/intel/Kconfig
> > b/drivers/platform/x86/intel/Kconfig
> > index 38bfca25940d..189a34226fe0 100644
> > --- a/drivers/platform/x86/intel/Kconfig
> > +++ b/drivers/platform/x86/intel/Kconfig
> > @@ -26,6 +26,7 @@ source
> > "drivers/platform/x86/intel/chtdc_ti/Kconfig"
> >  source "drivers/platform/x86/intel/mrfld/Kconfig"
> >  source "drivers/platform/x86/intel/pmc_core/Kconfig"
> >  source "drivers/platform/x86/intel/pmt/Kconfig"
> > +source "drivers/platform/x86/intel/punit/Kconfig"
> >
> >
> >  endif # X86_PLATFORM_DRIVERS_INTEL
> > diff --git a/drivers/platform/x86/intel/Makefile
> > b/drivers/platform/x86/intel/Makefile
> > index 746bee1db055..9bd49a920900 100644
> > --- a/drivers/platform/x86/intel/Makefile
> > +++ b/drivers/platform/x86/intel/Makefile
> > @@ -21,3 +21,4 @@ obj-$(CONFIG_INTEL_PMC_CORE)          += pmc_core/
> >  obj-$(CONFIG_INTEL_PMT_CLASS)          += pmt/
> >  obj-$(CONFIG_INTEL_PMT_TELEMETRY)      += pmt/
> >  obj-$(CONFIG_INTEL_PMT_CRASHLOG)       += pmt/
> > +obj-$(CONFIG_INTEL_PUNIT_IPC)          += punit/
> > diff --git a/drivers/platform/x86/intel/punit/Kconfig
> > b/drivers/platform/x86/intel/punit/Kconfig
> > new file mode 100644
> > index 000000000000..db56ef3bb086
> > --- /dev/null
> > +++ b/drivers/platform/x86/intel/punit/Kconfig
> > @@ -0,0 +1,10 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +#
> > +# X86 Platform Specific Drivers
> > +#
> > +
> > +config INTEL_PUNIT_IPC
> > +       tristate "Intel P-Unit IPC Driver"
> > +       help
> > +         This driver provides support for Intel P-Unit Mailbox IPC
> > mechanism,
> > +         which is used to bridge the communications between kernel
> > and P-Unit.
> > diff --git a/drivers/platform/x86/intel/punit/Makefile
> > b/drivers/platform/x86/intel/punit/Makefile
> > new file mode 100644
> > index 000000000000..f25284806f63
> > --- /dev/null
> > +++ b/drivers/platform/x86/intel/punit/Makefile
> > @@ -0,0 +1,6 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +#
> > +# X86 Platform Specific Drivers
> > +#
> > +
> > +obj-$(CONFIG_INTEL_PUNIT_IPC)          += intel_punit_ipc.o
> > \ No newline at end of file
> > diff --git a/drivers/platform/x86/intel_punit_ipc.c
> > b/drivers/platform/x86/intel/punit/intel_punit_ipc.c
> > similarity index 100%
> > rename from drivers/platform/x86/intel_punit_ipc.c
> > rename to drivers/platform/x86/intel/punit/intel_punit_ipc.c
>
>

