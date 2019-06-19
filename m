From: Qian Cai <cai@lca.pw>
Subject: [PATCH v2] x86/efi: fix a -Wtype-limits compilation warning
Date: Wed, 19 Jun 2019 13:47:44 -0400
Message-ID: <1560966464-27644-1-git-send-email-cai@lca.pw>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bp@alien8.de
Cc: ard.biesheuvel@linaro.org, akpm@linux-foundation.org, dvhart@infradead.org, andy@infradead.org, tglx@linutronix.de, mingo@redhat.com, sai.praneeth.prakhya@intel.com, hpa@zytor.com, x86@kernel.org, linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Qian Cai <cai@lca.pw>
List-Id: platform-driver-x86.vger.kernel.org

Compiling a kernel with W=1 generates this warning,

arch/x86/platform/efi/quirks.c:731:16: warning: comparison of unsigned
expression >= 0 is always true [-Wtype-limits]

Fixes: 3425d934fc03 ("efi/x86: Handle page faults occurring while running EFI runtime services")
Signed-off-by: Qian Cai <cai@lca.pw>
---

v2: Add a "Fixes" tag.

 arch/x86/platform/efi/quirks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/platform/efi/quirks.c b/arch/x86/platform/efi/quirks.c
index 632b83885867..3b9fd679cea9 100644
--- a/arch/x86/platform/efi/quirks.c
+++ b/arch/x86/platform/efi/quirks.c
@@ -728,7 +728,7 @@ void efi_recover_from_page_fault(unsigned long phys_addr)
 	 * Address range 0x0000 - 0x0fff is always mapped in the efi_pgd, so
 	 * page faulting on these addresses isn't expected.
 	 */
-	if (phys_addr >= 0x0000 && phys_addr <= 0x0fff)
+	if (phys_addr <= 0x0fff)
 		return;
 
 	/*
-- 
1.8.3.1
