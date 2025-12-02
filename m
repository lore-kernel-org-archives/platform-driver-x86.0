Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA833242C8
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Dec 2025 15:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764691183; cv=none; b=PSAr1IYZj3DgkLuA3HKgQW8hX/9hN0w99E2axi5C48w37nvKdgsqfM8qx3qnjJQtEhTW9/x6pKDHhGw2JMFUqso0fBqvs7HiZi40e6UveZaly0QpbjBLpfz2bGX+JzQ4VwnpuqGoVCyze5nhLuKTkiynEMBQJvNAzgagEYIVqrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764691183; c=relaxed/simple;
	bh=1p0FkE70gX07+t9E0oBVRsQHKb67A9frfFmCiwPyPRE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=TzX2iWpFUcPWmWeZD936cPbdyMFu+hAfeDzj0bwdvyQfXGKHxTiDQfpdYv7DQtNb46p0oM9baCBWCu17vA6pQqf0rsNsvrRLWT+4T0y94K5c4/cJ0CnIrnARiCJYAjzo5rlsMazybnFyFHLkzMHhOjhrya32HhQTB+zS4mKjNeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=etk4iMr4; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="etk4iMr4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764691181; x=1796227181;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=1p0FkE70gX07+t9E0oBVRsQHKb67A9frfFmCiwPyPRE=;
  b=etk4iMr41tUJWzSoZsMUnX/a/7PQe1kueUmYRi4LM2WktSjcu7JKf7if
   vDjAfgKVZ3TfXhMcArV3eBR9+SXldHYVID5QQNnfBMicJ0qpWfpeIUFW2
   2gj+dz7rGMHf9DU5LlokPClDovKPyjiUBsAwlIAUXgJvCcUoi65UAY9PA
   pYdNTPuoNaFCgoLsh4z4fR9DViZ3tvF1r2YDTT1NjCTOlus8S78cBuU/O
   EWWySF6tW+a7mslyDjwo7J/g4o0b9WtFpOqLbWbpjffZvMhT09SxHdvhD
   Z/rdzPj3UVnfjaZdDQ1iBoWGHUipbFzTOGPYd9UrhPfetuNG5Ftn5GqaY
   A==;
X-CSE-ConnectionGUID: QDznMEYkSESiAvk/DhqUVw==
X-CSE-MsgGUID: tryGatQtRD+EkVEZGhm3iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="76983593"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="76983593"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 07:59:40 -0800
X-CSE-ConnectionGUID: JUk269JYRXWnjMx30M0VRA==
X-CSE-MsgGUID: C9gu9mpjTju15z86IQN9lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="194636942"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.183])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 07:59:38 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 2 Dec 2025 17:59:34 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com, 
    Mario Limonciello <superm1@kernel.org>, Yijun Shen <Yijun.Shen@Dell.com>
Subject: Re: [PATCH v5] platform/x86/amd/pmf: Use ring buffer to store custom
 BIOS input values
In-Reply-To: <20251202042219.245173-1-Shyam-sundar.S-k@amd.com>
Message-ID: <5c429abe-7b82-85ed-c679-e14d09207d6c@linux.intel.com>
References: <20251202042219.245173-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-774990684-1764691174=:974"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-774990684-1764691174=:974
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 2 Dec 2025, Shyam Sundar S K wrote:

