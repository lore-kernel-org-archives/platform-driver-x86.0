Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205461F3BAC
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Sep 2025 06:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757573953; cv=none; b=SNv00SnoX9nKL87fJn5hprYAGe+5q+WNYPXK6mSiZCAwttQzm7O4XiUlQLzWanuuLHhKEGYBB6MZk8HAhI728hnCENORnxuLF6qSvgAApEmC0IwLJfEenVaVKSN0IF6/g+c6tczksINkoc0lMaIOhj0HqjqGjmwx0b/z3NxmfW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757573953; c=relaxed/simple;
	bh=U2ICFLUC8AFk7vYooJBSybSbcMlKO106luwllWtS6I8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=FGRXpCVryturaQ6p4hOKyDiyx4cp7/x5PrDlo+I0qo0bXY4sNvBgLEjGqdOMVCsJqX0T1bCCLa08iKpzEH9u22Kg3vCu3/G1K1E5PVvTjoK855Y85qH5FngMT0N1d5Qu34AsZ9Og1XbeXxSGmtK0wlOMDWfIdSjVU0lREk3NSW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GRjXuv23; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GRjXuv23"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757573952; x=1789109952;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=U2ICFLUC8AFk7vYooJBSybSbcMlKO106luwllWtS6I8=;
  b=GRjXuv23CUaklxh9ABm5YW+iQ57yvApWdYfvFMjNKMux0spkpBxPWMx+
   HUKr8uBE5zn61DMmoH9Fbzh7fCCXIx8fhQEqAWmfUtgPUpUJH8fJVPi8d
   RMFcu8urVhIKS+EwhmTSRSFBmlL+iWfXawoDfuKwjwtCCduQ43tO6/yTa
   Bg5Pg98ff4f4jESksAmpv1B+tPgY++xns+a725gpPKQOcFHSCX/4fotuv
   Ic6OyROlbTBYFl3YR6ZBa/1R/HjcHa2uiCc95j3gyxs2r3JSlaC+ael8V
   MgD5wH8laTbUjW3zAv82AVtvxHuYvQVB3U0W/DoCzc2pjKwC3lqI1WTg3
   w==;
X-CSE-ConnectionGUID: TkjYF31BR/imZLBR6xPbhg==
X-CSE-MsgGUID: hfElX/AZStKfcMJVrrILRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="85340398"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; 
   d="scan'208";a="85340398"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 23:59:12 -0700
X-CSE-ConnectionGUID: 2j55oxvgRsKLtsaHHv6gkg==
X-CSE-MsgGUID: VrVFggXSRLamfu1IMTRgbw==
X-ExtLoop1: 1
Received: from opintica-mobl1 (HELO localhost) ([10.245.245.187])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 23:59:08 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 11 Sep 2025 09:59:05 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com, 
    Yijun Shen <Yijun.Shen@dell.com>
Subject: Re: [PATCH v5 RESEND 6/9] platform/x86/amd/pmf: Add custom BIOS
 input support for AMD_CPU_ID_PS
In-Reply-To: <7f93331e-0576-40f1-a692-9d41da778dc9@amd.com>
Message-ID: <6287dfa9-9938-278a-fbc1-e3b142c42a3c@linux.intel.com>
References: <20250901110140.2519072-1-Shyam-sundar.S-k@amd.com> <20250901110140.2519072-7-Shyam-sundar.S-k@amd.com> <2ba64be3-34c8-b9e5-549a-8548571168c2@linux.intel.com> <7f93331e-0576-40f1-a692-9d41da778dc9@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-250792108-1757573945=:944"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-250792108-1757573945=:944
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 10 Sep 2025, Shyam Sundar S K wrote:
> On 9/10/2025 16:01, Ilpo J=C3=A4rvinen wrote:
> > On Mon, 1 Sep 2025, Shyam Sundar S K wrote:
> >=20
> >> The PMF ACPI Specification (APMF) has been revised to version 1.3 to a=
llow
> >> for additional custom BIOS inputs, enabling OEMs to have more precise
> >> thermal management of the system. This update includes adding support =
to
> >> the driver using the new data structure received from the BIOS through=
 the
