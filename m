From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v3 0/3] toshiba_acpi: Accelerometer updates
Date: Mon, 27 Jun 2016 21:29:25 -0700
Message-ID: <20160628042925.GB3837@f23x64.localdomain>
References: <20160628014644.8417-1-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:42168 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750704AbcF1E31 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 28 Jun 2016 00:29:27 -0400
Content-Disposition: inline
In-Reply-To: <20160628014644.8417-1-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>

On Mon, Jun 27, 2016 at 07:46:42PM -0600, Azael Avalos wrote:
> These series of patches update the accelerometer axis data
> reporting to use the IIO subsystem, deprecating the custom
> position sysfs entry, and finally bumping the driver version
> to 0.24.
> 

Thanks Azael, queued to testing for 4.8.

Jonathan, I took the full set.

> Changes since v2:
> - Small format and style changes once again
> - Renamed toshiba_accel* functions to toshiba_iio_accel* to
>   differentiate from the iio functions and the toshiba_acpi
>   driver fuctions
> - Print error messages instead of bailing out in case the
>   iio_device* functions fail, this is to allow the driver
>   to continue loading its many functions
> 
> Changes since v1:
> - Small format and style changes
> - Changed the iio code according to feedback from Jonathan Cameron
> 
> Azael Avalos (3):
>   toshiba_acpi: Add IIO interface for accelerometer axis data
>   toshiba_acpi: Remove the position sysfs entry
>   toshiba_acpi: Bump driver version and update copyright year
> 
>  drivers/platform/x86/toshiba_acpi.c | 136 +++++++++++++++++++++++++++++-------
>  1 file changed, 109 insertions(+), 27 deletions(-)
> 
> -- 
> 2.8.4
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
