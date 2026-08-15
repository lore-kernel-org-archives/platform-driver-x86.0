Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AF8377A97
	for <platform-driver-x86@vger.kernel.org>; Sat, 15 Aug 2026 13:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786799726; cv=pass; b=mKkhI7fNuAZ+sstoqf4jXM+mpYSiPyzEqBH5C6hXEp/YAbKm/K/UjNnI8FIq/ZOG6JmXzfkiHtrA9Cw2HhVz/rDTk5D2UUbJD0fVHJcqPg6RnZpwLUt9Gj6kpAzZugx3x7SlUFnF2n3RhAFSfUn2lC7NHczBbFBvHsLQvbxgedI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786799726; c=relaxed/simple;
	bh=j4ukafKiYF7aV8deIUtKadB4gijpjVQXnyE+5R/wdpw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=iR93LmmlzpzvZItWH7dPNYsiESFdNBZh2qCUZ+895newTTr5i2Q7Z71M8vNl4Tf+hSQYHvWvSK0mKqGJqiNGdXtX+E2QOrqmPTVglYMjbZsQZWbQusjt5pqIpEVXuaXgMtnon5qq7LIyRCmx/WTvR/sytAnIAgwoAa1iKoi3vzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=memooria.org; spf=pass smtp.mailfrom=memooria.org; dkim=pass (2048-bit key) header.d=memooria.org header.i=@memooria.org header.b=QGk0Mj9I; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=memooria.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=memooria.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=memooria.org header.i=@memooria.org header.b="QGk0Mj9I"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c1c50c1e29bso273771566b.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Aug 2026 06:15:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786799723; cv=none;
        d=google.com; s=arc-20260327;
        b=o1dAYxlqBJ8YtAHt6RJnQV19Q/B9XxICfV0ebNiXo5VDOux29rHfvM6mf1/JDXAoZg
         ThK1CI1SjpEWQpkZtBwpZ+WDuZC4kg/+uKl+PPoPfmvS5i1AO2JFx2+QW/HNFZE8xadm
         TL9nGdwPmo2xwc7QEpSVlBfSJUZG4RdjWPZqZY+dcaCQj0ReTC8RZ0am4EepolqdNiZp
         y3lkABlHZUFhEYIhZtQ/ojui7K8rzC8UjDl2hKYP8WcZc6ay6IikQa+QzRORbnKteiad
         s/KHQ5HHTVbQH9mwQ8qmJ11kMjjrigHAneRBq/r8pBHO6fmOK7VnIdS+8q31YaO6//Mc
         gArg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=vIZzbJApoj3hOa0E34ZE8HWnUwxFGwY6Fd5wo+0EJg8=;
        fh=LAtpHtVR30q6rinFeyskR7Ff9QyURHB8q3bpp5R7hcA=;
        b=CdBTThHjseyZR/7f8Wl37aKWN9nNs7Q7sRhnRfPYLJw69q+F1+fGxOurZuX+Sk9fiD
         60m+uqzIvn27NJycrV68iXfE0M5FepnbC3tIIk9EZJRri2XiPWGk3Wmp2SkDDlDKUiKg
         bwcnhBGbqrqIofnvGozT9r0HjiWlImALG7rixW091dyCuyWRwknPatRONvv40bRE1wws
         GaEAlyTrWvn9mr5coh8MWLn2pSJnAlipDCp9TKnRBBn2sp401cHa3NIIasTs9PVQ5TMD
         U3Crr7XsWEBjLYW9zQA9Wi8RZ344hSuYbYAz/lwUA37nXITTvUZf3EnY1HVNmzbFp5Hm
         dKrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=memooria.org; s=google; t=1786799723; x=1787404523; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vIZzbJApoj3hOa0E34ZE8HWnUwxFGwY6Fd5wo+0EJg8=;
        b=QGk0Mj9IXpd+Hk1SfCA4OJxYSAQ2MxDim38OuftxO/YiW8RvV0pTsIGER5GKrvBImH
         O4fKnJydJdZfjbH8XazZUN1Zwk8z1lfHCddsOLD2Ig5dbVK+totljHsyDt5C88qzmEY0
         e5VGT5YEMjxBhsQq+rw1lhC7E2vknEGQc7Uchz7+vVIPdVklPCFxNGakQrjJ/dkMq4Jh
         zDZKV3hdqDlD+8R6lqytgUxF3Vg6osEmZsFKctQMTTeSbOSCNyU7zPr4T5Z92/eSCp1o
         AoA3trSerZlYC2Rgy85FnYwCYzrQ74oq5k6gZCSO9XbIBuA9QFw/qE24Z/A6b1WLCYFd
         Wr4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786799723; x=1787404523;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vIZzbJApoj3hOa0E34ZE8HWnUwxFGwY6Fd5wo+0EJg8=;
        b=KZcYMUjuG14/qfHlSdJ7BjZ981NvWvxCSwHzBUgLA2ag08jIcDmC85BU8I/to7JgfR
         38FJ+7N7DjSwkJ1oCBF6OqBIk8SHNnbQua1Wq1Ad1xCIZyx5ETyi+2/ItPIwpZVKbEXL
         NkxvXwiZjj8Qw0a1bEhcaRvjqzC6skGWQpOxD/uj4BndRrxy+Vmaw1VIA7HnNEVoJz1w
         4rQlKJ5QdmaGNwTpyg+55nexQupLGF/tFJILHd/Sw6rF4uCS6NOtxsszspO/EGjYNvtr
         svsmPBhEHO31cOs9MW4tpfrMoT9BXZXxLXr4ihwUX3b2XoOSd2ub16Nm/TZepOGKAyY0
         b8RQ==
