Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D11ACA69
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Jan 2024 12:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706099134; cv=none; b=YUi4YKLMVVaTcHEaPfRdurSxRZl1H9BKLdXyAAa226VlDKg0oahFjo3BNv9RsBlDCQTA5MHlEc7giVOgH6O7v6ZduOeXSTfeIlg5YaQ0t7xVChvC186qcwwKpDf1W7DwHaz8zlTdmZouXOIUAOBuhwEncZOpNEXA9tMtZv46ZyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706099134; c=relaxed/simple;
	bh=UnZpitUGmGLJma/w0itAeAkxoPNw8Ek7CM7TSMeXCaQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=a5zZt08f5MHeWmqa1hMbm7FA5Z7F9hTPl/1yC/CUgOY9LXNgmEzn17fDbdPUjijEuneHfA9H3Dk+3LZ4/RwXIFWxCWhUiwqXG7T/gN1khtLZZ9KUqDDvUkSh+3Ov0lguJbB+0B87GT954MvozHP8UhJZzDWqq3mrDiTYHJzIl90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M7RdGYKf; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M7RdGYKf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706099132; x=1737635132;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=UnZpitUGmGLJma/w0itAeAkxoPNw8Ek7CM7TSMeXCaQ=;
  b=M7RdGYKf0TFCBPCeP/eHtuKHabMcesnOVJXmUtfXKoI9QonPTGg0T1A9
   cb/B66eKN3RlzIw4G45MvCnYf5R5cZzWEdxeyAA5uHcshpjYBr1tVGeJm
   iXAppaIdCZ/hwdn7K+fyWcOFImi1p/+HEu2Sq7QoP1MjoYyej+mStwax0
   ZbgvfliFTXU56icP4eJsHubcpcx+qWRJTKwzsYRTGC+BPnpG8aOkLA0TB
   X5hXPz/adrvUCrFLG1K5h1bdxpzfT2w2m6yAaQD7ByB9rUDGvJ42sbyft
   OSgH+g6kWTD8nQv9JH/xfmfuCUfOZN8jgbknYJK+jt9vIMwLZ5Xw2buEc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="20383683"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="20383683"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 04:25:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="28378949"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.246.48.46])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 04:25:29 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 24 Jan 2024 14:25:25 +0200 (EET)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: Re: [PATCH v5 11/11] platform/x86/amd/hsmp: Remove extra parenthesis
 and add a space
In-Reply-To: <20240106022532.1746932-11-suma.hegde@amd.com>
Message-ID: <d66af894-e1d7-d045-0600-21386262dd41@linux.intel.com>
References: <20240106022532.1746932-1-suma.hegde@amd.com> <20240106022532.1746932-11-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1605513477-1706099125=:1372"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1605513477-1706099125=:1372
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sat, 6 Jan 2024, Suma Hegde wrote:

> Remove unnecessary parenthesis around hsmp_get_tbl_dram_base().
>=20
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> ---
> Changes since v4:
> New patch, generated after splitting the 9th patch in v4 series
>=20
>  drivers/platform/x86/amd/hsmp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/h=
smp.c
> index ccf7cd8f98f6..99a34b48f78f 100644
> --- a/drivers/platform/x86/amd/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp.c
> @@ -643,12 +643,12 @@ static int hsmp_init_metric_tbl_bin_attr(struct bin=
_attribute **hattrs, u16 sock
>  =09hattrs[0]=09=09=3D hattr;
> =20
>  =09if (plat_dev.proto_ver =3D=3D HSMP_PROTO_VER6)
> -=09=09return (hsmp_get_tbl_dram_base(sock_ind));
> +=09=09return hsmp_get_tbl_dram_base(sock_ind);
>  =09else
>  =09=09return 0;
>  }
> =20
> -/* One bin sysfs for metrics table*/
> +/* One bin sysfs for metrics table */
>  #define NUM_HSMP_ATTRS=09=091
> =20
>  static int hsmp_create_attr_list(struct attribute_group *attr_grp,
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>


--=20
 i.

--8323328-1605513477-1706099125=:1372--
