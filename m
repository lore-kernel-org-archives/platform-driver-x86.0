From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 0/5] alienware-wmi new platform and feature support
Date: Tue, 2 Feb 2016 09:39:27 -0800
Message-ID: <20160202173927.GE1779@malice.jf.intel.com>
References: <1454380131-24662-1-git-send-email-mario_limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:57536 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756702AbcBBRj3 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 2 Feb 2016 12:39:29 -0500
Content-Disposition: inline
In-Reply-To: <1454380131-24662-1-git-send-email-mario_limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario_limonciello@dell.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

On Mon, Feb 01, 2016 at 08:28:46PM -0600, Mario Limonciello wrote:
> I've got some extensions for the alienware-wmi driver that have
> been introduced for a few new platforms and can be controlled via the WMI
> interface.
> 
> Changes from V1:
>  - Make sure whitespace changes are in their own patch
>  - Add commit descriptions to all patches
>  - Allow one line to go over 80 characters in deep sleep control patch
>    Other patches may have some areas that avoid going over 80 characters
>    still, but this matches the style of the existing driver.  If you would
>    like these to go over 80 characters as well, please comment which areas
>    this is OK.

This made it much easier to review. Thank you Mario. A few changes requested,
and a couple questions for you regarding intent/best-practice.

Thanks!

-- 
Darren Hart
Intel Open Source Technology Center
