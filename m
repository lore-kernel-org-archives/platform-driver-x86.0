Received: from mail-10625.protonmail.ch (mail-10625.protonmail.ch [79.135.106.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B121624DF
	for <platform-driver-x86@vger.kernel.org>; Sat, 26 Sep 2026 19:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790452482; cv=none; b=Klg9CDsZAT6hhSQaqI9wsWnkKVSrdcGS97vcN3O2cXOU6qptHl2rlBbM4aDPWt7GhZja6FoENP+Nqymqdoxyp/yAVVRY+5sdDNOdaB1+Khljr0Npt0RyYBva2rQCSRyg8mmcYzWqeeEsrDlf80Lyacj2+NbWXpEh3J0QCGpCFiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790452482; c=relaxed/simple;
	bh=HMChA79CG3kDNGuFKcfFTG5G16/xttob/WWyetaetWQ=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=j3NwIcUYhlNVkxpWuWBUgniFrCQRmhgzRqX3wjjI8QVgjgyB1K4ia2kA4xFQkmUZfk8v5ZWdEpMelibpipmCNhJ2oGRwnaE09+rRbIHUGXl1jSlKG8eJV2BKOb9W+YiQ5xWCOyy8B1wbrPZCUcexLCTDRU0vctzws7RxeYyF9Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ironrobin.net; spf=pass smtp.mailfrom=ironrobin.net; dkim=pass (2048-bit key) header.d=ironrobin.net header.i=@ironrobin.net header.b=T8NZNVxR; arc=none smtp.client-ip=79.135.106.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ironrobin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ironrobin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ironrobin.net header.i=@ironrobin.net header.b="T8NZNVxR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ironrobin.net;
	s=protonmail3; t=1790452475; x=1790711675;
	bh=iuAtKAdJbw1UynNjCGQffbyf88eQnJmAQsVIYX+mnDQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=T8NZNVxR3CZCYZhuxzy4Lrk+rZob/5Q/ReF3eoAdsYqaG66zizzZt1uj8VSHzk+vY
	 FFIJVExhDpOsBGOln4qUG7jyjdnxHaJa7WHD2207U7YeoCDcVNuTDkG4AaRP07rYXF
	 u5ipAJGkZ85/5khlnJFPNLskhXhBVDZbayVjUqD6DLKV88QehMus31J8FTvpUNb9pG
	 A1BYfUfmO1FjC72mEHrKh7nqpkqlAa6YbnKXQaR2Z4q4olc+fkboA3b3zX6+9lTgpC
	 W8sCgjmTM5OCp21oY9qVgbz8qKIu3jmNwvqPRM4f6WGXUZnt5zOUuwh3dtqGrvzTTd
	 wDSMT4foc7oEw==
Date: Sat, 26 Sep 2026 19:54:29 +0000
To: Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
From: Clover <alex@ironrobin.net>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Steev Klimaszewski <threeway@gmail.com>, platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Lenovo ThinkPad X13s embedded controller support
Message-ID: <20260926195415.5995-1-alex@ironrobin.net>
Feedback-ID: 54785507:user:proton
X-Pm-Message-ID: dc91b69921042d54af3d6d4de83a07cb30c9c365
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

This initial series provides EC transport and power-management support,
wake handling, and keyboard-backlight control. Other EC events have been
left for follow-up work rather than exposing unverified input mappings.

This follows earlier X13s EC work by Konrad Dybcio and Steev Klimaszewski.

Development was assisted by an LLM, including analysis of the decompiled
X13s ACPI DSDT and review of the resulting implementation. The resulting
behavior was verified against the hardware.

This series is based on Linux v7.3-rc4.

The series has been tested on a Lenovo ThinkPad X13s, including keyboard
backlight control and firmware-driven brightness changes, s2idle
suspend/resume, keyboard-backlight state restoration across lid close/open,
and wake from EC events. The QUP8 pin configuration was also verified on
hardware, including Linux ownership of GPIO43 and GPIO44 and the expected
mux, drive-strength, and pull configuration.

The binding passes dt_binding_check. The X13s DTB has also been validated
against the binding, and the driver builds cleanly with W=3D1.

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

Clover (3):
  dt-bindings: embedded-controller: Add Lenovo ThinkPad X13s EC
  platform: arm64: Add Lenovo ThinkPad X13s EC driver
  arm64: dts: qcom: sc8280xp-x13s: Add embedded controller

