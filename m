Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783AF3AE71C
	for <platform-driver-x86@vger.kernel.org>; Wed,  9 Sep 2026 19:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788981639; cv=pass; b=RQamDPXdYB4pK8sb1K8LtWcSrhT+6v1ZpBsE11aSUFK2VZOg4sy4PFcCrg0pV0KCjky30J5x40bixvBO+o0VPAiLyNNaPPRNeCgo93cCCwQu1EhkRjbmEJsuvuTiIZbaIp15OI43fCsTTxBSrimv2n+2qECokqMPlhueqfbp7Hk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788981639; c=relaxed/simple;
	bh=eFtq7oZhPgdGnE89WeLIXWCd/Y3TJLmf13KV/Xo4MY4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=ToCZmCG/I0UvH80zhTCh9eqcJKpZgDyqc+rUn71P93XcdRZB8VnGCXbTOU2rbSsolOMEBL3Kbwon1sxwD7b4GpaR6Ybi2J09Tx5whNJfpaJSlQmkp4P4u+yFw5ILN0uGTvE0O46WT3ZN6NhlTOmFT755Nrs0lZ8F+zCTzCmtcos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JqBTtyvw; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JqBTtyvw"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76ef19aso4883831cf.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Sep 2026 12:20:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788981637; cv=none;
        d=google.com; s=arc-20260327;
        b=WbGHGF41BRolG0oDkDxX+js71eA2rg/D3OrS9lB3qCNPZTv0/DH6bFxJJf2wITrNon
         tA7y+QfcxdVPotX5tL0ow1VG26743xtcRiKJjRZswI+Vw/i2MwOqe40of7juQK5UfnzW
         Digvwmsw/Kmaoi18YOlstqjfJ2k0096itn1GwYj5yDdYTFIxxd9RKOOZQk7a+M7QIamk
         yjUJZ3nCc+C7s36XecL1uV+Q8m9tEe8iBiLW3LtpdLbDvnO8uVJ/FSCT7oBL4io2oOkf
         Mefy5U5NvQMEVZZ2pfs17ZF6i15AyPtHIfbbe6/I9pgskOxCBkdBlb8azeQZOs2mMkoX
         d+Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=0+4NAvUfSFSVaVC3VAtuCDVjWUR3Of/hWLTxRijKD0I=;
        fh=cl9o54/1kElGAv3aKJJpaT0Q+SRgr/4C9m3mVbp0Oso=;
        b=i/IbXqv4DvUITFjP1rHqvBh0fk4+nVGiJ671itioPw4LztDmD7y3aNuIbAw+ld4fpk
         BRbi7s0z0VTSN8VJJ3Lj3NsYX956UIUatPox0JJWHlUcyBJ1WpMNKRvCBIinqMFPqW5N
         YOkdkGV5hbLcld3yVnfFZC4sF+dddTCa++lGMwzl/FlFU+TMgkd2CCqYSb+1GV8S0HQh
         uws42n6AgwWoI4g8CmMCle9s0rjN5AUKGUZU1CWSzUhLo607QDl8PsX/+QuBOJZROgRx
         md9ey4z2rg+JcjpkMV3Fjb91DAI68ALgwwEjSW/gexYdM5KKz05+ZM6aJJ8Pp6AkQnOz
         J1aA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788981637; x=1789586437; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0+4NAvUfSFSVaVC3VAtuCDVjWUR3Of/hWLTxRijKD0I=;
        b=JqBTtyvw+ViLs2f9672dxl29KLL5xp8Twt7JlXHQIh/kcgJl8yXc1VPJMOUgIiRFCZ
         xHTMUnsWJv8Bmz/3Y283xgIQOcSbBUeXb+OP8NPLm8zUAH9KCN+fF9I+somahR0WxZsZ
         Z0hIUaBQXjUlgfx3YKdGDsn4KuHow0uyiDLrkf9v1cZ4Rh3TSkh7lNalrYom8rvyu3iI
         9GKVtKQuGV99jbmTN/pxPmhn/ZdhM0u8hBfAp4pZmxdAIKW+bZHOmkfGOP0dnLAmSW+0
         c0E2GL6jyMCQoQ1tSlfjVZqxKYQ0D/+H/CSC2ifEquUS+GEOihR4oUA2MhL22GCPp1ho
         5ruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788981637; x=1789586437;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0+4NAvUfSFSVaVC3VAtuCDVjWUR3Of/hWLTxRijKD0I=;
        b=Y//rpH4b6nKOWbL+PTSitJebe3R0doUQk8Wwaha2zZ0QKbABP2OlOJtsXqM5EBONS4
         3vEt5p6qrGpmNiCNpuVeu3asMTRe8guFYVdbL7HgEfo9FzkQjjDJQU6E3IVSA0jVFtPQ
         0EA+D1ayamkqbW22n4Pnn6wLrvzTEEmhM55Oi+ofRV7WtLUq1h39BBvD+HWuhA/Sjq0x
         xcfEgJnyqbr7kuhOctMbKhk9OdjE1TmqtfsGhqtE7M//FhV3fWlhs/b985W8QdgD9Oen
         O62xHyVl9Idlz0zSsGhbLV3MeH5gsfrDfBpvKXDSMKLtUI3UpI+djep5psY8NmHPXqWq
         hTfg==
