From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 0/6] toshiba_acpi: Add new features plus some procfs
 ports
Date: Wed, 11 Feb 2015 20:52:18 -0800
Message-ID: <20150212045218.GB30527@fury.dvhart.com>
References: <1423627761-3415-1-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:45503 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753655AbbBLEwT (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 11 Feb 2015 23:52:19 -0500
Content-Disposition: inline
In-Reply-To: <1423627761-3415-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Feb 10, 2015 at 09:09:15PM -0700, Azael Avalos wrote:
> These patches add five new files to sysfs.
> 
> With the first two files we are paving the way to the (hopefully)
> future removal of the (now deprecated) proc entries. The remaining
> entries were not ported due to the fact that they duplicate existing
> kernel functionality (eg.: lcd <-> backlight, keys <-> input).
> 
> The rest add support for new features found on recent Toshiba laptops.
> 
> And the last one simply bump up the driver version.
> 
> Changes since v1:
> - Added a pr_info message informing the user that the laptop needs to
>   reboot

Thanks Azael, queued.

-- 
Darren Hart
Intel Open Source Technology Center
