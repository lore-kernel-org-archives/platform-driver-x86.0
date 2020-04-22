From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH] intel-speed-select: Fix
 speed-select-base-freq-properties output on CLX-N
Date: Tue, 21 Apr 2020 17:22:09 -0700
Message-ID: <ec43c672a4a98729ee011f89168ec68d3d5185f5.camel@linux.intel.com>
References: <20200420141054.26173-1-prarit@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200420141054.26173-1-prarit@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Prarit Bhargava <prarit@redhat.com>, linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, 2020-04-20 at 10:10 -0400, Prarit Bhargava wrote:
> On CLX-N, the perf-profile-level's output is terminated before the
> speed-select-base-freq-properties are output which results in a
> corrupt
> json file.
> 
> Adjust the output of speed-select-base-freq-properties by one on CLX-
> N.
Applied.

Thanks,
Srinivas

> 
> Signed-off-by: Prarit Bhargava <prarit@redhat.com>
> Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> Cc: platform-driver-x86@vger.kernel.org
> ---
>  tools/power/x86/intel-speed-select/isst-display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/power/x86/intel-speed-select/isst-display.c
> b/tools/power/x86/intel-speed-select/isst-display.c
> index 51dbaa5f02ec..f6e2ce181123 100644
> --- a/tools/power/x86/intel-speed-select/isst-display.c
> +++ b/tools/power/x86/intel-speed-select/isst-display.c
> @@ -470,7 +470,7 @@ void isst_ctdp_display_information(int cpu, FILE
> *outf, int tdp_level,
>  				_isst_pbf_display_information(cpu,
> outf,
>  							      tdp_level
> ,
>  							  &ctdp_level-
> >pbf_info,
> -							      level +
> 1);
> +							      level +
> 2);
>  			continue;
>  		}
>  
