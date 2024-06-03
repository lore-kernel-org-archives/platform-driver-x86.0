Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5E83FBA7
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Jun 2024 09:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717408572; cv=none; b=Q40je86nVP9/Z5jWysduUPsqNSC2cRME3Km+0Y3sDQUvjLZyCo3sPRpvQpVDq5hjZttv79DhAxZrwRDtYCcbjDKOVH7VVy0CjsyONzhP0YsJxX2XE4jDzTTa2Z55M6cyNhMteyU8deE94i+Xa1cgC2EukjjOLrwDsxwhLDmgDo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717408572; c=relaxed/simple;
	bh=PMjK+KLl77YzoHb+FEHFo7PKU5+RwaJIEKLuac1VPwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cy+WM72BLATlHTmxrVIe7xOcqEBd0LNVOUqGRLftwEPMpjRC5gRBEKSqxbusqs3kOdNztPz/Xj20gw8FZ6zxYLYyCSRW9k2MQQ8QLxKnOh8vOv/JQ8j4xiT/7IydUgNUwQzQIzQ+UCEVohBozCEOckfaKJs4JBj7LYzYBerdwDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q9qTZIj3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q9qTZIj3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717408569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q1PCm2xaf5YJmMIBfGCQNf9GhmSy39Dl1iW2ZFEa2jc=;
	b=Q9qTZIj3OriC5qOkoaLGg/4QJJCdZsbJX1H/Y3+Mez1OsCERMtCQ62y0I4cE+e04pFDxsn
	yL+2wh7l6FAgSrwmVbJGCJfng4PJVoPCQ4gckucazP7ek0UodwDT8i829RPTL/jdpd+rqi
	k76JObzNu+jXRy5rHRxpaDDyeOO8gCs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-HBSI5_F0N769XwS-rqB1lg-1; Mon, 03 Jun 2024 05:56:05 -0400
X-MC-Unique: HBSI5_F0N769XwS-rqB1lg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a68ce57fb14so74841366b.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Jun 2024 02:56:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717408564; x=1718013364;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q1PCm2xaf5YJmMIBfGCQNf9GhmSy39Dl1iW2ZFEa2jc=;
        b=aNDDkbI9qGHkZtLvM6E2szKzWmL1IxsL/i9V4pMYCnMWg3QDI2xUCnPcVUBy4W0/sM
         ilkhFwIIG2yrbH+JQWVL7+Xg2cb7XMYpR99umg+Vmpi+YFdrHvwyWuOb3E2oHu6v35Zp
         tRnNvuypQzn1q5qGdvf7OIEuktRusUZ/uXz1WOADGd2dQOQ/rdUDZH0BNzcT6kO04V9t
         1DiAA4b1uLynnqarWLuthHdRsnraFJV5fkWBUY5v7idqgEZjmrUtII3innbu+T3t6GMj
         rR5N/Uev5qbL8wPrpM8rKiTUDew//W6nn72jgyO2PhzfHD/C5t2HG3WCtFbrv63nVAfQ
         xmpg==
X-Gm-Message-State: AOJu0YwelZB7qA4nxdFOu6CeDek9kSLiTfUYhtCv2hMIEbSbdzuXyMKd
	Hka15B+WUPtBP5XTZTlnC7Xl2upOSBKmNpvg5XFjb2VFN1OmqRccU9sRc4LNbgHmrqzBFTGDsLZ
	Q5Q6zVuDTn7/f0NiV7n1CSNqTB3fTMqyTCj6kxx0wwGTf8pS3hkH6vMU46UzKKTh5gJHXotA=
X-Received: by 2002:a17:907:7ea1:b0:a68:ea13:f68 with SMTP id a640c23a62f3a-a68ea131343mr279879466b.54.1717408564300;
        Mon, 03 Jun 2024 02:56:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWuRFY3ZUBvH5asyPgmDl2PAvt3sfRx7QBGchc3qg3zTbB4WTJ4nudg3EQQfkLme21VB/cuQ==
X-Received: by 2002:a17:907:7ea1:b0:a68:ea13:f68 with SMTP id a640c23a62f3a-a68ea131343mr279878266b.54.1717408563792;
        Mon, 03 Jun 2024 02:56:03 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a691bde21e2sm80180666b.104.2024.06.03.02.56.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 02:56:03 -0700 (PDT)
Message-ID: <138380cf-465a-4d0a-a4bc-657bfd83237e@redhat.com>
Date: Mon, 3 Jun 2024 11:56:02 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] platform/x86: dell-smbios: Fix wrong token data in
 sysfs
