From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [RFC PATCH 00/12] platform/x86: intel_cht_int33fe: Real DisplayPort reference
Date: Fri, 15 Mar 2019 19:57:48 +0300
Message-ID: <20190315165800.5058-1-heikki.krogerus@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi Hans,

This is RFC, so not CCing everybody who should be CCd yet.

I spend a bit of time on thinking how could we use real fwnode
references instead of that string you proposed in order to hook up the
USB Type-C connector with the DisplayPort connector. This is what I
came up with. I was planning on introducing the references to software
nodes in any case like I mentioned before.

I'm not yet adding any sub-nodes for the DP alt mode. I'm just
assigning references to all the relevant components (nodes) for the
USB Type-C connector node. I think that the reference to the
DisplayPort should be assigned to the USB Type-C connector and not
to the alt mode sub-node.

Using these you should be able to add that notifier, and in it just
get the reference to the correct DisplayPort node from the USB Type-C
connector, and then you can simply walk through the drm_connectors and
match using the fwnode.


thanks,


Heikki Krogerus (12):
  software node: Prevent potential NULL Pointer Dereference
  software node: Increment parent node's ref count
  software node: Add support for references
  software node: Implement .get_reference_args fwnode operation
  ACPI / property: Don't limit named child node matching to data nodes
  device connection: Find connections also by checking the references
  platform/x86: intel_cht_int33fe: Provide software node for all
    components
  platform/x86: intel_cht_int33fe: Provide fwnode for the USB connector
  platform/x86: intel_cht_int33fe: Link with external dependencies using
    fwnodes
  platform/x86: intel_cht_int33fe: Replacing the old connections with
    references
  drm: Add fwnode member to the struct drm_connector
  drm/i915: Associate the ACPI connector nodes with connector entries

 drivers/acpi/property.c                  |  26 +-
 drivers/base/devcon.c                    |  28 ++
 drivers/base/swnode.c                    | 165 ++++++++++-
 drivers/gpu/drm/drm_sysfs.c              |  49 +++-
 drivers/gpu/drm/i915/intel_display.c     |  41 +++
 drivers/platform/x86/intel_cht_int33fe.c | 349 ++++++++++++++++++++---
 include/drm/drm_connector.h              |   2 +
 include/linux/property.h                 |   8 +
 8 files changed, 599 insertions(+), 69 deletions(-)

-- 
2.20.1
