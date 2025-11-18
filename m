Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906C535BDAA
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Nov 2025 15:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763481571; cv=none; b=ph+hDNtDaB7fCK/NnmuZG7IeTo8r0vguwKZZStZW6dFvGPSLLnpdvA3uQ2OA/Po1z1oedgfQ/NXHpjGlgLhXn1loGjeJism0jLrf2nLA7rS2LS7R+PhyTjZuJ1CVt9g2UVd6ubO36WH/1VRHf8gzn1sukxGi6mwLA0KJTFjntLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763481571; c=relaxed/simple;
	bh=LlDENNd5bTmoeAhUm+y+v77jTCYp8gHAHqeLEyl1Pfg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=CtWCep/6wy2heKgd+x5Ox92PrJbCDf7bkNcrUDcMhWVlRE4Fd059ngGUPlJAqywKJFqibxCh1P7FMp9a7yHxNWzHGbcYAnjVmACsBSBMKP7VNjkagSaysfEPjiVQaTmLEZ7SJB3L/KFjRWWPbleCqUwmKid/2c7lmb82fbzCQ3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kGqOTkeJ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kGqOTkeJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763481570; x=1795017570;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=LlDENNd5bTmoeAhUm+y+v77jTCYp8gHAHqeLEyl1Pfg=;
  b=kGqOTkeJrU1WZyCIkMVJLq/xV5kFvAE/MnzCnSEds6W784Cx5dN+sAsp
   11XZ+G4W9aMbxBZBgeeoCjuOuPys4x60XADrBSYRybhS3OOjoiyw2jPF+
   fhCRY+U6KRfaJyZldB9zteUdhXqG1uO2dpAA23LEOo3AlYRf2XJ0n7ESd
   bFcUT/8bGVSc9LVOfZKrSs+WxaXcRYJPgTjuvoLhLXHJcZADxXR+TmRAX
   7UojBFO65K8XmyapcKLRCZhe2YROMLKzjg/lg5I0CwSaVTxVlEFF19iHl
   aAKHGKU0wU+wBbPZ3lr0/dVKo3mFvxqA0UuEyL5XwmUd9cjN5zlV+icrG
   w==;
X-CSE-ConnectionGUID: SqJcQDqDSHW2407aTxk6Pw==
X-CSE-MsgGUID: RW5EtUi7RDqaPKd7WBYM3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="53078682"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="53078682"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 07:59:29 -0800
X-CSE-ConnectionGUID: SfoASxzVRQa9mcmyD+n9fQ==
X-CSE-MsgGUID: YhD5wlZEQkKMU93nO9E8VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="214181714"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.74])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 07:59:25 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 18 Nov 2025 17:59:22 +0200 (EET)
To: Mario Limonciello <mario.limonciello@amd.com>
cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, lizhi.hou@amd.com, 
    VinitKumar Shukla <VinitKumar.Shukla@amd.com>
Subject: Re: [PATCH v2 5/5] accel/amdxdna: Provide real-time NPU power estimate
 via AMD PMF
In-Reply-To: <e6551b53-cb89-46e6-9c3c-545d14d79642@amd.com>
Message-ID: <8349468a-79ac-dc1c-d484-b9c9dd340e1e@linux.intel.com>
References: <20251111063737.4156385-1-Shyam-sundar.S-k@amd.com> <20251111063737.4156385-6-Shyam-sundar.S-k@amd.com> <7034fae1-4096-4cdb-a46f-5e23e7accfa0@amd.com> <b8f2d8a0-3131-45cc-8c55-8fbf4ca06cfc@amd.com> <e6551b53-cb89-46e6-9c3c-545d14d79642@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-781601104-1763481562=:1205"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-781601104-1763481562=:1205
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 14 Nov 2025, Mario Limonciello wrote:
> On 11/13/2025 1:33 AM, Shyam Sundar S K wrote:
> > On 11/12/2025 23:33, Mario Limonciello wrote:
> > > On 11/11/25 12:37 AM, Shyam Sundar S K wrote:
> > > > From: VinitKumar Shukla <VinitKumar.Shukla@amd.com>
> > > >=20
> > > > Add aie2_smu_get_power_estimate() to obtain NPU power readings from=
 the
