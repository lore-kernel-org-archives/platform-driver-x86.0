From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] intel_menlow: avoid null pointer deference error
Date: Thu, 28 Mar 2013 09:44:03 -0700
Message-ID: <4118816.bYb2imlfi9@dtor-d630.eng.vmware.com>
References: <1364394585-20191-1-git-send-email-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-da0-f53.google.com ([209.85.210.53]:49610 "EHLO
	mail-da0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755844Ab3C1QoH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 28 Mar 2013 12:44:07 -0400
Received: by mail-da0-f53.google.com with SMTP id n34so3468754dal.40
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Mar 2013 09:44:07 -0700 (PDT)
In-Reply-To: <1364394585-20191-1-git-send-email-colin.king@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Colin King <colin.king@canonical.com>
Cc: Sujith Thomas <sujith.thomas@intel.com>, Matthew Garrett <matthew.garrett@nebula.com>, platform-driver-x86@vger.kernel.org

On Wednesday, March 27, 2013 02:29:45 PM Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Fix a null pointer deference by acpi_driver_data() if device is
> null.  We should only set cdev and check this is OK after we are
> sure device is not null.
> 
> Smatch analysis:
> drivers/platform/x86/intel_menlow.c:207 intel_menlow_memory_remove()
>   warn: variable dereferenced before check 'device' (see line 205)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/platform/x86/intel_menlow.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_menlow.c
> b/drivers/platform/x86/intel_menlow.c index d6cfc15..42691c6 100644
> --- a/drivers/platform/x86/intel_menlow.c
> +++ b/drivers/platform/x86/intel_menlow.c
> @@ -202,9 +202,13 @@ static int intel_menlow_memory_add(struct acpi_device
> *device)
> 
>  static int intel_menlow_memory_remove(struct acpi_device *device)
>  {
> -	struct thermal_cooling_device *cdev = acpi_driver_data(device);
> +	struct thermal_cooling_device *cdev;
> +
> +	if (!device)
> +		return -EINVAL;

How can 'device' be NULL here? And I am pretty sure that 'cdev' is also
always not NULL if ACPI device is properly bound to this driver, so the
proper fix would be to remove the check altogether.

> 
> -	if (!device || !cdev)
> +	cdev = acpi_driver_data(device);
> +	if (!cdev)
>  		return -EINVAL;
> 
>  	sysfs_remove_link(&device->dev.kobj, "thermal_cooling");

Thanks.

-- 
Dmitry
