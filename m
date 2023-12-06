Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="k0EgXnX4"
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0AEF1B6;
	Tue,  5 Dec 2023 22:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=ZpqnEFEVYXGghRKsKTwe/hCYFwzIb9udDvXhXmIddxs=; b=k0EgXnX45Wo8DtP3tGt50/Q1iw
	pMhJJ7xo+N2JfKo02ApW+xhAG2M3qYSA3ifz8OWu6HejXMmsVfLNoR3a7kybDMJ2nQJeHnKXr0ZKe
	rjT/qiHZQNvSF5Oj3vgpLhEHqqLC/33ovrBQYSZUuMOdcwCtJl6o6vqGQoP/jNFRYMVUgryJICs4U
	4vX7K6Mgv2ax/4WtlIOCGRUHpTYc+TfQMCpXagwXCuO00tlKnjAtjBCr1zX94OaIs/n68sAtzpFmR
	XigsBNzNctgtPaFQMLKinhwm+hsw0B8OcSXI+v0et75lLRn67lhVUTfzGZ/n9grJpUWsQKZ57yTzC
	KzzyJ0+A==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rAkyH-0099Fe-0A;
	Wed, 06 Dec 2023 06:01:21 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: intel_ips: fix kernel-doc formatting
Date: Tue,  5 Dec 2023 22:01:18 -0800
Message-ID: <20231206060120.4816-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix kernel-doc function notation and comment formatting to prevent
warnings from scripts/kernel-doc.

for drivers/platform/x86/intel_ips.c:
595: warning: No description found for return value of 'mcp_exceeded'
624: warning: No description found for return value of 'cpu_exceeded'
650: warning: No description found for return value of 'mch_exceeded'
745: warning: bad line:                 cpu+ gpu+       cpu+gpu-        cpu-gpu+        cpu-gpu-
746: warning: bad line: cpu < gpu <     cpu+gpu+        cpu+            gpu+            nothing
753: warning: No description found for return value of 'ips_adjust'
747: warning: bad line: cpu < gpu >=    cpu+gpu-(mcp<)  cpu+gpu-(mcp<)  gpu-            gpu-
748: warning: bad line: cpu >= gpu <    cpu-gpu+(mcp<)  cpu-            cpu-gpu+(mcp<)  cpu-
749: warning: bad line: cpu >= gpu >=   cpu-gpu-        cpu-gpu-        cpu-gpu-        cpu-gpu-
945: warning: No description found for return value of 'ips_monitor'
1151: warning: No description found for return value of 'ips_irq_handler'
1301: warning: Function parameter or member 'ips' not described in 'ips_detect_cpu'
1302: warning: No description found for return value of 'ips_detect_cpu'
1358: warning: No description found for return value of 'ips_get_i915_syms'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
---
 drivers/platform/x86/intel_ips.c |   30 ++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff -- a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
--- a/drivers/platform/x86/intel_ips.c
+++ b/drivers/platform/x86/intel_ips.c
@@ -590,6 +590,8 @@ static void ips_disable_gpu_turbo(struct
  * @ips: IPS driver struct
  *
  * Check whether the MCP is over its thermal or power budget.
+ *
+ * Returns: %true if the temp or power has exceeded its maximum, else %false
  */
 static bool mcp_exceeded(struct ips_driver *ips)
 {
@@ -619,6 +621,8 @@ static bool mcp_exceeded(struct ips_driv
  * @cpu: CPU number to check
  *
  * Check a given CPU's average temp or power is over its limit.
+ *
+ * Returns: %true if the temp or power has exceeded its maximum, else %false
  */
 static bool cpu_exceeded(struct ips_driver *ips, int cpu)
 {
@@ -645,6 +649,8 @@ static bool cpu_exceeded(struct ips_driv
  * @ips: IPS driver struct
  *
  * Check the MCH temp & power against their maximums.
+ *
+ * Returns: %true if the temp or power has exceeded its maximum, else %false
  */
 static bool mch_exceeded(struct ips_driver *ips)
 {
@@ -742,12 +748,13 @@ static void update_turbo_limits(struct i
  *   - down (at TDP limit)
  *     - adjust both CPU and GPU down if possible
  *
-		cpu+ gpu+	cpu+gpu-	cpu-gpu+	cpu-gpu-
-cpu < gpu <	cpu+gpu+	cpu+		gpu+		nothing
-cpu < gpu >=	cpu+gpu-(mcp<)	cpu+gpu-(mcp<)	gpu-		gpu-
-cpu >= gpu <	cpu-gpu+(mcp<)	cpu-		cpu-gpu+(mcp<)	cpu-
-cpu >= gpu >=	cpu-gpu-	cpu-gpu-	cpu-gpu-	cpu-gpu-
+ *              |cpu+ gpu+      cpu+gpu-        cpu-gpu+        cpu-gpu-
+ * cpu < gpu <  |cpu+gpu+       cpu+            gpu+            nothing
+ * cpu < gpu >= |cpu+gpu-(mcp<) cpu+gpu-(mcp<)  gpu-            gpu-
+ * cpu >= gpu < |cpu-gpu+(mcp<) cpu-            cpu-gpu+(mcp<)  cpu-
+ * cpu >= gpu >=|cpu-gpu-       cpu-gpu-        cpu-gpu-        cpu-gpu-
  *
+ * Returns: %0
  */
 static int ips_adjust(void *data)
 {
@@ -935,11 +942,13 @@ static void monitor_timeout(struct timer
  * @data: ips driver structure
  *
  * This is the main function for the IPS driver.  It monitors power and
- * tempurature in the MCP and adjusts CPU and GPU power clams accordingly.
+ * temperature in the MCP and adjusts CPU and GPU power clamps accordingly.
  *
- * We keep a 5s moving average of power consumption and tempurature.  Using
+ * We keep a 5s moving average of power consumption and temperature.  Using
  * that data, along with CPU vs GPU preference, we adjust the power clamps
  * up or down.
+ *
+ * Returns: %0 on success or -errno on error
  */
 static int ips_monitor(void *data)
 {
@@ -1146,6 +1155,8 @@ static void dump_thermal_info(struct ips
  * Handle temperature limit trigger events, generally by lowering the clamps.
  * If we're at a critical limit, we clamp back to the lowest possible value
  * to prevent emergency shutdown.
+ *
+ * Returns: IRQ_NONE or IRQ_HANDLED
  */
 static irqreturn_t ips_irq_handler(int irq, void *arg)
 {
@@ -1293,9 +1304,12 @@ static void ips_debugfs_init(struct ips_
 
 /**
  * ips_detect_cpu - detect whether CPU supports IPS
+ * @ips: IPS driver struct
  *
  * Walk our list and see if we're on a supported CPU.  If we find one,
  * return the limits for it.
+ *
+ * Returns: the &ips_mcp_limits struct that matches the boot CPU or %NULL
  */
 static struct ips_mcp_limits *ips_detect_cpu(struct ips_driver *ips)
 {
@@ -1352,6 +1366,8 @@ static struct ips_mcp_limits *ips_detect
  * monitor and control graphics turbo mode.  If we can find them, we can
  * enable graphics turbo, otherwise we must disable it to avoid exceeding
  * thermal and power limits in the MCP.
+ *
+ * Returns: %true if the required symbols are found, else %false
  */
 static bool ips_get_i915_syms(struct ips_driver *ips)
 {
