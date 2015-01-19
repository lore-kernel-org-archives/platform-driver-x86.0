From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 0/4] toshiba_acpi: Add support for USB Sleep functions
Date: Mon, 19 Jan 2015 14:46:28 -0800
Message-ID: <20150119224628.GA100830@vmdeb7>
References: <1421631025-27895-1-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:58032 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751595AbbASWq3 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 19 Jan 2015 17:46:29 -0500
Content-Disposition: inline
In-Reply-To: <1421631025-27895-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Jan 18, 2015 at 06:30:21PM -0700, Azael Avalos wrote:
> The following patches add support to several USB Sleep functions
> found on newer Toshiba laptops, allowing to use the USB ports while
> the laptop is asleep or turned off.
> 
> Changes since v1:
> - Changed accepted parameters on first patch and added a short
>   description of what the auto and alternate charging modes mean
> - Some misc format and typo changes
> 
> Azael Avalos (4):
>   toshiba_acpi: Add support for USB Sleep and Charge function
>   toshiba_acpi: Add support for USB Sleep functions under battery
>   toshiba_acpi: Add support for USB Rapid Charge
>   toshiba_acpi: Add support for USB Sleep and Music
> 
>  drivers/platform/x86/toshiba_acpi.c | 455 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 455 insertions(+)

Queued for 3.20, thanks Azael.

-- 
Darren Hart
Intel Open Source Technology Center
