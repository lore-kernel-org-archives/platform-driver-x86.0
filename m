Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C25306487
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Oct 2025 08:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761295740; cv=none; b=ElTF434T+EacxjFpo/XJUYFv4uPda5Ujcot/97OCOp/ol3zo3n8BI70q8ejVByFfNrPNwA+ymU//vDX7XgQd83OHVaO9ValCsEUgUAX691MA7VaIaeYnpZavWmAiW+6x9r44rlIuJKkyzaztl8ejWivRpuv2Grx6ZLJaxsLAsMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761295740; c=relaxed/simple;
	bh=ztHIOhEiiaqBoopvTIXqOUqJUfk2HMRNxwUoONlyffU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k53Co5VsY/niypBdPD14kG/yHVipYSM8p6IsDbvJ5s9EehIlzC/ittOzlHOCkKocpR0G0fKnaoT7uR8kDg/myL5/6f5xmK2yBVNhyZs+i3L0rqzghE6i9R9C6NKL36+vE41dRy3PLMLwykt/c8sKXJvcoob562N7dmR6VI+TJr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ePRmMW7/; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ePRmMW7/"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-592f098f656so2186153e87.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 24 Oct 2025 01:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761295736; x=1761900536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4kJQLU7HkQQtlqv3b3bm8HqvzrF9H7Chbd+Noruans=;
        b=ePRmMW7/EJ3T5kaynQgUdTh/i2uC22RIqoPAFXDGZlwofd4XUy0p/6v3MQ+o0SInzI
         Cvp8KK6C48u5s8Dx1WERvhtxR9heJtx+YOXPK34AyRjNq/kEUbeoWX41PDrWIHI3yuGZ
         YANelvWiJcZ2qlIVlnuX41GmQ1yPGoOq8eFO3+FGK9uqfS235r7mg3uwtpsDRuATos+7
         04dNIw3OiMj/xeD4uL5cWCxyPbraVB6g3pLXyARo7AzDEPuDCOXWeCOy5USm+0sJXBgN
         r2+Rdpz9/cDwBogHV+a/Lul+j2Vd+KtNuaw/ZzZrcQZu90OHsUuM3DESbtMsc092sAzY
         dqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761295736; x=1761900536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N4kJQLU7HkQQtlqv3b3bm8HqvzrF9H7Chbd+Noruans=;
        b=HMQFk/scPjtn+fCxBMu/rTe/UGyLjw91onoTkWcb0nnc1kQUAsyIxZGTN8bRvTAS6l
         S2zFUwXQSr2HPRfXcDNdxq7O5nd9EwB5YJekqoc4gwdX/bcrjpYkuuperMSGL0Wy0oeQ
         E+bq+2frJs94iUWmY+CpgHDIomFelD+61jC2jGJjLDNJgGhHzXt1BZFcR5m+8xb0KSmD
         Vrk3xqgayS4rXghXQpamR+HsaGjt5rS2rrqQJIW1WSNA3eSKV/LYlJBmnp3m9Bdt2HC9
         pdv6q8XJ2wusjJxMvJUOxw2ypwVI1Q907KOa7ZFFhcjdjCr5jkJ9+05IgW+vyum76qGO
         GY7g==
X-Forwarded-Encrypted: i=1; AJvYcCWmshXZVhuqOLKEoYN3ZvAL5fYtmRcfl+Ux0YtAFD+Q2O+d12EFVN+jS1ctn3xuf0YfLbhOLKzMFRSJ8mX7ouiy/jxQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxOXP1NTgVDwPHHlB40UsWGtFhwCrBepIDKpFyD1Dx9KnB1Q7af
	2uMsaXlH/ncDRWTPjF1aKKzmwlwzOx6L+jPvlv689Df8CX2xEXoRhASs
X-Gm-Gg: ASbGncvGc3ztrbT1cpPGm0jokmzv2oBi6yfvpStrjklWlFGTR2dtqjUKhbQPvOaLYeR
	+p0ZZYmH4u/Ix5IJZ9Fn6Sh9K+MqcX69vjb0jgYsNSKFSHYpa/HVpo+kl+x/Tg69BLpM9kBkh3q
	wxKZsYK6esgg/M6FFS72MIeY8jiLstD2ErcwNQzQVrSGbHRajN2wh034cI8uEpGk246/fmLrApS
	zwdNNgbRb/ofCLkEFJyLhouDl1sypHcU9ZJ0bl+iZiZXzdPtGeZjFx6meT99fxPIidcKGDSexq2
	LI/2E7b/zFIMBqbTs0aC/14bti+2+FWKHQGr654NTHzdQ+OQIKs4KwtaLTlbb/fs5AQn7LIgZ4c
	ai5Lp0cxVvYwLCEszcqn48GlAhSUkW4ysGasMXpWtrdOwnQ2t62NTPLc0KCoMyP3pJDT2hK3xgZ
	JtJUw8CJKBq2PEpGReWCbwnVSJK92mL2wN8Tj/Ow==
X-Google-Smtp-Source: AGHT+IESgU7Y4+mcfFfkHpukwGwbt1gtrw7F8TBkSlObe6I2/8SHRwyJCnz9Y0OqCyB02ZUjj1l7Gw==
X-Received: by 2002:a05:651c:1545:b0:378:d65a:9ceb with SMTP id 38308e7fff4ca-378d65aaa18mr14578941fa.24.1761295736186;
        Fri, 24 Oct 2025 01:48:56 -0700 (PDT)
