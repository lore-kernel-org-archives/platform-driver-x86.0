From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] RFC: platform/x86: wmi: Fix check for method instance
 number
Date: Tue, 13 Jun 2017 09:49:51 -0700
Message-ID: <20170613164951.GI27850@fury>
References: <1495886134-8276-1-git-send-email-pali.rohar@gmail.com>
 <201706102115.57995@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:33774 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751802AbdFMQt6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Jun 2017 12:49:58 -0400
Content-Disposition: inline
In-Reply-To: <201706102115.57995@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Andy Shevchenko <andy@infradead.org>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Jun 10, 2017 at 09:15:57PM +0200, Pali Rohár wrote:
> On Saturday 27 May 2017 13:55:34 Pali Rohár wrote:
> > instance_count defines number of instances of data block and instance
> > itself is indexed from zero, which means first instance has number 0.
> > Therefore check for invalid instance should be non-strict inequality.
> > 
> > Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
> > ---
> > I'm marking this patch as RFC because it is not tested at all and
> > probably could break existing WMI drivers. Some WMI drivers pass
> > instance number 1 and I'm not sure if ACPI-WMI bytecode for those
> > machines has really two instances. In more cases ACPI-WMI bytecode
> > does not check instance number if supports only one instance. So
> > then any instance id can be used for correct execution of ACPI-WMI
> > method.
> > 
> > So this patch is open for discussion.
> 
> Hi! Any comments?

Hi Pali,

This change appears correct to me, but your comment about this parameter being
ignored by ACPI-WMI is definitely concerning. Since this doesn't address a
specific failure report, and it has the potential to break functional drivers, I
wouldn't want to merge it without some evidence that those drivers still work.

I'd suggest reaching out to the maintainers and contributors to the drivers you
mention to request some help in testing.

-- 
Darren Hart
VMware Open Source Technology Center
