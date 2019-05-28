From: Lennart Glauer <mail@lennart-glauer.de>
Subject: [PATCH] x86/efi: Free efi_pgd with free_pages()
Date: Tue, 28 May 2019 14:58:05 +0200
Message-ID: <20190528125805.2166-1-mail@lennart-glauer.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: ard.biesheuvel@linaro.org, dvhart@infradead.org, andy@infradead.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com
Cc: x86@kernel.org, linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Lennart Glauer <mail@lennart-glauer.de>
List-Id: platform-driver-x86.vger.kernel.org

This patch fixes another occurrence of free_page() that was missed
in 06ace26.
The efi_pgd is allocated as PGD_ALLOCATION_ORDER pages and therefore must
also be freed as PGD_ALLOCATION_ORDER pages with free_pages().

Signed-off-by: Lennart Glauer <mail@lennart-glauer.de>
---
 arch/x86/platform/efi/efi_64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/platform/efi/efi_64.c b/arch/x86/platform/efi/efi_64.c
index 08ce8177c3af..acad22a44774 100644
--- a/arch/x86/platform/efi/efi_64.c
+++ b/arch/x86/platform/efi/efi_64.c
@@ -222,7 +222,7 @@ int __init efi_alloc_page_tables(void)
 	pgd = efi_pgd + pgd_index(EFI_VA_END);
 	p4d = p4d_alloc(&init_mm, pgd, EFI_VA_END);
 	if (!p4d) {
-		free_page((unsigned long)efi_pgd);
+		free_pages((unsigned long)efi_pgd, PGD_ALLOCATION_ORDER);
 		return -ENOMEM;
 	}
 
-- 
2.17.1
