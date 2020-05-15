From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH] intel-speed-select: Fix json perf-profile output output
Date: Fri, 15 May 2020 12:58:01 -0700
Message-ID: <6eb0773d64cd5a4e25ca6d1c78c9c3ed7d190f46.camel@linux.intel.com>
References: <20200511190628.25661-1-prarit@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200511190628.25661-1-prarit@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Prarit Bhargava <prarit@redhat.com>, linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, 2020-05-11 at 15:06 -0400, Prarit Bhargava wrote:

I prefer prefix as: "tools/power/x86/intel-speed-select" instead of
just "intel-speed-select". 

Fixed and applied.

Thanks,
Srinivas

> The 'intel-speed-select -f json perf-profile get-lock-status' command
> outputs the package, die, and cpu data as separate fields.
> 
> ex)
> 
>   "package-0": {
>     "die-0": {
>       "cpu-0": {
> 
> Commit 74062363f855 ("tools/power/x86/intel-speed-select: Avoid
> duplicate Package strings for json") prettied this output so that it
> is a single line for
> some json output commands and the same should be done for other
> commands.
> 
> Output package, die, and cpu info in a single line when using json
> output.
> 
> Signed-off-by: Prarit Bhargava <prarit@redhat.com>
> Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> Cc: platform-driver-x86@vger.kernel.org
> ---
>  .../x86/intel-speed-select/isst-display.c     | 26 +++++++++++++--
> ----
>  1 file changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/power/x86/intel-speed-select/isst-display.c
> b/tools/power/x86/intel-speed-select/isst-display.c
> index f6e2ce181123..e105fece47b6 100644
> --- a/tools/power/x86/intel-speed-select/isst-display.c
> +++ b/tools/power/x86/intel-speed-select/isst-display.c
> @@ -316,21 +316,31 @@ void isst_ctdp_display_core_info(int cpu, FILE
> *outf, char *prefix,
>  {
>  	char header[256];
>  	char value[256];
> +	int level = 1;
> +
> +	if (out_format_is_json()) {
> +		snprintf(header, sizeof(header), "package-%d:die-
> %d:cpu-%d",
> +			 get_physical_package_id(cpu),
> get_physical_die_id(cpu),
> +			 cpu);
> +		format_and_print(outf, level++, header, NULL);
> +	} else {
> +		snprintf(header, sizeof(header), "package-%d",
> +			 get_physical_package_id(cpu));
> +		format_and_print(outf, level++, header, NULL);
> +		snprintf(header, sizeof(header), "die-%d",
> +			 get_physical_die_id(cpu));
> +		format_and_print(outf, level++, header, NULL);
> +		snprintf(header, sizeof(header), "cpu-%d", cpu);
> +		format_and_print(outf, level++, header, NULL);
> +	}
>  
> -	snprintf(header, sizeof(header), "package-%d",
> -		 get_physical_package_id(cpu));
> -	format_and_print(outf, 1, header, NULL);
> -	snprintf(header, sizeof(header), "die-%d",
> get_physical_die_id(cpu));
> -	format_and_print(outf, 2, header, NULL);
> -	snprintf(header, sizeof(header), "cpu-%d", cpu);
> -	format_and_print(outf, 3, header, NULL);
>  	if (str0 && !val)
>  		snprintf(value, sizeof(value), "%s", str0);
>  	else if (str1 && val)
>  		snprintf(value, sizeof(value), "%s", str1);
>  	else
>  		snprintf(value, sizeof(value), "%u", val);
> -	format_and_print(outf, 4, prefix, value);
> +	format_and_print(outf, level, prefix, value);
>  
>  	format_and_print(outf, 1, NULL, NULL);
>  }
