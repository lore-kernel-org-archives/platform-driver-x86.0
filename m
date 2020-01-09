From: liuyang34 <yangliuxm34@gmail.com>
Subject: [PATCH] x86: event, use scnprintf instead of snprintf
Date: Thu,  9 Jan 2020 14:36:26 +0800
Message-ID: <5fc0611a37b6c73fb524b8469cced8fd4cefc6a1.1578550730.git.liuyang34@xiaomi.com>
References: <cover.1578550730.git.liuyang34@xiaomi.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1578550730.git.liuyang34@xiaomi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Richard Fontana <rfontana@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Allison Randal <allison@lohutok.net>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc: liuyang34 <liuyang34@xiaomi.com>
List-Id: platform-driver-x86.vger.kernel.org

the return size will low than PAGE_SIZE but maybe over 40 in show_sysctl_tfa,
so use scnprintf instead of snprintf to get real size

Signed-off-by: liuyang34 <liuyang34@xiaomi.com>
---
 arch/x86/events/intel/core.c    | 6 +++---
 arch/x86/events/intel/pt.c      | 2 +-
 arch/x86/platform/uv/uv_sysfs.c | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index 3be51aa..bf287b4 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -4372,7 +4372,7 @@ static ssize_t show_sysctl_tfa(struct device *cdev,
 			      struct device_attribute *attr,
 			      char *buf)
 {
-	return snprintf(buf, 40, "%d\n", allow_tsx_force_abort);
+	return scnprintf(buf, 40, "%d\n", allow_tsx_force_abort);
 }
 
 static ssize_t set_sysctl_tfa(struct device *cdev,
@@ -4406,7 +4406,7 @@ static ssize_t branches_show(struct device *cdev,
 			     struct device_attribute *attr,
 			     char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "%d\n", x86_pmu.lbr_nr);
+	return scnprintf(buf, PAGE_SIZE, "%d\n", x86_pmu.lbr_nr);
 }
 
 static DEVICE_ATTR_RO(branches);
@@ -4422,7 +4422,7 @@ static ssize_t pmu_name_show(struct device *cdev,
 			     struct device_attribute *attr,
 			     char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "%s\n", pmu_name_str);
+	return scnprintf(buf, PAGE_SIZE, "%s\n", pmu_name_str);
 }
 
 static DEVICE_ATTR_RO(pmu_name);
diff --git a/arch/x86/events/intel/pt.c b/arch/x86/events/intel/pt.c
index 1db7a51..4ca7ed9 100644
--- a/arch/x86/events/intel/pt.c
+++ b/arch/x86/events/intel/pt.c
@@ -92,7 +92,7 @@ static ssize_t pt_cap_show(struct device *cdev,
 		container_of(attr, struct dev_ext_attribute, attr);
 	enum pt_capabilities cap = (long)ea->var;
 
-	return snprintf(buf, PAGE_SIZE, "%x\n", intel_pt_validate_hw_cap(cap));
+	return scnprintf(buf, PAGE_SIZE, "%x\n", intel_pt_validate_hw_cap(cap));
 }
 
 static struct attribute_group pt_cap_group __ro_after_init = {
diff --git a/arch/x86/platform/uv/uv_sysfs.c b/arch/x86/platform/uv/uv_sysfs.c
index 6221473..aa44c82 100644
--- a/arch/x86/platform/uv/uv_sysfs.c
+++ b/arch/x86/platform/uv/uv_sysfs.c
@@ -15,13 +15,13 @@ struct kobject *sgi_uv_kobj;
 static ssize_t partition_id_show(struct kobject *kobj,
 			struct kobj_attribute *attr, char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "%ld\n", sn_partition_id);
+	return scnprintf(buf, PAGE_SIZE, "%ld\n", sn_partition_id);
 }
 
 static ssize_t coherence_id_show(struct kobject *kobj,
 			struct kobj_attribute *attr, char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "%ld\n", uv_partition_coherence_id());
+	return scnprintf(buf, PAGE_SIZE, "%ld\n", uv_partition_coherence_id());
 }
 
 static struct kobj_attribute partition_id_attr =
-- 
2.7.4
