From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 2/2] platform/x86/intel-uncore-freq: Add release callback
Date: Sat,  8 Feb 2020 09:00:52 -0800
Message-ID: <20200208170052.57712-3-srinivas.pandruvada@linux.intel.com>
References: <20200208170052.57712-1-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200208170052.57712-1-srinivas.pandruvada@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On module unload wait for relese callback for each packag_die entry
and then free the memory. This is done by waiting on a completion
object, till release() callback.

While here, also change to kobject_init_and_add() to
kobject_create_and_add() to simplify.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/platform/x86/intel-uncore-frequency.c | 36 ++++++++++++-------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/intel-uncore-frequency.c b/drivers/platform/x86/intel-uncore-frequency.c
index c83ec95e8f3e..82f2de7c4112 100644
--- a/drivers/platform/x86/intel-uncore-frequency.c
+++ b/drivers/platform/x86/intel-uncore-frequency.c
@@ -38,6 +38,7 @@
  */
 struct uncore_data {
 	struct kobject kobj;
+	struct completion kobj_unregister;
 	u64 stored_uncore_data;
 	u32 initial_min_freq_khz;
 	u32 initial_max_freq_khz;
@@ -52,7 +53,7 @@ static int uncore_max_entries __read_mostly;
 /* Storage for uncore data for all instances */
 static struct uncore_data *uncore_instances;
 /* Root of the all uncore sysfs kobjs */
-struct kobject uncore_root_kobj;
+struct kobject *uncore_root_kobj;
 /* Stores the CPU mask of the target CPUs to use during uncore read/write */
 static cpumask_t uncore_cpu_mask;
 /* CPU online callback register instance */
@@ -225,15 +226,19 @@ static struct attribute *uncore_attrs[] = {
 	NULL
 };
 
+static void uncore_sysfs_entry_release(struct kobject *kobj)
+{
+	struct uncore_data *data = to_uncore_data(kobj);
+
+	complete(&data->kobj_unregister);
+}
+
 static struct kobj_type uncore_ktype = {
+	.release = uncore_sysfs_entry_release,
 	.sysfs_ops = &kobj_sysfs_ops,
 	.default_attrs = uncore_attrs,
 };
 
-static struct kobj_type uncore_root_ktype = {
-	.sysfs_ops = &kobj_sysfs_ops,
-};
-
 /* Caller provides protection */
 static struct uncore_data *uncore_get_instance(unsigned int cpu)
 {
@@ -271,8 +276,10 @@ static void uncore_add_die_entry(int cpu)
 		uncore_read_ratio(data, &data->initial_min_freq_khz,
 				  &data->initial_max_freq_khz);
 
+		init_completion(&data->kobj_unregister);
+
 		ret = kobject_init_and_add(&data->kobj, &uncore_ktype,
-					   &uncore_root_kobj, str);
+					   uncore_root_kobj, str);
 		if (!ret) {
 			data->control_cpu = cpu;
 			data->valid = true;
@@ -391,11 +398,12 @@ static int __init intel_uncore_init(void)
 	if (!uncore_instances)
 		return -ENOMEM;
 
-	ret = kobject_init_and_add(&uncore_root_kobj, &uncore_root_ktype,
-				   &cpu_subsys.dev_root->kobj,
-				   "intel_uncore_frequency");
-	if (ret)
+	uncore_root_kobj = kobject_create_and_add("intel_uncore_frequency",
+						  &cpu_subsys.dev_root->kobj);
+	if (!uncore_root_kobj) {
+		ret = -ENOMEM;
 		goto err_free;
+	}
 
 	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
 				"platform/x86/uncore-freq:online",
@@ -415,7 +423,7 @@ static int __init intel_uncore_init(void)
 err_rem_state:
 	cpuhp_remove_state(uncore_hp_state);
 err_rem_kobj:
-	kobject_put(&uncore_root_kobj);
+	kobject_put(uncore_root_kobj);
 err_free:
 	kfree(uncore_instances);
 
@@ -430,10 +438,12 @@ static void __exit intel_uncore_exit(void)
 	unregister_pm_notifier(&uncore_pm_nb);
 	cpuhp_remove_state(uncore_hp_state);
 	for (i = 0; i < uncore_max_entries; ++i) {
-		if (uncore_instances[i].valid)
+		if (uncore_instances[i].valid) {
 			kobject_put(&uncore_instances[i].kobj);
+			wait_for_completion(&uncore_instances[i].kobj_unregister);
+		}
 	}
-	kobject_put(&uncore_root_kobj);
+	kobject_put(uncore_root_kobj);
 	kfree(uncore_instances);
 }
 module_exit(intel_uncore_exit)
-- 
2.20.1
