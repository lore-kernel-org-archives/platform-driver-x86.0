From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [REPOST][PATCH 1/2] platform/x86/intel-uncore-freq: Fix static checker issue and potential race condition
Date: Mon, 17 Feb 2020 18:28:43 -0800
Message-ID: <20200218022844.179988-2-srinivas.pandruvada@linux.intel.com>
References: <20200218022844.179988-1-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200218022844.179988-1-srinivas.pandruvada@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: platform-driver-x86.vger.kernel.org

There is a possible race condition when:
All CPUs in a package is offlined and just before the last CPU offline,
user tries to read sysfs entry and read happens while offline callback
is about to delete the sysfs entry.

Although not reproduced but this is possible scenerio and can be
reproduced by adding a msleep() in the show_min_max_freq_khz() before
mutex_lock() and read min_freq attribute from user space. Before
msleep() finishes, force every CPUs in a package offline.

This will cause deadlock, with offline and sysfs read/write operation
because of mutex_lock. The uncore_remove_die_entry() will not release
mutex till read/write callback returns because of kobject_put() and
read/write callback waiting on mutex.

We don't have to remove the sysfs folder when the package is offline.
While there is no CPU present, we can fail the read/write calls by
returning ENXIO error. So remove the kobject_put() call in offline path.

This also address the warning from static checker, as there is no
access to "data" variable after kobject_put:
"The patch 49a474c7ba51: "platform/x86: Add support for Uncore
frequency control" from Jan 13, 2020, leads to the following static
checker warning:

        drivers/platform/x86/intel-uncore-frequency.c:285 uncore_remove_die_entry()
        error: dereferencing freed memory 'data'
"

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/platform/x86/intel-uncore-frequency.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel-uncore-frequency.c b/drivers/platform/x86/intel-uncore-frequency.c
index 2b1a0734c3f8..c83ec95e8f3e 100644
--- a/drivers/platform/x86/intel-uncore-frequency.c
+++ b/drivers/platform/x86/intel-uncore-frequency.c
@@ -97,6 +97,9 @@ static int uncore_read_ratio(struct uncore_data *data, unsigned int *min,
 	u64 cap;
 	int ret;
 
+	if (data->control_cpu < 0)
+		return -ENXIO;
+
 	ret = rdmsrl_on_cpu(data->control_cpu, MSR_UNCORE_RATIO_LIMIT, &cap);
 	if (ret)
 		return ret;
@@ -116,6 +119,11 @@ static int uncore_write_ratio(struct uncore_data *data, unsigned int input,
 
 	mutex_lock(&uncore_lock);
 
+	if (data->control_cpu < 0) {
+		ret = -ENXIO;
+		goto finish_write;
+	}
+
 	input /= UNCORE_FREQ_KHZ_MULTIPLIER;
 	if (!input || input > 0x7F) {
 		ret = -EINVAL;
@@ -273,18 +281,15 @@ static void uncore_add_die_entry(int cpu)
 	mutex_unlock(&uncore_lock);
 }
 
-/* Last CPU in this die is offline, so remove sysfs entries */
+/* Last CPU in this die is offline, make control cpu invalid */
 static void uncore_remove_die_entry(int cpu)
 {
 	struct uncore_data *data;
 
 	mutex_lock(&uncore_lock);
 	data = uncore_get_instance(cpu);
-	if (data) {
-		kobject_put(&data->kobj);
+	if (data)
 		data->control_cpu = -1;
-		data->valid = false;
-	}
 	mutex_unlock(&uncore_lock);
 }
 
-- 
2.20.1
