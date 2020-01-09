From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] x86: event, use scnprintf instead of snprintf
Date: Thu, 9 Jan 2020 09:03:30 +0100
Message-ID: <20200109080330.GA2579993@kroah.com>
References: <cover.1578550730.git.liuyang34@xiaomi.com>
 <5fc0611a37b6c73fb524b8469cced8fd4cefc6a1.1578550730.git.liuyang34@xiaomi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5fc0611a37b6c73fb524b8469cced8fd4cefc6a1.1578550730.git.liuyang34@xiaomi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: liuyang34 <yangliuxm34@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Richard Fontana <rfontana@redhat.com>, Allison Randal <allison@lohutok.net>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, liuyang34 <liuyang34@xiaomi.com>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Jan 09, 2020 at 02:36:26PM +0800, liuyang34 wrote:
> the return size will low than PAGE_SIZE but maybe over 40 in show_sysctl_tfa,
> so use scnprintf instead of snprintf to get real size
> 
> Signed-off-by: liuyang34 <liuyang34@xiaomi.com>
> ---
>  arch/x86/events/intel/core.c    | 6 +++---
>  arch/x86/events/intel/pt.c      | 2 +-
>  arch/x86/platform/uv/uv_sysfs.c | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
> index 3be51aa..bf287b4 100644
> --- a/arch/x86/events/intel/core.c
> +++ b/arch/x86/events/intel/core.c
> @@ -4372,7 +4372,7 @@ static ssize_t show_sysctl_tfa(struct device *cdev,
>  			      struct device_attribute *attr,
>  			      char *buf)
>  {
> -	return snprintf(buf, 40, "%d\n", allow_tsx_force_abort);
> +	return scnprintf(buf, 40, "%d\n", allow_tsx_force_abort);

No, just use sprintf() for all of these.  We "know" the buffer size is
big enough for a single number.  There's no need for fancy checks for
any sysfs file.

thanks,

greg k-h
