From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: Patch [3/4] intel scu ipc
Date: Fri, 28 May 2010 14:50:21 +0100
Message-ID: <20100528135021.GB25798@srcf.ucam.org>
References: <0AE3E14D83C76F4994657326177D1FF9042CE9F4A4@bgsmsx501.gar.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:39621 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755267Ab0E1Nu1 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 28 May 2010 09:50:27 -0400
Content-Disposition: inline
In-Reply-To: <0AE3E14D83C76F4994657326177D1FF9042CE9F4A4@bgsmsx501.gar.corp.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Ds, Sreedhara" <sreedhara.ds@intel.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, Alan Cox <alan@linux.intel.com>

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
