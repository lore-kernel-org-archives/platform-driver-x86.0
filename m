From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 21/22] hwrng: via_rng - Convert to new X86 CPU match macros
Date: Fri, 20 Mar 2020 14:14:06 +0100
Message-ID: <20200320131510.793641638@linutronix.de>
References: <20200320131345.635023594@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Gross <mgross@linux.intel.com>, Tony Luck <tony.luck@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, linux-edac@vger.kernel.org, platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano>
List-Id: platform-driver-x86.vger.kernel.org

The new macro set has a consistent namespace and uses C99 initializers
instead of the grufty C89 ones.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org
---
 drivers/char/hw_random/via-rng.c |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

--- a/drivers/char/hw_random/via-rng.c
+++ b/drivers/char/hw_random/via-rng.c
@@ -209,20 +209,19 @@ static int __init mod_init(void)
 out:
 	return err;
 }
+module_init(mod_init);
 
 static void __exit mod_exit(void)
 {
 	hwrng_unregister(&via_rng);
 }
-
-module_init(mod_init);
 module_exit(mod_exit);
 
 static struct x86_cpu_id __maybe_unused via_rng_cpu_id[] = {
-	X86_FEATURE_MATCH(X86_FEATURE_XSTORE),
+	X86_MATCH_FEATURE(X86_FEATURE_XSTORE, NULL),
 	{}
 };
+MODULE_DEVICE_TABLE(x86cpu, via_rng_cpu_id);
 
 MODULE_DESCRIPTION("H/W RNG driver for VIA CPU with PadLock");
 MODULE_LICENSE("GPL");
-MODULE_DEVICE_TABLE(x86cpu, via_rng_cpu_id);
