Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794934003;
	b=s7piHkl/QG3lKajQAOa1haQphwBzpTx/eWh6RE+2xYIAMGMFKpX4fWwLx25IQJJrdGZP
	 61oWUbMjNXyqx9NfowltKnB6lZHoyLITn0UyD05KPjcvIkwCRK5g7bsDyCQ8t/r+9GTq+
	 Stgn+DsOX/x4xeOAsar68IyUg//InfOj5EoLt0jtkbBT1iCLE/8g7xJ/i0PqWXmzW0nTs
	 gpRdSt1JZ7B7fbQpg4zepVHFlCaeEmaiBvnNzM9T6BNjwoMzDdJp8qufMh4qdPm/b9k6Q
	 R+D3kXSYM8YwyogkDhCDn/WrtXsgri+N3fUOc3evgXbCJmdamwzaUSzFeH9ZUV2v/2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794934003;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Z/XV0mK39zFS7JOXvDWInmC0g759RMa7DDlWP4M3P5A=;
	b=SAmxuPT0FzjF5LJ1taAYk0qgfoM8LrPwqRXsNklVMbKURnequOGKA5grR/VF0oeD5Lx5
	 BE8hyqkXawF6eGV77sSEJ32YmHeU41Q5hiMIRPXoOmPRCOgkA0iwxWlrwj6iXbnQyb6y1
	 H61YZRtTiKSechgtTGstNANbig8l4dr2WTTVu1SUm75beZtAVPQqheRJTxVeqq4HnjUwR
	 6FOW+Vti7RjKsuH67v2f3tuBScLK9/TtzIiCToG2GiW7MRPUic+vU7qTkjYx+6TeswwNk
	 cwz2hFhheK87+AT7jBHswNqHNW9AZo2cRotqiO9XVQKdYckx2DumdRCSG2EJ5imSCYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBF3606A885
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 16:46:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DBF3606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso20228a12.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 08:46:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794934003; x=1795538803;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z/XV0mK39zFS7JOXvDWInmC0g759RMa7DDlWP4M3P5A=;
        b=EMt4oqgTyCe/FEgkP4hnHlq17k159jEUpZOLLvLHWNcSCo8EogNW0+Ct/FVfBxbbDf
         xyNyvqsPezaXEtnlU9Vo9Wkv2cf+mICfhxg81KCfPKOg3ccfDMDz5LJarGyBtY1bO5kZ
         hay5u1Uxr/O61538YF1UxtibmSo4hVIGiSGOlNdak9yeoYZ54XLgKFRouZ++jBq831m7
         uzqfCsIjJsWfzUq7NXAbcHfrdh72rvrRhTtdhXUpawAKwdmh6DMwrrwda0tBeR6DLYz1
         AxKf9QK2bB/xCgAVyuT+i7+cTTOhWiByew+ekAH0SYpBCLCMN5DQSQGGtKeChCRJeV+I
         eGIw==
X-Forwarded-Encrypted: i=1; AL+hErGOjsQKnrrM/PIt6GJcEqagBxu4GqW/u3Wcbo6fJrYShYfYmgxIG8mBnYFhqwwSruw7jGDlcnGFkVxyWrOzasIZrHZd@vger.kernel.org
X-Gm-Message-State: APuU4Z+yCsWpnMEdi1SfODfSySBO9eAGvDxKFYBzImyRQqS6bkQSJRdi
	zMM+oawx1e++/nCTAjrx4BVyeyJ4ZsDJWa6Izw5PW7KBgYu635AE52R7JCHugOLj
X-Gm-Gg: AZFdTZeL9S0/Mz5s7E0YFr+RTVD974ejjVjrI0QNrufURjWCQOPtDyZ02leGoFU83f3
	uBoiS5GiiW9rqtlbz7xXB4b3dpuFJDQ+K6NVQXMk0MiRPrLv/R7JHlJ63SHUF1lAXjL582Lcc7D
	pv/4NCIVUMgoxAa5sA20BaHuyNaFqx6sqAjr5ZLpk2vmdeI+40Rf8LugIMQHe49Volv96/XzB/+
	atqf2UoYmpK8BgiOkQBoOTrwelrOhpVwoxIGz1YqqMApmb5cPvmr5MTtpYXgwEbAdGT4E7MZOXU
	8uVPY4UEXoJQH6zOVqzgFckfMQW6RR1ylPAtx/QO1Ujio1aAcyX5KPmczswleYdTZSU4LEIfPzi
	D4/AVaprNXh8T8I4CoE2j1PTC4DC6spJ+B9YiMFR2Kc7GDmtT8z3QMlFYV42LhnX0437Kz6Ude0
	yp4r0gS0nQf29Zl96VLeHQABdJKLRnq3O5HMTQCE37Jwx5TraojeKeQs72Utt0GRsQ3aEZVQN0b
	fSanOYoI2PfegZdJw2cUOef4TxJhf/ShD0H8ExGhSJCGsK0aH1ruZm3PCVaclBZJiKh7KRWPuCe
	jpLP76+3ra0/xAE9WAY+G5utCVPRs5DG+ZoMQCTvx86qZkG/ahtEnv3IPV2lljox4PWIBA==
