From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] intel-wmi-thunderbolt: fix some error cases
Date: Fri, 15 Sep 2017 09:35:02 +0200
Message-ID: <20170915073502.GA20042@localhost.localdomain>
References: <1505371315-30159-1-git-send-email-mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:43459 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750787AbdIOHfV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 15 Sep 2017 03:35:21 -0400
Content-Disposition: inline
In-Reply-To: <1505371315-30159-1-git-send-email-mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

On Thu, Sep 14, 2017 at 01:41:55AM -0500, Mario Limonciello wrote:
> These were raised by Lukas Wunner as potential DOS attacks against
> the system log by passing bad data to sysfs.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>

Queued for review/testing with a minor subject change.

-- 
Darren Hart
VMware Open Source Technology Center
