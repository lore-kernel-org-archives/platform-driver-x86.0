Return-Path: <SRS0=nDDs=C2=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F681C433E2
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 11:39:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DDBBA21D7F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 11:39:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hfpeqj0a"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbgIQLjl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Sep 2020 07:39:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29936 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726899AbgIQLj0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Sep 2020 07:39:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600342760;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=swUloeU1Hk/iMWefaHKkfsnrPNSH9XZbVlVEZlISsFM=;
        b=Hfpeqj0a/RQsduFrsOSO85GyMcTydheb3/iFAOZ0xxkt1//4Io8ohYn22JB3k2Kgh1YGH5
        EORw2ifIkXYtr6N0vfgA+yUG9P02xPf+aXxnylz7F9PA68gu9sF4rmelIwfeCqYmesz30m
        VKt2Bv1UgGFQLq7RZDc5pCJbhHGBQU8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-8uCJcLdmNtqmdkU6Avx5Lg-1; Thu, 17 Sep 2020 07:39:16 -0400
X-MC-Unique: 8uCJcLdmNtqmdkU6Avx5Lg-1
Received: by mail-ed1-f71.google.com with SMTP id b12so782185edw.15
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Sep 2020 04:39:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=swUloeU1Hk/iMWefaHKkfsnrPNSH9XZbVlVEZlISsFM=;
        b=UaIONGVP86Q0r3bFzrET+vYEX7iVaK0dTrSA/nmQBD3b5OjTKG/qgXcp0HXoW6/fX+
         qjmJSfmTOz7gdNToWgHFT4OX+B9x4QigAJEwEaoZUQnI7eA2c1X3ehYPxgmp1fXDeHis
         dLCPY7sFp4aExs+ndT8JFvLAbqCFva2AcLBZaL8t8GEteVPCzzZceGGyv5UeOsd/EfYv
         mDTL/IkaxEfkldCextMT9CNIQJOktAAZVW1GqNl9scWUn7quXLeCzQWETUKI76A/DILW
         t9MBiY/fIpEBpPBC2SRuJZT3W/QKeSOG1Mx3B2SapTRcRlvXc7EgvG25GL/XRK2Z+TMo
         Vubg==
X-Gm-Message-State: AOAM530yqCyWGnLwP58gOQYeMQrvcMtFT4JljA99OdDmerFiET866taP
        GkDfOZzTu+aepQd7PqgHtoHG1VP7lxcHe64b6zP+6PJpNeGRknhsA3tmkTJE1v/CPtE/hIW1GEC
        FfulBLnaKy/hmgcnKZ0wQwlDs9t6ZS4CALw==
X-Received: by 2002:a17:906:9491:: with SMTP id t17mr29509694ejx.227.1600342754986;
        Thu, 17 Sep 2020 04:39:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpC+UQ7xJx7XkSR/xjfQP525TULZtyEoIAHeY3WENUuP7iiTK5EgzAHkahceQQAxYA7x5EEQ==
X-Received: by 2002:a17:906:9491:: with SMTP id t17mr29509667ejx.227.1600342754588;
        Thu, 17 Sep 2020 04:39:14 -0700 (PDT)
Received: from x1.localdomain ([2a0e:5700:4:11:334c:7e36:8d57:40cb])
        by smtp.gmail.com with ESMTPSA id os15sm14881605ejb.61.2020.09.17.04.39.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2020 04:39:13 -0700 (PDT)
Subject: Re: [PATCH v2] platform/x86: thinkpad_acpi: performance mode
 interface
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, ibm-acpi@hmh.eng.br,
        bnocera@redhat.com, mario.limonciello@dell.com,
        Nitin Joshi <njoshi1@lenovo.com>,
        Jared Dominguez <jaredz@redhat.com>
References: <markpearson@lenovo.com>
 <20200821175310.335873-1-markpearson@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <56b9e961-5dd8-8ac1-fa5a-3fb0b222b2e8@redhat.com>
