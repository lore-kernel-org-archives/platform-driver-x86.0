Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F4DC433DB
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 09:00:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE4D764E4B
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 09:00:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234658AbhBDJAN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 Feb 2021 04:00:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21828 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231767AbhBDJAM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Feb 2021 04:00:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612429122;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XLzX8ywJcAq1GgKYeHSrcXI84Qw8Tfv22+lGI7GGCjg=;
        b=W/Wzoy49jk5pl9SVGqb9GY1oegy/yfJIZM+okJ2QDN5PpteYVCacE+t9obFqraMxEPLcxn
        XRNu1nhM2Bf/C/2SRKmp7UM4RO8K7wRa9/6zxrtxQabgYE6xw7eRRM6uS9QWv8gRuQ80OH
        Euw39681Dyv/61yLlgQYDx04GmeYj4k=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-dr-3G2dTM8m2QJec0Uv9EA-1; Thu, 04 Feb 2021 03:58:40 -0500
X-MC-Unique: dr-3G2dTM8m2QJec0Uv9EA-1
Received: by mail-ed1-f70.google.com with SMTP id x13so2356290edi.7
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Feb 2021 00:58:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XLzX8ywJcAq1GgKYeHSrcXI84Qw8Tfv22+lGI7GGCjg=;
        b=B25TXGca9XDDAWSUQwnk+PIZ58GolPAd3Qon0MhfeXjLAxVikRKIZjsOzHUhSUqKH8
         0RX8pc5/bT+nsFy32MM52fGroTPH4kIEl6Evlc6utlwaATcQ73zeUsAxriWvcTkL9BmH
         uRqT3CLWI4lChgciO7WSbiLc7zMUAP22ZgoLe820lr6ALt0ZGUn56IKhgrbYrYr0CeMm
         8qGiV99Gl2vsZ34EowMpKRXrn88FXd4goOJn+veQPiBw3hArVZIqC1uDxWQk5z8xLG8y
         P/0Tb38Uk2QBrez4kRAMObcTbcomfZzII9gNZKDFwXmGDeVI0jPIGveAMCirNc2RSVIo
         m6oQ==
X-Gm-Message-State: AOAM5330U33NIAcOS3UBf5Wp2Z1VbSCaSPZn0D+rskzjX5JEp6ghWV1i
        PtBsawvpfYqiqQfrqcVeHOmkN+OeyPy++/4ZXO1iEBjCH5m94M431w3JezUVlvvJ6cI3j26CMqt
        x0CF9UPphdS7px/+hOowM6Anl97uMuZuOkA==
X-Received: by 2002:a17:906:f2cd:: with SMTP id gz13mr6995541ejb.83.1612429118507;
        Thu, 04 Feb 2021 00:58:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJygGOVQqjrM+GnrJjCQjk2owfKA3fillxY27Pm3JKQtZW+yyDVuHMnh7uof9yn5C2rpnwBiPQ==
X-Received: by 2002:a17:906:f2cd:: with SMTP id gz13mr6995518ejb.83.1612429117937;
        Thu, 04 Feb 2021 00:58:37 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id de4sm2112843edb.38.2021.02.04.00.58.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Feb 2021 00:58:37 -0800 (PST)
Subject: Re: [PATCH v3 24/29] platform/x86: ideapad-laptop: fix checkpatch
 warnings, more consistent style
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        platform-driver-x86@vger.kernel.org,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20210203215403.290792-25-pobrn@protonmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <070b8c56-5b04-c50b-2e72-7dba07b02ed4@redhat.com>
Date:   Thu, 4 Feb 2021 09:58:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210203215403.290792-25-pobrn@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/3/21 10:56 PM, Barnabás Pőcze wrote:
> Fix all checkpatch warnings. Reorder variable definitions from
> longest to shortest. Add more whitespaces for better readability.
> Rename variables named `ret` to `err` where appropriate. Reorder
> sysfs attributes show/store callbacks and the `ideapad_attributes`
> array in lexicographic order. And other minor formatting changes.
> No significant functional changes are intended.
> 
> Signed-off-by: Barnabás Pőcze <pobrn@protonmail.com>

Ugh, this is a big patch with a lot of things going on.

I will take this patch as is this time, but next time please
split patches like this up a bit:

1. The reworking of the sysfs show/store functions really belongs in a separate patch
2. That separate rework sysfs show/store functions patch itself should be 2 patches:
2.1 Move the various show/store functions around to their final alphabetical order
    *without* any further changes, just move the blocks. And explicitly mention this
    in the commit message, to make life easier for the reviewer
2.2 And then do the actual reworking in a separate patch, that makes reviewing this
    much much easier, now I had to jump back and forth between the old and new blocks
    (which were not in the same place) to make sure that nothing has changed.
    Note doing things like this (first move without any changes other then moving)
    also makes checking your own work easier.
3. This change:

