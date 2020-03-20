From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 05/22] x86/kvm: Convert to new CPU match macros
Date: Fri, 20 Mar 2020 14:13:50 +0100
Message-ID: <20200320131509.136884777@linutronix.de>
References: <20200320131345.635023594@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Gross <mgross@linux.intel.com>, Tony Luck <tony.luck@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, linux-edac@vger.kernel.org, platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amit.kucheria@verdurent.com>, Chanw
List-Id: platform-driver-x86.vger.kernel.org

The new macro set has a consistent namespace and uses C99 initializers
instead of the grufty C89 ones.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/x86/kvm/svm.c     |    2 +-
 arch/x86/kvm/vmx/vmx.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--- a/arch/x86/kvm/svm.c
+++ b/arch/x86/kvm/svm.c
@@ -60,7 +60,7 @@ MODULE_LICENSE("GPL");
 
 #ifdef MODULE
 static const struct x86_cpu_id svm_cpu_id[] = {
-	X86_FEATURE_MATCH(X86_FEATURE_SVM),
+	X86_MATCH_FEATURE(X86_FEATURE_SVM, NULL),
 	{}
 };
 MODULE_DEVICE_TABLE(x86cpu, svm_cpu_id);
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -67,7 +67,7 @@ MODULE_LICENSE("GPL");
 
 #ifdef MODULE
 static const struct x86_cpu_id vmx_cpu_id[] = {
-	X86_FEATURE_MATCH(X86_FEATURE_VMX),
+	X86_MATCH_FEATURE(X86_FEATURE_VMX, NULL),
 	{}
 };
 MODULE_DEVICE_TABLE(x86cpu, vmx_cpu_id);
