Received: from mail-4318.protonmail.ch (mail-4318.protonmail.ch [185.70.43.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907CF4D4876;
	Mon, 28 Sep 2026 22:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790634098; cv=none; b=iVkdcWnbpILJW4/sIT4JkCm9XPeJJzzfdWQ3Oe+0fvJ+lKWlXQHGopHiBpg7q86Qxxsz9m/mKznOqKzm0xRYCHwHN+mX45MbxTPjxGupr70+CYIk1tOzufHeLrLEcc1v3qudkPzza0Bac7m38gC572pIrKtF2LOujMikkeTkvPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790634098; c=relaxed/simple;
	bh=CUw/KgZp6nX3qcURn+sjsT026rLSXQ1mNhFGzks4upo=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IpqARd4Nv3YlUfb5XbJSuKcgOCRgv3RJmjR9uA16eaMOzsbKp6rCeQ37qyAq52Xg6EX/aiUvGM9+lnNUXOkoNAYaDqbIR+VPkCnPHNT00IgCqMSpXx5FyCKsIv2SzkDjL/efoUID3neyqeD6pG/X4nxGkv8NDMf76ZumHm6l9yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ironrobin.net; spf=pass smtp.mailfrom=ironrobin.net; dkim=pass (2048-bit key) header.d=ironrobin.net header.i=@ironrobin.net header.b=aAQmCxkI; arc=none smtp.client-ip=185.70.43.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ironrobin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ironrobin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ironrobin.net header.i=@ironrobin.net header.b="aAQmCxkI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ironrobin.net;
	s=protonmail3; t=1790634086; x=1790893286;
	bh=iRbeTs4tZFymXZFw9/v48DmpvAx0bac2gHRH6vWGRdM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=aAQmCxkIzclgfgueYTsc0QCb9sry0DWSyw2HrcMDgH+A44kEdPuAECpZDjj9TLvls
	 hrFMm3q7m3rgoHUB3X6crmcQ7kObj/eNESy5xq2Y4xdF9JahRuBt56ckeAofpocJmf
	 +qAT8mjEIbCLyAYBEVC/uxZVky8YueJifT/s/R9q4K1rFkJZECwKF040B6k2cWMVjq
	 ElsooDWTag6je0srvotg8ezXyWkLTSDmfPn3Icg/I9SsjE+0ozQ/TM1gvkS/jwE8fI
	 gSW1WAcJPDMbItRe+BjguEHs+OxY9bQdLd8xw2+A/qcYy15y9iu8FnPUDo0+9c6Wcs
	 7Zrr5GnJAUKJQ==
Date: Mon, 28 Sep 2026 22:21:21 +0000
To: Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
From: Alex Robinson <alex@ironrobin.net>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Steev Klimaszewski <threeway@gmail.com>, platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] Lenovo ThinkPad X13s embedded controller support
Message-ID: <20260928222056.10044-1-alex@ironrobin.net>
Feedback-ID: 54785507:user:proton
X-Pm-Message-ID: 14a5ad8ba92e33eb19a72849a7472ee9c09b87fa
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add support for the embedded controller found in the Lenovo ThinkPad X13s.

The X13s EC uses an I2C command transport similar to the ThinkPad T14s EC,
but its event, keyboard backlight, and power-management interfaces differ
enough to warrant a separate driver.

The EC event interrupt is provided by GPIO103. GPIO176 is a separate
host-controlled power-state signal used during low-power transitions. The
driver follows the EC command and GPIO sequencing described by the X13s
ACPI DSDT and defers EC event queries during suspend until the I2C
controller is available again on resume.

This initial series provides EC transport, power-management support, and
keyboard-backlight control. Other EC events have been left for follow-up
work rather than exposing unverified input mappings.

Disable EC wakeup by default, following the existing upstream ThinkPad
T14s EC driver policy. The EC interrupt multiplexes multiple events and
no selective X13s EC wake-event mask is currently known. In particular,
lid-close event 0x53 can wake the system, but the event type cannot be
determined until the system has resumed far enough to query the EC over
QUP8/I2C. Rather than attempting to filter an already-triggered wakeup,
disable EC wake broadly. Other EC events therefore cannot wake the system
by default either; another enabled wake source is needed. Feedback is
welcome if a selective X13s EC event-mask mechanism is known.

Normal runtime EC interrupts remain enabled. The low-power entry sequence
(0x80 <- 0x55, GPIO176 low), exit sequence (GPIO176 high, 10 ms delay,
0x80 <- 0xaa), deferred-event handling, and backlight behavior are unchange=
d
from v2. No speculative event filtering or EC register writes are added.

Retain wakeup-source in the DT node, binding, and example: it describes
hardware capability, not the driver's default wake policy. The I2C core
initializes wake capability and associates the IRQ before driver probe;
device_wakeup_disable() in probe disables policy without disabling normal
IRQ handling. Userspace can explicitly re-enable power/wakeup, with the
same risk of unwanted wakeups. This is a default-off policy, not a removal
of hardware wake capability.

This follows earlier X13s EC work by Konrad Dybcio and Steev Klimaszewski.

Development was assisted by an LLM, including analysis of the decompiled
X13s ACPI DSDT and review of the resulting implementation.

This series is based on Linux v7.3-rc4.

The v3 series was tested on a Lenovo ThinkPad X13s. With EC wake
disabled, runtime EC events continue to work and keyboard-backlight
state remains preserved across both manual s2idle and lid-triggered
suspend/resume. Closing the lid while the system is already suspended
does not wake it, while opening the lid still wakes the system through
the separate lid wake path. The QUP8 pin configuration was also
previously verified on hardware.

For v3, the package patches pass an application check and the driver
builds as an ARM64 module with W=3D1. Checkpatch reports no errors (only
the generic MAINTAINERS reminders; the series includes an entry).
A source comparison confirms that the only C changes from v2 are the
wakeup API include and the probe-time wake policy with its explanation.

Changes in v3:
- Disable EC system wakeup by default using device_wakeup_disable(), as
  in the upstream T14s EC driver, without disabling runtime IRQ handling.
- Explain why unknown selective event masking requires disabling EC wake
  broadly, and invite information about a selective X13s mechanism.
- Retain the DT wakeup-source capability description and all v2 low-power,
  deferred-event, and backlight behavior.
- Remove the Kconfig help text's claim of wake support.
- Verify on hardware that disabling EC wake prevents lid-close wake
  without breaking runtime EC events, lid-open wake, or backlight state
  restoration across suspend/resume.

Changes in v2:
- Make keyboard-backlight snapshot and EC power-management operations
  best-effort so EC failures do not prevent system suspend or resume.
- Save firmware-selected keyboard-backlight brightness in the EC on
  Fn+Space, following the DSDT's SCMS(0x20) operation.
- Save software-selected keyboard-backlight brightness in the EC so lid
  opening does not restore a stale setting.
- Restore the EC-saved keyboard-backlight brightness on lid open,
  following the DSDT's SCMS(0x21) operation.
- Process deferred EC events after the normal resume brightness restore
  so a lid-open restore takes precedence.
- Add the QUP8 pinctrl state for GPIO43 and GPIO44 using the configuration
  observed on the running hardware.
- Fix the placement and ordering of the i2c8 and EC pinctrl nodes.

Link: https://lore.kernel.org/all/20260925215358.33417-1-alex@ironrobin.net=
/

Alex Robinson (3):
  dt-bindings: embedded-controller: Add Lenovo ThinkPad X13s EC
  platform: arm64: Add Lenovo ThinkPad X13s EC driver
  arm64: dts: qcom: sc8280xp-x13s: Add embedded controller

