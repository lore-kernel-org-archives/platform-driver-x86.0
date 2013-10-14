From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v3 07/10] intel_mid: Added custom device_handler support
Date: Mon, 14 Oct 2013 09:30:58 -0700
Message-ID: <525C1C42.5010805@zytor.com>
References: <1381549404-22594-1-git-send-email-david.a.cohen@linux.intel.com>  <1381549404-22594-8-git-send-email-david.a.cohen@linux.intel.com>  <525C15E8.9010201@zytor.com> <1381767415.25528.10.camel@joe-AO722> <525C1CBB.9030708@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:54871 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756036Ab3JNQca (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 14 Oct 2013 12:32:30 -0400
In-Reply-To: <525C1CBB.9030708@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: David Cohen <david.a.cohen@linux.intel.com>, Joe Perches <joe@perches.com>
Cc: tglx@linutronix.de, Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, x86@kernel.org, platform-driver-x86@vger.kernel.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

On 10/14/2013 09:32 AM, David Cohen wrote:
> 
> Thanks for your feedback. The parameters happen to be similar at this
> time, but they won't be after next patches. I believe a macro could
> remove only prefix 'SFI_DEV_TYPE_' and suffix '_platform_data', which
> seems enough to reduce line size.
> 

That seems like unnecessary obfuscation.

	-hpa
