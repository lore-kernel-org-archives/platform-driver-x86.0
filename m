From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 1/3] platform/dell-wmi: Fix driver interface version query
Date: Tue, 1 Aug 2017 13:06:01 -0700
Message-ID: <20170801200601.GD3110@fury>
References: <cover.1501601667.git.luto@kernel.org>
 <0cc9b015ed366f3fd104d2de707083c6ca2c2a5a.1501601667.git.luto@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:38225 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752109AbdHAUGC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Aug 2017 16:06:02 -0400
Content-Disposition: inline
In-Reply-To: <0cc9b015ed366f3fd104d2de707083c6ca2c2a5a.1501601667.git.luto@kernel.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>

On Tue, Aug 01, 2017 at 08:37:26AM -0700, Andy Lutomirski wrote:
> When I converted dell-wmi to the new bus infrastructure, I left the
> call to dell_wmi_check_descriptor_buffer() in dell_wmi_init().  This
> could cause two problems:
> 
>  - An error message when loading the driver on a system without
>    dell-wmi.  We'd try to read the event descriptor even if the WMI
>    GUID wasn't there.
> 
>  - A possible race if dell-wmi was loaded manually before wmi was
>    fully initialized.
> 
> Fix it by moving the call to the probe function where it belongs.
> 
> Fixes: bff589be59c5 ("platform/x86: dell-wmi: Convert to the WMI bus infrastructure")
> Signed-off-by: Andy Lutomirski <luto@kernel.org>

Queueing this one (1/3) to testing.

Pali, aside from the separate input event receiving discussion, do you have any
concerns with this patch? I'd like to get this to Linus this week for our 4.13-2
PR for this RC cycle.

-- 
Darren Hart
VMware Open Source Technology Center
