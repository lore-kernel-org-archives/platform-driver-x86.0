Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916566;
	b=eqmkyXZSCVvuzlaOMmUHQrHwNItj60hJp74ac4gRy3drxZOZ6n+0TRJu2suvo9R3RG/O
	 FlQO9I+nBpboeiBTV4I7BdkB34mfHyOJKK6I1/Ppge+U3Glz7PRTfh8qen+GsJDs/cV9j
	 9JtTPEpbEBXrJVLzpl1xMssExZQGSJGYduSjHH29m1jxKkw0KDR9B7cEeQggEFeXS0ufk
	 EJIOb3A2fd9le70ZnEgGyZY/pAvpZDaIhRv4e1YPzPOBzOIznJEd3uI44U/2wFiyuWLyv
	 xtgDPSonL0p9SxuDpAkdWAXSMBe76XV0fhsDpBbkYlQqRQoLa5OvVvt3CV6McuNYkHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916566;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=fCqZ0Zd4HVCI/jRgXBSCy8S8OFyXtFOLF3BsI1zh8Sg=;
	b=jXjbgQ3672WuHZQ54DBfdt0W7nOaXgh6STZ8g+xSDNttFGxM0JfZw0frLkR1/KJqdlyl
	 3dvQk/WTl5KV7/MsGgS7wHjbYnBkBVq+o2pruGvutlyju6ELmGjor9T8fR+KXjaoAgZwH
	 5FYk9CyYlmrNcyT11nRvZ9yhu+ytV9nTkN18QnGY7U8EJ+SVj7GM6b2vwMr4Xe95iXyGZ
	 USc8daD+Z9C+sqa8VBWh3KNJZ9GkKE/OFu9pMUsrKshY07Xp8HQwMD5fGUc80Vi58iTTF
	 FU/yEE1bFMGPkybO/vftPkHwdoLVRtApQdeKHIJIWFY3xq6rkNV/OMK6IP6MbUWJwjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.46
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350A0606A330
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 11:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 350A0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7d2b25786d9so3197918137.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 03:56:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794916565; x=1795521365;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fCqZ0Zd4HVCI/jRgXBSCy8S8OFyXtFOLF3BsI1zh8Sg=;
        b=NxrlLw8P8AO+EMvI2Uwhrg/GqS2w3tXLOP1qSec/XCmHQJ/28m9/r1OBEM+zGoEWK4
         yhQmfe0UL0LJNXTzfwIUCvrIShzF0yzK2jg7T84cP4wTHyvubgEDqy1HTUOf9gxASLH5
         ur9DG0Pu6Nqq6/dh4MxVAySVYECdF5T36erVFBoXVJuoSlF1Wm4KRVDIQ77ckjWMVMgy
         xE33lApuFhfqCdbVXrIA5dUWqZnEicx9AZlAbAVq9WEf7ZoxPzToRkZoXMjfBB9l+t3v
         Q2H9sFWClHGByoW6q/ZAnxtKjxVFv0Twkzfqo1JkSCHrtrTWlVquq0OYIRdmrtoWM1Z8
         IOFg==
X-Forwarded-Encrypted: i=1; AL+hErE4s0jVLSzZPxEi8am8nx1vI+6hJ1jWIh2DwAXbQKxxFk/oEbB9g/H4f0o3WaGT0RQHJ90JvqfJjRyC8ZZP4neZlFLT@vger.kernel.org
X-Gm-Message-State: APuU4Z8FYdfTumJ1f26tSN2ToHCzHwffIWmmzksAwkVR48ZM9Ge1tYft
	9s3+Qt5Jj6DvpJOLoKNbYwvwJn0gvyBMZmvsga7jWxrBRp3Fe0DGNWwOInR5N/Bt
