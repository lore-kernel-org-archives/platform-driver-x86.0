From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 1/2] hp-wmi: Do not shadow error values
Date: Wed, 19 Apr 2017 13:11:20 -0700
Message-ID: <20170419201120.GA17351@fury>
References: <20170419174154.16518-1-carlo@caione.org>
 <20170419174154.16518-2-carlo@caione.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:50994 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936556AbdDSULX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 Apr 2017 16:11:23 -0400
Content-Disposition: inline
In-Reply-To: <20170419174154.16518-2-carlo@caione.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Carlo Caione <carlo@caione.org>
Cc: andy@infradead.org, andy.shevchenko@gmail.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux@endlessm.com, Carlo Caione <carlo@endlessm.com>

On Wed, Apr 19, 2017 at 07:41:53PM +0200, Carlo Caione wrote:
> From: Carlo Caione <carlo@endlessm.com>
> 
> All the helper functions (i.e. hp_wmi_dock_state, hp_wmi_tablet_state,
> ...) using hp_wmi_perform_query to perform an HP WMI query shadow the
> returned value in case of error.
> 
> We return -EINVAL only when the HP WMI query returns a positive value
> (the specific error code) to not mix this up with the actual value
> returned by the helper function.

So Andy is correct in that we try to avoid shadowing error codes where possible.
I accepted v1 of this series because it fixed an existing problem in a way
consistent with the existing code.

Since v1 is already in for-next, let's consider the following a subsequent
cleanup. Would you please create a new patch to address the shadowing error code
issues on top of the v1 patch series.

Thanks,
-- 
Darren Hart
VMware Open Source Technology Center
