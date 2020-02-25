From: Tom Lendacky <thomas.lendacky@amd.com>
Subject: [PATCH v3 0/2] SME EFI table updates/fixes
Date: Tue, 25 Feb 2020 14:34:00 -0600
Message-ID: <cover.1582662842.git.thomas.lendacky@amd.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, x86@kernel.org, linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
List-Id: platform-driver-x86.vger.kernel.org

This patch series adds new EFI tables to the list of tables that are
to be mapped unencrypted when SME is active

- EFI TPM log and TPM final log tables
- EFI RNG seed table

---

Patches based on
  git://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git next

and commit:
  dc235d62fc60 ("efi: Bump the Linux EFI stub major version number to #1")

Changes since v2:
- Split the patch into TPM related and RNG related patches
- Account for the moving of the RNG seed EFI table from struct efi
  to a static variable

Tom Lendacky (2):
  x86/efi: Add TPM related EFI tables to unencrypted mapping checks
  x86/efi: Add RNG seed EFI table to unencrypted mapping check

 arch/x86/platform/efi/efi.c |  3 +++
 drivers/firmware/efi/efi.c  | 18 ++++++++++--------
 include/linux/efi.h         |  2 ++
 3 files changed, 15 insertions(+), 8 deletions(-)

-- 
2.17.1
