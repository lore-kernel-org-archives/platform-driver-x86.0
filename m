From: Milan Hauth <milahu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: add
 unsafe_leds parameter
Date: Tue, 13 Nov 2018 17:41:36 +0100
Message-ID: <20181113174136.58198c3a@gmail.com>
References: <CAGiEHCtu9-chj_wN1wau4aBzvcCR8Bmq1-2OZiHq0yqz3=BUSA@mail.gmail.com>
 <CAHp75Ve+Z5W=6SNx3eB1MrH=wDPTe9bjQGQ3tEGi9wYCXKD0Pg@mail.gmail.com>
 <CAHp75VfoogP8N0u7fzW7Xo3moSQxseAtFSu7H-yv6MczFFdakg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <CAHp75VfoogP8N0u7fzW7Xo3moSQxseAtFSu7H-yv6MczFFdakg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
Cc: ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

thanks for your replies.

done:

 * use normal english, at least in docs
 * check mail client
 * move usage to docs
 * use sysfs node, not module parameter
 * add sysfs ABI docs
 * use ternary if notation
 * keep compile option + use as default value

todo:

 * do i need all that sysfs code?
 * did i use the 'fixes' keyword correctly?
 * in ABI docs: KernelVersion? Contact?



Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org> wrote:

> Also, if you mess with those LEDs, IMO you'd better have something
> that *does* warn the user when the kernel spills alert and
> emergency-level messages to the kernel log, which is _not_ the
> default of some large- userbase desktop environments out there.  You
> have been warned.

should we name concrete solutions in the docs?

should we add 'how to disable wifi LED'?
like ...
  echo none | sudo tee /sys/class/leds/phy0-led/trigger



commit message:

To thinkpad_acpi module, add led_expose_unsafe_leds sysfs node

Allow the user to control 'unsafe LEDs' by running
  echo Y | sudo tee \
  /sys/devices/platform/thinkpad_acpi/led_expose_unsafe_leds

... instead of forcing to re-compile the thinkpad_acpi module
with CONFIG_THINKPAD_ACPI_UNSAFE_LEDS=Y

Fixes: https://bbs.archlinux.org/viewtopic.php?id=177337
Fixes: commit a4d5effcc73749ee3ebbf578d162905e6fa4e07d

Signed-off-by: Milan Hauth <milahu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

---

patch v2



--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -5752,13 +5752,56 @@
 };
 #define TPACPI_SAFE_LEDS	0x1081U
 
+/*
+ * led_expose_unsafe_leds
+ *
+ * Allow control of important LEDs? (unsafe)
+ * init value is taken from compile config
+ * variable can be set via sysfs file
+ * /sys/devices/platform/thinkpad_acpi/led_expose_unsafe_leds
+ */
+#ifdef CONFIG_THINKPAD_ACPI_UNSAFE_LEDS
+static bool led_expose_unsafe_leds = true;
+#else
+static bool led_expose_unsafe_leds = false;
+#endif
+
+/* sysfs led expose_unsafe_leds ---------------------------------------- */
+static ssize_t led_expose_unsafe_leds_show(struct device *dev,
+			   struct device_attribute *attr,
+			   char *buf)
+{
+	return snprintf(buf, PAGE_SIZE, "%d\n", (int) led_expose_unsafe_leds);
+}
+
+static ssize_t led_expose_unsafe_leds_store(struct device *dev,
+			    struct device_attribute *attr,
+			    const char *buf, size_t count)
+{
+	int res;
+	res = kstrtobool(buf, &led_expose_unsafe_leds);
+	return res ? res : count;
+}
+
+static DEVICE_ATTR_RW(led_expose_unsafe_leds);
+
+/* --------------------------------------------------------------------- */
+
+static struct attribute *led_attributes[] = {
+	&dev_attr_led_expose_unsafe_leds.attr,
+	NULL
+};
+
+static const struct attribute_group led_attr_group = {
+	.attrs = led_attributes,
+};
+
+/* done sysfs led expose_unsafe_leds ----------------------------------- */
+
 static inline bool tpacpi_is_led_restricted(const unsigned int led)
 {
-#ifdef CONFIG_THINKPAD_ACPI_UNSAFE_LEDS
-	return false;
-#else
-	return (1U & (TPACPI_SAFE_LEDS >> led)) == 0;
-#endif
+	return led_expose_unsafe_leds ? false : \
+		(1U & (TPACPI_SAFE_LEDS >> led)) == 0;
 }
 
 static int led_get_status(const unsigned int led)
