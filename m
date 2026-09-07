Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9C944160C
	for <platform-driver-x86@vger.kernel.org>; Mon,  7 Sep 2026 08:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770479; cv=pass; b=GnUqs7+9WyIb7p95+Op26aP2JnD8RCLjd2zicmYoYRSKNMwOiDZKzAXwCweYmxo27bKp30/Fog8Gy8Ug+h8pKZkDuMKmVkAc69lgkT16W7WaJRluawM7NnLd9RCU72fm1/++91+mYV3tb1lH7UwoFWKfKDELxMX+HewS5I2q+/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770479; c=relaxed/simple;
	bh=MgdmZFVA7aoLec69DzzgoB9Mw7W2m2fcDmRBdrBokVc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=lon8NtQoolvSbmu+bTnJVE6ZlnOGS7f3pwvqgDSAkmMPAHkr6/QrTMDm+koRKgFqX+9t/uZRBxKljuBiAKywbFDax5qWV+8vkJlrDJbuegEhv9cTXrX19Haq/nkBcw0mrmh260YsniOw2YVrNnLOGZZhTG0SnoLrLKR+GU1rG/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D4E1Yskw; arc=pass smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4E1Yskw"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so27577135e9.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Sep 2026 01:41:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788770475; cv=none;
        d=google.com; s=arc-20260327;
        b=EZbUSB1JrCoOw8Lw3oEME2MxeW9rNUEwS8ObrM9PQspvTYRfGkNEwTxllkvOd5A4d5
         /U+uFryNG4vP0iZFwPZWlBeV0YqQU0EBy33I9c0M1je4In/XJUGRoz2kk/wFDLD/1VxA
         8XwZcVGHbqphfUpcKQC4qS6K/QSzR+giGWuJarKbav/L4iBT+WR2s0n4U2A5PFLMnCtp
         vsOZZD/QFfDO4Qa+y767Z79sUdb22ML82V+qg+q0WaXjTjinOkqSyMfuqyMMq/jwWuHw
         z2HWydX4znCJF+433+bNsKsMb51GuW2+g9O43Ewk3ocsRLzliC97EyHDrtzpW6bZ7UI3
         2MpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=RJ11KuNUShd+rjlNgZxIHhqbO1fsVeK35vNeu3wHqSs=;
        fh=ci9brujSe/bGQHf6nPAvnKhjJ3QtXQm8R9OHtENhCvs=;
        b=mRkMqlnAHxISKGiHyArI8xxvYTnZSMprbEIzLayE6F8vI5bQjsvI4D+BZLl31ciFXx
         qU7jULjvs+LCN/HyCPnAHhW1Dbk4KL5fAJLYa6tJTJv4iyvGGRWnXkiALzJ81qoBYAPz
         czq8dw6UNiwfnIuMrN1rjFZUxIPHulM+qbhLfa0X6slGfZKvyHvgFn9tObibvGywFUY3
         cUpw2Z1YXCNlEWGp99M5NKZfuSK/wFQdgAiYYCxDxQYiUJeDF/5inmV+7OqKsSp1pldb
         KEBRR2mzXes/we0iUHZ1gkiuaMLACCOTY7QzCGBy1X9zLzhUc+wiA8QM5/eUTRA5C8ye
         XXlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788770475; x=1789375275; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RJ11KuNUShd+rjlNgZxIHhqbO1fsVeK35vNeu3wHqSs=;
        b=D4E1YskwRLmzotnZVx0ceCTOVnfGaHY/iopTns5MVhJ8ZdQwjG7d1WMKT2YIqrbnNl
         8XFS5XUfBH3ema0u0VPrY3B4QhO420Vd5J5d/m63Bb6V6/JtZvAd2EvYoU9yRH7PJgob
         oP5rUxFra74HiSBSBTCQpJ5eGwz8nvKTe8uXBg0JeIU6teNTeV2GPmRh6Xnp0FBVz/qA
         jFDuFMD9GKTxLwIsYcr39UHLnJESc413as7+s/eQznPuFC+7hQIkaHhmr0f3roEnhu8q
         g1XfggJi/DnpLZJfbi5NOovxomkugdTgH0QCfjv3HzX4YlUAm8vk3/YmWzlqV+JeiYgZ
         rvxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770475; x=1789375275;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RJ11KuNUShd+rjlNgZxIHhqbO1fsVeK35vNeu3wHqSs=;
        b=snJajcCwpJHHO9EARQQZCBLtWOVvbbM030kL0p+Gfm/FoMuu5ykRflgykq/hQhvxmm
         r5m0dBmECp80Z0sS2LSMmgjWLrI90WGh1hBFzOMzl535LTzGM5Pu6Ic1uF3NWUzxxIrB
         p3pxVhWdsrn30jFzSiIK3e/xjFUNQvgLZ++SKcxz6lVhvgl86X0DCACb38wgWOWuC5SW
         JgO9reXqlsX5zLI/kGtGZ1hjhSCuooMcB4urWr2OXglV8DwxIAUeYXxzB6lhJQRhpDDS
         yNq/KR76RDKofLoUiO3Aw5ER85oh8Q51gj99dFj+103lJOS9yOITeMTNj7yh3RiLfVla
         fqvw==
X-Gm-Message-State: AFuF++lVJU29sI+MugmTCJuJtuFMTCOpbuU9Vjwp9nFLqPAIA8yp/543
	ngAtBgI4cgRustLqAij85TCRrzRQMDYUgmQG74lu5EoA7IntniL7nABCN+jUDS92l1cLu/1hbg0
	5A0kt2Iyi/s7nmNvJUOZ5hsZuTEBUWm94LdElqw==
