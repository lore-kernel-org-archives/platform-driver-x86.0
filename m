Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C271E51EE
	for <platform-driver-x86@vger.kernel.org>; Fri,  7 Nov 2025 10:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762510941; cv=none; b=XTOfpeuEJ8W49vBD9GfK8EqY9V0O75ULacBjPwVOtKUbOyiwwjOXI84tPqXk6IpMtMSV1Fw1qtDl6K7/JPyJ1KBFGML6TAE2MNBOByoiX9IQifT0PUeFGV4PVNfyMtauIz/cofme80hrdAf0rPO2Swq8/nyF//Q6Allb26Ugywg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762510941; c=relaxed/simple;
	bh=mFFtl3bxvawZnsLXqYHMv1CeW+BHiSxs7OgxSibsUlo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MBmtOh6prwJJH7Ho/tZ369dEEbigerhpncoaXtAbt8vwP2K903PpYREq1mh9Oqz/AedwKMFAVnuVmybeO+3Nz57fZuKB12bbsOI7V8pCSjjcf8ZGhYCgIQOerH+1nxEseESB9mi5iR36YsnFLofYUOKrU+gdPYXfir9y7ENeb/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TouyOHqS; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TouyOHqS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762510939; x=1794046939;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=mFFtl3bxvawZnsLXqYHMv1CeW+BHiSxs7OgxSibsUlo=;
  b=TouyOHqSMZ1J6Z3C6M/g6/JySVKYm92nwuVdF6PI1tS9lN45qE3wvIFx
   YN0qdjsn+tk0f9QgtAWimG60yLGkZuA/QjwOabwITXjNTDd7oQh3zcqLD
   JKHqp1c6pdIqJQjJmf6p3q91+6PFeyaRc5EE0HLl+/LRdvsUSuioy6ITZ
   7v9g8if1lpHF0R6q37rmvQpvmB8AndZJrQcNJGUjpnSGMQIkxMEH5Wn/q
   0yv73KCcApi1qVhZjj9BAZXILvpjneHwIfhnsi9Y52KjZif8WBOUVGxLK
   yKgzXRQQbhoqDUZLRgfIlbbS+S83IXA1eyP84RgPJfOpL1aqkarS1cAAE
   g==;
X-CSE-ConnectionGUID: gjkPVclgQcSj7Irfix2rGA==
X-CSE-MsgGUID: aON+zWcNR6aucpUA9jR3YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="74952159"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="74952159"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 02:22:19 -0800
X-CSE-ConnectionGUID: 0n/nFSLdSQ2u/tI1tv/sKw==
X-CSE-MsgGUID: vLeWyxYqTyanZ5j0WQSEZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="225265380"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.71])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 02:22:16 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 7 Nov 2025 12:22:12 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: hdegoede@redhat.com, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com, Yijun.Shen@Dell.com
Subject: Re: [PATCH v2 2/2] platform/x86/amd/pmf: Use ring buffer to store
 custom BIOS input values