@@ -5900,6 +5943,10 @@
 	}
 
 	kfree(tpacpi_leds);
+
+	sysfs_remove_group(&tpacpi_pdev->dev.kobj,
+		&led_attr_group);
+
 }
 
 static int __init tpacpi_init_led(unsigned int led)
@@ -6048,15 +6095,20 @@
 		}
 	}
 
-#ifdef CONFIG_THINKPAD_ACPI_UNSAFE_LEDS
-	pr_notice("warning: userspace override of important firmware LEDs is enabled\n");
-#endif
-	return 0;
+	if(led_expose_unsafe_leds)
+		pr_notice("warning: userspace override of important firmware LEDs is enabled\n");
+
+	rc = sysfs_create_group(&tpacpi_pdev->dev.kobj,
+		&led_attr_group);
+
+	return rc ? rc : 0;
 }
 
 #define str_led_status(s) \
 	((s) == TPACPI_LED_OFF ? "off" : \
 		((s) == TPACPI_LED_ON ? "on" : "blinking"))
+
+/* proc acpi/ibm/led */
 
 static int led_read(struct seq_file *m)
 {

--- a/Documentation/ABI/testing/sysfs-driver-thinkpad_acpi
+++ b/Documentation/ABI/testing/sysfs-driver-thinkpad_acpi
@@ -0,0 +1,37 @@
+What:		/sys/devices/platform/thinkpad_acpi/led_expose_unsafe_leds
+Date:		October 31, 2018
+KernelVersion:	4.18.16
+Contact:	platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
+Description:	Allow control of important LEDs? (unsafe)
+		Setting this to 'Yes' will temporarily enable
+		unrestricted access to all LEDs, including important LEDs.
+		values are:
+			0 = N = No = protect unsafe LEDs [default]
+			1 = Y = Yes = expose unsafe LEDs
+		Why is this unsafe?
+		Some LEDs can warn the user, before the hardware fails,
+		or before the user actively damages the hardware.
+		For example, before the battery runs empty, the battery LED
+		will start blinking orange. Or, as long as devices
+		are connected to a docking station or a port replicator,
+		the dock / replicator LEDs will be active.
+		Why is this not perfect?
+		Because even if you turn off all LEDs, for example with
+		echo Y | sudo tee \
+		/sys/devices/platform/thinkpad_acpi/led_expose_unsafe_leds
+		for ((i=0;i<16;i=i+1)); do
+			echo "$i off" | sudo tee /proc/acpi/ibm/led
+		done
+		.... some LEDs will stay active: hard drive LED, wifi LED,
+		bluetooth LED, docking station LED, AC power LED, and maybe more.
+		Change default value?
+		The default value is taken from the compile option
+		CONFIG_THINKPAD_ACPI_UNSAFE_LEDS.
+		To allow control of important LEDs by default,
+		re-compile the thinkpad-acpi module
+		with the option CONFIG_THINKPAD_ACPI_UNSAFE_LEDS set to Y.
+		Distributions must never enable this option.
+		Individual users that are aware of the consequences
+		are welcome to enabling it.
+		read: Documentation/laptops/thinkpad-acpi.txt
+		section: LED control
--- a/Documentation/laptops/thinkpad-acpi.txt
+++ b/Documentation/laptops/thinkpad-acpi.txt
@@ -740,8 +740,15 @@
 empty battery, or a broken battery), access to most LEDs is
 restricted.
 
-Unrestricted access to all LEDs requires that thinkpad-acpi be
-compiled with the CONFIG_THINKPAD_ACPI_UNSAFE_LEDS option enabled.
+Unrestricted access to all LEDs can be enabled either temporarily
+by setting the sysfs attribute led_expose_unsafe_leds to Y
+for example with:
+echo Y | \
+sudo tee /sys/devices/platform/thinkpad_acpi/led_expose_unsafe_leds;
+or permanently by re-compiling the thinkpad-acpi module with the
+compile option CONFIG_THINKPAD_ACPI_UNSAFE_LEDS set to Y.
+This will set the default value of led_expose_unsafe_leds to Y.
+read: Documentation/ABI/testing/sysfs-driver-thinkpad_acpi
 Distributions must never enable this option.  Individual users that
 are aware of the consequences are welcome to enabling it.
 

