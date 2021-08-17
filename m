Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B20B9C4338F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 17 Aug 2021 01:45:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A30760EAF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 17 Aug 2021 01:45:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233319AbhHQBpf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 16 Aug 2021 21:45:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47644 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235973AbhHQBpe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 16 Aug 2021 21:45:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629164701;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=PZeGmGrsMaD6/Co8WQ/TYuFAL+84nnPg48GKrtH64yU=;
        b=bXdzx8njk7pgUraI8etp2zTCMSUZ2XH/TVx8bSgZomYqcxnHrVyAg55XQU6EbiVpfaa2/x
        BsTqtaIt/vjdt4w2dfJjx1AmXBhJgvgX6xzArfN1UwNPppSPrUOTx1UY6r7nP0oCRb/hbr
        0OAZVSHGL4aYwf6UU7CTeOA8uECYEpI=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-pSApna0kO8up5sIqqdtRXA-1; Mon, 16 Aug 2021 21:45:00 -0400
X-MC-Unique: pSApna0kO8up5sIqqdtRXA-1
Received: by mail-lf1-f71.google.com with SMTP id x3-20020a19e0030000b02903c25cedaef5so4820170lfg.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Aug 2021 18:44:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PZeGmGrsMaD6/Co8WQ/TYuFAL+84nnPg48GKrtH64yU=;
        b=dQfWZGomXwl/QfRWyJ8uc4hi24IY8Dx1GJ/y5qX01tOFLrG80+V2DOuqDP3aVphVvY
         SeRZcNGX7UWxKgQTxU3nFZV1HfJbnJJCcczLp2Bn1kgheZM3z9edQkim3CQJtH09Wze8
         iMts3V0sxUNVErjIHq0KC5aNlHDd1LJpRci7X2z/9W/D3IZTCbmddBNF6f56vdd0ywfh
         NBtgaJFj5vTv9ao80neyJRq0f5X0dvu78awJ8iA/59c6yUSIhaRMqN6U+Zs071aSn0Th
         a/gja6iQr9fKlsjcy+SjvqQ+Ew5oddVVWhVfJlJsgWPQ8n0yZXgwdNLgvFl9NAxqnW1n
         x5Ig==
X-Gm-Message-State: AOAM532fjCNPQCX2zrimC7KLtl5/vrg5QDhhGcaSr3LsYs2W9ccAJK78
        8xos8xqr5CvZox8esMcY0edm2MxYWQK9NVVeBm7e7f1raV6oaFK+NTomyznnoDKfKn94P4xORpS
        j0UGk6fsKBc6SA4EPBWwHFY4mAwgJRgeAP86S2fSun9FUD6Z/3g==
X-Received: by 2002:a05:6512:318d:: with SMTP id i13mr532986lfe.31.1629164698591;
        Mon, 16 Aug 2021 18:44:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiZVkRTEyJLmQRM/qyNStAQreMH0oRMTTQYp5pzzkGlJoI1A2/ESh2ZMQ+P0HkXauS40bxSFTIkBvYLv5sNYE=
X-Received: by 2002:a05:6512:318d:: with SMTP id i13mr532965lfe.31.1629164698326;
 Mon, 16 Aug 2021 18:44:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210816105119.704302-1-hpa@redhat.com> <20210816105119.704302-12-hpa@redhat.com>
 <bd5c2c0c7863375a0bd3c6894194f7ba70915e17.camel@intel.com>
In-Reply-To: <bd5c2c0c7863375a0bd3c6894194f7ba70915e17.camel@intel.com>
From:   Kate Hsuan <hpa@redhat.com>
Date:   Tue, 17 Aug 2021 09:44:47 +0800
Message-ID: <CAEth8oF6yUYe2v_uDFjkh__oH+fUwmZBpRftDpfdBy05xtpJeQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/20] platform/x86: intel_turbo_max_3: Move to intel sub-directory
To:     "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
Cc:     "alex.hung@canonical.com" <alex.hung@canonical.com>,
        "Ma, Maurice" <maurice.ma@intel.com>,
        "Joseph, Jithu" <jithu.joseph@intel.com>,
        "acelan.kao@canonical.com" <acelan.kao@canonical.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
        "Zha, Qipeng" <qipeng.zha@intel.com>,
        "Thomas, Sujith" <sujith.thomas@intel.com>,
        "david.e.box@linux.intel.com" <david.e.box@linux.intel.com>,
        "Dell.Client.Kernel@dell.com" <Dell.Client.Kernel@dell.com>,
        "irenic.rajneesh@gmail.com" <irenic.rajneesh@gmail.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On Mon, Aug 16, 2021 at 10:52 PM Pandruvada, Srinivas
<srinivas.pandruvada@intel.com> wrote:
>
> On Mon, 2021-08-16 at 18:51 +0800, Kate Hsuan wrote:
> > Move intel_turbo_max_3 to intel sub-directory to improve readability
> > and rename it from intel_turbo_max_3.c to turbo_max_3.c
> >
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

