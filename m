From: Prarit Bhargava <prarit@redhat.com>
Subject: Re: [PATCH 2/2] tools/power/x86/intel-speed-select: Display core
 count for bucket
Date: Fri, 6 Sep 2019 05:39:54 -0400
Message-ID: <780a3faf-9e44-64f4-a354-bdee39af3af5@redhat.com>
References: <20190905233748.6822-1-srinivas.pandruvada@linux.intel.com>
 <20190905233748.6822-2-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190905233748.6822-2-srinivas.pandruvada@linux.intel.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, andriy.shevchenko@intel.com
Cc: darcari@redhat.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org



On 9/5/19 7:37 PM, Srinivas Pandruvada wrote:
> Read the bucket and core count relationship via MSR and display
> when displaying turbo ratio limits.
> 
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> ---
>  .../power/x86/intel-speed-select/isst-core.c  | 22 +++++++++++++++++++
>  .../x86/intel-speed-select/isst-display.c     |  6 ++---
>  tools/power/x86/intel-speed-select/isst.h     |  1 +
>  3 files changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/power/x86/intel-speed-select/isst-core.c b/tools/power/x86/intel-speed-select/isst-core.c
> index 8de4ac39a008..2f864c4b994d 100644
> --- a/tools/power/x86/intel-speed-select/isst-core.c
> +++ b/tools/power/x86/intel-speed-select/isst-core.c
> @@ -188,6 +188,24 @@ int isst_get_get_trl(int cpu, int level, int avx_level, int *trl)
>  	return 0;
>  }
>  
> +int isst_get_trl_bucket_info(int cpu, unsigned long long *buckets_info)
> +{
> +	int ret;
> +
> +	debug_printf("cpu:%d bucket info via MSR\n", cpu);
> +
> +	*buckets_info = 0;
> +
> +	ret = isst_send_msr_command(cpu, 0x1ae, 0, buckets_info);

^^^ you can get rid of the magic number 0x1ae by doing (sorry for the cut-and-paste)

diff --git a/tools/power/x86/intel-speed-select/Makefile b/tools/power/x86/intel
index 12c6939dca2a..087d802ad844 100644
--- a/tools/power/x86/intel-speed-select/Makefile
+++ b/tools/power/x86/intel-speed-select/Makefile
@@ -15,6 +15,8 @@ endif
 MAKEFLAGS += -r

 override CFLAGS += -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include
+override CFLAGS += -I../../../include
+override CFLAGS += -DMSRHEADER='"../../../../arch/x86/include/asm/msr-index.h"'

 ALL_TARGETS := intel-speed-select
 ALL_PROGRAMS := $(patsubst %,$(OUTPUT)%,$(ALL_TARGETS))
diff --git a/tools/power/x86/intel-speed-select/isst.h b/tools/power/x86/intel-s
index 2f7f62765eb6..00d159dc12a6 100644
--- a/tools/power/x86/intel-speed-select/isst.h
+++ b/tools/power/x86/intel-speed-select/isst.h
@@ -7,6 +7,7 @@
 #ifndef _ISST_H_
 #define _ISST_H_

+#include MSRHEADER
 #include <stdio.h>
 #include <unistd.h>
 #include <sys/types.h>

and replacing the MSR addresses with the names of the MSRs.

> +	if (ret)
> +		return ret;
> +

As I've been looking at this code I have been wondering why didn't you just use
the standard /dev/cpu/X/msr interface that other x86 power utilities (turbostat,
x86_energy_perf_policy) use?  Implementing msr_read() is trivial (warning
untested and uncompiled code)

static void read_msr(int cpu, int offset, unsigned long long *msr)
{
        ssize_t retval;
        char pathname[32];
        int fd;

        sprintf(pathname, "/dev/cpu/%d/msr", cpu);
        fd = open(pathname, O_RDONLY);
        if (fd < 0)
                err(-1, "%s open failed", pathname);

        retval = pread(fd, msr, sizeof(*msr), offset);
        if (retval != (sizeof *msr))
                err(-1, "%s failed: cpu %d msr offset 0x%llx\n", __func__, cpu,
                    (unsigned long long)offset);
        close(fd);
}

and would result in a significant reduction in code in the driver and the tool
IMO.  write_msr() is equally trivial.

P.

> +	debug_printf("cpu:%d bucket info via MSR successful 0x%llx\n", cpu,
> +		     *buckets_info);
> +
> +	return 0;
> +}
> +
>  int isst_set_tdp_level_msr(int cpu, int tdp_level)
>  {
>  	int ret;
> @@ -563,6 +581,10 @@ int isst_get_process_ctdp(int cpu, int tdp_level, struct isst_pkg_ctdp *pkg_dev)
>  		if (ret)
>  			return ret;
>  
> +		ret = isst_get_trl_bucket_info(cpu, &ctdp_level->buckets_info);
> +		if (ret)
> +			return ret;
> +
>  		ret = isst_get_get_trl(cpu, i, 0,
>  				       ctdp_level->trl_sse_active_cores);
>  		if (ret)
> diff --git a/tools/power/x86/intel-speed-select/isst-display.c b/tools/power/x86/intel-speed-select/isst-display.c
> index 8500cf2997a6..df4aa99c4e92 100644
> --- a/tools/power/x86/intel-speed-select/isst-display.c
> +++ b/tools/power/x86/intel-speed-select/isst-display.c
> @@ -372,7 +372,7 @@ void isst_ctdp_display_information(int cpu, FILE *outf, int tdp_level,
>  			format_and_print(outf, base_level + 5, header, NULL);
>  
>  			snprintf(header, sizeof(header), "core-count");
> -			snprintf(value, sizeof(value), "%d", j);
> +			snprintf(value, sizeof(value), "%llu", (ctdp_level->buckets_info >> (j * 8)) & 0xff);
>  			format_and_print(outf, base_level + 6, header, value);
>  
>  			snprintf(header, sizeof(header),
> @@ -389,7 +389,7 @@ void isst_ctdp_display_information(int cpu, FILE *outf, int tdp_level,
>  			format_and_print(outf, base_level + 5, header, NULL);
>  
>  			snprintf(header, sizeof(header), "core-count");
> -			snprintf(value, sizeof(value), "%d", j);
> +			snprintf(value, sizeof(value), "%llu", (ctdp_level->buckets_info >> (j * 8)) & 0xff);
>  			format_and_print(outf, base_level + 6, header, value);
>  
>  			snprintf(header, sizeof(header),
> @@ -407,7 +407,7 @@ void isst_ctdp_display_information(int cpu, FILE *outf, int tdp_level,
>  			format_and_print(outf, base_level + 5, header, NULL);
>  
>  			snprintf(header, sizeof(header), "core-count");
> -			snprintf(value, sizeof(value), "%d", j);
> +			snprintf(value, sizeof(value), "%llu", (ctdp_level->buckets_info >> (j * 8)) & 0xff);
>  			format_and_print(outf, base_level + 6, header, value);
>  
>  			snprintf(header, sizeof(header),
> diff --git a/tools/power/x86/intel-speed-select/isst.h b/tools/power/x86/intel-speed-select/isst.h
> index 221881761609..2f7f62765eb6 100644
> --- a/tools/power/x86/intel-speed-select/isst.h
> +++ b/tools/power/x86/intel-speed-select/isst.h
> @@ -134,6 +134,7 @@ struct isst_pkg_ctdp_level_info {
>  	size_t core_cpumask_size;
>  	cpu_set_t *core_cpumask;
>  	int cpu_count;
> +	unsigned long long buckets_info;
>  	int trl_sse_active_cores[ISST_TRL_MAX_ACTIVE_CORES];
>  	int trl_avx_active_cores[ISST_TRL_MAX_ACTIVE_CORES];
>  	int trl_avx_512_active_cores[ISST_TRL_MAX_ACTIVE_CORES];
> 