--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -530,6 +530,11 @@
 	  Say N here, unless you are building a kernel for your own
 	  use, and need to control the important firmware LEDs.
 
+	  If you choose N, you can still enable this option at runtime
+	  by writing 'Y' to the sysfs file
+	  /sys/devices/platform/thinkpad_acpi/led_expose_unsafe_leds
+	  read: Documentation/ABI/testing/sysfs-driver-thinkpad_acpi
+
 config THINKPAD_ACPI_VIDEO
 	bool "Video output control support"
 	depends on THINKPAD_ACPI






On Tue, 30 Oct 2018 10:50:25 -0300
Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org> wrote:

> On Sat, 27 Oct 2018, Milan Hauth wrote:
> > move CONFIG_THINKPAD_ACPI_UNSAFE_LEDS compile config
> > to thinkpad_acpi.unsafe_leds module parameter
> >
> > so there is no more need to re-compile
> > to control important LEDs, which is unsafe
> >
> > Signed-off-by: Milan Hauth <milahu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> I am not confortable signing-off on this one.
>
> That option is a compile-time config option with a warning for distros
> to never enable it for a reason:
>
>     If you are going to enable it, you are to know what you are doing,
>     *and* the user is to be made aware of the fact that you did it.
>
> Also, if you mess with those LEDs, IMO you'd better have something
> that *does* warn the user when the kernel spills alert and
> emergency-level messages to the kernel log, which is _not_ the
> default of some large- userbase desktop environments out there.  You
> have been warned.
>

On Mon, 29 Oct 2018 16:07:12 +0200
Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Ah, last but not least, you forgot to include subsystem/driver
> maintainers in the Cc list (in my mailbox it's even got directly to a
> spam).

