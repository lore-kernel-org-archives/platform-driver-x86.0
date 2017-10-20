From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v10 13/15] platform/x86: wmi: create userspace
        interface for drivers
Date: Fri, 20 Oct 2017 17:08:50 +0200
Message-ID: <20171020150850.GA4770@lst.de>
References: <cover.1508434513.git.mario.limonciello@dell.com> <175838453318108ae69be344c4d3a2b75c2edc69.1508434514.git.mario.limonciello@dell.com> <20171020132138.GA23973@kroah.com> <19e30ca305e449de86b702ae8900d306@ausx13mpc120.AMER.DELL.COM> <20171020144839.GA4550@lst.de> <c9ceac21e74b4b37b8393ab76bb2238f@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:49396 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751694AbdJTPIv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 20 Oct 2017 11:08:51 -0400
Content-Disposition: inline
In-Reply-To: <c9ceac21e74b4b37b8393ab76bb2238f@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: hch@lst.de, greg@kroah.com, dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, gnomes@lxorguk.ukuu.org.uk

On Fri, Oct 20, 2017 at 03:07:27PM +0000, Mario.Limonciello@dell.com wrote:
> No drivers do this today, it's obviously not a good idea.
> I was just saying it's hypothetical.

If there is no one using the exported methods don't export them.
