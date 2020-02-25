From: Tom Lendacky <thomas.lendacky@amd.com>
Subject: [PATCH v3 1/2] x86/efi: Add TPM related EFI tables to unencrypted mapping checks
Date: Tue, 25 Feb 2020 14:34:01 -0600
Message-ID: <4144cd813f113c20cdfa511cf59500a64e6015be.1582662842.git.thomas.lendacky@amd.com>
References: <cover.1582662842.git.thomas.lendacky@amd.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <cover.1582662842.git.thomas.lendacky@amd.com>
Sender: stable-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, x86@kernel.org, linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

When booting with SME active, EFI tables must be mapped unencrypted since
they were built by UEFI in unencrypted memory. Update the list of tables
to be checked during early_memremap() processing to account for the EFI
TPM tables.

This fixes a bug where an EFI TPM log table has been created by UEFI, but
it lives in memory that has been marked as usable rather than reserved.

Cc: <stable@vger.kernel.org> # 5.4.x-
Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
---
 arch/x86/platform/efi/efi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/platform/efi/efi.c b/arch/x86/platform/efi/efi.c
index 43b24e149312..0a8117865430 100644
--- a/arch/x86/platform/efi/efi.c
+++ b/arch/x86/platform/efi/efi.c
@@ -88,6 +88,8 @@ static const unsigned long * const efi_tables[] = {
 #ifdef CONFIG_EFI_RCI2_TABLE
 	&rci2_table_phys,
 #endif
+	&efi.tpm_log,
+	&efi.tpm_final_log,
 };
 
 u64 efi_setup;		/* efi setup_data physical address */
-- 
2.17.1
