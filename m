From: Yunfeng Ye <yeyunfeng@huawei.com>
Subject: [PATCH 2/2] x86/efi: Fix memory leak for EFI memmap reservations
Date: Wed, 25 Sep 2019 17:20:06 +0800
Message-ID: <26d637af-480b-e874-ee84-9b2abe43630b@huawei.com>
References: <775bcf46-0f4e-a1a9-5a40-05f833cd7a1a@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <775bcf46-0f4e-a1a9-5a40-05f833cd7a1a@huawei.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>, dvhart@infradead.org, andy@infradead.org, "tglx@linutronix.de" <tglx@linutronix.de>, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, x86@kernel.org
Cc: linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

There are some memory leaks in failure path after efi_memmap_alloc().
add efi_memmap_free() for this situation.

Fixes: 816e76129ed5 ("efi: Allow drivers to reserve boot services forever")
Signed-off-by: Yunfeng Ye <yeyunfeng@huawei.com>
---
 arch/x86/platform/efi/quirks.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/platform/efi/quirks.c b/arch/x86/platform/efi/quirks.c
index 3b9fd67..a755f35 100644
--- a/arch/x86/platform/efi/quirks.c
+++ b/arch/x86/platform/efi/quirks.c
@@ -285,6 +285,7 @@ void __init efi_arch_mem_reserve(phys_addr_t addr, u64 size)

 	new = early_memremap(new_phys, new_size);
 	if (!new) {
+		efi_memmap_free(new_phys, num_entries);
 		pr_err("Failed to map new boot services memmap\n");
 		return;
 	}
@@ -470,6 +471,7 @@ void __init efi_free_boot_services(void)

 	new = memremap(new_phys, new_size, MEMREMAP_WB);
 	if (!new) {
+		efi_memmap_free(new_phys, num_entries);
 		pr_err("Failed to map new EFI memmap\n");
 		return;
 	}
@@ -493,6 +495,7 @@ void __init efi_free_boot_services(void)
 	memunmap(new);

 	if (efi_memmap_install(new_phys, num_entries)) {
+		efi_memmap_free(new_phys, num_entries);
 		pr_err("Could not install new EFI memmap\n");
 		return;
 	}
-- 
1.8.3.1
