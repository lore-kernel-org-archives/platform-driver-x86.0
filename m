From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v3 0/6] alienware-wmi: new platform and feature support
Date: Sun, 7 Feb 2016 12:05:06 -0800
Message-ID: <20160207200506.GG1779@malice.jf.intel.com>
References: <1454449137-16478-1-git-send-email-mario_limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:41816 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750997AbcBGUFH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 7 Feb 2016 15:05:07 -0500
Content-Disposition: inline
In-Reply-To: <1454449137-16478-1-git-send-email-mario_limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario_limonciello@dell.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

On Tue, Feb 02, 2016 at 03:38:51PM -0600, Mario Limonciello wrote:
> I've got some extensions for the alienware-wmi driver that have
> been introduced for a few new platforms and can be controlled via the WMI
> interface.

Thanks Mario, and apologies for the delay. This appears functionally correct at
each patch. There were still a couple minor line wrapping and comment block
formatting issues, but given the time delay, I just took care of those myself
and annotated it in the commit messages. These are now queued to testing.

If you would like to verify my changes, they are available in the testing branch
of my tree.

-- 
Darren Hart
Intel Open Source Technology Center
