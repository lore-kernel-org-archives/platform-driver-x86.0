Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C036F1D8E01
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 May 2026 00:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778115301; cv=pass; b=GCo3aKd1+1jRTx/kUlaD1oZqOrTBbVk6H/0lRlGSTOFmwl1qy9K1X+vMQyhv01tRdrbZ0CxAsnQL4JxjE6G1VNtG15VPFEUIOBShKzOJHDMrVwKgaTsQFiSouAcPbTL/jM3+xvPbRpVKUbCPmm/NS0Bvq3jn5l7HCUriLcHA2wQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778115301; c=relaxed/simple;
	bh=LDR4RMG9y/hchf3VKFgQkM0SceWEFFv8pgncKZdJekM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=XAvtezG1IFIpMAZpDdlOXRQNhHdsdsRTF9Mw6mpjIQpEzjKJ3+WMqlfyZFoVj2wdSy6D+ra4nBlcJMDtGcLqDRUIS7vWO/rfs0dTMClcJ7d0XqL/bUBvSrDXIV1NgMARgz6TPvnzAEPY/8VZh1QU/9P+scXInrIUYFj5WAixPL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iElDvFpX; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iElDvFpX"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1305908ae11so858785c88.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 06 May 2026 17:54:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778115298; cv=none;
        d=google.com; s=arc-20240605;
        b=B+oo9E1psCqLiDD6gKTAXHV6lcC5+KO3+Te8YBAl1v+YIQO/0/ghVX4+cdLz1dcliB
         LIcJpDdtTDlq31AQokFZ8Q7e6sKfsie8N5ZsUbSf9d6m4QBJ5YzW5j04Mm1IW9fh3DUj
         sudV0jnaSIMLGS08FgV2OZsb/QlsAmX/7rgNBymmPLbBLEx18CqPzHpB0j/D3AXIUHT1
         X5ckJEABQO/YHUipVoyW1Smy2H6YezuAtR+YDw2XUrRSBTiL/YlSLGKA3h4jNSBX4Bx6
         IJP+y/N8D7t6w9bZvGTJxx8OVFXc2T8vcqxifhH75NUyQ+lrF38neHPDOkZfq9vvLrfD
         Iraw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=SDrzcHQqAiXPrycAwIJErT/zI++38y/LrTUWXD09sYM=;
        fh=LAtpHtVR30q6rinFeyskR7Ff9QyURHB8q3bpp5R7hcA=;
        b=gwYI6GtvZNAeXXiF5fUT5G5NQA+mw3LHueEKRV2BJ/vnqEeoYwyfUdD+/GnRVpeB+5
         /R0VfbMy1TTNvqvCzIKiE6G0Vy1+E4EGMZMQVubWN+GbGwB4814k/R+AkzlMqD1VnKQF
         IfEBclj8s5qT9y9AJyFq4itD+C6Y58kgQsNr4r2gr3cDvvFjg+552XDVTmF/a6GcAaWj
         1qLaZrEMUQO/mNe1xumQwBwPMP/CJlnfMJeu3eiOzKUFkrLjhfFuCD69na5AkrsOU3mb
         d7oTXBcBUS5v+a+zSLrCNgUrYnXB475aDq2fLhJQdkr2Hy/PLKgQlX29s+e0Ln+PBfPH
         nkhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778115298; x=1778720098; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SDrzcHQqAiXPrycAwIJErT/zI++38y/LrTUWXD09sYM=;
        b=iElDvFpXXjedHkKlCSg6gC1Jv5E8voTmFVOkHfD4XgVxBYcr8wDT0UQdrfatxe1c+U
         NFHhjKegJ9mOIQDFvz5es3zvFYOzpDAn+ZWJpkX4AQi8DzdsAFky7LECibhJJxFrAHn1
         Wnwtmg20H/VUqE2CN0uqUJxrClAUvBzLgjzPV6aFxYRRnGi7OygK0vQnSaSZX6xPYX2W
         jioOoriSf0iR56Jv/QK1j7YHylTSp5y4VstIqFzSgWLjwO+U59xZqSlpI2C/0NnVC/t7
         1Q4s8wbrnjzCa/Qi0kyiqzmRsK7TVDy8XjDSI3wXvYS4mHbpGU4keyDkdDM4120F8ic/
         cWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778115298; x=1778720098;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SDrzcHQqAiXPrycAwIJErT/zI++38y/LrTUWXD09sYM=;
        b=I+pZYwopmY4bTFGpyox4AK/AhBrw98IAYsIfmdAlhTBtr0johw9uZf3SPOW/Dhglxe
         74k6nTMXC9dKSOOofs74W0AFR1l42jLGlAC5KujDp/op4Je55E0ZUfkTxCeaNLBzSeqU
         G0A8UHbeaDeEQHCJ84WGcNcW+n6o/MMkIfaftM3NLmVCgTCDFsY/aa3PQoMKDbo/NN/H
         mUFPDYxZrrFQMu4AIG2S1TTo9Z0VzGPERlqgUDUHwMzdmK4pNfLWpTaYDWEr1iHuQzWl
         aEY3QpuBycuhkgUGKkmRT5P5YxjZwVC5OHAOewKQ4mcJ0Lw62EehZYbRMtqCKcQOmCwZ
         HvUQ==