X-Gm-Message-State: AOJu0YxCUlmh2+cH+rSJrg1O7GFghNeb1iFwXkn+gtYc1xV2RfSOCaML
	wpQ1xgJTOs1pf8J7jzf6mefkGNkbuENORUbEbzL2byGaIPwJdfWjVU3+k63k1FWO1qM55jI4yar
	eKYBepkUs2Osi7WejHiFy0AM4RfVCQEPdxJctTVbyYFQfM/lbWoZaCmM=
X-Gm-Gg: AR+sD13h58r1TVxwBZ8IgxWello9RUPEekAqZGu2ARKS9iFlcUUG0IxRaUA+sJ/8ucq
	6lsdwoLqcDXpaM6TGxz38dDEf77YxIJrcfOl5NT+1fKJa36NuLmGzN23A5dCy/T4OeXarqiybpR
	3ZDTIRcESgdULMkNCr1kPKmeBbkNL2FjNMZciRkhzkos6nGkIJRTduqQibB00n9p4D8x8oaS5cH
	23Iz9YkL22Y0ntAzeqM6IKTmxx0Oq52JAYtEllt6g1DInzK/nOJX4ibO+dQdVQgtXBB6+Nvt7rk
	nVhxy/37rk5ANDVSYmICI5XgGachvfEzttJqQ036yj7XUzFJGKK8PA==
X-Received: by 2002:a17:906:7308:b0:c19:5a94:411e with SMTP id
 a640c23a62f3a-c212a265c12mr499444366b.15.1786799722445; Sat, 15 Aug 2026
 06:15:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Stefano Dall'Olio" <stefano.dallolio@memooria.org>
Date: Sat, 15 Aug 2026 15:15:11 +0200
X-Gm-Features: AcwNN1UHsTenimKafZuVcgajQOhQy_KmlPudTr6bSxHf3NWgtEM9g_xgTqjZLCg
Message-ID: <CAGOax8zUMxzOGg+bgmQVtVwVOMHUnpXuUS_=sqT9zcudNkjUrA@mail.gmail.com>
Subject: acer-wmi: Acer Predator PH315-54 Turbo button handled by WMI but
 model lacks DMI quirk
To: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I would like to report a possible missing DMI quirk in
drivers/platform/x86/acer-wmi.c for the Acer Predator Helios 300
PH315-54.

Hardware:

Vendor:  Acer
Product: Predator PH315-54
Board:   QX60_TLS
BIOS:    V1.15 (2023-06-29)
CPU:     Intel Core i7-11800H
GPU:     NVIDIA GeForce RTX 3070 Laptop GPU

Tested system:

Ubuntu 26.04 LTS
kernel 7.0.0-29-generic
acer_wmi built as module

The physical Turbo button above the keyboard does not activate Turbo
mode and its LED remains off.

acer_wmi loads normally:

acer_wmi: Acer Laptop ACPI-WMI Extras
acer_wmi: Function bitmap for Communication Button: 0x801

The system exposes an Acer WMI hotkeys input device and the Acer
gaming WMI interfaces are present.

The relevant module parameters are:

force_series=0
force_caps=-1
ec_raw_mode=N
cycle_gaming_thermal_profile=Y
predator_v4=N

No platform_profile interface is exposed.

I traced the Turbo button using a kprobe on the actual compiled
acer_toggle_turbo symbol:

acer_toggle_turbo.isra.0 [acer_wmi]

Every physical press of the Turbo button reaches this function. In one
test, 11 button presses produced exactly 11 kprobe hits with zero
misses:

acer_turbo    11    0

A kretprobe also showed that acer_toggle_turbo.isra.0 returned 0 on
every tested press.

Therefore the hardware button, firmware WMI notification and acer_wmi
event handling path appear to work correctly.

I then inspected the acer-wmi.ko shipped with the running Ubuntu
kernel. It contains:

Acer Predator PH315-53
Predator PH315-53
quirk_acer_predator_ph315_53

but there is no PH315-54 DMI entry.

The PH315-53 quirk appears particularly relevant because it enables:

.turbo = 1
.cpu_fans = 1
.gpu_fans = 1

The PH315-54 is the following generation of the same Predator Helios
300 family and has the physical Predator Turbo button.

A possible candidate would therefore be to add a PH315-54 DMI match
using the existing quirk_acer_predator_ph315_53, e.g. conceptually:

{
    .callback = dmi_matched,
    .ident = "Acer Predator PH315-54",
    .matches = {
        DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
        DMI_MATCH(DMI_PRODUCT_NAME, "Predator PH315-54"),
    },
    .driver_data = &quirk_acer_predator_ph315_53,
},

I have not loaded or functionally tested this proposed quirk, because
I preferred not to maintain an out-of-tree kernel module merely for
the Turbo button. I am therefore reporting this as a possible missing
hardware quirk rather than claiming the above patch is proven correct.

I can provide additional WMI traces, DMI information, ACPI tables or
test a maintainer-provided patch if useful.

Regards,
Stefano Dall'Olio


-- 
_
Stefano Dall'Olio
IT Manager

M stefano.dallolio@memooria.org
W www.memooria.org

Memooria srl impresa sociale
Corso Cavour 56, 41121 Modena (MO)
p.iva 01636220194 (SDI: USAL8PV) - tel/fax +39 02 37904002
