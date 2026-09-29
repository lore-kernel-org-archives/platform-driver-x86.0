Received: from mail-24422.protonmail.ch (mail-24422.protonmail.ch [109.224.244.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5DC50B8CB;
	Tue, 29 Sep 2026 19:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790710190; cv=none; b=uUcZkiTgRq3qGq4JwumgU5wCbNuCNjGwZlNteUpzklp0o0OkCk9YXTD728PAVp2mU/NDeEy0oy5GBRwIIkbytTh85M6UJhosyA41Vk3Qvb8EgHrehQ1DmQGUSJRbCbUmSyqNcpqWb/DbqAnUxDyhCkEuUZpEYVztakX2ObbofUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790710190; c=relaxed/simple;
	bh=3z78U6ewUrt+RGwoXgbE78coGKF5z18YOLvbHXnXIUg=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qZFGXZluHHDr7idZJi8DTcgdWheFD5PbuV6YYDI76ID9sjXlYpEIUhYGSSobgDKybKKG5p1Y2JW24PoT6ViQS4IG43DNh0VoZTbD9Q7W795QuqBEBicsmEcwiV66S87Z3jaSST2Xl3KB/fBXuWXXDocqk4RskGp8tYIEZEu1jRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ironrobin.net; spf=pass smtp.mailfrom=ironrobin.net; dkim=pass (2048-bit key) header.d=ironrobin.net header.i=@ironrobin.net header.b=BolzSXhn; arc=none smtp.client-ip=109.224.244.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ironrobin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ironrobin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ironrobin.net header.i=@ironrobin.net header.b="BolzSXhn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ironrobin.net;
	s=protonmail3; t=1790710178; x=1790969378;
	bh=z33BuqQYyeNmXMvblMjr2WqewbZtIRphsrRoxB31ueY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=BolzSXhnKIF5z1zkiiYykw5YuJOsZgYk4VjfTEWI9X36hT5xXHID4X7imFfU4vFM1
	 fa86JeN+BhYBXsOQZlIr1g9QHm3UMmJgRnIHVasCRCwYUdQB+MasNkc/Ayf1nZfIZ0
	 2nf+9wqNh1rHGFZfkgJ9d9TSdzm7bZU7ZH604Wfpyq4QrLVei3J++CjpwaZBuGE2bJ
	 2JHWA8qvFHO1/UXN+/ZL9Ud39hFJNwlpSXAmfVw6fsrFuriP5mNQUQLLzwkPhorr/I
	 Nq2+UcgotYe0AG5ftMkTYS0Wqp3468hMw4kY1TBBQss9ZMZJdmtqBGaUyoHCuGz315
	 pXXe88c2F/dbg==
Date: Tue, 29 Sep 2026 19:29:32 +0000
To: Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
From: Alex Robinson <alex@ironrobin.net>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Steev Klimaszewski <threeway@gmail.com>, platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] Lenovo ThinkPad X13s embedded controller support
Message-ID: <20260929192908.16507-1-alex@ironrobin.net>
Feedback-ID: 54785507:user:proton
X-Pm-Message-ID: f570a8012b5df92eb02247b46633b3ea7669892c
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
an unwanted wakeup and no selective event mask is known. Userspace can
enable wakeup when desired. Other EC event mappings remain outside the
scope of this series.

This follows earlier X13s EC work by Konrad Dybcio and Steev Klimaszewski.
Development was assisted by an LLM, including analysis of the X13s ACPI
DSDT and review of the implementation.

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

Testing:
- Confirmed GPIO103's firmware-inherited pull-up on a ThinkPad X13s using
  a vanilla kernel with temporary probe-time instrumentation.
- Verified that all three v4 patches apply in order to Linux v7.3-rc4
  without the separate PCI workaround.
- Earlier v2 hardware testing covered keyboard-backlight control,
  firmware brightness changes, s2idle, lid-close/open brightness
  restoration, and EC wake events. Those results are historical and do
  not establish validation of the complete v4 series or default-off
  wakeup policy. Full v4 build and runtime validation remain outstanding.

Earlier series:
https://lore.kernel.org/all/20260925215358.33417-1-alex@ironrobin.net/

Alex Robinson (3):
  dt-bindings: embedded-controller: Add Lenovo ThinkPad X13s EC
  platform: arm64: Add Lenovo ThinkPad X13s EC driver
  arm64: dts: qcom: sc8280xp-x13s: Add embedded controller

base-commit: 93f51579e7df248780214094418f205253383cc5

