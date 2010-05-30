From: "Ds, Sreedhara" <sreedhara.ds@intel.com>
Subject: RE: Patch [3/4] intel scu ipc
Date: Sun, 30 May 2010 21:20:36 +0530
Message-ID: <0AE3E14D83C76F4994657326177D1FF9042CE9F75A@bgsmsx501.gar.corp.intel.com>
References: <0AE3E14D83C76F4994657326177D1FF9042CE9F4A4@bgsmsx501.gar.corp.intel.com>
 <20100528135021.GB25798@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:47224 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752749Ab0E3Pun convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 30 May 2010 11:50:43 -0400
In-Reply-To: <20100528135021.GB25798@srcf.ucam.org>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, Alan Cox <alan@linux.intel.com>, "Du, Alek" <alek.du@intel.com>

Hello,

It is observed scu ipc driver initialized later than other drivers which are using scu ipc interface (Ex, scu ipc driver initialized after GPIO driver). This behavior is observed after scu ipc driver moved from arch/x86/kernel to drivers/platform/x86. We will work out solution for this

--Sreedhara

-----Original Message-----
From: Matthew Garrett [mailto:mjg59@srcf.ucam.org] 
Sent: Friday, May 28, 2010 7:20 PM
To: Ds, Sreedhara
Cc: platform-driver-x86@vger.kernel.org; x86@kernel.org; Alan Cox
Subject: Re: Patch [3/4] intel scu ipc

On Fri, May 28, 2010 at 02:12:35PM +0530, Ds, Sreedhara wrote:

> -module_init(intel_scu_ipc_init);
> -module_exit(intel_scu_ipc_exit);
> +fs_initcall(intel_scu_ipc_init);

This doesn't look right at all. fs_initcall is certainly wrong, and 
you've also broken the ability to use this as a module without removing 
any of the other module-specific code. Shouldn't other ipc drivers all 
be depending on this one?

-- 
Matthew Garrett | mjg59@srcf.ucam.org
