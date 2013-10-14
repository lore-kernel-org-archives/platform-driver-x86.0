From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v3 08/10] intel_mid: Added custom handler for ipc devices
Date: Mon, 14 Oct 2013 09:04:39 -0700
Message-ID: <525C1617.7090304@zytor.com>
References: <1381549404-22594-1-git-send-email-david.a.cohen@linux.intel.com> <1381549404-22594-9-git-send-email-david.a.cohen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:54575 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756670Ab3JNQFm (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 14 Oct 2013 12:05:42 -0400
In-Reply-To: <1381549404-22594-9-git-send-email-david.a.cohen@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: David Cohen <david.a.cohen@linux.intel.com>, tglx@linutronix.de, mingo@redhat.com
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, platform-driver-x86@vger.kernel.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

On 10/11/2013 08:43 PM, David Cohen wrote:
> +
> +	/*
> +	 * We need to call platform init of IPC devices to fill misc_pdata
> +	 * structure. It will be used in msic_init for initialization.
> +	 */
> +	if (dev != NULL)
> +		pdata = dev->get_platform_data(pentry);
> +

The Linux style usually prefers:

	if (dev)
		...


	-hpa
