Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A5D1C636D7
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Feb 2023 20:25:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233241AbjBJUZo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 10 Feb 2023 15:25:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233725AbjBJUZn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Feb 2023 15:25:43 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11BA381CC3
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Feb 2023 12:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676060599;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6Nj61cEDvibF3n56qcA4WtEZ3A4kBflX60XKmu9h6zs=;
        b=GEkSA44gRolQ1mWwFmdPoett1rJ51dR9Ou4XDk0KwxJF3ppuHePRYBAnLTOrxj3ZcSaaDZ
        v0VWJe4FNV1C+aW7zy/ecF9SlStQiKNvNSveUHPtcntaXEhLCABp//dZckXoDpbdSnbVdC
        OVhg1jTl6Ue1b1DTtnZ17YkUqbtyCC8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-157-HKgv7SYzOISdRP8DKrfopQ-1; Fri, 10 Feb 2023 15:23:17 -0500
X-MC-Unique: HKgv7SYzOISdRP8DKrfopQ-1
Received: by mail-ej1-f71.google.com with SMTP id l18-20020a1709067d5200b008af415fdd80so3578266ejp.21
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Feb 2023 12:23:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Nj61cEDvibF3n56qcA4WtEZ3A4kBflX60XKmu9h6zs=;
        b=ME8LN5+IP/8RlpJIGHpf6VacX7Ik1sT/h0S8zh8mWGUDnnHK/I+GzZ9XLOskH8gdXO
         VMtXcsPphzLKCYarvpJx3toRRI30gvln4JbplDKyGXLur6pGg2KTxpMUVaF7K6tFoSop
         tTBQmJFufngK7QvmMO3YtzcXL1T9wWORwZlYNu+ecmHRilRSZKulFZD/WojebqH3qjbp
         1FT5Io59zEL+fwsHABWMbxf/sHw8ie2rOE+Oaay1d4W/35xilHNAr/wVZEzUOzrZ0eYW
         62tqsft4+pb05ZjxeD5bwLBXXwHgB2EN2wLTDfIVsb3lA2IXT77eBUsmFqNiFA9SOjn3
         /1Xw==
X-Gm-Message-State: AO0yUKVEcnRQt7kgv8HE+1G4USQeBQg5atxWLr+qYG+vHqGjG01aW7h/
        tilvpTmV/6aA0ftOwvNjDWk5eVZpvamOtSJH5OrZCfMUeobCelD+OV0Otd24ORY4zZ+iV98dsAf
        OVpb0dcS8E+eKibMP39F1niwNmqaBSvMFGw==
X-Received: by 2002:a50:d491:0:b0:4a2:4ed3:c151 with SMTP id s17-20020a50d491000000b004a24ed3c151mr18835924edi.39.1676060596853;
        Fri, 10 Feb 2023 12:23:16 -0800 (PST)
X-Google-Smtp-Source: AK7set+UEtHNZWa0vhA3Z45KVymOLTHrItou05mOhniDawu7MF4x+7b/fQUl3fHEGQh2Pb+J3yk2dg==
X-Received: by 2002:a50:d491:0:b0:4a2:4ed3:c151 with SMTP id s17-20020a50d491000000b004a24ed3c151mr18835900edi.39.1676060596598;
        Fri, 10 Feb 2023 12:23:16 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id v12-20020a50d08c000000b004ab1e47f788sm2649495edd.75.2023.02.10.12.23.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 12:23:16 -0800 (PST)
Message-ID: <86054431-8d45-adea-121d-ff39d04d95cc@redhat.com>
Date:   Fri, 10 Feb 2023 21:23:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH 7/9] apple-gmux: add sysfs interface
From:   Hans de Goede <hdegoede@redhat.com>
To:     Orlando Chamberlain <orlandoch.dev@gmail.com>,
        platform-driver-x86@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Gross <markgross@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Hawking Zhang <Hawking.Zhang@amd.com>,
        Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
        Lijo Lazar <lijo.lazar@amd.com>,
        YiPeng Chai <YiPeng.Chai@amd.com>,
        Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Bokun Zhang <Bokun.Zhang@amd.com>,
        Jack Xiao <Jack.Xiao@amd.com>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Rander Wang <rander.wang@intel.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>,
        Yong Zhi <yong.zhi@intel.com>, Evan Quan <evan.quan@amd.com>,
        Kerem Karabay <kekrby@gmail.com>,
        Aditya Garg <gargaditya08@live.com>,
        Aun-Ali Zaidi <admin@kodeit.net>
