Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179A317C211;
	Mon, 29 Dec 2025 14:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767017649; cv=none; b=AFPWpfvFhEAvqOnyzZRh83rl1RG2DSg8BmJoR7gSorkFY1B62EYQahYUAQxb9a33sjp+YbBtGU16nCcS73FdAQ2EJ2jhoSs7V5ooOsxIG7jLA4BPM+A3kzyYunBssamKQ1E3Z6/GaLffg184V7p+kFSL5Sef8YMexhEksEfc+ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767017649; c=relaxed/simple;
	bh=KUD0fQNa2Ze2Ce0WPSxr+mkgSJWKzQXsBRhV4ekH0aI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=NaE66qbPZFtGU7DEXMdwB2hHm/v4JhqcOy/sBehB/dH6i5rL2wUH7F21X5/J14YMuuHs0madgiM3/Tbx/cc9ZGx526ckxzdsdPZM9Q+EFUuHoOKTp6xBRACDGt3g+Wnd6a5tfz0sZMklgQ8oiJ4Gn2l0dK/W2mO4UluyiErT5Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lnDPlcyx; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lnDPlcyx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767017647; x=1798553647;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=KUD0fQNa2Ze2Ce0WPSxr+mkgSJWKzQXsBRhV4ekH0aI=;
  b=lnDPlcyxlnjApuFGLSOVR+o+afT9ih1zhwEf8ugUvCLUri6VhMXXA4KK
   /5/R8ejoM9xzfbpyYuacmmjNGNOq3SOmjtjAGakM5hivrQNx0beMOQYV8
   FqDYnd+azNUkTXsfOyNzyFENIi0RsH5KRdi3BtOCt/KdFrZ9JPzZwy5Kx
   2KJDZ1kryrjSCDasRwIWN9lP3CIjUsla9V+g562QO2CKwCzMfEmMD+w5x
   n5+2iFWz4iqKyRKjcr9yjdqB4L6yUhrgJ5eAnSTynOX1vTSmBceV9RrCj
   NTCZsMZFUHxiI4tcllFBrQLF4HTgzIEsN/k3ClxLGbdTDVfOxMOdpenvF
   w==;
X-CSE-ConnectionGUID: 6OyT0OxCT2a5ma6H1or46A==
X-CSE-MsgGUID: GXIkAvyZRaCKePpSwHfeZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="79742088"
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="79742088"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 06:14:06 -0800
X-CSE-ConnectionGUID: 1TpNIV1VQuqKfGqyYl2KUA==
X-CSE-MsgGUID: cJQmzNDyTtik+hoamlqOdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="205827756"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.30])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 06:14:03 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 29 Dec 2025 16:14:00 +0200 (EET)
To: Junrui Luo <moonafterrain@outlook.com>, Jorge Lopez <jorge.lopez2@hp.com>, 
    Jorge Lopez <jorgealtxwork@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, 
    =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    Yuhao Jiang <danisjiang@gmail.com>
Subject: Re: [PATCH v2] platform/x86: hp-bioscfg: Fix out-of-bounds array
 access in ACPI package parsing
In-Reply-To: <SYBPR01MB788173D7DD4EA2CB6383683DAFB0A@SYBPR01MB7881.ausprd01.prod.outlook.com>
Message-ID: <0d39773f-d464-ba9f-2bb9-fef83643011b@linux.intel.com>
References: <SYBPR01MB788173D7DD4EA2CB6383683DAFB0A@SYBPR01MB7881.ausprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 26 Dec 2025, Junrui Luo wrote:

> The hp_populate_*_elements_from_package() functions in the hp-bioscfg
> driver contain out-of-bounds array access vulnerabilities.
> 
> These functions parse ACPI packages into internal data structures using
> a for loop with index variable 'elem' that iterates through
> enum_obj/integer_obj/order_obj/password_obj/string_obj arrays.
> 
> When processing multi-element fields like PREREQUISITES and
> ENUM_POSSIBLE_VALUES, these functions read multiple consecutive array
> elements using expressions like 'enum_obj[elem + reqs]' and
> 'enum_obj[elem + pos_values]' within nested loops.
> 
> The bug is that the bounds check only validated elem, but did not consider
> the additional offset when accessing elem + reqs or elem + pos_values.
> 
> The fix changes the bounds check to validate the actual accessed index.
> 
> Reported-by: Yuhao Jiang <danisjiang@gmail.com>
> Reported-by: Junrui Luo <moonafterrain@outlook.com>
> Fixes: e6c7b3e15559 ("platform/x86: hp-bioscfg: string-attributes")
> Signed-off-by: Junrui Luo <moonafterrain@outlook.com>

Hi,

Thanks for the update, I've now applied this to the review-ilpo-fixes 
branch.

However, I still find multiple eyerising points in these copy-pasted 
blocks. This code was originally added half-baked with outstanding 
comments from me about the unreasonable use of copy-paste (IIRC, Hans 
didn't notice my outstanding comments from an earlier version):

- Why are there number of variations what is done when 
  hp_convert_hexstr_to_str() fails between the different types, some 
  return -EINVAL, some do continue, some break?!?
- Should these obj_count checks actually occur before the loop?
  (-EINVAL is returned, so why do part of the work at all?)

(IMO, this whole code under case PREREQUISITES: should have been put 
into a helper, perhaps a macro if function is not viable to avoid code 
variations such as those fixed by this patch. IIRC, there was other use 
of copy-paste as well.)

-- 
 i.

> ---
> Changes in v2:
> - Add a more detailed description
> - Link to v1: https://lore.kernel.org/all/SYBPR01MB78816A828BF586364CF7A4FFAFA6A@SYBPR01MB7881.ausprd01.prod.outlook.com/
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
> base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
> change-id: 20251226-fixes-91414deb7fd9
> 
> Best regards,
> 
