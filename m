From: Colin King <colin.king@canonical.com>
Subject: [PATCH][next] platform/x86: intel_cht_int33fe: make a couple of local functions static
Date: Wed, 11 Oct 2017 10:30:10 +0100
Message-ID: <20171011093010.17173-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The functions cht_int33fe_check_for_max17047 and cht_int33fe_find_max17047
are local to the source and do not need to be in global scope, so make
them static.

Cleans up sparse warnings:
symbol 'cht_int33fe_check_for_max17047' was not declared. Should it be
static?
symbol 'cht_int33fe_find_max17047' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/platform/x86/intel_cht_int33fe.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel_cht_int33fe.c b/drivers/platform/x86/intel_cht_int33fe.c
index 94716b2fbc00..286c6207765d 100644
--- a/drivers/platform/x86/intel_cht_int33fe.c
+++ b/drivers/platform/x86/intel_cht_int33fe.c
@@ -42,7 +42,7 @@ struct cht_int33fe_data {
  * These helpers are used to work around this by checking if an i2c-client
  * for the max17047 has already been registered.
  */
-int cht_int33fe_check_for_max17047(struct device *dev, void *data)
+static int cht_int33fe_check_for_max17047(struct device *dev, void *data)
 {
 	struct i2c_client **max17047 = data;
 	struct acpi_device *adev;
@@ -62,7 +62,7 @@ int cht_int33fe_check_for_max17047(struct device *dev, void *data)
 	return 1;
 }
 
-struct i2c_client *cht_int33fe_find_max17047(void)
+static struct i2c_client *cht_int33fe_find_max17047(void)
 {
 	struct i2c_client *max17047 = NULL;
 
-- 
2.14.1
