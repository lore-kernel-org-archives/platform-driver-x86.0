Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B6D6CD6E66
	for <platform-driver-x86@archiver.kernel.org>; Wed, 11 Oct 2023 12:49:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231262AbjJKMtn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 11 Oct 2023 08:49:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231404AbjJKMtn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 11 Oct 2023 08:49:43 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFB0693
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Oct 2023 05:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697028580; x=1728564580;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=DD/sWXDyv8W/QlwPZNnMT+ABWkDwvYqZWtXuYmINj6w=;
  b=BVM3u9UC3Ye246e0Myfh8HqTaS8ONt2d7gEGScBE8CmXn5k2hmG8zc+w
   1OGHKFq8QDiv/qKiNd+3+NyU5Crrzb0MiOWpNfYTNYPZyVJZ8CsMwXDl6
   SQW+KDIRGJg41vzee9mk3RY1fCGeXuG2cn75kJbog0Q2RnRc18gE5agyA
   wZKU74Ll/C04REt9ofUcZty0HOzLfdkIqEWHyS/qMQJS/u3bxOumaB3v9
   KgH9XokUzCoZz9sR6oklVuPSJyRdlpXsA9InEsTP3cam1lF5RgoEMO9aN
   GTUtmXjX2UB9aDIGd6IZSCdL6rseGi+oCjVH6+j7qw62oLMto3sFowPoy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="383516460"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="383516460"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 05:49:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="730481960"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="730481960"
Received: from opipikin-mobl2.ger.corp.intel.com (HELO sdodaev-mobl.ger.corp.intel.com) ([10.252.57.154])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 05:49:32 -0700
Date:   Wed, 11 Oct 2023 15:49:30 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Nikita Kravets <teackot@gmail.com>
cc:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Aakash Singh <mail@singhaakash.dev>,
        Jose Angel Pastrana <japp0005@red.ujaen.es>
Subject: Re: [PATCH 5/5] platform/x86: msi-ec: Add a cooler boost attribute
In-Reply-To: <20231010172037.611063-13-teackot@gmail.com>
Message-ID: <2877c598-9320-5385-6998-466a8f2b36d5@linux.intel.com>
References: <20231010172037.611063-3-teackot@gmail.com> <20231010172037.611063-13-teackot@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, 10 Oct 2023, Nikita Kravets wrote:

> Cooler boost increases the fan speed to improve the laptop cooling.
> This is a simple on/off feature that is easy to test: if it works
> you'll hear the fans spinning much faster. So far all supported models
> have this feature represented by a single bit at the 0x98 EC address.
> The attribute makes use of the previously added bit operation functions.
> 
> Cc: Aakash Singh <mail@singhaakash.dev>
> Cc: Jose Angel Pastrana <japp0005@red.ujaen.es>
> Signed-off-by: Nikita Kravets <teackot@gmail.com>
> ---
>  drivers/platform/x86/msi-ec.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
> index ae73dcf01d09..f4e770b3dda1 100644
> --- a/drivers/platform/x86/msi-ec.c
> +++ b/drivers/platform/x86/msi-ec.c
> @@ -26,6 +26,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/seq_file.h>
>  #include <linux/string.h>
> +#include <linux/kstrtox.h>
>  
>  #define SM_ECO_NAME		"eco"
>  #define SM_COMFORT_NAME		"comfort"
> @@ -850,6 +851,35 @@ static struct acpi_battery_hook battery_hook = {
>   * Sysfs platform device attributes
>   */
>  
> +static ssize_t cooler_boost_show(struct device *device,
> +				 struct device_attribute *attr, char *buf)
> +{
> +	int result;
> +	bool value;
> +
> +	result = ec_check_bit(conf.cooler_boost.address, conf.cooler_boost.bit, &value);

Missing error handling.

> +	return sysfs_emit(buf, "%s\n", value ? "on" : "off");

str_on_off() from linux/string_choices.h.

> +}
> +
> +static ssize_t cooler_boost_store(struct device *dev,
> +				  struct device_attribute *attr,
> +				  const char *buf, size_t count)
> +{
> +	int result;
> +	bool value;
> +
> +	result = kstrtobool(buf, &value);
> +	if (result)
> +		return result;
> +
> +	result = ec_set_bit(conf.cooler_boost.address, conf.cooler_boost.bit, value);
> +	if (result < 0)
> +		return result;
> +
> +	return count;
> +}
> +
>  static ssize_t fw_version_show(struct device *device,
>  			       struct device_attribute *attr, char *buf)
>  {
> @@ -897,6 +927,7 @@ static ssize_t fw_release_date_show(struct device *device,
>  			  hour, minute, second);
>  }
>  
> +static DEVICE_ATTR_RW(cooler_boost);
>  static DEVICE_ATTR_RO(fw_version);
>  static DEVICE_ATTR_RO(fw_release_date);
>  
> @@ -922,6 +953,10 @@ static void filter_attributes(struct attribute_support *attributes,
>  static int msi_platform_probe(struct platform_device *pdev)
>  {
>  	struct attribute_support root_attrs_support[] = {
> +		{
> +			&dev_attr_cooler_boost.attr,
> +			conf.cooler_boost.address != MSI_EC_ADDR_UNSUPP,
> +		},
>  		{
>  			&dev_attr_fw_version.attr,
>  			true,
> 

-- 
 i.

