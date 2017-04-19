From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] hp-wmi: Do not shadow error values
Date: Wed, 19 Apr 2017 13:56:44 -0700
Message-ID: <20170419205644.GD17351@fury>
References: <20170419203639.28788-1-carlo@caione.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:41048 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S938126AbdDSU4r (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 Apr 2017 16:56:47 -0400
Content-Disposition: inline
In-Reply-To: <20170419203639.28788-1-carlo@caione.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Carlo Caione <carlo@caione.org>
Cc: andy@infradead.org, andy.shevchenko@gmail.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux@endlessm.com, Carlo Caione <carlo@endlessm.com>

On Wed, Apr 19, 2017 at 10:36:39PM +0200, Carlo Caione wrote:
> From: Carlo Caione <carlo@endlessm.com>
> 
> All the helper functions (i.e. hp_wmi_dock_state, hp_wmi_tablet_state,
> ...) using hp_wmi_perform_query to perform an HP WMI query shadow the
> returned value in case of error.
> 
> We return -EINVAL only when the HP WMI query returns a positive value
> (the specific error code) to not mix this up with the actual value
> returned by the helper function.
> 
> Signed-off-by: Carlo Caione <carlo@endlessm.com>

Queued to testing, thanks Carlo.


-- 
Darren Hart
VMware Open Source Technology Center
