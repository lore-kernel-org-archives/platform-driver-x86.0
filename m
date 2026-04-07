Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AAE175A63;
	Tue,  7 Apr 2026 14:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775571596; cv=none; b=jAqqiuVTHjvcg4bcyQH1eA+GO5b5XunJAqEylt5yjR5e2YbKYSel6NdmWbCrOmWw7pNgPEeDLYl8THnRFGin6tJJabSoALWrCmpyLA4/J29pasQ8P2zbZth754e74DKSVz0YPBhPxTTKzOxl+m6SjVBrZtkacqdoOYZvn62qOUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775571596; c=relaxed/simple;
	bh=nqI5YMH/6ik1AFcBX93m4HF1/Pphpm5Mg0S3oIhJ6ps=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DCPqMTogdgB8chBOaG22wFPBNL1ApXaiewxrlTFe/p3XTfWK/S1fNIJH7dnNUbuBdqy8mRjqo2AwaLYe+/0P3E5yMxwv23YUjUtt/rzyl9lIdn+iWqixADNN7mMWPbJGmRx5qSl3yt6JxPfTZ4EDbEtACeFwhckDOg4phTkkmOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T4/Nm28J; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T4/Nm28J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775571596; x=1807107596;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=nqI5YMH/6ik1AFcBX93m4HF1/Pphpm5Mg0S3oIhJ6ps=;
  b=T4/Nm28JcHQrVxiSMsAR0zwb+inaYvLtG7wGEXII8e1j6TtkC+o9VCa4
   7GMNwcPKkKB7yuBdYp4g9NywuZYT8zDBxSc7eilY95dHE78Hj8QKBtD6o
   Pu6BbrDXdSTr8ROnF814RCL9tt7r8ZlOm6uP/RCZLTc4FNDr71mdcoTvX
   Uf7os8hjOsWqS+eNKXb4k2QNFKPvnX1jNjbBVmHoAGxoa9zfY76rdw8XN
   7SEdgDIP3idb5Bt3YVS0JRlT8zJr0MHKoCryWiP4FnVtld8LnoExzbOzm
   kQjMwKRpGX4qvn6aT3vxjhnH1JfWykdHOE3ayoPIehJVuCAN3UE37FHmh
   Q==;
X-CSE-ConnectionGUID: siStw81XRleW+mM2l2jZww==
X-CSE-MsgGUID: zOuwjwYoTH6mmrM8F2WrVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76420260"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="76420260"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 07:19:55 -0700
X-CSE-ConnectionGUID: lEhjo7tZQQCmPDSWRhKn4g==
X-CSE-MsgGUID: Onizkyb/Royh5chCQwexmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="223883165"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.110])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 07:19:52 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 7 Apr 2026 17:19:49 +0300 (EEST)
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
cc: prasanth.ksr@dell.com, Hans de Goede <hansg@kernel.org>, 
    divya.bharathi@dell.com, mario.limonciello@dell.com, 
    Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: dell-wmi-sysman: bound enumeration string
 aggregation
In-Reply-To: <20260329030948.32467-1-pengpeng@iscas.ac.cn>
Message-ID: <7a55f2f6-38dd-298a-d036-3e528f542c52@linux.intel.com>
References: <20260329030948.32467-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 29 Mar 2026, Pengpeng Hou wrote:

> populate_enum_data() aggregates firmware-provided value-modifier and possible-value strings into fixed 512-byte struct members. The current code bounds each individual source string but then appends every string and separator with raw strcat() and no remaining-space check.
> 
> Switch the aggregation loops to a bounded append helper and reject enumeration packages whose combined strings do not fit in the destination buffers.

Please fold changelog paragraphs to 72 chars.
 
> Fixes: e8a60aa7404b ("platform/x86: Introduce support for Systems Management Driver over WMI for Dell Systems")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  .../dell/dell-wmi-sysman/enum-attributes.c    | 34 +++++++++++++++----
>  1 file changed, 28 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c b/drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c
> index 09996fbdc707..14decb219128 100644
> --- a/drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c
> +++ b/drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c
> @@ -10,6 +10,26 @@
>  
>  get_instance_id(enumeration);
>  
> +static int append_enum_string(char *dest, const char *src)
> +{
> +	size_t dest_len = strlen(dest);
> +	ssize_t copied;
> +
> +	if (dest_len >= MAX_BUFF)

Doesn't this imply that something is already broken (buggy) if we blew 
past the allocated buffer? If so, I suppose it would warrant 
WARN_ON_ONCE() if something caused such invalid string in dest.

> +		return -EINVAL;
> +
> +	copied = strscpy(dest + dest_len, src, MAX_BUFF - dest_len);
> +	if (copied < 0)
> +		return -EINVAL;
> +
> +	dest_len += copied;
> +	copied = strscpy(dest + dest_len, ";", MAX_BUFF - dest_len);
> +	if (copied < 0)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
>  static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
>  {
>  	int instance_id = get_enumeration_instance_id(kobj);
> @@ -176,9 +196,10 @@ int populate_enum_data(union acpi_object *enumeration_obj, int instance_id,
>  			return -EINVAL;
>  		if (check_property_type(enumeration, next_obj, ACPI_TYPE_STRING))
>  			return -EINVAL;
> -		strcat(wmi_priv.enumeration_data[instance_id].dell_value_modifier,
> -			enumeration_obj[next_obj++].string.pointer);
> -		strcat(wmi_priv.enumeration_data[instance_id].dell_value_modifier, ";");
> +		if (append_enum_string(
> +			    wmi_priv.enumeration_data[instance_id].dell_value_modifier,
> +			    enumeration_obj[next_obj++].string.pointer))
> +			return -EINVAL;
>  	}
>  
>  	if (next_obj >= enum_property_count)
> @@ -193,9 +214,10 @@ int populate_enum_data(union acpi_object *enumeration_obj, int instance_id,
>  			return -EINVAL;
>  		if (check_property_type(enumeration, next_obj, ACPI_TYPE_STRING))
>  			return -EINVAL;
> -		strcat(wmi_priv.enumeration_data[instance_id].possible_values,
> -			enumeration_obj[next_obj++].string.pointer);
> -		strcat(wmi_priv.enumeration_data[instance_id].possible_values, ";");
> +		if (append_enum_string(
> +			    wmi_priv.enumeration_data[instance_id].possible_values,
> +			    enumeration_obj[next_obj++].string.pointer))
> +			return -EINVAL;
>  	}
>  
>  	return sysfs_create_group(attr_name_kobj, &enumeration_attr_group);
> 

-- 
 i.

