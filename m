From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: intel_scu_ipc: detect CPU type automatically [Patch 1/4]
Date: Mon, 31 May 2010 12:46:44 +0200 (CEST)
Message-ID: <alpine.LFD.2.00.1005311242170.2933@localhost.localdomain>
References: <0AE3E14D83C76F4994657326177D1FF9042CE9F772@bgsmsx501.gar.corp.intel.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from www.tglx.de ([62.245.132.106]:39323 "EHLO www.tglx.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753544Ab0EaKq4 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 31 May 2010 06:46:56 -0400
In-Reply-To: <0AE3E14D83C76F4994657326177D1FF9042CE9F772@bgsmsx501.gar.corp.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Ds, Sreedhara" <sreedhara.ds@intel.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "Cox, Alan" <alan.cox@intel.com>, Matthew Garrett <mjg59@srcf.ucam.org>

On Sun, 30 May 2010, Ds, Sreedhara wrote:

>  Intel SCU message formats depend upon the processor type. Replace
> the module option with automatic detection of the processor type.

> Resending the patch
> 
> >From 443010eead6d69e3b60b460fd3f82344de95da5d Mon Sep 17 00:00:00 2001
> From: Sreedhara DS <sreedhara.ds@intel.com>
> Date: Fri, 28 May 2010 13:53:38 +0530
> Subject: [PATCH] changes to find platform type during int
>  	modified:   intel_scu_ipc.c

We merged a platform detection and a function for drivers to retrieve
the platform into the moorestown code in arch/x86 a few weeks
ago. It's in the x86/mrst branch of the tip tree.

We really don't want to have another instance of this.

Thanks,

	tglx