On Mon, 29 Oct 2018 16:05:32 +0200
Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> On Sat, Oct 27, 2018 at 9:15 PM Milan Hauth <milahu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> Thank you for the patch. I have few comments here.
>
> >
> > move CONFIG_THINKPAD_ACPI_UNSAFE_LEDS compile config
> > to thinkpad_acpi.unsafe_leds module parameter
> >
> > so there is no more need to re-compile
> > to control important LEDs, which is unsafe
>
> First of all, please use normal English writing, i.e. Capitalize
> sentences, use proper punctuation like commas and periods.
> Second, check your mail clients and software, patch is broken and
> can't be applied.
>
> See my further comments below.
>
> >
> > Signed-off-by: Milan Hauth <milahu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >
> > ---
> >
> > usage
> >
> > echo 'options thinkpad_acpi unsafe_leds=Y' \
> > | sudo tee /etc/modprobe.d/thinkpad_acpi-unsafe_leds.conf
> >
> > for ((i=0;i<=15;i=i+1)); do echo "$i off" | sudo tee /proc/acpi/ibm/led; done
> >
> > this will only disable power, battery, standby, dock LEDs
> > but will keep wifi, bluetooth, harddrive, AC power LEDs [and maybe more]
>
>
> This has to be a part of Documentation.
>
> > references
> >
> > [SOLVED] ThinkPad LED's control / Laptop Issues / Arch Linux Forums
> > https://bbs.archlinux.org/viewtopic.php?id=177337#p1384354
> >
> > thinkpad-acpi: restrict access to some firmware LEDs
> > commit a4d5effcc73749ee3ebbf578d162905e6fa4e07d
> > date 2009-04-04
>
> This should be part of commit message in a form of plain text and/or
> specific tags (BugLink, Fixes).
>
> > --- a/drivers/platform/x86/thinkpad_acpi.c
> > +++ b/drivers/platform/x86/thinkpad_acpi.c
> > @@ -88,6 +88,27 @@
> >  #include <linux/uaccess.h>
> >  #include <acpi/battery.h>
> >  #include <acpi/video.h>
> > +#include <linux/moduleparam.h>
> > +
> > +/* parameters for module thinkpad_acpi */
> > +
> > +/*
> > + * parameter unsafe_leds
> > + *
> > + * Allow control of important LEDs? (unsafe)
> > + *   N = no [default]
> > + *   Y = yes
> > + *
> > + * docs:
> > + *   Documentation/laptops/thinkpad-acpi.txt
> > + * section 'LED control'
> > + *
> > + * moved from compile config
> > + *   CONFIG_THINKPAD_ACPI_UNSAFE_LEDS
> > + */
> > +static bool unsafe_leds = false;
> > +module_param(unsafe_leds, bool, S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP);
> > +MODULE_PARM_DESC(unsafe_leds, "Allow control of important LEDs? (unsafe)");
>
> We are not accepting new module parameters without a very strong argument.
> Here I don't see why it can't be a sysfs node which enables this
> behaviour (or disables) at run time.
>
> (Note: if you introduce a sysfs node you need to add a proper ABI
> subsection to Documentation)
>
> >
> >  /* ThinkPad CMOS commands */
> >  #define TP_CMOS_VOLUME_DOWN    0
> > @@ -5754,11 +5775,10 @@ static const char * const tpacpi_led_nam
> >
> >  static inline bool tpacpi_is_led_restricted(const unsigned int led)
> >  {
> > -#ifdef CONFIG_THINKPAD_ACPI_UNSAFE_LEDS
> > -       return false;
> > -#else
> > -       return (1U & (TPACPI_SAFE_LEDS >> led)) == 0;
> > -#endif
>
> > +       if (unsafe_leds)
> > +               return false;
> > +       else
> > +               return (1U & (TPACPI_SAFE_LEDS >> led)) == 0;
>
> return unsafe_leds ? false : ...;
>
> But this, perhaps, will be modified when switching to sysfs.
>
> >  }
> >
> >  static int led_get_status(const unsigned int led)
> > @@ -6048,9 +6068,9 @@ static int __init led_init(struct ibm_in
> >                 }
> >         }
> >
> > -#ifdef CONFIG_THINKPAD_ACPI_UNSAFE_LEDS
> > -       pr_notice("warning: userspace override of important firmware LEDs is
> > enabled\n");
> > -#endif
> > +       if (unsafe_leds)
> > +               pr_notice("warning: userspace override of important firmware LEDs
> > is enabled\n");
> > +
> >         return 0;
> >  }
> >
> >
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -507,29 +507,6 @@ config THINKPAD_ACPI_DEBUG
> >
> >           If you are not sure, say N here.
> >
> > -config THINKPAD_ACPI_UNSAFE_LEDS
>
> People, who are using this option will be surprised by a changed behaviour.
> So, please leave it and use as enforcement of the _initial_ value.
>
> > -       bool "Allow control of important LEDs (unsafe)"
> > -       depends on THINKPAD_ACPI
> > -       ---help---
> > -         Overriding LED state on ThinkPads can mask important
> > -         firmware alerts (like critical battery condition), or misled
> > -         the user into damaging the hardware (undocking or ejecting
> > -         the bay while buses are still active), etc.
> > -
> > -         LED control on the ThinkPad is write-only (with very few
> > -         exceptions on very ancient models), which makes it
> > -         impossible to know beforehand if important information will
> > -         be lost when one changes LED state.
> > -
> > -         Users that know what they are doing can enable this option
> > -         and the driver will allow control of every LED, including
> > -         the ones on the dock stations.
> > -
> > -         Never enable this option on a distribution kernel.
> > -
> > -         Say N here, unless you are building a kernel for your own
> > -         use, and need to control the important firmware LEDs.
> > -
> >  config THINKPAD_ACPI_VIDEO
> >         bool "Video output control support"
> >         depends on THINKPAD_ACPI
> >
> > --- a/Documentation/laptops/thinkpad-acpi.txt
> > +++ b/Documentation/laptops/thinkpad-acpi.txt
> > @@ -740,8 +740,8 @@ buses are still active), or mask an impo
> >  empty battery, or a broken battery), access to most LEDs is
> >  restricted.
> >
> > -Unrestricted access to all LEDs requires that thinkpad-acpi be
> > -compiled with the CONFIG_THINKPAD_ACPI_UNSAFE_LEDS option enabled.
> > +Unrestricted access to all LEDs requires setting the parameter
> > +thinkpad_acpi.unsafe_leds to Y.
> >  Distributions must never enable this option.  Individual users that
> >  are aware of the consequences are welcome to enabling it.
>
>
>
