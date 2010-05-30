From: "Ds, Sreedhara" <sreedhara.ds@intel.com>
Subject: RE: [Patch 1/4] intel scu ipc
Date: Sun, 30 May 2010 21:09:59 +0530
Message-ID: <0AE3E14D83C76F4994657326177D1FF9042CE9F757@bgsmsx501.gar.corp.intel.com>
References: <0AE3E14D83C76F4994657326177D1FF9042CE9F49C@bgsmsx501.gar.corp.intel.com>
 <20100528195133.708ab02c@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:26788 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752749Ab0E3PlJ convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 30 May 2010 11:41:09 -0400
In-Reply-To: <20100528195133.708ab02c@linux.intel.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alan Cox <alan@linux.intel.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "mjg@redhat.com" <mjg@redhat.com>, "x86@kernel.org" <x86@kernel.org>

Alan,
Your comment is valid. 
Please add it to the Meego working tree


--Sreedhara

-----Original Message-----
From: Alan Cox [mailto:alan@linux.intel.com] 
Sent: Saturday, May 29, 2010 12:22 AM
To: Ds, Sreedhara
Cc: platform-driver-x86@vger.kernel.org; mjg@redhat.com; x86@kernel.org
Subject: Re: [Patch 1/4] intel scu ipc

On Fri, 28 May 2010 14:09:39 +0530
"Ds, Sreedhara" <sreedhara.ds@intel.com> wrote:

> Hello,
> Please review and accept the patch
> 
> 
> From 443010eead6d69e3b60b460fd3f82344de95da5d Mon Sep 17 00:00:00 2001
> From: Sreedhara DS <sreedhara.ds@intel.com>
> Date: Fri, 28 May 2010 13:53:38 +0530
> Subject: [PATCH] changes to find platform type during int
>  	modified:   intel_scu_ipc.c
> 
> 
> Signed-off-by: Sreedhara DS <sreedhara.ds@intel.com>

Code is fine but your subject/comments don't reflect the patch. That
causes problems for the upstream merge because the upstream history
needs to accurately describe it.

Something like

Subject: intel_scu_ipc: detect CPU type automatically

Intel SCU message formats depend upon the processor type. Replace the
module option with automatic detection of the processor type.


----

Code looks fine and I'll add it to the Meego working tree but with the
comment I quoted if that is ok

Alan