Date:   Thu, 17 Sep 2020 13:39:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200821175310.335873-1-markpearson@lenovo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/21/20 7:53 PM, Mark Pearson wrote:
> Lenovo Thinkpad platforms with DYTC version 5 and newer have enhanced
> firmware to provide different performance/thermal modes.
> 
> The modes can be controlled by hotkeys (FN+H, FN+M, FN+L) to switch
> the operating mode between three different modes.
> 
> H - High performance. Maximum power is available and the temperature is
> allowed to increase to the maximum for the platform.
> M - Medium performance (aka balance). In this mode power will be limited
> and the laptop will have a lower maximum temperature.
> L - Low performance (aka quiet). In this mode power consumption is reduced
> and the device will be cooler.
> 
> High performance mode is only available when the device is in 'desk mode'.
> If the device detects that it is on a lap then it will automatically drop
> into medium mode to maintain a safer operating temperature.
> 
> This patch provides an interface to determine the current mode and to also
> allow the setting of the mode through the dytc_perfmode sysfs entry. This
> can be used by userspace for improved control.
> 
> Reviewed-by: Nitin Joshi <njoshi1@lenovo.com>
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
> ---
> Changes in v2:
>   - Add userspace notification to hkey event handler. Note this got
>     somewhat more complicated than expected as retrieving the performance
>     mode when in lapmode generates an event itself; added a flag to
>     ignore these known events.
>   - Updated the values returned to be simpler (H/M*/M/L) as suggested.
>   - Added ABI documentation as requested. Lap and palm sensor details
>     added whilst I was doing this.
>   - Cleaned up code based on recommendations as well as feedback received
>     from other patch reviews.
>   - Based on discussion with firmware team the lapmode sensor should only
>     be made available for DYTC v5 and later. Added this to init logic.
> 
>   .../sysfs-devices-platform-thinkpad_acpi      |  34 +++
>   .../admin-guide/laptops/thinkpad-acpi.rst     |  35 +++
>   drivers/platform/x86/thinkpad_acpi.c          | 267 ++++++++++++++++--
>   3 files changed, 310 insertions(+), 26 deletions(-)
>   create mode 100644 Documentation/ABI/testing/sysfs-devices-platform-thinkpad_acpi
> 
> diff --git a/Documentation/ABI/testing/sysfs-devices-platform-thinkpad_acpi b/Documentation/ABI/testing/sysfs-devices-platform-thinkpad_acpi
> new file mode 100644
> index 000000000000..28f07753a889
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-devices-platform-thinkpad_acpi
> @@ -0,0 +1,34 @@
> +What:		/sys/devices/platform/thinkpad_acpi/dytc_perfmode
> +Date:		August 2020
> +Contact:	Mark Pearson <markpearson@lenovo.com>
> +Description:
> +		Reads return the current performance mode setting configured in firmware using
> +		the below nomenclature.
> +
> +		Writes configure the performance mode setting by using the below nomenclature.
> +
> +		H  - High performance mode. Maximum power and temperature available.
> +		M* - High performance mode but performance is limited to medium as system is
> +		     in lapmode. Power and temperature maximums reduced to a safe threshold.
> +		M  - Medium performance mode (aka 'balance'). Lower maximum power and temperatures
> +		     but better battery life.
> +		L  - Low performance mode (aka 'quiet'). Reduced power setting gives lower
> +		     temperatures and extended battery life. Fans run quieter.
> +
> +What:		/sys/devices/platform/thinkpad_acpi/dytc_lapmode
> +Date:		August 2020
> +Contact:	Mark Pearson <markpearson@lenovo.com>
> +Description:
> +		Reads returns the current value of the lapmode sensor.
> +
> +		0 - desk mode is detected
> +		1 - lap mode is detected
> +
> +What:		/sys/devices/platform/thinkpad_acpi/psensor_state
> +Date:		August 2020
> +Contact:	Nitin Joshi <njoshi1@lenovo.com>
> +Description:
> +		Reads returns the current value of the palm sensor.
> +
> +		0 - palm not detected
> +		1 - palm detected
> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> index 6b57c52d8f13..b98f0de9e063 100644
> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> @@ -52,6 +52,7 @@ detailed description):
>   	- LCD Shadow (PrivacyGuard) enable and disable
>   	- Lap mode sensor
>           - Palm sensor (aka psensor)
> +	- Thermal mode status and control
>   
>   A compatibility table by model and feature is maintained on the web
>   site, http://ibm-acpi.sf.net/. I appreciate any success or failure
> @@ -1465,6 +1466,40 @@ Note - some platforms have a limitation whereby the EC firmware cannot
>   determine if the sensor is installed or not. On these platforms the psensor
>   state will always be reported as true to avoid high power being used incorrectly.
>   
> +DYTC Thermal mode status and control
> +------------------------------------
> +
> +sysfs: dytc_perfmode
> +
> +Lenovo Thinkpad platforms with DYTC version 5 and newer have enhanced firmware to
> +provide improved performance control.
> +
> +The firmware can be controlled by hotkeys (FN+H, FN+M, FN+L) to switch the
> +operating mode between three different modes. This sysfs node provides a better
> +interface for user space to use.
> +
> +The modes available are:
> +
> +H - High performance. Maximum power is available and the temperature is
> +allowed to increase to the maximum for the platform.
> +
> +M - Medium performance (aka balance). In this mode power will be limited and
> +the laptop will remain cooler.
> +
> +L - Low performance (aka quiet). In this mode power consumption is reduced and
> +the device will be cooler and quieter.
> +
> +Note: High performance mode is only available when the device is in 'deskmode'. If
> +the device detects that it is on a lap then it will automatically drop into medium
> +mode to maintain a safer operating temperature.
> +
> +The sysfs entry provides the ability to return the current status and to set the
> +desired mode. For example::
> +
> +        echo H > /sys/devices/platform/thinkpad_acpi/dytc_perfmode
> +        echo M > /sys/devices/platform/thinkpad_acpi/dytc_perfmode
> +        echo L > /sys/devices/platform/thinkpad_acpi/dytc_perfmode
> +


