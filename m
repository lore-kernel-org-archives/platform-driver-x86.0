Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05E62F6909
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Nov 2025 15:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763480656; cv=none; b=jIR+X0WMxIga6YLU/EM55M+99RASw+pvW3VC9BIu5Zyox2vpHWMW2KU1R8BupjfRGRFAuWhHnHu4H9/8EoVe9LYq7hjSccx6KFvvXnpWfYHStKfKBvO7aWZLOslXJt5MkxObewGvIbPGtwqSIygNJBfBUO+WQZUdzqyvUH+B5UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763480656; c=relaxed/simple;
	bh=ltety0K77CECQ4ImEUU+EanQFz9hd3dxBEQaqBaL1xk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=qoIMhYhsxNVaOYZgFyyLpANA6EapsE6DmQEvMDXwJCC1vtOzIJTaD6mnOdrDqPy7CnP1IwPVD7sO8qLCQW2bLkQOd05QVH4TxD9eSw+qZdo8pwvKQqjX84SQKtRwUyfoKgLSYRBDXzLt/l3fA10x8AIw8mtT0eg9s0wSHlfQlAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GtnXPNX8; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GtnXPNX8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763480654; x=1795016654;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ltety0K77CECQ4ImEUU+EanQFz9hd3dxBEQaqBaL1xk=;
  b=GtnXPNX85zQBvvTPUznZsxklEt3EOk4UU1AawX+kKXtCynaYZpo+7aPK
   /Jytuub7Y10l1vl+l5LEZ01/PMStZTg2aGe3y8hhv+eA+6GR6qYiXhIlq
   2jC0dY7unSzpKzea7tsIBkqbOlIw40XGMyJNiM9C+x36/BRUBLVgy9gWj
   6UJVfKNMe+ebxLVVrX3W2/OXVlYaqJ0zIhHIllS3Aw7Ut6uD0OE4Ju+AD
   zhYKRhAro72BdHEwLvxq+HY5vK/W2rWrscqyjBAxmZe2WBVfwYP+LZ9j6
   jFWZjeUS84pGEgTNOqzlwiro0raF3e7mPfXH8h7J1rGv9nlwOH0u1qYNj
   g==;
X-CSE-ConnectionGUID: fw/Kjs7OSwiGZVJYbYMQ5w==
X-CSE-MsgGUID: qDpolmNVTAi3B6qZTu4BWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65208154"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="65208154"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 07:44:12 -0800
X-CSE-ConnectionGUID: bzfmiFJ6R9mFlM/Ei/daKA==
X-CSE-MsgGUID: 8cl1O1C2RW6irJeVa9f/ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="191016265"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.74])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 07:44:09 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 18 Nov 2025 17:44:06 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com, lizhi.hou@amd.com
Subject: Re: [PATCH v2 3/5] platform/x86/amd/pmf: replace magic table id with
 METRICS_TABLE_ID
In-Reply-To: <20251111063737.4156385-4-Shyam-sundar.S-k@amd.com>
Message-ID: <bb865b1a-0c88-0b5a-e282-377d17095cab@linux.intel.com>
References: <20251111063737.4156385-1-Shyam-sundar.S-k@amd.com> <20251111063737.4156385-4-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1327948012-1763480646=:1205"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1327948012-1763480646=:1205
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 11 Nov 2025, Shyam Sundar S K wrote:

> Add METRICS_TABLE_ID (7) and use it when requesting the metrics
> transfer table instead of the hard-coded literal. This clarifies the
> meaning of the argument to amd_pmf_send_cmd() and centralizes the table
> ID definition for easier maintenance.
>=20
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/core.c | 2 +-
>  drivers/platform/x86/amd/pmf/pmf.h  | 1 +
>  drivers/platform/x86/amd/pmf/spc.c  | 2 +-
>  3 files changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/a=
md/pmf/core.c
> index a659cedc4533..a6a5d416edf9 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -131,7 +131,7 @@ static void amd_pmf_get_metrics(struct work_struct *w=
ork)
> =20
>  =09/* Transfer table contents */
>  =09memset(dev->buf, 0, sizeof(dev->m_table));
> -=09amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, SET_CMD, 7, NULL);
> +=09amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, SET_CMD, METRICS_TABLE_ID, =
NULL);
>  =09memcpy(&dev->m_table, dev->buf, sizeof(dev->m_table));
> =20
>  =09time_elapsed_ms =3D ktime_to_ms(ktime_get()) - dev->start_time;
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/am=
d/pmf/pmf.h
> index 19e413bd89bc..561919b9f671 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -122,6 +122,7 @@ struct cookie_header {
> =20
>  #define SET_CMD=09=090
>  #define GET_CMD=09=091
> +#define METRICS_TABLE_ID=097
> =20
>  typedef void (*apmf_event_handler_t)(acpi_handle handle, u32 event, void=
 *data);
> =20
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/am=
d/pmf/spc.c
> index b10229def18a..0a37dc6a7950 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -202,7 +202,7 @@ static void amd_pmf_get_smu_info(struct amd_pmf_dev *=
dev, struct ta_pmf_enact_ta
>  {
>  =09/* Get the updated metrics table data */
>  =09memset(dev->buf, 0, dev->mtable_size);
> -=09amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, SET_CMD, 7, NULL);
> +=09amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, SET_CMD, METRICS_TABLE_ID, =
NULL);
> =20
>  =09switch (dev->cpu_id) {
>  =09case AMD_CPU_ID_PS:
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>


--=20
 i.

--8323328-1327948012-1763480646=:1205--
