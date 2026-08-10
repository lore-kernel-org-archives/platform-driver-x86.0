Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0279242D65
	for <platform-driver-x86@vger.kernel.org>; Mon, 10 Aug 2026 18:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786386037; cv=pass; b=tKYUgjCu7o6fQZ/qRhE2KPgzJzLjqeS6C09eYDtJnoh8fi8YCFMkoW9f8yNPsskxNh1LZqncOR4g7UK9nbbmM+Rdo2s9s1MdlzjD4kShYbG6Qg5UmRYq/XxUrWyyO6FHo87FqmD776sbVVs1HzuURHfcujBEXbYnJL7TOza0YpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786386037; c=relaxed/simple;
	bh=GFgC/2Y1vUXGaWYbLtffhfQjL4cInF+vkGR+jmsaGVQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=uxAkKV7fIaMCXYSjFc3AtvZLbSn6I92Y+0h3TrN7G7Eg3vR82Z9I19vXMDrwaeZpHOl8jSpltFtBtuoesofFBxV7EGwKyXDMBPjO26fkeG6M7B+YJEvtZiFx71V4mV5lG9YjngkF8sD4wrHownRHZyu9uvBgLZ+e0laJdm+ThuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sR/tU02I; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sR/tU02I"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b0117dda13so2167118e87.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 10 Aug 2026 11:20:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786386034; cv=none;
        d=google.com; s=arc-20260327;
        b=b9mTZCZdhX4fWQvj93z7obN9+EcZ3Ie/AC3yQXNJcIo0yy8MG4LXFbBeKPFcjUJPxr
         lIYLWH3awdtL6ZOvIMjIfoWWyWNBUnNV5doObQMCpnQZ/U/xUBJauRel/rh7ccNHzsd4
         SyM/ZdKzWgqhs81OMaTEb8XQ6+T8Tz1IBXu6h8OSwHu10Rgq9Z/P6RYEX+G2yra3Yjp/
         OKHNwK4nzWm7VJzGcX+MqJXHiWMcuZenRyZMe1sUwI9hanKiWHym3YKWwMLKVhqbo118
         YXyU9T/ePelEijWkR52if069rf9cpC/OcewT9kHhegfrUJxjUeUHY9NSSrN31xR7NZ+r
         wTSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=GRKZQyIgAIUvIunVT9w7wqu2dy0LSt3JM4W0FMydkoM=;
        fh=0hz/yNVEKXX1tug7+qhtKcmvDDO/qpst1HEwT6Fbq+I=;
        b=c22ZwaCVFsy5WOWwlnQLvD7tKHQO9xKRprAau7AD5NPVRdzjQj3R4wISXY/1CRcLxS
         4uerjztv1S/P8er6H7iWczmEGVwuK+DMl/yaTUhaFkDqGsT67Zn+ED3IJFRnoBVDgsEG
         iBHxa2kAe4pw/54c1aO8Cr1Djo2BgXdaftUPQFYGzFB0QE1N2JQFI4gV/FuiC8QsCfEC
         ayRy+qv+vCY9BddNBZqYZ1h768faBmFQKbjCtdHJBNKStAywNWkqZ6wG6Uj3q2B37WKs
         /Dp1SCgKPe/+NNRSZMz4BMDnG5ta+pmOCrQauxdzhvnbz5JRb4iNMm1DeVYQD+ilIW/E
         CDwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786386034; x=1786990834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GRKZQyIgAIUvIunVT9w7wqu2dy0LSt3JM4W0FMydkoM=;
        b=sR/tU02IXctvoGquzWDNpnN/eeNZzLo+VFt5Q0/iZWQPnbBQszXykOwL2ldzOjZQj1
         XhJEjcTwZSkoZCshnalcaKkKwjl2Bm5Q+tV3935sdgDEOz5pgNm4CVYu0I5SzpQxfTDg
         5huAHAlIHpAIE8m9wh9j72884qsXFh1DsuUrLpHodysCYPTYeo95muEvdyE1n1K69zny
         Zo4YwUMBjJALdrF9Aj4LL52woF0sA0Irzl7+F1lFd1A5x1pm3vz3P5Eawvib5s3hIOOk
         4OUceDDlGpsQEcp12sM9lvaSzH484GKCiVYA28Ro0udeR6507Y0bKq6QaXK9I/p9W4n6
         GkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786386034; x=1786990834;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GRKZQyIgAIUvIunVT9w7wqu2dy0LSt3JM4W0FMydkoM=;
        b=ZGzVeAk0X0P9NvvidQZP08DycWqKDHharJlNumqracZAp1CepSDprAg26SKcKhEzbR
         C9M/2w4RXUiSV+wZ3yd3ByulnH0ykisny2ZZWJ9z+O2BXSWNHTEWwBH9qzkYMHmxexgG
         xvlXVSS2vwXAifzj7Uz2YI2nRML9s64VIBTz5DRlZ7GFNKqwV31wtrPGSr70He2mqozF
         OvWyraWEkibHgiomvVkYcttwOdK3BRZH4zba1Hi1Lb7nWyzNwq1GTAvgnxR85mQvp0AM
         fIOmaPeEPw/Rx5mPwOq57yU/tp/zO1va3ZZJc7+a4FnXQA62ye3NHKBaE/tPSiZLFbEG
         rknw==
