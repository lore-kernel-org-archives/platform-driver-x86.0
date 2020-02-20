From: Jing Xiangfeng <jingxiangfeng@huawei.com>
Subject: [PATCH 2/2] arm64/efi: support to find mirrored memory ranges
Date: Thu, 20 Feb 2020 03:43:40 -0000 (UTC)
Message-ID: <1582289580-24045-3-git-send-email-jingxiangfeng@huawei.com>
References: <1582289580-24045-1-git-send-email-jingxiangfeng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Date: Fri, 21 Feb 2020 07:53:00 -0500
In-Reply-To: <1582289580-24045-1-git-send-email-jingxiangfeng@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ardb@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, x86@kernel.org, dvhart@infradead.org, andy@infradead.org
Cc: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-mm@kvack.org, wangkefeng.wang@huawei.com, jingxiangfeng@huawei.com
List-Id: platform-driver-x86.vger.kernel.org

Commit b05b9f5f9dcf ("x86, mirror: x86 enabling - find
mirrored memory ranges") introduced the efi_find_mirror
on x86. Now we can scan the memory map and find  mirrored
memory ranges by calling efi_find_mirror on arm64 platform.

For example, if "efi_fake_mem=4G@1G:0x10000,4G@7G:0x10000"
is specified, the original (firmware provided) EFI memmap will be
updated so that the specified memory regions have
EFI_MEMORY_MORE_RELIABLE attribute (0x10000):

 <original>
   efi: mem02: [Conventional Memory|   |  |  |  |  |  |  |  |   |WB|
	|  |  ] range=[0x0000000040000000-0x00000001b5035fff] (5968MB)

   efi: mem28: [Conventional Memory|   |  |  |  |  |  |  |  |   |WB|
	|  |  ] range=[0x00000001c0000000-0x00000002843fffff] (3140MB)
   efi: mem29: [Loader Data        |   |  |  |  |  |  |  |  |   |WB|
	|  |  ] range=[0x0000000284400000-0x0000000285f18fff] (27MB)
   efi: mem30: [Conventional Memory|   |  |  |  |  |  |  |  |   |WB|
	|  |  ] range=[0x0000000285f19000-0x000000033fbfffff] (2972MB)
 <updated>
   efi: mem02: [Conventional Memory|   |MR|  |  |  |  |  |  |   |WB|
	|  |  ] range=[0x0000000040000000-0x000000013fffffff] (4096MB)
   efi: mem03: [Conventional Memory|   |  |  |  |  |  |  |  |   |WB|
	|  |  ] range=[0x0000000140000000-0x00000001b5035fff] (1872MB)

   efi: mem29: [Conventional Memory|   |MR|  |  |  |  |  |  |   |WB|
	|  |  ] range=[0x00000001c0000000-0x00000002843fffff] (3140MB)
   efi: mem30: [Loader Data        |   |MR|  |  |  |  |  |  |   |WB|
	|  |  ] range=[0x0000000284400000-0x0000000285f18fff] (27MB)
   efi: mem31: [Conventional Memory|   |MR|  |  |  |  |  |  |   |WB|
	|  |  ] range=[0x0000000285f19000-0x00000002bfffffff] (928MB)

And you will find that the following message is output:

   efi: Memory: 8192M/12352M mirrored memory

Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
---
 arch/x86/include/asm/efi.h      |  4 ----
 arch/x86/platform/efi/efi.c     | 23 -----------------------
 drivers/firmware/efi/arm-init.c |  1 +
 drivers/firmware/efi/efi.c      | 23 +++++++++++++++++++++++
 include/linux/efi.h             |  4 ++++
 5 files changed, 28 insertions(+), 27 deletions(-)

diff --git a/arch/x86/include/asm/efi.h b/arch/x86/include/asm/efi.h
index 127977f..24fa6a9 100644
--- a/arch/x86/include/asm/efi.h
+++ b/arch/x86/include/asm/efi.h
@@ -330,7 +330,6 @@ static inline void *efi64_zero_upper(void *p)
 extern bool efi_reboot_required(void);
 extern bool efi_is_table_address(unsigned long phys_addr);
 
-extern void efi_find_mirror(void);
 extern void efi_reserve_boot_services(void);
 #else
 static inline void parse_efi_setup(u64 phys_addr, u32 data_len) {}
@@ -342,9 +341,6 @@ static inline  bool efi_is_table_address(unsigned long phys_addr)
 {
 	return false;
 }
-static inline void efi_find_mirror(void)
-{
-}
 static inline void efi_reserve_boot_services(void)
 {
 }
diff --git a/arch/x86/platform/efi/efi.c b/arch/x86/platform/efi/efi.c
index 4c8793d..c06603d 100644
--- a/arch/x86/platform/efi/efi.c
+++ b/arch/x86/platform/efi/efi.c
@@ -97,29 +97,6 @@ static int __init setup_add_efi_memmap(char *arg)
 }
 early_param("add_efi_memmap", setup_add_efi_memmap);
 
