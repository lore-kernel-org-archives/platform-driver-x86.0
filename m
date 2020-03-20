From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [patch 02/22] x86/cpu: Add conistent CPU match macros
Date: Fri, 20 Mar 2020 09:29:12 -0500
Message-ID: <20200320142912.GA186731@google.com>
References: <20200320131508.826011988@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-acpi-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200320131508.826011988@linutronix.de>
Sender: linux-acpi-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Gross <mgross@linux.intel.com>, Tony Luck <tony.luck@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, linux-edac@vger.kernel.org, platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit
List-Id: platform-driver-x86.vger.kernel.org

s/conistent/consistent/ in subject

On Fri, Mar 20, 2020 at 02:13:47PM +0100, Thomas Gleixner wrote:
> Finding all places which build x86_cpu_id match tables is tedious and the
> logic is hidden in lots of differently named macro wrappers.
> 
> Most of these initializer macros use plain C89 initializers which rely on
> the ordering of the struct members. So new members could only be added at
> the end of the struct, but that's ugly as hell and C99 initializers are
> really the right thing to use.
> 
> Provide a set of macros which:
> 
>   - Have a proper naming scheme, starting with X86_MATCH_
> 
>   - Use C99 initializers
> 
> The set of provided macros are all subsets of the base macro
> 
>     X86_MATCH_VENDOR_FAM_MODEL_FEATURE()
> 
> which allows to supply all possible selection criteria:
> 
>       vendor, family, model, feature
> 
> The other macros shorten this to avoid typing all arguments when they are
> not needed and would require one of the _ANY constants. They have been
> created due to the requirements of the existing usage sites.
> 
> Also a add a few model constants for Centaur CPUs and QUARK.

s/Also a/Also/
