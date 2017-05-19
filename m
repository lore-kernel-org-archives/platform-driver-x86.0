From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v2 0/8] fujitsu-laptop: use device-specific data instead of module-wide globals
Date: Fri, 19 May 2017 09:44:40 +0200
Message-ID: <20170519074448.12716-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

fujitsu-laptop registers two ACPI drivers that access each other's
module-wide structures.  To improve data encapsulation and lay the
groundwork for separating the two aforementioned ACPI drivers into
separate modules, move away from module-wide global data structures by
using device-specific data instead.

To avoid breaking a working feature (backlight power synchronization
upon module load), this series leaves the module-wide struct fujitsu_bl
in place.  It will be taken care of when the backlight driver is split
into a separate module.

As we agreed that grabbing a handle to an ACPI device using its absolute
path is not a truly elegant solution, this series uses a different
approach to call_fext_func() than v1.  By passing that function a
pointer to a struct acpi_device instead of an acpi_handle, all relevant
static functions of the module will now use the same type for their
first argument and the acpi_handle fields of both module-wide structures
are removed altogether.

This patch series was tested on a Lifebook S7020 and a Lifebook E744.

As with v1, adhering to the "one logical change per patch" rule was
tricky.  If the changes introduced are illegible, I will be happy to
further explain and/or improve the series.  Using --color-words should
make reviewing much more manageable.

Changes from v1:

  - Drop patch 01/10 from v1, i.e. do not introduce fext_*() helper
    functions.

  - Drop patch 02/10 from v1 as the acpi_handle fields of both
    module-wide structures are removed altogether by other patches.

  - Replace patch 03/10 from v1 with patch 6/8, passing call_fext_func()
    a pointer to struct acpi_device instead of an acpi_handle.

  - Drop patch 04/10 from v1, thus deferring driver separation until the
    split into separate modules.  Consider patch 5/8 a partial spiritual
    successor ;)  More information is available in the commit message of
    that patch.

  - Add an additional check to patch 2/8 to avoid a NULL dereference
    which could happen due to patch 04/10 from v1 being dropped.

  - Do not store ACPI handles in private structures.  Instead, extract
    them directly from struct acpi_device pointers passed as function
    arguments.

  - Updated commit messages.

  - As the above might be a bit confusing, here is the patch number
    mapping from v1 to v2:

        v1    | v2
	------+--------
        01/10 | dropped
        02/10 | dropped
        03/10 | 6/8
        04/10 | 5/8
        05/10 | 1/8
        06/10 | 2/8
        07/10 | 3/8
        08/10 | 4/8
        09/10 | 7/8
        10/10 | 8/8

 drivers/platform/x86/fujitsu-laptop.c | 417 +++++++++++++++++-----------------
 1 file changed, 213 insertions(+), 204 deletions(-)

-- 
2.13.0