X-Gm-Gg: AYBFou0tWALhNCcl9Cd7J516SdeR4kQB08K4WcYcxVlpCVr1uWp9Wna89PJ/jwI3ea6
	/wQJJawHc0O2ILBT+MwA9XNAs/4VrU0q2V9z5lkirtD0g/ao98SWrawFyRQyKbzxJmCSuK5pMwi
	viKqKyx+NNi41DIf7CsqQUowKBTunXGs+qAyCkBCzQELHA1IGbui2qq8f3T0LmzCHTgRaro+WEW
	U+XiLlm6Oc5LffOUjsDzZNzhWfEjZcFhybG4I3WfdpBW3ccaiWs5LLTxVEKnXFeAkkWt3urQpjT
	d2/bxtJYrIiy2aUtPS+Kj9Ztt+eHvdUxpnWp0Jo/CitUdx6dnVgljFSiIXVLxAyRTtZGL9ztBIt
	z
X-Received: by 2002:a05:600c:1548:b0:49c:fc6e:a3d4 with SMTP id
 5b1f17b1804b1-49cfc6ea70fmr186672845e9.19.1788770474779; Mon, 07 Sep 2026
 01:41:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Charles <hanker007@gmail.com>
Date: Mon, 7 Sep 2026 16:40:37 +0800
X-Gm-Features: AcwNN1Wve0cfaWWssqpF8TliSN_UBvq318IdcvoIL6OvTaSZNOofWv15TZ-Tj9s
Message-ID: <CAKtz0s8UYRQYW_0bh=0TMx47Axm-W-muEay-r3rqUBS1NHMPVw@mail.gmail.com>
Subject: lenovo-wmi-other: LENOVO_CAPABILITY_DATA_01 fails to register on
 ThinkBook 16 G6+ IMH (ACPI AE_AML_OPERAND_TYPE in \_SB.WMI5.GCD1)
To: platform-driver-x86@vger.kernel.org
Cc: mpearson-lenovo@squebb.ca
Content-Type: text/plain; charset="UTF-8"

Hi,

Reporting a firmware AML defect that blocks the fan hwmon interface
exposed by lenovo-wmi-other.

Machine:
  Product:      ThinkBook 16 G6+ IMH
  Machine Type: 21LE
  Baseboard:    LNVNB161216
  CPU:          Intel Core Ultra 9 185H (Meteor Lake)
  BIOS:         NJCN68WW (2025-12-17, latest available)
  OS:           Ubuntu 26.04 LTS, kernel 7.0.0-30-generic

Symptom:
  The LENOVO_OTHER_MODE WMI device binds correctly, but no hwmon
  device is created. Consequently fan RPM readback (fanX_input) and
  target-speed control (fanX_target) are unavailable.

  $ ls /sys/class/hwmon/hwmon*/name
  ACAD acpi_fan BAT1 nvme nvme ucsi_source_psy x2 coretemp iwlwifi_1
    (no lenovo entry; acpi_fan reports fan1: 0 RPM, always)

dmesg:
  ACPI Error: Aborting method \_SB.WMI5.GCD1 due to previous error
              (AE_AML_OPERAND_TYPE)
  ACPI Error: Aborting method \_SB.WMI5.WQB1 due to previous error
              (AE_AML_OPERAND_TYPE)
  lenovo_wmi_capdata 7A8F5407-CB67-4D6E-B547-39B3BE018154:
      failed to register LENOVO_CAPABILITY_DATA_01: -19 (ENODEV)
  lenovo_wmi_capdata 362A3AFE-3D96-4665-8530-96DAD5BB300E:
      bound B642801B-3D21-45DE-90AE-6E86F164FB21
      (ops lwmi_cd_sub_component_ops [lenovo_wmi_capdata])
  lenovo_wmi_gamezone 887B54E3-DDDC-4B2C-8B88-68A26A8835D0:
      platform_profile probe failed

Note the asymmetry, which I think is the useful clue:
  - LENOVO_CAPABILITY_DATA_00 (362A3AFE-...) binds fine and
    successfully attaches LENOVO_FAN_TEST_DATA (B642801B-...)
  - LENOVO_CAPABILITY_DATA_01 (7A8F5407-...) fails with -ENODEV,
    because its AML back-end methods \_SB.WMI5.GCD1 / \_SB.WMI5.WQB1
    abort with AE_AML_OPERAND_TYPE

The "_00" variants (GCD0/WQB0) apparently work; only the "_01"
variants are broken. This is an AML operand-type defect in the
firmware, OS-independent.

Verified present on the machine (all three GUIDs exist):
  DC2A8805-3A8C-41BA-A6F7-092E0089CD3B  -> bound to lenovo_wmi_other
  362A3AFE-3D96-4665-8530-96DAD5BB300E  -> bound to lenovo_wmi_capdata
  B642801B-3D21-45DE-90AE-6E86F164FB21  -> bound as sub-component

Questions / requests:

1. Should hwmon registration be able to proceed with only
   LENOVO_CAPABILITY_DATA_00 available? Since DATA_00 is bound and
   LENOVO_FAN_TEST_DATA is attached, it looks like the RPM data may
   already be reachable. If graceful degradation is feasible, that
   would restore at least fan readback on this and similar machines
   without waiting for a BIOS fix. Happy to test any such patch.

2. Alternatively, is a DMI quirk the right mechanism here?

Separately, on the same machine there is a second, independent
firmware defect on the legacy ACPI thermal path:
  \_TZ.FNCL references \_SB.PC00.LPCB.UPFS, which is undefined in
  every ACPI table (verified across all 1 DSDT + 29 SSDTs). All 6
  "Fan" cooling devices therefore fail on cur_state write.
Full analysis of that one is in the Lenovo community forum thread;
I can repost details here if useful.

Thanks,
Charles