> @@ -773,7 +801,10 @@ static void dytc_profile_refresh(struct ideapad_private *priv)
>  		return;
>  
>  	perfmode = (output >> DYTC_GET_MODE_BIT) & 0xF;
> -	convert_dytc_to_profile(perfmode, &profile);
> +
> +	if (convert_dytc_to_profile(perfmode, &profile))
> +		return;
> +
>  	if (profile != priv->dytc->current_profile) {
>  		priv->dytc->current_profile = profile;
>  		platform_profile_notify();

Although a good change, clearly is not just a checkpatch / style change and as
such really should have been in its own commit!

Regards,

Hans



> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 4fd9670100cb..2068831c5fe8 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -32,7 +32,7 @@
>  
>  #include <acpi/video.h>
>  
> -#define IDEAPAD_RFKILL_DEV_NUM	(3)
> +#define IDEAPAD_RFKILL_DEV_NUM	3
>  
>  #if IS_ENABLED(CONFIG_ACPI_WMI)
>  static const char *const ideapad_wmi_fnesc_events[] = {
> @@ -99,7 +99,7 @@ enum {
>  struct ideapad_dytc_priv {
>  	enum platform_profile_option current_profile;
>  	struct platform_profile_handler pprof;
> -	struct mutex mutex;
> +	struct mutex mutex; /* protects the DYTC interface */
>  	struct ideapad_private *priv;
>  };
>  
> @@ -136,7 +136,7 @@ MODULE_PARM_DESC(no_bt_rfkill, "No rfkill for bluetooth.");
>  /*
>   * ACPI Helpers
>   */
> -#define IDEAPAD_EC_TIMEOUT (200) /* in ms */
> +#define IDEAPAD_EC_TIMEOUT 200 /* in ms */
>  
>  static int eval_int(acpi_handle handle, const char *name, unsigned long *res)
>  {
> @@ -146,7 +146,9 @@ static int eval_int(acpi_handle handle, const char *name, unsigned long *res)
>  	status = acpi_evaluate_integer(handle, (char *)name, NULL, &result);
>  	if (ACPI_FAILURE(status))
>  		return -EIO;
> +
>  	*res = result;
> +
>  	return 0;
>  }
>  
> @@ -225,6 +227,7 @@ static int eval_vpcw(acpi_handle handle, unsigned long cmd, unsigned long data)
>  	status = acpi_evaluate_object(handle, "VPCW", &params, NULL);
>  	if (ACPI_FAILURE(status))
>  		return -EIO;
> +
>  	return 0;
>  }
>  
> @@ -241,13 +244,17 @@ static int read_ec_data(acpi_handle handle, unsigned long cmd, unsigned long *da
>  
>  	while (time_before(jiffies, end_jiffies)) {
>  		schedule();
> +
>  		err = eval_vpcr(handle, 1, &val);
>  		if (err)
>  			return err;
> +
>  		if (val == 0)
>  			return eval_vpcr(handle, 0, data);
>  	}
> +
>  	acpi_handle_err(handle, "timeout in %s\n", __func__);
> +
>  	return -ETIMEDOUT;
>  }
>  
> @@ -259,6 +266,7 @@ static int write_ec_cmd(acpi_handle handle, unsigned long cmd, unsigned long dat
>  	err = eval_vpcw(handle, 0, data);
>  	if (err)
>  		return err;
> +
>  	err = eval_vpcw(handle, 1, cmd);
>  	if (err)
>  		return err;
> @@ -267,13 +275,17 @@ static int write_ec_cmd(acpi_handle handle, unsigned long cmd, unsigned long dat
>  
>  	while (time_before(jiffies, end_jiffies)) {
>  		schedule();
> +
>  		err = eval_vpcr(handle, 1, &val);
>  		if (err)
>  			return err;
> +
>  		if (val == 0)
>  			return 0;
>  	}
> +
>  	acpi_handle_err(handle, "timeout in %s\n", __func__);
> +
>  	return -ETIMEDOUT;
>  }
>  
> @@ -291,6 +303,7 @@ static int debugfs_status_show(struct seq_file *s, void *data)
>  		seq_printf(s, "Backlight now:  %lu\n", value);
>  	if (!read_ec_data(priv->adev->handle, VPCCMD_R_BL_POWER, &value))
>  		seq_printf(s, "BL power value: %s (%lu)\n", value ? "on" : "off", value);
> +
>  	seq_puts(s, "=====================\n");
>  
>  	if (!read_ec_data(priv->adev->handle, VPCCMD_R_RF, &value))
> @@ -301,12 +314,14 @@ static int debugfs_status_show(struct seq_file *s, void *data)
>  		seq_printf(s, "BT status:    %s (%lu)\n", value ? "on" : "off", value);
>  	if (!read_ec_data(priv->adev->handle, VPCCMD_R_3G, &value))
>  		seq_printf(s, "3G status:    %s (%lu)\n", value ? "on" : "off", value);
> +
>  	seq_puts(s, "=====================\n");
>  
>  	if (!read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &value))
>  		seq_printf(s, "Touchpad status: %s (%lu)\n", value ? "on" : "off", value);
>  	if (!read_ec_data(priv->adev->handle, VPCCMD_R_CAMERA, &value))
>  		seq_printf(s, "Camera status:   %s (%lu)\n", value ? "on" : "off", value);
> +
>  	seq_puts(s, "=====================\n");
>  
>  	if (!eval_gbmd(priv->adev->handle, &value))
> @@ -370,8 +385,8 @@ static void ideapad_debugfs_init(struct ideapad_private *priv)
>  
>  	priv->debug = dir;
>  
> -	debugfs_create_file("cfg", S_IRUGO, dir, priv, &debugfs_cfg_fops);
> -	debugfs_create_file("status", S_IRUGO, dir, priv, &debugfs_status_fops);
> +	debugfs_create_file("cfg", 0444, dir, priv, &debugfs_cfg_fops);
> +	debugfs_create_file("status", 0444, dir, priv, &debugfs_status_fops);
>  }
>  
>  static void ideapad_debugfs_exit(struct ideapad_private *priv)
> @@ -383,75 +398,79 @@ static void ideapad_debugfs_exit(struct ideapad_private *priv)
>  /*
>   * sysfs
>   */
> -static ssize_t show_ideapad_cam(struct device *dev,
> -				struct device_attribute *attr,
> -				char *buf)
> +static ssize_t camera_power_show(struct device *dev,
> +				 struct device_attribute *attr,
> +				 char *buf)
>  {
> -	unsigned long result;
>  	struct ideapad_private *priv = dev_get_drvdata(dev);
> +	unsigned long result;
>  	int err;
>  
>  	err = read_ec_data(priv->adev->handle, VPCCMD_R_CAMERA, &result);
>  	if (err)
>  		return err;
> +
>  	return sysfs_emit(buf, "%d\n", !!result);
>  }
>  
> -static ssize_t store_ideapad_cam(struct device *dev,
> -				 struct device_attribute *attr,
> -				 const char *buf, size_t count)
> +static ssize_t camera_power_store(struct device *dev,
> +				  struct device_attribute *attr,
> +				  const char *buf, size_t count)
>  {
>  	struct ideapad_private *priv = dev_get_drvdata(dev);
>  	bool state;
> -	int ret;
> -
> -	ret = kstrtobool(buf, &state);
> -	if (ret)
> -		return ret;
> -	ret = write_ec_cmd(priv->adev->handle, VPCCMD_W_CAMERA, state);
> -	if (ret)
> -		return ret;
> +	int err;
> +
> +	err = kstrtobool(buf, &state);
> +	if (err)
> +		return err;
> +
> +	err = write_ec_cmd(priv->adev->handle, VPCCMD_W_CAMERA, state);
> +	if (err)
> +		return err;
> +
>  	return count;
>  }
>  
> -static DEVICE_ATTR(camera_power, 0644, show_ideapad_cam, store_ideapad_cam);
> +static DEVICE_ATTR_RW(camera_power);
>  
> -static ssize_t show_ideapad_fan(struct device *dev,
> -				struct device_attribute *attr,
> -				char *buf)
> +static ssize_t conservation_mode_show(struct device *dev,
> +				      struct device_attribute *attr,
> +				      char *buf)
>  {
> -	unsigned long result;
>  	struct ideapad_private *priv = dev_get_drvdata(dev);
> +	unsigned long result;
>  	int err;
>  
> -	err = read_ec_data(priv->adev->handle, VPCCMD_R_FAN, &result);
> +	err = eval_gbmd(priv->adev->handle, &result);
>  	if (err)
>  		return err;
> -	return sysfs_emit(buf, "%lu\n", result);
> +
> +	return sysfs_emit(buf, "%d\n", !!test_bit(GBMD_CONSERVATION_STATE_BIT, &result));
>  }
>  
> -static ssize_t store_ideapad_fan(struct device *dev,
> -				 struct device_attribute *attr,
> -				 const char *buf, size_t count)
> +static ssize_t conservation_mode_store(struct device *dev,
> +				       struct device_attribute *attr,
> +				       const char *buf, size_t count)
>  {
>  	struct ideapad_private *priv = dev_get_drvdata(dev);
> -	unsigned int state;
> -	int ret;
> +	bool state;
> +	int err;
> +
> +	err = kstrtobool(buf, &state);
> +	if (err)
> +		return err;
> +
> +	err = exec_smbc(priv->adev->handle, state ? SMBC_CONSERVATION_ON : SMBC_CONSERVATION_OFF);
> +	if (err)
> +		return err;
>  
> -	ret = kstrtouint(buf, 0, &state);
> -	if (ret)
> -		return ret;
> -	if (state > 4 || state == 3)
> -		return -EINVAL;
> -	ret = write_ec_cmd(priv->adev->handle, VPCCMD_W_FAN, state);
> -	if (ret)
> -		return ret;
>  	return count;
>  }
>  
> -static DEVICE_ATTR(fan_mode, 0644, show_ideapad_fan, store_ideapad_fan);
> +static DEVICE_ATTR_RW(conservation_mode);
>  
> -static ssize_t touchpad_show(struct device *dev,
> +static ssize_t fan_mode_show(struct device *dev,
>  			     struct device_attribute *attr,
>  			     char *buf)
>  {
> @@ -459,113 +478,121 @@ static ssize_t touchpad_show(struct device *dev,
>  	unsigned long result;
>  	int err;
>  
> -	err = read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &result);
> +	err = read_ec_data(priv->adev->handle, VPCCMD_R_FAN, &result);
>  	if (err)
>  		return err;
> -	return sysfs_emit(buf, "%d\n", !!result);
> +
> +	return sysfs_emit(buf, "%lu\n", result);
>  }
>  
> -static ssize_t touchpad_store(struct device *dev,
> +static ssize_t fan_mode_store(struct device *dev,
>  			      struct device_attribute *attr,
>  			      const char *buf, size_t count)
>  {
>  	struct ideapad_private *priv = dev_get_drvdata(dev);
> -	bool state;
> -	int ret;
> +	unsigned int state;
> +	int err;
> +
> +	err = kstrtouint(buf, 0, &state);
> +	if (err)
> +		return err;
> +
> +	if (state > 4 || state == 3)
> +		return -EINVAL;
>  
> -	ret = kstrtobool(buf, &state);
> -	if (ret)
> -		return ret;
> +	err = write_ec_cmd(priv->adev->handle, VPCCMD_W_FAN, state);
> +	if (err)
> +		return err;
>  
> -	ret = write_ec_cmd(priv->adev->handle, VPCCMD_W_TOUCHPAD, state);
> -	if (ret)
> -		return ret;
>  	return count;
>  }
>  
> -static DEVICE_ATTR_RW(touchpad);
> +static DEVICE_ATTR_RW(fan_mode);
>  
> -static ssize_t conservation_mode_show(struct device *dev,
> -				struct device_attribute *attr,
> -				char *buf)
> +static ssize_t fn_lock_show(struct device *dev,
> +			    struct device_attribute *attr,
> +			    char *buf)
>  {
>  	struct ideapad_private *priv = dev_get_drvdata(dev);
> -	unsigned long result;
> +	unsigned long hals;
>  	int err;
>  
> -	err = eval_gbmd(priv->adev->handle, &result);
> +	err = eval_hals(priv->adev->handle, &hals);
>  	if (err)
>  		return err;
> -	return sysfs_emit(buf, "%d\n", !!test_bit(GBMD_CONSERVATION_STATE_BIT, &result));
> +
> +	return sysfs_emit(buf, "%d\n", !!test_bit(HALS_FNLOCK_STATE_BIT, &hals));
>  }
>  
> -static ssize_t conservation_mode_store(struct device *dev,
> -				 struct device_attribute *attr,
> -				 const char *buf, size_t count)
> +static ssize_t fn_lock_store(struct device *dev,
> +			     struct device_attribute *attr,
> +			     const char *buf, size_t count)
>  {
>  	struct ideapad_private *priv = dev_get_drvdata(dev);
>  	bool state;
> -	int ret;
> +	int err;
>  
> -	ret = kstrtobool(buf, &state);
> -	if (ret)
> -		return ret;
> +	err = kstrtobool(buf, &state);
> +	if (err)
> +		return err;
> +
> +	err = exec_sals(priv->adev->handle, state ? SALS_FNLOCK_ON : SALS_FNLOCK_OFF);
> +	if (err)
> +		return err;
>  
> -	ret = exec_smbc(priv->adev->handle, state ? SMBC_CONSERVATION_ON : SMBC_CONSERVATION_OFF);
> -	if (ret)
> -		return ret;
>  	return count;
>  }
>  
> -static DEVICE_ATTR_RW(conservation_mode);
> +static DEVICE_ATTR_RW(fn_lock);
>  
> -static ssize_t fn_lock_show(struct device *dev,
> -			    struct device_attribute *attr,
> -			    char *buf)
> +static ssize_t touchpad_show(struct device *dev,
> +			     struct device_attribute *attr,
> +			     char *buf)
>  {
>  	struct ideapad_private *priv = dev_get_drvdata(dev);
> -	unsigned long hals;
> -	int fail = eval_hals(priv->adev->handle, &hals);
> +	unsigned long result;
> +	int err;
>  
> -	if (fail)
> -		return fail;
> +	err = read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &result);
> +	if (err)
> +		return err;
>  
> -	return sysfs_emit(buf, "%d\n", !!test_bit(HALS_FNLOCK_STATE_BIT, &hals));
> +	return sysfs_emit(buf, "%d\n", !!result);
>  }
>  
> -static ssize_t fn_lock_store(struct device *dev,
> -			     struct device_attribute *attr,
> -			     const char *buf, size_t count)
> +static ssize_t touchpad_store(struct device *dev,
> +			      struct device_attribute *attr,
> +			      const char *buf, size_t count)
>  {
>  	struct ideapad_private *priv = dev_get_drvdata(dev);
>  	bool state;
> -	int ret;
> +	int err;
> +
> +	err = kstrtobool(buf, &state);
> +	if (err)
> +		return err;
>  
> -	ret = kstrtobool(buf, &state);
> -	if (ret)
> -		return ret;
> +	err = write_ec_cmd(priv->adev->handle, VPCCMD_W_TOUCHPAD, state);
> +	if (err)
> +		return err;
>  
> -	ret = exec_sals(priv->adev->handle, state ? SALS_FNLOCK_ON : SALS_FNLOCK_OFF);
> -	if (ret)
> -		return ret;
>  	return count;
>  }
>  
> -static DEVICE_ATTR_RW(fn_lock);
> -
> +static DEVICE_ATTR_RW(touchpad);
>  
>  static struct attribute *ideapad_attributes[] = {
>  	&dev_attr_camera_power.attr,
> -	&dev_attr_fan_mode.attr,
> -	&dev_attr_touchpad.attr,
>  	&dev_attr_conservation_mode.attr,
> +	&dev_attr_fan_mode.attr,
>  	&dev_attr_fn_lock.attr,
> +	&dev_attr_touchpad.attr,
>  	NULL
>  };
>  
>  static umode_t ideapad_is_visible(struct kobject *kobj,
> -				 struct attribute *attr,
> -				 int idx)
> +				  struct attribute *attr,
> +				  int idx)
>  {
>  	struct device *dev = kobj_to_dev(kobj);
>  	struct ideapad_private *priv = dev_get_drvdata(dev);
> @@ -642,6 +669,7 @@ static int convert_dytc_to_profile(int dytcmode, enum platform_profile_option *p
>  	default: /* Unknown mode */
>  		return -EINVAL;
>  	}
> +
>  	return 0;
>  }
>  
> @@ -660,6 +688,7 @@ static int convert_profile_to_dytc(enum platform_profile_option profile, int *pe
>  	default: /* Unknown profile */
>  		return -EOPNOTSUPP;
>  	}
> +
>  	return 0;
>  }
>  
> @@ -667,24 +696,24 @@ static int convert_profile_to_dytc(enum platform_profile_option profile, int *pe
>   * dytc_profile_get: Function to register with platform_profile
>   * handler. Returns current platform profile.
>   */
> -int dytc_profile_get(struct platform_profile_handler *pprof,
> -			enum platform_profile_option *profile)
> +static int dytc_profile_get(struct platform_profile_handler *pprof,
> +			    enum platform_profile_option *profile)
>  {
> -	struct ideapad_dytc_priv *dytc;
> +	struct ideapad_dytc_priv *dytc = container_of(pprof, struct ideapad_dytc_priv, pprof);
>  
> -	dytc = container_of(pprof, struct ideapad_dytc_priv, pprof);
>  	*profile = dytc->current_profile;
>  	return 0;
>  }
>  
>  /*
>   * Helper function - check if we are in CQL mode and if we are
> - *  -  disable CQL,
> + *  - disable CQL,
>   *  - run the command
>   *  - enable CQL
>   *  If not in CQL mode, just run the command
>   */
> -int dytc_cql_command(struct ideapad_private *priv, unsigned long cmd, unsigned long *output)
> +static int dytc_cql_command(struct ideapad_private *priv, unsigned long cmd,
> +			    unsigned long *output)
>  {
>  	int err, cmd_err, cur_funcmode;
>  
> @@ -720,16 +749,13 @@ int dytc_cql_command(struct ideapad_private *priv, unsigned long cmd, unsigned l
>   * dytc_profile_set: Function to register with platform_profile
>   * handler. Sets current platform profile.
>   */
> -int dytc_profile_set(struct platform_profile_handler *pprof,
> -			enum platform_profile_option profile)
> +static int dytc_profile_set(struct platform_profile_handler *pprof,
> +			    enum platform_profile_option profile)
>  {
> -	struct ideapad_dytc_priv *dytc;
> -	struct ideapad_private *priv;
> +	struct ideapad_dytc_priv *dytc = container_of(pprof, struct ideapad_dytc_priv, pprof);
> +	struct ideapad_private *priv = dytc->priv;
>  	int err;
>  
> -	dytc = container_of(pprof, struct ideapad_dytc_priv, pprof);
> -	priv = dytc->priv;
> -
>  	err = mutex_lock_interruptible(&dytc->mutex);
>  	if (err)
>  		return err;
> @@ -747,16 +773,18 @@ int dytc_profile_set(struct platform_profile_handler *pprof,
>  			goto unlock;
>  
>  		/* Determine if we are in CQL mode. This alters the commands we do */
> -		err = dytc_cql_command(priv,
> -				DYTC_SET_COMMAND(DYTC_FUNCTION_MMC, perfmode, 1),
> -				NULL);
> +		err = dytc_cql_command(priv, DYTC_SET_COMMAND(DYTC_FUNCTION_MMC, perfmode, 1),
> +				       NULL);
>  		if (err)
>  			goto unlock;
>  	}
> +
>  	/* Success - update current profile */
>  	dytc->current_profile = profile;
> +
>  unlock:
>  	mutex_unlock(&dytc->mutex);
> +
>  	return err;
>  }
>  
> @@ -773,7 +801,10 @@ static void dytc_profile_refresh(struct ideapad_private *priv)
>  		return;
>  
>  	perfmode = (output >> DYTC_GET_MODE_BIT) & 0xF;
> -	convert_dytc_to_profile(perfmode, &profile);
> +
> +	if (convert_dytc_to_profile(perfmode, &profile))
> +		return;
> +
>  	if (profile != priv->dytc->current_profile) {
>  		priv->dytc->current_profile = profile;
>  		platform_profile_notify();
> @@ -794,14 +825,14 @@ static int ideapad_dytc_profile_init(struct ideapad_private *priv)
>  		return err;
>  
>  	/* Check DYTC is enabled and supports mode setting */
> -	if (!(output & BIT(DYTC_QUERY_ENABLE_BIT)))
> +	if (!test_bit(DYTC_QUERY_ENABLE_BIT, &output))
>  		return -ENODEV;
>  
>  	dytc_version = (output >> DYTC_QUERY_REV_BIT) & 0xF;
>  	if (dytc_version < 5)
>  		return -ENODEV;
>  
> -	priv->dytc = kzalloc(sizeof(struct ideapad_dytc_priv), GFP_KERNEL);
> +	priv->dytc = kzalloc(sizeof(*priv->dytc), GFP_KERNEL);
>  	if (!priv->dytc)
>  		return -ENOMEM;
>  
> @@ -819,17 +850,18 @@ static int ideapad_dytc_profile_init(struct ideapad_private *priv)
>  	/* Create platform_profile structure and register */
>  	err = platform_profile_register(&priv->dytc->pprof);
>  	if (err)
> -		goto mutex_destroy;
> +		goto pp_reg_failed;
>  
>  	/* Ensure initial values are correct */
>  	dytc_profile_refresh(priv);
>  
>  	return 0;
>  
> -mutex_destroy:
> +pp_reg_failed:
>  	mutex_destroy(&priv->dytc->mutex);
>  	kfree(priv->dytc);
>  	priv->dytc = NULL;
> +
>  	return err;
>  }
>  
> @@ -841,6 +873,7 @@ static void ideapad_dytc_profile_exit(struct ideapad_private *priv)
>  	platform_profile_remove();
>  	mutex_destroy(&priv->dytc->mutex);
>  	kfree(priv->dytc);
> +
>  	priv->dytc = NULL;
>  }
>  
> @@ -890,16 +923,15 @@ static void ideapad_sync_rfk_state(struct ideapad_private *priv)
>  
>  static int ideapad_register_rfkill(struct ideapad_private *priv, int dev)
>  {
> -	int ret;
> -	unsigned long sw_blocked;
> +	unsigned long rf_enabled;
> +	int err;
>  
> -	if (no_bt_rfkill &&
> -	    (ideapad_rfk_data[dev].type == RFKILL_TYPE_BLUETOOTH)) {
> +	if (no_bt_rfkill && ideapad_rfk_data[dev].type == RFKILL_TYPE_BLUETOOTH) {
>  		/* Force to enable bluetooth when no_bt_rfkill=1 */
> -		write_ec_cmd(priv->adev->handle,
> -			     ideapad_rfk_data[dev].opcode, 1);
> +		write_ec_cmd(priv->adev->handle, ideapad_rfk_data[dev].opcode, 1);
>  		return 0;
>  	}
> +
>  	priv->rfk_priv[dev].dev = dev;
>  	priv->rfk_priv[dev].priv = priv;
>  
> @@ -911,20 +943,17 @@ static int ideapad_register_rfkill(struct ideapad_private *priv, int dev)
>  	if (!priv->rfk[dev])
>  		return -ENOMEM;
>  
> -	if (read_ec_data(priv->adev->handle, ideapad_rfk_data[dev].opcode-1,
> -			 &sw_blocked)) {
> -		rfkill_init_sw_state(priv->rfk[dev], 0);
> -	} else {
> -		sw_blocked = !sw_blocked;
> -		rfkill_init_sw_state(priv->rfk[dev], sw_blocked);
> -	}
> +	err = read_ec_data(priv->adev->handle, ideapad_rfk_data[dev].opcode - 1, &rf_enabled);
> +	if (err)
> +		rf_enabled = 1;
> +
> +	rfkill_init_sw_state(priv->rfk[dev], !rf_enabled);
>  
> -	ret = rfkill_register(priv->rfk[dev]);
> -	if (ret) {
> +	err = rfkill_register(priv->rfk[dev]);
> +	if (err)
>  		rfkill_destroy(priv->rfk[dev]);
> -		return ret;
> -	}
> -	return 0;
> +
> +	return err;
>  }
>  
>  static void ideapad_unregister_rfkill(struct ideapad_private *priv, int dev)
> @@ -955,26 +984,25 @@ static void ideapad_sysfs_exit(struct ideapad_private *priv)
>   * input device
>   */
>  static const struct key_entry ideapad_keymap[] = {
> -	{ KE_KEY, 6,  { KEY_SWITCHVIDEOMODE } },
> -	{ KE_KEY, 7,  { KEY_CAMERA } },
> -	{ KE_KEY, 8,  { KEY_MICMUTE } },
> -	{ KE_KEY, 11, { KEY_F16 } },
> -	{ KE_KEY, 13, { KEY_WLAN } },
> -	{ KE_KEY, 16, { KEY_PROG1 } },
> -	{ KE_KEY, 17, { KEY_PROG2 } },
> -	{ KE_KEY, 64, { KEY_PROG3 } },
> -	{ KE_KEY, 65, { KEY_PROG4 } },
> -	{ KE_KEY, 66, { KEY_TOUCHPAD_OFF } },
> -	{ KE_KEY, 67, { KEY_TOUCHPAD_ON } },
> +	{ KE_KEY,   6, { KEY_SWITCHVIDEOMODE } },
> +	{ KE_KEY,   7, { KEY_CAMERA } },
> +	{ KE_KEY,   8, { KEY_MICMUTE } },
> +	{ KE_KEY,  11, { KEY_F16 } },
> +	{ KE_KEY,  13, { KEY_WLAN } },
> +	{ KE_KEY,  16, { KEY_PROG1 } },
> +	{ KE_KEY,  17, { KEY_PROG2 } },
> +	{ KE_KEY,  64, { KEY_PROG3 } },
> +	{ KE_KEY,  65, { KEY_PROG4 } },
> +	{ KE_KEY,  66, { KEY_TOUCHPAD_OFF } },
> +	{ KE_KEY,  67, { KEY_TOUCHPAD_ON } },
>  	{ KE_KEY, 128, { KEY_ESC } },
> -
> -	{ KE_END, 0 },
> +	{ KE_END },
>  };
>  
>  static int ideapad_input_init(struct ideapad_private *priv)
>  {
>  	struct input_dev *inputdev;
> -	int error;
> +	int err;
>  
>  	inputdev = input_allocate_device();
>  	if (!inputdev)
> @@ -985,26 +1013,28 @@ static int ideapad_input_init(struct ideapad_private *priv)
>  	inputdev->id.bustype = BUS_HOST;
>  	inputdev->dev.parent = &priv->platform_device->dev;
>  
> -	error = sparse_keymap_setup(inputdev, ideapad_keymap, NULL);
> -	if (error) {
> +	err = sparse_keymap_setup(inputdev, ideapad_keymap, NULL);
> +	if (err) {
>  		dev_err(&priv->platform_device->dev,
> -			"Unable to setup input device keymap\n");
> +			"Could not set up input device keymap: %d\n", err);
>  		goto err_free_dev;
>  	}
>  
> -	error = input_register_device(inputdev);
> -	if (error) {
> +	err = input_register_device(inputdev);
> +	if (err) {
>  		dev_err(&priv->platform_device->dev,
> -			"Unable to register input device\n");
> +			"Could not register input device: %d\n", err);
>  		goto err_free_dev;
>  	}
>  
>  	priv->inputdev = inputdev;
> +
>  	return 0;
>  
>  err_free_dev:
>  	input_free_device(inputdev);
> -	return error;
> +
> +	return err;
>  }
>  
>  static void ideapad_input_exit(struct ideapad_private *priv)
> @@ -1025,6 +1055,7 @@ static void ideapad_input_novokey(struct ideapad_private *priv)
>  
>  	if (read_ec_data(priv->adev->handle, VPCCMD_R_NOVO, &long_pressed))
>  		return;
> +
>  	if (long_pressed)
>  		ideapad_input_report(priv, 17);
>  	else
> @@ -1040,8 +1071,8 @@ static void ideapad_check_special_buttons(struct ideapad_private *priv)
>  
>  	for_each_set_bit (bit, &value, 16) {
>  		switch (bit) {
> -		case 0:	/* Z580 */
>  		case 6:	/* Z570 */
> +		case 0:	/* Z580 */
>  			/* Thermal Management button */
>  			ideapad_input_report(priv, 65);
>  			break;
> @@ -1069,6 +1100,7 @@ static int ideapad_backlight_get_brightness(struct backlight_device *blightdev)
>  	err = read_ec_data(priv->adev->handle, VPCCMD_R_BL, &now);
>  	if (err)
>  		return err;
> +
>  	return now;
>  }
>  
> @@ -1081,6 +1113,7 @@ static int ideapad_backlight_update_status(struct backlight_device *blightdev)
>  			   blightdev->props.brightness);
>  	if (err)
>  		return err;
> +
>  	err = write_ec_cmd(priv->adev->handle, VPCCMD_W_BL_POWER,
>  			   blightdev->props.power != FB_BLANK_POWERDOWN);
>  	if (err)
> @@ -1104,30 +1137,36 @@ static int ideapad_backlight_init(struct ideapad_private *priv)
>  	err = read_ec_data(priv->adev->handle, VPCCMD_R_BL_MAX, &max);
>  	if (err)
>  		return err;
> +
>  	err = read_ec_data(priv->adev->handle, VPCCMD_R_BL, &now);
>  	if (err)
>  		return err;
> +
>  	err = read_ec_data(priv->adev->handle, VPCCMD_R_BL_POWER, &power);
>  	if (err)
>  		return err;
>  
> -	memset(&props, 0, sizeof(struct backlight_properties));
> +	memset(&props, 0, sizeof(props));
> +
>  	props.max_brightness = max;
>  	props.type = BACKLIGHT_PLATFORM;
> +
>  	blightdev = backlight_device_register("ideapad",
>  					      &priv->platform_device->dev,
>  					      priv,
>  					      &ideapad_backlight_ops,
>  					      &props);
>  	if (IS_ERR(blightdev)) {
> +		err = PTR_ERR(blightdev);
>  		dev_err(&priv->platform_device->dev,
> -			"Could not register backlight device\n");
> -		return PTR_ERR(blightdev);
> +			"Could not register backlight device: %d\n", err);
> +		return err;
>  	}
>  
>  	priv->blightdev = blightdev;
>  	blightdev->props.brightness = now;
>  	blightdev->props.power = power ? FB_BLANK_UNBLANK : FB_BLANK_POWERDOWN;
> +
>  	backlight_update_status(blightdev);
>  
>  	return 0;
> @@ -1141,13 +1180,15 @@ static void ideapad_backlight_exit(struct ideapad_private *priv)
>  
>  static void ideapad_backlight_notify_power(struct ideapad_private *priv)
>  {
> -	unsigned long power;
>  	struct backlight_device *blightdev = priv->blightdev;
> +	unsigned long power;
>  
>  	if (!blightdev)
>  		return;
> +
>  	if (read_ec_data(priv->adev->handle, VPCCMD_R_BL_POWER, &power))
>  		return;
> +
>  	blightdev->props.power = power ? FB_BLANK_UNBLANK : FB_BLANK_POWERDOWN;
>  }
>  
> @@ -1156,12 +1197,10 @@ static void ideapad_backlight_notify_brightness(struct ideapad_private *priv)
>  	unsigned long now;
>  
>  	/* if we control brightness via acpi video driver */
> -	if (priv->blightdev == NULL) {
> +	if (!priv->blightdev)
>  		read_ec_data(priv->adev->handle, VPCCMD_R_BL, &now);
> -		return;
> -	}
> -
> -	backlight_force_update(priv->blightdev, BACKLIGHT_UPDATE_HOTKEY);
> +	else
> +		backlight_force_update(priv->blightdev, BACKLIGHT_UPDATE_HOTKEY);
>  }
>  
>  /*
> @@ -1176,13 +1215,14 @@ static void ideapad_sync_touchpad_state(struct ideapad_private *priv)
>  
>  	/* Without reading from EC touchpad LED doesn't switch state */
>  	if (!read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &value)) {
> -		/* Some IdeaPads don't really turn off touchpad - they only
> +		unsigned char param;
> +		/*
> +		 * Some IdeaPads don't really turn off touchpad - they only
>  		 * switch the LED state. We (de)activate KBC AUX port to turn
>  		 * touchpad off and on. We send KEY_TOUCHPAD_OFF and
> -		 * KEY_TOUCHPAD_ON to not to get out of sync with LED */
> -		unsigned char param;
> -		i8042_command(&param, value ? I8042_CMD_AUX_ENABLE :
> -			      I8042_CMD_AUX_DISABLE);
> +		 * KEY_TOUCHPAD_ON to not to get out of sync with LED
> +		 */
> +		i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE);
>  		ideapad_input_report(priv, value ? 67 : 66);
>  	}
>  }
> @@ -1194,6 +1234,7 @@ static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
>  
>  	if (read_ec_data(handle, VPCCMD_R_VPC1, &vpc1))
>  		return;
> +
>  	if (read_ec_data(handle, VPCCMD_R_VPC2, &vpc2))
>  		return;
>  
> @@ -1201,9 +1242,6 @@ static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
>  
>  	for_each_set_bit (bit, &vpc1, 16) {
>  		switch (bit) {
> -		case 9:
> -			ideapad_sync_rfk_state(priv);
> -			break;
>  		case 13:
>  		case 11:
>  		case 8:
> @@ -1211,6 +1249,9 @@ static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
>  		case 6:
>  			ideapad_input_report(priv, bit);
>  			break;
> +		case 9:
> +			ideapad_sync_rfk_state(priv);
> +			break;
>  		case 5:
>  			ideapad_sync_touchpad_state(priv);
>  			break;
> @@ -1223,16 +1264,17 @@ static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
>  		case 2:
>  			ideapad_backlight_notify_power(priv);
>  			break;
> -		case 0:
> -			ideapad_check_special_buttons(priv);
> -			break;
>  		case 1:
> -			/* Some IdeaPads report event 1 every ~20
> +			/*
> +			 * Some IdeaPads report event 1 every ~20
>  			 * seconds while on battery power; some
>  			 * report this when changing to/from tablet
>  			 * mode. Squelch this event.
>  			 */
>  			break;
> +		case 0:
> +			ideapad_check_special_buttons(priv);
> +			break;
>  		default:
>  			dev_info(&priv->platform_device->dev,
>  				 "Unknown event: %lu\n", bit);
> @@ -1304,14 +1346,14 @@ static void ideapad_check_features(struct ideapad_private *priv)
>  
>  static int ideapad_acpi_add(struct platform_device *pdev)
>  {
> -	int ret, i;
>  	struct ideapad_private *priv;
>  	struct acpi_device *adev;
>  	acpi_status status;
>  	unsigned long cfg;
> +	int err, i;
>  
> -	ret = acpi_bus_get_device(ACPI_HANDLE(&pdev->dev), &adev);
> -	if (ret)
> +	err = acpi_bus_get_device(ACPI_HANDLE(&pdev->dev), &adev);
> +	if (err)
>  		return -ENODEV;
>  
>  	if (eval_int(adev->handle, "_CFG", &cfg))
> @@ -1322,20 +1364,21 @@ static int ideapad_acpi_add(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	dev_set_drvdata(&pdev->dev, priv);
> +
>  	priv->cfg = cfg;
>  	priv->adev = adev;
>  	priv->platform_device = pdev;
>  
>  	ideapad_check_features(priv);
>  
> -	ret = ideapad_sysfs_init(priv);
> -	if (ret)
> -		return ret;
> +	err = ideapad_sysfs_init(priv);
> +	if (err)
> +		return err;
>  
>  	ideapad_debugfs_init(priv);
>  
> -	ret = ideapad_input_init(priv);
> -	if (ret)
> +	err = ideapad_input_init(priv);
> +	if (err)
>  		goto input_failed;
>  
>  	/*
> @@ -1356,24 +1399,25 @@ static int ideapad_acpi_add(struct platform_device *pdev)
>  	ideapad_sync_rfk_state(priv);
>  	ideapad_sync_touchpad_state(priv);
>  
> -	ret = ideapad_dytc_profile_init(priv);
> -	if (ret) {
> -		if (ret != -ENODEV)
> -			dev_warn(&pdev->dev, "Could not set up DYTC interface: %d\n", ret);
> +	err = ideapad_dytc_profile_init(priv);
> +	if (err) {
> +		if (err != -ENODEV)
> +			dev_warn(&pdev->dev, "Could not set up DYTC interface: %d\n", err);
>  		else
>  			dev_info(&pdev->dev, "DYTC interface is not available\n");
>  	}
>  
>  	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
> -		ret = ideapad_backlight_init(priv);
> -		if (ret && ret != -ENODEV)
> +		err = ideapad_backlight_init(priv);
> +		if (err && err != -ENODEV)
>  			goto backlight_failed;
>  	}
> +
>  	status = acpi_install_notify_handler(adev->handle,
>  					     ACPI_DEVICE_NOTIFY,
>  					     ideapad_acpi_notify, priv);
>  	if (ACPI_FAILURE(status)) {
> -		ret = -EIO;
> +		err = -EIO;
>  		goto notification_failed;
>  	}
>  
> @@ -1386,29 +1430,38 @@ static int ideapad_acpi_add(struct platform_device *pdev)
>  			break;
>  		}
>  	}
> +
>  	if (ACPI_FAILURE(status) && status != AE_NOT_EXIST) {
> -		ret = -EIO;
> +		err = -EIO;
>  		goto notification_failed_wmi;
>  	}
>  #endif
>  
>  	return 0;
> +
>  #if IS_ENABLED(CONFIG_ACPI_WMI)
>  notification_failed_wmi:
>  	acpi_remove_notify_handler(priv->adev->handle,
> -		ACPI_DEVICE_NOTIFY, ideapad_acpi_notify);
> +				   ACPI_DEVICE_NOTIFY,
> +				   ideapad_acpi_notify);
>  #endif
> +
>  notification_failed:
>  	ideapad_backlight_exit(priv);
> +
>  backlight_failed:
>  	ideapad_dytc_profile_exit(priv);
> +
>  	for (i = 0; i < IDEAPAD_RFKILL_DEV_NUM; i++)
>  		ideapad_unregister_rfkill(priv, i);
> +
>  	ideapad_input_exit(priv);
> +
>  input_failed:
>  	ideapad_debugfs_exit(priv);
>  	ideapad_sysfs_exit(priv);
> -	return ret;
> +
> +	return err;
>  }
>  
>  static int ideapad_acpi_remove(struct platform_device *pdev)
> @@ -1420,12 +1473,17 @@ static int ideapad_acpi_remove(struct platform_device *pdev)
>  	if (priv->fnesc_guid)
>  		wmi_remove_notify_handler(priv->fnesc_guid);
>  #endif
> +
>  	acpi_remove_notify_handler(priv->adev->handle,
> -		ACPI_DEVICE_NOTIFY, ideapad_acpi_notify);
> +				   ACPI_DEVICE_NOTIFY,
> +				   ideapad_acpi_notify);
> +
>  	ideapad_backlight_exit(priv);
>  	ideapad_dytc_profile_exit(priv);
> +
>  	for (i = 0; i < IDEAPAD_RFKILL_DEV_NUM; i++)
>  		ideapad_unregister_rfkill(priv, i);
> +
>  	ideapad_input_exit(priv);
>  	ideapad_debugfs_exit(priv);
>  	ideapad_sysfs_exit(priv);
> @@ -1450,8 +1508,8 @@ static int ideapad_acpi_resume(struct device *dev)
>  static SIMPLE_DEV_PM_OPS(ideapad_pm, NULL, ideapad_acpi_resume);
>  
>  static const struct acpi_device_id ideapad_device_ids[] = {
> -	{ "VPC2004", 0},
> -	{ "", 0},
> +	{"VPC2004", 0},
> +	{"", 0},
>  };
>  MODULE_DEVICE_TABLE(acpi, ideapad_device_ids);
>  
> 

