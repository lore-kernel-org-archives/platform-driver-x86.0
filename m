From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 1/1] platform/mellanox: Add bootctl driver for Mellanox
 BlueField Soc
Date: Wed, 30 Jan 2019 00:03:14 +0200
Message-ID: <CAHp75VfpmBMmR_zU8JxN3Apb__QyWXyU9wD8e03z0N3TTRpMYg@mail.gmail.com>
References: <0b74e9ad12360b56bc0a3c2ca972798c424f2610.1548790896.git.lsun@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0b74e9ad12360b56bc0a3c2ca972798c424f2610.1548790896.git.lsun@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liming Sun <lsun@mellanox.com>
Cc: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Vadim Pasternak <vadimp@mellanox.com>, David Woods <dwoods@mellanox.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jan 29, 2019 at 10:59 PM Liming Sun <lsun@mellanox.com> wrote:
>
> This commit adds the bootctl platform driver for Mellanox BlueField
> Soc, which controls the eMMC boot partition swapping and related
> watchdog configuration.

Thanks for the patch.

My comments below.

First of all, is it a real watchdog with a driver? I think watchdog in
that case should be set up through standard watchdog facilities.

> Reviewed-by: David Woods <dwoods@mellanox.com>

As for Mellanox team I would recommend to take this review as few
basics of kernel programming style and some standard practices.

> Signed-off-by: Liming Sun <lsun@mellanox.com>

> +config MLXBF_BOOTCTL
> +       tristate "Mellanox BlueField Firmware Boot Control driver"
> +       depends on ARM64

> +       default m

Why? What would happen if user chooses n?

> +       help
> +          The Mellanox BlueField firmware implements functionality to
> +          request swapping the primary and alternate eMMC boot
> +          partition, and to set up a watchdog that can undo that swap
> +          if the system does not boot up correctly.  This driver
> +          provides sysfs access to the firmware, to be used in
> +          conjunction with the eMMC device driver to do any necessary
> +          initial swap of the boot partition.

> +struct mlxbf_bootctl_name {
> +       int value;
> +       const char name[12];

Can't we do simple

const char *name;

?

Why do we need the limitation. Why is it hard coded like this?

> +};
> +
> +static struct mlxbf_bootctl_name boot_names[] = {
> +       { MLXBF_BOOTCTL_EXTERNAL,       "external"      },
> +       { MLXBF_BOOTCTL_EMMC,           "emmc"          },
> +       { MLNX_BOOTCTL_SWAP_EMMC,       "swap_emmc"     },
> +       { MLXBF_BOOTCTL_EMMC_LEGACY,    "emmc_legacy"   },
> +       { MLXBF_BOOTCTL_NONE,           "none"          },

> +       { -1,                           ""              }

-1 is usually a bad idea for terminator. It's not in align with many
other structures which require terminator.

> +};

> +
> +static char mlxbf_bootctl_lifecycle_states[][16] = {

static const char * const ... ?

> +       [0] = "soft_non_secure",
> +       [1] = "secure",
> +       [2] = "hard_non_secure",
> +       [3] = "rma",
> +};

> +/* Syntactic sugar to avoid having to specify an unused argument. */
> +#define mlxbf_bootctl_smc_call0(smc_op) mlxbf_bootctl_smc_call1(smc_op, 0)
> +
> +static int reset_action_to_val(const char *action, size_t len)
> +{
> +       struct mlxbf_bootctl_name *bn;
> +

> +       /* Accept string either with or without a newline terminator */
> +       if (action[len-1] == '\n')
> +               --len;

For a long time we have sysfs_streq() API.

> +
> +       for (bn = boot_names; bn->value >= 0; ++bn)
> +               if (strncmp(bn->name, action, len) == 0)
> +                       break;
> +
> +       return bn->value;
> +}

