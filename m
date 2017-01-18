From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] platform: x86: Support Turbo Boost Max 3.0 for non
 HWP systems
Date: Wed, 18 Jan 2017 12:36:58 -0800
Message-ID: <20170118203658.GA3059@f23x64.localdomain>
References: <1484764155-183890-1-git-send-email-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1484764155-183890-1-git-send-email-srinivas.pandruvada@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: andriy.shevchenko@intel.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jan 18, 2017 at 10:29:15AM -0800, Srinivas Pandruvada wrote:
> On platforms supporting Intel Turbo Boost Max Technology 3.0, the
> maximum turbo frequencies (turbo ratio) of some cores in a CPU package
> may be higher than the other cores in the same package.  In that case,
> better performance can be achieved by making the scheduler prefer to run
> tasks on the CPUs with higher max turbo frequencies.
> 
> On Intel® Broadwell Xeon systems, it is optional to turn on HWP
> (Hardware P-States). When HWP is not turned on, the BIOS doesn't
> present required CPPC (Collaborative Processor Performance Control)
> tables. This table is used to get the per CPU core maximum performance
> ratio and inform scheduler (in cpufreq/intel_pstate driver).
> 
> On such systems the maximum performance ratio can be read via over
> clocking (OC) mailbox interface for each CPU. This interface is not
> architectural and can change for every model of processors.
> 
> This driver reads maximum performance ratio of each CPU and set up
> the scheduler priority metrics. In this way scheduler can prefer CPU
> with higher performance to schedule tasks.
> 
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

Queued to testing, thanks Srinivas.

-- 
Darren Hart
Intel Open Source Technology Center