To: Armin Wolf <W_Armin@gmx.de>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240528204903.445546-1-W_Armin@gmx.de>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240528204903.445546-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/28/24 10:49 PM, Armin Wolf wrote:
> When reading token data from sysfs on my Inspiron 3505, the token
> locations and values are wrong. This happens because match_attribute()
> blindly assumes that all entries in da_tokens have an associated
> entry in token_attrs.
> 
> This however is not true as soon as da_tokens[] contains zeroed
> token entries. Those entries are being skipped when initialising
> token_attrs, breaking the core assumption of match_attribute().
> 
> Fix this by defining an extra struct for each pair of token attributes
> and use container_of() to retrieve token information.
> 
> Tested on a Dell Inspiron 3050.
> 
> Fixes: 33b9ca1e53b4 ("platform/x86: dell-smbios: Add a sysfs interface for SMBIOS tokens")
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
> Changes since v1:
> - remove style changes
> - improve sizeof() usage with pointer targets

Thank you for your patch-series, I've applied this series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans




> ---
>  drivers/platform/x86/dell/dell-smbios-base.c | 92 ++++++++------------
>  1 file changed, 36 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-smbios-base.c b/drivers/platform/x86/dell/dell-smbios-base.c
> index e61bfaf8b5c4..86b95206cb1b 100644
> --- a/drivers/platform/x86/dell/dell-smbios-base.c
> +++ b/drivers/platform/x86/dell/dell-smbios-base.c
> @@ -11,6 +11,7 @@
>   */
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> 
> +#include <linux/container_of.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/capability.h>
> @@ -25,11 +26,16 @@ static u32 da_supported_commands;
>  static int da_num_tokens;
>  static struct platform_device *platform_device;
>  static struct calling_interface_token *da_tokens;
> -static struct device_attribute *token_location_attrs;
> -static struct device_attribute *token_value_attrs;
> +static struct token_sysfs_data *token_entries;
>  static struct attribute **token_attrs;
>  static DEFINE_MUTEX(smbios_mutex);
> 
> +struct token_sysfs_data {
> +	struct device_attribute location_attr;
> +	struct device_attribute value_attr;
> +	struct calling_interface_token *token;
> +};
> +
>  struct smbios_device {
>  	struct list_head list;
>  	struct device *device;
> @@ -416,47 +422,26 @@ static void __init find_tokens(const struct dmi_header *dm, void *dummy)
>  	}
>  }
> 
> -static int match_attribute(struct device *dev,
> -			   struct device_attribute *attr)
> -{
> -	int i;
> -
> -	for (i = 0; i < da_num_tokens * 2; i++) {
> -		if (!token_attrs[i])
> -			continue;
> -		if (strcmp(token_attrs[i]->name, attr->attr.name) == 0)
> -			return i/2;
> -	}
> -	dev_dbg(dev, "couldn't match: %s\n", attr->attr.name);
> -	return -EINVAL;
> -}
> -
>  static ssize_t location_show(struct device *dev,
>  			     struct device_attribute *attr, char *buf)
>  {
> -	int i;
> +	struct token_sysfs_data *data = container_of(attr, struct token_sysfs_data, location_attr);
> 
>  	if (!capable(CAP_SYS_ADMIN))
>  		return -EPERM;
> 
> -	i = match_attribute(dev, attr);
> -	if (i > 0)
> -		return sysfs_emit(buf, "%08x", da_tokens[i].location);
> -	return 0;
> +	return sysfs_emit(buf, "%08x", data->token->location);
>  }
> 
>  static ssize_t value_show(struct device *dev,
>  			  struct device_attribute *attr, char *buf)
>  {
> -	int i;
> +	struct token_sysfs_data *data = container_of(attr, struct token_sysfs_data, value_attr);
> 
>  	if (!capable(CAP_SYS_ADMIN))
>  		return -EPERM;
> 
> -	i = match_attribute(dev, attr);
> -	if (i > 0)
> -		return sysfs_emit(buf, "%08x", da_tokens[i].value);
> -	return 0;
> +	return sysfs_emit(buf, "%08x", data->token->value);
>  }
> 
>  static struct attribute_group smbios_attribute_group = {
> @@ -473,22 +458,15 @@ static int build_tokens_sysfs(struct platform_device *dev)
>  {
>  	char *location_name;
>  	char *value_name;
> -	size_t size;
>  	int ret;
>  	int i, j;
> 
> -	/* (number of tokens  + 1 for null terminated */
> -	size = sizeof(struct device_attribute) * (da_num_tokens + 1);
> -	token_location_attrs = kzalloc(size, GFP_KERNEL);
> -	if (!token_location_attrs)
> +	token_entries = kcalloc(da_num_tokens, sizeof(*token_entries), GFP_KERNEL);
> +	if (!token_entries)
>  		return -ENOMEM;
> -	token_value_attrs = kzalloc(size, GFP_KERNEL);
> -	if (!token_value_attrs)
> -		goto out_allocate_value;
> 
>  	/* need to store both location and value + terminator*/
> -	size = sizeof(struct attribute *) * ((2 * da_num_tokens) + 1);
> -	token_attrs = kzalloc(size, GFP_KERNEL);
> +	token_attrs = kcalloc((2 * da_num_tokens) + 1, sizeof(*token_attrs), GFP_KERNEL);
>  	if (!token_attrs)
>  		goto out_allocate_attrs;
> 
> @@ -496,27 +474,32 @@ static int build_tokens_sysfs(struct platform_device *dev)
>  		/* skip empty */
>  		if (da_tokens[i].tokenID == 0)
>  			continue;
> +
> +		token_entries[i].token = &da_tokens[i];
> +
>  		/* add location */
>  		location_name = kasprintf(GFP_KERNEL, "%04x_location",
>  					  da_tokens[i].tokenID);
>  		if (location_name == NULL)
>  			goto out_unwind_strings;
> -		sysfs_attr_init(&token_location_attrs[i].attr);
> -		token_location_attrs[i].attr.name = location_name;
> -		token_location_attrs[i].attr.mode = 0444;
> -		token_location_attrs[i].show = location_show;
> -		token_attrs[j++] = &token_location_attrs[i].attr;
> +
> +		sysfs_attr_init(&token_entries[i].location_attr.attr);
> +		token_entries[i].location_attr.attr.name = location_name;
> +		token_entries[i].location_attr.attr.mode = 0444;
> +		token_entries[i].location_attr.show = location_show;
> +		token_attrs[j++] = &token_entries[i].location_attr.attr;
> 
>  		/* add value */
>  		value_name = kasprintf(GFP_KERNEL, "%04x_value",
>  				       da_tokens[i].tokenID);
>  		if (value_name == NULL)
>  			goto loop_fail_create_value;
> -		sysfs_attr_init(&token_value_attrs[i].attr);
> -		token_value_attrs[i].attr.name = value_name;
> -		token_value_attrs[i].attr.mode = 0444;
> -		token_value_attrs[i].show = value_show;
> -		token_attrs[j++] = &token_value_attrs[i].attr;
> +
> +		sysfs_attr_init(&token_entries[i].value_attr.attr);
> +		token_entries[i].value_attr.attr.name = value_name;
> +		token_entries[i].value_attr.attr.mode = 0444;
> +		token_entries[i].value_attr.show = value_show;
> +		token_attrs[j++] = &token_entries[i].value_attr.attr;
>  		continue;
> 
>  loop_fail_create_value:
> @@ -532,14 +515,12 @@ static int build_tokens_sysfs(struct platform_device *dev)
> 
>  out_unwind_strings:
>  	while (i--) {
> -		kfree(token_location_attrs[i].attr.name);
> -		kfree(token_value_attrs[i].attr.name);
> +		kfree(token_entries[i].location_attr.attr.name);
> +		kfree(token_entries[i].value_attr.attr.name);
>  	}
>  	kfree(token_attrs);
>  out_allocate_attrs:
> -	kfree(token_value_attrs);
> -out_allocate_value:
> -	kfree(token_location_attrs);
> +	kfree(token_entries);
> 
>  	return -ENOMEM;
>  }
> @@ -551,12 +532,11 @@ static void free_group(struct platform_device *pdev)
>  	sysfs_remove_group(&pdev->dev.kobj,
>  				&smbios_attribute_group);
>  	for (i = 0; i < da_num_tokens; i++) {
> -		kfree(token_location_attrs[i].attr.name);
> -		kfree(token_value_attrs[i].attr.name);
> +		kfree(token_entries[i].location_attr.attr.name);
> +		kfree(token_entries[i].value_attr.attr.name);
>  	}
>  	kfree(token_attrs);
> -	kfree(token_value_attrs);
> -	kfree(token_location_attrs);
> +	kfree(token_entries);
>  }
> 
>  static int __init dell_smbios_init(void)
> --
> 2.39.2
> 

