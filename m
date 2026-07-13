Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A7A37E2E1
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 11:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783941688; cv=none; b=XSFOldQVlFdh8Mep4QLMN0i76qk+N3glJm+0QCGIxhbNpHR/llsX2juQNblRaPyk+8CWP4o1CLTaCOSjYj5OWQ0sKXpishPMpzIvuOoWIoelktjHJuOdDlb+mx8v3ySYWKMnYGwpVmsdcygRXbOLeggyKmeANAHmCadbH2/cX8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783941688; c=relaxed/simple;
	bh=5WCNWVZ2S2jw6M8YnFQYPb3ywdOCYs+b68joq1EkSPk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Bzgdp5JTNU8I0+K6nZMTfuu1ioxxBWkPTxC3bQ4Z3gU/qH92nzX6E1DXjdyuqnO6H6gAvqe3vMqZgIzAHkCZhnVSwhc+acryTeK+Edu/+H65FQBql2Hnac2t+evionR0VwhdQ9G/x4DcgclWgLYTsPXCNPA0is6VhyXjAlIFMvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GND2ZoyH; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GND2ZoyH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783941687; x=1815477687;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=5WCNWVZ2S2jw6M8YnFQYPb3ywdOCYs+b68joq1EkSPk=;
  b=GND2ZoyHxBKXu3LjeLT2zJ6XPrr88J5re0ydRrMH7NM6NgCAGSP64PpA
   98SSrLznJws6w6ON6Hu2JVmwjalQRpB0giAR+/mNa/cQENBMcwsvrTdwU
   hiCExOTAfd6HLZ4OHjUy3LkYJrojDPYSXJ9pwwFiaKwz1IZzWVity6+fb
   44OAALEks8Pk5oKbLsrvzoRFzuXTpcACLOVn3e7kxq7SWkCukcIhRw6pI
   d100y4R560CIypY0UUG99fq0WgVjtzBrnCGJQ4zTufhSFb17TADdC+Gn9
   ZhQ9sSLU2A8Q6chtGfGYPr2MmWHAus3frqpUl79nqxNrKnU4zSEo1Swgv
   Q==;
X-CSE-ConnectionGUID: x5d7M7TCQfqn22aFQP5hyw==
X-CSE-MsgGUID: GdShQ4A5Ssmis6rGxyUmTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84426251"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84426251"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 04:21:26 -0700
X-CSE-ConnectionGUID: gD+RJJkDR+yYJGltR0YgTA==
X-CSE-MsgGUID: 2LRMSnmnSAClFemhnSWcFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259384666"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.129])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 04:21:25 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 13 Jul 2026 14:21:20 +0300 (EEST)
To: yahia <yahia.a.abdrabou@gmail.com>
cc: platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/3] hp-wmi: refactor to use __free
In-Reply-To: <20260712191130.41183-2-yahia.a.abdrabou@gmail.com>
Message-ID: <d5341fb7-25d4-e746-38a1-552e36f829cf@linux.intel.com>
References: <20260712191130.41183-1-yahia.a.abdrabou@gmail.com> <20260712191130.41183-2-yahia.a.abdrabou@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 12 Jul 2026, yahia wrote:

> From: yahia ahmed <yahia.a.abdrabou@gmail.com>
> 
> hp_wmi_query_perform currently() uses the out_free label to exit the
> function and free the memory, but doesn't use the __free cleanup

__free()

More generally, please include () into names which are directly 
referencing a C function name, macro, etc. that have parenthesis in their 
name in C as well.

> attribute to simply the processes of exiting and freeing memory.
> 
> Signed-off-by: yahia ahmed <yahia.a.abdrabou@gmail.com>
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 20 +++++++-------------
>  1 file changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 8ba286ed8721..c924fbb5503f 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -581,8 +581,8 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
>  {
>  	struct acpi_buffer input, output = { ACPI_ALLOCATE_BUFFER, NULL };
>  	struct bios_return *bios_return;
> -	union acpi_object *obj = NULL;
> -	struct bios_args *args = NULL;
> +	union acpi_object *obj __free(kfree) = NULL;
> +	struct bios_args *args __free(kfree) = NULL;
>  	int mid, actual_insize, actual_outsize;
>  	size_t bios_args_size;
>  	int ret;
> @@ -608,18 +608,16 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
>  
>  	ret = wmi_evaluate_method(HPWMI_BIOS_GUID, 0, mid, &input, &output);
>  	if (ret)
> -		goto out_free;
> +		return ret;
>  
>  	obj = output.pointer;
>  	if (!obj) {
> -		ret = -EINVAL;
> -		goto out_free;
> +		return -EINVAL;
>  	}
>  
>  	if (obj->type != ACPI_TYPE_BUFFER) {
>  		pr_warn("query 0x%x returned an invalid object 0x%x\n", query, ret);
> -		ret = -EINVAL;
> -		goto out_free;
> +		return -EINVAL;
>  	}
>  
>  	bios_return = (struct bios_return *)obj->buffer.pointer;
> @@ -629,20 +627,16 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
>  		if (ret != HPWMI_RET_UNKNOWN_COMMAND &&
>  		    ret != HPWMI_RET_UNKNOWN_CMDTYPE)
>  			pr_warn("query 0x%x returned error 0x%x\n", query, ret);
> -		goto out_free;
> +		return ret;
>  	}
>  
>  	/* Ignore output data of zero size */
>  	if (!outsize)
> -		goto out_free;
> +		return ret;
>  
>  	actual_outsize = min(outsize, (int)(obj->buffer.length - sizeof(*bios_return)));
>  	memcpy(buffer, obj->buffer.pointer + sizeof(*bios_return), actual_outsize);
>  	memset(buffer + actual_outsize, 0, outsize - actual_outsize);
> -
> -out_free:
> -	kfree(obj);
> -	kfree(args);
>  	return ret;

Can't this now be return 0; ?

-- 
 i.

