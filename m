From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v6 00/15] software node: add support for reference
 properties
Date: Wed, 30 Oct 2019 15:43:04 -0700
Message-ID: <20191030224304.GH57214@dtor-ws>
References: <20191023200233.86616-1-dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191023200233.86616-1-dmitry.torokhov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi Rafael,

On Wed, Oct 23, 2019 at 01:02:18PM -0700, Dmitry Torokhov wrote:
> These series implement "references" properties for software nodes as true
> properties, instead of managing them completely separately.
> 
> The first 10 patches are generic cleanups and consolidation and
> unification of the existing code; patch #11 implements moving of small
> properties inline when copying property entries; patch #12 implements
> PROPERTY_ENTRY_REF() and friends; patch #13 converts the user of
> references to the property syntax, and patch #14 removes the remains of
> references as entities that are managed separately.
> 
> Patch #15 adds unit tests to verify that the handling of property
> entries is correct.

Do you have any concerns with the series? I think Andy did all the
reviewing that he could...

Thanks!

> 
> Changes in v6:
> - rebased onto next-20191023
> - fixed patch moving small properties inline
> - fixed handling boolean properties after is_array -> is_inline
>   conversion
> - changed comments around is_inline "stored directly" vs embedded
>   in one place (Andy)
> - added unit tests for property entries based on KUnit framework
> - added Any's reviewed-by/acked-by
> 
> Changes in v5:
> - rebased onto next-20191011
> 
> Changes in v4:
> - dealt with union aliasing concerns
> - inline small properties on copy
> 
> Changes in v3:
> - added various cleanups before implementing reference properties
> 
> Changes in v2:
> - reworked code so that even single-entry reference properties are
>   stored as arrays (i.e. the software_node_ref_args instances are
>   not part of property_entry structure) to avoid size increase.
>   From user's POV nothing is changed, one can still use PROPERTY_ENTRY_REF
>   macro to define reference "inline".
> - dropped unused DEV_PROP_MAX
> - rebased on linux-next
> 
> Dmitry Torokhov (15):
>   software node: remove DEV_PROP_MAX
>   software node: introduce PROPERTY_ENTRY_ARRAY_XXX_LEN()
>   efi/apple-properties: use PROPERTY_ENTRY_U8_ARRAY_LEN
>   software node: mark internal macros with double underscores
>   software node: clean up property_copy_string_array()
>   software node: get rid of property_set_pointer()
>   software node: remove property_entry_read_uNN_array functions
>   software node: unify PROPERTY_ENTRY_XXX macros
>   software node: simplify property_entry_read_string_array()
>   software node: rename is_array to is_inline
>   software node: move small properties inline when copying
>   software node: implement reference properties
>   platform/x86: intel_cht_int33fe: use inline reference properties
>   software node: remove separate handling of references
>   software node: add basic tests for property entries
> 
>  drivers/base/swnode.c                         | 263 ++++------
>  drivers/base/test/Makefile                    |   2 +
>  drivers/base/test/property-entry-test.c       | 472 ++++++++++++++++++
>  drivers/firmware/efi/apple-properties.c       |  18 +-
>  .../platform/x86/intel_cht_int33fe_typec.c    |  81 +--
>  include/linux/property.h                      | 178 +++----
>  6 files changed, 702 insertions(+), 312 deletions(-)
>  create mode 100644 drivers/base/test/property-entry-test.c
> 
> -- 
> 2.23.0.866.gb869b98d4c-goog
> 

-- 
Dmitry