X-Forwarded-Encrypted: i=1; AHgh+RpVv8xifheJMo7mXSWPoHccylcvCgo2f9KzyI4pxui9nfpb48jZMz2ix/PGHRueZLYNufBcZDDLzVrXj8FHokbreRpV@vger.kernel.org
X-Gm-Message-State: AOJu0Yyond7FJ10bWm3TNgtLG6mf2Hfs4qpr6c4Ncdq3zTwyUr/04j1s
	ocYw1j2fxwBryQHKBSyBKI7rWAeInAvEghvfCh1U2+644OOAntY+7IySZy3F7qsAO3qxTB7YpV5
	BZ9nQdrPnPCobkb43sFLOXfTjl6YDpBo=
X-Gm-Gg: AR+sD12lfI3lxOXtz46P19qgoiebaxwnRCg8PCACjjwz3H3wgtmkwHnQXw1PVPf/y5u
	HWEQPaK4UCA/mRNOPz/E2ROpFdYRZVRSdqvlapNnxu6DI4/2YZC5fus3izigQz6WUkec4p1WPbx
	C/b7DOTkGpJHF+L4sq+7fMceUxk2ntmMi1G0o8w9THXBhuUrkc/DcxoAVOOvcsKVyiNgjvdTrEg
	zTIwd6Zch96sHsML9JtLoCHUrjx1Y9d4LzyjX01ON/iv3gx3OMBNpbMvymUbyuyG1ppT61BooV6
	8tHhJBazziD6X8RrJiG1potkelnhmVbl+lg6W8fzvVTevMjq5ksp0YNkgkJMkTcstA5EYSxOHg=
	=
X-Received: by 2002:a05:6512:258b:b0:5b2:b85d:4821 with SMTP id
 2adb3069b0e04-5b30b786143mr2552860e87.51.1786386033788; Mon, 10 Aug 2026
 11:20:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Samuel Ainsworth <skainsworth@gmail.com>
Date: Mon, 10 Aug 2026 18:19:57 +0000
X-Gm-Features: AUfX_mx6pXatgay6nY2-0AaEVhS7XtZZI2NnWZIjNrrj8v_2ITG5X2TNxFxYtSM
Message-ID: <CAHYiNPZtDJ1ftQ4-uxc4mFQLRKL_dEXK4f=0FmBWOX96b4+7mw@mail.gmail.com>
Subject: [BUG] accel/amdxdna: Phoenix hibernation restore timeout followed by
 SMU/PMF lockup
To: dri-devel@lists.freedesktop.org
Cc: Min Ma <mamin506@gmail.com>, lizhi.hou@amd.com, amd-gfx@lists.freedesktop.org, 
	platform-driver-x86@vger.kernel.org, Shyam-sundar.S-k@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello dri-devel,

I encountered a strange hang during hibernation recently, and spent some ti=
me
tracking it down. What follows is the report, produced with assistance via
Codex/GPT 5.6 Sol.

I hope it may be helpful, and happy to provide any further info!

---------------------------------------------------------------------------=
-----

A Framework Laptop 13 with an AMD Ryzen 7040 Series/Phoenix APU intermitten=
tly
hangs during hibernation. In the most recent occurrence, the first failure
visible on the kernel console was an amdxdna PCI restore timeout:

  amdxdna 0000:c2:00.1: PM: dpm_run_callback(): pci_pm_restore returns -110
  amdxdna 0000:c2:00.1: PM: failed to restore: error -110

This was followed by an unresponsive amdgpu SMU, failed GPU power-gating
operations, and a repeating AMD-PMF/ACPI AML timeout loop. The system remai=
ned
unresponsive and required a forced power-off.

Environment
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  Hardware: Framework Laptop 13, AMD Ryzen 7040 Series (FRANMDCP05)
  APU/GPU:  AMD Phoenix1, PCI 1002:15bf, amdgpu
  NPU:      AMD IPU, PCI 1022:1502, amdxdna
  BIOS:     Framework 03.20, released 2026-06-23
  OS:       NixOS 26.05pre-git
  Kernel:   Linux 7.0.11
  Sleep:    s2idle followed by hibernation after 30 minutes
  Hibernate mode: shutdown
  pm_async: 0

The kernel was built with KASAN, lockdep, DEBUG_LIST, PM debug messages,
no_console_suspend, and ramoops. It also contained Thomas Hellstr=C3=B6m's =
v2
nested-sublists TTM patch for drm/amd#5387. I have not yet reproduced this
particular failure on an otherwise unmodified upstream kernel.

