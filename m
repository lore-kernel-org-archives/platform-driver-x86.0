From: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: [GIT PULL] Device properties framework updates for v5.3-rc1
Date: Mon, 8 Jul 2019 23:39:24 +0200
Message-ID: <CAJZ5v0g8O+XLjSarCiZcj0LnSZYnCqGE3D6tfFD30wOZjprb2g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi Linus,

Please pull from the tag

 git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
 devprop-5.3-rc1

with top-most commit 33ee09cd59ce154b64f9df942dfa5456db90d5f9

 device property: Add helpers to count items in an array

on top of commit f2c7c76c5d0a443053e94adb9f0918fa2fb85c3a

 Linux 5.2-rc3

to receive device properties framework updates for 5.3-rc1.

These add helpers for counting items in a property array and
extend the "software nodes" support to be more convenient for
representing device properties supplied by drivers and make
the intel_cht_int33fe driver use that.

Specifics:

 - Add helpers to count items in a property array (Andy Shevchenko).

 - Extend "software nodes" support to be more convenient for
   representing device properties supplied by drivers (Heikki
   Krogerus).

 - Add device_find_child_by_name() helper to the driver core (Heikki
   Krogerus).

 - Extend device connection code to also look for references provided
   via fwnode pointers (Heikki Krogerus).

 - Start to register proper struct device objects for USB Type-C
   muxes and orientation switches (Heikki Krogerus).

 - Update the intel_cht_int33fe driver to describe devices in a more
   general way with the help of "software nodes" (Heikki Krogerus).

Thanks!


---------------

Andy Shevchenko (1):
      device property: Add helpers to count items in an array

Heikki Krogerus (16):
      software node: Allow node creation without properties
      software node: Simplify software_node_release() function
      software node: Add support for static node descriptors
      software node: Use kobject name when finding child nodes by name
      software node: Add software_node_get_reference_args()
      driver core: Add helper device_find_child_by_name()
      ACPI / property: Don't limit named child node matching to data nodes
      device property: Introduce fwnode_find_reference()
      device connection: Find connections also by checking the references
      usb: typec: Registering real device entries for the muxes
      platform/x86: intel_cht_int33fe: Register max17047 in its own function
      platform/x86: intel_cht_int33fe: Remove unused fusb302 device property
      platform/x86: intel_cht_int33fe: Provide software nodes for the devices
      platform/x86: intel_cht_int33fe: Provide fwnode for the USB connector
      platform/x86: intel_cht_int33fe: Supply fwnodes for the external
dependencies
      platform/x86: intel_cht_int33fe: Replacing the old connections
with references

---------------

 drivers/acpi/property.c                  |  26 ++-
 drivers/base/core.c                      |  28 +++
 drivers/base/devcon.c                    |  26 +++
 drivers/base/property.c                  |  24 +++
 drivers/base/swnode.c                    | 324 ++++++++++++++++++++++++-------
 drivers/platform/x86/intel_cht_int33fe.c | 291 ++++++++++++++++++++++-----
 drivers/usb/roles/class.c                |   2 +-
 drivers/usb/typec/bus.h                  |  15 ++
 drivers/usb/typec/class.c                |  17 +-
 drivers/usb/typec/mux.c                  | 238 ++++++++++++++++-------
 drivers/usb/typec/mux/pi3usb30532.c      |  46 +++--
 include/linux/device.h                   |   2 +
 include/linux/property.h                 |  95 +++++++++
 include/linux/usb/typec_mux.h            |  62 +++---
 14 files changed, 947 insertions(+), 249 deletions(-)