X-Received: by 2002:a17:90b:388c:b0:3b3:b92a:aff9 with SMTP id 98e67ed59e1d1-3b3b92ab483mr2175981a91.56.1794934002668;
        Tue, 17 Nov 2026 08:46:42 -0800 (PST)
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com. [74.125.82.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abd06666sm4905476a91.5.2026.11.17.08.46.42
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 08:46:42 -0800 (PST)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso235852eec.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 08:46:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH73Kj/BJyolNGkZjl+8kAalTXQhNtvJ4ytEBj4jdKrgL1ddvg2L+xN+qZjJ40tinAKRSA2ynGnjjvmlsMya2+OnbF/@vger.kernel.org
X-Received: by 2002:a05:6102:50a4:b0:7cc:1ace:fd06 with SMTP id
 ada2fe7eead31-7d64d7a9d5amr4459124137.20.1794933540494; Tue, 17 Nov 2026
 08:39:00 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024223501.1420953-1-daniel.lezcano@oss.qualcomm.com>
 <20261024223501.1420953-2-daniel.lezcano@oss.qualcomm.com>
 <CAMuHMdXJOpcC3a6wMXF_m=uNjuqSO1Z3kyM7Az1uP_2GBurOvA@mail.gmail.com> <0de1444a-a0ba-4e16-a480-74a39c865ab6@oss.qualcomm.com>
In-Reply-To: <0de1444a-a0ba-4e16-a480-74a39c865ab6@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Nov 2026 17:38:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWfH+_4ijxko=LS_P6b1Y76WWDc8m4xL6qW1H+qKRQ98A@mail.gmail.com>
X-Gm-Features: Aa3M54oLa7UUmy4CFc0JRC-Lz0IWxEH7iP1kR67WyO7NUNvhNNuybpNvCvDbePk
Message-ID: <CAMuHMdWfH+_4ijxko=LS_P6b1Y76WWDc8m4xL6qW1H+qKRQ98A@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] platform profile: Extract the core from ACPI
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: rafael@kernel.org, Len Brown <lenb@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Armin Wolf <W_Armin@gmx.de>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jack Wu <jackbb_wu@compal.com>, 
	"Mario Limonciello (AMD)" <superm1@kernel.org>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-pm@vger.kernel.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

On Tue, 17 Nov 2026 at 17:03, Daniel Lezcano
<daniel.lezcano@oss.qualcomm.com> wrote:
> On 11/17/26 12:48, Geert Uytterhoeven wrote:
> > On Sun, 25 Oct 2026 at 00:56, Daniel Lezcano
> > <daniel.lezcano@oss.qualcomm.com> wrote:
> >> Platform profile providers already use device-based callbacks and do not
> >> need ACPI types. The core is nevertheless confined to the ACPI build and
> >> refuses to initialize when ACPI is disabled.
> >>
> >> Move the implementation to drivers/platform/profile and introduce the
> >> firmware-independent PLATFORM_PROFILE symbol. Update all provider
> >> selectors. Keep provider-specific ACPI dependencies and the
> >> platform_profile module name.
> >>
> >> Isolate access to the legacy ACPI kobject in an optional compatibility
> >> object linked into the same module. Retain the legacy ABI on active ACPI
> >> systems, and initialize the class even when ACPI is absent or disabled.
> >>
> >> Use subsys_initcall_sync so the class is ready before built-in thermal
> >> and CPUFreq providers, but after ACPI has initialized its compatibility
> >> kobject.
> >>
> >> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> >
> > Thanks for your patch, which is now commit 699041135f75b13a
> > ("platform profile: Extract the core from ACPI") in pm/linux-next/
> >
> >> --- a/drivers/platform/Kconfig
> >> +++ b/drivers/platform/Kconfig
> >> @@ -1,4 +1,20 @@
> >>   # SPDX-License-Identifier: GPL-2.0-only
> >> +config PLATFORM_PROFILE
> >> +       tristate "Platform profile support"
> >
> > I guess this can be invisible (perhaps "... if COMPILE_TEST"?), as
> > you have updated all provider selectors?
> >
> > If not, I guess this needs a "depend on X86 || COMPILE_TEST", so people
> > configuring kernels for different architectures do not see this option?
>
> The goal of this series is to make the platform profile firmware
> agnostic so it is available for all architectures

Sure... Are there any users of it on these architectures?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
