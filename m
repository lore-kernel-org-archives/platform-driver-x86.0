From: Tom Lendacky <thomas.lendacky@amd.com>
Subject: [PATCH v3 2/2] x86/efi: Add RNG seed EFI table to unencrypted mapping check
Date: Tue, 25 Feb 2020 14:34:02 -0600
Message-ID: <b64385fc13e5d7ad4b459216524f138e7879234f.1582662842.git.thomas.lendacky@amd.com>
References: <cover.1582662842.git.thomas.lendacky@amd.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1582662842.git.thomas.lendacky@amd.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, x86@kernel.org, linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
List-Id: platform-driver-x86.vger.kernel.org

When booting with SME active, EFI tables must be mapped unencrypted since
they were built by UEFI in unencrypted memory. Update the list of tables
to be checked during early_memremap() processing to account for the EFI
RNG seed table.

Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
---
 arch/x86/platform/efi/efi.c |  1 +
 drivers/firmware/efi/efi.c  | 18 ++++++++++--------
 include/linux/efi.h         |  2 ++
 3 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/x86/platform/efi/efi.c b/arch/x86/platform/efi/efi.c
index 0a8117865430..aca9bdd87bca 100644
--- a/arch/x86/platform/efi/efi.c
+++ b/arch/x86/platform/efi/efi.c
@@ -90,6 +90,7 @@ static const unsigned long * const efi_tables[] = {
 #endif
 	&efi.tpm_log,
 	&efi.tpm_final_log,
+	&efi_rng_seed,
 };
 
 u64 efi_setup;		/* efi setup_data physical address */
diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
index 69a585106d30..1e79f77d4e6c 100644
--- a/drivers/firmware/efi/efi.c
+++ b/drivers/firmware/efi/efi.c
@@ -45,7 +45,7 @@ struct efi __read_mostly efi = {
 };
 EXPORT_SYMBOL(efi);
 
-static unsigned long __ro_after_init rng_seed = EFI_INVALID_TABLE_ADDR;
+unsigned long __ro_after_init efi_rng_seed = EFI_INVALID_TABLE_ADDR;
 static unsigned long __initdata mem_reserve = EFI_INVALID_TABLE_ADDR;
 static unsigned long __initdata rt_prop = EFI_INVALID_TABLE_ADDR;
 
@@ -451,7 +451,7 @@ static const efi_config_table_type_t common_tables[] __initconst = {
 	{SMBIOS3_TABLE_GUID, "SMBIOS 3.0", &efi.smbios3},
 	{EFI_SYSTEM_RESOURCE_TABLE_GUID, "ESRT", &efi.esrt},
 	{EFI_MEMORY_ATTRIBUTES_TABLE_GUID, "MEMATTR", &efi_mem_attr_table},
-	{LINUX_EFI_RANDOM_SEED_TABLE_GUID, "RNG", &rng_seed},
+	{LINUX_EFI_RANDOM_SEED_TABLE_GUID, "RNG", &efi_rng_seed},
 	{LINUX_EFI_TPM_EVENT_LOG_GUID, "TPMEventLog", &efi.tpm_log},
 	{LINUX_EFI_TPM_FINAL_LOG_GUID, "TPMFinalLog", &efi.tpm_final_log},
 	{LINUX_EFI_MEMRESERVE_TABLE_GUID, "MEMRESERVE", &mem_reserve},
@@ -519,11 +519,11 @@ int __init efi_config_parse_tables(const efi_config_table_t *config_tables,
 	pr_cont("\n");
 	set_bit(EFI_CONFIG_TABLES, &efi.flags);
 
-	if (rng_seed != EFI_INVALID_TABLE_ADDR) {
+	if (efi_rng_seed != EFI_INVALID_TABLE_ADDR) {
 		struct linux_efi_random_seed *seed;
 		u32 size = 0;
 
-		seed = early_memremap(rng_seed, sizeof(*seed));
+		seed = early_memremap(efi_rng_seed, sizeof(*seed));
 		if (seed != NULL) {
 			size = seed->size;
 			early_memunmap(seed, sizeof(*seed));
@@ -531,7 +531,8 @@ int __init efi_config_parse_tables(const efi_config_table_t *config_tables,
 			pr_err("Could not map UEFI random seed!\n");
 		}
 		if (size > 0) {
-			seed = early_memremap(rng_seed, sizeof(*seed) + size);
+			seed = early_memremap(efi_rng_seed,
+					      sizeof(*seed) + size);
 			if (seed != NULL) {
 				pr_notice("seeding entropy pool\n");
 				add_bootloader_randomness(seed->bits, seed->size);
@@ -923,7 +924,7 @@ static int update_efi_random_seed(struct notifier_block *nb,
 	if (!kexec_in_progress)
 		return NOTIFY_DONE;
 
-	seed = memremap(rng_seed, sizeof(*seed), MEMREMAP_WB);
+	seed = memremap(efi_rng_seed, sizeof(*seed), MEMREMAP_WB);
 	if (seed != NULL) {
 		size = min(seed->size, EFI_RANDOM_SEED_SIZE);
 		memunmap(seed);
@@ -931,7 +932,8 @@ static int update_efi_random_seed(struct notifier_block *nb,
 		pr_err("Could not map UEFI random seed!\n");
 	}
 	if (size > 0) {
-		seed = memremap(rng_seed, sizeof(*seed) + size, MEMREMAP_WB);
+		seed = memremap(efi_rng_seed, sizeof(*seed) + size,
+				MEMREMAP_WB);
 		if (seed != NULL) {
 			seed->size = size;
 			get_random_bytes(seed->bits, seed->size);
@@ -949,7 +951,7 @@ static struct notifier_block efi_random_seed_nb = {
 
 static int __init register_update_efi_random_seed(void)
 {
-	if (rng_seed == EFI_INVALID_TABLE_ADDR)
+	if (efi_rng_seed == EFI_INVALID_TABLE_ADDR)
 		return 0;
 	return register_reboot_notifier(&efi_random_seed_nb);
 }
diff --git a/include/linux/efi.h b/include/linux/efi.h
index 2ab33d5d6ca5..e8a08a499131 100644
--- a/include/linux/efi.h
+++ b/include/linux/efi.h
@@ -526,6 +526,8 @@ typedef struct {
 	efi_time_t time_of_revocation;
 } efi_cert_x509_sha256_t;
 
+extern unsigned long __ro_after_init efi_rng_seed;		/* RNG Seed table */
+
 /*
  * All runtime access to EFI goes through this structure:
  */
-- 
2.17.1
