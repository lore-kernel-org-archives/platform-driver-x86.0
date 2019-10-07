From: Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v2 3/7] intel-speed-select: Add check for CascadeLake-N
 models
Date: Mon, 7 Oct 2019 13:03:13 +0300
Message-ID: <20191007100313.GP32742@smile.fi.intel.com>
References: <20191003121112.25870-1-prarit@redhat.com>
 <20191003121112.25870-4-prarit@redhat.com>
 <b1895913e2adaff4daf7be6b919e50714b418fe8.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b1895913e2adaff4daf7be6b919e50714b418fe8.camel@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Prarit Bhargava <prarit@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Oct 04, 2019 at 10:15:21AM -0700, Srinivas Pandruvada wrote:
> On Thu, 2019-10-03 at 08:11 -0400, Prarit Bhargava wrote:

> > +	/* only three CascadeLake-N models are supported */
> > +	if (is_clx_n_platform()) {
> > +		FILE *fp;
> > +		size_t n;
> > +		char *line;
> Need n = 0 and *line = NULL here as getline() will require if it has to
> allocate.

Good catch and thus...

> > +		int ret = 1;
> > +
> > +		fp = fopen("/proc/cpuinfo", "r");
> > +		if (!fp)
> > +			err(-1, "cannot open /proc/cpuinfo\n");
> > +
> > +		while (getline(&line, &n, fp) > 0) {

> > +			if (strstr(line, "model name")) {
> > +				if (strstr(line, "6252N") ||
> > +				    strstr(line, "6230N") ||
> > +				    strstr(line, "5218N"))
> > +					ret = 0;
> > +				break;
> > +			}

Missed free(line) here.

> > +		}
> > +		free(line);
> > +		fclose(fp);
> > +		return ret;
> > +	}
> > +	return 0;
> >  }
> >  
> >  /* Open a file, and exit on failure */
> > @@ -1889,7 +1927,9 @@ static void cmdline(int argc, char **argv)
> >  		fprintf(stderr, "Feature name and|or command not
> > specified\n");
> >  		exit(0);
> >  	}
> > -	update_cpu_model();
> > +	ret = update_cpu_model();
> > +	if (ret)
> > +		err(-1, "Invalid CPU model (%d)\n", cpu_model);
> >  	printf("Intel(R) Speed Select Technology\n");
> >  	printf("Executing on CPU model:%d[0x%x]\n", cpu_model,
> > cpu_model);
> >  	set_max_cpu_num();
> 

-- 
With Best Regards,
Andy Shevchenko
