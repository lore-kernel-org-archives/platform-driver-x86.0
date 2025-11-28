Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62DF2FBDF4
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Nov 2025 09:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764323336; cv=none; b=FGq8ULhu2ZFABzrUfDizJOtFGgyqBUz8OymBt6Ft5Vp2DbaJNJ9+9O5qRDWWmnOXkqREP6XlAj87WAfkYstzPz0E+ejIPCRuohuy0U/W6V3ycY34ZNrqph503il6SDDJnxheDFShezSMY1z14kfaZO2nadOwVLkD/VgNOJpAi2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764323336; c=relaxed/simple;
	bh=GoCl+Msx7ZzHz5XDAsDgXnL25FQToQhG+X8SFz6rB0U=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=g3pvQsAItgUaIDUI6WrIrB+4PZVrnUoC8C2QZt79Mn35s9vkScgpiTsIWpO+XKJhV1JmL6eHMPgZoHxRq2W2uJgZuuKyIOwzr0F6yUHE9Qhuhgllg3i9YSYqRQJarniMU1Q0VbqcOWMkVV9y4o6VRBgCiYP6IuJtwa3hsgploA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ILYLVWi9; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ILYLVWi9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764323334; x=1795859334;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=GoCl+Msx7ZzHz5XDAsDgXnL25FQToQhG+X8SFz6rB0U=;
  b=ILYLVWi9S1fPmfe0KAtz31qwl01LwVDgiSd8jNO4LdVrpHyrFxcnRUK9
   MByj8Xcdi9RGToQ6j8IEWWbOZIiWGawKwx9O0kLEppF6FTwy/nhYQTmwH
   5uG0LFTWI+RuFdM88Ha4dVpvDGowtCDDpiCvyS2CAYMA21du6/DLy7KRP
   S+5bE7iR/tN1RZcZPg0t2aSHj+b8x1y1LsjQeCFo4faRTMOVY+Z0m32QC
   P8DIU2sYMA7RvIXWyNDYndp2Xv88yjUJGwpzDgEY3H14UY8dJMym4lafi
   W66/MStztlkVeuY2SMbhXsUEEG4mMAKsWM6vUoWYrhaQxX3CiIiwpTiHD
   A==;
X-CSE-ConnectionGUID: 2/EV8kbeS3iWhHvW+QzAQA==
X-CSE-MsgGUID: f1oSnGBUTnGybGNAfNeBHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="70220793"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="70220793"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 01:48:53 -0800
X-CSE-ConnectionGUID: MuWXwKf+R0GAFRuG5YGShg==
X-CSE-MsgGUID: h2DtB6NHSvG93VGRjzpuDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="193643636"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.229])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 01:48:50 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 28 Nov 2025 11:48:46 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, Mario Limonciello <superm1@kernel.org>, 
    Yijun Shen <Yijun.Shen@Dell.com>
Subject: Re: [PATCH v4 3/3] platform/x86/amd/pmf: Use ring buffer to store
 custom BIOS input values
