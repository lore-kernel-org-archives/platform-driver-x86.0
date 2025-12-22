Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A068252917;
	Mon, 22 Dec 2025 14:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766414481; cv=none; b=b9kTGsWnbodx+Zu10PgPQ8l1PPKTrMIHb59D6Hb6LaTPpzZZpC/v/jnEunemdHinx30IeIHTxbpm1NZFUh06RKD7HU5u8HP6IIJm2kq3GfLG7gjftVWTz/pVEc1YpMEslcpD08tUomGsU+dRBLG73vn1PS5cJq9zcBsbdWx5usA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766414481; c=relaxed/simple;
	bh=qYxwWlzlV8VryzF8wa3TfBZSOXy8qpGaQwJLhULJ1yE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=NIWXNcrWM0f4cKBh5RoI03vGgnPLbAWD9cJHtvcPM9DQC0aMkz+SlSXVM+eeDm6vv60Xm6BQcz9ZAI/OAMXhHDmXFBA0sogwfWfdF4hBY+DI/wzQrtIzPM+2F7VzcPvJ1QO0wM/EQfAY3l0CAqDraS4N9gl+lz0ONvWN7BRAeqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d7bATgDa; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d7bATgDa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766414479; x=1797950479;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=qYxwWlzlV8VryzF8wa3TfBZSOXy8qpGaQwJLhULJ1yE=;
  b=d7bATgDaQidZt1ocSQCm49Z4pIVdcCSegAwHpIR0lj1RREnz3+zvpQFI
   D6wwoqfBxMN07K4l/n8kibuoFpKQjRANo0ILLyCQOHpmrNJX4IXAOo+yJ
   CHHInavicfO/Sj3DjgXlHK3kDsOunhB+A0RecPxAHKjd4SWVvmC9klctv
   HOSXdE2jBDwGLUzmcJdN9OYuu3HbCfDn7krULPqk+o70+rodqPX/DwXKV
   UvXsuLFp6cfdaEptixsMAZEFs7eCJmzColw8z1uvpRIFhhL0R1rY6VB+w
   rghMvPL5Tpd/uo9IP9L4Y6wXrDJ+lhLSYIA5MmtRTnfnaSRwpnbTej2yC
   g==;
X-CSE-ConnectionGUID: px5qbRPGS3Gx/gmZKvWz4A==
X-CSE-MsgGUID: wrDVvXFxQpitZwua3Dsakw==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68150749"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="68150749"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 06:41:19 -0800
X-CSE-ConnectionGUID: ENBfs1KFQIyvYYL16ucRfg==
X-CSE-MsgGUID: 3sGJXZzRSPOdCr4EJdXG/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="200042477"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 06:41:16 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 22 Dec 2025 16:41:12 +0200 (EET)
To: Junrui Luo <moonafterrain@outlook.com>
cc: Jorge Lopez <jorge.lopez2@hp.com>, Hans de Goede <hansg@kernel.org>, 
    =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    Yuhao Jiang <danisjiang@gmail.com>
Subject: Re: [PATCH] platform/x86: hp-bioscfg: Fix out-of-bounds array access
 in ACPI package parsing
In-Reply-To: <SYBPR01MB78816A828BF586364CF7A4FFAFA6A@SYBPR01MB7881.ausprd01.prod.outlook.com>
Message-ID: <9a1f0216-9445-f1a1-6ccd-e59e03b184d7@linux.intel.com>
References: <SYBPR01MB78816A828BF586364CF7A4FFAFA6A@SYBPR01MB7881.ausprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 4 Dec 2025, Junrui Luo wrote:

> The hp_populate_*_elements_from_package() functions in the hp-bioscfg
> driver contain out-of-bounds array access vulnerabilities.
> 
> The fix changes the bounds check to validate the actual accessed index.

