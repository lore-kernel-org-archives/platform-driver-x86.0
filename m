From: Stefan Assmann <sassmann@kpanic.de>
Subject: Re: [PATCH] Add Second Fan Support for Thinkpad P50
Date: Wed, 26 Sep 2018 16:34:49 +0200
Message-ID: <20180926143449.bnqliemloqw7fuyv@t530.fritz.box>
References: <1522693621-3124-1-git-send-email-agk@godking.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1522693621-3124-1-git-send-email-agk@godking.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexander Kappner <agk@godking.net>
Cc: ibm-acpi@hmh.eng.br, dvhart@infradead.org, andy@infradead.org, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On 2018-04-02 11:27, Alexander Kappner wrote:
> The Thinkpad P50 has 2 fans. Add the 2FAN quirk so the tpacpi driver
> properly reports both fan speeds.
> Because the P50 doesn't report the version of its EC controller, we need to
> identify it by BIOS version (N1).

With 4.18 (including this patch) I'm seeing both fans on my P50.
[root@p50 ~]# sensors
[...]
thinkpad-isa-0000
Adapter: ISA adapter
fan1:        2319 RPM
fan2:        2323 RPM

Is there a way to actually control the second fan? There's pwm1, but no
pwm2. And pwm1 only affects fan1.

[root@p50 ~]# ls -al /sys/devices/platform/thinkpad_hwmon/hwmon/hwmon3/
total 0
drwxr-xr-x 3 root root    0 Sep 26 16:25 .
drwxr-xr-x 3 root root    0 Sep 26 16:23 ..
lrwxrwxrwx 1 root root    0 Sep 25 16:11 device -> ../../../thinkpad_hwmon
-r--r--r-- 1 root root 4096 Sep 25 16:11 fan1_input
-r--r--r-- 1 root root 4096 Sep 25 16:11 fan2_input
-r--r--r-- 1 root root 4096 Sep 25 16:11 name
drwxr-xr-x 2 root root    0 Sep 26 15:57 power
-rw-r--r-- 1 root root 4096 Sep 26 16:25 pwm1
-rw-r--r-- 1 root root 4096 Sep 26 16:25 pwm1_enable
lrwxrwxrwx 1 root root    0 Sep 25 16:11 subsystem -> ../../../../../class/hwmon
-rw-r--r-- 1 root root 4096 Sep 25 16:11 uevent

[root@p50 ~]# echo 2 > /sys/devices/platform/thinkpad_hwmon/hwmon/hwmon3/pwm1_enable
[root@p50 ~]# sensors
[...]
thinkpad-isa-0000
Adapter: ISA adapter
fan1:        3042 RPM
fan2:        2323 RPM

Thanks!

  Stefan


> Signed-off-by: Alexander Kappner <agk@godking.net>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index d5eaf3b1..ebdc300 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -8699,16 +8699,24 @@ static const struct attribute_group fan_attr_group = {
>  	  .ec = TPID(__id1, __id2),		\
>  	  .quirks = __quirks }
>  
> +#define TPACPI_FAN_QL_BIOS(__id1, __id2, __quirks)	\
> +	{ .vendor = PCI_VENDOR_ID_LENOVO,	\
> +	  .bios = TPID(__id1, __id2),		\
> +	  .ec = TPACPI_MATCH_ANY,		\
> +	  .quirks = __quirks }
> +
>  static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
>  	TPACPI_FAN_QI('1', 'Y', TPACPI_FAN_Q1),
>  	TPACPI_FAN_QI('7', '8', TPACPI_FAN_Q1),
>  	TPACPI_FAN_QI('7', '6', TPACPI_FAN_Q1),
>  	TPACPI_FAN_QI('7', '0', TPACPI_FAN_Q1),
>  	TPACPI_FAN_QL('7', 'M', TPACPI_FAN_2FAN),
> +	TPACPI_FAN_QL_BIOS('N', '1', TPACPI_FAN_2FAN) // Thinkpad P50 has 2 fans
>  };
>  
>  #undef TPACPI_FAN_QL
>  #undef TPACPI_FAN_QI
> +#undef TPACPI_FAN_QL_BIOS
>  
>  static int __init fan_init(struct ibm_init_struct *iibm)
>  {
> -- 
> 2.1.4
> 
> 
