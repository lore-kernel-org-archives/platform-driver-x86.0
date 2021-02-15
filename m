Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28649C433E0
	for <platform-driver-x86@archiver.kernel.org>; Mon, 15 Feb 2021 14:49:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA6C364E26
	for <platform-driver-x86@archiver.kernel.org>; Mon, 15 Feb 2021 14:49:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbhBOOto (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 15 Feb 2021 09:49:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45234 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229870AbhBOOtn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 Feb 2021 09:49:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613400496;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YRfK8Bk4mjeIdIQtIIcq3AS9gHjU8s1j/0AXF6Z/USM=;
        b=HJe14RoyFARdsxUEcglm7JUj1WjUl8vkY88bbQDjgOBHO3a/ylxd3Mp0/AVzcCiTnjr8wP
        8KaubY38YySkaarcLVJTWnkO6S07mCVjtbkiyL3LYucamlUsVCWocbCVzt15mQUWkXswBp
        csUkQOGGs6zfosSzXcKU1rnBEWZ3zDM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-c-In2MYmPtm0XEilptpGBw-1; Mon, 15 Feb 2021 09:48:13 -0500
X-MC-Unique: c-In2MYmPtm0XEilptpGBw-1
Received: by mail-ed1-f71.google.com with SMTP id i4so5217378edt.11
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Feb 2021 06:48:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YRfK8Bk4mjeIdIQtIIcq3AS9gHjU8s1j/0AXF6Z/USM=;
        b=eoVTwuK6viZyI+W3ixeRUnnNDNno3e3ifapZsgvMsZbT6uIB1ASmTTuQSqJUufXTu5
         W+YLt3PSPVdPuX2aEde98FW+qyycnD3adLFcUaKq6uJ3rTHs+mPPxT3I6lPOOVgdjhN8
         OyZkPpAyHm/WqcYw4pzAyeOZLZMrVqZv5S1p85/CFvxJ65ojyfdpPFBeJR65l6f4cJuR
         XbIR2uoy+YjlissJnqixio9KD0Ymb+iX3jRSTU9r0/LjVfDUkla6pNRKity+3DYEve/t
         xt725R7eNv41K1VKYzWzWH6y4SXi7vNavPKNsfkfoDONRNNn/9lbd2L5uxSRRlUlJBPU
         GWog==
X-Gm-Message-State: AOAM530yot6i8GADDJZfhR5E7Qn8AfVT5fpQ9jQTJqTOhfsoRswsACfy
        VH8zGfb3zYt9FyUI8CheghZI4Nqf7In2Asxpfzwoh+JyIp3Nq4t4v/y7sldpaHCJo38Wyc+OTCR
        LvRxulegMnEbxJtb8ZgQGCKAJ8hT0zpfXkw==
X-Received: by 2002:a50:fe89:: with SMTP id d9mr16264762edt.57.1613400492608;
        Mon, 15 Feb 2021 06:48:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw5qa5DaqB3+ojJU8jKMD+t9ZZ9UYr6VQDIhV1y97P5RjIUMPnA+lywIGrS+cP7iM/mWq7AGA==
X-Received: by 2002:a50:fe89:: with SMTP id d9mr16264755edt.57.1613400492427;
        Mon, 15 Feb 2021 06:48:12 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id w8sm9737368edd.39.2021.02.15.06.48.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Feb 2021 06:48:12 -0800 (PST)
Subject: Re: [PATCH 1/2] platorm/x86: thinkpad_acpi: sysfs interface to reduce
 wlan tx power
To:     Nitin Joshi <nitjoshi@gmail.com>
Cc:     ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        Nitin Joshi <njoshi1@lenovo.com>,
        Mark Pearson <markpearson@lenovo.com>
References: <20210212055856.232702-1-njoshi1@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <aebc72ff-769b-f0b0-6cf6-186963bf726b@redhat.com>
Date:   Mon, 15 Feb 2021 15:48:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210212055856.232702-1-njoshi1@lenovo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Nitin,

On 2/12/21 6:58 AM, Nitin Joshi wrote:
> Some newer Thinkpads have the WLAN antenna placed close to the WWAN
> antenna. In these cases FCC certification requires that when WWAN is
> active we reduce WLAN transmission power. A new Dynamic Power
> Reduction Control (DPRC) method is available from the BIOS on these
> platforms to reduce or restore WLAN Tx power.
> 
> This patch provides a sysfs interface that userspace can use to adjust the
> WLAN power appropriately.
> 
> Reviewed-by: Mark Pearson <markpearson@lenovo.com>
> Signed-off-by: Nitin Joshi <njoshi1@lenovo.com>

This patch as well as patch 2/2 generally look ok to me.

The one thing which stands out is the:

		*wlan_txreduce = -1;

Resp:

		*wwan_antennatype = -1;

	default:
		return sysfs_emit(buf, "unknown type\n");

Bits, which Barnabás already pointed out.

If you can prepare a v2 of this patch-set addressing all the
review remarks which you have received so far then that
would be great.

Regards,

Hans




> ---
>  .../admin-guide/laptops/thinkpad-acpi.rst     |  18 +++
>  drivers/platform/x86/thinkpad_acpi.c          | 136 ++++++++++++++++++
>  2 files changed, 154 insertions(+)
> 
> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> index 5fe1ade88c17..10410811b990 100644
> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> @@ -51,6 +51,7 @@ detailed description):
>  	- UWB enable and disable
>  	- LCD Shadow (PrivacyGuard) enable and disable
>  	- Lap mode sensor
> +	- WLAN transmission power control
>  
>  A compatibility table by model and feature is maintained on the web
>  site, http://ibm-acpi.sf.net/. I appreciate any success or failure
> @@ -1447,6 +1448,23 @@ they differ between desk and lap mode.
>  The property is read-only. If the platform doesn't have support the sysfs
>  class is not created.
>  
> +WLAN transmission power control
> +--------------------------------
> +
> +sysfs: wlan_tx_strength_reduce
> +
> +Some newer Thinkpads have the WLAN antenna placed close to the WWAN antenna.
> +This interface will be used by userspace to reduce the WLAN Tx power strength
> +when WWAN is active, as is required for FCC certification.
> +
> +The available commands are::
> +
> +        echo '0' > /sys/devices/platform/thinkpad_acpi/wlan_tx_strength_reduce
> +        echo '1' > /sys/devices/platform/thinkpad_acpi/wlan_tx_strength_reduce
> +
> +The first command restores the wlan transmission power and the latter one
> +reduces wlan transmission power.
> +
>  EXPERIMENTAL: UWB
>  -----------------
>  
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index f3e8eca8d86d..6dbbd4a14264 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -9983,6 +9983,138 @@ static struct ibm_struct proxsensor_driver_data = {
>  	.exit = proxsensor_exit,
>  };
>  
> +/*************************************************************************
> + * DPRC(Dynamic Power Reduction Control) subdriver, for the Lenovo WWAN
> + * and WLAN feature.
> + */
> +#define DPRC_GET_WLAN_STATE             0x20000
> +#define DPRC_SET_WLAN_POWER_REDUCE      0x00030010
> +#define DPRC_SET_WLAN_POWER_FULL        0x00030100
> +static int has_wlantxreduce;
> +static int wlan_txreduce;
> +
> +static int dprc_command(int command, int *output)
> +{
> +	acpi_handle dprc_handle;
> +
> +	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "DPRC", &dprc_handle))) {
> +		/* Platform doesn't support DPRC */
> +		return -ENODEV;
> +	}
> +
> +	if (!acpi_evalf(dprc_handle, output, NULL, "dd", command))
> +		return -EIO;
> +
> +	/*
> +	 * METHOD_ERR gets returned on devices where few commands are not supported
> +	 * for example WLAN power reduce command is not supported on some devices.
> +	 */
> +	if (*output & METHOD_ERR)
> +		return -ENODEV;
> +
> +	return 0;
> +}
> +
> +static int get_wlan_state(int *has_wlantxreduce, int *wlan_txreduce)
> +{
> +	int output, err;
> +
> +	/* Get current WLAN Power Transmission state */
> +	err = dprc_command(DPRC_GET_WLAN_STATE, &output);
> +	if (err)
> +		return err;
> +
> +	if (output & BIT(4))
> +		*wlan_txreduce = 1;
> +	else if (output & BIT(8))
> +		*wlan_txreduce = 0;
> +	else
> +		*wlan_txreduce = -1;
> +
> +	*has_wlantxreduce = 1;
> +	return 0;
> +}
> +
> +/* sysfs wlan entry */
> +static ssize_t wlan_tx_strength_reduce_show(struct device *dev,
> +				struct device_attribute *attr,
> +				char *buf)
> +{
> +	int err;
> +
> +	err = get_wlan_state(&has_wlantxreduce, &wlan_txreduce);
> +	if (err)
> +		return err;
> +
> +	return sysfs_emit(buf, "%d\n", wlan_txreduce);
> +}
> +
> +static ssize_t wlan_tx_strength_reduce_store(struct device *dev,
> +				struct device_attribute *attr,
> +				const char *buf, size_t count)
> +{
> +	int output, err;
> +	unsigned long t;
> +
> +	if (parse_strtoul(buf, 1, &t))
> +		return -EINVAL;
> +
> +	tpacpi_disclose_usertask(attr->attr.name,
> +				"WLAN tx strength reduced %lu\n", t);
> +
> +	switch (t) {
> +	case 0:
> +		err = dprc_command(DPRC_SET_WLAN_POWER_FULL, &output);
> +		break;
> +	case 1:
> +		err = dprc_command(DPRC_SET_WLAN_POWER_REDUCE, &output);
> +		break;
> +	default:
> +		err = -EINVAL;
> +		dev_err(&tpacpi_pdev->dev, "Unknown operating mode. Ignoring\n");
> +		break;
> +	}
> +
> +	sysfs_notify(&tpacpi_pdev->dev.kobj, NULL, "wlan_tx_strength_reduce");
> +	return count;
> +}
> +static DEVICE_ATTR_RW(wlan_tx_strength_reduce);
> +
> +static int tpacpi_dprc_init(struct ibm_init_struct *iibm)
> +{
> +	int wlantx_err, err;
> +
> +	wlantx_err = get_wlan_state(&has_wlantxreduce, &wlan_txreduce);
> +	/*
> +	 * If support isn't available (ENODEV) for both devices then quit, but
> +	 * don't return an error.
> +	 */
> +	if (wlantx_err == -ENODEV)
> +		return 0;
> +	/* Otherwise, if there was an error return it */
> +	if (wlantx_err && (wlantx_err != -ENODEV))
> +		return wlantx_err;
> +
> +	if (has_wlantxreduce) {
> +		err = sysfs_create_file(&tpacpi_pdev->dev.kobj,
> +				&dev_attr_wlan_tx_strength_reduce.attr);
> +		if (err)
> +			return err;
> +	}
> +	return 0;
> +}
> +
> +static void dprc_exit(void)
> +{
> +	if (has_wlantxreduce)
> +		sysfs_remove_file(&tpacpi_pdev->dev.kobj, &dev_attr_wlan_tx_strength_reduce.attr);
> +}
> +
> +static struct ibm_struct dprc_driver_data = {
> +	.name = "dprc",
> +	.exit = dprc_exit,
> +};
> +
>  /****************************************************************************
>   ****************************************************************************
>   *
> @@ -10475,6 +10607,10 @@ static struct ibm_init_struct ibms_init[] __initdata = {
>  		.init = tpacpi_proxsensor_init,
>  		.data = &proxsensor_driver_data,
>  	},
> +	{
> +		.init = tpacpi_dprc_init,
> +		.data = &dprc_driver_data,
> +	},
>  };
>  
>  static int __init set_ibm_param(const char *val, const struct kernel_param *kp)
> 

