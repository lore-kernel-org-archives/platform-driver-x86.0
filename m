Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702C326738B
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Sep 2025 20:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758398837; cv=none; b=b5ffW+k9o5GNVL0ykrLBpZsqxTd9mpVOVRRMVlGmg5Tr7a1NkmfffQB719DROUWwDS90zlMec38RAqZzPRrKhwtQPYLvzTUvyQroJmlIIN8dmdUMqv9PTQgXOa/eUkGQzNxS1qw55T1IsXwiJnNUxDMySkeobbfi+4K6xNJ7qZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758398837; c=relaxed/simple;
	bh=1GpgVxXGkfDZhZfHWNYan8HlhVMYsl/gncCEz8WUhLg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WH47wzVJNkIvBapujKHkXODzTkLpEf2qPxZ8ad3wJ5Mnnt/RX8YlARgoVjg8YJJrk/lsS866f614j4Fr3fQyUltGpa/hiJAl9uH0qc73IC39ap1wsqeTD2ctvfkB7i4iw5qnEsNUFUkqlZykQOGvtVF3i53XJcnNU5qz9fsARy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LB0EMCxy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LB0EMCxy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C8BAC4CEEB;
	Sat, 20 Sep 2025 20:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758398836;
	bh=1GpgVxXGkfDZhZfHWNYan8HlhVMYsl/gncCEz8WUhLg=;
	h=From:To:Cc:Subject:Date:From;
	b=LB0EMCxybcF5hyi01y0S59dShPj0yVftdED0UTCdM0AzAs9VYtpDd6qipa7eTYf3G
	 DMzdVChh+D4oe0P7nELQNDIPwBWhD3lJmb6pez4X7CVTjiHK3l50ejl1AcNzLLJF9A
	 DefKJO//HmRFUVr3Oh4A/y0OHI22Z7uavC8ezZlPLfUD7A4gYeipK4wcEP4WG48bQg
	 Y81FLf1gmMy6oCQTL7nc4sEClLcP3DWb1R1krOMXS+aQJCNGVn4qwqqOCOP9+SGGN7
	 HPqZlpd9IPzA69+QBWfqOWJxffzjy+3ziCYfV5/eBmw+p7J2MTsW8H3DL/PQFQO64y
	 rZiB0j4wQJVQA==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 00/20] x86-android-tablets: convert to use GPIO references + Acer A1-840 support
Date: Sat, 20 Sep 2025 22:06:53 +0200
Message-ID: <20250920200713.20193-1-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

Original cover-letter from Dmitry's v2 posting:

"This series came about because now software nodes can be used to
describe GPIOs (via PROPERTY_ENTRY_GPIO() macros) and I would like to
eventually get rid of gpio_keys_platform_data structure.

So while I was doing the conversions from GPIO_LOOKUP() tables for
gpio_keys devices I decided to convert the rest of them as well. Maybe
some time in the future we can drop support for GPIO_LOOKUP() and rely
on device properties exclusively."

Follow-up changes / new patches from me:

Changes in v4:
- "convert Yoga Tab2 fast charger to GPIO references" change:
  Split propagating the platform-dev fwnode to the serdev and
  the fwnode_handle_get() call on the serdev fwnode into 2 separate
  statements
- New patch: "Simplify node-group [un]registration"

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

Hans de Goede (9):
  platform/x86: x86-android-tablets: replace bat_swnode with
    swnode_group
  platform/x86: x86-android-tablets: use swnode_group instead of manual
    registering
  platform/x86: x86-android-tablets: Simplify node-group
    [un]registration
  platform/x86: x86-android-tablets: Update my email address
  platform/x86: x86-android-tablets: Move Acer info to its own file
  platform/x86: x86-android-tablets: Add support for Acer A1-840 tablet
  platform/x86: x86-android-tablets: Simplify
    lenovo_yoga_tab2_830_1050_exit()
  platform/x86: x86-android-tablets: Fix modules lists for Lenovo
    devices
  platform/x86: x86-android-tablets: Stop using EPROBE_DEFER

 .../lenovo/yoga-tab2-pro-1380-fastcharger.c   |   5 +
 .../platform/x86/x86-android-tablets/Makefile |   2 +-
 .../platform/x86/x86-android-tablets/acer.c   | 247 +++++++++++++
 .../platform/x86/x86-android-tablets/asus.c   | 108 +++---
 .../platform/x86/x86-android-tablets/core.c   | 118 +++---
 .../platform/x86/x86-android-tablets/dmi.c    |  12 +-
 .../platform/x86/x86-android-tablets/lenovo.c | 291 ++++++++-------
 .../platform/x86/x86-android-tablets/other.c  | 338 ++++++------------
 .../x86/x86-android-tablets/shared-psy-info.c |  34 +-
 .../x86/x86-android-tablets/shared-psy-info.h |   8 +-
 .../x86/x86-android-tablets/vexia_atla10_ec.c |   2 +-
 .../x86-android-tablets/x86-android-tablets.h |  28 +-
 sound/soc/intel/boards/bytcr_wm5102.c         |   2 +-
 13 files changed, 714 insertions(+), 481 deletions(-)
 create mode 100644 drivers/platform/x86/x86-android-tablets/acer.c

-- 
2.51.0

