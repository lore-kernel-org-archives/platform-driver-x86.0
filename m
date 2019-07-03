From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.1 14/39] x86/efi: fix a -Wtype-limits compilation warning
Date: Tue,  2 Jul 2019 22:14:49 -0400
Message-ID: <20190703021514.17727-14-sashal@kernel.org>
References: <20190703021514.17727-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190703021514.17727-1-sashal@kernel.org>
Sender: stable-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Qian Cai <cai@lca.pw>, "Prakhya, Sai Praneeth" <sai.praneeth.prakhya@intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Sasha Levin <sashal@kernel.org>, linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Qian Cai <cai@lca.pw>

[ Upstream commit 919aef44d73d5d0c04213cb1bc31149cc074e65e ]

Compiling a kernel with W=1 generates this warning,

arch/x86/platform/efi/quirks.c:731:16: warning: comparison of unsigned
expression >= 0 is always true [-Wtype-limits]

Fixes: 3425d934fc03 ("efi/x86: Handle page faults occurring while running ...")
Signed-off-by: Qian Cai <cai@lca.pw>
Acked-by: "Prakhya, Sai Praneeth" <sai.praneeth.prakhya@intel.com>
Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/x86/platform/efi/quirks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/platform/efi/quirks.c b/arch/x86/platform/efi/quirks.c
index a25a9fd987a9..529522c62d89 100644
--- a/arch/x86/platform/efi/quirks.c
+++ b/arch/x86/platform/efi/quirks.c
@@ -724,7 +724,7 @@ void efi_recover_from_page_fault(unsigned long phys_addr)
 	 * Address range 0x0000 - 0x0fff is always mapped in the efi_pgd, so
 	 * page faulting on these addresses isn't expected.
 	 */
-	if (phys_addr >= 0x0000 && phys_addr <= 0x0fff)
+	if (phys_addr <= 0x0fff)
 		return;
 
 	/*
-- 
2.20.1
