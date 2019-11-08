From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v8 0/6] software node: add support for reference properties
Date: Thu,  7 Nov 2019 20:22:19 -0800
Message-ID: <20191108042225.45391-1-dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

These series implement "references" properties for software nodes as true
properties, instead of managing them completely separately.

The first 2 patches do away with separate handling of arrays vs
single-value properties, and treat everything as arrays (which really
matches how we handle OF or ACPI properties). Instead we recognize that
data, if it is small enough, may be embedded into property_entry
structure. As a side effect, properties can be converted from having their
data stored separately to embedding their data when they are being copied.

Patch #3 implements PROPERTY_ENTRY_REF() and friends; patch #4 converts
the user of references to the property syntax, and patch #5 removes the
remains of references as entities that are managed separately.

Patch #6 adds unit tests to verify that the handling of property
entries is correct.

Note that patches #4 and $5 can be postponed.

Changes in v8:
- switch data members of "value" union to be arrays to clearly show
  that even when embedding we may be dealing with more than one element
- when parsing references use property_entry_read_int_array() instead of
  fetching u32 value directly from nargs property

Changes in v7:
- rebased onto next-20191107
- dropped already applied patches
- reworked patch that moved small properties inline on copying to
  avoid temporary allocation
- cleaned up logic for embedding vs storing values out-of-line
- fixed handling of embedded 2-element string array on x32

Changes in v6:
- rebased onto next-20191023
- fixed patch moving small properties inline
- fixed handling boolean properties after is_array -> is_inline
  conversion
- changed comments around is_inline "stored directly" vs embedded
  in one place (Andy)
- added unit tests for property entries based on KUnit framework
- added Any's reviewed-by/acked-by

Changes in v5:
- rebased onto next-20191011

Changes in v4:
- dealt with union aliasing concerns
- inline small properties on copy

Changes in v3:
- added various cleanups before implementing reference properties

Changes in v2:
- reworked code so that even single-entry reference properties are
  stored as arrays (i.e. the software_node_ref_args instances are
  not part of property_entry structure) to avoid size increase.
  From user's POV nothing is changed, one can still use PROPERTY_ENTRY_REF
  macro to define reference "inline".
- dropped unused DEV_PROP_MAX
- rebased on linux-next

Dmitry Torokhov (6):
  software node: rename is_array to is_inline
  software node: allow embedding of small arrays into property_entry
  software node: implement reference properties
  platform/x86: intel_cht_int33fe: use inline reference properties
  software node: remove separate handling of references
  software node: add basic tests for property entries

 drivers/base/swnode.c                         | 154 +++---
 drivers/base/test/Makefile                    |   2 +
 drivers/base/test/property-entry-test.c       | 472 ++++++++++++++++++
 .../platform/x86/intel_cht_int33fe_typec.c    |  81 +--
 include/linux/property.h                      |  98 ++--
 5 files changed, 655 insertions(+), 152 deletions(-)
 create mode 100644 drivers/base/test/property-entry-test.c

-- 
2.24.0.rc1.363.gb1bccd3e3d-goog
