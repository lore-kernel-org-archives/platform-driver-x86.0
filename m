Received: from mail-106116.protonmail.ch (mail-106116.protonmail.ch [79.135.106.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC8B38911B;
	Sat, 10 Oct 2026 14:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791644153; cv=none; b=isJXHAK5F/t7Yyv8zamsKCTgYQV4x/xvQz1o0gpaKMPO1mlBHyW4BpG+asTk2c9JbSjmbXifNfHowzLy8bt+3DVzNEGmv8ngnfEXTqmMDE8x7Z9OX954p6d3JJvHrkQ/7wPTxchOdAOMeDhSxUNpWtej3cWQ0EuL0mrCSK2i4cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791644153; c=relaxed/simple;
	bh=v939NpmI9a00voLyqehleAh/iDKAshlawobhleSFu6U=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gnSa8rQD6jQphDQG2wbmj/P8UD1Yl8i6PcwVMXpaLbS3ewc/BEGLksS07p9ZkGzpPYlwZqypC5dfuvx2xXGHBGPr27vMJzFvcN9k6+afj1Uf8b7jbKhvM/EkLcG6LTooy4pnPOuL8joAnIW3pvLaOOPeq/TO0/YfahVFFmpUM6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ironrobin.net; spf=pass smtp.mailfrom=ironrobin.net; dkim=pass (2048-bit key) header.d=ironrobin.net header.i=@ironrobin.net header.b=V2USoowJ; arc=none smtp.client-ip=79.135.106.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ironrobin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ironrobin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ironrobin.net header.i=@ironrobin.net header.b="V2USoowJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ironrobin.net;
	s=protonmail3; t=1791644142; x=1791903342;
	bh=fa5JzIYwsqpMionMVxYbp1v67vMfG+bdRlbUt/kaalc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=V2USoowJ8csXDihBUlD+hczjDdEYSXY8iXh4e1LrCkrSLhS/ny7rJ8HpZLqF5E1W4
	 Omgi2xq7EYmax9CFuV6dFFOmf6+YGPOOxrb2fLttrsMzOMtIa9sCt1I0+lzA8l6A3n
	 DfOIvxXNMWxfRuDppQnqaxHkkG+B9wAG4IfusDsW91VzlDjpQIZw93gO1r4zEQWAGl
	 fgCuankXTyspqL8ImmmgfwoKC/L0epIavGQalp9l8owhuSkd04FQIiWBV5SxeQ879l
	 0vMM03MBxp3bzB3qI8lZ8byhojc05xqaQm0h6Ld0Pav9g17qjlFdqrB1bOg3y3Ad7F
	 qbiEzN0a8r7Hw==
Date: Sat, 10 Oct 2026 14:55:36 +0000
To: Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
From: Alex Robinson <alex@ironrobin.net>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Steev Klimaszewski <threeway@gmail.com>, platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/3] Lenovo ThinkPad X13s embedded controller support
Message-ID: <20261010145519.8370-1-alex@ironrobin.net>
Feedback-ID: 54785507:user:proton
X-Pm-Message-ID: 34815f69c52f96980c821e0f394f0119bafda55e
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add Device Tree support for the ThinkPad X13s embedded controller,
providing keyboard-backlight control and firmware-driven brightness
notifications. Its event, backlight and power-management interfaces
differ from the T14s EC and require a separate driver.

EC wakeup remains disabled by default because lid closure can trigger
an unwanted wakeup and no selective event mask is known. Other EC event
mappings remain outside the scope of this series.

This follows earlier X13s EC work by Konrad Dybcio and Steev Klimaszewski.
Development was assisted by an LLM, including analysis of the X13s ACPI
DSDT and review of the implementation.

Changes in v6:
- Retry failed low-power entry and exit writes once, matching the X13s
  DSDT's two-attempt ECWS(..., 3) loop without repeating GPIO transitions
  or changing ordinary EC writes.
- Include linux/irq.h explicitly for irq_get_trigger_type() and
  IRQ_TYPE_EDGE_FALLING, addressing the reported s390 build errors.
- Carry Krzysztof Kozlowski's Reviewed-by from v3; the binding is unchanged=
.

Changes in v5:
- Replace the private suspended/access-blocked flag and deferred-event
  handling with IRQ quiescing and LED class suspend/resume helpers.
- Flush pending LED brightness restoration before re-enabling the EC
  event IRQ, so pending lid events are handled afterwards.
- Preserve the EC lid-restore brightness during PM blanking/restoration.
- Update the LED brightness cache on lid-open restoration without a
  hardware-change notification, avoiding a spurious backlight OSD.
  Retain notifications for firmware-driven changes such as Fn+Space.
- Include dev_printk.h directly for device logging helpers.
- Leave the binding and DTS unchanged from v4.

Changes in v4:
- Set GPIO103 bias-pull-up explicitly, based on its firmware-inherited
  configuration measured at pinctrl probe before Linux claimed or
  configured the pin. CTL offset 0x67000 read 0x00000003 (pull field 3).
  The temporary measurement instrumentation is not included.
- Remove output-high from the GPIO176 pinctrl state. The driver already
  requests GPIOD_OUT_HIGH at probe and controls the line during sleep.
- Restore the suspend brightness snapshot only if it was successfully
  captured during that suspend, avoiding restoration of a stale value.
- Use FIELD_MODIFY(), validate brightness against the LED maximum, and
  simplify transfer error handling and selected mutex-protected paths.
- Include linux/ratelimit.h explicitly and adjust conditional formatting.
- Shorten commit messages to focus on rationale rather than the diff.

Changes in v3:
- Disable EC wakeup by default without disabling runtime IRQ handling.
- Retain wakeup-source as a description of hardware capability.
- Remove the Kconfig help text's claim of wake support.

Changes in v2:
- Make backlight snapshots and EC power-management operations best-effort.
- Save firmware- and software-selected brightness in the EC and restore
  the EC-saved brightness on lid open.
- Process deferred events after the normal resume brightness restore.
- Add QUP8 pin configuration verified on hardware and fix DT node ordering.

Build and software testing (revised v6):
- Rebuilt the revised power-state retry code as an ARM64 driver object
  with W=3D1 and GCC 16.2.1, without warnings.
- Passed 15 mocked tests using the actual write helper and PM function
  bodies, covering success, retry-success, retry-failure, and short writes.
  Verified attempt counts, error results, GPIO ordering, and requested
  10 ms delays with AddressSanitizer and UndefinedBehaviorSanitizer
  enabled. These tests verify software behavior, not physical timing.
- Applied all three patches to clean Linux v7.3-rc4, without the separate
  PCI workaround, using both git apply and patch -Np1 --fuzz=3D0. Both
  produced identical source files, with no offsets or fuzz.
- Checkpatch reported no errors; its only warnings were the generic
  MAINTAINERS reminders (the series includes an entry).

Earlier validation of unchanged DT content:
- Before the retry change, compiled the ARM64 driver object and X13s DTB
  with W=3D1 using GCC 16.2.1 and the package's config.aarch64 after
  olddefconfig. The driver compiled without warnings; the DTB build
  reported four avoid_unnecessary_addr_size warnings in sc8280xp.dtsi
  DSI nodes outside this series.
- Before the retry change, passed dt_binding_check for the unchanged
  lenovo,thinkpad-x13s-ec.yaml binding and its example, and targeted
  validation of the built X13s DTB against that binding.

Hardware testing on a Lenovo ThinkPad X13s booted with revised v6,
including the power-state retry helper:
- Passed manual s2idle suspend/resume.
- Passed lid-close s2idle suspend and lid-open wake.
- Keyboard-backlight level 2 was restored correctly after both cycles.
- Sysfs brightness reported 2 after manual resume.
- No unexpected keyboard-backlight OSD appeared.
- Kernel logs confirmed suspend/resume cycles at 09:29:19-09:29:36 and
  09:35:07-09:35:29.
- No EC, I2C, or GPIO errors appeared in the filtered logs.

Additional hardware testing before the power-state retry change verified
keyboard-backlight levels 0, 1, and 2, including physical brightness,
and Fn+Space firmware-driven changes with correct userspace OSD
notifications and brightness levels.

Earlier series:
https://lore.kernel.org/all/20260925215358.33417-1-alex@ironrobin.net/

Alex Robinson (3):
  dt-bindings: embedded-controller: Add Lenovo ThinkPad X13s EC
  platform: arm64: Add Lenovo ThinkPad X13s EC driver
  arm64: dts: qcom: sc8280xp-x13s: Add embedded controller

base-commit: 93f51579e7df248780214094418f205253383cc5

