From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH 8/8] tools/power/x86/intel-speed-select: Output
 success/failed for command output
Date: Tue, 03 Sep 2019 15:18:43 -0700
Message-ID: <1da2a58548277dfd8086be02b8467cc903ed7932.camel@linux.intel.com>
References: <20190903153734.11904-1-prarit@redhat.com>
         <20190903153734.11904-9-prarit@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190903153734.11904-9-prarit@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Prarit Bhargava <prarit@redhat.com>, platform-driver-x86@vger.kernel.org
Cc: David Arcari <darcari@redhat.com>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, 2019-09-03 at 11:37 -0400, Prarit Bhargava wrote:
> Command output has confusing data, returning "0" on success.  For
> example
> 
> > # ./intel-speed-select -c 14 turbo-freq enable
> 
> Intel(R) Speed Select Technology
> Executing on CPU model:106[0x6a]
>  package-1
>    die-0
>      cpu-14
>        turbo-freq
>          enable:0
> 
> To avoid confusion change the command output to 'success' or
> 'failed'.
We need to fix also help in the function usage() to match new
implementation

"        printf("\t\t\tFor Set commands, status is 0 for success and
rest for failures\n");
"

Thanks,
Srinivas

> Signed-off-by: Prarit Bhargava <prarit@redhat.com>
> Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> Cc: David Arcari <darcari@redhat.com>
> Cc: linux-kernel@vger.kernel.org
> ---
>  tools/power/x86/intel-speed-select/isst-display.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/power/x86/intel-speed-select/isst-display.c
> b/tools/power/x86/intel-speed-select/isst-display.c
> index 890a01bfee4b..8500cf2997a6 100644
> --- a/tools/power/x86/intel-speed-select/isst-display.c
> +++ b/tools/power/x86/intel-speed-select/isst-display.c
> @@ -519,7 +519,10 @@ void isst_display_result(int cpu, FILE *outf,
> char *feature, char *cmd,
>  	snprintf(header, sizeof(header), "%s", feature);
>  	format_and_print(outf, 4, header, NULL);
>  	snprintf(header, sizeof(header), "%s", cmd);
> -	snprintf(value, sizeof(value), "%d", result);
> +	if (!result)
> +		snprintf(value, sizeof(value), "success");
> +	else
> +		snprintf(value, sizeof(value), "failed(error %d)",
> result);
>  	format_and_print(outf, 5, header, value);
>  
>  	format_and_print(outf, 1, NULL, NULL);
