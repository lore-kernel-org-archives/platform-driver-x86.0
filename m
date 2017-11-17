From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: dell-laptop: Allocate buffer before rfkill
 use
Date: Thu, 16 Nov 2017 17:52:04 -0800
Message-ID: <20171117015204.GA22250@fury>
References: <1510777273-31322-1-git-send-email-mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:44927 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754900AbdKQBwH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Nov 2017 20:52:07 -0500
Content-Disposition: inline
In-Reply-To: <1510777273-31322-1-git-send-email-mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, valdis.kletnieks@vt.edu

On Wed, Nov 15, 2017 at 02:21:13PM -0600, Mario Limonciello wrote:
> On machines using rfkill interface the buffer needs to have been
> allocated before the initial use (memset) of it.
> 
> Reported-by: Valdis Kletnieks <valdis.kletnieks@vt.edu>
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>

Queued, thanks Valdis and Mario.
-- 
Darren Hart
VMware Open Source Technology Center
