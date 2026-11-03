Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717474;
	b=MELdfrFk+smylHPDf00Q1hFtYUNRu0zBtxzfc4NCloMZ4/jq7j/B5bYBqFo3LYfep2e6
	 1aqyyItgBrWXSWtm8rbuj/dP17tupCwC0M2ot106KHelZqIAbqfAPyvccEccrG9HXQ3Xe
	 6vvacapO+l92VphIo5CjSs+VvvPpy2+LExr7S2zaE/LeSh/NMVS9bT9CuJB6w4VwgjEBR
	 CI/0NZGNrCR+1S7UAyaHTr0AbcELzhgrFB53Ib+IDOYHN4IBCoQTVkvHMDUTEqYHsAZKp
	 duSg092cgnjpA7fyT9HkczZd9BH1EGkXUOzXsq7ojnZyQVV8wmmDdtzuUqB+yiqqrNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=+QAHbGfIkrbCBHLirH+s4EgYyfC/JD9ddZCnvQRVsmQ=;
	b=Dnmvz34b5fg9aL+ubrZhEJMdumCFExiVTDlnQG/rM+DmTLXI3visYw6+88rckc+Zm7aA
	 ZeMCw2wJ9e34r2jHdRaDD4xk0sRUIUVnpLbXJCCkSNJwk2RDUXRqaKGdfwjGknuTNfhhK
	 j/yQI74ps6QCSP+qKPNfUWC3XfOZvvyTLs42XlbZKjRC1DlWhDNiZ8/T5RkBVmp93XMys
	 W9cU/nu3uY413D08ZWw8G+gGkOB7IdCj3vyS2sl/HevDgOmnJ12R3jfO54tK+2xWFhtkh
	 p2bO5+P//aNWAlFhK7sRkkoPAgZrQiCaCrIKvB+u3/h/kSrTkVWqjsOs9+Kux70z0AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pv9w+Bob;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05046606A328
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Nov 2026 14:51:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05046606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pv9w+Bob
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e8fe8e343fso28622515ad.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 03 Nov 2026 06:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793717473; x=1794322273; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+QAHbGfIkrbCBHLirH+s4EgYyfC/JD9ddZCnvQRVsmQ=;
        b=Pv9w+BobZfE8xaCMxWYe/T9DgquC1p5YBkWK37sm7lTvGM/Hcec2Y1WeZAZVsymz8A
         BWyu08X6c5Cexmx01azd7/4i2Dg24sVU8hrIYGy3b5dhSKhCk8e69nLjZs9bbKs/hoaY
         nFgFjEKZQPk+JFdnMBicIzfAOvNqhs6xhigx1jj66C35rqs8jsnPK8IUHe/7TkelhQo1
         sPl405vpqsknkWUv9ggPBpcu+1PXI6AHZgNxXMS6O+0D139/0Cy8BWrgXE/cZGjFdNer
         kxiQiIe3xGGOVEv6ike+Am4ZPkh0jYfyu1HHjB5hznRPfmIbmhCN2OxMzFWUdXq9XGUz
         N+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717473; x=1794322273;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+QAHbGfIkrbCBHLirH+s4EgYyfC/JD9ddZCnvQRVsmQ=;
        b=EmSp6/khx+pq2OfiR7z23sIOpfbPQoVER9Gp4m5b2ddLb0D3hLV6cgK9G8Th65I6q6
         dc7pPZzowXoDG0CJagdp4AdWEd/JXsA4MXI99ywcdq+sG+TEh1MamS2N0tFtjLk6ed+S
         UjM2n+gyEqI/Jx0VKtn+/38AGuKHv1iwwP9C2qdimnGk8snQhTJz2RlJKC2Iwfgv5E/b
         KIZptnuADWYp3zzf0WwvhxHhxujEXWHootuGEX88u3uUWFK0PkKtPP3b2E4u3UGcf0If
         GBn7uS2dS2YDyzYY2tXAhmMTvcwt6VqF+z6kYbO/Dy92eKronjWoTA2lHW8ewQP08Qbu
         VSDg==
X-Gm-Message-State: APuU4Z/bWUE0HwNdtesdTM/uqLI2JemtMcn6FfE9ilWPh3WVABqZzmvQ
	wY96VNqlk3mKHe2JWgHH1m1rXBpS034olBvTSt0s+lmFtRcWRG6cyHKGnWOblaLU
