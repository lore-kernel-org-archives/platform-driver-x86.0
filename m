Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F392B1FB3
	for <platform-driver-x86@vger.kernel.org>; Fri, 19 Sep 2025 20:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758314866; cv=none; b=qWrlzQ/WIG1JXZeBcb+mtqUQygo/Z9jICfV+x55opU7/YMBgTFBLpNrJugsCFFz0Fo7lM0mFnwY/LNyVt7EGCHdp6GxQ0uKufyHhuNVXgI3WmktyfIzw/bsTXoqjYHvytC6thYTwsEq583Q8KA/9ewtb6pJNbKw1pOloYfW4tjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758314866; c=relaxed/simple;
	bh=aT85lW44Erv3qIhOWH/eUsOSkwK6QwnI3JvL+m13Qrk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KWDQZQpo5RUgtv/sOmanAcF2D0MeV4359ZtDI/XwPF6pQqYqMvjlWR+X9SiLDUb5lC2x7nxnab4t/2I/P7IPkzTJQBySvrYRY4IXox/+0CwL+Seb6qGRXYOAzmeN0PNBEWMob/YXg5uy74OhtCFx/DgT819lFUwNPjkGUXXquuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cjEmEMr7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cjEmEMr7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B9FAC4CEF0;
	Fri, 19 Sep 2025 20:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758314865;
	bh=aT85lW44Erv3qIhOWH/eUsOSkwK6QwnI3JvL+m13Qrk=;
	h=From:To:Cc:Subject:Date:From;
	b=cjEmEMr7Itw671+Vpl93Ms3hr1TjC4jRs7Oz4RVYurZCmmssmn71wwxsfJ4rMBKYJ
	 etquWhnZSfrG1Ypw863fcHgmGgbJ1wXJs/Kd6ZT3uCjIbzrzLGn6PZmzPr60H0zXdC
	 zPOOwIl2A0XlguuDS6j0veDkpy71yvPoJUdF1Ue83TKVH1bWMLRCR9yPimEJ+dzyH4
	 FA3d5x3xmnh/bj9C8MjuzI/3wYQ7ppVWKqtxYPgTCJeygGqqDxW2eVN8elQMfFaTJN
	 /l/dZeUhWwP6heEAUSRsNetF6sozpkhAB8Tp5zJFSlJNSZPRxjK8yHebuMT6Tg/ib0
	 cgBgAMdTUjH6g==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 00/19] x86-android-tablets: convert to use GPIO references + Acer A1-840 support
Date: Fri, 19 Sep 2025 22:47:23 +0200
Message-ID: <20250919204742.25581-1-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

Dmitry's v2 cover-letter:

"This series came about because now software nodes can be used to
describe GPIOs (via PROPERTY_ENTRY_GPIO() macros) and I would like to
eventually get rid of gpio_keys_platform_data structure.

So while I was doing the conversions from GPIO_LOOKUP() tables for
gpio_keys devices I decided to convert the rest of them as well. Maybe
some time in the future we can drop support for GPIO_LOOKUP() and rely
on device properties exclusively."

Changes in v3:
- Add missing pinctrl_put() in lenovo_yoga_tab2_830_1050_init_codec()
  error-exit paths after the pinctrl_get_select() succeeds

- Adding a swnode to the yt3 spi device changes the name of the SPI/codec
  device and the sound/soc/intel/boards/bytcr_wm5102.c machine driver looks
  up the code by name, update the machine driver to use the new name.

- Make yoga-tab2-pro-1380-fastcharger.c propagate the fwnode set on
  the platform-device to the serdev it creates to fix this.

- Fix the commit message of "platform/x86: x86-android-tablets: convert
  gpio_keys devices to GPIO references" which contained a stray reference
  to wm5102.

New patches in v3:

- Change sw_bat register mechanism into a generic swnode_group mechanism

- Use swnode_group mechanism to register groups needed, instead of having
  init() callbacks manually do this

- Changed my email address in the driver to hansg@kernel.org

- Rebased "platform/x86: x86-android-tablets: Add support for Acer A1-840
  tablet" on top, switched that to also use software-nodes for GPIOs and
  added it to this series

- Some Lenovo Yoga Tab 2 support fixes

Regards,

Hans



Dmitry Torokhov (11):
  platform/x86: x86-android-tablets: convert Goodix devices to GPIO
    references
  platform/x86: x86-android-tablets: convert Wacom devices to GPIO
    references
  platform/x86: x86-android-tablets: convert HiDeep devices to GPIO
    references
  platform/x86: x86-android-tablets: convert Novatek devices to GPIO
    references
  platform/x86: x86-android-tablets: convert EDT devices to GPIO
    references
  platform/x86: x86-android-tablets: convert int3496 devices to GPIO
    references
  platform/x86: x86-android-tablets: convert wm1502 devices to GPIO
    references
  platform/x86: x86-android-tablets: convert HID-I2C devices to GPIO
    references
  platform/x86: x86-android-tablets: convert Yoga Tab2 fast charger to
    GPIO references
  platform/x86: x86-android-tablets: remove support for GPIO lookup
    tables
  platform/x86: x86-android-tablets: convert gpio_keys devices to GPIO
    references

Hans de Goede (8):
  platform/x86: x86-android-tablets: replace bat_swnode with
    swnode_group
  platform/x86: x86-android-tablets: use swnode_group instead of manual
    registering
  platform/x86: x86-android-tablets: Update my email address
  platform/x86: x86-android-tablets: Move Acer info to its own file
  platform/x86: x86-android-tablets: Add support for Acer A1-840 tablet
  platform/x86: x86-android-tablets: Simplify
    lenovo_yoga_tab2_830_1050_exit()
  platform/x86: x86-android-tablets: Fix modules lists for Lenovo
    devices
  platform/x86: x86-android-tablets: Stop using EPROBE_DEFER

 .../lenovo/yoga-tab2-pro-1380-fastcharger.c   |   7 +
 .../platform/x86/x86-android-tablets/Makefile |   2 +-
 .../platform/x86/x86-android-tablets/acer.c   | 247 +++++++++++++
 .../platform/x86/x86-android-tablets/asus.c   | 108 +++---
 .../platform/x86/x86-android-tablets/core.c   | 121 ++++---
 .../platform/x86/x86-android-tablets/dmi.c    |  12 +-
 .../platform/x86/x86-android-tablets/lenovo.c | 291 ++++++++-------
 .../platform/x86/x86-android-tablets/other.c  | 338 ++++++------------
 .../x86/x86-android-tablets/shared-psy-info.c |  34 +-
 .../x86/x86-android-tablets/shared-psy-info.h |   8 +-
 .../x86/x86-android-tablets/vexia_atla10_ec.c |   2 +-
 .../x86-android-tablets/x86-android-tablets.h |  28 +-
 sound/soc/intel/boards/bytcr_wm5102.c         |   2 +-
 13 files changed, 722 insertions(+), 478 deletions(-)
 create mode 100644 drivers/platform/x86/x86-android-tablets/acer.c

-- 
2.51.0

