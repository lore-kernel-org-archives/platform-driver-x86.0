Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7A9455184;
	Tue, 15 Sep 2026 20:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789505790; cv=none; b=FCGGwrE3u8R90Du5XyoPOwfhUSyJ016cUIlc4HyssDdxKU5MqdPxH7/1hEH9RwlGhQORRzOLnXpRFs24uCiFXj35koeQ3zqr00L50CyDLSK071fwxBdRxryzquZqJ67OW2NNIuWzptVU4fKvhL9m9k+x+jNqDEJBjhjsvUi7wCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789505790; c=relaxed/simple;
	bh=YmSm6uUiRGSBUorMyzVSyj4LFelQ+7u9nHh6pb/5p1E=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=sD+JIBh2y3dlfwPxAF/HDzy82SDoevaqjfzxdIzl+9yjXNA3Jn7KjHh9VzehC6glzGB6qPgUApxz1omV9mKT0O5TqxIL9QONKpK5bbnBiyNOc6vEgEFcaIrTqvBidHdVoTSoTDC1gszDdBOG6XXpu4TJW4y/Aux2bzwpOUjiyuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dKxsZo8U; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dKxsZo8U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789505788; x=1821041788;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=YmSm6uUiRGSBUorMyzVSyj4LFelQ+7u9nHh6pb/5p1E=;
  b=dKxsZo8UHIcADPUipVBaQkhmIBbm3Yz6SCd2ECO9h+DruyZmA/pVRd1H
   /E0gt9KHHWLgVlbv6/Ac50SPyf/PpMMaxv7sYiHZA2jcXDjS5t59EuAkd
   r9qQAaeO+4Ia0c2YsDK5JsevrdpEjYo0tqaEWwloZVEeIO2QNQVBvM7hf
   nydb7HjxR4b8d35aVQWRfwOm0OlyWbfgaMDrCx72jRB1jRMAW6o1PBf8y
   VkgUYr6ucNCcn9HtCyPXixqfCeRi9i7T/JVcGSBwBoHpAg0XTVI8fAYFS
   jWxfwS//z99fqt4QSOmZa0ojFg4fkpCUAysrF7mms9UUM9EdD4oZV2/3h
   w==;
X-CSE-ConnectionGUID: /P7h0ScXTricWDYYzhK2uw==
X-CSE-MsgGUID: sQfwahz6T6aDRq+AMs/sAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90017815"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="90017815"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 13:56:26 -0700
X-CSE-ConnectionGUID: EZoOcekBSZ2koO8wh6qEPg==
X-CSE-MsgGUID: NZUC+kvPTuGuzETeXuRoNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270499703"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 13:56:23 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 15 Sep 2026 23:56:21 +0300 (EEST)
To: Denis Benato <denis.benato@linux.dev>
cc: busybox11 <busybox11th@gmail.com>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D. Jones" <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: asus-armoury: add dGPU disable fallback
 DEVID for ProArt H7606 series
In-Reply-To: <b647e0a5-4122-4772-b317-d2d7a8cb4d31@linux.dev>
Message-ID: <c2d620e4-25ba-c31b-0143-4a53ff3edd8b@linux.intel.com>
References: <20260810-asus_armoury_dgpu_new_devid-v1-1-0a5c845414e4@gmail.com> <40f1840a-e3e4-29d3-66b5-a13737224f99@linux.intel.com> <b647e0a5-4122-4772-b317-d2d7a8cb4d31@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-138060363-1789505781=:27301"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-138060363-1789505781=:27301
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 15 Sep 2026, Denis Benato wrote:

