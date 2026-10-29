Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793247940;
	b=Hjp1wmy42IyHpY851hO2b2Dssmf4dI9F/v6HGpaxDuIUJyXX9zEaKV8ielvpU9Oc0T3n
	 v6/YG+r3SyKy5dK8XqA+twCr5hdPZ2ogJzivrFA8+TittSNT+LcJP8aZ150jSmR2nd7we
	 LzabfiG41kOxzxns4S1pRkuWY9d+vjCHiJTDtxwfn/stxFWaHUm9N+zUPhzL1jVgeU9M4
	 REzKjtxlbxvVfR3DXKvD4yH8a5u1TDcQShtTVjYxobt7cFNv5Evcl8+mpgkMVMW52lmII
	 CrSSCzYvWgwkAFDSgqnAToju5fhvdQPPmGBjPJy/ZCuTn5zS9RROIJiwFjUQ5oT0lDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793247940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=3fXRVYvbW++PyTUnd2noLbDo6UlBD22dK8wssUsMy/w=;
	b=sO1/DxWxjy+0PpFgyIcPYgmTLcKXx3tif5YyNLpUCJTzLCbEe6wFdzkaKx5ds5sJoEm2
	 sMb+4vpLwivn5glKB0uONZFpOvsfdURipagdbvmMwe33Ra6otsItoAhcIg0KFHCP2ZsLE
	 OilNxJxuUKfafzwx+wioJDu0o0kz/9+9pza5ku9RLtl+dXo2KLZ0TRVD2fb+VlaD8mMGB
	 MTVybXUt9ifoVmSNn+YErWS525HU7fN0mypiTm4ybQeYR8fYR7ZLSY3US2W5UUGOmhZeh
	 +vRsFBOw38BPDa0bmRKxVVesX50yTcIwdPGE1uoiuqPKslavHnVgqYLAX62SYEc0ExA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nBoYnxnl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFA4606A31A
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Oct 2026 04:25:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DFA4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nBoYnxnl
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so261894666b.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Oct 2026 21:25:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793247939; cv=none;
        d=google.com; s=arc-20260327;
        b=HwQR/aKK8+19y+tW76rdRl7ksRtsJ9BOQySdI4OSu8EBZfd1hL26OdZKpY/DwnZoou
         FwjBcfh8q8JBQOqJ3WgDd0r46vv3E0RGhBdfomO3bWKGa5cXdDRH8DV5MpfyPT45NoQ3
         UFrD1vPUfhFKBAOxgnuZuUKt6k8jMO6VcWg0tPdfK4OPyFPoosTWxHGoStfMmMGzDrEy
         0eJTzvF8tYvFYrHuGm+VFurILZQ+Np5lLoad8iepzS66zY8RzkvaFJl8mfiWMQ6dqVXd
         gxohTAjvPVyPbaDEN21APY8dm15H03+KKILpr2Y593u4pCCJDaSCHI1gjlQPeofUx0Un
         7CSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=3fXRVYvbW++PyTUnd2noLbDo6UlBD22dK8wssUsMy/w=;
        fh=xAJtVoKzw7q5HwIvK/YNN6Tn2TgEe8pV/uXEt9DOLw0=;
        b=fcJV/QND2keEtBza4C3Ss7J3unx+ZBsRQQVT40E1cz5yU5WS09aWj/SEhrFfMLuagG
         WaSOF2uKRwXgRhnYBaBSLd5H0XLZ4POJVSHfrh4PU3D8II1loSV0NNNDKRoXLKtu2iD6
         Cvy0LEP7CXVDRPlSKQFnE4v/tXVvSb8hglt7KpcoowuuNbsMVBSNTE4R1jwa/xOznq1e
         D1DKoe4rH9W/ZotKsx6yNWbUpWAUTuGcBED41dcngt17iDPfU2BAa2cg7e9JlApIx8zA
         U2rSJQuorytubgAoBZ7FVd+YPRcsLfUypchowYFllZ00vauPgXYsNL/zh/2pXwXK4IV+
         SoTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793247939; x=1793852739; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3fXRVYvbW++PyTUnd2noLbDo6UlBD22dK8wssUsMy/w=;
        b=nBoYnxnlRWVnF/eYUrV31vbQlVhhnUcvQjjlOTrgc0PTUL3mxrBTdZk9SEwCY9F1dF
         R8C/tKKpvKZnDgsK4FIGhr15k6Tk2B8ENOCV1o7GpXQAkMU3Ei7/IMGMg32PZq25gT7H
         JTl9VL8lRioT+zPwZXmvNEC/aLwZ5XEl6WqRtXBoqynWVV4tVEu0e2bPx6TtmvfN/06f
         y+QiCueuNDOpZSqrJBZsulx5WmvY5phrA2eDQeyfbU92Y/MMxEgLVAldL9Sfap+vVb1M
         mRx/3lMFl3x9BoluZ6+bkUHwlGhu7SqLBkliPPuG7J7KlYuzX2h1I6wgK370MsuJklcP
         /J0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793247939; x=1793852739;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3fXRVYvbW++PyTUnd2noLbDo6UlBD22dK8wssUsMy/w=;
        b=szR9bpuR9o1j8pOlqXXx7TQoPI9EwYhbr4M/THBWl5ZX/1jg4t/TDxIuWP7Cq0/kqp
         oSLj0th9T+Vv+y9Y/xWz4UCREbEC1M341g285N8XVdtKNs4Ji2bj/1dTU6HBkPL7p2rC
         37ohqgLvyV/boVmS06wkHWh/KT+CK+js85RWswrhrUGj4PHLScceqIR6m40PIYZrR3hJ
         +sW3PkJSzNAzQcNiCGl7bD9FoCM+1ZNDRg4FJbK4s+beF1QpJE5bbL+e5I4Q9lERc/4G
         +NySlx9p7hp0fbQ3QWYJ9BX5JDg5et0E/dYiNe9y/O5aV5LRHhfmoLI/8bWNGlAG0a7Q
         fILA==
