Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25FA233733
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Mar 2025 11:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741174655; cv=none; b=nTmn7VB80necloJPOig/5nbUGJso6c9K6C6Mc3m0pLk+O5UCkKL2x4bFZRZSUIItgJAnvVajPbbMRUwVvw3TXILlaTHo2o0Z95v7NygESgJYKzmPGwRl/qJIYeXZSQ+n00UhGjdDJTpoa1rkuC9bytiyRJ935984CR/yriJzCoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741174655; c=relaxed/simple;
	bh=w1zs0s53BjvIVKG5JLFecJgMXnzvr5rW68RODm/zAGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MeRqwbdhMMMU/flCTGj78Ad/Rtbv6k85txC6jtU94g8vP0YhYJIrvyoCU3MXfXRbcPu/C5htU+L0w7FsbcY85n2BtrVVWHM0jiMccVPk9A+qfcL6KEIZCDqZ9hlw78JAwcwuK6C/1Jf8IWVTvNrl3Q+9XnGpz5SGW1DtFRC/5zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XewaFlyY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XewaFlyY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741174652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YpWTzpxBLEnQJns4RP/LsZzHqEk4J0vD1x4Ly1ln6+U=;
	b=XewaFlyYxa1yD14P0VoT1BXfQbe0apoZ4+8sTI9k+Exmwt3ymKW8Esc/SMUI3dsQhaduK0
	gsqDAal1FYtM8Cn2UCJR87Wsjq/Jhzyj9oTE4qUY2NfY7+d+gBCIweQlE8wZ2VK8Xo4Eb5
	YrxnwxRtqwR/Enn6PHfvS89HxqOa6gw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-eXSL9OnvPWqkuRpcyGUMjw-1; Wed, 05 Mar 2025 06:37:26 -0500
X-MC-Unique: eXSL9OnvPWqkuRpcyGUMjw-1
X-Mimecast-MFC-AGG-ID: eXSL9OnvPWqkuRpcyGUMjw_1741174645
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac21873859aso59345966b.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 05 Mar 2025 03:37:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741174645; x=1741779445;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YpWTzpxBLEnQJns4RP/LsZzHqEk4J0vD1x4Ly1ln6+U=;
        b=XEx8U60eZS1PylfPfVhla1sU+28HVRnDqbB89Z8elTqyu8o/1bGAL4cb+L/fapwdfc
         qhTax0bF4Dl6OaThoOVbL0M1LnGjSCdHGgfAuBvtIdO17JYzLsoPacRP9lkqS2vwhH4+
         8zdGp4ivvDUNETpxUiupVE0k5609QnAs3ZWzY+w1atRe/xoZf+dYe3hSOBJrP6agLvfR
         96L6P7yNpj/xzPqZ68pKY3X9Be4vxgVNDF4ax46TJI5RPO0b6cXvRJHdE0Tsbh3Ekb3c
         ldyqDYA3+CbF1AsSR0ktNvJpmMqpIz3oai78Yn83u/adm7kVGJtWTOmm/SpD5I9r/0I5
         IpAw==
X-Gm-Message-State: AOJu0YzwaMmiXLWaSYmMKKR5qRrCPLqp2IH7uvhRfIleE54NnZOXnP0H
	Qel0scUAkbYeQNxdOYZQH2kAxcdAeTxPA4XWMovgU/we+5AiXTRzCbOxPIiCfeufK8UOzZNUlMX
	ITf5b43+1vP7DFMF7nsLJwGKgJVY6ZosXoolXeqjwyN8G4bbiwvFyRSrivSaR/+RIjC7sOzI=
X-Gm-Gg: ASbGncsfMfr2wjvh0ya4RNexfqtyILi7jbITvGMTRnkFiyERPnm7sUR+yKv83izEq+e
	zuqDp1hXdujXoWqeBoy89GN6DiOrt3/ZqSu+1YHn5skliWUNCJpjcmszPwuJfL3u2nCo641wf3m
	b8iAh+UD1gPto9obM86KiWdvcJ5rPxQy67haIMtD8DAA+q2wPMneWQcvb/ewId6b3BBWbVMaWzV
	EwX55Tit23Mwbp7+jE27/90hvf13OpYIt1vLiKIX8XuJpgdcR/lBvF7+PgFnFpmwYZ/1KgCXCBw
	nFLP76KgiHLtnAlP4PUBSsAh6yoFu7eWofjB834799dkYfkIs5RkAtfmo6yqXZXRtwVxuJoBkZO
	H1/zOqigT44V56SDTr+whqLakTB5DlnUdyIpr8NktMeR4lSZOOkwjiUDX0Oi4huSWgA==