> >> existing APMF interfaces.
> >>
> >> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> >> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> >> Tested-by: Yijun Shen <Yijun.Shen@Dell.com>
> >> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >> ---
> >>  drivers/platform/x86/amd/pmf/acpi.c | 58 ++++++++++++++++++++++++++--=
-
> >>  drivers/platform/x86/amd/pmf/pmf.h  | 22 +++++++++++
> >>  drivers/platform/x86/amd/pmf/spc.c  | 36 +++++++++++++++---
> >>  3 files changed, 105 insertions(+), 11 deletions(-)
> >>
> >> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x8=
6/amd/pmf/acpi.c
> >> index 4982311ac045..41c34c26ceec 100644
> >> --- a/drivers/platform/x86/amd/pmf/acpi.c
> >> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> >> @@ -320,6 +320,11 @@ int apmf_get_sbios_requests_v2(struct amd_pmf_dev=
 *pdev, struct apmf_sbios_req_v
> >>  =09return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS, r=
eq, sizeof(*req));
> >>  }
> >> =20
> >> +int apmf_get_sbios_requests_v1(struct amd_pmf_dev *pdev, struct apmf_=
sbios_req_v1 *req)
> >> +{
> >> +=09return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS, r=
eq, sizeof(*req));
> >> +}
> >> +
> >>  int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbi=
os_req *req)
> >>  {
> >>  =09return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS,
> >> @@ -338,6 +343,18 @@ static void apmf_event_handler_v2(acpi_handle han=
dle, u32 event, void *data)
> >>  =09=09dev_err(pmf_dev->dev, "Failed to get v2 SBIOS requests: %d\n", =
ret);
> >>  }
> >> =20
> >> +static void apmf_event_handler_v1(acpi_handle handle, u32 event, void=
 *data)
> >> +{
> >> +=09struct amd_pmf_dev *pmf_dev =3D data;
> >> +=09int ret;
> >> +
> >> +=09guard(mutex)(&pmf_dev->cb_mutex);
> >> +
> >> +=09ret =3D apmf_get_sbios_requests_v1(pmf_dev, &pmf_dev->req1);
> >> +=09if (ret)
> >> +=09=09dev_err(pmf_dev->dev, "Failed to get v1 SBIOS requests: %d\n", =
ret);
> >> +}
> >> +
> >>  static void apmf_event_handler(acpi_handle handle, u32 event, void *d=
ata)
> >>  {
> >>  =09struct amd_pmf_dev *pmf_dev =3D data;
> >> @@ -427,6 +444,11 @@ int apmf_get_dyn_slider_def_dc(struct amd_pmf_dev=
 *pdev, struct apmf_dyn_slider_
> >>  =09return apmf_if_call_store_buffer(pdev, APMF_FUNC_DYN_SLIDER_DC, da=
ta, sizeof(*data));
> >>  }
> >> =20
> >> +static apmf_event_handler_t apmf_event_handlers[] =3D {
> >> +=09[PMF_IF_V1] =3D apmf_event_handler_v1,
> >> +=09[PMF_IF_V2] =3D apmf_event_handler_v2,
> >> +};
> >> +
> >>  int apmf_install_handler(struct amd_pmf_dev *pmf_dev)
> >>  {
> >>  =09acpi_handle ahandle =3D ACPI_HANDLE(pmf_dev->dev);
> >> @@ -446,13 +468,26 @@ int apmf_install_handler(struct amd_pmf_dev *pmf=
_dev)
> >>  =09=09apmf_event_handler(ahandle, 0, pmf_dev);
> >>  =09}
> >> =20
> >> -=09if (pmf_dev->smart_pc_enabled && pmf_dev->pmf_if_version =3D=3D PM=
F_IF_V2) {
> >> +=09if (!pmf_dev->smart_pc_enabled)
> >> +=09=09return -EINVAL;
> >=20
> > Hi,
> >=20
> > Is this change okay? Previously this function returned 0 in this case.
> >=20
>=20
> Yes - this change is okay and was introduced to address your v4
> remarks w.r.t to code optimization.
>=20
> This function still returns 0 upon success but this additional check
> is to make sure we don't enter the underlying code block for smart pc
> if the feature is not enabled.

Code flow within this function is fine but this doesn't answer my main=20
concern related to the returned value. Is it okay for this function to=20
return -EINVAL if smart pc feature is not enabled? Previously this=20
function returned 0 also if smart pc was not enabled.

(Maybe you wanted to say it's okay to change the returned value from 0 to=
=20
-EINVAL but it's notindicated by your words, thus reiterating the=20
question.)

--=20
 i.

--8323328-250792108-1757573945=:944--
