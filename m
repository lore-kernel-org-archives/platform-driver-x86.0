From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 0/3] toshiba_acpi: Add support for Cooling Method
Date: Sun, 7 Feb 2016 12:24:36 -0800
Message-ID: <20160207202436.GI1779@malice.jf.intel.com>
References: <1453746551-17496-1-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:43679 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750997AbcBGUYg (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 7 Feb 2016 15:24:36 -0500
Content-Disposition: inline
In-Reply-To: <1453746551-17496-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jan 25, 2016 at 11:29:09AM -0700, Azael Avalos wrote:
> These patches add support for the Cooling Method feature found in most
> Toshiba laptops, allowing userspace to control the desired cooling method,
> which are the following:
> 0 - Maximum Performance
> 1 - Peformance
> 2 - Battery Optimized
> 
> The Cooling Method feature basically controls the speed of the system fan,
> setting the speed (and quietness) according to the selected method.
> 
> The default value at every boot is zero (Maximum Performance), on Windows,
> Toshiba provides hooks to the power management system, allowing
> the user to change it according to their needs and/or the AC adapter state.
> 
> 
> Azael Avalos (3):
>   toshiba_acpi: Add support for cooling method feature
>   toshiba_acpi: Add sysfs entries for th Cooling Method feature
>   Documentation/ABI: Update sysfs-driver-toshiba_acpi file

Queued to testing, thank you Azael.

-- 
Darren Hart
Intel Open Source Technology Center
