From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH v2 3/7] intel-speed-select: Add check for CascadeLake-N
 models
Date: Mon, 07 Oct 2019 12:18:00 -0700
Message-ID: <00b61947ffe509d02383903a059067517dd2605c.camel@linux.intel.com>
References: <20191003121112.25870-1-prarit@redhat.com>
         <20191003121112.25870-4-prarit@redhat.com>
         <b1895913e2adaff4daf7be6b919e50714b418fe8.camel@linux.intel.com>
         <20191007100313.GP32742@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191007100313.GP32742@smile.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Prarit Bhargava <prarit@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, 2019-10-07 at 13:03 +0300, Andy Shevchenko wrote:
> On Fri, Oct 04, 2019 at 10:15:21AM -0700, Srinivas Pandruvada wrote:
> > On Thu, 2019-10-03 at 08:11 -0400, Prarit Bhargava wrote:
> > > +	/* only three CascadeLake-N models are supported */
> > > +	if (is_clx_n_platform()) {
> > > +		FILE *fp;
> > > +		size_t n;
> > > +		char *line;
> > 
> > Need n = 0 and *line = NULL here as getline() will require if it
> > has to
> > allocate.
> 
> Good catch and thus...
> 
> > > +		int ret = 1;
> > > +
> > > +		fp = fopen("/proc/cpuinfo", "r");
> > > +		if (!fp)
> > > +			err(-1, "cannot open /proc/cpuinfo\n");
> > > +
> > > +		while (getline(&line, &n, fp) > 0) {
> > > +			if (strstr(line, "model name")) {
> > > +				if (strstr(line, "6252N") ||
> > > +				    strstr(line, "6230N") ||
> > > +				    strstr(line, "5218N"))
> > > +					ret = 0;
> > > +				break;
> > > +			}
> 
> Missed free(line) here.
This may not be required. After the first call geline() allocated a
buffer and will reuse it during next call. If it is not enough it will
realloc even if the buffer is passed by user via malloc().

From man page:

"
If *lineptr is set to NULL and *n is set 0 before the call, then
       getline() will allocate a buffer for storing the line.  This
buffer
       should be freed by the user program even if getline() failed.

       Alternatively, before calling getline(), *lineptr can contain a
       pointer to a malloc(3)-allocated buffer *n bytes in size.  If
the
       buffer is not large enough to hold the line, getline() resizes
it
       with realloc(3), updating *lineptr and *n as necessary.

       In either case, on a successful call, *lineptr and *n will be
updated
       to reflect the buffer address and allocated size respectively.
"

> 
> > > +		}
> > > +		free(line);
> > > +		fclose(fp);
> > > +		return ret;
> > > +	}
> > > +	return 0;
> > >  }
> > >  
> > >  /* Open a file, and exit on failure */
> > > @@ -1889,7 +1927,9 @@ static void cmdline(int argc, char **argv)
> > >  		fprintf(stderr, "Feature name and|or command not
> > > specified\n");
> > >  		exit(0);
> > >  	}
> > > -	update_cpu_model();
> > > +	ret = update_cpu_model();
> > > +	if (ret)
> > > +		err(-1, "Invalid CPU model (%d)\n", cpu_model);
> > >  	printf("Intel(R) Speed Select Technology\n");
> > >  	printf("Executing on CPU model:%d[0x%x]\n", cpu_model,
> > > cpu_model);
> > >  	set_max_cpu_num();
> 
> 
