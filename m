From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 0/2] Account for uncorrectable failures in probing
Date: Thu, 9 Nov 2017 17:18:01 -0800
Message-ID: <20171110011801.GA9783@fury>
References: <cover.1510246939.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:53693 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755255AbdKJBSD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Nov 2017 20:18:03 -0500
Content-Disposition: inline
In-Reply-To: <cover.1510246939.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, pali.rohar@gmail.com

On Thu, Nov 09, 2017 at 11:49:08AM -0600, Mario Limonciello wrote:
> Pali raised some concerns around corner case scenarios that probing
> may fail on dell-wmi-descriptor causing dell-wmi and dell-smbios-wmi
> to be stuck in infinite deferred probing loops.
> This patch series accounts for that corner case.

Queued, thanks Mario.

-- 
Darren Hart
VMware Open Source Technology Center
