From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/2] platform/x86: intel_pmc_core: convert to DEFINE_SHOW_ATTRIBUTE
Date: Tue, 11 Dec 2018 12:16:27 +0200
Message-ID: <CAHp75VcsQPx2pn84Fhh-qT71JwR1-0fEQm8nj2sei0oHByy7Dg@mail.gmail.com>
References: <20181205151255.15367-1-tiny.windzz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181205151255.15367-1-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: tiny.windzz@gmail.com
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Dec 5, 2018 at 5:13 PM Yangtao Li <tiny.windzz@gmail.com> wrote:
>
> Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.
>

Both patches had been pushed, thanks!

> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/platform/x86/intel_pmc_core.c | 49 +++++----------------------
>  1 file changed, 8 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
> index eba6f5c27e2f..22dbf115782e 100644
> --- a/drivers/platform/x86/intel_pmc_core.c
> +++ b/drivers/platform/x86/intel_pmc_core.c
> @@ -367,7 +367,7 @@ static void pmc_core_display_map(struct seq_file *s, int index,
>                    pf_map[index].bit_mask & pf_reg ? "Off" : "On");
>  }
>
> -static int pmc_core_ppfear_sts_show(struct seq_file *s, void *unused)
> +static int pmc_core_ppfear_show(struct seq_file *s, void *unused)
>  {
>         struct pmc_dev *pmcdev = s->private;
>         const struct pmc_bit_map *map = pmcdev->map->pfear_sts;
> @@ -385,18 +385,7 @@ static int pmc_core_ppfear_sts_show(struct seq_file *s, void *unused)
>
>         return 0;
>  }
> -
> -static int pmc_core_ppfear_sts_open(struct inode *inode, struct file *file)
> -{
> -       return single_open(file, pmc_core_ppfear_sts_show, inode->i_private);
> -}
> -
> -static const struct file_operations pmc_core_ppfear_ops = {
> -       .open           = pmc_core_ppfear_sts_open,
> -       .read           = seq_read,
> -       .llseek         = seq_lseek,
> -       .release        = single_release,
> -};
> +DEFINE_SHOW_ATTRIBUTE(pmc_core_ppfear);
>
>  /* This function should return link status, 0 means ready */
>  static int pmc_core_mtpmc_link_status(void)
> @@ -428,7 +417,7 @@ static int pmc_core_send_msg(u32 *addr_xram)
>         return 0;
>  }
>
> -static int pmc_core_mphy_pg_sts_show(struct seq_file *s, void *unused)
> +static int pmc_core_mphy_pg_show(struct seq_file *s, void *unused)
>  {
>         struct pmc_dev *pmcdev = s->private;
>         const struct pmc_bit_map *map = pmcdev->map->mphy_sts;
> @@ -480,18 +469,7 @@ static int pmc_core_mphy_pg_sts_show(struct seq_file *s, void *unused)
>         mutex_unlock(&pmcdev->lock);
>         return err;
>  }
> -
> -static int pmc_core_mphy_pg_sts_open(struct inode *inode, struct file *file)
> -{
> -       return single_open(file, pmc_core_mphy_pg_sts_show, inode->i_private);
> -}
> -
> -static const struct file_operations pmc_core_mphy_pg_ops = {
> -       .open           = pmc_core_mphy_pg_sts_open,
> -       .read           = seq_read,
> -       .llseek         = seq_lseek,
> -       .release        = single_release,
> -};
> +DEFINE_SHOW_ATTRIBUTE(pmc_core_mphy_pg);
>
>  static int pmc_core_pll_show(struct seq_file *s, void *unused)
>  {
> @@ -527,18 +505,7 @@ static int pmc_core_pll_show(struct seq_file *s, void *unused)
>         mutex_unlock(&pmcdev->lock);
>         return err;
>  }
> -
> -static int pmc_core_pll_open(struct inode *inode, struct file *file)
> -{
> -       return single_open(file, pmc_core_pll_show, inode->i_private);
> -}
> -
> -static const struct file_operations pmc_core_pll_ops = {
> -       .open           = pmc_core_pll_open,
> -       .read           = seq_read,
> -       .llseek         = seq_lseek,
> -       .release        = single_release,
> -};
> +DEFINE_SHOW_ATTRIBUTE(pmc_core_pll);
>
>  static ssize_t pmc_core_ltr_ignore_write(struct file *file, const char __user
>  *userbuf, size_t count, loff_t *ppos)
> @@ -729,7 +696,7 @@ static int pmc_core_dbgfs_register(struct pmc_dev *pmcdev)
>                             &pmc_core_dev_state);
>
>         debugfs_create_file("pch_ip_power_gating_status", 0444, dir, pmcdev,
> -                           &pmc_core_ppfear_ops);
> +                           &pmc_core_ppfear_fops);
>
>         debugfs_create_file("ltr_ignore", 0644, dir, pmcdev,
>                             &pmc_core_ltr_ignore_ops);
> @@ -738,12 +705,12 @@ static int pmc_core_dbgfs_register(struct pmc_dev *pmcdev)
>
>         if (pmcdev->map->pll_sts)
>                 debugfs_create_file("pll_status", 0444, dir, pmcdev,
> -                                   &pmc_core_pll_ops);
> +                                   &pmc_core_pll_fops);
>
>         if (pmcdev->map->mphy_sts)
>                 debugfs_create_file("mphy_core_lanes_power_gating_status",
>                                     0444, dir, pmcdev,
> -                                   &pmc_core_mphy_pg_ops);
> +                                   &pmc_core_mphy_pg_fops);
>
>         if (pmcdev->map->slps0_dbg_maps) {
>                 debugfs_create_file("slp_s0_debug_status", 0444,
> --
> 2.17.0
>


-- 
With Best Regards,
Andy Shevchenko
