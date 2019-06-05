From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] x86/cpu: Add Icelake-NNPI to Intel family
Date: Wed, 5 Jun 2019 13:32:42 +0300
Message-ID: <20190605103242.GU9224@smile.fi.intel.com>
References: <20190530123827.8218-1-rajneesh.bhardwaj@linux.intel.com>
 <20190604160914.GN9224@smile.fi.intel.com>
 <79e33a93-6180-5a58-0d8c-b34276e710f3@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <79e33a93-6180-5a58-0d8c-b34276e710f3@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, bp@suse.de, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Kan Liang <kan.liang@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, platform-driver-x86@vger.kernel.org, Qiuxu Zhuo <qiuxu.zhuo@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Linux PM <linux-pm@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jun 05, 2019 at 12:54:12AM +0530, Bhardwaj, Rajneesh wrote:
> Hi Andy
> 
> On 04-Jun-19 9:39 PM, Andy Shevchenko wrote:
> > On Thu, May 30, 2019 at 06:08:27PM +0530, Rajneesh Bhardwaj wrote:
> > > Add the CPUID model number of Icelake Neural Network Processor for Deep
> > I believe we spell "Ice Lake".
> 
> I referred to https://patchwork.kernel.org/patch/10812551/ , https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6e394376ee89233508fa21d006546357f8efee31
> and many others where it mentioned Icelake. I am fine to change it the way
> you are suggesting, please confirm if its still needed and i will send a v2.

I think the references have a mistake as well.

-- 
With Best Regards,
Andy Shevchenko
