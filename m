From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] intel-speed-select: Fix speed-select-base-freq-properties
 output on CLX-N
Date: Mon, 20 Apr 2020 18:43:59 +0300
Message-ID: <CAHp75VfKCuX1CNMaVLeghdoP9-KHh3+1yuFVgU8qhRbKi69JNQ@mail.gmail.com>
References: <20200420141054.26173-1-prarit@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200420141054.26173-1-prarit@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Prarit Bhargava <prarit@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Apr 20, 2020 at 6:11 PM Prarit Bhargava <prarit@redhat.com> wrote:
>
> On CLX-N, the perf-profile-level's output is terminated before the
> speed-select-base-freq-properties are output which results in a corrupt
> json file.
>
> Adjust the output of speed-select-base-freq-properties by one on CLX-N.
>

Thanks for the patch, it will be pulled from Srinivas' tree whenever
he sends a PR to PDx86 mailing list.


> Signed-off-by: Prarit Bhargava <prarit@redhat.com>
> Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> Cc: platform-driver-x86@vger.kernel.org
> ---
>  tools/power/x86/intel-speed-select/isst-display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/power/x86/intel-speed-select/isst-display.c b/tools/power/x86/intel-speed-select/isst-display.c
> index 51dbaa5f02ec..f6e2ce181123 100644
> --- a/tools/power/x86/intel-speed-select/isst-display.c
> +++ b/tools/power/x86/intel-speed-select/isst-display.c
> @@ -470,7 +470,7 @@ void isst_ctdp_display_information(int cpu, FILE *outf, int tdp_level,
>                                 _isst_pbf_display_information(cpu, outf,
>                                                               tdp_level,
>                                                           &ctdp_level->pbf_info,
> -                                                             level + 1);
> +                                                             level + 2);
>                         continue;
>                 }
>
> --
> 2.18.2
>


-- 
With Best Regards,
Andy Shevchenko