Received: from foxbook (bey128.neoplus.adsl.tpnet.pl. [83.28.36.128])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378e8b6d2dcsm769061fa.23.2025.10.24.01.48.54
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 24 Oct 2025 01:48:55 -0700 (PDT)
Date: Fri, 24 Oct 2025 10:48:51 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Shyam-sundar.S-k@amd.com, bhelgaas@google.com, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, jdelvare@suse.com,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux@roeck-us.net, mario.limonciello@amd.com,
 naveenkrishna.chatradhi@amd.com, platform-driver-x86@vger.kernel.org,
 suma.hegde@amd.com, tony.luck@intel.com, x86@kernel.org
Subject: Re: [PATCH v3 06/12] x86/amd_nb: Use topology info to get AMD node
 count
Message-ID: <20251024104851.4d3030b0.michal.pecio@gmail.com>
In-Reply-To: <20251023190901.GA840389@yaz-khff2.amd.com>
References: <20251022011610.60d0ba6e.michal.pecio@gmail.com>
	<20251022133901.GB7243@yaz-khff2.amd.com>
	<20251022173831.671843f4.michal.pecio@gmail.com>
	<20251022160904.GA174761@yaz-khff2.amd.com>
	<20251022181856.0e3cfc92.michal.pecio@gmail.com>
	<20251023135935.GA619807@yaz-khff2.amd.com>
	<20251023170107.0cc70bad.michal.pecio@gmail.com>
	<20251023160906.GA730672@yaz-khff2.amd.com>
	<20251023202503.72987338.michal.pecio@gmail.com>
	<20251023190429.GB796848@yaz-khff2.amd.com>
	<20251023190901.GA840389@yaz-khff2.amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 23 Oct 2025 15:09:01 -0400, Yazen Ghannam wrote:
> On Thu, Oct 23, 2025 at 03:04:29PM -0400, Yazen Ghannam wrote:
> > On Thu, Oct 23, 2025 at 08:25:03PM +0200, Michal Pecio wrote:  
> > > On Thu, 23 Oct 2025 12:09:06 -0400, Yazen Ghannam wrote:  
> > > > The kernel seems to think there are 6 CPUs on your system:
> > > > 
> > > > [    0.072059] CPU topo: Allowing 4 present CPUs plus 2 hotplug CPUs  
> > > 
> > > I wonder if this code doesn't break systems which actually support
> > > hotplug, when some sockets aren't populated at boot?  
> > 
> > I don't know about other vendors, but we don't do physical CPU
> > hotplug. CPU hotplug, in this case, is there are physical CPUs
> > already in the system, but they are not enabled for whatever policy
> > decision. They could be disabled in BIOS, and so the MADT entries
> > will reflect that. Or they can be disabled by kernel parameters.

Thanks for the explanation. Looks like your patch is correct then
and we need to fix the topology somehow.

> Sorry for the rapid emails. Here's another interesting commit:
> f0551af02130 ("x86/topology: Ignore non-present APIC IDs in a present package")

I have this commit on 6.12 but it doesn't help.

As I understand, APIC ID is a bitfield of the form:

[package ID] ... [core ID] [thread ID]

In my case, per debugfs:

domain: Thread     shift: 0 dom_size:     1 max_threads:     1
domain: Core       shift: 2 dom_size:     4 max_threads:     4
domain: Module     shift: 2 dom_size:     1 max_threads:     4
domain: Tile       shift: 2 dom_size:     1 max_threads:     4
domain: Die        shift: 2 dom_size:     1 max_threads:     4
domain: DieGrp     shift: 2 dom_size:     1 max_threads:     4
domain: Package    shift: 2 dom_size:     1 max_threads:     4

So my phantom APICs simply look like another package with weird
non-sequential ID. (Probably not an ACPI spec violation yet?)

f0551af02130 only rejects disabled APICs in the same packages as
enabled ones. An earlier proposal in that thread was to reject all
disabled APICs on bare metal unless explicitly "online capable":

https://lore.kernel.org/all/87sf15ugsz.ffs@tglx/

This clearly goes against fed8d8773b8e and it seems to go against
what you wrote about AMD BIOSes potentially marking CPUs as disabled
in MADT and presumably allowing OS to wake them up with ACPI?

You asked elsewhere what happens if I online CPU5/6. I don't have
directories for them in /sys/, so not sure if I need any extra steps
to make them appear, or the kernel considers those CPUs bogus for
some reason and amd_nb could do the same?

Bitmaps from /sys/:
/sys/devices/system/cpu/enabled:0-3
/sys/devices/system/cpu/kernel_max:5
/sys/devices/system/cpu/offline:4-5
/sys/devices/system/cpu/online:0-3
/sys/devices/system/cpu/possible:0-5
/sys/devices/system/cpu/present:0-3

I tried 6.18-rc2 and it's same thing, except EDAC and GART don't work.
On both kernels, possible_cpus=4 fixes it:

[    0.072066] CPU topo: Limiting to 4 possible CPUs
[    0.072074] CPU topo: CPU limit of 4 reached. Ignoring further CPUs
[    0.072082] IOAPIC[0]: apic_id 4, version 33, address 0xfec00000, GSI 0-23
[    0.072084] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.072086] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
[    0.072089] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.072090] ACPI: HPET id: 0x8300 base: 0xfed00000
[    0.072097] CPU topo: Max. logical packages:   1
[    0.072097] CPU topo: Max. logical dies:       1
[    0.072098] CPU topo: Max. dies per package:   1
[    0.072103] CPU topo: Max. threads per core:   1
[    0.072105] CPU topo: Num. cores per package:     4
[    0.072105] CPU topo: Num. threads per package:   4
[    0.072106] CPU topo: Allowing 4 present CPUs plus 0 hotplug CPUs
[    0.072107] CPU topo: Rejected CPUs 2