X-Gm-Message-State: AFuF++mLwYowc2mQrRyrDHLCSWqs9QO8qfhlRcsHLwYz0Qj+P0uZlNoy
	1Cb91yWzGl/FTslTKlMK/yulqXZLGsTBQVknrdHvucirGku2fFIZp+pfF7XUlNBGg6PmZqYDmP7
	y1O6A+HOKdm3TtYHF4JqcXGNsbGWOQ9WAtd6EQhI=
X-Gm-Gg: AYBFou3a6+Iv9q41IYIUOjcWreeUiLYaMzoL2OL8Kn/U61kbqoloFtXD0a84wb9HnHV
	iGeh8QajP/7Ngj/xxo7YzD87DruPcpuZg0cag0WBhka+SA4CFgYzw+Dth8vHAZPaJacG0yvplj8
	dyKpoomUwgotkJvxkqjfGt6cbz/jqIFp+WUrxzJHrbVrJB62YhB52rjgb0RVaZWVbXnNhwMGkL1
	513Uej2TbCtG7wahFB47Z7l0nUuhQeks5fNL2EN1c/0FbzkDqfREkV3RRR2b7okfyHEigRO0nJh
	9tAIMcvelzGdJTrbRgQR47YpnHEjnSkvXwZrfOVYoQV68vkmMQTZqtSLAMO4ZtNK4Raf/f6SqbD
	55lcl1h7THBo=
X-Received: by 2002:a05:622a:110:b0:530:1613:e09e with SMTP id
 d75a77b69052e-530aeada02amr39030441cf.1.1788981637125; Wed, 09 Sep 2026
 12:20:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: hugo baigue <hugobaigue2004@gmail.com>
Date: Wed, 9 Sep 2026 21:20:26 +0200
X-Gm-Features: AcwNN1X2Qi5Vf7I294ay_fAnk_BiqLaoiWRmxXpt0D7WqYDGgdERljKhh7bDo6s
Message-ID: <CAO84+xJLVW_9_D9-8cwJYv_Vz+LK7nJqRaG-1P4_eeLrQmSiWw@mail.gmail.com>
Subject: asus-wmi: screenpad backlight power state is never read back (UX5400EA)
To: platform-driver-x86@vger.kernel.org, corentin.chary@gmail.com, 
	luke@ljones.dev, denis.benato@linux.dev, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

platform/x86: asus-wmi: screenpad backlight power state is never read back

Hardware: ASUS ZenBook 14X OLED UX5400EA, ScreenPad 2.0 (2160x1080 panel,
exposed on HDMI-A-2), kernel 7.1.9.

asus-wmi registers the `asus_screenpad` backlight device and knows both
ASUS_WMI_DEVID_SCREENPAD_POWER (0x00050031) and SCREENPAD_LIGHT (0x00050032=
).
However the power state exposed through `bl_power` neither reflects the
firmware state nor allows changing it.

The firmware leaves the ScreenPad panel off at boot. While it is off the DR=
M
connector stays `disconnected`, so the panel is indistinguishable from an e=
mpty
port and no userspace can use it.

Observed:

  step                          bl_power   firmware (DSTS 0x00050031)   HDM=
I-A-2
  panel on                      0          0x100a0
 connected
  panel powered off by firmware 0          0x10000                      gon=
e
  write bl_power 0 / 1 / 0      0          0x10000                      gon=
e
  DEVS 0x00050031 =3D 1 via ACPI  0          0x100a0
 connected

Two distinct problems:

1. `bl_power` reports 0 (FB_BLANK_UNBLANK, "on") while the panel is powered
   down. Nothing reads the state back from the firmware, so the attribute i=
s
   stale from the moment the firmware changes it on its own =E2=80=94 which=
 it does on
   boot, on resume, and whenever the panel brightness is driven low.

2. Writing `bl_power` does not restore the panel. Calling the same device i=
d
   directly through acpi_call does:

     echo '\_SB.ATKD.WMNB 0x0 0x53564544 b3100050001000000' > /proc/acpi/ca=
ll

Consequence: on this machine the ScreenPad is unusable without an out-of-tr=
ee
helper, even though the driver already knows the device id needed to drive =
it.

A related detail that may matter for the fix: on this firmware, writing a l=
ow
brightness value to /sys/class/backlight/asus_screenpad/brightness (tested =
0, 1,
30, 50, 100, 120, 150) makes DSTS 0x00050031 return 0 and the DRM connector
disappear. Brightness and power appear to be a single firmware setting, so
clamping or refusing low values may be needed alongside the state read-back=
.

The DSDT also exposes three device ids in the same family that the driver d=
oes
not use: 0x00050033 (returns a constant, likely a presence flag), 0x0005003=
4
(toggles a bit in the EC), and 0x00050035 (writes EC commands 5 and 6 on th=
e
same path as POWER).

Workaround and full analysis:
https://github.com/izigower/asus-screenpad-linux
