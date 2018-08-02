From: Jouke Witteveen <j.witteveen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2] platform/x86: thinkpad_acpi: extend
 battery quirk coverage
Date: Thu, 2 Aug 2018 22:28:49 +0200
Message-ID: <20180802202849.GA2580@Mindship-05.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org, dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
Cc: ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, jermizzey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

Based on bug reports and a web search for
    "Thinkpad_acpi: Error probing battery 2"
four more models were found that require the battery quirk:
Lenovo B5400, Thinkpad 11e, Thinkpad 11e gen 3, Thinkpad 13 gen 3.

Signed-off-by: Jouke Witteveen <j.witteveen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Tested-by: James Cheshire <jermizzey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Acked-by: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
---

I avoided the ping-pong style and added James Cheshire as a tester.
Andy suggested to Cc: him, but if I understand the kernel documentation on
submitting patches correctly, a Tested-by: is in order. James tested on a
Thinkpad 11e and agreed to be included in the commit message.

 drivers/platform/x86/thinkpad_acpi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 3dbff2dd..fd49855a 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -9611,7 +9611,11 @@ static const struct tpacpi_quirk battery_quirk_table[] __initconst = {
 	 * Individual addressing is broken on models that expose the
 	 * primary battery as BAT1.
 	 */
+	TPACPI_Q_LNV('J', '7', true),       /* B5400 */
+	TPACPI_Q_LNV('J', 'I', true),       /* Thinkpad 11e */
+	TPACPI_Q_LNV3('R', '0', 'B', true), /* Thinkpad 11e gen 3 */
 	TPACPI_Q_LNV3('R', '0', 'C', true), /* Thinkpad 13 */
+	TPACPI_Q_LNV3('R', '0', 'J', true), /* Thinkpad 13 gen 2 */
 };
 
 static int __init tpacpi_battery_init(struct ibm_init_struct *ibm)
-- 
2.18.0


------------------------------------------------------------------------------
Check out the vibrant tech community on one of the world's most
engaging tech sites, Slashdot.org! http://sdm.link/slashdot