X-Gm-Message-State: AOJu0Yy3GTuPlayKezN0X/+LnehmajpapjFIefHCjBITilKnrqEVNcGC
	pvJNSLfUWd5X+cs1tb2V8fZ8JK9ZsLtwztniY8bQtYh8V6wXJgA4LTHm0Mr4rIa3+AGd4ORvso0
	ToauHdLG6Rd8gIYbbOVrZYFGVG2wM/dyO5AN11cA=
X-Gm-Gg: AeBDietDZWVwM+wYiYMNph3HsCVnVRWVWCC0uqImd+M21mp/WsQRlXSh2ijmXFtQu+g
	7arnyZLPdPFBv7j4z0F4bmEq6wpd3IwGNGT9KQ0z3bGJ06hAy4Q7ujhg15K4DouWEqz13jShtso
	OipgSGsw57d2tUAxCWTchTK2L2kQzyrC11JrIK4N7srsBU5bBDYJ01NJCk2YKXVSd6y6zHU/YVX
	vLUZTmjaQ/5mL0Kc++PaJ//Zhzmipmj2WPN79NZsbWpBaSanu6eSB9riRAV80ORB5fI4MuoC/QF
	xcWJOPipwfEiDYKeGx8z50FcytLzg6F25YPPerpEX6mwhw29NxK51IyKMW8b+j7BEKSrz4o3Hk2
	Rdg==
X-Received: by 2002:a05:7022:1e10:b0:12b:fc21:874d with SMTP id
 a92af1059eb24-131880edbfemr3154544c88.19.1778115298413; Wed, 06 May 2026
 17:54:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Anib Khan <khan.anib@gmail.com>
Date: Thu, 7 May 2026 04:54:49 +0200
X-Gm-Features: AVHnY4Kov4Lmg_6YYj8aqw44FzcGNYp2Zo_b3fVJgFGbGIxovO34yhofAEm6NvY
Message-ID: <CAHJybMZmTxVRztNu_xO2G+-+ifYS37djbnh3Z7U+OvJ5KA3UoQ@mail.gmail.com>
Subject: [BUG] platform/x86: hp-wmi: board 8D41 (HP OMEN Max 16) GPU TGP
 capped at 80W -- cTGP/PPAB not enabled on performance profile
To: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm reporting an incomplete implementation in the hp-wmi driver for the HP
OMEN Max 16-ah0xxx (DMI board name: 8D41) with an NVIDIA RTX 5080 Laptop GPU.


== Problem ==

When setting the platform profile to 'performance', the GPU TGP remains
permanently capped at 80W. The GPU hardware supports up to 175W. The same
hardware reaches full TGP correctly under Windows when HP OMEN Gaming Hub
is running.

nvidia-smi -q reports:

    Current Power Limit   : 80.00 W
    Requested Power Limit : N/A
    Default Power Limit   : 80.00 W
    Min Power Limit       :  5.00 W
    Max Power Limit       : 175.00 W

nvidia-powerd (v2.0, driver 595.71.05) starts and establishes a DBus
connection, but 'Requested Power Limit' is never populated. The daemon logs:

    nvidia-powerd[1116]: DBus Connection is established
    nvidia-powerd[1116]: ERROR! Client (presumably SBIOS) has requested
                         to disable Dynamic Boost DC controller

After that nvidia-powerd sits idle and issues no TGP budget to the driver.