X-Gm-Gg: AYBFou21R2CUS4ydr1oPzfTP7p1G033M8i/Waz3uRiV5a02QdJ5wJqf6t1iSR/0sfUO
	8+NZVulXeWm91W+OdLtGTnndREIXzdKALyim35Co88TcvgOTjKspDmZH14qIe7+aKI66HT6O3t4
	1jF1MiVpj67kTLoH2rMjeqdKHZXH52QLBm9wt4GPrSWKcu2pZA3lqD6bhOHnOL7PUf6tdivHUsr
	j8kL2GnYLxawtOAPJCs42/036o+zyT9zUAei+SBHMgeKak679D/JnrOUjxTzxJ/D4BrEqTiKDas
	AIIxAIqllt0GdCmLkw8BTgDoKP5AmBDulRu5AwxZCznjh23B/vIoFvwO3R32HBikC0i4h0I3+yk
	SF9E+6R4oasxCp2jZ9PNqPDSc+pWAGMGG+vfj4CuPZwqtmObSXzQ5V484dskQVU+fnJT6NxMvXJ
	RAPp+le1HLtNOBXg7fovFrPqGDb2JZrZu9Te8CXXfLnC757F08j/rV7P9OJOYihMRVmMCFb9uKO
	sCtwYSu6RjiUEbwAGojm3QCH/skXhp7x7I0cEpDBp+cV2yLP/9zc+xHIaEOC/3UnGuLKNmPw0Wt
	ebgR4U2Ld3DoIkdilH4JRaGI4p1xQ5tvjhYfKO36NpAjrTt2912bqQwRQmMhZgPeN4G0DRE4HM4
	=
X-Received: by 2002:a17:903:3b8b:b0:2e9:7ff5:544c with SMTP id d9443c01a7336-2eb3642fe87mr108969955ad.25.1793717473057;
        Tue, 03 Nov 2026 06:51:13 -0800 (PST)
Received: from ?IPV6:2408:8210:2436:950:df74:59ba:c75c:e3c5? ([2408:8210:2436:950:df74:59ba:c75c:e3c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39267b8asm42029115ad.44.2026.11.03.06.51.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 06:51:12 -0800 (PST)
Message-ID: <ccc319f4-24aa-496b-8366-fcfdbd5dbce6@gmail.com>
Date: Tue, 3 Nov 2026 22:51:02 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] platform/x86: bitland-mifs-wmi: performance profile fails
 on TIMI A30 (USB-C only)
To: okluar <okluar@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
References: <CAFbNUuJGjo5OW1JZhO=uXqk07fmzE8yo2Qibe5PoOtHCmoQXpQ@mail.gmail.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <CAFbNUuJGjo5OW1JZhO=uXqk07fmzE8yo2Qibe5PoOtHCmoQXpQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/3/26 16:41, okluar wrote:
> Hello,
>
> I am reporting an issue with the platform_profile interface on a
> USB-C-only machine.
>
> Hardware:
> - Model: TIMI A30 (Xiaomi Mi Notebook Pro X 15, 2021)
> - CPU: 11th Gen Intel(R) Core(TM) i7-11370H
> - iGPU: Intel Iris Xe Graphics
> - dGPU: NVIDIA GeForce RTX 3050 Ti Mobile
> - Charging: USB-C PD only (130W). No barrel-jack DC input.
> - Kernel: 7.3.1-1-cachyos (Arch-based)
> - Driver: bitland_mifs_wmi
>
> Problem:
> platform_profile_choices correctly lists:
> low-power balanced balanced-performance performance
>
> However, switching to performance fails, regardless of whether the
> USB-C charger is connected:
>    $ powerprofilesctl set performance
>    Failed to communicate with power-profiles-daemon: ... Failed to
> write to acpi_platform_profile:
>    Error writing '/sys/firmware/acpi/platform_profile': Operation not
> supported (15)
>
> Direct write also fails:
>    $ echo performance | sudo tee /sys/firmware/acpi/platform_profile
>    tee: /sys/firmware/acpi/platform_profile: Operation not supported
>
> Analysis:
> This appears to be the same root cause as other USB-C only models: the
> function bitland_check_performance_capability() requires
> WMI_SYSTEM_AC_CIRCULARHOLE (barrel-jack DC), which is physically
> impossible on this USB-C-only machine. The driver advertises the
> profile in choices but rejects writes in profile_set().
>
> I am happy to test any patches on this model. Please let me know if
> further ACPI tracing is needed.
>
> Thank you.

Hi, this problem is being fixed with the following patch series.

Please add your model to the quirks table before you test the patches.

Link to the patches: 
https://lore.kernel.org/all/20261028112742.674847-1-qby140326@gmail.com/


I take a look at your timi_a30_acpi.dat attachment, here's the quirk for 
your machine:

static const struct bitland_profile_entry timi_a30_profile_entries[] = {
     /* Change this information if it doesn't match your device. */
     { PLATFORM_PROFILE_LOW_POWER,   2 },
     { PLATFORM_PROFILE_BALANCED,    1 },
     { PLATFORM_PROFILE_PERFORMANCE, 0 },
};

static const struct bitland_mifs_quirks timi_a30_quirks = {
     .profile_entries = timi_a30_profile_entries,
     .num_profile_entries = ARRAY_SIZE(timi_a30_profile_entries),
     .return_code_at_end = false,
     .skip_ac_type_check = true,
};

static const struct dmi_system_id bitland_mifs_dmi_table[] = {
     {
         .matches = {
             /* Change this information if it doesn't match your device. */
             DMI_MATCH(DMI_SYS_VENDOR, "TIMI"),
             DMI_MATCH(DMI_PRODUCT_NAME, "A30"),
         },
         .driver_data = (void*)&timi_a30_quirks,
     },
     {}
};