> Custom BIOS input values can be updated by multiple sources, such as powe=
r
> mode changes and sensor events, each triggering a custom BIOS input event=
=2E
> When these events occur in rapid succession, new data may overwrite
> previous values before they are processed, resulting in lost updates.
>=20
> To address this, introduce a fixed-size, power-of-two ring buffer to
> capture every custom BIOS input event, storing both the pending request
> and its associated input values. Access to the ring buffer is synchronize=
d
> using a mutex.
>=20
> The previous use of memset() to clear the pending request structure after
> each event is removed, as each BIOS input value is now copied into the
> buffer as a snapshot. Consumers now process entries directly from the rin=
g
> buffer, making explicit clearing of the pending request structure
> unnecessary.
>=20
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Tested-by: Yijun Shen <Yijun.Shen@Dell.com>
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
> v5:
>  - Advance ring buffer tail with a goto label
>=20
> v4:
>  - Do not store local copy of the ring buffer
>  - use devm_mutex_init()
>=20
> v3:
>  - include headers wherever missing
>  - use dev_warn() instead of dev_WARN_ONCE()
>  - remove generic struct names
>  - enhance ringbuffer mechanism to handle common path
>  - other cosmetic remarks
>=20
> v2:
>  - Add dev_WARN_ONCE()
>  - Change variable name rb_mutex to cbi_mutex
>  - Move tail increment logic above pending request check
>=20
>  drivers/platform/x86/amd/pmf/acpi.c   | 40 +++++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/core.c   |  5 ++++
>  drivers/platform/x86/amd/pmf/pmf.h    | 21 ++++++++++++++
>  drivers/platform/x86/amd/pmf/spc.c    | 33 ++++++++++++----------
>  drivers/platform/x86/amd/pmf/tee-if.c |  2 ++
>  5 files changed, 87 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/a=
md/pmf/acpi.c
> index 13c4fec2c7ef..3d94b03cf794 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -9,6 +9,9 @@
>   */
> =20
>  #include <linux/acpi.h>
> +#include <linux/array_size.h>
> +#include <linux/cleanup.h>
> +#include <linux/dev_printk.h>
>  #include "pmf.h"
> =20
>  #define APMF_CQL_NOTIFICATION  2
> @@ -331,6 +334,39 @@ int apmf_get_sbios_requests(struct amd_pmf_dev *pdev=
, struct apmf_sbios_req *req
>  =09=09=09=09=09=09=09=09=09 req, sizeof(*req));
>  }
> =20
> +/* Store custom BIOS inputs data in ring buffer */
> +static void amd_pmf_custom_bios_inputs_rb(struct amd_pmf_dev *pmf_dev)
> +{
> +=09struct pmf_cbi_ring_buffer *rb =3D &pmf_dev->cbi_buf;
> +=09int i;
> +
> +=09guard(mutex)(&pmf_dev->cbi_mutex);
> +
> +=09switch (pmf_dev->cpu_id) {
> +=09case AMD_CPU_ID_PS:
> +=09=09for (i =3D 0; i < ARRAY_SIZE(custom_bios_inputs_v1); i++)
> +=09=09=09rb->data[rb->head].val[i] =3D pmf_dev->req1.custom_policy[i];
> +=09=09rb->data[rb->head].preq =3D pmf_dev->req1.pending_req;
> +=09=09break;
> +=09case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> +=09case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> +=09=09for (i =3D 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
> +=09=09=09rb->data[rb->head].val[i] =3D pmf_dev->req.custom_policy[i];
> +=09=09rb->data[rb->head].preq =3D pmf_dev->req.pending_req;
> +=09=09break;
> +=09default:
> +=09=09return;
> +=09}
> +
> +=09if (CIRC_SPACE(rb->head, rb->tail, CUSTOM_BIOS_INPUT_RING_ENTRIES) =
=3D=3D 0) {
> +=09=09/* Rare case: ensures the newest BIOS input value is kept */
> +=09=09dev_warn(pmf_dev->dev, "Overwriting BIOS input value, data may be =
lost\n");
> +=09=09rb->tail =3D (rb->tail + 1) & (CUSTOM_BIOS_INPUT_RING_ENTRIES - 1)=
;
> +=09}
> +
> +=09rb->head =3D (rb->head + 1) & (CUSTOM_BIOS_INPUT_RING_ENTRIES - 1);
> +}
> +
>  static void amd_pmf_handle_early_preq(struct amd_pmf_dev *pdev)
>  {
>  =09if (!pdev->cb_flag)
> @@ -356,6 +392,8 @@ static void apmf_event_handler_v2(acpi_handle handle,=
 u32 event, void *data)
>  =09dev_dbg(pmf_dev->dev, "Pending request (preq): 0x%x\n", pmf_dev->req.=
pending_req);
> =20
>  =09amd_pmf_handle_early_preq(pmf_dev);
> +
> +=09amd_pmf_custom_bios_inputs_rb(pmf_dev);
>  }
> =20
>  static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *d=
ata)
> @@ -374,6 +412,8 @@ static void apmf_event_handler_v1(acpi_handle handle,=
 u32 event, void *data)
>  =09dev_dbg(pmf_dev->dev, "Pending request (preq1): 0x%x\n", pmf_dev->req=
1.pending_req);
> =20
>  =09amd_pmf_handle_early_preq(pmf_dev);
> +
> +=09amd_pmf_custom_bios_inputs_rb(pmf_dev);
>  }
> =20
>  static void apmf_event_handler(acpi_handle handle, u32 event, void *data=
)
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/a=
md/pmf/core.c
> index 8fc293c9c538..9f4a1f79459a 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -11,6 +11,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/iopoll.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
>  #include <linux/pci.h>
>  #include <linux/platform_device.h>
>  #include <linux/power_supply.h>
> @@ -477,6 +478,10 @@ static int amd_pmf_probe(struct platform_device *pde=
v)
>  =09if (err)
>  =09=09return err;
> =20
> +=09err =3D devm_mutex_init(dev->dev, &dev->cbi_mutex);
> +=09if (err)
> +=09=09return err;
> +
>  =09apmf_acpi_init(dev);
>  =09platform_set_drvdata(pdev, dev);
>  =09amd_pmf_dbgfs_register(dev);
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/am=
d/pmf/pmf.h
> index 9144c8c3bbaf..e65a7eca0508 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -12,7 +12,9 @@
>  #define PMF_H
> =20
>  #include <linux/acpi.h>
> +#include <linux/circ_buf.h>
>  #include <linux/input.h>
> +#include <linux/mutex_types.h>
>  #include <linux/platform_device.h>
>  #include <linux/platform_profile.h>
> =20
> @@ -120,6 +122,7 @@ struct cookie_header {
>  #define APTS_MAX_STATES=09=0916
>  #define CUSTOM_BIOS_INPUT_BITS=09GENMASK(16, 7)
>  #define BIOS_INPUTS_MAX=09=0910
> +#define CUSTOM_BIOS_INPUT_RING_ENTRIES=0964=09/* Must be power of two fo=
r CIRC_* macros */
> =20
>  /* amd_pmf_send_cmd() set/get */
>  #define SET_CMD=09=09false
> @@ -365,6 +368,22 @@ struct pmf_bios_inputs_prev {
>  =09u32 custom_bios_inputs[BIOS_INPUTS_MAX];
>  };
> =20
> +/**
> + * struct pmf_bios_input_entry - Snapshot of custom BIOS input event
> + * @val: Array of custom BIOS input values
> + * @preq: Pending request value associated with this event
> + */
> +struct pmf_bios_input_entry {
> +=09u32 val[BIOS_INPUTS_MAX];
> +=09u32 preq;
> +};
> +
> +struct pmf_cbi_ring_buffer {
> +=09struct pmf_bios_input_entry data[CUSTOM_BIOS_INPUT_RING_ENTRIES];
> +=09int head;
> +=09int tail;
> +};
> +
>  struct amd_pmf_dev {
>  =09void __iomem *regbase;
>  =09void __iomem *smu_virt_addr;
> @@ -413,6 +432,8 @@ struct amd_pmf_dev {
>  =09struct apmf_sbios_req_v1 req1;
>  =09struct pmf_bios_inputs_prev cb_prev; /* To preserve custom BIOS input=
s */
>  =09bool cb_flag;=09=09=09     /* To handle first custom BIOS input */
> +=09struct pmf_cbi_ring_buffer cbi_buf;
> +=09struct mutex cbi_mutex;=09=09     /* Protects ring buffer access */
>  };
> =20
>  struct apmf_sps_prop_granular_v2 {
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/am=
d/pmf/spc.c
> index 0a37dc6a7950..f48678a23cc7 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -11,6 +11,7 @@
> =20
>  #include <acpi/button.h>
>  #include <linux/amd-pmf-io.h>
> +#include <linux/cleanup.h>
>  #include <linux/power_supply.h>
>  #include <linux/units.h>
>  #include "pmf.h"
> @@ -132,32 +133,39 @@ static void amd_pmf_set_ta_custom_bios_input(struct=
 ta_pmf_enact_table *in, int
>  =09}
>  }
> =20
> -static void amd_pmf_update_bios_inputs(struct amd_pmf_dev *pdev, u32 pen=
ding_req,
> +static void amd_pmf_update_bios_inputs(struct amd_pmf_dev *pdev, struct =
pmf_bios_input_entry *data,
>  =09=09=09=09       const struct amd_pmf_pb_bitmap *inputs,
> -=09=09=09=09       const u32 *custom_policy, struct ta_pmf_enact_table *=
in)
> +=09=09=09=09       struct ta_pmf_enact_table *in)
>  {
>  =09unsigned int i;
> =20
>  =09for (i =3D 0; i < ARRAY_SIZE(custom_bios_inputs); i++) {
> -=09=09if (!(pending_req & inputs[i].bit_mask))
> +=09=09if (!(data->preq & inputs[i].bit_mask))
>  =09=09=09continue;
> -=09=09amd_pmf_set_ta_custom_bios_input(in, i, custom_policy[i]);
> -=09=09pdev->cb_prev.custom_bios_inputs[i] =3D custom_policy[i];
> -=09=09dev_dbg(pdev->dev, "Custom BIOS Input[%d]: %u\n", i, custom_policy=
[i]);
> +=09=09amd_pmf_set_ta_custom_bios_input(in, i, data->val[i]);
> +=09=09pdev->cb_prev.custom_bios_inputs[i] =3D data->val[i];
> +=09=09dev_dbg(pdev->dev, "Custom BIOS Input[%d]: %u\n", i, data->val[i])=
;
>  =09}
>  }
> =20
>  static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
>  =09=09=09=09=09   struct ta_pmf_enact_table *in)
>  {
> +=09struct pmf_cbi_ring_buffer *rb =3D &pdev->cbi_buf;
>  =09unsigned int i;
> =20
> +=09guard(mutex)(&pdev->cbi_mutex);
> +
>  =09for (i =3D 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
>  =09=09amd_pmf_set_ta_custom_bios_input(in, i, pdev->cb_prev.custom_bios_=
inputs[i]);
> =20
> -=09if (!(pdev->req.pending_req || pdev->req1.pending_req))
> +=09if (CIRC_CNT(rb->head, rb->tail, CUSTOM_BIOS_INPUT_RING_ENTRIES) =3D=
=3D 0)
>  =09=09return;
> =20
> +=09/* If no active custom BIOS input pending request, do not consume fur=
ther work */
> +=09if (!rb->data[rb->tail].preq)
> +=09=09goto out_rbadvance;
> +
>  =09if (!pdev->smart_pc_enabled)
>  =09=09return;
> =20
> @@ -165,20 +173,17 @@ static void amd_pmf_get_custom_bios_inputs(struct a=
md_pmf_dev *pdev,
>  =09case PMF_IF_V1:
>  =09=09if (!is_apmf_bios_input_notifications_supported(pdev))
>  =09=09=09return;
> -=09=09amd_pmf_update_bios_inputs(pdev, pdev->req1.pending_req, custom_bi=
os_inputs_v1,
> -=09=09=09=09=09   pdev->req1.custom_policy, in);
> +=09=09amd_pmf_update_bios_inputs(pdev, &rb->data[rb->tail], custom_bios_=
inputs_v1, in);
>  =09=09break;
>  =09case PMF_IF_V2:
> -=09=09amd_pmf_update_bios_inputs(pdev, pdev->req.pending_req, custom_bio=
s_inputs,
> -=09=09=09=09=09   pdev->req.custom_policy, in);
> +=09=09amd_pmf_update_bios_inputs(pdev, &rb->data[rb->tail], custom_bios_=
inputs, in);
>  =09=09break;
>  =09default:
>  =09=09break;
>  =09}
> =20
> -=09/* Clear pending requests after handling */
> -=09memset(&pdev->req, 0, sizeof(pdev->req));
> -=09memset(&pdev->req1, 0, sizeof(pdev->req1));
> +out_rbadvance:
> +=09rb->tail =3D (rb->tail + 1) & (CUSTOM_BIOS_INPUT_RING_ENTRIES - 1);
>  }
> =20
>  static void amd_pmf_get_c0_residency(u16 *core_res, size_t size, struct =
ta_pmf_enact_table *in)
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86=
/amd/pmf/tee-if.c
> index 0abce76f89ff..cec8b38c1afe 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -591,6 +591,8 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>  =09=09status =3D ret =3D=3D TA_PMF_TYPE_SUCCESS;
>  =09=09if (status) {
>  =09=09=09dev->cb_flag =3D true;
> +=09=09=09dev->cbi_buf.head =3D 0;
> +=09=09=09dev->cbi_buf.tail =3D 0;
>  =09=09=09break;
>  =09=09}
>  =09=09amd_pmf_tee_deinit(dev);
>=20

Looks okay now,

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-774990684-1764691174=:974--
