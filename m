From: "dbasehore ." <dbasehore@chromium.org>
Subject: Re: [PATCH v4] platform:x86: Add PMC Driver for Intel Core SOC
Date: Fri, 20 May 2016 17:34:42 -0700
Message-ID: <CAGAzgsqxuOeP-UQkQyHS4zbUzVP26eHy=+ju+w1skKGe3Q=7=A@mail.gmail.com>
References: <1463061001-23210-1-git-send-email-rajneesh.bhardwaj@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463061001-23210-1-git-send-email-rajneesh.bhardwaj@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Cc: platform-driver-x86@vger.kernel.org, dvhart@infradead.org, linux-kernel <linux-kernel@vger.kernel.org>, olof@lixom.net, vishwanath.somayaji@intel.com
List-Id: platform-driver-x86.vger.kernel.org

On Thu, May 12, 2016 at 6:50 AM, Rajneesh Bhardwaj
<rajneesh.bhardwaj@intel.com> wrote:
>
> + * pmc_dev contains info about power management controller device.
> + */
> +struct pmc_dev {
> +       u32 base_addr;
> +       void __iomem *regmap;
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +       struct dentry *dbgfs_dir;
> +#endif /* CONFIG_DEBUG_FS */
> +       bool has_slp_s0_res;
> +};
> +
> +int intel_pmc_slp_s0_counter_read(u64 *data);


Can this function be split out into another header file? The struct
pmc_dev is internal, but this function is needed as an external
interface.
