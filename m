From: "Luck, Tony" <tony.luck@intel.com>
Subject: Re: [patch 10/22] EDAC: Convert to new X86 CPU match macros
Date: Tue, 24 Mar 2020 12:31:44 -0700
Message-ID: <20200324193144.GA4104@agluck-desk2.amr.corp.intel.com>
References: <20200320131345.635023594@linutronix.de>
 <20200320131509.673579000@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-hwmon-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200320131509.673579000@linutronix.de>
Sender: linux-hwmon-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Gross <mgross@linux.intel.com>, linux-edac@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amit.kucheria@verdurent.com>, C
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Mar 20, 2020 at 02:13:55PM +0100, Thomas Gleixner wrote:
> The new macro set has a consistent namespace and uses C99 initializers
> instead of the grufty C89 ones.
                 ^^^^^^

grufty? Did you mean crufty?

Though I suppose grufty may work as well here:

	gruft. Noun. (uncountable) (dialect) the particles of soil
	that are spattered up onto grass by the rain.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Tested the Broadwell EDAC driver. The other changes look
good too.

Acked-by: Tony Luck <tony.luck@intel.com>
