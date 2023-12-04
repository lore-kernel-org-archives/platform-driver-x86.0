Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GFn7JYTj"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D686BFD
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Dec 2023 05:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701698116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6rCxNlPEfvmUt+dMkGMRxhZZEToiC2OpKW9nSyl2Siw=;
	b=GFn7JYTj9jGRieSVH6e6JH9H0TskyUg5JPkO3qgZZ4dU+J0uyMFlxfTgkeBdkrIRiaP377
	xL6SBYkoqDOOd8hnzrubofzkyFkekpkSYmwaOyEzobKYslfVt/f1Yao2ALrCR/RD+KXJ1v
	H5zjrUIq8us+W9xB3b2sF2eyPAP8Qlg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-w0mAC4XmP5OJtJxFxxzMfQ-1; Mon, 04 Dec 2023 08:55:14 -0500
X-MC-Unique: w0mAC4XmP5OJtJxFxxzMfQ-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-54455e2a5c8so3336269a12.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Dec 2023 05:55:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701698113; x=1702302913;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6rCxNlPEfvmUt+dMkGMRxhZZEToiC2OpKW9nSyl2Siw=;
        b=FqAwZ6d5eSU1ofPK0Boz1PujuqQCp3z0xFqn5uJdBqpIeUWuWOSb+0nhgajq3jH9bp
         QySG3/gKXKz6oVK/qTPBW91/kXkAzYkV8Ea6G77VYAswxBvjx8s2U8Ibwh9VdEA40eF5
         m4WxZeTtVqcG+F+A6T4KuyhJz6aeQCeUzJsN8EFA/ZJbMFD4Focej+ByPOqoElv7PcX8
         4NNPx2gdr58GhPeSQo8E17goHRIyHwR3JkjBLkdlzukQGfx9djv+3l0gV2+5BXswGjr1
         8YG8GnxmQ5nBRwNIZ4Ojt83infqTMwMpUJDvUVx2bIFl77+TzIN0e94JGeqR/BqdEdKz
         fbWQ==
X-Gm-Message-State: AOJu0YxeUz6d4U6Ca6jmD6/JKCkkZcFtxkmgN8HX4S+ftbZUvjla9H2E
	a1kCh/VBse0xdFl3DIE5s4PvtAtTytxvBUj3ROpiHTFpfLtkYZKyhliAnWWv27atT/U4lK0YXe1
	/1K2d1rD1STTRbpWgcOn65JkXHDsMkP1lFg==
X-Received: by 2002:aa7:d514:0:b0:54c:4837:81e8 with SMTP id y20-20020aa7d514000000b0054c483781e8mr3221065edq.57.1701698113028;
        Mon, 04 Dec 2023 05:55:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGabjburkJuTgfJ3hPXztgek6vxi3EPusJdg8wu+vTwhqQVSAQljlDnjfVuDmSA7enr2HRuCw==
X-Received: by 2002:aa7:d514:0:b0:54c:4837:81e8 with SMTP id y20-20020aa7d514000000b0054c483781e8mr3221059edq.57.1701698112851;
        Mon, 04 Dec 2023 05:55:12 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id g2-20020a056402320200b0054ca3697e2csm2146885eda.25.2023.12.04.05.55.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 05:55:12 -0800 (PST)
Message-ID: <c3f7a2ba-d356-4afa-bcd2-cd10e086cb2c@redhat.com>
Date: Mon, 4 Dec 2023 14:55:11 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 00/20] intel_pmc: Add telemetry API to read counters
Content-Language: en-US
To: "David E. Box" <david.e.box@linux.intel.com>,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 ilpo.jarvinen@linux.intel.com, rajvi.jingar@linux.intel.com
References: <20231129222132.2331261-1-david.e.box@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231129222132.2331261-1-david.e.box@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/29/23 23:21, David E. Box wrote:
> On newer Intel silicon, more IP counters are being added in Intel Platform
> Monitoring Technology (PMT) telemetry spaces hosted in MMIO.  There is a
> need for the intel_pmc_core driver and other drivers to access PMT hosted
> telemetry in the kernel using an API. This patchset adds driver APIs to
> allow registering and reading telemetry entries. It makes changes to the
> intel_pmc_core driver to use these interfaces to access the low power mode
> counters that are now exclusively available from PMT.
> 
> David E. Box (15):
>   platform/x86/intel/vsec: Fix xa_alloc memory leak
>   platform/x86/intel/vsec: Remove unnecessary return
>   platform/x86/intel/vsec: Move structures to header
>   platform/x86/intel/vsec: remove platform_info from vsec device
>     structure
>   platform/x86/intel/vsec: Use cleanup.h
>   platform/x86/intel/vsec: Assign auxdev parent by argument
>   platform/x86/intel/vsec: Add base address field
>   platform/x86/intel/pmt: Add header to struct intel_pmt_entry
>   platform/x86/intel/pmt: telemetry: Export API to read telemetry
>   platform/x86/intel/pmc: Allow pmc_core_ssram_init to fail
>   platform/x86/intel/pmc: Cleanup SSRAM discovery
>   platform/x86/intel/pmc/mtl: Use return value from
>     pmc_core_ssram_init()
>   platform/x86/intel/pmc: Find and register PMC telemetry entries
>   platform/x86/intel/pmc: Add debug attribute for Die C6 counter
>   platform/x86/intel/pmc: Show Die C6 counter on Meteor Lake
> 
> Gayatri Kammela (1):
>   platform/x86/intel/vsec: Add intel_vsec_register
> 
> Rajvi Jingar (1):
>   platform/x86/intel/pmc: Display LPM requirements for multiple PMCs
> 
> Xi Pardee (3):
>   platform/x86:intel/pmc: Call pmc_get_low_power_modes from platform
>     init
>   platform/x86/intel/pmc: Retrieve LPM information using Intel PMT
>   platform/x86/intel/pmc: Read low power mode requirements for MTL-M and
>     MTL-P

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> 
>  drivers/platform/x86/intel/pmc/Kconfig      |   1 +
>  drivers/platform/x86/intel/pmc/adl.c        |   2 +
>  drivers/platform/x86/intel/pmc/cnp.c        |   2 +
>  drivers/platform/x86/intel/pmc/core.c       | 185 +++++++++-----
>  drivers/platform/x86/intel/pmc/core.h       |  10 +-
>  drivers/platform/x86/intel/pmc/core_ssram.c | 265 +++++++++++++++++---
>  drivers/platform/x86/intel/pmc/icl.c        |  10 +-
>  drivers/platform/x86/intel/pmc/mtl.c        |  87 ++++++-
>  drivers/platform/x86/intel/pmc/spt.c        |  10 +-
>  drivers/platform/x86/intel/pmc/tgl.c        |   1 +
>  drivers/platform/x86/intel/pmt/class.c      |  43 +++-
>  drivers/platform/x86/intel/pmt/class.h      |  30 ++-
>  drivers/platform/x86/intel/pmt/crashlog.c   |   2 +-
>  drivers/platform/x86/intel/pmt/telemetry.c  | 193 +++++++++++++-
>  drivers/platform/x86/intel/pmt/telemetry.h  | 126 ++++++++++
>  drivers/platform/x86/intel/vsec.c           | 131 +++++-----
>  drivers/platform/x86/intel/vsec.h           |  45 +++-
>  17 files changed, 939 insertions(+), 204 deletions(-)
>  create mode 100644 drivers/platform/x86/intel/pmt/telemetry.h
> 
> 
> base-commit: b85ea95d086471afb4ad062012a4d73cd328fa86