So we recently had another driver show up with almost the same interface / thing:

https://patchwork.kernel.org/patch/11774509/

So I believe that we really should come up with a standardize sysfs interface
for this under /sys/class/<some-name>

Please see the "RFC: offering a standardized (/sys/class) userspace API for selecting
system/laptop performance-profiles" mail thread which I just started.

Note I've not looked at the rest of this patch at all yet. But this patch should
not be merged until the userspace API question is settled so nack to this patch
for now (sorry).

Mark, once we have an agreement on what the userspace API for this should
look like I can implement a small helper-library / class-core for registering
the class device for this, modify this patch to use that and test it on a X1C8.

Or if you prefer you can do this yourself. Please let me know how you want to
proceed with this.

Regards,

Hans



>   EXPERIMENTAL: UWB
>   -----------------
>   
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 41b75dd4755c..8fcb660aa5a2 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -9817,18 +9817,43 @@ static struct ibm_struct lcdshadow_driver_data = {
>   };
>   
>   /*************************************************************************
> - * DYTC subdriver, for the Lenovo lapmode feature
> + * DYTC subdriver, for the Lenovo lap and performance mode feature
>    */
>   
> +#define DYTC_CMD_QUERY        0 /* To get DYTC status - enable/revision */
> +#define DYTC_CMD_SET          1 /* To enable/disable IC function mode */
>   #define DYTC_CMD_GET          2 /* To get current IC function and mode */
> -#define DYTC_GET_LAPMODE_BIT 17 /* Set when in lapmode */
> +#define DYTC_CMD_RESET    0x1ff /* To reset back to default */
>   
> -static bool dytc_lapmode;
> +#define DYTC_QUERY_ENABLE_BIT 8  /* Bit 8 - 0 = disabled, 1 = enabled */
> +#define DYTC_QUERY_SUBREV_BIT 16 /* Bits 16 - 27 - sub revisision */
> +#define DYTC_QUERY_REV_BIT    28 /* Bits 28 - 31 - revision */
>   
> -static void dytc_lapmode_notify_change(void)
> -{
> -	sysfs_notify(&tpacpi_pdev->dev.kobj, NULL, "dytc_lapmode");
> -}
> +#define DYTC_GET_FUNCTION_BIT 8  /* Bits 8-11 - function setting */
> +#define DYTC_GET_MODE_BIT     12 /* Bits 12-15 - mode setting */
> +#define DYTC_GET_LAPMODE_BIT  17 /* Bit 17 - lapmode. Set when on lap */
> +
> +#define DYTC_SET_FUNCTION_BIT 12 /* Bits 12-15 - funct setting */
> +#define DYTC_SET_MODE_BIT     16 /* Bits 16-19 - mode setting */
> +#define DYTC_SET_VALID_BIT    20 /* Bit 20 - 1 = on, 0 = off */
> +
> +#define DYTC_FUNCTION_STD     0  /* Function = 0, standard mode */
> +#define DYTC_FUNCTION_CQL     1  /* Function = 1, lap mode */
> +#define DYTC_FUNCTION_MMC     11 /* Function = 11, desk mode */
> +
> +#define DYTC_MODE_PERFORM     2  /* High power mode aka performance */
> +#define DYTC_MODE_QUIET       3  /* low power mode aka quiet */
> +#define DYTC_MODE_BALANCE   0xF  /* default mode aka balance */
> +
> +#define DYTC_DISABLE_CQL ((DYTC_MODE_BALANCE << DYTC_SET_MODE_BIT) | \
> +		(DYTC_FUNCTION_CQL << DYTC_SET_FUNCTION_BIT) | \
> +		DYTC_CMD_SET)
> +#define DYTC_ENABLE_CQL (DYTC_DISABLE_CQL | (1 << DYTC_SET_VALID_BIT))
> +
> +static bool dytc_lapmode;
> +static int  dytc_perfmode;
> +static bool dytc_available;
> +static bool dytc_ignore_next_event;
>   
>   static int dytc_command(int command, int *output)
>   {
> @@ -9843,6 +9868,87 @@ static int dytc_command(int command, int *output)
>   	return 0;
>   }
>   
> +static int dytc_perfmode_get(int *perfmode, int *funcmode)
> +{
> +	int output, err;
> +
> +	if (!dytc_available)
> +		return -ENODEV;
> +
> +	err = dytc_command(DYTC_CMD_GET, &output);
> +	if (err)
> +		return err;
> +	*funcmode = (output >> DYTC_GET_FUNCTION_BIT) & 0xF;
> +
> +	if (*funcmode == DYTC_FUNCTION_CQL) {
> +		int dummy;
> +		/*
> +		 * We can't get the mode when in CQL mode - so we disable CQL
> +		 * mode retrieve the mode and then enable it again.
> +		 * As disabling/enabling CQL triggers an event we set a flag to
> +		 * ignore these events. This will be cleared by the event handler
> +		 */
> +		dytc_ignore_next_event = true;
> +		err = dytc_command(DYTC_DISABLE_CQL, &dummy);
> +		if (err)
> +			return err;
> +		err = dytc_command(DYTC_CMD_GET, &output);
> +		if (err)
> +			return err;
> +		/* Again ignore this event */
> +		dytc_ignore_next_event = true;
> +		err = dytc_command(DYTC_ENABLE_CQL, &dummy);
> +		if (err)
> +			return err;
> +	}
> +	*perfmode = (output >> DYTC_GET_MODE_BIT) & 0xF;
> +	return 0;
> +}
> +
> +static int dytc_perfmode_set(int perfmode)
> +{
> +	int err, dytc_set;
> +	int output;
> +	int cur_perfmode, cur_funcmode;
> +
> +	if (!dytc_available)
> +		return -ENODEV;
> +
> +	if (perfmode == DYTC_MODE_BALANCE) {
> +		/* To get back to balance mode we just issue a reset command */
> +		err = dytc_command(DYTC_CMD_RESET, &output);
> +		if (err)
> +			return err;
> +	} else {
> +		/* Determine if we are in CQL mode. This alters the commands we do */
> +		err = dytc_perfmode_get(&cur_perfmode, &cur_funcmode);
> +		if (err)
> +			return err;
> +
> +		if (cur_funcmode == DYTC_FUNCTION_CQL) {
> +			/* To set the mode we need to disable CQL first*/
> +			dytc_ignore_next_event = true; /*ignore event*/
> +			err = dytc_command(DYTC_DISABLE_CQL, &output);
> +			if (err)
> +				return err;
> +		}
> +		dytc_set = (1 << DYTC_SET_VALID_BIT) |
> +			(DYTC_FUNCTION_MMC << DYTC_SET_FUNCTION_BIT) |
> +			(perfmode << DYTC_SET_MODE_BIT) |
> +			DYTC_CMD_SET;
> +		err = dytc_command(dytc_set, &output);
> +		if (err)
> +			return err;
> +		if (cur_funcmode == DYTC_FUNCTION_CQL) {
> +			dytc_ignore_next_event = true; /*ignore event*/
> +			err = dytc_command(DYTC_ENABLE_CQL, &output);
> +			if (err)
> +				return err;
> +		}
> +	}
> +	return 0;
> +}
> +
>   static int dytc_lapmode_get(bool *state)
>   {
>   	int output, err;
> @@ -9854,45 +9960,130 @@ static int dytc_lapmode_get(bool *state)
>   	return 0;
>   }
>   
> -static void dytc_lapmode_refresh(void)
> +static void dytc_refresh(void)
>   {
> -	bool new_state;
> +	bool lapmode;
> +	int perfmode, funcmode;
>   	int err;
>   
> -	err = dytc_lapmode_get(&new_state);
> -	if (err || (new_state == dytc_lapmode))
> +	err = dytc_lapmode_get(&lapmode);
> +	if (err)
> +		return;
> +	if (dytc_ignore_next_event) {
> +		dytc_ignore_next_event = false; /*clear setting*/
>   		return;
> +	}
> +	if (lapmode != dytc_lapmode) {
> +		dytc_lapmode = lapmode;
> +		sysfs_notify(&tpacpi_pdev->dev.kobj, NULL, "dytc_lapmode");
> +	}
> +	err = dytc_perfmode_get(&perfmode, &funcmode);
> +	if (err)
> +		return;
> +	if (perfmode != dytc_perfmode) {
> +		dytc_perfmode = perfmode;
> +		sysfs_notify(&tpacpi_pdev->dev.kobj, NULL, "dytc_perfmode");
> +	}
> +}
> +
> +/* sysfs perfmode entry */
> +static ssize_t dytc_perfmode_show(struct device *dev,
> +				  struct device_attribute *attr,
> +				  char *buf)
> +{
> +	int err;
> +	int perfmode, funcmode;
> +
> +	err = dytc_perfmode_get(&perfmode, &funcmode);
> +	if (err)
> +		return err;
>   
> -	dytc_lapmode = new_state;
> -	dytc_lapmode_notify_change();
> +	switch (perfmode) {
> +	case DYTC_MODE_PERFORM:
> +		/* High performance is only available in deskmode */
> +		if (funcmode == DYTC_FUNCTION_CQL)
> +			return sprintf(buf, "M*\n");
> +		else
> +			return sprintf(buf, "H\n");
> +	case DYTC_MODE_QUIET:
> +		return sprintf(buf, "L\n");
> +	case DYTC_MODE_BALANCE:
> +		return sprintf(buf, "M\n");
> +	default:
> +		return sprintf(buf, "Unknown (%d)\n", perfmode);
> +	}
>   }
>   
> +static ssize_t dytc_perfmode_store(struct device *dev,
> +				   struct device_attribute *attr,
> +				   const char *buf, size_t count)
> +{
> +	int err;
> +
> +	switch (buf[0]) {
> +	case 'l':
> +	case 'L':
> +		err = dytc_perfmode_set(DYTC_MODE_QUIET);
> +		break;
> +	case 'm':
> +	case 'M':
> +		err = dytc_perfmode_set(DYTC_MODE_BALANCE);
> +		break;
> +	case 'h':
> +	case 'H':
> +		err = dytc_perfmode_set(DYTC_MODE_PERFORM);
> +		break;
> +	default:
> +		err = -EINVAL;
> +		pr_err("Unknown operating mode. Ignoring\n");
> +		break;
> +	}
> +	if (err)
> +		return err;
> +
> +	tpacpi_disclose_usertask(attr->attr.name,
> +				"Performance mode set to %c\n", buf[0]);
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(dytc_perfmode);
> +
> +static struct attribute *dytc_perfmode_attributes[] = {
> +	&dev_attr_dytc_perfmode.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group dytc_perf_attr_group = {
> +	.attrs = dytc_perfmode_attributes
> +};
> +
>   /* sysfs lapmode entry */
>   static ssize_t dytc_lapmode_show(struct device *dev,
>   					struct device_attribute *attr,
>   					char *buf)
>   {
> -	return snprintf(buf, PAGE_SIZE, "%d\n", dytc_lapmode);
> +	return sprintf(buf, "%d\n", dytc_lapmode);
>   }
>   
>   static DEVICE_ATTR_RO(dytc_lapmode);
>   
> -static struct attribute *dytc_attributes[] = {
> +static struct attribute *dytc_lap_attributes[] = {
>   	&dev_attr_dytc_lapmode.attr,
> -	NULL,
> +	NULL
>   };
>   
> -static const struct attribute_group dytc_attr_group = {
> -	.attrs = dytc_attributes,
> +static const struct attribute_group dytc_lap_attr_group = {
> +	.attrs = dytc_lap_attributes
>   };
>   
>   static int tpacpi_dytc_init(struct ibm_init_struct *iibm)
>   {
> -	int err;
> +	int err, output;
>   
> -	err = dytc_lapmode_get(&dytc_lapmode);
> -	/* If support isn't available (ENODEV) then don't return an error
> -	 * but just don't create the sysfs group
> +	err = dytc_command(DYTC_CMD_QUERY, &output);
> +	/*
> +	 * If support isn't available (ENODEV) then don't return an error
> +	 * just don't create the sysfs group
>   	 */
>   	if (err == -ENODEV)
>   		return 0;
> @@ -9900,14 +10091,38 @@ static int tpacpi_dytc_init(struct ibm_init_struct *iibm)
>   	if (err)
>   		return err;
>   
> -	/* Platform supports this feature - create the group */
> -	err = sysfs_create_group(&tpacpi_pdev->dev.kobj, &dytc_attr_group);
> +	/* Check DYTC is enabled and supports mode setting */
> +	dytc_available = false;
> +	dytc_ignore_next_event = false;
> +	if (output & BIT(DYTC_QUERY_ENABLE_BIT)) {
> +		/* Only DYTC v5.0 and later has this feature. */
> +		int dytc_version;
> +
> +		dytc_version = (output >> DYTC_QUERY_REV_BIT) & 0xF;
> +		if (dytc_version >= 5) {
> +			dbg_printk(TPACPI_DBG_INIT,
> +				   "DYTC version %d: thermal mode available\n", dytc_version);
> +			dytc_available = true;
> +			/* Platform supports this feature - create the group */
> +			err = sysfs_create_group(&tpacpi_pdev->dev.kobj, &dytc_perf_attr_group);
> +			if (err)
> +				return err;
> +
> +			err = dytc_lapmode_get(&dytc_lapmode);
> +			if (err)
> +				return err;
> +			err = sysfs_create_group(&tpacpi_pdev->dev.kobj, &dytc_lap_attr_group);
> +		}
> +	}
>   	return err;
>   }
>   
>   static void dytc_exit(void)
>   {
> -	sysfs_remove_group(&tpacpi_pdev->dev.kobj, &dytc_attr_group);
> +	if (dytc_available) {
> +		sysfs_remove_group(&tpacpi_pdev->dev.kobj, &dytc_lap_attr_group);
> +		sysfs_remove_group(&tpacpi_pdev->dev.kobj, &dytc_perf_attr_group);
> +	}
>   }
>   
>   static struct ibm_struct dytc_driver_data = {
> @@ -10057,7 +10272,7 @@ static void tpacpi_driver_event(const unsigned int hkey_event)
>   	}
>   
>   	if (hkey_event == TP_HKEY_EV_THM_CSM_COMPLETED)
> -		dytc_lapmode_refresh();
> +		dytc_refresh();
>   
>   	if ((hkey_event == TP_HKEY_EV_PALM_DETECTED) ||
>   		(hkey_event == TP_HKEY_EV_PALM_UNDETECTED))
> 