References: <20230210044826.9834-1-orlandoch.dev@gmail.com>
 <20230210044826.9834-8-orlandoch.dev@gmail.com>
 <3e6c6cba-ad53-d380-a028-840fb19dbfcb@redhat.com>
Content-Language: en-US, nl
In-Reply-To: <3e6c6cba-ad53-d380-a028-840fb19dbfcb@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/10/23 21:15, Hans de Goede wrote:
> Hi,
> 
> On 2/10/23 05:48, Orlando Chamberlain wrote:
>> Allow reading gmux ports from userspace. When the unsafe module
>> parameter allow_user_writes is true, writing 1 byte
>> values is also allowed.
>>
>> For example:
>>
>> cd /sys/bus/acpi/devices/APP000B:00/physical_node/
>> echo 4 > gmux_selected_port
>> cat gmux_selected_port_data | xxd -p
>>
>> Will show the gmux version information (00000005 in this case)
> 
> Please use debugfs for this and as part of the conversion
> drop the #ifdef-s (debugfs has stubs for when not enabled)
> and drop all the error checking of creating the files, debugfs
> is deliberately designed to not have any error checking in
> the setup / teardown code.
> 
> This also removes the need for the allow_user_writes parameter
> replacing it with the new kernel lockdown mechanism. debugfs
> will automatically block access to writable files when
> the kernel is in lockdown mode.
> 
> Regards,
> 
> Hans

p.s.

I just realized I forgot my usual thank you for contributing
to the kernel reply to the cover letter before diving into
the review (oops).

So let me correct that: thank you very much for your work on this!

Regards,

Hans






