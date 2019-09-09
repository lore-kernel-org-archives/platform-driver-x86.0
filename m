From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v3 00/13] software node: add support for reference properties
Date: Mon,  9 Sep 2019 01:15:44 -0700
Message-ID: <20190909081557.93766-1-dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

These series implement "references" properties for software nodes as true
properties, instead of managing them completely separately.

The first 10 patches are generic cleanups and consolidation and unification
of the existing code; patch #11 implements PROPERTY_EMTRY_REF() and friends;
patch #12 converts the user of references to the property syntax, and patch
#13 removes the remains of references as entities that are managed
separately.

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

Dmitry Torokhov (13):
  software node: remove DEV_PROP_MAX
  software node: clean up property_copy_string_array()
  software node: get rid of property_set_pointer()
  software node: simplify property_get_pointer()
  software node: remove property_entry_read_uNN_array functions
  software node: unify PROPERTY_ENTRY_XXX macros
  software node: simplify property_entry_read_string_array()
  software node: introduce PROPERTY_ENTRY_ARRAY_XXX_LEN()
  efi/apple-properties: use PROPERTY_ENTRY_U8_ARRAY_LEN
  software node: rename is_array to is_inline
  software node: implement reference properties
  platform/x86: intel_cht_int33fe: use inline reference properties
  software node: remove separate handling of references

 drivers/base/swnode.c                    | 243 +++++++----------------
 drivers/firmware/efi/apple-properties.c  |   8 +-
 drivers/platform/x86/intel_cht_int33fe.c |  81 ++++----
 include/linux/property.h                 | 154 +++++++-------
 4 files changed, 198 insertions(+), 288 deletions(-)

-- 
2.23.0.187.g17f5b7556c-goog
