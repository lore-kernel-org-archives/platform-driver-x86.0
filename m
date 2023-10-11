Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 364BCCD6E64
	for <platform-driver-x86@archiver.kernel.org>; Wed, 11 Oct 2023 12:41:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234887AbjJKMln (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 11 Oct 2023 08:41:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234829AbjJKMlm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 11 Oct 2023 08:41:42 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98A8AAF
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Oct 2023 05:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697028100; x=1728564100;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=CEoO4UgnjKgyfFdpVRzjx6GI0UUkXWEcf0lK/sSduRc=;
  b=e5rDD4tPXJ4ovLsfLTH821LHcrEeiiXZbyN9V53yF+6ddVnXzgtxYT9y
   x+Ja6mqV13SPcM6nRh0OwHPVeUG8cwg5GfyNvRC+Sl+b4zWtHP3OvKa5R
   bpeFTtH4WE1DPGbOCX/ag0RyQgTEgChcblUvicaY4OqIHppeZ+j2s23R3
   UiORhs4SfPebUPEy5DTC6FS2UMgX4eMl58c87LiQxb2VPH2ogyO07tkpb
   Jibg/jX2iOfCB3naL2s0V7skaWTgQIYE+fcw7DQJBsbmiNhYI0QcgVkE9
   IERo0OhgMTtqz/NIi+AM38RNN1pK4CQint8hWL0erjHPoAiFvjuqxbHTX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="381896268"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="381896268"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 05:41:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="824154818"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="824154818"
Received: from opipikin-mobl2.ger.corp.intel.com (HELO sdodaev-mobl.ger.corp.intel.com) ([10.252.57.154])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 05:41:38 -0700
Date:   Wed, 11 Oct 2023 15:41:36 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Nikita Kravets <teackot@gmail.com>
cc:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Aakash Singh <mail@singhaakash.dev>,
        Jose Angel Pastrana <japp0005@red.ujaen.es>
Subject: Re: [PATCH 2/5] platform/x86: msi-ec: Add fw version and release
 date attributes
In-Reply-To: <20231010172037.611063-7-teackot@gmail.com>
Message-ID: <974c5-8032-28e0-fd2f-9fbc9d413e4b@linux.intel.com>
References: <20231010172037.611063-3-teackot@gmail.com> <20231010172037.611063-7-teackot@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, 10 Oct 2023, Nikita Kravets wrote:

> Create a root attribute group and add the first platform device
> attributes: firmware version and firmware release date. Firmware
> version attribute uses an already present ec_get_firmware_version()
> function. Both features are present on all supported laptops.
> 
> Cc: Aakash Singh <mail@singhaakash.dev>
> Cc: Jose Angel Pastrana <japp0005@red.ujaen.es>
> Signed-off-by: Nikita Kravets <teackot@gmail.com>
> ---
>  drivers/platform/x86/msi-ec.c | 67 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 66 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
> index 12c559c9eac4..772b230fb47e 100644
> --- a/drivers/platform/x86/msi-ec.c
> +++ b/drivers/platform/x86/msi-ec.c
> @@ -818,17 +818,82 @@ static struct acpi_battery_hook battery_hook = {
>  	.name = MSI_EC_DRIVER_NAME,
>  };
>  
> +/*
> + * Sysfs platform device attributes
> + */
> +
> +static ssize_t fw_version_show(struct device *device,
> +			       struct device_attribute *attr, char *buf)
> +{
> +	u8 rdata[MSI_EC_FW_VERSION_LENGTH + 1];
> +	int result;
> +
> +	result = ec_get_firmware_version(rdata);
> +	if (result < 0)
> +		return result;
> +
> +	return sysfs_emit(buf, "%s\n", rdata);
> +}
> +
> +static ssize_t fw_release_date_show(struct device *device,
> +				    struct device_attribute *attr, char *buf)
> +{
> +	u8 rdate[MSI_EC_FW_DATE_LENGTH + 1];
> +	u8 rtime[MSI_EC_FW_TIME_LENGTH + 1];
> +	int result;
> +	int year, month, day, hour, minute, second;
> +
> +	memset(rdate, 0, MSI_EC_FW_DATE_LENGTH + 1);

sizeof(*rdate) is safer so please use it.

> +	result = ec_read_seq(MSI_EC_FW_DATE_ADDRESS,
> +			     rdate,
> +			     MSI_EC_FW_DATE_LENGTH);
> +	if (result < 0)
> +		return result;
> +
> +	result = sscanf(rdate, "%02d%02d%04d", &month, &day, &year);

There fields would naturally be %u and unsigned but see the other comment 
below before doing this change.

> +	if (result != 3)
> +		return -EINVAL;

EINVAL should be returned if the input was invalid but here the data 
itself is not okay so some other errno would be better.

> +	memset(rtime, 0, MSI_EC_FW_TIME_LENGTH + 1);

sizeof() like above.

> +	result = ec_read_seq(MSI_EC_FW_TIME_ADDRESS,
> +			     rtime,
> +			     MSI_EC_FW_TIME_LENGTH);
> +	if (result < 0)
> +		return result;
> +
> +	result = sscanf(rtime, "%02d:%02d:%02d", &hour, &minute, &second);
> +	if (result != 3)
> +		return -EINVAL;

Ditto.

> +
> +	return sysfs_emit(buf, "%04d/%02d/%02d %02d:%02d:%02d\n", year, month, day,
> +			  hour, minute, second);

It would be kind of nice to use %pt formatting here instead of custom
datetime format, however, it would either require converting to time64_t 
or using struct rtc_time. The latter would naturally have the right fields 
but they're not unsigned so my comment above about %u is not going to work 
well with it.

I'm also a bit unsure whether it's appropriate to use that struct outside 
of rtc realm. vsprintf.c seems to convert time64_t into rtc_time before 
printing though.

Hans, do you have any idea about the struct rtc_time?

> +}
> +
> +static DEVICE_ATTR_RO(fw_version);
> +static DEVICE_ATTR_RO(fw_release_date);
> +
> +static struct attribute *msi_root_attrs[] = {
> +	&dev_attr_fw_version.attr,
> +	&dev_attr_fw_release_date.attr,
> +	NULL
> +};
> +
> +static struct attribute_group msi_root_group = {
> +	.attrs = msi_root_attrs,
> +};
> +
>  /*
>   * Sysfs platform driver
>   */
>  
>  static int msi_platform_probe(struct platform_device *pdev)
>  {
> -	return 0;
> +	return sysfs_create_group(&pdev->dev.kobj, &msi_root_group);
>  }
>  
>  static int msi_platform_remove(struct platform_device *pdev)
>  {
> +	sysfs_remove_group(&pdev->dev.kobj, &msi_root_group);
>  	return 0;
>  }

Don't handle add/remove but put the attribute group pointer into the 
platform_driver.driver instead.

-- 
 i.