X-Gm-Gg: AYBFou2/lpalHkoxc+GnEz/vQuQg/qsk7atE0pAQeUM1CjU4lfmZZ9oU4yupLSst5UJ
	Mhu3cCFcji81ajtRvhvIbPPJ7MuUNHgw3LziAPQBp0UccX2eeBT5KfywYBxZVk9vU4RMB2ZXgzn
	DNDyMNlSMV2+QKkM5fM8Pwl9SVAKiOZ7EpbAqHWRXo53cJUkDifrl54pZoq+D3Ous6m0g5wrDWC
	zpFk+L6f3KmJHEp87/cTPfaZ6xSTjyBYEZZkHl3Ex0Lls4O1BW4l9kRxzr1BjBvDjVcEhucY/rL
	H+Dut63fDU1fvT8gLpIQb9Fr0BAcP9NN0RT0j0rbl7EENL44SzCPt2VRDidT8eetcD3n7ZJHrEm
	H5SullvMPaPbWsqIm2VQOrH+BpViWrv8pyosfrP6WaWhPeVeW8bXZ8pTvIYveAf1T8BUXLMejH8
	Cbc/IhcZ0LdWasbHO1bI7jWM8RB2iuAUZKyr0+xYu9H1yVPPuqtetDjh6lrmAFEI7arrgi64zxs
	N/J404S0zKSU2YD80niD0H/quHsfoq+pDA7iQMokGf9VLonFIRwJUm7Kbz975+OxAF19VSlmU0l
	NGKBSLB/e9qovKS7NVZksZWyPnkpSTe3V9cgT4wHEzu+qm7xqj/IFAKCdtFWdyB1bqmAj1M=
X-Received: by 2002:a05:6102:578c:b0:7d2:c786:5a95 with SMTP id ada2fe7eead31-7d64d69dc95mr4813007137.13.1794916565039;
        Tue, 17 Nov 2026 03:56:05 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e339155f7sm1929066241.8.2026.11.17.03.56.04
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 03:56:04 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5ec6f271883so3986971e0c.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 03:56:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFhcJ2vunNcgZtgQl9hKbKTry8crYRzMgy/z7NDLaFZtXJRQ+WM8T7Mh/VHIrvQCuuaaeFmIVSp7EasnlPaRZSluhRf@vger.kernel.org
X-Received: by 2002:a05:6102:578c:b0:7d2:c786:5a95 with SMTP id
 ada2fe7eead31-7d64d69dc95mr4808481137.13.1794916104363; Tue, 17 Nov 2026
 03:48:24 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024223501.1420953-1-daniel.lezcano@oss.qualcomm.com> <20261024223501.1420953-2-daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20261024223501.1420953-2-daniel.lezcano@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Nov 2026 12:48:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXJOpcC3a6wMXF_m=uNjuqSO1Z3kyM7Az1uP_2GBurOvA@mail.gmail.com>
X-Gm-Features: Aa3M54o4xtj3bYccvEv51xwUP0A3vPBfjxtiJtpZqQUGyQco56wW9LsC221L5Po
Message-ID: <CAMuHMdXJOpcC3a6wMXF_m=uNjuqSO1Z3kyM7Az1uP_2GBurOvA@mail.gmail.com>
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

On Sun, 25 Oct 2026 at 00:56, Daniel Lezcano
<daniel.lezcano@oss.qualcomm.com> wrote:
> Platform profile providers already use device-based callbacks and do not
> need ACPI types. The core is nevertheless confined to the ACPI build and
> refuses to initialize when ACPI is disabled.
>
> Move the implementation to drivers/platform/profile and introduce the
> firmware-independent PLATFORM_PROFILE symbol. Update all provider
> selectors. Keep provider-specific ACPI dependencies and the
> platform_profile module name.
>
> Isolate access to the legacy ACPI kobject in an optional compatibility
> object linked into the same module. Retain the legacy ABI on active ACPI
> systems, and initialize the class even when ACPI is absent or disabled.
>
> Use subsys_initcall_sync so the class is ready before built-in thermal
> and CPUFreq providers, but after ACPI has initialized its compatibility
> kobject.
>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

Thanks for your patch, which is now commit 699041135f75b13a
("platform profile: Extract the core from ACPI") in pm/linux-next/

> --- a/drivers/platform/Kconfig
> +++ b/drivers/platform/Kconfig
> @@ -1,4 +1,20 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +config PLATFORM_PROFILE
> +       tristate "Platform profile support"

I guess this can be invisible (perhaps "... if COMPILE_TEST"?), as
you have updated all provider selectors?

If not, I guess this needs a "depend on X86 || COMPILE_TEST", so people
configuring kernels for different architectures do not see this option?

> +       help
> +         Provide a common sysfs interface for selecting platform power,
> +         performance and cooling profiles. Platform-specific provider drivers
> +         map their operating modes onto standard profile names, independently
> +         of the firmware interface they use.
> +
> +         The core exposes per-provider controls under /sys/class/platform-profile/.
> +         A provider driver must register before profile attributes become
> +         available. ACPI is not required; on ACPI systems the legacy system-wide
> +         interface under /sys/firmware/acpi/ is also provided.
> +
> +         To compile this as a module, choose M here: the module will be called
> +         platform_profile.
> +
>  source "drivers/platform/mips/Kconfig"
>
>  source "drivers/platform/loongarch/Kconfig"

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
