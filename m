From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Feb 11
 (drivers/platform/x86/intel_pmc_core.c)
Date: Mon, 10 Feb 2020 23:06:05 -0800
Message-ID: <f0d576b6-7204-0caf-1ca8-aae6c82d3b8d@infradead.org>
References: <20200211130054.001bfce9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200211130054.001bfce9@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On 2/10/20 6:00 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20200210:
> 

on i386:

Function args are reversed (offset and status);

../drivers/platform/x86/intel_pmc_core.c: In function 'pmc_core_resume':
../drivers/platform/x86/intel_pmc_core.c:1329:43: warning: passing argument 4 of 'pmc_core_lpm_display' makes integer from pointer without a cast [-Wint-conversion]
   pmc_core_lpm_display(pmcdev, dev, NULL, "STATUS", offset, maps);
                                           ^~~~~~~~
../drivers/platform/x86/intel_pmc_core.c:977:13: note: expected 'u32 {aka unsigned int}' but argument is of type 'char *'
 static void pmc_core_lpm_display(struct pmc_dev *pmcdev, struct device *dev,
             ^~~~~~~~~~~~~~~~~~~~
../drivers/platform/x86/intel_pmc_core.c:1329:53: warning: passing argument 5 of 'pmc_core_lpm_display' makes pointer from integer without a cast [-Wint-conversion]
   pmc_core_lpm_display(pmcdev, dev, NULL, "STATUS", offset, maps);
                                                     ^~~~~~
../drivers/platform/x86/intel_pmc_core.c:977:13: note: expected 'const char *' but argument is of type 'int'
 static void pmc_core_lpm_display(struct pmc_dev *pmcdev, struct device *dev,
             ^~~~~~~~~~~~~~~~~~~~


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