-void __init efi_find_mirror(void)
-{
-	efi_memory_desc_t *md;
-	u64 mirror_size = 0, total_size = 0;
-
-	if (!efi_enabled(EFI_MEMMAP))
-		return;
-
-	for_each_efi_memory_desc(md) {
-		unsigned long long start = md->phys_addr;
-		unsigned long long size = md->num_pages << EFI_PAGE_SHIFT;
-
-		total_size += size;
-		if (md->attribute & EFI_MEMORY_MORE_RELIABLE) {
-			memblock_mark_mirror(start, size);
-			mirror_size += size;
-		}
-	}
-	if (mirror_size)
-		pr_info("Memory: %lldM/%lldM mirrored memory\n",
-			mirror_size>>20, total_size>>20);
-}
-
 /*
  * Tell the kernel about the EFI memory map.  This might include
  * more than the max 128 entries that can fit in the passed in e820
diff --git a/drivers/firmware/efi/arm-init.c b/drivers/firmware/efi/arm-init.c
index ac00e7c..f86e73e 100644
--- a/drivers/firmware/efi/arm-init.c
+++ b/drivers/firmware/efi/arm-init.c
@@ -266,6 +266,7 @@ void __init efi_init(void)
 
 	reserve_regions();
 	efi_fake_memmap();
+	efi_find_mirror();
 	efi_esrt_init();
 
 	memblock_reserve(params.mmap & PAGE_MASK,
diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
index 621220a..664d01d 100644
--- a/drivers/firmware/efi/efi.c
+++ b/drivers/firmware/efi/efi.c
@@ -394,6 +394,29 @@ static int __init efisubsys_init(void)
 
 subsys_initcall(efisubsys_init);
 
+void __init efi_find_mirror(void)
+{
+	efi_memory_desc_t *md;
+	u64 mirror_size = 0, total_size = 0;
+
+	if (!efi_enabled(EFI_MEMMAP))
+		return;
+
+	for_each_efi_memory_desc(md) {
+		unsigned long long start = md->phys_addr;
+		unsigned long long size = md->num_pages << EFI_PAGE_SHIFT;
+
+		total_size += size;
+		if (md->attribute & EFI_MEMORY_MORE_RELIABLE) {
+			memblock_mark_mirror(start, size);
+			mirror_size += size;
+		}
+	}
+	if (mirror_size)
+		pr_info("Memory: %lldM/%lldM mirrored memory\n",
+			mirror_size>>20, total_size>>20);
+}
+
 /*
  * Find the efi memory descriptor for a given physical address.  Given a
  * physical address, determine if it exists within an EFI Memory Map entry,
diff --git a/include/linux/efi.h b/include/linux/efi.h
index bf101e5..bb32e37 100644
--- a/include/linux/efi.h
+++ b/include/linux/efi.h
@@ -1143,6 +1143,7 @@ static inline bool __pure efi_soft_reserve_enabled(void)
 		&& __efi_soft_reserve_enabled();
 }
 extern void __init efi_print_memmap(void);
+extern void efi_find_mirror(void);
 #else
 static inline bool efi_enabled(int feature)
 {
@@ -1161,6 +1162,9 @@ static inline bool efi_soft_reserve_enabled(void)
 {
 	return false;
 }
+static inline void efi_find_mirror(void)
+{
+}
 #endif
 
 extern int efi_status_to_err(efi_status_t status);
-- 
1.8.3.1
