From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 4.19 27/46] x86/mm: Fix decoy address handling vs 32-bit builds
Date: Fri, 28 Dec 2018 12:52:21 +0100
Message-ID: <20181228113126.371890647@linuxfoundation.org>
References: <20181228113124.971620049@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181228113124.971620049@linuxfoundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Gert Robben <t2@gert.gr>, Dan Williams <dan.j.williams@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

4.19-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Dan Williams <dan.j.williams@intel.com>

commit 51c3fbd89d7554caa3290837604309f8d8669d99 upstream.

A decoy address is used by set_mce_nospec() to update the cache attributes
for a page that may contain poison (multi-bit ECC error) while attempting
to minimize the possibility of triggering a speculative access to that
page.

When reserve_memtype() is handling a decoy address it needs to convert it
to its real physical alias. The conversion, AND'ing with __PHYSICAL_MASK,
is broken for a 32-bit physical mask and reserve_memtype() is passed the
last physical page. Gert reports triggering the:

    BUG_ON(start >= end);

...assertion when running a 32-bit non-PAE build on a platform that has
a driver resource at the top of physical memory:

    BIOS-e820: [mem 0x00000000fff00000-0x00000000ffffffff] reserved

Given that the decoy address scheme is only targeted at 64-bit builds and
assumes that the top of physical address space is free for use as a decoy
address range, simply bypass address sanitization in the 32-bit case.

Lastly, there was no need to crash the system when this failure occurred,
and no need to crash future systems if the assumptions of decoy addresses
are ever violated. Change the BUG_ON() to a WARN() with an error return.

Fixes: 510ee090abc3 ("x86/mm/pat: Prepare {reserve, free}_memtype() for...")
Reported-by: Gert Robben <t2@gert.gr>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Gert Robben <t2@gert.gr>
Cc: stable@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: platform-driver-x86@vger.kernel.org
Cc: <stable@vger.kernel.org>
Link: https://lkml.kernel.org/r/154454337985.789277.12133288391664677775.stgit@dwillia2-desk3.amr.corp.intel.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 arch/x86/mm/pat.c |   13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

--- a/arch/x86/mm/pat.c
+++ b/arch/x86/mm/pat.c
@@ -519,8 +519,13 @@ static u64 sanitize_phys(u64 address)
 	 * for a "decoy" virtual address (bit 63 clear) passed to
 	 * set_memory_X(). __pa() on a "decoy" address results in a
 	 * physical address with bit 63 set.
+	 *
+	 * Decoy addresses are not present for 32-bit builds, see
+	 * set_mce_nospec().
 	 */
-	return address & __PHYSICAL_MASK;
+	if (IS_ENABLED(CONFIG_X86_64))
+		return address & __PHYSICAL_MASK;
+	return address;
 }
 
 /*
@@ -546,7 +551,11 @@ int reserve_memtype(u64 start, u64 end,
 
 	start = sanitize_phys(start);
 	end = sanitize_phys(end);
-	BUG_ON(start >= end); /* end is exclusive */
+	if (start >= end) {
+		WARN(1, "%s failed: [mem %#010Lx-%#010Lx], req %s\n", __func__,
+				start, end - 1, cattr_name(req_type));
+		return -EINVAL;
+	}
 
 	if (!pat_enabled()) {
 		/* This is identical to page table setting without PAT */