In-Reply-To: <80e375e1-0b6b-4c2e-bc5c-7137eb35a8bb@amd.com>
Message-ID: <0741ec72-f948-a499-fa8c-042dff826871@linux.intel.com>
References: <20251119085813.546813-1-Shyam-sundar.S-k@amd.com> <20251119085813.546813-3-Shyam-sundar.S-k@amd.com> <9f30b9ff-5f27-68c3-9bc1-4bed9fe0bd89@linux.intel.com> <80e375e1-0b6b-4c2e-bc5c-7137eb35a8bb@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1846387695-1764323326=:2091"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1846387695-1764323326=:2091
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 28 Nov 2025, Shyam Sundar S K wrote:
> On 11/27/2025 17:39, Ilpo J=C3=A4rvinen wrote:
> > On Wed, 19 Nov 2025, Shyam Sundar S K wrote:
> >=20
> >> Custom BIOS input values can be updated by multiple sources, such as p=
ower
> >> mode changes and sensor events, each triggering a custom BIOS input ev=
ent.
> >> When these events occur in rapid succession, new data may overwrite
> >> previous values before they are processed, resulting in lost updates.
> >>
> >> To address this, introduce a fixed-size, power-of-two ring buffer to
> >> capture every custom BIOS input event, storing both the pending reques=
t
> >> and its associated input values. Access to the ring buffer is synchron=
ized
> >> using a mutex.
> >>
> >> The previous use of memset() to clear the pending request structure af=
ter
> >> each event is removed, as each BIOS input value is now copied into the
> >> buffer as a snapshot. Consumers now process entries directly from the =
ring
> >> buffer, making explicit clearing of the pending request structure
> >> unnecessary.
> >>
> >> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> >> Tested-by: Yijun Shen <Yijun.Shen@Dell.com>
> >> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> >> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> >> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >> ---
> >> v4:
> >>  - Do not store local copy of the ring buffer
> >>  - use devm_mutex_init()
> >>
> >> v3:
> >>  - include headers wherever missing
> >>  - use dev_warn() instead of dev_WARN_ONCE()
> >>  - remove generic struct names
> >>  - enhance ringbuffer mechanism to handle common path
> >>  - other cosmetic remarks
> >>
> >> v2:
> >>  - Add dev_WARN_ONCE()
> >>  - Change variable name rb_mutex to cbi_mutex
> >>  - Move tail increment logic above pending request check
> >>
> >>  drivers/platform/x86/amd/pmf/acpi.c   | 40 ++++++++++++++++++++++++++=
+
> >>  drivers/platform/x86/amd/pmf/core.c   |  5 ++++
> >>  drivers/platform/x86/amd/pmf/pmf.h    | 21 ++++++++++++++
> >>  drivers/platform/x86/amd/pmf/spc.c    | 32 +++++++++++----------
> >>  drivers/platform/x86/amd/pmf/tee-if.c |  2 ++
> >>  5 files changed, 86 insertions(+), 14 deletions(-)
> >>
> >> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x8=
6/amd/pmf/acpi.c
> >> index 13c4fec2c7ef..3d94b03cf794 100644
> >> --- a/drivers/platform/x86/amd/pmf/acpi.c
> >> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> >> @@ -9,6 +9,9 @@
> >>   */
> >> =20
> >>  #include <linux/acpi.h>
> >> +#include <linux/array_size.h>
> >> +#include <linux/cleanup.h>
> >> +#include <linux/dev_printk.h>
> >>  #include "pmf.h"
> >> =20
> >>  #define APMF_CQL_NOTIFICATION  2
> >> @@ -331,6 +334,39 @@ int apmf_get_sbios_requests(struct amd_pmf_dev *p=
dev, struct apmf_sbios_req *req
> >>  =09=09=09=09=09=09=09=09=09 req, sizeof(*req));
> >>  }
> >> =20
> >> +/* Store custom BIOS inputs data in ring buffer */
> >> +static void amd_pmf_custom_bios_inputs_rb(struct amd_pmf_dev *pmf_dev=
)
> >> +{
> >> +=09struct pmf_cbi_ring_buffer *rb =3D &pmf_dev->cbi_buf;
> >> +=09int i;
> >> +
> >> +=09guard(mutex)(&pmf_dev->cbi_mutex);
> >> +
> >> +=09switch (pmf_dev->cpu_id) {
> >> +=09case AMD_CPU_ID_PS:
> >> +=09=09for (i =3D 0; i < ARRAY_SIZE(custom_bios_inputs_v1); i++)
> >> +=09=09=09rb->data[rb->head].val[i] =3D pmf_dev->req1.custom_policy[i]=
;
> >> +=09=09rb->data[rb->head].preq =3D pmf_dev->req1.pending_req;
> >> +=09=09break;
> >> +=09case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> >> +=09case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> >> +=09=09for (i =3D 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
> >> +=09=09=09rb->data[rb->head].val[i] =3D pmf_dev->req.custom_policy[i];
> >> +=09=09rb->data[rb->head].preq =3D pmf_dev->req.pending_req;
> >> +=09=09break;
> >> +=09default:
> >> +=09=09return;
> >> +=09}
> >> +
> >> +=09if (CIRC_SPACE(rb->head, rb->tail, CUSTOM_BIOS_INPUT_RING_ENTRIES)=
 =3D=3D 0) {
> >> +=09=09/* Rare case: ensures the newest BIOS input value is kept */
> >> +=09=09dev_warn(pmf_dev->dev, "Overwriting BIOS input value, data may =
be lost\n");
> >> +=09=09rb->tail =3D (rb->tail + 1) & (CUSTOM_BIOS_INPUT_RING_ENTRIES -=
 1);
> >> +=09}
> >> +
> >> +=09rb->head =3D (rb->head + 1) & (CUSTOM_BIOS_INPUT_RING_ENTRIES - 1)=
;
> >> +}
> >> +
> >>  static void amd_pmf_handle_early_preq(struct amd_pmf_dev *pdev)
> >>  {
> >>  =09if (!pdev->cb_flag)
> >> @@ -356,6 +392,8 @@ static void apmf_event_handler_v2(acpi_handle hand=
le, u32 event, void *data)
> >>  =09dev_dbg(pmf_dev->dev, "Pending request (preq): 0x%x\n", pmf_dev->r=
eq.pending_req);
> >> =20
> >>  =09amd_pmf_handle_early_preq(pmf_dev);
> >> +
> >> +=09amd_pmf_custom_bios_inputs_rb(pmf_dev);
> >>  }
> >> =20
> >>  static void apmf_event_handler_v1(acpi_handle handle, u32 event, void=
 *data)
> >> @@ -374,6 +412,8 @@ static void apmf_event_handler_v1(acpi_handle hand=
le, u32 event, void *data)
> >>  =09dev_dbg(pmf_dev->dev, "Pending request (preq1): 0x%x\n", pmf_dev->=
req1.pending_req);
> >> =20
> >>  =09amd_pmf_handle_early_preq(pmf_dev);
> >> +
> >> +=09amd_pmf_custom_bios_inputs_rb(pmf_dev);
> >>  }
> >> =20
> >>  static void apmf_event_handler(acpi_handle handle, u32 event, void *d=
ata)
> >> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x8=
6/amd/pmf/core.c
> >> index 2ec4cb92e34f..71421a5d7afd 100644
> >> --- a/drivers/platform/x86/amd/pmf/core.c
> >> +++ b/drivers/platform/x86/amd/pmf/core.c
> >> @@ -11,6 +11,7 @@
> >>  #include <linux/debugfs.h>
> >>  #include <linux/iopoll.h>
> >>  #include <linux/module.h>
> >> +#include <linux/mutex.h>
> >>  #include <linux/pci.h>
> >>  #include <linux/platform_device.h>
> >>  #include <linux/power_supply.h>
> >> @@ -477,6 +478,10 @@ static int amd_pmf_probe(struct platform_device *=
pdev)
> >>  =09if (err)
> >>  =09=09return err;
> >> =20
> >> +=09err =3D devm_mutex_init(dev->dev, &dev->cbi_mutex);
> >> +=09if (err)
> >> +=09=09return err;
> >> +
> >>  =09apmf_acpi_init(dev);
> >>  =09platform_set_drvdata(pdev, dev);
> >>  =09amd_pmf_dbgfs_register(dev);
> >> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86=
/amd/pmf/pmf.h
> >> index 2145df4128cd..5a18b3604b6e 100644
> >> --- a/drivers/platform/x86/amd/pmf/pmf.h
> >> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> >> @@ -12,7 +12,9 @@
> >>  #define PMF_H
> >> =20
> >>  #include <linux/acpi.h>
> >> +#include <linux/circ_buf.h>
> >>  #include <linux/input.h>
> >> +#include <linux/mutex_types.h>
> >>  #include <linux/platform_device.h>
> >>  #include <linux/platform_profile.h>
> >> =20
> >> @@ -120,6 +122,7 @@ struct cookie_header {
> >>  #define APTS_MAX_STATES=09=0916
> >>  #define CUSTOM_BIOS_INPUT_BITS=09GENMASK(16, 7)
> >>  #define BIOS_INPUTS_MAX=09=0910
> >> +#define CUSTOM_BIOS_INPUT_RING_ENTRIES=0964=09/* Must be power of two=
 for CIRC_* macros */
> >> =20
> >>  typedef void (*apmf_event_handler_t)(acpi_handle handle, u32 event, v=
oid *data);
> >> =20
> >> @@ -359,6 +362,22 @@ struct pmf_bios_inputs_prev {
> >>  =09u32 custom_bios_inputs[BIOS_INPUTS_MAX];
> >>  };
> >> =20
> >> +/**
> >> + * struct pmf_bios_input_entry - Snapshot of custom BIOS input event
> >> + * @val: Array of custom BIOS input values
> >> + * @preq: Pending request value associated with this event
> >> + */
> >> +struct pmf_bios_input_entry {
> >> +=09u32 val[BIOS_INPUTS_MAX];
> >> +=09u32 preq;
> >> +};
> >> +
> >> +struct pmf_cbi_ring_buffer {
> >> +=09struct pmf_bios_input_entry data[CUSTOM_BIOS_INPUT_RING_ENTRIES];
> >> +=09int head;
> >> +=09int tail;
> >> +};
> >> +
> >>  struct amd_pmf_dev {
> >>  =09void __iomem *regbase;
> >>  =09void __iomem *smu_virt_addr;
> >> @@ -407,6 +426,8 @@ struct amd_pmf_dev {
> >>  =09struct apmf_sbios_req_v1 req1;
> >>  =09struct pmf_bios_inputs_prev cb_prev; /* To preserve custom BIOS in=
puts */
> >>  =09bool cb_flag;=09=09=09     /* To handle first custom BIOS input */
> >> +=09struct pmf_cbi_ring_buffer cbi_buf;
> >> +=09struct mutex cbi_mutex;=09=09     /* Protects ring buffer access *=
/
> >>  };
> >> =20
> >>  struct apmf_sps_prop_granular_v2 {
> >> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86=
/amd/pmf/spc.c
> >> index 85192c7536b8..34fff41b86fe 100644
> >> --- a/drivers/platform/x86/amd/pmf/spc.c
> >> +++ b/drivers/platform/x86/amd/pmf/spc.c
> >> @@ -11,6 +11,7 @@
> >> =20
> >>  #include <acpi/button.h>
> >>  #include <linux/amd-pmf-io.h>
> >> +#include <linux/cleanup.h>
> >>  #include <linux/power_supply.h>
> >>  #include <linux/units.h>
> >>  #include "pmf.h"
> >> @@ -132,30 +133,37 @@ static void amd_pmf_set_ta_custom_bios_input(str=
uct ta_pmf_enact_table *in, int
> >>  =09}
> >>  }
> >> =20
> >> -static void amd_pmf_update_bios_inputs(struct amd_pmf_dev *pdev, u32 =
pending_req,
> >> +static void amd_pmf_update_bios_inputs(struct amd_pmf_dev *pdev, stru=
ct pmf_bios_input_entry *data,
> >>  =09=09=09=09       const struct amd_pmf_pb_bitmap *inputs,
> >> -=09=09=09=09       const u32 *custom_policy, struct ta_pmf_enact_tabl=
e *in)
> >> +=09=09=09=09       struct ta_pmf_enact_table *in)
> >>  {
> >>  =09unsigned int i;
> >> =20
> >>  =09for (i =3D 0; i < ARRAY_SIZE(custom_bios_inputs); i++) {
> >> -=09=09if (!(pending_req & inputs[i].bit_mask))
> >> +=09=09if (!(data->preq & inputs[i].bit_mask))
> >>  =09=09=09continue;
> >> -=09=09amd_pmf_set_ta_custom_bios_input(in, i, custom_policy[i]);
> >> -=09=09pdev->cb_prev.custom_bios_inputs[i] =3D custom_policy[i];
> >> -=09=09dev_dbg(pdev->dev, "Custom BIOS Input[%d]: %u\n", i, custom_pol=
icy[i]);
> >> +=09=09amd_pmf_set_ta_custom_bios_input(in, i, data->val[i]);
> >> +=09=09pdev->cb_prev.custom_bios_inputs[i] =3D data->val[i];
> >> +=09=09dev_dbg(pdev->dev, "Custom BIOS Input[%d]: %u\n", i, data->val[=
i]);
> >>  =09}
> >>  }
> >> =20
> >>  static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
> >>  =09=09=09=09=09   struct ta_pmf_enact_table *in)
> >>  {
> >> +=09struct pmf_cbi_ring_buffer *rb =3D &pdev->cbi_buf;
> >>  =09unsigned int i;
> >> =20
> >> +=09guard(mutex)(&pdev->cbi_mutex);
> >> +
> >>  =09for (i =3D 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
> >>  =09=09amd_pmf_set_ta_custom_bios_input(in, i, pdev->cb_prev.custom_bi=
os_inputs[i]);
> >> =20
> >> -=09if (!(pdev->req.pending_req || pdev->req1.pending_req))
> >> +=09if (CIRC_CNT(rb->head, rb->tail, CUSTOM_BIOS_INPUT_RING_ENTRIES) =
=3D=3D 0)
> >> +=09=09return;=09/* return if ring buffer is empty */
> >> +
> >> +=09/* If no active custom BIOS input pending request, do not consume =
further work */
> >> +=09if (!rb->data[rb->tail].preq)
> >>  =09=09return;
> >=20
> > I'm left usure if "do not consume further work" comment really means th=
at=20
> > the entry is supposed to not get removed from the ring, which stalls th=
e=20
> > ring forever?
>=20
> No. The amd_pmf_populate_ta_inputs() function runs periodically and
> calls amd_pmf_get_custom_bios_inputs(). The preq check prevents
> unnecessary processing when the ring buffer is empty or contains no
> valid pending requests.

At this point, the ring buffer IS NOT EMPTY as you just checked for it=20
above this check! So no, this preq check cannot ever find ring buffer=20
empty.

> Regarding the ring stall:
> Entries are added to the ring buffer only when a valid ACPI event
> triggers the event handler. Once an entry with preq set is queued, the
> consumer processes it and increments the tail.

Who is consuming them? This function? And it keeps returning if the entry=
=20
at rb->tail has zero preq.

> The check acts as a guard when the periodic function runs but no new
> events are available - either the ring buffer is empty or the current
> entry has no active pending request.

But the entry is left in place so the next invocation finds "no active=20
pending requests", and the entry is again left in place, and so on.

> > If that's the wanted behavior, does that imply overwrite dev_warn() abo=
ve=20
> > can spam the logs from that point on as the ring can fill up without=20
> > anything consuming entries from it?
>=20
> Entries with valid preq are always consumed,

True, but I'm talking about the opposite case, that is, when the=20
rb->tail entry has an entry with zero preq!

> preventing ring stalls.

This returns when !preq so I don't know what would prevent the stalling.=20
Please explain (but please think twice whether the explanation you're=20
going to give is sound!).

> The dev_warn() only triggers when the buffer overflows, not from
> stalled consumption.

Stalled consumer and queuing more and more entries to the circular buffer=
=20
will eventually lead to overflow, no matter what.

The overflow would likely actually destall it by overwriting the entry=20
with zero preq but that'd just hide to logic bug you have here.


I think what you should do is to consume the entry even when it has !preq
(that is, advance rb->tail also in that case; I'm not talking about other=
=20
processing you do but getting rid of the "nothing to do" entry at the=20
rb->tail).

> > I've taken first two patches into review-ilpo-next.
> >=20
> >>  =09if (!pdev->smart_pc_enabled)
> >> @@ -165,20 +173,16 @@ static void amd_pmf_get_custom_bios_inputs(struc=
t amd_pmf_dev *pdev,
> >>  =09case PMF_IF_V1:
> >>  =09=09if (!is_apmf_bios_input_notifications_supported(pdev))
> >>  =09=09=09return;
> >> -=09=09amd_pmf_update_bios_inputs(pdev, pdev->req1.pending_req, custom=
_bios_inputs_v1,
> >> -=09=09=09=09=09   pdev->req1.custom_policy, in);
> >> +=09=09amd_pmf_update_bios_inputs(pdev, &rb->data[rb->tail], custom_bi=
os_inputs_v1, in);
> >>  =09=09break;
> >>  =09case PMF_IF_V2:
> >> -=09=09amd_pmf_update_bios_inputs(pdev, pdev->req.pending_req, custom_=
bios_inputs,
> >> -=09=09=09=09=09   pdev->req.custom_policy, in);
> >> +=09=09amd_pmf_update_bios_inputs(pdev, &rb->data[rb->tail], custom_bi=
os_inputs, in);
> >>  =09=09break;
> >>  =09default:
> >>  =09=09break;
> >>  =09}
> >> =20
> >> -=09/* Clear pending requests after handling */
> >> -=09memset(&pdev->req, 0, sizeof(pdev->req));
> >> -=09memset(&pdev->req1, 0, sizeof(pdev->req1));
> >> +=09rb->tail =3D (rb->tail + 1) & (CUSTOM_BIOS_INPUT_RING_ENTRIES - 1)=
;
> >>  }
> >> =20
> >>  static void amd_pmf_get_c0_residency(u16 *core_res, size_t size, stru=
ct ta_pmf_enact_table *in)
> >> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/=
x86/amd/pmf/tee-if.c
> >> index 6e8116bef4f6..add742e33e1e 100644
> >> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> >> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> >> @@ -579,6 +579,8 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
> >>  =09=09status =3D ret =3D=3D TA_PMF_TYPE_SUCCESS;
> >>  =09=09if (status) {
> >>  =09=09=09dev->cb_flag =3D true;
> >> +=09=09=09dev->cbi_buf.head =3D 0;
> >> +=09=09=09dev->cbi_buf.tail =3D 0;
> >>  =09=09=09break;
> >>  =09=09}
> >>  =09=09amd_pmf_tee_deinit(dev);
> >>
> >=20
>=20

--=20
 i.

--8323328-1846387695-1764323326=:2091--
