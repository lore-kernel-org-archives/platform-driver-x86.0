Received: from mail-4318.protonmail.ch (mail-4318.protonmail.ch [185.70.43.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6794E4C2C;
	Fri,  2 Oct 2026 15:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955785; cv=none; b=lDEPy7apyP6/3yljJ3oDcUUIzFtNVBxgyqODhLv6+TZBH4WpM//1xttlhDpyNmmwMrUTrcXQ4kLAwSDmjm6dGHVhCNd+Gu1a4e9yOH5NPoxsKrOAqLEEvoehWgEWiFWEiJl40JX3qFeHReOhpBkjGunkbL8YGEfNP/HTYvQVheY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955785; c=relaxed/simple;
	bh=pwFQuhlI8NnLNGRFebd1hncDfW78pQJ7ee3vDwSUBbs=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OUYJI07ZebmYU+YQYImkYk2wgus/EjX2qgqTOoTMQqBonlKiCJMMBNEsn9PwiuYcw5Obug4eg5MMvSnIG6Mw1JmPSF7eZA2jFNoGkD0xZWhho306K1E76NnsarkUmFZvYp8T/UIECrHO7mIzzd8KG6wVSQgGdDKEruUP04FrOEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ironrobin.net; spf=pass smtp.mailfrom=ironrobin.net; dkim=pass (2048-bit key) header.d=ironrobin.net header.i=@ironrobin.net header.b=o6pBIYJD; arc=none smtp.client-ip=185.70.43.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ironrobin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ironrobin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ironrobin.net header.i=@ironrobin.net header.b="o6pBIYJD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ironrobin.net;
	s=protonmail3; t=1790955773; x=1791214973;
	bh=EeqTU+LlTy6G1qbpluX2g5EBlu1Dkl7hQ2X+SG+KLNE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=o6pBIYJDwLtC9aGN1ZeClrNl3LOKgB3gY3UwiwMPwpz+oSrt1Gdk/Xy8IJFDkbw+Q
	 RJRE9ArHYQOXvrqdlNAHNCiZN2LNeR2lM4khyQiX2gjFy1lDeiANhLnHc9aclFp7F2
	 HOTh0hGsOVxhGtLoJNDiPtqZqaQlvnK+84GOnmGSFT3e0weHpdYotBoMmomtTobSyE
	 b7vaiytPSwV5u5bEgyQ1dZ5XDw+ZcXlTzSWrEjhdfs7k69YO6NNr8+FtCDtrjBpyGL
	 bP062lbb+zFfnWpd/Xa4Y9nC7wY8DVzuASDmdppcsbjiemczyvY+znRb2DcpNEcF4G
	 iGjavOy6OYHTw==
Date: Fri, 02 Oct 2026 15:42:48 +0000
To: Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
From: Alex Robinson <alex@ironrobin.net>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Steev Klimaszewski <threeway@gmail.com>, platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/3] Lenovo ThinkPad X13s embedded controller support
Message-ID: <20261002154231.31376-1-alex@ironrobin.net>
Feedback-ID: 54785507:user:proton
X-Pm-Message-ID: 946905ba5b7717f0c693640c99d0c57bd5d0515d
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

Testing:
- Confirmed GPIO103's firmware-inherited pull-up on a ThinkPad X13s using
  a vanilla kernel with temporary probe-time instrumentation.
- Verified that all three v5 patches apply in order to Linux v7.3-rc4
  without the separate PCI workaround and reproduce the current EC
  source files byte-for-byte.
- Earlier v2 hardware testing covered keyboard-backlight control,
  firmware brightness changes, s2idle, lid-close/open brightness
  restoration, and EC wake events. Those results are historical and do
  not establish validation of the complete v5 series or its revised PM
  handling. No v5 build or runtime validation was performed while
  preparing this submission directory.

Earlier series:
https://lore.kernel.org/all/20260925215358.33417-1-alex@ironrobin.net/

Alex Robinson (3):
  dt-bindings: embedded-controller: Add Lenovo ThinkPad X13s EC
  platform: arm64: Add Lenovo ThinkPad X13s EC driver
  arm64: dts: qcom: sc8280xp-x13s: Add embedded controller

base-commit: 93f51579e7df248780214094418f205253383cc5