> +static ssize_t post_reset_wdog_store(struct device_driver *drv,
> +                                    const char *buf, size_t count)
> +{
> +       int err;
> +       unsigned long watchdog;
> +
> +       err = kstrtoul(buf, 10, &watchdog);
> +       if (err)
> +               return err;
> +

> +       if (mlxbf_bootctl_smc_call1(MLXBF_BOOTCTL_SET_POST_RESET_WDOG,
> +                                   watchdog) < 0)
> +               return -EINVAL;

If that call returns an error it shouldn't be shadowed here.

> +
> +       return count;
> +}
> +
> +static ssize_t reset_action_show(struct device_driver *drv, char *buf)
> +{

> +       return sprintf(buf, "%s\n", reset_action_to_string(
> +               mlxbf_bootctl_smc_call0(MLXBF_BOOTCTL_GET_RESET_ACTION)));

Wouldn't be easy to parse this as

int action = ...call0();
return sprintf(...);

?

(int is an arbitrary type here, choose one that suits)

> +}
> +
> +static ssize_t reset_action_store(struct device_driver *drv,
> +                                 const char *buf, size_t count)
> +{
> +       int action = reset_action_to_val(buf, count);
> +

> +       if (action < 0 || action == MLXBF_BOOTCTL_NONE)
> +               return -EINVAL;

Don't shadow an error.

> +
> +       if (mlxbf_bootctl_smc_call1(MLXBF_BOOTCTL_SET_RESET_ACTION, action) < 0)
> +               return -EINVAL;

Same.

> +
> +       return count;
> +}
> +
> +static ssize_t second_reset_action_show(struct device_driver *drv, char *buf)
> +{

> +       return sprintf(buf, "%s\n", reset_action_to_string(
> +               mlxbf_bootctl_smc_call0(
> +                       MLXBF_BOOTCTL_GET_SECOND_RESET_ACTION)));

Use temp variable.

> +}
> +
> +static ssize_t second_reset_action_store(struct device_driver *drv,
> +                                        const char *buf, size_t count)
> +{
> +       int action = reset_action_to_val(buf, count);
> +
> +       if (action < 0)
> +               return -EINVAL;

Don't shadow an error.

> +
> +       if (mlxbf_bootctl_smc_call1(MLXBF_BOOTCTL_SET_SECOND_RESET_ACTION,
> +                                   action) < 0)
> +               return -EINVAL;

Same.

> +
> +       return count;
> +}
> +
> +static ssize_t lifecycle_state_show(struct device_driver *drv, char *buf)
> +{

> +       int lc_state = mlxbf_bootctl_smc_call1(
> +                               MLXBF_BOOTCTL_GET_TBB_FUSE_STATUS,
> +                               MLXBF_BOOTCTL_FUSE_STATUS_LIFECYCLE);

Split it as

int ...;

... = call1();
if (...)

> +
> +       if (lc_state < 0)
> +               return -EINVAL;

Don't shadow an error.

> +
> +       lc_state &= (MLXBF_BOOTCTL_SB_MODE_TEST_MASK |
> +                    MLXBF_BOOTCTL_SB_MODE_SECURE_MASK);

Better to split like

xxx =
 (A | B);

> +       /*
> +        * If the test bits are set, we specify that the current state may be
> +        * due to using the test bits.
> +        */

> +       if ((lc_state & MLXBF_BOOTCTL_SB_MODE_TEST_MASK) != 0) {

' != 0' is redundant.

> +
> +               lc_state &= MLXBF_BOOTCTL_SB_MODE_SECURE_MASK;
> +

> +               return sprintf(buf, "%s(test)\n",
> +                              mlxbf_bootctl_lifecycle_states[lc_state]);

One line?

> +       }
> +
> +       return sprintf(buf, "%s\n", mlxbf_bootctl_lifecycle_states[lc_state]);
> +}
> +
> +static ssize_t secure_boot_fuse_state_show(struct device_driver *drv, char *buf)
> +{
> +       int key;
> +       int buf_len = 0;
> +       int upper_key_used = 0;
> +       int sb_key_state = mlxbf_bootctl_smc_call1(
> +                               MLXBF_BOOTCTL_GET_TBB_FUSE_STATUS,
> +                               MLXBF_BOOTCTL_FUSE_STATUS_KEYS);
> +
> +       if (sb_key_state < 0)
> +               return -EINVAL;
> +

> +       for (key = MLXBF_SB_KEY_NUM - 1; key >= 0; key--) {

I'm not sure it's a good idea to put several lines in one sysfs attribute.

> +               int burnt = ((sb_key_state & (1 << key)) != 0);

Redundant  ' != 0', redundant parens.

> +               int valid = ((sb_key_state &
> +                             (1 << (key + MLXBF_SB_KEY_NUM))) != 0);

Same.

> +
> +               buf_len += sprintf(buf + buf_len, "Ver%d:", key);
> +               if (upper_key_used) {
> +                       if (burnt) {
> +                               if (valid)
> +                                       buf_len += sprintf(buf + buf_len,
> +                                                         "Used");

Oh, why not just

const char *status;

if (...) {
...
 status = "1";
...
status = "2";
...
}
len = snprintf(buf + len, ..., status);

?

> +                               else
> +                                       buf_len += sprintf(buf + buf_len,
> +                                                         "Wasted");
> +                       } else {
> +                               if (valid)
> +                                       buf_len += sprintf(buf + buf_len,
> +                                                         "Invalid");
> +                               else
> +                                       buf_len += sprintf(buf + buf_len,
> +                                                         "Skipped");
> +                       }
> +               } else {
> +                       if (burnt) {
> +                               if (valid) {
> +                                       upper_key_used = 1;
> +                                       buf_len += sprintf(buf + buf_len,
> +                                                         "In use");
> +                               } else
> +                                       buf_len += sprintf(buf + buf_len,
> +                                                         "Burn incomplete");
> +                       } else {
> +                               if (valid)
> +                                       buf_len += sprintf(buf + buf_len,
> +                                                         "Invalid");
> +                               else
> +                                       buf_len += sprintf(buf + buf_len,
> +                                                         "Free");
> +                       }
> +               }
> +               buf_len += sprintf(buf + buf_len, "\n");
> +       }
> +
> +       return buf_len;
> +}
> +