In-Reply-To: <e805d898-31ae-4433-8302-8b3758213039@amd.com>
Message-ID: <ca8d0f58-4a6f-9c78-c6bd-11f727787d73@linux.intel.com>
References: <20251015145457.3231583-1-Shyam-sundar.S-k@amd.com> <20251015145457.3231583-2-Shyam-sundar.S-k@amd.com> <b0a559b4-c7fe-90c1-27a2-7dcd5d29e146@linux.intel.com> <e805d898-31ae-4433-8302-8b3758213039@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-160179283-1762510932=:1070"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-160179283-1762510932=:1070
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 7 Nov 2025, Shyam Sundar S K wrote:
> On 11/5/2025 22:16, Ilpo J=C3=A4rvinen wrote:
> > On Wed, 15 Oct 2025, Shyam Sundar S K wrote:
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
> >> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> >> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> >> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >> ---
> >> v2:
> >>  - Add dev_WARN_ONCE()
> >>  - Change variable name rb_mutex to cbi_mutex
> >>  - Move tail increment logic above pending request check
> >>
> >>  drivers/platform/x86/amd/pmf/acpi.c   | 41 ++++++++++++++++++++++++++=
+
> >>  drivers/platform/x86/amd/pmf/core.c   |  2 ++
> >>  drivers/platform/x86/amd/pmf/pmf.h    | 20 +++++++++++++
> >>  drivers/platform/x86/amd/pmf/spc.c    | 23 +++++++++------
> >>  drivers/platform/x86/amd/pmf/tee-if.c |  2 ++
> >>  5 files changed, 79 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x8=
6/amd/pmf/acpi.c
> >> index 13c4fec2c7ef..870a56f1fe07 100644
> >> --- a/drivers/platform/x86/amd/pmf/acpi.c
> >> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> >> @@ -331,6 +331,43 @@ int apmf_get_sbios_requests(struct amd_pmf_dev *p=
dev, struct apmf_sbios_req *req
> >>  =09=09=09=09=09=09=09=09=09 req, sizeof(*req));
> >>  }
> >> =20
> >> +/* Store custom BIOS inputs data in ring buffer */
> >> +static void amd_pmf_custom_bios_inputs_rb(struct amd_pmf_dev *pmf_dev=
)
> >> +{
> >> +=09struct cbi_ring_buffer *rb =3D &pmf_dev->cbi_buf;
> >> +=09struct bios_input_entry entry =3D { };
> >=20
> > Too generic struct name.
> >=20
> >> +=09int i;
> >> +
> >> +=09guard(mutex)(&pmf_dev->cbi_mutex);
> >> +
> >> +=09switch (pmf_dev->cpu_id) {
> >> +=09case AMD_CPU_ID_PS:
> >> +=09=09for (i =3D 0; i < ARRAY_SIZE(custom_bios_inputs_v1); i++)
> >> +=09=09=09entry.val[i] =3D pmf_dev->req1.custom_policy[i];
> >> +=09=09entry.preq =3D pmf_dev->req1.pending_req;
> >> +=09=09break;
> >> +=09case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> >> +=09case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> >> +=09=09for (i =3D 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
> >=20
> > Add include.
> >=20
> >> +=09=09=09entry.val[i] =3D pmf_dev->req.custom_policy[i];
> >> +=09=09entry.preq =3D pmf_dev->req.pending_req;
> >> +=09=09break;
> >> +=09default:
> >> +=09=09return;
> >> +=09}
> >> +
> >> +=09if (CIRC_SPACE(rb->head, rb->tail, CUSTOM_BIOS_INPUT_RB_SZ) > 0) {
> >> +=09=09rb->data[rb->head] =3D entry;
> >> +=09=09rb->head =3D (rb->head + 1) & (CUSTOM_BIOS_INPUT_RB_SZ - 1);
> >> +=09} else {
> >> +=09=09/* Rare case: ensures the newest BIOS input value is kept */
> >> +=09=09dev_WARN_ONCE(pmf_dev->dev, 1, "Overwriting BIOS input value, d=
ata may be lost\n");
> >=20
> > Is this really WARN_ONCE thing? That is, does it indicate a bug in the=
=20
> > kernel code?
>=20
> If we hit this case, we might end up in a debug spew and hence put it
> under WARN_ONCE (that way we are not lost in debugging the odd cases,
> if we are under this scenario).

Why doesn't printing just a dev_warn() suffice (it should be just as=20
visible in the log provided as the stacktrace, etc. is)? Why you need=20
stacktrace, etc. to differentiate?

--=20
 i.

> Not a bug in the kernel code..
>=20
> >=20
> > Add include.
> >=20
> >> +=09=09rb->data[rb->head] =3D entry;
> >> +=09=09rb->head =3D (rb->head + 1) & (CUSTOM_BIOS_INPUT_RB_SZ - 1);
> >> +=09=09rb->tail =3D (rb->tail + 1) & (CUSTOM_BIOS_INPUT_RB_SZ - 1);
> >=20
> > Since you're under lock, can you make room separately first and then ad=
d
> > the entry on a common path?
> >=20
> >> +=09}
> >> +}
> >> +
> >>  static void amd_pmf_handle_early_preq(struct amd_pmf_dev *pdev)
> >>  {
> >>  =09if (!pdev->cb_flag)
> >> @@ -356,6 +393,8 @@ static void apmf_event_handler_v2(acpi_handle hand=
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
> >> @@ -374,6 +413,8 @@ static void apmf_event_handler_v1(acpi_handle hand=
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
> >> index bc544a4a5266..8b97eba00dd3 100644
> >> --- a/drivers/platform/x86/amd/pmf/core.c
> >> +++ b/drivers/platform/x86/amd/pmf/core.c
> >> @@ -468,6 +468,7 @@ static int amd_pmf_probe(struct platform_device *p=
dev)
> >>  =09mutex_init(&dev->lock);
> >>  =09mutex_init(&dev->update_mutex);
> >>  =09mutex_init(&dev->cb_mutex);
> >> +=09mutex_init(&dev->cbi_mutex);
> >> =20
> >>  =09apmf_acpi_init(dev);
> >>  =09platform_set_drvdata(pdev, dev);
> >> @@ -494,6 +495,7 @@ static void amd_pmf_remove(struct platform_device =
*pdev)
> >>  =09mutex_destroy(&dev->lock);
> >>  =09mutex_destroy(&dev->update_mutex);
> >>  =09mutex_destroy(&dev->cb_mutex);
> >> +=09mutex_destroy(&dev->cbi_mutex);
> >>  }
> >> =20
> >>  static const struct attribute_group *amd_pmf_driver_groups[] =3D {
> >> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86=
/amd/pmf/pmf.h
> >> index 2145df4128cd..6cb1e228c48e 100644
> >> --- a/drivers/platform/x86/amd/pmf/pmf.h
> >> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> >> @@ -12,6 +12,7 @@
> >>  #define PMF_H
> >> =20
> >>  #include <linux/acpi.h>
> >> +#include <linux/circ_buf.h>
> >>  #include <linux/input.h>
> >>  #include <linux/platform_device.h>
> >>  #include <linux/platform_profile.h>
> >> @@ -120,6 +121,7 @@ struct cookie_header {
> >>  #define APTS_MAX_STATES=09=0916
> >>  #define CUSTOM_BIOS_INPUT_BITS=09GENMASK(16, 7)
> >>  #define BIOS_INPUTS_MAX=09=0910
> >> +#define CUSTOM_BIOS_INPUT_RB_SZ=0964=09/* Must be power of two for CI=
RC_* macros */
> >=20
> > This is not really size but there are n entries. The total size will be=
=20
> > something else. I'd call it NUM or ENTRIES, or something like that.=20
> > Perhaps CUSTOM_BIOS_INPUT_RING_ENTRIES but that is a bit to the long si=
de=20
> > of things?
> >=20
> >>  typedef void (*apmf_event_handler_t)(acpi_handle handle, u32 event, v=
oid *data);
> >> =20
> >> @@ -359,6 +361,22 @@ struct pmf_bios_inputs_prev {
> >>  =09u32 custom_bios_inputs[BIOS_INPUTS_MAX];
> >>  };
> >> =20
> >> +/**
> >> + * struct bios_input_entry - Snapshot of custom BIOS input event
> >> + * @val: Array of custom BIOS input values
> >> + * @preq: Pending request value associated with this event
> >> + */
> >> +struct bios_input_entry {
> >> +=09u32 val[BIOS_INPUTS_MAX];
> >> +=09u32 preq;
> >> +};
> >> +
> >> +struct cbi_ring_buffer {
> >> +=09struct bios_input_entry data[CUSTOM_BIOS_INPUT_RB_SZ];
> >> +=09int head;
> >> +=09int tail;
> >> +};
> >> +
> >>  struct amd_pmf_dev {
> >>  =09void __iomem *regbase;
> >>  =09void __iomem *smu_virt_addr;
> >> @@ -407,6 +425,8 @@ struct amd_pmf_dev {
> >>  =09struct apmf_sbios_req_v1 req1;
> >>  =09struct pmf_bios_inputs_prev cb_prev; /* To preserve custom BIOS in=
puts */
> >>  =09bool cb_flag;=09=09=09     /* To handle first custom BIOS input */
> >> +=09struct cbi_ring_buffer cbi_buf;
> >> +=09struct mutex cbi_mutex;=09=09     /* Protects ring buffer access *=
/
> >=20
> > Include missing?
>=20
> yes..
>=20
> >=20
> >>  };
> >> =20
> >>  struct apmf_sps_prop_granular_v2 {
> >> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86=
/amd/pmf/spc.c
> >> index 85192c7536b8..669680ce580a 100644
> >> --- a/drivers/platform/x86/amd/pmf/spc.c
> >> +++ b/drivers/platform/x86/amd/pmf/spc.c
> >> @@ -150,12 +150,23 @@ static void amd_pmf_update_bios_inputs(struct am=
d_pmf_dev *pdev, u32 pending_req
> >>  static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
> >>  =09=09=09=09=09   struct ta_pmf_enact_table *in)
> >>  {
> >> +=09struct cbi_ring_buffer *rb =3D &pdev->cbi_buf;
> >> +=09struct bios_input_entry entry =3D { };
> >>  =09unsigned int i;
> >> =20
> >> +=09guard(mutex)(&pdev->cbi_mutex);
> >> +
> >>  =09for (i =3D 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
> >>  =09=09amd_pmf_set_ta_custom_bios_input(in, i, pdev->cb_prev.custom_bi=
os_inputs[i]);
> >> =20
> >> -=09if (!(pdev->req.pending_req || pdev->req1.pending_req))
> >> +=09if (CIRC_CNT(rb->head, rb->tail, CUSTOM_BIOS_INPUT_RB_SZ) =3D=3D 0=
)
> >=20
> > Include missing.
>=20
> circ_buf.h is included in pmf.h since acpi.c and spc.c are using it.
>=20
> >=20
> > As a general comment unrelated to this patch, these files to be missing=
=20
> > other headers too.
>=20
> Yeah. I get your point. Let me add all the relavent missing headers
> and respin a new version.
>=20
> ack to other comments in the patch.
>=20
> Thanks,
> Shyam
> >=20
> >> +=09=09return;=09/* return if ring buffer is empty */
> >> +
> >> +=09entry =3D rb->data[rb->tail];
> >> +=09rb->tail =3D (rb->tail + 1) & (CUSTOM_BIOS_INPUT_RB_SZ - 1);
> >> +
> >> +=09/* If no active custom BIOS input pending request, do not consume =
further work */
> >> +=09if (!entry.preq)
> >>  =09=09return;
> >> =20
> >>  =09if (!pdev->smart_pc_enabled)
> >> @@ -165,20 +176,14 @@ static void amd_pmf_get_custom_bios_inputs(struc=
t amd_pmf_dev *pdev,
> >>  =09case PMF_IF_V1:
> >>  =09=09if (!is_apmf_bios_input_notifications_supported(pdev))
> >>  =09=09=09return;
> >> -=09=09amd_pmf_update_bios_inputs(pdev, pdev->req1.pending_req, custom=
_bios_inputs_v1,
> >> -=09=09=09=09=09   pdev->req1.custom_policy, in);
> >> +=09=09amd_pmf_update_bios_inputs(pdev, entry.preq, custom_bios_inputs=
_v1, entry.val, in);
> >>  =09=09break;
> >>  =09case PMF_IF_V2:
> >> -=09=09amd_pmf_update_bios_inputs(pdev, pdev->req.pending_req, custom_=
bios_inputs,
> >> -=09=09=09=09=09   pdev->req.custom_policy, in);
> >> +=09=09amd_pmf_update_bios_inputs(pdev, entry.preq, custom_bios_inputs=
, entry.val, in);
> >=20
> > Could we pass the entry instead now?
> >=20
> >>  =09=09break;
> >>  =09default:
> >>  =09=09break;
> >>  =09}
> >> -
> >> -=09/* Clear pending requests after handling */
> >> -=09memset(&pdev->req, 0, sizeof(pdev->req));
> >> -=09memset(&pdev->req1, 0, sizeof(pdev->req1));
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
--8323328-160179283-1762510932=:1070--