Thanks for the patch. Unfortunately this description is too vague. Please 
explain things more precisely, with name references to related variables, 
etc. so a reviewer / person looking this change later in the git history 
does not have to figure out the entire function (there's quite much code 
in there so it's not all that obvious).

While I could probably have figured this out by figuring out those 
functions during review but I ended up not doing it because this 
information should be present in the changelog as well.

-- 
 i.

> Reported-by: Yuhao Jiang <danisjiang@gmail.com>
> Reported-by: Junrui Luo <moonafterrain@outlook.com>
> Fixes: e6c7b3e15559 ("platform/x86: hp-bioscfg: string-attributes")
> Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
> ---
>  drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c       | 4 ++--
>  drivers/platform/x86/hp/hp-bioscfg/int-attributes.c        | 2 +-
>  drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c | 5 +++++
>  drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c  | 5 +++++
>  drivers/platform/x86/hp/hp-bioscfg/string-attributes.c     | 2 +-
>  5 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
> index c50ad5880503..f346aad8e9d8 100644
> --- a/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
> +++ b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
> @@ -207,7 +207,7 @@ static int hp_populate_enumeration_elements_from_package(union acpi_object *enum
>  		case PREREQUISITES:
>  			size = min_t(u32, enum_data->common.prerequisites_size, MAX_PREREQUISITES_SIZE);
>  			for (reqs = 0; reqs < size; reqs++) {
> -				if (elem >= enum_obj_count) {
> +				if (elem + reqs >= enum_obj_count) {
>  					pr_err("Error enum-objects package is too small\n");
>  					return -EINVAL;
>  				}
> @@ -255,7 +255,7 @@ static int hp_populate_enumeration_elements_from_package(union acpi_object *enum
>  
>  			for (pos_values = 0; pos_values < size && pos_values < MAX_VALUES_SIZE;
>  			     pos_values++) {
> -				if (elem >= enum_obj_count) {
> +				if (elem + pos_values >= enum_obj_count) {
>  					pr_err("Error enum-objects package is too small\n");
>  					return -EINVAL;
>  				}
> diff --git a/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
> index 6c7f4d5fa9cb..63b1fda2be4e 100644
> --- a/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
> +++ b/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
> @@ -227,7 +227,7 @@ static int hp_populate_integer_elements_from_package(union acpi_object *integer_
>  			size = min_t(u32, integer_data->common.prerequisites_size, MAX_PREREQUISITES_SIZE);
>  
>  			for (reqs = 0; reqs < size; reqs++) {
> -				if (elem >= integer_obj_count) {
> +				if (elem + reqs >= integer_obj_count) {
>  					pr_err("Error elem-objects package is too small\n");
>  					return -EINVAL;
>  				}
> diff --git a/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
> index c6e57bb9d8b7..6a31f47ce3f5 100644
> --- a/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
> +++ b/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
> @@ -216,6 +216,11 @@ static int hp_populate_ordered_list_elements_from_package(union acpi_object *ord
>  			size = min_t(u32, ordered_list_data->common.prerequisites_size,
>  				     MAX_PREREQUISITES_SIZE);
>  			for (reqs = 0; reqs < size; reqs++) {
> +				if (elem + reqs >= order_obj_count) {
> +					pr_err("Error elem-objects package is too small\n");
> +					return -EINVAL;
> +				}
> +
>  				ret = hp_convert_hexstr_to_str(order_obj[elem + reqs].string.pointer,
>  							       order_obj[elem + reqs].string.length,
>  							       &str_value, &value_len);
> diff --git a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
> index 187b372123ed..ec79d9d50377 100644
> --- a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
> +++ b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
> @@ -303,6 +303,11 @@ static int hp_populate_password_elements_from_package(union acpi_object *passwor
>  				     MAX_PREREQUISITES_SIZE);
>  
>  			for (reqs = 0; reqs < size; reqs++) {
> +				if (elem + reqs >= password_obj_count) {
> +					pr_err("Error elem-objects package is too small\n");
> +					return -EINVAL;
> +				}
> +
>  				ret = hp_convert_hexstr_to_str(password_obj[elem + reqs].string.pointer,
>  							       password_obj[elem + reqs].string.length,
>  							       &str_value, &value_len);
> diff --git a/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
> index 27758b779b2d..7b885d25650c 100644
> --- a/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
> +++ b/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
> @@ -217,7 +217,7 @@ static int hp_populate_string_elements_from_package(union acpi_object *string_ob
>  				     MAX_PREREQUISITES_SIZE);
>  
>  			for (reqs = 0; reqs < size; reqs++) {
> -				if (elem >= string_obj_count) {
> +				if (elem + reqs >= string_obj_count) {
>  					pr_err("Error elem-objects package is too small\n");
>  					return -EINVAL;
>  				}
> 
> ---
> base-commit: 4a26e7032d7d57c998598c08a034872d6f0d3945
> change-id: 20251204-fixes-a7747a291dc9
> 
> Best regards,
> 