X-Received: by 2002:a17:907:2d21:b0:ac1:de84:dea1 with SMTP id a640c23a62f3a-ac20da878e7mr288838666b.43.1741174645121;
        Wed, 05 Mar 2025 03:37:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEn2fTEi1XfV8aqSw2zYnOzYdQ8RDqzxm6GhrXG0VCSnNWZhob/ImwbXjXzOGAfScAecHnEaA==
X-Received: by 2002:a17:907:2d21:b0:ac1:de84:dea1 with SMTP id a640c23a62f3a-ac20da878e7mr288834766b.43.1741174644586;
        Wed, 05 Mar 2025 03:37:24 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf67fa3c05sm628915166b.72.2025.03.05.03.37.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 03:37:24 -0800 (PST)
Message-ID: <f853b726-898c-4400-ab5a-50d3c19caea9@redhat.com>
Date: Wed, 5 Mar 2025 12:37:23 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Add new sysfs to check user
 presence sensing status
To: Mark Pearson <mpearson-lenovo@squebb.ca>, Nitin Joshi
 <nitjoshi@gmail.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>, ibm-acpi-devel@lists.sourceforge.net,
 linux-doc@vger.kernel.org, Nitin Joshi1 <njoshi1@lenovo.com>
References: <20250305023319.6318-1-nitjoshi@gmail.com>
 <0cedc065-8cb7-4ef8-8989-6b113eb43460@app.fastmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <0cedc065-8cb7-4ef8-8989-6b113eb43460@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Nitin, Mark,

On 5-Mar-25 4:20 AM, Mark Pearson wrote:
> 
> On Tue, Mar 4, 2025, at 9:33 PM, Nitin Joshi wrote:
>> Some Thinkpad products support Human Presence Detection (HPD) features.
>> Add new sysfs entry so that userspace can determine if feature is
>> supported or not.
>>
>> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> 
> Just in case we're breaking protocol - I have reviewed this off mailing list with Nitin and gave it the thumbs up. The tag is correct.

Adding a Reviewed-by tag based on internal reviews done before
submitting v1 is fine, no worries.

I do wonder what the use-case for this exactly is?

The current documentation of "so that userspace can determine if
feature related to HPD should be enabled or disabled."

is a bit vague. The reason I'm asking is because I'm wondering
if this is the best API to expose this to userspace.

Also if I understand things correctly this is only about checking
if:

1) There is HPD support on the machine at all (if yes this file
will exist)
2) If HPD is supported on this machine, is it also enabled or
disabled in the BIOS?

IOW this is not about actually getting the HPD result,
which would be "human present" or "human not present", right ?

Any plans to export the actual HPD result ?

Also if this is just about checking the BIOS setting why not
just use the think-lmi driver / firmware-attribute sysfs API
for that ?


>> Signed-off-by: Nitin Joshi <nitjoshi@gmail.com>
>> ---
>>  .../admin-guide/laptops/thinkpad-acpi.rst     | 20 +++++
>>  drivers/platform/x86/thinkpad_acpi.c          | 79 +++++++++++++++++++
>>  2 files changed, 99 insertions(+)
>>
>> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst 
>> b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>> index 4ab0fef7d440..02e6c4306f90 100644
>> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>> @@ -1576,6 +1576,26 @@ percentage level, above which charging will stop.
>>  The exact semantics of the attributes may be found in
>>  Documentation/ABI/testing/sysfs-class-power.
>>
>> +User Presence Sensing Detection
>> +------
>> +
>> +sysfs: hpd_bios_enabled
>> +
>> +Some Thinkpad products support Human Presence Detection (HPD) features.
>> +Added new sysfs entry so that userspace can determine if feature related to
>> +HPD should be enabled or disabled.

"Added new sysfs entry ..." sounds more like something for a commit
message then for in an ABI Documentation file. In 5 years the "adding
new sysfs" language is going to look really weird in this file.

Please just describe the function + intended uses without using
"Adding new".

