From: Lenny Szubowicz <lszubowi@redhat.com>
Subject: [PATCH V2 3/3] integrity: Load certs from the EFI MOK config table
Date: Fri,  4 Sep 2020 21:31:07 -0400
Message-ID: <20200905013107.10457-4-lszubowi@redhat.com>
References: <20200905013107.10457-1-lszubowi@redhat.com>
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <20200905013107.10457-1-lszubowi@redhat.com>
Sender: owner-linux-security-module@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-security-module@vger.kernel.org, andy.shevchenko@gmail.com, ardb@kernel.org, jmorris@namei.org, serge@hallyn.com, keescook@chromium.org, zohar@linux.ibm.com, bp@alien8.de, pjones@redhat.com, dhowells@redhat.com, prarit@redhat.com
List-Id: platform-driver-x86.vger.kernel.org

Because of system-specific EFI firmware limitations, EFI volatile
variables may not be capable of holding the required contents of
the Machine Owner Key (MOK) certificate store when the certificate
list grows above some size. Therefore, an EFI boot loader may pass
the MOK certs via a EFI configuration table created specifically for
this purpose to avoid this firmware limitation.

An EFI configuration table is a much more primitive mechanism
compared to EFI variables and is well suited for one-way passage
of static information from a pre-OS environment to the kernel.

This patch adds the support to load certs from the MokListRT
entry in the MOK variable configuration table, if it's present.
The pre-existing support to load certs from the MokListRT EFI
variable remains and is used if the EFI MOK configuration table
isn't present or can't be successfully used.

Signed-off-by: Lenny Szubowicz <lszubowi@redhat.com>
---
 security/integrity/platform_certs/load_uefi.c | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/security/integrity/platform_certs/load_uefi.c b/security/integrity/platform_certs/load_uefi.c
index c1c622b4dc78..ee4b4c666854 100644
--- a/security/integrity/platform_certs/load_uefi.c
+++ b/security/integrity/platform_certs/load_uefi.c
@@ -71,16 +71,38 @@ static __init void *get_cert_list(efi_char16_t *name, efi_guid_t *guid,
  * Load the certs contained in the UEFI MokListRT database into the
  * platform trusted keyring.
  *
+ * This routine checks the EFI MOK config table first. If and only if
+ * that fails, this routine uses the MokListRT ordinary UEFI variable.
+ *
  * Return:	Status
  */
 static int __init load_moklist_certs(void)
 {
+	struct efi_mokvar_table_entry *mokvar_entry;
 	efi_guid_t mok_var = EFI_SHIM_LOCK_GUID;
 	void *mok;
 	unsigned long moksize;
 	efi_status_t status;
 	int rc;
 
+	/* First try to load certs from the EFI MOKvar config table.
+	 * It's not an error if the MOKvar config table doesn't exist
+	 * or the MokListRT entry is not found in it.
+	 */
+	mokvar_entry = efi_mokvar_entry_find("MokListRT");
+	if (mokvar_entry) {
+		rc = parse_efi_signature_list("UEFI:MokListRT (MOKvar table)",
+					      mokvar_entry->data,
+					      mokvar_entry->data_size,
+					      get_handler_for_db);
+		/* All done if that worked. */
+		if (!rc)
+			return rc;
+
+		pr_err("Couldn't parse MokListRT signatures from EFI MOKvar config table: %d\n",
+		       rc);
+	}
+
 	/* Get MokListRT. It might not exist, so it isn't an error
 	 * if we can't get it.
 	 */
-- 
2.27.0
