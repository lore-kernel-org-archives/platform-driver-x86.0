From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 3/4] platform/x86: intel_pmc_core: Decode Snoop / Non
 Snoop LTR
Date: Wed, 26 Sep 2018 16:53:55 +0300
Message-ID: <CAHp75VcKSVJQ54qFV1BwqnwUu4dkS6sOACT3nTntJV+Ww56Oag@mail.gmail.com>
References: <20180903180415.31575-1-rajneesh.bhardwaj@linux.intel.com> <20180903180415.31575-3-rajneesh.bhardwaj@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180903180415.31575-3-rajneesh.bhardwaj@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rajneesh.bhardwaj@linux.intel.com
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Sep 3, 2018 at 9:05 PM Rajneesh Bhardwaj
<rajneesh.bhardwaj@linux.intel.com> wrote:
>
> The LTR values follow PCIE LTR encoding format and can be decoded as per
> https://pcisig.com/sites/default/files/specification_documents/ECN_LatencyTolnReporting_14Aug08.pdf
>
> This adds support to translate the raw LTR values as read from the PMC
> to meaningful values in nanosecond units of time.

> +static void get_ltr_scale(u32 *val)

What's wrong to return converted value? Actually the name should
reflect what it does, ie *convert* value.

> +{
> +       /*
> +        * As per PCIE specification supprting document

supporting

> +        * ECN_LatencyTolnReporting_14Aug08.pdf the Latency
> +        * Tolerance Reporting data payload is encoded in a
> +        * 3 bit scale and 10 bit value fields. Values are
> +        * multiplied by the indicated scale to yield an absolute time
> +        * value, expressible in a range from 1 nanosecond to
> +        * 2^25*(2^10-1) = 34,326,183,936 nanoseconds.
> +        *
> +        * scale encoding is as follows:
> +        *
> +        * ----------------------------------------------
> +        * |scale factor        |       Multiplier (ns) |
> +        * ----------------------------------------------
> +        * |    0               |       1               |
> +        * |    1               |       32              |
> +        * |    2               |       1024            |
> +        * |    3               |       32768           |
> +        * |    4               |       1048576         |
> +        * |    5               |       33554432        |
> +        * |    6               |       Invalid         |
> +        * |    7               |       Invalid         |
> +        * ----------------------------------------------
> +        */
> +       if (*val > 5) {
> +               *val = 0;
> +               pr_warn("Invalid LTR scale factor.\n");
> +       } else {
> +               *val = 1U << (5 * (*val));
> +       }
> +}

> +
>  static int pmc_core_ltr_show(struct seq_file *s, void *unused)
>  {
>         struct pmc_dev *pmcdev = s->private;
>         const struct pmc_bit_map *map = pmcdev->map->ltr_show_sts;
> +       u64 decoded_snoop_ltr = 0, decoded_non_snoop_ltr = 0;
> +       union ltr_payload ltr_data;

> +       u32 scale = 0;

Redundant assignment.

>         int index;
>
>         for (index = 0; map[index].name ; index++) {
> -               seq_printf(s, "%-32s\tRAW LTR: 0x%x\n",
> +               ltr_data.raw_data = pmc_core_reg_read(pmcdev,
> +                                                     map[index].bit_mask);
> +
> +               if (ltr_data.bits.non_snoop_req) {
> +                       scale = ltr_data.bits.non_snoop_scale;
> +                       get_ltr_scale(&scale);
> +                       decoded_non_snoop_ltr =
> +                               ltr_data.bits.non_snoop_val * scale;
> +               }
> +
> +               if (ltr_data.bits.snoop_req) {
> +                       scale = ltr_data.bits.snoop_scale;
> +                       get_ltr_scale(&scale);
> +                       decoded_snoop_ltr =
> +                               ltr_data.bits.snoop_val * scale;
> +               }
> +
> +               seq_printf(s, "%-24s\tRaw LTR: 0x%-16x\t Non-Snoop LTR (ns): %-16llu\t Snoop LTR (ns): %-16llu\n",
>                            map[index].name,
> -                          pmc_core_reg_read(pmcdev, map[index].bit_mask));
> +                          ltr_data.raw_data,
> +                          decoded_non_snoop_ltr,
> +                          decoded_snoop_ltr);
> +

> +               decoded_snoop_ltr = decoded_non_snoop_ltr = 0;

You may do this at the beginning of the loop and get rid of assignment
in the definition block.

>         }
>         return 0;
>  }

> +union ltr_payload {
> +       u32 raw_data;
> +       struct {
> +       u32 snoop_val : 10;
> +       u32 snoop_scale : 3;
> +       u32 snoop_res : 2;
> +       u32 snoop_req : 1;
> +       u32 non_snoop_val : 10;
> +       u32 non_snoop_scale : 3;
> +       u32 non_snoop_res : 2;
> +       u32 non_snoop_req : 1;
> +       } bits;
> +};

Just use normal masks and shifts.

-- 
With Best Regards,
Andy Shevchenko