>> +
>> +The available commands are::
>> +
>> +        cat /sys/devices/platform/thinkpad_acpi/hpd_bios_enabled
>> +
>> +BIOS status is mentioned as below:
>> +- 0 = Disable
>> +- 1 = Enable
>> +
>> +The property is read-only. If the platform doesn't have support the sysfs
>> +class is not created.
>> +
>>  Multiple Commands, Module Parameters
>>  ------------------------------------
>>
>> diff --git a/drivers/platform/x86/thinkpad_acpi.c 
>> b/drivers/platform/x86/thinkpad_acpi.c
>> index 72a10ed2017c..daf31b2a4c73 100644
>> --- a/drivers/platform/x86/thinkpad_acpi.c
>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>> @@ -11039,6 +11039,80 @@ static const struct attribute_group 
>> auxmac_attr_group = {
>>  	.attrs = auxmac_attributes,
>>  };
>>
>> +/*************************************************************************
>> + * CHPD subdriver, for the Lenovo Human Presence Detection feature.
>> + */
>> +#define CHPD_GET_SENSOR_STATUS           0x00200000
>> +#define CHPD_GET_BIOS_UI_STATUS          0x00100000
>> +
>> +static bool has_user_presence_sensing;
>> +static int hpd_bios_status;
>> +static int chpd_command(int command, int *output)
>> +{
>> +	acpi_handle chpd_handle;
>> +
>> +	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "CHPD", &chpd_handle))) {
>> +		/* Platform doesn't support CHPD */
>> +		return -ENODEV;
>> +	}
>> +
>> +	if (!acpi_evalf(chpd_handle, output, NULL, "dd", command))
>> +		return -EIO;
>> +
>> +	return 0;
>> +}
>> +
>> +/* sysfs hpd bios status */
>> +static ssize_t hpd_bios_enabled_show(struct device *dev,
>> +				struct device_attribute *attr,
>> +				char *buf)
>> +{
>> +	return sysfs_emit(buf, "%d\n", hpd_bios_status);
>> +}
>> +static DEVICE_ATTR_RO(hpd_bios_enabled);
>> +
>> +static struct attribute *chpd_attributes[] = {
>> +	&dev_attr_hpd_bios_enabled.attr,
>> +	NULL
>> +};
>> +
>> +static umode_t chpd_attr_is_visible(struct kobject *kobj,
>> +					struct attribute *attr, int n)
>> +{
>> +	return has_user_presence_sensing ? attr->mode : 0;
>> +}
>> +
>> +static const struct attribute_group chpd_attr_group = {
>> +	.is_visible = chpd_attr_is_visible,
>> +	.attrs = chpd_attributes,
>> +};
>> +
>> +static int tpacpi_chpd_init(struct ibm_init_struct *iibm)
>> +{
>> +	int err, output;
>> +
>> +	err = chpd_command(CHPD_GET_SENSOR_STATUS, &output);
>> +	if (err)
>> +		return err;
>> +
>> +	if (output == 1)
>> +		return -ENODEV;
>> +
>> +	has_user_presence_sensing = true;
>> +	/* Get User Presence Sensing BIOS status */
>> +	err = chpd_command(CHPD_GET_BIOS_UI_STATUS, &output);
>> +	if (err)
>> +		return err;
>> +
>> +	hpd_bios_status = (output >> 1) & BIT(0);

Please add a define for this rather then just hardcoding
a shift by 1.

>> +
>> +	return err;
>> +}
>> +
>> +static struct ibm_struct chpd_driver_data = {
>> +	.name = "chpd",
>> +};
>> +
>>  /* --------------------------------------------------------------------- */
>>
>>  static struct attribute *tpacpi_driver_attributes[] = {
>> @@ -11098,6 +11172,7 @@ static const struct attribute_group *tpacpi_groups[] = {
>>  	&kbdlang_attr_group,
>>  	&dprc_attr_group,
>>  	&auxmac_attr_group,
>> +	&chpd_attr_group,
>>  	NULL,
>>  };
>>
>> @@ -11694,6 +11769,10 @@ static struct ibm_init_struct ibms_init[] 
>> __initdata = {
>>  		.init = auxmac_init,
>>  		.data = &auxmac_data,
>>  	},
>> +	{
>> +		.init = tpacpi_chpd_init,
>> +		.data = &chpd_driver_data,
>> +	},
>>  };
>>
>>  static int __init set_ibm_param(const char *val, const struct kernel_param *kp)
>> -- 
>> 2.43.0
> 


Regards,

Hans

