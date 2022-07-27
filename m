Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F2FC04A68
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Jul 2022 21:12:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231858AbiG0VMa (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Jul 2022 17:12:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232024AbiG0VM0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Jul 2022 17:12:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E33CB4B4AA
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Jul 2022 14:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658956345;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=On8DHf21XyNU9V+4JH/QNp7k6hyx6DD4crh5APEkmKM=;
        b=DtLkKgqmJeIAyzdz72+QOfELaNc9D0QKWBjaNjW/CPp+Gca0JV33YyNXWJ/LSjm7fE6r8L
        E+q4JTXkoxAKLkG2aJ89DDCm2O/DcPqv7iGQi1T2wYJCND6DR9vLvD/GCRnQA0PIvkAyG7
        SXiCEX8TJ4hX6Rgzv+a5d4qiFJzdu7w=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-bNrD5ckWP3yOPt4PDY4MXg-1; Wed, 27 Jul 2022 17:12:22 -0400
X-MC-Unique: bNrD5ckWP3yOPt4PDY4MXg-1
Received: by mail-ed1-f72.google.com with SMTP id dz20-20020a0564021d5400b0043be2c5cd32so7310824edb.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Jul 2022 14:12:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=On8DHf21XyNU9V+4JH/QNp7k6hyx6DD4crh5APEkmKM=;
        b=nYjHp+n1x93V1ro1E58Zt0DAHjSVjiUKmMk1HhtizuYfKDd2kf6Kpa7u3qF/gCNRDB
         PwFydLjsTLgw6Vn5rLHrRZI/4OMBOF9/1SyJIKoMA2CzoRpklVqX81YTOrb9BrPs3u7S
         doCXSozPwZx2hmT25RJ6j5MNcw7E3zrrIoj9vxU0OqcSkciqA5bI0yTINpgCrGwH8+cq
         W8auPIdKZ/2FapgOj2KMc8rPwQp9zGv4bxWwIqCa7Hn8O6TUOWnfKGlt4Nn7KNFso7zw
         dKPVjEfHg7LbmsZ1Dlr6+y3s+AGB/IxFG7X7uT0StpAVpzDD93y0v214E5Nc/qfGGCzs
         jfJg==
X-Gm-Message-State: AJIora9ey4l3piDttUxJYfIwkiR8ZFCzdHZ+qomfUUUOGeaSAmk4k/7I
        YwBn56kQ9WNBNE8xPIdtad/fHwWF038IL3J9Q6ZRNLGnIkBSmRESkFAeqyNfZ3RzBvcpSe8kO+p
        0oyIULAaSb/8eAqgCYoC7VCstLZ6Aa3H3Wg==
X-Received: by 2002:a17:906:cc5d:b0:72b:1313:cd09 with SMTP id mm29-20020a170906cc5d00b0072b1313cd09mr18740977ejb.482.1658956340631;
        Wed, 27 Jul 2022 14:12:20 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sKdi+09S4rXsuHoZpM94eDF989kSj0CZV0NwjCeZScMzuSBAlRnP1hTrURcNy+bXiFMS0ovA==
X-Received: by 2002:a17:906:cc5d:b0:72b:1313:cd09 with SMTP id mm29-20020a170906cc5d00b0072b1313cd09mr18740951ejb.482.1658956340110;
        Wed, 27 Jul 2022 14:12:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id qc3-20020a170906d8a300b0072b36cbcdaasm7951818ejb.92.2022.07.27.14.12.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 14:12:19 -0700 (PDT)
Message-ID: <074a54e2-d71b-8b57-c691-97ee492b0d78@redhat.com>
Date:   Wed, 27 Jul 2022 23:12:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 10/15] platform/x86/amd/pmf: Add sysfs to toggle CnQF
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
 <20220712145847.3438544-11-Shyam-sundar.S-k@amd.com>
 <85479b1e-08d2-49da-f9ba-894594270113@redhat.com>
