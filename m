From: Yu Chen <yu.chen.surf@gmail.com>
Subject: Re: [PATCH v2 1/2] platform/x86: Add support for Uncore frequency control
Date: Mon, 13 Jan 2020 15:00:38 +0800
Message-ID: <CADjb_WQkq0R8eCNvZgtjytc3dcn9_65pzCt9brYZHo6ATy5wuw@mail.gmail.com>
References: <20200113035917.1419452-1-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200113035917.1419452-1-srinivas.pandruvada@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: andy@infradead.org, dvhart@infradead.org, Len Brown <lenb@kernel.org>, andy@kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi Srinivas,
On Mon, Jan 13, 2020 at 11:59 AM Srinivas Pandruvada
<srinivas.pandruvada@linux.intel.com> wrote:
> +
> +/* Common function to set min/max ratios to be used by sysfs callbacks */
> +static int uncore_write_ratio(struct uncore_data *data, unsigned int input,
> +                             int set_max)
> +{
> +       int ret;
> +       u64 cap;
> +
> +       mutex_lock(&uncore_lock);
> +
> +       input /= UNCORE_FREQ_KHZ_MULTIPLIER;
> +       if (!input || input > 0x7F) {
> +               ret = -EINVAL;
> +               goto finish_write;
> +       }
> +
> +       rdmsrl(MSR_UNCORE_RATIO_LIMIT, cap);
Should it be rdmsrl_on_cpu()?

Thanks,
Chenyu
