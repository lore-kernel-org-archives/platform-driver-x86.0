From: Julia Lawall <julia@diku.dk>
Subject: [PATCH 8/14] drivers/platform/x86/thinkpad_acpi.c: delete double assignment
Date: Tue, 26 Oct 2010 12:25:37 +0200
Message-ID: <1288088743-3725-9-git-send-email-julia@diku.dk>
References: <1288088743-3725-1-git-send-email-julia@diku.dk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1288088743-3725-1-git-send-email-julia@diku.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
Cc: kernel-janitors@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Delete successive assignments to the same location.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression i;
@@

*i = ...;
 i = ...;
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/platform/x86/thinkpad_acpi.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 2d61186..e8c2199 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -8497,7 +8497,6 @@ static void ibm_exit(struct ibm_struct *ibm)
 					   ibm->acpi->type,
 					   dispatch_acpi_notify);
 		ibm->flags.acpi_notify_installed = 0;
-		ibm->flags.acpi_notify_installed = 0;
 	}
 
 	if (ibm->flags.proc_created) {