> > > > AMD PMF driver. This xdna interface enables user space to reflect
> > > > current
> > > > workload power consumption in real time.
> > >=20
> > > But.. it doesn't.=C2=A0 It just adds a new function that could potent=
ially
> > > do this job.=C2=A0 The actual gluing it to userspace in some way to u=
se
> > > this function will be another patch.
> >=20
> > For now, yes.. that's right. XDNA team will add more support on it
> > that goes via the accel tree. But this patch is meant to have a
> > minimal change on the xdna side so that there is a  consumer of the
> > pmf symbol that is getting exported to the kernel.
> >=20
> > So, there is more support coming on the way. If you think, its worth
> > to rephrase the commit?
>=20
> Yes; that other support isn't happening this kernel cycle.  So the commit
> message should be accurate to what it's actually doing (laying ground wor=
k).

To me it looks this and patch 4 should be submitted with the actual user=20
instead of trying to justify things with far in the future changes. I've=20
no problem with creating immutable branch if necessary when multiple trees=
=20
are involved.

--=20
 i.

> > > > Signed-off-by: VinitKumar Shukla <VinitKumar.Shukla@amd.com>
> > > > Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> > > > ---
> > > >  =C2=A0 drivers/accel/amdxdna/aie2_pci.h |=C2=A0 2 ++
> > > >  =C2=A0 drivers/accel/amdxdna/aie2_smu.c | 12 ++++++++++++
> > > >  =C2=A0 2 files changed, 14 insertions(+)
> > > >=20
> > > > diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/
> > > > amdxdna/aie2_pci.h
> > > > index 91a8e948f82a..5601de841b5b 100644
> > > > --- a/drivers/accel/amdxdna/aie2_pci.h
> > > > +++ b/drivers/accel/amdxdna/aie2_pci.h
> > > > @@ -8,6 +8,7 @@
> > > >  =C2=A0 =C2=A0 #include <drm/amdxdna_accel.h>
> > > >  =C2=A0 #include <linux/semaphore.h>
> > > > +#include <linux/amd-pmf-io.h>
> > > >  =C2=A0 =C2=A0 #include "amdxdna_mailbox.h"
> > > >  =C2=A0 @@ -240,6 +241,7 @@ int aie2_smu_init(struct amdxdna_dev_hd=
l *ndev);
> > > >  =C2=A0 void aie2_smu_fini(struct amdxdna_dev_hdl *ndev);
> > > >  =C2=A0 int npu1_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_leve=
l);
> > > >  =C2=A0 int npu4_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_leve=
l);
> > > > +int aie2_smu_get_power_estimate(void);
> > > >  =C2=A0 =C2=A0 /* aie2_pm.c */
> > > >  =C2=A0 int aie2_pm_init(struct amdxdna_dev_hdl *ndev);
> > > > diff --git a/drivers/accel/amdxdna/aie2_smu.c b/drivers/accel/
> > > > amdxdna/aie2_smu.c
> > > > index d303701b0ded..7b5e2c383dd3 100644
> > > > --- a/drivers/accel/amdxdna/aie2_smu.c
> > > > +++ b/drivers/accel/amdxdna/aie2_smu.c
> > > > @@ -54,6 +54,18 @@ static int aie2_smu_exec(struct amdxdna_dev_hdl
> > > > *ndev, u32 reg_cmd,
> > > >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > > >  =C2=A0 }
> > > >  =C2=A0 +int aie2_smu_get_power_estimate(void)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 struct amd_pmf_npu_metrics npu_metrics;
> > > > +=C2=A0=C2=A0=C2=A0 int ret;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 ret =3D amd_pmf_get_npu_data(&npu_metrics);
> > > > +=C2=A0=C2=A0=C2=A0 if (ret)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 return npu_metrics.npu_power;
> > > > +}
> > > > +
> > > >  =C2=A0 int npu1_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_leve=
l)
> > > >  =C2=A0 {
> > > >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 freq;
> > >=20
> >=20
>=20
--8323328-781601104-1763481562=:1205--
