Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C846645025
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 Mar 2024 14:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711377782; cv=none; b=mII9XkWyrmPmppUd9feHnTSV48ZJJ1a/G3z/pmXn3WOQem5qqBXGJlSQAjxlgTXy2VqQnZaR9yHcA63CO6xwEsecceOqXJDSuJJR21Smfae/8vAN9YExCdpq+P1n2o7ni8hKkd3N8zPI3bNHyo/w6PmX4DlpSj2FZ2N6XeB1pWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711377782; c=relaxed/simple;
	bh=5jdIAyL5Nl52H2NC9rZQRRrPZk8Zr0XF/yLD5SU6UtI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=FfT/Yu7u60fnuSVInUpSpsW9wik5b/vW87mieFATu81JZu0lrlIgeBPnWksV5hxYZWI4kw9pNbnzv7xBI77Q/e+X9hY7hPfwbM9rrFL/txp9xSFTfk+v+03Z5eeQAJXaPpr5kAhVL2q0StcunMysKnERqzr8e365R96pEJdBVmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Hlxnc2R/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hlxnc2R/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711377778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ETN5NBRtpqJskURBjDW95adl4iwgaOcYeDShy16SJFU=;
	b=Hlxnc2R/DMzgNr7mKBygsNX03cDLuqztoed9MyQTgWoa0G5EYHGLevvwECkzHFqr3RSyML
	6kLa0vlYdqXwZ3wU6xXJlp+5TBhFwUv6x104IihefVug5PlpxYuhXnhf740uPi+SgBO31y
	hM2SMV6MCTLTM/HG9uZZMTwFZQVgEYs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-0ytj__qWMHqHPYbuIKgcig-1; Mon, 25 Mar 2024 10:42:57 -0400
X-MC-Unique: 0ytj__qWMHqHPYbuIKgcig-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-56beb0ad4c0so769839a12.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Mar 2024 07:42:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711377776; x=1711982576;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ETN5NBRtpqJskURBjDW95adl4iwgaOcYeDShy16SJFU=;
        b=YsXH5VMl8Ec5pT++SjQo4gexQtRxAN9TASk22IcmFfRvlgon3nLs+NYMNcD7h7JTqj
         nRLhSO/GYpJOzOGVAxb05+47wIATiNYJSWwcVE5vCpS9q1RguOV+zyNbSi3+toRMIyaN
         iSx5ok6Efsn4sSDN4gJ5kuCUi+Ac4B1CoN9HUPI6iZEEzOgKUK8fpmQHhRvqbxCnyEAI
         +no3CbxxWA99bQZDDek5Uj+H/M9AXApzL2HtippVaB8F9mjCq3tFQ54/nm22pdZwmzsn
         ml2ozDhGstYH0u+/63O98g1YNEqJRYqmUYy4Rf58qExpDrFFUjN9jlISj1tA2ke5pRis
         gXug==
X-Forwarded-Encrypted: i=1; AJvYcCUVwibzKh5+6JdZYuWZk1NpgVH9ff1eSBrzBXPr8hfEYbboZ+lHdPQ9iloBiTINfb6EQkCFmneTi1Id02tGv3JENRcOY0JpCVLgPoi4JP2X7YJiaA==
X-Gm-Message-State: AOJu0YyTxIfBqCChFWUODXButLyoXGY5Slux/ZkQwRLlZ8jxbCPK+M10
	2EQ28AKHTxvkY+NVg61he5R98/r5kis6O0h6Z3+aQlaYYtvL2YBbFAzfnEoamnakSt2E7dKoXXR
	fjk/Bl3WO9rG3isUc1OPtmI46Z7pCK59Q2wq1x4cvuGwJ0URGY75xb3ePoeI9bQkLTFwyOkM=
X-Received: by 2002:a05:6402:3591:b0:56b:fd17:3522 with SMTP id y17-20020a056402359100b0056bfd173522mr5015489edc.14.1711377776306;
        Mon, 25 Mar 2024 07:42:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/XqIZA8tExCVkcSHrmF8fMRmzzlmqLhgV0WMmh0Wu72gVutD20vblcpm8B0yWR/4m9okLEg==
X-Received: by 2002:a05:6402:3591:b0:56b:fd17:3522 with SMTP id y17-20020a056402359100b0056bfd173522mr5015472edc.14.1711377775967;
        Mon, 25 Mar 2024 07:42:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id g7-20020a056402320700b0056c0996bf72sm1794239eda.83.2024.03.25.07.42.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 07:42:55 -0700 (PDT)
Message-ID: <61bc04d2-1a0f-4a8c-9ec7-88bcc0bde169@redhat.com>
Date: Mon, 25 Mar 2024 15:42:55 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] platform/x86: uv_sysfs: use sysfs_emit() instead of
 sprintf()
