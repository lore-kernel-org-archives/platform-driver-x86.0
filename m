From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] dell-wmi-led: Adjust instance of all wmi_evaluate_method
 calls to 0
Date: Fri, 23 Jun 2017 14:18:53 -0700
Message-ID: <20170623211853.GB1728@fury>
References: <1498228521-2796-1-git-send-email-mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:39563 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754564AbdFWVSz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 23 Jun 2017 17:18:55 -0400
Content-Disposition: inline
In-Reply-To: <1498228521-2796-1-git-send-email-mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Louis Davis <louis.davis@dell.com>

On Fri, Jun 23, 2017 at 09:35:21AM -0500, Mario Limonciello wrote:
> Pali recently noticed that WMI instances are zero indexed.
> 
> The only reason that these calls all worked properly is because the ASL
> didn't verify the instance number.
> 
> Signed-off-by: Louis Davis <louis.davis@dell.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>

Thanks, queued to testing.

-- 
Darren Hart
VMware Open Source Technology Center