In-Reply-To: <85479b1e-08d2-49da-f9ba-894594270113@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/27/22 22:52, Hans de Goede wrote:
> Hi,
> 
> On 7/12/22 16:58, Shyam Sundar S K wrote:
>> Whether to turn CnQF on/off by default upon driver load would be decided
>> by a BIOS flag. Add a sysfs node to provide a way to the user whether to
>> use static slider or CnQF .
>>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> 
> Thanks, patch looks good to me:
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Thinking more about this, there are userspace API questions here, see
my reply to patch 9/15.

Also ...

>> ---
>>  drivers/platform/x86/amd/pmf/cnqf.c | 52 +++++++++++++++++++++++++++++
>>  1 file changed, 52 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
>> index 8c6756faab25..2b03ae1ad37f 100644
>> --- a/drivers/platform/x86/amd/pmf/cnqf.c
>> +++ b/drivers/platform/x86/amd/pmf/cnqf.c
>> @@ -302,9 +302,59 @@ void amd_pmf_load_defaults_cnqf(struct amd_pmf_dev *dev)
>>  		config_store.trans_prio[i] = i;
>>  }
>>  
>> +static ssize_t feat_store(struct device *dev,
>> +				  struct device_attribute *attr,
>> +				  const char *buf, size_t count)
>> +{
>> +	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
>> +	int result, src;
>> +	bool enabled;
>> +	u8 mode;
>> +
>> +	result = kstrtobool(buf, &enabled);
>> +	if (result)
>> +		return result;
>> +
>> +	src = amd_pmf_get_power_source();
>> +	pdev->cnqf_feat = enabled;
>> +	if (pdev->cnqf_feat) {
>> +		amd_pmf_handle_cnqf(pdev, SLIDER_OP_SET, src, config_store.current_mode, NULL);
>> +	} else {
>> +		pdev->cnqf_running = false;
>> +		mode = amd_pmf_get_pprof_modes(pdev);
>> +		amd_pmf_update_slider(pdev, SLIDER_OP_SET, mode, NULL);

This assumes that the static slider is always available on systems
with CnQF support, which is not checked anywhere.

Also work_buffer is still running here which will reset cnqf_running = true
after its first run, so this does not disable CnQF at all.

But maybe that is a bug in the amd_pmf_trans_cnqf() function ?

Maybe that function should not touch the cnqf_running flag; and it should
keep gathering statistics even when CqNF is disabled, but not actually
set the profile ?

Regards,

Hans



>> +	}
>> +
>> +	dev_dbg(pdev->dev, "Received CnQF %s\n", enabled ? "on" : "off");
>> +	return count;
>> +}
>> +
>> +static ssize_t feat_show(struct device *dev,
>> +				 struct device_attribute *attr,
>> +				 char *buf)
>> +{
>> +	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
>> +
>> +	return sprintf(buf, "%s\n", pdev->cnqf_feat ? "on" : "off");
>> +}
>> +
>> +static DEVICE_ATTR_RW(feat);
>> +
>> +static struct attribute *cnqf_feature_attrs[] = {
>> +	&dev_attr_feat.attr,
>> +	NULL
>> +};
>> +
>> +static const struct attribute_group cnqf_feature_attribute_group = {
>> +	.attrs = cnqf_feature_attrs,
>> +	.name = "cnqf"
>> +};
>> +
>>  void amd_pmf_deinit_cnqf(struct amd_pmf_dev *dev)
>>  {
>>  	cancel_delayed_work_sync(&dev->work_buffer);
>> +	sysfs_remove_group(&dev->dev->kobj, &cnqf_feature_attribute_group);
>> +	kobject_uevent(&dev->dev->kobj, KOBJ_CHANGE);
>>  }
>>  
>>  void amd_pmf_init_cnqf(struct amd_pmf_dev *dev)
>> @@ -324,4 +374,6 @@ void amd_pmf_init_cnqf(struct amd_pmf_dev *dev)
>>  	/* update the thermal for CnQF */
>>  	src = amd_pmf_get_power_source();
>>  	amd_pmf_handle_cnqf(dev, SLIDER_OP_SET, src, config_store.current_mode, NULL);
>> +	ret = sysfs_create_group(&dev->dev->kobj, &cnqf_feature_attribute_group);
>> +	kobject_uevent(&dev->dev->kobj, KOBJ_CHANGE);
>>  }