X-Gm-Message-State: AFq9FYJkCx9AOscQEn3WtvVXX2EeaDnhhNTsVnuk2syuXsTMSi9Lnrwa
	XBCbMoZiIVPwoFUfIzrM2+KBP7zJ4uWojie1qJegzKI+Mj+Woom/KlOxt+B6Yd/TvmFmOb1rRrZ
	+Xc967L8kqSv6LEdZ+hHoI2kD4xGrkCV4iceQ
X-Gm-Gg: AYBFou0cNw9fZCcHcrfJ+J9kisN64Wls4qs+0MIp0nQzVcIK+WlarPQUIFpGWN3MErC
	q5U0FlcSdcs4CdhvFG4uDGaIJj8VZ0jsNbvBHKVLmfPmS1iXIMWdziO58RWocVPrvvJ4odA/bGK
	b6jSEyGPzIrYxqStE+D/YrLELDyu2DwZMmmx1+S6zAHNDcthRqe7mgwgkWxltd58zwL1sx7exnJ
	b2Lb+N45HHbpn+DGtWzeXs6UHg5WKHES6Lgm4uvBsVHTMRtpdjPNN0BV5tbsupyMvxcrILyo9PW
	YAkN0xYIiRAQ2+K4UhFmi8l+KP4NtGFJSZ0rsOIfNgBmsCDBrGogdYOL399unWORMgbHFr6Zleh
	63pd4385W5TaZWDaBCQrbuabtejDShQy0BZHpLslIRVe+JhPh3YWCmHMoA+4+5Qxitho8T2adGg
	/QKHWkYpVF9CUwi2d57tLYRzzL0kOmw/9iNFtORrvTeFCYNTRcLkGh
X-Received: by 2002:a17:907:7f92:b0:c42:2d07:4c38 with SMTP id
 a640c23a62f3a-c49bdf8252cmr355590166b.26.1793247938630; Wed, 28 Oct 2026
 21:25:38 -0700 (PDT)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Joseph Kim <wykim88@gmail.com>
Date: Wed, 28 Oct 2026 21:25:01 -0700
X-Gm-Features: AclHuK9HGkBIThvQ_Kbx-Mr5FBalXv9eaocKAW49eBaSgvyONt8O_Ws6JZ4CV44
Message-ID: <CAFAqP1u38sPN34+wQ47WwphNOrM2q9o_+917fTRJSZvSd4Kc2g@mail.gmail.com>
Subject: dell-laptop: battery charge control unavailable on XPS 13 DX13260
 (2026), tokens report location 0xffff
To: platform-driver-x86@vger.kernel.org
Cc: Dell.Client.Kernel@dell.com, pali@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On the 2026 Dell XPS 13 (DMI product name "XPS 13 DX13260", BIOS 1.6.0,
kernel 7.2.8), the dell-laptop battery charge control attributes are
created but don't work:

/sys/class/power_supply/BAT0/charge_types -> EIO
/sys/class/power_supply/BAT0/charge_control_start_threshold -> ENXIO
/sys/class/power_supply/BAT0/charge_control_end_threshold -> ENXIO

The battery tokens are present in the dell-smbios token table, but all
of them report location 0xffff and value 0:

0x0341 0x0342 0x0343 0x0346 0x0347 0x0349 0x034a -> location 0000ffff

Most of the ~900 tokens on this BIOS have location 0xffff. Charge mode
and Custom start/stop thresholds can be set in BIOS setup (currently
Custom 80/90) and are enforced by firmware, but there is no way to read
or change them from the OS.

dell-wmi-sysman does not load ("No such device"), so there is no
firmware-attributes interface either. These WMI GUIDs are present with
no driver bound:

1F13AB7F-6220-4210-8F8E-8BB5E71EE969
2BC49DEF-7B15-4F05-8BB7-EE37B9547C0B
A6FEA33E-DABF-46F5-BFC8-460D961BEC9F

Dell Command | Configure 5.1.0 (cctk) also fails to query
PrimaryBattChargeCfg on this machine.

Is battery charge configuration exposed through a different interface
on this platform (possibly one of the GUIDs above), or is this something
a future BIOS update will add to the SMBIOS token interface? Happy to
test patches or provide dumps (bmof, token table, acpidump).

(Resending from my personal address in plain text; an earlier copy went
out from contact@inkas.org with an HTML part by mistake.)

Thanks,
Joseph