Sequence
=3D=3D=3D=3D=3D=3D=3D=3D

1. systemd-suspend-then-hibernate entered s2idle.
2. The RTC woke the system after approximately 30 minutes.
3. s2idle resume completed successfully. amdgpu reported:

     amdgpu 0000:c1:00.0: SMU is resumed successfully!
     PM: resume of devices complete after 1356.807 msecs
     PM: suspend exit

4. systemd immediately began hibernation:

     systemd-sleep: Performing sleep operation 'hibernate'...
     PM: hibernation: hibernation entry
     Filesystems sync: 0.041 seconds
     Freezing user space processes

5. The durable journal stops at that point because userspace and the filesy=
stems
   were frozen. The console subsequently showed the amdxdna restore timeout
   quoted above.

6. The following failures then appeared:

     usb usb5: root hub lost power or was reset
     usb usb6: root hub lost power or was reset
     usb usb7: root hub lost power or was reset

     amdgpu 0000:c1:00.0: SMU: No response ...
     amdgpu 0000:c1:00.0: Failed to enable gfxoff!
     amdgpu 0000:c1:00.0: Failed to power gate JPEG!
     amdgpu 0000:c1:00.0: [drm] *ERROR* Dpm disable jpeg failed, ret =3D -6=
2
     amdgpu 0000:c1:00.0: Failed to power gate VCN instance 0!
     amdgpu 0000:c1:00.0: [drm] *ERROR* Dpm disable vcn failed, ret =3D -62

     ACPI Error: Aborting method \_SB.A010 due to previous error
                 (AE_AML_LOOP_TIMEOUT)
     ACPI Error: Aborting method \_SB.A032 due to previous error
                 (AE_AML_LOOP_TIMEOUT)
     ACPI Error: Aborting method \_SB.ALIB due to previous error
                 (AE_AML_LOOP_TIMEOUT)
     ACPI Error: Aborting method \_SB.APX8 due to previous error
                 (AE_AML_LOOP_TIMEOUT)
     ACPI Error: Aborting method \_SB.PMF.PMF8 due to previous error
                 (AE_AML_LOOP_TIMEOUT)
     ACPI Error: Aborting method \_SB.PMF.APMF due to previous error
                 (AE_AML_LOOP_TIMEOUT)
     amd-pmf AMDI0102:00: APMF method:8 call failed

The ACPI/PMF group repeated approximately every 30 seconds.

Frequency and controls
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The failure is intermittent. An earlier full hibernate/resume cycle in the =
same
boot succeeded.

A similar terminal AMD-PMF/ACPI loop previously occurred on BIOS 03.17. The
recurrence on BIOS 03.20 shows that the current Framework firmware does not
prevent it, although only the latest occurrence captured the preceding amdx=
dna
restore failure.

No TTM/list-corruption report, KASAN finding, lockdep splat, or kernel pani=
c was
observed. Ramoops remained empty because the system was forcibly powered of=
f
without a panic.

The known amdxdna query/autosuspend deadlock fixed in Linux 7.0-rc2 should
already be fixed in this 7.0.11 kernel. Its documented trigger and behavior=
 also
appear different.

Current assessment
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

amdxdna is the leading isolation target because its restore timeout is the =
first
captured device callback failure. This does not prove that amdxdna caused t=
he
platform failure: it may instead be the first consumer to observe an
already-unresponsive shared PSP/SMU or firmware path.

Not yet tested:

  1. pm_test=3Dfreezer
  2. pm_test=3Ddevices with amdxdna loaded
  3. pm_test=3Ddevices after removing amdxdna
  4. repeated hibernation on an unmodified current kernel
  5. amd_pmf isolation if removing amdxdna does not change the result

Questions
=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Is pci_pm_restore returning -ETIMEDOUT on Phoenix a known amdxdna failure=
?
- Which amdxdna dynamic-debug messages or tracepoints would be most useful?
- Is removing or unbinding amdxdna before hibernation a valid isolation tes=
t?
- Could a failed NPU restore leave the shared firmware/SMU path in a state =
that
  causes the subsequent amdgpu and AMD-PMF failures?

I posted a full incident report, configuration, and timeline on my personal
NixOS config repo:

  https://github.com/samuela/nixos-config/issues/4#issuecomment-5174630789

Some related external reports found in the process of debugging:

- Older amdxdna suspend/hibernate failure:
  https://github.com/amd/xdna-driver/issues/18

- Same later SMU/PMF failure cascade on another Framework 13 Phoenix system=
:
  https://community.frame.work/t/fedora-40-on-the-framework-laptop-13/47746=
?page=3D3

- Same later cascade on a different AMD platform:
  https://marc.info/?l=3Dlinux-media&m=3D175377491609096&w=3D2

Best,
Samuel Ainsworth
