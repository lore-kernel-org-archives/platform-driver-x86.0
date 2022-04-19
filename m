Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B18AC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 19 Apr 2022 22:28:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358091AbiDSWbW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 19 Apr 2022 18:31:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357933AbiDSWbV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Apr 2022 18:31:21 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13DE922512
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 Apr 2022 15:28:38 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id k29so25369486pgm.12
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 Apr 2022 15:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+kb4y1ct+D39bV4tAeLvKJMLtfqsTHYQZH4lenFOa/s=;
        b=CwsvcqUQiVh25FI4ZNK8H+0YPMBP3eJ+P3BPK5+aJX86n2oBAuo37ctouTLoufKp3t
         AR0duUflr347GoKa1+yY2PIvjEI7hepl8ldvHjU82VoBYV1IveuNNeT2qS+Bxa7Oe1Qk
         8P1ZsVi1PH1Fo9rBcHc5aVoRhxrRRSjFXZEPV+B3g9mY4z3qe6c8QOAm+cakFYC8IFLs
         OG96Ex2auEffqpTVwkIpTzSM/T7wuEzcktzOJRoL1s2lksufdzd2y9Li1HQkwA1c2jt2
         Ouj1krBuEpKLayRIU49KBi8slX2S3bxXI8AUmsjnbfr87yy/DX4QmrOeVmV/wJMbUjnb
         O94w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+kb4y1ct+D39bV4tAeLvKJMLtfqsTHYQZH4lenFOa/s=;
        b=o/3pbNMRt6MNNnUikO3CahVK/a+dha7Bti5m4+yoorv9RGqR14VgyeoTxoKFzfyP/z
         Xa4rM+0ESXYyNwx245NGrSL6CDAgLgrLZI/vMWf/7tvy4JpqbvCeSWwaZIrj3DyaWAoh
         rmxwUwrx3Oz2RUZNyH7koLN1LWyvY4TJO/ZZiv/yWs/m4SflN81eWH+jxqU8LaT1tFQ0
         H9VlbcflaeDXTRri2uhAJaBdjpvqxNY1Bkc63QqYS9LGTVWHF21tsOD/5vDcndUfSrYQ
         AXmz74f6g1l4Pqm1tBiBYrp6JgO1ZEHTazF8BVoFJC+VYG9n8Su0TXiGnz/ishum+u37
         Jpdw==
X-Gm-Message-State: AOAM530P3vqteszswlO7ZD50Yt7OJVCPsdUPakA4YwLO5ugwdKybBNFu
        IvUUh5UVoP2K3kwKVojMoUPk31KBW2M4XassaXY1kg==
X-Google-Smtp-Source: ABdhPJy4KNZkUqNaqV9vPC98/sJFh5SHFjYoQr6PyXvPfsPEpn0S6UwD0reKh4DY9t5+K8leyfzLFiBcIRHF+HKJrHs=
X-Received: by 2002:a63:1117:0:b0:399:2df0:7fb9 with SMTP id
 g23-20020a631117000000b003992df07fb9mr17107704pgl.40.1650407317523; Tue, 19
 Apr 2022 15:28:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220407191347.9681-1-jithu.joseph@intel.com> <20220419163859.2228874-1-tony.luck@intel.com>
 <20220419163859.2228874-4-tony.luck@intel.com> <Yl7npfrVTPFEIivC@kroah.com> <CAPcyv4jzscs3Dg4QN0+XHRYdekBeqy1=dRX-mWCj1OXo8jS2vQ@mail.gmail.com>
In-Reply-To: <CAPcyv4jzscs3Dg4QN0+XHRYdekBeqy1=dRX-mWCj1OXo8jS2vQ@mail.gmail.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Tue, 19 Apr 2022 15:28:26 -0700
Message-ID: <CAPcyv4hBGgN=LqY55nf2K4E1OD0n=_axri4CNSKVneStYEp6rw@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] platform/x86/intel/ifs: Create device for Intel
 IFS (In Field Scan)
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Tony Luck <tony.luck@intel.com>,
        Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        X86 ML <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Joseph, Jithu" <jithu.joseph@intel.com>,
        "Raj, Ashok" <ashok.raj@intel.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org, patches@lists.linux.dev,
        Ravi V Shankar <ravi.v.shankar@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Apr 19, 2022 at 11:09 AM Dan Williams <dan.j.williams@intel.com> wrote:
>
> On Tue, Apr 19, 2022 at 9:48 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Apr 19, 2022 at 09:38:51AM -0700, Tony Luck wrote:
> > > The initial implementation of IFS is model specific. Enumeration is
> > > via a combination of family-model-stepping and a check for a bit in the
> > > CORE_CAPABILITIES MSR.
> > >
> > > Linux has handled this lack of enumeration before with a code stub to
> > > create a device.  See arch/x86/kernel/pmem.c. Use the same approach
> > > here.
> >
> > Ick, why?  Why not just create a simple virtual device and use that?  Do
> > you really want to bind a driver to this?  Or do you already "know" the
> > only driver that you have will bind to this?
>
> With the realization that there may be multiple instances of an
> IFS-like capability going forward, and that ideally those capabilities
> would move away from a CPU capability bit to an ACPI description, then
> it seemed to me that a simulated platform_device for this is a
> reasonable fit. I.e. when / if an ACPI _HID is assigned for this
> capability the same platform_driver can be reused for those instances.

Turns out the ACPI enumeration for this may not materialize, so this
can indeed move to a simple / driver-less device.