Content-Language: en-US, nl
To: Ai Chao <aichao@kylinos.cn>, justin.ernst@hpe.com,
 ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240319070038.309683-1-aichao@kylinos.cn>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240319070038.309683-1-aichao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/19/24 8:00 AM, Ai Chao wrote:
> Follow the advice in Documentation/filesystems/sysfs.rst:
> show() should only use sysfs_emit() or sysfs_emit_at() when formatting
> the value to be returned to user space.
> 
> Signed-off-by: Ai Chao <aichao@kylinos.cn>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> ---
>  drivers/platform/x86/uv_sysfs.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/platform/x86/uv_sysfs.c b/drivers/platform/x86/uv_sysfs.c
> index 38d1b692d3c0..3f6d52dea5c9 100644
> --- a/drivers/platform/x86/uv_sysfs.c
> +++ b/drivers/platform/x86/uv_sysfs.c
> @@ -129,22 +129,22 @@ static ssize_t hub_location_show(struct uv_bios_hub_info *hub_info, char *buf)
>  
>  static ssize_t hub_partition_show(struct uv_bios_hub_info *hub_info, char *buf)
>  {
> -	return sprintf(buf, "%d\n", hub_info->f.fields.this_part);
> +	return sysfs_emit(buf, "%d\n", hub_info->f.fields.this_part);
>  }
>  
>  static ssize_t hub_shared_show(struct uv_bios_hub_info *hub_info, char *buf)
>  {
> -	return sprintf(buf, "%d\n", hub_info->f.fields.is_shared);
> +	return sysfs_emit(buf, "%d\n", hub_info->f.fields.is_shared);
>  }
>  static ssize_t hub_nasid_show(struct uv_bios_hub_info *hub_info, char *buf)
>  {
>  	int cnode = get_obj_to_cnode(hub_info->id);
>  
> -	return sprintf(buf, "%d\n", ordinal_to_nasid(cnode));
> +	return sysfs_emit(buf, "%d\n", ordinal_to_nasid(cnode));
>  }
>  static ssize_t hub_cnode_show(struct uv_bios_hub_info *hub_info, char *buf)
>  {
> -	return sprintf(buf, "%d\n", get_obj_to_cnode(hub_info->id));
> +	return sysfs_emit(buf, "%d\n", get_obj_to_cnode(hub_info->id));
>  }
>  
>  struct hub_sysfs_entry {
> @@ -304,12 +304,12 @@ struct uv_port {
>  
>  static ssize_t uv_port_conn_hub_show(struct uv_bios_port_info *port, char *buf)
>  {
> -	return sprintf(buf, "%d\n", port->conn_id);
> +	return sysfs_emit(buf, "%d\n", port->conn_id);
>  }
>  
>  static ssize_t uv_port_conn_port_show(struct uv_bios_port_info *port, char *buf)
>  {
> -	return sprintf(buf, "%d\n", port->conn_port);
> +	return sysfs_emit(buf, "%d\n", port->conn_port);
>  }
>  
>  struct uv_port_sysfs_entry {
> @@ -470,7 +470,7 @@ static ssize_t uv_pci_location_show(struct uv_pci_top_obj *top_obj, char *buf)
>  
>  static ssize_t uv_pci_iio_stack_show(struct uv_pci_top_obj *top_obj, char *buf)
>  {
> -	return sprintf(buf, "%d\n", top_obj->iio_stack);
> +	return sysfs_emit(buf, "%d\n", top_obj->iio_stack);
>  }
>  
>  static ssize_t uv_pci_ppb_addr_show(struct uv_pci_top_obj *top_obj, char *buf)
> @@ -480,7 +480,7 @@ static ssize_t uv_pci_ppb_addr_show(struct uv_pci_top_obj *top_obj, char *buf)
>  
>  static ssize_t uv_pci_slot_show(struct uv_pci_top_obj *top_obj, char *buf)
>  {
> -	return sprintf(buf, "%d\n", top_obj->slot);
> +	return sysfs_emit(buf, "%d\n", top_obj->slot);
>  }
>  
>  struct uv_pci_top_sysfs_entry {
> @@ -725,13 +725,13 @@ static void pci_topology_exit(void)
>  static ssize_t partition_id_show(struct kobject *kobj,
>  			struct kobj_attribute *attr, char *buf)
>  {
> -	return sprintf(buf, "%ld\n", sn_partition_id);
> +	return sysfs_emit(buf, "%ld\n", sn_partition_id);
>  }
>  
>  static ssize_t coherence_id_show(struct kobject *kobj,
>  			struct kobj_attribute *attr, char *buf)
>  {
> -	return sprintf(buf, "%ld\n", sn_coherency_id);
> +	return sysfs_emit(buf, "%ld\n", sn_coherency_id);
>  }
>  
>  static ssize_t uv_type_show(struct kobject *kobj,

