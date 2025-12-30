Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870A62A1BB;
	Tue, 30 Dec 2025 13:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767102093; cv=none; b=P2V1JyIibxqk7XoEaCC7oxhvgJoxTUGnkIgfoByir4qKV9JUr2IjMkwbeHUlnNN9VjHPh1TcIVosx0eP/iVvsGsfeu2s81ThE7ZmLJwQuvJdGIGILHKRYFP7V+83B944pmaWsEGvYPio5z8zNI1JNfCYV0eaHmJGuJz6f0DMa1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767102093; c=relaxed/simple;
	bh=jTVXkJBui5GfHxe32TmF6NWw8h9YVF7iBdXS6HlK8cY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=uGyuXXPbwxB0wMP5FgJ/iEfgx7IqM/lmgIZJOB9oz84iWYuvZnaG02VhzPzZUWt1TJ8VBMPGT7fOG0SJcFN2UMitkXRJepzA9JtI7P2WzaL5dFlBsT3UFl9JF1gNggmikwHNLoZgM4r6gz/ZZmPCTfxAdK03gAAdWb/mNAIRfPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MWIroVcr; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MWIroVcr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767102091; x=1798638091;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=jTVXkJBui5GfHxe32TmF6NWw8h9YVF7iBdXS6HlK8cY=;
  b=MWIroVcrCXg5y3oFMcU2hsWV5WqB1fYvkmlqkNihXUIVrXCt4bpv7+x1
   xCkj1MvBlOe08/ywGgNSkQjEkTPPcvCMmU/GcQRstZLzXuvqf2xNvDF+0
   mMVTrW6o7Jw0Evcw6pkY6kuHbx7euDF0McD6j9SkxcEbJ/XHKrbxHZwoV
   y41rXmcw2BrmfiVTLXZlzS2oLXSNpxouhawx6tTmZqmjLKSYuqeuoUCxg
   /ZXs2YOIktP7/pmiw3+g5LChRoMw3MtXfamBXd75nDla3P1Z2Uh9zROvp
   0+dI6ikLMK9y+3ULgSebzqRELbIcPjnL0yuL2jodH4yu0ThoXu0PUe826
   Q==;
X-CSE-ConnectionGUID: SlkEMptlRriZDIxhB1tdoQ==
X-CSE-MsgGUID: eC8uatCORr+YcniEOqjjow==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="86268734"
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; 
   d="scan'208";a="86268734"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 05:41:31 -0800
X-CSE-ConnectionGUID: Uk8Ba9nCSn2pMwKQXfHWIw==
X-CSE-MsgGUID: i55o6j+rSBW+42YSUY2t9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; 
   d="scan'208";a="205697490"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.114])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 05:41:28 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 30 Dec 2025 15:41:25 +0200 (EET)
To: Denis Benato <benato.denis96@gmail.com>
cc: Denis Benato <denis.benato@linux.dev>, LKML <linux-kernel@vger.kernel.org>, 
    platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
    "Luke D . Jones" <luke@ljones.dev>, Mateusz Schyboll <dragonn@op.pl>
Subject: Re: [PATCH 1/3] platform/x86: asus-wmi: explicitly mark more code
 with CONFIG_ASUS_WMI_DEPRECATED_ATTRS
In-Reply-To: <1579d5ed-8233-44a5-8e0d-5462fd8b41d4@gmail.com>
Message-ID: <9f5085e9-454f-f003-27cd-0eb86dfd9e11@linux.intel.com>
References: <20251225143007.2684239-1-denis.benato@linux.dev> <20251225143007.2684239-2-denis.benato@linux.dev> <54cc6828-9191-403c-18d5-76f768d70381@linux.intel.com> <1579d5ed-8233-44a5-8e0d-5462fd8b41d4@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1920203301-1767102085=:985"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1920203301-1767102085=:985
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 30 Dec 2025, Denis Benato wrote:
> On 12/29/25 11:06, Ilpo J=C3=A4rvinen wrote:
> > On Thu, 25 Dec 2025, Denis Benato wrote:
> >
> >> Be more explicit in code that will be excluded when compiling
> >> with CONFIG_ASUS_WMI_DEPRECATED_ATTRS disabled.
> > Does this result in build fails or warnings? If that's the case, it sho=
uld=20
> > be mentioned in the changelog + Fixes tag added.
> Hi,
>=20
> Sadly no, despite a property in a struct instantiated only once
> being forcefully set to false no warning is emitted by neither
> clang nor gcc :(

Ah, I was mainly expecting unused function warning but apparently since it=
=20
was still being "used" it obviously won't trigger that warning.

--=20
 i.

> >> Signed-off-by: Denis Benato <denis.benato@linux.dev>
> >> ---
> >>  drivers/platform/x86/asus-wmi.c | 10 ++++++++++
> >>  1 file changed, 10 insertions(+)
> >>
> >> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/as=
us-wmi.c
> >> index 4aec7ec69250..a49447eff4f4 100644
> >> --- a/drivers/platform/x86/asus-wmi.c
> >> +++ b/drivers/platform/x86/asus-wmi.c
> >> @@ -302,7 +302,11 @@ struct asus_wmi {
> >>  =09u32 nv_temp_target;
> >> =20
> >>  =09u32 kbd_rgb_dev;
> >> +
> >> +#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
> >>  =09bool kbd_rgb_state_available;
> >> +#endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
> >> +
> >>  =09bool oobe_state_available;
> >> =20
> >>  =09u8 throttle_thermal_policy_mode;
> >> @@ -1060,6 +1064,7 @@ static const struct attribute_group kbd_rgb_mode=
_group =3D {
> >>  };
> >> =20
> >>  /* TUF Laptop Keyboard RGB State ************************************=
**********/
> >> +#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
> >>  static ssize_t kbd_rgb_state_store(struct device *dev,
> >>  =09=09=09=09 struct device_attribute *attr,
> >>  =09=09=09=09 const char *buf, size_t count)
> >> @@ -1106,6 +1111,8 @@ static const struct attribute_group kbd_rgb_stat=
e_group =3D {
> >>  =09.attrs =3D kbd_rgb_state_attrs,
> >>  };
> >> =20
> >> +#endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
> >> +
> >>  static const struct attribute_group *kbd_rgb_mode_groups[] =3D {
> >>  =09NULL,
> >>  =09NULL,
> >> @@ -1861,8 +1868,11 @@ static int asus_wmi_led_init(struct asus_wmi *a=
sus)
> >> =20
> >>  =09if (asus->kbd_rgb_dev)
> >>  =09=09kbd_rgb_mode_groups[num_rgb_groups++] =3D &kbd_rgb_mode_group;
> >> +
> >> +#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
> >>  =09if (asus->kbd_rgb_state_available)
> >>  =09=09kbd_rgb_mode_groups[num_rgb_groups++] =3D &kbd_rgb_state_group;
> >> +#endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
> >> =20
> >>  =09asus->led_workqueue =3D create_singlethread_workqueue("led_workque=
ue");
> >>  =09if (!asus->led_workqueue)
> >>
>=20
5~
--8323328-1920203301-1767102085=:985--
