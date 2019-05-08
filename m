From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for May 8
 (drivers/platform/x86/intel_pmc_core_plat_drv.c)
Date: Wed, 8 May 2019 13:43:25 -0700
Message-ID: <fa0e68b2-b839-b187-150c-13391c197b99@infradead.org>
References: <20190508173403.6088d0db@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190508173403.6088d0db@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rajat Jain <rajatja@google.com>, platform-driver-x86@vger.kernel.org, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On 5/8/19 12:34 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20190507:
> 
> The ubifs tree gained a conflict against Linus' tree.
> 

on i386 or x86_64:


  CC      drivers/platform/x86/intel_pmc_core_plat_drv.o
../drivers/platform/x86/intel_pmc_core_plat_drv.c:40:1: warning: data definition has no type or storage class [enabled by default]
 MODULE_DEVICE_TABLE(x86cpu, intel_pmc_core_platform_ids);
 ^
../drivers/platform/x86/intel_pmc_core_plat_drv.c:40:1: error: type defaults to ‘int’ in declaration of ‘MODULE_DEVICE_TABLE’ [-Werror=implicit-int]
../drivers/platform/x86/intel_pmc_core_plat_drv.c:40:1: warning: parameter names (without types) in function declaration [enabled by default]
../drivers/platform/x86/intel_pmc_core_plat_drv.c:59:1: warning: data definition has no type or storage class [enabled by default]
 module_init(pmc_core_platform_init);
 ^
../drivers/platform/x86/intel_pmc_core_plat_drv.c:59:1: error: type defaults to ‘int’ in declaration of ‘module_init’ [-Werror=implicit-int]
../drivers/platform/x86/intel_pmc_core_plat_drv.c:59:1: warning: parameter names (without types) in function declaration [enabled by default]
../drivers/platform/x86/intel_pmc_core_plat_drv.c:60:1: warning: data definition has no type or storage class [enabled by default]
 module_exit(pmc_core_platform_exit);
 ^
../drivers/platform/x86/intel_pmc_core_plat_drv.c:60:1: error: type defaults to ‘int’ in declaration of ‘module_exit’ [-Werror=implicit-int]
../drivers/platform/x86/intel_pmc_core_plat_drv.c:60:1: warning: parameter names (without types) in function declaration [enabled by default]
../drivers/platform/x86/intel_pmc_core_plat_drv.c:42:19: warning: ‘pmc_core_platform_init’ defined but not used [-Wunused-function]
 static int __init pmc_core_platform_init(void)
                   ^

and
WARNING: modpost: missing MODULE_LICENSE() in drivers/platform/x86/intel_pmc_core_plat_drv.o

-- 
~Randy