I'll add this to the commit message.

Kate

>
> > ---
> >  drivers/platform/x86/Kconfig                           | 10 ----------
> >  drivers/platform/x86/Makefile                          |  2 +-
> >  drivers/platform/x86/intel/Kconfig                     | 10 ++++++++++
> >  drivers/platform/x86/intel/Makefile                    |  4 ++--
> >  .../x86/{intel_turbo_max_3.c => intel/turbo_max_3.c}   |  0
> >  5 files changed, 13 insertions(+), 13 deletions(-)
> >  rename drivers/platform/x86/{intel_turbo_max_3.c =>
> > intel/turbo_max_3.c} (100%)
> >
> > diff --git a/drivers/platform/x86/Kconfig
> > b/drivers/platform/x86/Kconfig
> > index a9eb1f6e184f..666103c7f0de 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -1111,16 +1111,6 @@ config INTEL_IMR
> >
> >  source "drivers/platform/x86/intel_speed_select_if/Kconfig"
> >
> > -config INTEL_TURBO_MAX_3
> > -       bool "Intel Turbo Boost Max Technology 3.0 enumeration driver"
> > -       depends on X86_64 && SCHED_MC_PRIO
> > -       help
> > -         This driver reads maximum performance ratio of each CPU and
> > set up
> > -         the scheduler priority metrics. In this way scheduler can
> > prefer
> > -         CPU with higher performance to schedule tasks.
> > -         This driver is only required when the system is not using
> > Hardware
> > -         P-States (HWP). In HWP mode, priority can be read from ACPI
> > tables.
> > -
> >  config INTEL_UNCORE_FREQ_CONTROL
> >         tristate "Intel Uncore frequency control driver"
> >         depends on X86_64
> > diff --git a/drivers/platform/x86/Makefile
> > b/drivers/platform/x86/Makefile
> > index 0389fe12e7c0..fb39644db7f9 100644
> > --- a/drivers/platform/x86/Makefile
> > +++ b/drivers/platform/x86/Makefile
> > @@ -123,7 +123,7 @@ obj-$(CONFIG_WIRELESS_HOTKEY)               +=
> > wireless-hotkey.o
> >
> >
> >  obj-$(CONFIG_INTEL_SPEED_SELECT_INTERFACE)     +=
> > intel_speed_select_if/
> > -obj-$(CONFIG_INTEL_TURBO_MAX_3)                        +=
> > intel_turbo_max_3.o
> > +
> >  obj-$(CONFIG_INTEL_UNCORE_FREQ_CONTROL)                += intel-
> > uncore-frequency.o
> >
> >
> > diff --git a/drivers/platform/x86/intel/Kconfig
> > b/drivers/platform/x86/intel/Kconfig
> > index 83f7dc3e9506..8070804fe916 100644
> > --- a/drivers/platform/x86/intel/Kconfig
> > +++ b/drivers/platform/x86/intel/Kconfig
> > @@ -99,4 +99,14 @@ config INTEL_SMARTCONNECT
> >           Connect enabled, and if so disables it.
> >
> >
> > +config INTEL_TURBO_MAX_3
> > +       bool "Intel Turbo Boost Max Technology 3.0 enumeration driver"
> > +       depends on X86_64 && SCHED_MC_PRIO
> > +       help
> > +         This driver reads maximum performance ratio of each CPU and
> > set up
> > +         the scheduler priority metrics. In this way scheduler can
> > prefer
> > +         CPU with higher performance to schedule tasks.
> > +         This driver is only required when the system is not using
> > Hardware
> > +         P-States (HWP). In HWP mode, priority can be read from ACPI
> > tables.
> > +
> >  endif # X86_PLATFORM_DRIVERS_INTEL
> > diff --git a/drivers/platform/x86/intel/Makefile
> > b/drivers/platform/x86/intel/Makefile
> > index da8fbe87bf03..cff65fa2b1aa 100644
> > --- a/drivers/platform/x86/intel/Makefile
> > +++ b/drivers/platform/x86/intel/Makefile
> > @@ -33,5 +33,5 @@ intel-rst-
> > y                                                   := rst.o
> >  obj-$(CONFIG_INTEL_RST)                                += intel-rst.o
> >  intel-smartconnect-y                           := smartconnect.o
> >  obj-$(CONFIG_INTEL_SMARTCONNECT)               += intel-smartconnect.o
> > -
> > -
> > +intel_turbo_max_3-y                                            :=
> > turbo_max_3.o
> > +obj-$(CONFIG_INTEL_TURBO_MAX_3)                        +=
> > intel_turbo_max_3.o
> > diff --git a/drivers/platform/x86/intel_turbo_max_3.c
> > b/drivers/platform/x86/intel/turbo_max_3.c
> > similarity index 100%
> > rename from drivers/platform/x86/intel_turbo_max_3.c
> > rename to drivers/platform/x86/intel/turbo_max_3.c
>