> +#define MLXBF_BOOTCTL_DRV_ATTR(_name) DRIVER_ATTR_RW(_name)

What the point?

> +static struct attribute_group mlxbf_bootctl_attr_group = {
> +       .attrs = mlxbf_bootctl_dev_attrs

+ comma.

> +};

> +static const struct acpi_device_id mlxbf_bootctl_acpi_ids[] = {
> +       {"MLNXBF04", 0},

> +       {},

No comma for terminator line.

> +};


> +static int mlxbf_bootctl_probe(struct platform_device *pdev)
> +{
> +       struct arm_smccc_res res;
> +
> +       /*
> +        * Ensure we have the UUID we expect for this service.
> +        * Note that the functionality we want is present in the first
> +        * released version of this service, so we don't check the version.
> +        */
> +       arm_smccc_smc(MLXBF_BOOTCTL_SIP_SVC_UID, 0, 0, 0, 0, 0, 0, 0, &res);



> +       if (res.a0 != 0x89c036b4 || res.a1 != 0x11e6e7d7 ||
> +           res.a2 != 0x1a009787 || res.a3 != 0xc4bf00ca)

What is this?!

Can you use UUID API?

> +               return -ENODEV;
> +
> +       /*
> +        * When watchdog is used, it sets boot mode to MLXBF_BOOTCTL_SWAP_EMMC
> +        * in case of boot failures. However it doesn't clear the state if there
> +        * is no failure. Restore the default boot mode here to avoid any
> +        * unnecessary boot partition swapping.
> +        */
> +       if (mlxbf_bootctl_smc_call1(MLXBF_BOOTCTL_SET_RESET_ACTION,
> +                                   MLXBF_BOOTCTL_EMMC) < 0)

> +               pr_err("Unable to reset the EMMC boot mode\n");

Why pr_? Shouldn't be dev_?

> +
> +       pr_info("%s (version %s)\n", MLXBF_BOOTCTL_DRIVER_DESCRIPTION,

Ditto.

> +               MLXBF_BOOTCTL_DRIVER_VERSION);

No, the driver version is a git SHA sum of the certain tree state.
Remove this definition completely.


> +
> +       return 0;
> +}
> +

> +static int mlxbf_bootctl_remove(struct platform_device *pdev)
> +{
> +       return 0;
> +}

Waste of lines.

> +/* ARM Standard Service Calls version numbers */
> +#define MLXBF_BOOTCTL_SVC_VERSION_MAJOR                0x0
> +#define MLXBF_BOOTCTL_SVC_VERSION_MINOR                0x2
> +
> +/* Number of svc calls defined. */
> +#define MLXBF_BOOTCTL_NUM_SVC_CALLS 12
> +
> +/* Valid reset actions for MLXBF_BOOTCTL_SET_RESET_ACTION. */

> +#define MLXBF_BOOTCTL_EXTERNAL 0 /* Not boot from eMMC */
> +#define MLXBF_BOOTCTL_EMMC     1 /* From primary eMMC boot partition */
> +#define MLNX_BOOTCTL_SWAP_EMMC 2 /* Swap eMMC boot partitions and reboot */
> +#define MLXBF_BOOTCTL_EMMC_LEGACY      3 /* From primary eMMC in legacy mode */

Since you have this as a sequential starting from 0 you may redefine
 boot_names[]  as static const char * const and use sysfs_match_string() above.

> +/* Error values (non-zero). */
> +#define MLXBF_BOOTCTL_SMCCC_INVALID_PARAMETERS -2

Is it coming from hardware / firmware ?
Otherwise use standard meaningful kernel error codes.

-- 
With Best Regards,
Andy Shevchenko
