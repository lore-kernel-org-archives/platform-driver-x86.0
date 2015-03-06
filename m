From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 0/3] toshiba_haps: Some misc changes plus sysfs entries
 documentation
Date: Fri, 6 Mar 2015 10:32:46 -0800
Message-ID: <20150306183246.GJ19001@vmdeb7>
References: <1424973511-3090-1-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:48207 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753979AbbCFScq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 6 Mar 2015 13:32:46 -0500
Content-Disposition: inline
In-Reply-To: <1424973511-3090-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Feb 26, 2015 at 10:58:29AM -0700, Azael Avalos wrote:
> These patches make some misc chanes to the driver, replacing sscanf with
> kstrtoint, DEVICE_ATTR_{RW, WO} macros and adding documentation about
> the sysfs entries.
> 
> Azael Avalos (3):
>   toshiba_haps: Replace sscanf with kstrtoint
>   toshiba_haps: Make use of DEVICE_ATTR_{RW, WO} macros
>   Documentation/ABI: Add file describing the sysfs entries for
>     toshiba_haps
> 
>  .../ABI/testing/sysfs-driver-toshiba_haps          | 20 ++++++++++++++
>  drivers/platform/x86/toshiba_haps.c                | 32 ++++++++++++++--------
>  2 files changed, 40 insertions(+), 12 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-toshiba_haps

Queued for 4.1, thanks Azael.

-- 
Darren Hart
Intel Open Source Technology Center
