From: Joe Perches <joe@perches.com>
Subject: Re: [Patch v2] MAINTAINERS: intel_telemetry: Update maintainers info
Date: Tue, 09 Oct 2018 10:46:56 -0700
Message-ID: <262d8a05cedc76bc90fa5be7d3b92d5faa2b4ce9.camel@perches.com>
References: <20181009141833.25972-1-rajneesh.bhardwaj@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181009141833.25972-1-rajneesh.bhardwaj@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>, platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, rajneesh.bhardwaj@intel.com, david.e.box@linux.intel.com
List-Id: platform-driver-x86.vger.kernel.org

On Tue, 2018-10-09 at 19:48 +0530, Rajneesh Bhardwaj wrote:
> Add myself and David as the new maintainers for Intel Telemetry driver
> since Souvik no longer works with Intel. David and I work on power
> management and debug related drivers which are pretty close to this one
> in terms of functionalities so volunteering for the task.
> 
> Signed-off-by: Box, David E <david.e.box@linux.intel.com>
> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
> ---
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 22065048d89d..f33ebd1b8034 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7530,7 +7530,8 @@ F:	arch/x86/crypto/sha*-mb/
>  F:	crypto/mcryptd.c
>  
>  INTEL TELEMETRY DRIVER
> -M:	Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
> +M:	Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
> +M:	Box, David E <david.e.box@linux.intel.com>

It is better to quote your name when it uses
non-alphabetic characters like periods and commas.

Especially the comma because that is commonly used
by email clients as a multiple address separator so
it makes copy/paste use error-prone.

It's also likely better to use a more typical
"First <Initial> Last" name style. 

>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  F:	arch/x86/include/asm/intel_telemetry.hch mor
