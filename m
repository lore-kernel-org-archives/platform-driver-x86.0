From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] x86/intel_telemetry: Add debugfs entry for S0ix residency
Date: Fri, 30 Jun 2017 19:18:22 +0300
Message-ID: <CAHp75VfDhh=Dz3KnpfDHeC-WS5HLDO-3qbZ=08xXkSjScbdbQw@mail.gmail.com>
References: <1498236755-30763-1-git-send-email-rajneesh.bhardwaj@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:34553 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751649AbdF3QSX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 30 Jun 2017 12:18:23 -0400
In-Reply-To: <1498236755-30763-1-git-send-email-rajneesh.bhardwaj@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Shanth Murthy <shanth.murthy@intel.com>, Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>

On Fri, Jun 23, 2017 at 7:52 PM, Rajneesh Bhardwaj
<rajneesh.bhardwaj@intel.com> wrote:
> This adds a debugfs consumer for the exported kernel API
> intel_pmc_read_s0ix_residency. This debugfs entry reads S0ix residency
> directly from the PMC hardware counters.

Applied for testing, thanks!

>
> TEST:
> - echo freeze > /sys/power/state
> - Wake the system, read the S0ix residency i.e.
>   cat /sys/kernel/debug/telemetry/s0ix_residency_usec
>
> Signed-off-by: Shanth Murthy <shanth.murthy@intel.com>
> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
> ---
> Changes in v2:
>  * Fixed typo in pr_err :- Changed s0ix_residency_us to s0ix_residency_usec
>  * Minor change w.r.t s0ix_total_res variable declaration
>
>  drivers/platform/x86/intel_telemetry_debugfs.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/drivers/platform/x86/intel_telemetry_debugfs.c b/drivers/platform/x86/intel_telemetry_debugfs.c
> index efc0140..a4267b8 100644
> --- a/drivers/platform/x86/intel_telemetry_debugfs.c
> +++ b/drivers/platform/x86/intel_telemetry_debugfs.c
> @@ -713,6 +713,24 @@ static int telem_soc_state_open(struct inode *inode, struct file *file)
>         .release        = single_release,
>  };
>
> +static int telem_s0ix_res_get(void *data, u64 *val)
> +{
> +       u64 s0ix_total_res;
> +       int ret;
> +
> +       ret = intel_pmc_s0ix_counter_read(&s0ix_total_res);
> +       if (ret) {
> +               pr_err("Failed to read S0ix residency");
> +               return ret;
> +       }
> +
> +       *val = s0ix_total_res;
> +
> +       return 0;
> +}
> +
> +DEFINE_DEBUGFS_ATTRIBUTE(telem_s0ix_fops, telem_s0ix_res_get, NULL, "%llu\n");
> +
>  static int telem_pss_trc_verb_show(struct seq_file *s, void *unused)
>  {
>         u32 verbosity;
> @@ -994,6 +1012,14 @@ static int __init telemetry_debugfs_init(void)
>                 goto out;
>         }
>
> +       f = debugfs_create_file("s0ix_residency_usec", S_IFREG | S_IRUGO,
> +                               debugfs_conf->telemetry_dbg_dir,
> +                               NULL, &telem_s0ix_fops);
> +       if (!f) {
> +               pr_err("s0ix_residency_usec debugfs register failed\n");
> +               goto out;
> +       }
> +
>         f = debugfs_create_file("pss_trace_verbosity", S_IFREG | S_IRUGO,
>                                 debugfs_conf->telemetry_dbg_dir, NULL,
>                                 &telem_pss_trc_verb_ops);
> --
> 1.9.1
>



-- 
With Best Regards,
Andy Shevchenko
