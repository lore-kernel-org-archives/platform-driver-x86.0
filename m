From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH 1/3] X86 platform wmi: Introduce debug param to log all
	WMI events
Date: Thu, 20 May 2010 14:37:18 +0100
Message-ID: <20100520133718.GD15356@srcf.ucam.org>
References: <1272893417-3481-1-git-send-email-trenn@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:42925 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753220Ab0ETNhX (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 20 May 2010 09:37:23 -0400
Content-Disposition: inline
In-Reply-To: <1272893417-3481-1-git-send-email-trenn@suse.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Thomas Renninger <trenn@suse.de>
Cc: platform-driver-x86@vger.kernel.org, corentin.chary@gmail.com

On Mon, May 03, 2010 at 03:30:15PM +0200, Thomas Renninger wrote:
> +module_param(debug_event, bool, 0444);
> +MODULE_PARM_DESC(debug_event,
> +		 "Log WMI Events [0/1]");

It's an insanely small nit, but it's already declared as a bool 
parameter so the 0/1 is kind of unnecessary.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
