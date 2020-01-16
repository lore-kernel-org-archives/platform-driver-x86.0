From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.19 299/671] platform/x86: alienware-wmi: fix kfree on potentially uninitialized pointer
Date: Thu, 16 Jan 2020 11:58:57 -0500
Message-ID: <20200116170509.12787-36-sashal@kernel.org>
References: <20200116170509.12787-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200116170509.12787-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Colin Ian King <colin.king@canonical.com>, Darren Hart <dvhart@infradead.org>, Sasha Levin <sashal@kernel.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

[ Upstream commit 98e2630284ab741804bd0713e932e725466f2f84 ]

Currently the kfree of output.pointer can be potentially freeing
an uninitalized pointer in the case where out_data is NULL. Fix this
by reworking the case where out_data is not-null to perform the
ACPI status check and also the kfree of outpoint.pointer in one block
and hence ensuring the pointer is only freed when it has been used.

Also replace the if (ptr != NULL) idiom with just if (ptr).

Fixes: ff0e9f26288d ("platform/x86: alienware-wmi: Correct a memory leak")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/alienware-wmi.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/alienware-wmi.c b/drivers/platform/x86/alienware-wmi.c
index f10af5c383c5..c0d1555735cd 100644
--- a/drivers/platform/x86/alienware-wmi.c
+++ b/drivers/platform/x86/alienware-wmi.c
@@ -522,23 +522,22 @@ static acpi_status alienware_wmax_command(struct wmax_basic_args *in_args,
 
 	input.length = (acpi_size) sizeof(*in_args);
 	input.pointer = in_args;
-	if (out_data != NULL) {
+	if (out_data) {
 		output.length = ACPI_ALLOCATE_BUFFER;
 		output.pointer = NULL;
 		status = wmi_evaluate_method(WMAX_CONTROL_GUID, 0,
 					     command, &input, &output);
-	} else
+		if (ACPI_SUCCESS(status)) {
+			obj = (union acpi_object *)output.pointer;
+			if (obj && obj->type == ACPI_TYPE_INTEGER)
+				*out_data = (u32)obj->integer.value;
+		}
+		kfree(output.pointer);
+	} else {
 		status = wmi_evaluate_method(WMAX_CONTROL_GUID, 0,
 					     command, &input, NULL);
-
-	if (ACPI_SUCCESS(status) && out_data != NULL) {
-		obj = (union acpi_object *)output.pointer;
-		if (obj && obj->type == ACPI_TYPE_INTEGER)
-			*out_data = (u32) obj->integer.value;
 	}
-	kfree(output.pointer);
 	return status;
-
 }
 
 /*
-- 
2.20.1
