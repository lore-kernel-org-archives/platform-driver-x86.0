From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 0/4] toshiba_acpi: Add support for USB Sleep functions
Date: Sun, 18 Jan 2015 11:07:23 -0800
Message-ID: <20150118190723.GH56582@vmdeb7>
References: <1421271621-8330-1-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:43785 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751442AbbARTHY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 18 Jan 2015 14:07:24 -0500
Content-Disposition: inline
In-Reply-To: <1421271621-8330-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jan 14, 2015 at 02:40:17PM -0700, Azael Avalos wrote:
> The following patches add support to several USB Sleep functions
> found on newer Toshiba laptops, allowing to use th USB ports while
> the laptop is asleep or turned off.
> 
> Azael Avalos (4):
>   toshiba_acpi: Add support for USB Sleep and Charge function
>   toshiba_acpi: Add support for USB Sleep functions under battery
>   toshiba_acpi: Add support for USB Rapid Charge
>   toshiba_acpi: Add support for USB Sleep and Music
> 
>  drivers/platform/x86/toshiba_acpi.c | 449 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 449 insertions(+)

Hi Azael,

Ignore my comments on input validation and error codes, you cover the former,
and the latter keeps the driver internally consistent. That only leaves the
Disable/Auto/Alternate values and a couple trivial formatting and typos to
address.

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
