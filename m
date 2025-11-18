Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0518834165F
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Nov 2025 10:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763461099; cv=none; b=LQo+pqxTmoDptm6YsGN+XPxh2JHY+uZzh7mt73lh/epZ8UZXhcB2LEyVvDI1ykKm3aYo7xAI6346Z73oKGwy5WpYk2ry/6GOmR+XrlPpAXQ2F/0UBqM3Lf9X6MxLTYwB56Pefmx29PjAAUJsAPdVAPTYlnKQ+lU47o3YMefgv9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763461099; c=relaxed/simple;
	bh=Fgtagc1Nzgw/qnCR6hDAtveAVFKq9fyFWPTRqal/oe0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=BGxnUM9ifYdkJWHkuajHSotDPp9TAyBT5vp0AutyQrONvhmATTOGwzaNohMavIXVDvRlmLP4107psJtUUx2BpB1wv5Guy28KzeMmqwpS5lL4HG1Wr5Q/vAAhUtz7m687+i9cU+vkc6GOEanL4Qgnw40aNMfuDi9W8woRfFI0DlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z969R9sJ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z969R9sJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763461096; x=1794997096;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Fgtagc1Nzgw/qnCR6hDAtveAVFKq9fyFWPTRqal/oe0=;
  b=Z969R9sJVSZo0fC/DsEo9mqQAbzF8Qmu7BG97Lr19/WW64b1sPreo2SE
   fiZJEs4twN5r49qtS7SiPdlsZH9iRHrTYTiB/PDsy4y8wRVSsFKA1dIOG
   xPVE9lOx5DOmobniTwrkKipAHx8bEN4TvFLeoN3A/pQnYNmEZlHkTymed
   +R1ZklfLGm/cBuvrPhWoyO//SzsQhQhq67DDBI63xKOdw8iyjDMsXZYr2
   kIgv1nWmGo0h2cb90dILpmL9sDNtXHO0tiG97mOuW514MVCJ6uPdv3QVa
   2tRoCgNufLALdJKVaAMwFili7ectrAUSV4PGSMaiHyJw7v1WhhIIR+ECQ
   g==;
X-CSE-ConnectionGUID: 6vYRHdmvTq6qqQgFMnjNgw==
X-CSE-MsgGUID: DNu2VATpQ92hPQAQ+v4x3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="69347408"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="69347408"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 02:18:12 -0800
X-CSE-ConnectionGUID: 3MWPa/TvTmWTSJy5kAurAA==
X-CSE-MsgGUID: ziXLr6BXQMeWMJRdnW9KGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="195033549"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.74])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 02:18:10 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 18 Nov 2025 12:18:06 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, Mario Limonciello <superm1@kernel.org>, 
    Yijun Shen <Yijun.Shen@Dell.com>
Subject: Re: [PATCH v3 1/2] platform/x86/amd/pmf: Add BIOS_INPUTS_MAX macro
 to replace hardcoded array size
In-Reply-To: <20251107110105.4010694-1-Shyam-sundar.S-k@amd.com>
Message-ID: <42ca4926-2d23-c1f8-c999-b7746cc33b16@linux.intel.com>
References: <20251107110105.4010694-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-630730872-1763461086=:1205"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-630730872-1763461086=:1205
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 7 Nov 2025, Shyam Sundar S K wrote:

> Define a new macro BIOS_INPUTS_MAX, to represent the maximum number of
> BIOS input values. Replace hardcoded array sizes in relevant structures
> with this macro to improve readability and maintainability.
>=20
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Tested-by: Yijun Shen <Yijun.Shen@Dell.com>
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
> v3:
>  - No change
>=20
> v2:
>  - New patch spinned from v1
>  - Add new BIOS_INPUTS_MAX macro and replace hardcoded values
>=20
>  drivers/platform/x86/amd/pmf/pmf.h | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/am=
d/pmf/pmf.h
> index bd19f2a6bc78..2145df4128cd 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -119,6 +119,7 @@ struct cookie_header {
> =20
>  #define APTS_MAX_STATES=09=0916
>  #define CUSTOM_BIOS_INPUT_BITS=09GENMASK(16, 7)
> +#define BIOS_INPUTS_MAX=09=0910
> =20
>  typedef void (*apmf_event_handler_t)(acpi_handle handle, u32 event, void=
 *data);
> =20
> @@ -204,7 +205,7 @@ struct apmf_sbios_req_v1 {
>  =09u8 skin_temp_apu;
>  =09u8 skin_temp_hs2;
>  =09u8 enable_cnqf;
> -=09u32 custom_policy[10];
> +=09u32 custom_policy[BIOS_INPUTS_MAX];
>  } __packed;
> =20
>  struct apmf_sbios_req_v2 {
> @@ -216,7 +217,7 @@ struct apmf_sbios_req_v2 {
>  =09u32 stt_min_limit;
>  =09u8 skin_temp_apu;
>  =09u8 skin_temp_hs2;
> -=09u32 custom_policy[10];
> +=09u32 custom_policy[BIOS_INPUTS_MAX];
>  } __packed;
> =20
>  struct apmf_fan_idx {
> @@ -355,7 +356,7 @@ enum power_modes_v2 {
>  };
> =20
>  struct pmf_bios_inputs_prev {
> -=09u32 custom_bios_inputs[10];
> +=09u32 custom_bios_inputs[BIOS_INPUTS_MAX];
>  };
> =20
>  struct amd_pmf_dev {
> @@ -451,7 +452,7 @@ struct os_power_slider {
>  struct amd_pmf_notify_smart_pc_update {
>  =09u16 size;
>  =09u32 pending_req;
> -=09u32 custom_bios[10];
> +=09u32 custom_bios[BIOS_INPUTS_MAX];

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

Unrelated to the patch, I'm not entirely sure though why the naming=20
differs for custom_bios_inputs vs custom_bios.


--=20
 i.

--8323328-630730872-1763461086=:1205--
