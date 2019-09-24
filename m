From: Ayman Bagabas <ayman.bagabas@gmail.com>
Subject: [PATCH v5 0/6] platform/x86: Huawei WMI laptop extras driver
Date: Mon, 23 Sep 2019 22:48:05 -0400
Message-ID: <20190924024821.497-1-ayman.bagabas@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Sinan Kaya <okaya@kernel.org>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Takashi Iwai <tiwai@suse.de>, Ayman Bagabas <ayman.bagabas@gmail.com>, Stuart Hayes <stuart.w.hayes@gmail.com>, Matan Ziv-Av <matan@svgalib.org>, Hans de Goede <hdegoede@redhat.com>, Peng Hao <peng.hao2@zte.com.cn>, Krzysztof Kozlowski <krzk@kernel.org>, Mattias Jacobsson <2pi@mok.nu>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Changes in v5:
* Fix a possible buffer overflow error.

Changes in v4:
* Use int and bint for module params.

Changes in v3:
* Kconfig changes
* Fix NULL cast to int warning.
* Add ACPI_BATTERY as a dependency.

Changes in v2:
* Use battery charge control API.

This patch series introduce changes to huawei-wmi driver that includes:
* Move to platform driver
* Implement driver quirks and parameters
* Implement WMI management interface
* Add micmute LED support through WMI
* Add battery charging protection support through WMI
* Add fn-lock support through WMI
* Add a debugfs interface to WMI

# Move to platform driver

The current driver offers hotkeys and micmute led support only. With
these changes, a platform driver makes more sense since it handles these
changes pretty nicely.

# Implement WMI management interface

Huawei Matebook laptops come with two WMI interfaces. The first being
WMI0 which is considered "legacy" and AFAIK only found on the Matebook X
released in 2017. The second has a UID of "HWMI" and is found in pretty
much all models with a slight difference in implementation except for
the Matebook X (2017). Since this model has two interfaces, some aspects
are controlled through the legacy interface and some through the other
interface. Currently, the legacy interface is not fully implemented and
is only used for hotkeys and further debugging has to be done.

The WMI interface takes a 64 bit integer, although uses 32 bits most of
the time, and returns a 256-260 bytes buffer consists of either one ACPI
buffer of 260 bytes, in the case of Matebook X (2017), or one ACPI
package of two buffers, one with 4 bytes, and the other with 256 bytes.
We only care about the latter 256 buffer in both cases since the 4 bytes
always return zeros. The first byte of this 256 buffer always has the
return status where 1 indicated error. Some models require calling the
WMI interface twice to execute a command.

# Add micmute LED support through WMI

After implementing the WMI interface, micmute LED can be controlled
easily. Models with the legacy interface fall back to ACPI EC method
control since the legacy interface is not implemented.

# Add battery charging protection support through WMI

Most models, that has the WMI interface, are capable of battery
protection where it can control battery charging thresholds and limits
charging the battery to certain values.

# Add fn-lock support through WMI

The behavior of hotkeys is not the same among all models. Some models
require fn-lock to do things like `Ctrl-Ins` or `Alt-PrtSc`. By default,
hotkeys behave as special keys (media keys, Ins, etc), but if a modifier
is used (ctrl, alt, shift) these keys behave as F1-F12 keys. If the Fn
key is toggled on, the hotkeys with or without a modifier, behave as
F1-F12 keys. This makes it impossible to use a modifier and `PrtSc` or
`Ins`.

Now, some models fix this by excluding `PrtSc` and `Ins` keys from being
treated as F11 and F12 keys with the use of a modifier. However, some
models do not, and fixes this by the so called fn-lock.

Fn-lock inverts the behavior of the top row from special keys to F1-F12
keys. So a modifier and a special key would be possible which make
things like `Alt-Ins` possible. Now, with fn-lock we would have 4 modes:

* Fn-key off & fn-lock off - hotkeys treated as special keys using a
  modifier gives F1-F12 keys.
* Fn-key on & fn-lock off - hotkeys treated as F1-F12 keys and using a
  modifier gives F1-F12.
* Fn-key off & fn-lock on - hotkeys are treated as F1-F12 keys and using
  a modifier gives special keys.
* Fn-key on & fn-lock on - hotkeys are treated as special keys and using
  a modifier gives special keys.

# Implement driver quirks and parameters

The driver introduces 3 quirks and 2 parameters that can change the
driver's behavior. These quirks being as:
1. Fixes reporting brightness keys twice since it's already handled by
   acpi-video.
2. Some models need a short delay when setting battery thresholds to
   prevent a race condition when two processes read/write.
3. Matebook X (2017) handles micmute led through the "legacy" interface
   which is not currently implemented. Use ACPI EC method to control
   this led.

and the 2 parameters can enforce the behavior of quirk 1 & 2.

# Add a debugfs interface to WMI

An interface to the WMI management interface that allows easier
debugging.

Ayman Bagabas (6):
  platform/x86: huawei-wmi: Move to platform driver
  platform/x86: huawei-wmi: Add quirks and module parameters
  platform/x86: huawei-wmi: Implement huawei wmi management
  platform/x86: huawei-wmi: Add battery charging thresholds
  platform/x86: huawei-wmi: Add fn-lock support
  platform/x86: huawei-wmi: Add debugfs support

 drivers/platform/x86/Kconfig      |   8 +-
 drivers/platform/x86/huawei-wmi.c | 874 ++++++++++++++++++++++++++----
 2 files changed, 786 insertions(+), 96 deletions(-)


base-commit: b5b3bd898ba99fb0fb6aed3b23ec6353a1724d6f
-- 
2.21.0
