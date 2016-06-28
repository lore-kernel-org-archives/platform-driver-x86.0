From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] hp-wmi: fix wifi cannot be hard-unblock
Date: Tue, 28 Jun 2016 09:04:39 -0700
Message-ID: <20160628160439.GD3837@f23x64.localdomain>
References: <1465818240-11994-1-git-send-email-alex.hung@canonical.com>
 <57726047.6070209@yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:52713 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752058AbcF1QFa (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 28 Jun 2016 12:05:30 -0400
Content-Disposition: inline
In-Reply-To: <57726047.6070209@yandex.ru>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Evgenii Shatokhin <eugene.shatokhin@yandex.ru>
Cc: Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org, david.ward@ll.mit.edu

On Tue, Jun 28, 2016 at 02:32:23PM +0300, Evgenii Shatokhin wrote:
> On 13.06.2016 14:44, Alex Hung wrote:
> > Several users reported wifi cannot be unblocked as discussed in [1].
> > This patch removes the useof 2009 flag by BIOS but uses the actual WMI
> > function calls - it will be skipped if WMI reports unsupported
> > 
> > [1] https://bugzilla.kernel.org/show_bug.cgi?id=69131
> > 
> > Signed-off-by: Alex Hung <alex.hung@canonical.com>

Thank you Alex, and thanks Evgenii for the testing. Queued to testing for 4.8,
tagged for stable.

-- 
Darren Hart
Intel Open Source Technology Center