>=20
> On 9/15/26 22:38, Ilpo J=C3=A4rvinen wrote:
> > On Mon, 10 Aug 2026, busybox11 via B4 Relay wrote:
> >
> >> From: busybox11 <busybox11th@gmail.com>
> >>
> >> Newer ASUS ProArt laptops (e.g. H7606 series) implement dGPU power
> >> control on WMI DEVID 0x00090120 instead of the usual 0x00090020.
> >> The default DEVID returns 0xFFFFFFFE on these models, so the
> >> dgpu_disable firmware attribute is never created and the dGPU cannot
> >> be re-enabled from Linux at all.
> >>
> >> Add a fallback probe for device ID 0x00090120 following the same
> >> approach as the gpu_mux_dev_id probe.
> >>
> >> Details for 0x00090120 (confirmed on H7606W using direct WMNB calls
> >> and inspecting the DSDT DEVS handler):
> >>   - Reading DSTS returns 0x00010001 when the dGPU is off (CUMA=3D1),
> >> =09or 0x00010000 when it's on.
> >>   - Writing DEVS: 0 enables the dGPU (calls PG00._ON() + Notifies
> >> =09PEGP, Device Check), and 1 disables or ejects it.
> >>
> >> This behavior matches the dgpu_disable attribute (1 =3D disabled).
> >>
> >> Signed-off-by: busybox11 <busybox11th@gmail.com>
> > Unfortunately, we cannot accept anonymous or pseudonym signed=20
> > contributions so please sign off with your real name. For more=20
> > information about signing of patches, please see:
> >
> > Documentation/process/submitting-patches.rst
> >
> >> ---
> >>  drivers/platform/x86/asus-armoury.c        | 32 +++++++++++++++++++++=
++++-----
> >>  include/linux/platform_data/x86/asus-wmi.h |  3 +++
> >>  2 files changed, 30 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x8=
6/asus-armoury.c
> >> index 495dc1e31..f39b52451 100644
> >> --- a/drivers/platform/x86/asus-armoury.c
> >> +++ b/drivers/platform/x86/asus-armoury.c
> >> @@ -93,6 +93,7 @@ struct asus_armoury_priv {
> >> =20
> >>  =09u32 mini_led_dev_id;
> >>  =09u32 gpu_mux_dev_id;
> >> +=09u32 dgpu_disable_dev_id;
> >>  };
> >> =20
> >>  static struct asus_armoury_priv asus_armoury =3D {
> >> @@ -452,8 +453,8 @@ static ssize_t gpu_mux_mode_current_value_store(st=
ruct kobject *kobj,
> >>  =09if (err)
> >>  =09=09return err;
> >> =20
> >> -=09if (armoury_has_devstate(ASUS_WMI_DEVID_DGPU)) {
> >> -=09=09err =3D armoury_get_devstate(NULL, &result, ASUS_WMI_DEVID_DGPU=
);
> >> +=09if (asus_armoury.dgpu_disable_dev_id) {
> >> +=09=09err =3D armoury_get_devstate(NULL, &result, asus_armoury.dgpu_d=
isable_dev_id);
> >>  =09=09if (err)
> >>  =09=09=09return err;
> >>  =09=09if (result && !optimus) {
> >> @@ -507,7 +508,8 @@ static ssize_t dgpu_disable_current_value_store(st=
ruct kobject *kobj,
> >>  =09}
> >> =20
> >>  =09scoped_guard(mutex, &asus_armoury.egpu_mutex) {
> >> -=09=09err =3D armoury_set_devstate(attr, disable ? 1 : 0, NULL, ASUS_=
WMI_DEVID_DGPU);
> >> +=09=09err =3D armoury_set_devstate(attr, disable ? 1 : 0, NULL,
> >> +=09=09=09=09=09   asus_armoury.dgpu_disable_dev_id);
> >>  =09=09if (err)
> >>  =09=09=09return err;
> >>  =09}
> >> @@ -516,7 +518,7 @@ static ssize_t dgpu_disable_current_value_store(st=
ruct kobject *kobj,
> >> =20
> >>  =09return count;
> >>  }
> >> -ASUS_WMI_SHOW_INT(dgpu_disable_current_value, ASUS_WMI_DEVID_DGPU);
> >> +ASUS_WMI_SHOW_INT(dgpu_disable_current_value, asus_armoury.dgpu_disab=
le_dev_id);
> >>  ASUS_ATTR_GROUP_BOOL(dgpu_disable, "dgpu_disable", "Disable the dGPU"=
);
> >> =20
> >>  /* Values map for eGPU activation requests. */
> >> @@ -790,7 +792,6 @@ ASUS_ATTR_GROUP_INT_VALUE_ONLY_RO(nv_base_tgp, ATT=
R_NV_BASE_TGP, ASUS_WMI_DEVID_
> >>  static const struct asus_attr_group armoury_attr_groups[] =3D {
> >>  =09{ &egpu_connected_attr_group, ASUS_WMI_DEVID_EGPU_CONNECTED },
> >>  =09{ &egpu_enable_attr_group, ASUS_WMI_DEVID_EGPU },
> >> -=09{ &dgpu_disable_attr_group, ASUS_WMI_DEVID_DGPU },
> >>  =09{ &apu_mem_attr_group, ASUS_WMI_DEVID_APU_MEM },
> >> =20
> >>  =09{ &ppt_pl1_spl_attr_group, ASUS_WMI_DEVID_PPT_PL1_SPL },
> >> @@ -934,6 +935,21 @@ static int asus_fw_attr_add(void)
> >>  =09=09}
> >>  =09}
> >> =20
> >> +=09asus_armoury.dgpu_disable_dev_id =3D 0;
> >> +=09if (armoury_has_devstate(ASUS_WMI_DEVID_DGPU))
> >> +=09=09asus_armoury.dgpu_disable_dev_id =3D ASUS_WMI_DEVID_DGPU;
> >> +=09else if (armoury_has_devstate(ASUS_WMI_DEVID_GPU_MODE))
> >> +=09=09asus_armoury.dgpu_disable_dev_id =3D ASUS_WMI_DEVID_GPU_MODE;
> >> +
> >> +=09if (asus_armoury.dgpu_disable_dev_id) {
> > Now I started to wonder why are we doing it like this and not using=20
> > .is_visible?
> >
> > This question applies to the similar, existing cases as well.
> >
> > Denis?
> >
> >
> I don't understand the question. There are a bunch of .is_visible in the =
kernel and
> I'm not sure if I am looking the right one and therefore if I understood =
the question correctly.
>=20
> It is written as this to memorize what the correct id is and therefore wh=
at
> to do.... but I doubt this answers you.

No, it doesn't.

With sysfs, .is_visible callbacks are normally used to hide attributes=20
when feature is not supported or for other reasons, which simplifies the
setup code. This one checks manually asus_armoury.dgpu_disable_dev_id !=3D =
0=20
in the setup code.

(In addition, sysfs could even be asked to change the visibility=20
on-the-fly so it would re-execute the .is_visible callbacks to determine=20
which of the attributes to show.)


--=20
 i.

--8323328-138060363-1789505781=:27301--