Direct override via nvidia-smi -pl 175 returns:
    "Changing power management limit is not supported in current scope"

This is expected for Blackwell-generation laptop GPUs -- direct nvidia-smi
power limit overrides are locked out by design. nvidia-powerd is the only
valid path to raise TGP above the platform default.


== Root cause ==

Board 8D41 is present in victus_s_thermal_profile_boards[] mapped to
omen_v1_no_ec_thermal_params (ec_tp_offset = HP_NO_THERMAL_PROFILE_OFFSET).
This entry was added as a defensive placeholder to prevent a probe crash
(EINVAL -22) rather than as a complete implementation.

On Windows, HP OMEN Gaming Hub issues two WMI calls when switching to
performance mode:

  1. HPWMI_SET_PERFORMANCE_MODE (0x1A) with thermal profile 0x31
  2. HPWMI_SET_GPU_THERMAL_MODES_QUERY (0x22) with ctgp_enable=1,
     ppab_enable=1

Call (1) appears to be sent by the current driver. Call (2) -- which
tells the EC/BIOS firmware to unlock the GPU TGP ceiling and allows
nvidia-powerd to negotiate above 80W -- is either not being sent for
8D41, or is being sent but the omen_v1_no_ec code path skips it.

Without this signal the BIOS never raises the NvPCF power budget that
nvidia-powerd reads, so the GPU stays at 80W base TGP indefinitely
regardless of which platform profile is active.

It is also not confirmed whether HPWMI_SET_POWER_LIMITS_QUERY (0x29)
is being issued with an appropriate cpu_gpu_concurrent_limit value for
this board.


== Hardware ==

  Board name  : 8D41  (dmidecode -s baseboard-product-name)
  Product     : HP OMEN Max Gaming Laptop 16-ah0xxx
  BIOS        : F.06
  CPU         : AMD Ryzen AI 9 HX series
  GPU         : NVIDIA GeForce RTX 5080 Laptop GPU
  Driver      : NVIDIA 595.71.05 (open kernel module)
  Kernel      : 7.0.3-1-cachyos
  Distro      : CachyOS (Arch-based)

ACPI dump is attached (acpidump.dat.gz).


== Steps to reproduce ==

  1. Boot any Linux distribution on the affected hardware with
     nvidia-powerd running
  2. Set platform profile to performance:
       echo performance > /sys/firmware/acpi/platform_profile
  3. Run: nvidia-smi -q | grep "Power Limit"
  4. Observe Current Power Limit stays at 80W and Requested is N/A


== Expected behaviour ==

Setting the performance platform profile should cause the driver to
issue HPWMI_SET_GPU_THERMAL_MODES_QUERY with ctgp_enable=1 and
ppab_enable=1, allowing nvidia-powerd to negotiate a TGP budget of up
to 175W, matching Windows behaviour.


== Suggested fix direction ==

For board 8D41, when platform_profile_set() receives
PLATFORM_PROFILE_PERFORMANCE, the driver should call
victus_s_gpu_thermal_profile_set() with ctgp_enable=true,
ppab_enable=true, in addition to omen_thermal_profile_set(0x31).

This mechanism is already implemented for other boards in
victus_s_thermal_profile_boards[], but 8D41's omen_v1_no_ec_thermal_params
entry appears to bypass or skip the GPU-side call.

An analogous incomplete board entry was recently fixed for the HP OMEN
Transcend 14 (8E41) by adding it to omen_thermal_profile_boards[],
which brought CPU TDP from 45W to the correct 65W. The 8D41 situation
is the same class of bug but on the GPU power path.


== References ==

  NVIDIA Developer Forums (same issue, RTX 5070 Ti / OMEN Max 16):
  https://forums.developer.nvidia.com/t/hp-omen-max-16-rtx-5070-ti-laptop-gpu-power-locked-at-80w-on-linux-ubuntu-24-04-3-lts/351924

  OmenCore issue tracker (8D41 confirmed, EC access disabled):
  https://github.com/theantipopau/omencore/issues/91

  Phoronix coverage of 8E41 (analogous CPU-side fix):
  https://www.phoronix.com/news/HP-OMEN-8E41-WMI-Linux

  hp-wmi.c in mainline:
  https://github.com/torvalds/linux/blob/master/drivers/platform/x86/hp/hp-wmi.c

Thanks for looking into this.

--
Anib Khan
