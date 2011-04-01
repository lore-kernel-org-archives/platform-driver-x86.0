From: Arjan van de Ven <arjan@linux.intel.com>
Subject: Re: [Meego-kernel] [PATCH] platform-x86: intel_mid_thermal: Fix coding
 style
Date: Fri, 01 Apr 2011 08:48:14 -0700
Message-ID: <4D95F3BE.2010601@linux.intel.com>
References: <1301666051-27021-1-git-send-email-ameya.palande@nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:34761 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751316Ab1DAPsP (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 1 Apr 2011 11:48:15 -0400
In-Reply-To: <1301666051-27021-1-git-send-email-ameya.palande@nokia.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ameya Palande <ameya.palande@nokia.com>
Cc: platform-driver-x86@vger.kernel.org, meego-kernel@lists.meego.com, durgadoss.r@intel.com, mjg@redhat.com

On 4/1/2011 6:54 AM, Ameya Palande wrote:
> Before fixing checkpatch.pl reported 74 errors and 234 warnings
>
> Signed-off-by: Ameya Palande<ameya.palande@nokia.com>
> ---
>   drivers/platform/x86/intel_mid_thermal.c |  606 +++++++++++++++---------------
>   1 files changed, 300 insertions(+), 306 deletions(-)
>


where is this? this thing does not seem to be in mainline or the meego 
kernel...
(but you put both meego and upstream on the mail)