>> Signed-off-by: Orlando Chamberlain <orlandoch.dev@gmail.com>
>> ---
>>  drivers/platform/x86/apple-gmux.c | 129 ++++++++++++++++++++++++++++++
>>  1 file changed, 129 insertions(+)
>>
>> diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
>> index c38d6ef0c15a..756059d48393 100644
>> --- a/drivers/platform/x86/apple-gmux.c
>> +++ b/drivers/platform/x86/apple-gmux.c
>> @@ -66,6 +66,11 @@ struct apple_gmux_data {
>>  	enum vga_switcheroo_client_id switch_state_external;
>>  	enum vga_switcheroo_state power_state;
>>  	struct completion powerchange_done;
>> +
>> +#ifdef CONFIG_SYSFS
>> +	/* sysfs data */
>> +	int selected_port;
>> +#endif /* CONFIG_SYSFS */
>>  };
>>  
>>  static struct apple_gmux_data *apple_gmux_data;
>> @@ -651,6 +656,121 @@ static void gmux_notify_handler(acpi_handle device, u32 value, void *context)
>>  		complete(&gmux_data->powerchange_done);
>>  }
>>  
>> +/**
>> + * DOC: Sysfs Interface
>> + *
>> + * gmux ports can be read from userspace as a sysfs interface. For example:
>> + *
>> + * # echo 4 > /sys/bus/acpi/devices/APP000B:00/physical_node/gmux_selected_port
>> + * # cat /sys/bus/acpi/devices/APP000B:00/physical_node/gmux_selected_port_data | xxd -p
>> + * 00000005
>> + *
>> + * Reads 4 bytes from port 4 (GMUX_PORT_VERSION_MAJOR).
>> + *
>> + * Single byte writes are also supported, however this must be enabled with the
>> + * unsafe allow_user_writes module parameter.
>> + *
>> + */
>> +
>> +#ifdef CONFIG_SYSFS
>> +
>> +static bool allow_user_writes;
>> +module_param_unsafe(allow_user_writes, bool, 0);
>> +MODULE_PARM_DESC(allow_user_writes, "Allow userspace to write to gmux ports (default: false) (bool)");
>> +
>> +static ssize_t gmux_selected_port_store(struct device *dev,
>> +		struct device_attribute *attr, const char *sysfsbuf, size_t count)
>> +{
>> +	struct apple_gmux_data *gmux_data = dev_get_drvdata(dev);
>> +	u8 port;
>> +
>> +	if (kstrtou8(sysfsbuf, 10, &port) < 0)
>> +		return -EINVAL;
>> +
>> +	/* On pio gmux's, make sure the user doesn't access too high of a port. */
>> +	if ((gmux_data->config == &apple_gmux_pio) &&
>> +		port > (gmux_data->iolen - 4))
>> +		return -EINVAL;
>> +
>> +	gmux_data->selected_port = port;
>> +	return count;
>> +}
>> +
>> +static ssize_t gmux_selected_port_show(struct device *dev,
>> +		struct device_attribute *attr, char *sysfsbuf)
>> +{
>> +	struct apple_gmux_data *gmux_data = dev_get_drvdata(dev);
>> +
>> +	return sysfs_emit(sysfsbuf, "%d\n", gmux_data->selected_port);
>> +}
>> +
>> +DEVICE_ATTR_RW(gmux_selected_port);
>> +
>> +static ssize_t gmux_selected_port_data_store(struct device *dev,
>> +		struct device_attribute *attr, const char *sysfsbuf, size_t count)
>> +{
>> +	struct apple_gmux_data *gmux_data = dev_get_drvdata(dev);
>> +
>> +	if (count == 1)
>> +		gmux_write8(gmux_data, gmux_data->selected_port, *sysfsbuf);
>> +	else
>> +		return -EINVAL;
>> +
>> +	return count;
>> +}
>> +
>> +static ssize_t gmux_selected_port_data_show(struct device *dev,
>> +		struct device_attribute *attr, char *sysfsbuf)
>> +{
>> +	struct apple_gmux_data *gmux_data = dev_get_drvdata(dev);
>> +	u32 data;
>> +
>> +	data = gmux_read32(gmux_data, gmux_data->selected_port);
>> +	memcpy(sysfsbuf, &data, sizeof(data));
>> +
>> +	return sizeof(data);
>> +}
>> +
>> +struct device_attribute dev_attr_gmux_selected_port_data_rw = __ATTR_RW(gmux_selected_port_data);
>> +struct device_attribute dev_attr_gmux_selected_port_data_ro = __ATTR_RO(gmux_selected_port_data);
>> +
>> +static int gmux_init_sysfs(struct pnp_dev *pnp)
>> +{
>> +	int ret;
>> +
>> +	ret = device_create_file(&pnp->dev, &dev_attr_gmux_selected_port);
>> +	if (ret)
>> +		return ret;
>> +	if (allow_user_writes)
>> +		ret = device_create_file(&pnp->dev, &dev_attr_gmux_selected_port_data_rw);
>> +	else
>> +		ret = device_create_file(&pnp->dev, &dev_attr_gmux_selected_port_data_ro);
>> +	if (ret)
>> +		device_remove_file(&pnp->dev, &dev_attr_gmux_selected_port);
>> +	return ret;
>> +}
>> +
>> +static void gmux_fini_sysfs(struct pnp_dev *pnp)
>> +{
>> +	device_remove_file(&pnp->dev, &dev_attr_gmux_selected_port);
>> +	if (allow_user_writes)
>> +		device_remove_file(&pnp->dev, &dev_attr_gmux_selected_port_data_rw);
>> +	else
>> +		device_remove_file(&pnp->dev, &dev_attr_gmux_selected_port_data_ro);
>> +}
>> +
>> +#else
>> +
>> +static int gmux_init_sysfs(struct pnp_dev *pnp)
>> +{
>> +	return 0;
>> +}
>> +static void gmux_fini_sysfs(struct pnp_dev *pnp)
>> +{
>> +}
>> +
>> +#endif /* CONFIG_SYSFS */
>> +
>>  static int gmux_suspend(struct device *dev)
>>  {
>>  	struct pnp_dev *pnp = to_pnp_dev(dev);
>> @@ -846,8 +966,16 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
>>  		goto err_register_handler;
>>  	}
>>  
>> +	ret = gmux_init_sysfs(pnp);
>> +	if (ret) {
>> +		pr_err("Failed to register gmux sysfs entries\n");
>> +		goto err_sysfs;
>> +	}
>> +
>>  	return 0;
>>  
>> +err_sysfs:
>> +	vga_switcheroo_unregister_handler();
>>  err_register_handler:
>>  	gmux_disable_interrupts(gmux_data);
>>  	apple_gmux_data = NULL;
>> @@ -877,6 +1005,7 @@ static void gmux_remove(struct pnp_dev *pnp)
>>  {
>>  	struct apple_gmux_data *gmux_data = pnp_get_drvdata(pnp);
>>  
>> +	gmux_fini_sysfs(pnp);
>>  	vga_switcheroo_unregister_handler();
>>  	gmux_disable_interrupts(gmux_data);
>>  	if (gmux_data->gpe >= 0) {
> 

