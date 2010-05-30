From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: intel_scu_ipc: Fix to overcome late initialization of scu  ipc
	driver
Date: Sun, 30 May 2010 18:43:52 +0100
Message-ID: <20100530174352.GA2354@srcf.ucam.org>
References: <0AE3E14D83C76F4994657326177D1FF9042CE9F774@bgsmsx501.gar.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:38260 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751740Ab0E3RoA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 30 May 2010 13:44:00 -0400
Content-Disposition: inline
In-Reply-To: <0AE3E14D83C76F4994657326177D1FF9042CE9F774@bgsmsx501.gar.corp.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Ds, Sreedhara" <sreedhara.ds@intel.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "Cox, Alan" <alan.cox@intel.com>

On Sun, May 30, 2010 at 11:10:03PM +0530, Ds, Sreedhara wrote:
> -static void __exit intel_scu_ipc_exit(void)
> -{
> -	pci_unregister_driver(&ipc_driver);
> -}
> -
>  MODULE_AUTHOR("Sreedhara DS <sreedhara.ds@intel.com>");
>  MODULE_DESCRIPTION("Intel SCU IPC driver");
>  MODULE_LICENSE("GPL");
>  
> -module_init(intel_scu_ipc_init);
> -module_exit(intel_scu_ipc_exit);
> +fs_initcall(intel_scu_ipc_init);

This is wrong. If it can't be a module then delete all the other module 
code from the driver and change it to a bool in Kconfig. And don't use 
fs_initcall - subsys or arch would seem more reasonable, but you're not 
describing the problem terribly clearly. Which drivers are getting 
initialised before this?

-- 
Matthew Garrett | mjg59@srcf.ucam.org
