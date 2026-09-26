Received: from mail-qk2-f40.google.com (mail-qk2-f40.google.com [74.125.230.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B91227EA7
	for <platform-driver-x86@vger.kernel.org>; Sat, 26 Sep 2026 11:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.232
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790423022; cv=pass; b=JS0Rl0WSTRjJteMxTgCCDC8ceILoUwdPnZJ8BntlTaIfhtbHK8gLIRWjP5sMxgdO8Tov8Ihmz6ITuj5MabJHQnQDM0d6J/0Ik8NTFywSGt0j4S8qr+nAlUoFMOojZV/8rlCSniye+7NMHNiFGqDEVCstJm6I3DywQOocb1TBZ2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790423022; c=relaxed/simple;
	bh=T+fx8/RqtzB0nTU+tN4sHoveOh3UGYdLdkX/OaWdtE0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=af2q5GBSVXomfrJhBm54DzwFz62C5PGX5UDC2FcCJEhWR0JpmeTdkhl9eUEOT6rkH2R2APRT7cIShPSdLo2WDozZlkxBcIBGmtd9MEDxM0ZubmgZN364j5BPlubHb7SMARp7Yz/qxE/QJUQRtkH613ZhxCn44kJoj9upjaWVF5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWhvWOMi; arc=pass smtp.client-ip=74.125.230.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWhvWOMi"
Received: by mail-qk2-f40.google.com with SMTP id d75a77b69052e-5332b66b660so3009321cf.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 26 Sep 2026 04:43:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790423020; cv=none;
        d=google.com; s=arc-20260327;
        b=MA0SKKqec76eHGSJJIM/BBXQIYSzhAppV2qM42KA96BCWP6c0SbRbgfiJVB3ZwOUpV
         /UnOdAn2TJXZO2zF3yCwkGRYMkabwklxKA5SMarj95VcAnbkSh7zSog6oFJljzxWJ3Bm
         IMUMELBTvOO+sogknzxeu5usNJyzvbK0HrMx/67q8gfUzVZ0M68mS3XPieyxuDUDPIRm
         c4u0hbm6p3wpww7jUU9B7loYTEVrcHcbWGXd7LB31PO/SeWs9xFOxFtnks2hNDA1AXlG
         jxXTp9gP4gDyV1JFz1t8bdNQsysqw+MG9+3+27AqDLfjnBp28jyNeehzhwZ54At+Jq/8
         xOKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=T+fx8/RqtzB0nTU+tN4sHoveOh3UGYdLdkX/OaWdtE0=;
        fh=Q/pg7w9gdQOJlvjcJNQbn7593oi52x2y8lOnVMD8i+w=;
        b=VMMaX3OL0bXCAwXEbg0n/iz89ezEhJcCKzy2A6xOZuarxVbZEwSAhMKEMATa6CPjZ5
         TKkforBvpnZFsvK1k0ZatfuNkanftoUOMJEErNCFGbEAoD9PLmkujYooJP00mSMABRNF
         8u+BjbgJURbUan6MIrz/nV24MmUgcy/pu9E3t5xr7YSOboj6VuI1o+9cuJK+GnAuiGeb
         /g2DFdvGSIS8nBlr60jeqD72GonGNy5ByGYR689VibhWQGSeXowwEN45UaRZsgS2l7HN
         r8+oJNI8Verx/TldvVQAqDLJ63AL7zHngj0ZWGYnpz+WDjMdsCDbrg2r5ZY7Oi4QUI9L
         XAVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790423020; x=1791027820; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T+fx8/RqtzB0nTU+tN4sHoveOh3UGYdLdkX/OaWdtE0=;
        b=eWhvWOMiibs1LNcWIWg1F3Y1uPb1y2HH0x+BBhyHaZX54lr3+Z/f1Det+vsI+bZHmn
         FwYhKuFVEhbklYW0gbGf1uqZq+E1fyJyNUR4GxkrZXSJ3dAMH/91/4rd4cF4oxPR58Rj
         milnKOZQt9oeHf168wnqOAJfmCPKfUGAMXtGb/RsTArnKGEtGD59m1phW+3t0E5FwWVd
         hJrhGSXimJZ9Gue9FoUJa1PLTAzPUaEPT4uXUqBlQnRrKwxTkPDjZVgaY4Xdn+WvK0wj
         6wKi0fpQazadAIDfkoLdVwZljdGHHLiCCeRfte4TrFzzuMrWl5HdffJQIfO3dBctkMZH
         Jaew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790423020; x=1791027820;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T+fx8/RqtzB0nTU+tN4sHoveOh3UGYdLdkX/OaWdtE0=;
        b=1KlUiHIbu8s6eunG9T5/X7Bv4FUxr2Yg2enBnbjYX/MTKYYGRnQFSnIWGjIflPai1R
         cEWMTq+ixhndR94utr5V5ryWLx8u/KWIF/SKOWQU3Ylwkb3fAmjUfjtlPgBXMr3nr79D
         UJY4NU+1D+1XiNp1fE3RCez/2x3tz04PFzREEnTLpcIr8DoWB8QJAVpBmJhKixV53Q1h
         MtHUpjdMb3YYaHOyxNnRByFKvOekjPozR0fjg8dWIAfcLbYibzMkJ5IWXLPGLDUDhE+0
         7JKCZKiGnlPCjw7yJYqLnu5GDB34G8NqV0YycOzv5j1dX4Nv823J7kXEZ8aQtfchSpPC
         Xvsw==
X-Gm-Message-State: AFuF++mwzbdJbzeNnqKDLuu0aJNK9W5oPYjQ9g5DLpT/9o143jZik4kh
	bURsEr6aQzXVLg6xsu2XjlBFFlmj/kZE9diQqZKhbWF0tA9sxM3R49O95NDlaIR0eOeRF59UslX
	HespdsUizXJ0CNcPDM/W/FWv+9+hdHO/k4MF6cl0xAA==
X-Gm-Gg: AYBFou0T7BMzUX7VlEhf4ZlLVgUR2Nx0IrpNBvc2zhq8XFAZP9rAWoY0Xu62Dz1F5uY
	VeLl442MfLx4QgNvBzRaPjSXHhaRXIPybdGL4n+HDpe7p+6K43Qw0wdiTga8sXwR1V+bwpoj9kW
	H4DM6YWWfBLo/fVOWnhzEeZbQ/UeDjfAVVxQra7H/xpzpmdzE1dGYHL9Roz7+EDfxxh5giKa2f1
	iuy8zRph52s7WVmFRnQQgynDfr1eUgIY2z6B84GzSa8ciOBp1doIGPvez+ivuaJ6mNORLWx9Tex
	BaRd1xoFh+knmwv9pk+5SSIGLnMi9Skm9gGrypRYSddI/XzmgI968cTohmiZa1GhM1j30KPD/6w
	3mGwn4/T1UF+jIVNMrdhvoRNIE2VxYDrVZb/QBJDeow0WBnZUh8nUn4c/7QiK7kr0u3pmAMBOlu
	y4HWJO
X-Received: by 2002:a05:622a:480d:b0:533:2d9b:4ff6 with SMTP id
 d75a77b69052e-5332d9b52b6mr10836471cf.42.1790423020210; Sat, 26 Sep 2026
 04:43:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Leo Korotkevich <essacult@gmail.com>
Date: Sat, 26 Sep 2026 14:43:28 +0300
X-Gm-Features: AclHuK9zYRADLJXYC00IhNN_Ye59kgdqRhqJgeI8N_DPbSF3CsDCcOPa2JBk6yE
Message-ID: <CAEOLtbAPmMKTeigagR85YxjGprsoy70SorkF1WB10FbDWbkYcw@mail.gmail.com>
Subject: ASUS GU605CX / 285H: recurring freezes across kernels and power sources
To: platform-driver-x86@vger.kernel.org
Cc: luke@ljones.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

I saw this related 285H/PMC discussion:
https://www.spinics.net/lists/platform-driver-x86/msg65594.html

I have a potentially related ASUS GU605CX case: Core Ultra 9 285H
(family 6/model 197/stepping 2), BIOS 311, microcode 0x122, RTX 5090
Laptop. The latest freeze was on September 25 with CachyOS
7.2.7-1-cachyos, Niri and NVIDIA open 615.71.09.

The screen/clock froze and keyboard, mouse and VT switching stopped
responding; lid movement still changed panel illumination. The journal
ends at 17:51:26 EEST without a nearby panic, OOM, Xid, MCE or NVMe
timeout.

I have experienced recurrent freezes across releases of Ubuntu, Fedora
and CachyOS, different kernels/BIOS versions, Xorg/Wayland,
dGPU-only/Dynamic-Hybrid modes and performance profiles. I also tried
GRUB modprobe.blacklist=i915; freezes continued. Regular overnight
freezes occur on a stationary desk without cable movement. They have
occurred with the OEM ASUS charger and Lenovo/Dell adapters with
different voltage/power ratings; exact specifications were not recorded.
Fedora artifacts establish an earlier silent freeze on 6.18.4, BIOS 306,
NVIDIA 580.119.02. I have no known-good kernel or established 7.2
regression. Separately diagnosed OOM and graphics-recovery incidents are
excluded.

The current downstream kernel loads out-of-tree NVIDIA modules. Its
post-freeze boot has taint 4608 (W/O), including an i915 VBT warning;
that is not freeze-time evidence.

Three retained Fedora boots report BERT "Skipped 1 error records" / "Total
records found: 1", but their raw payloads were not saved. Severity and
contents are unknown. A separate MCE followed a clean warm reboot, not an
established freeze. The fatal SoC/PMC blobs in bug 221923 belong to the
GU605CW reporter, not my laptop:
https://bugzilla.kernel.org/show_bug.cgi?id=221923

Some freezes coincided with USB-C plug movement, but it is not a
necessary trigger. The last recorded profile before the latest freeze
was Performance; deliberate reconnection and brief profile/EPP tests did
not reproduce them.

Bounded collectors now preserve future BERT/pstore, rare MCE/RAS events,
a heartbeat and power-supply uevents. No new freeze has been captured
yet.

Which additional evidence would help ASUS/PMC maintainers distinguish
these cases, and is there a supported route to decode a future Intel
crashlog? Sanitized excerpts are available.

Thank you.
