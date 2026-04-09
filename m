Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352A9378817;
	Thu,  9 Apr 2026 12:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775738743; cv=none; b=NmkQSITdAwRJ5f0vpxAc4xbj0ZZ/lrPqnIhrG5WT6icxdaby7GGIhZSWCQcQNQ4CQCMeadrXUY8xWKLmkDrjcxS7TUORtHl7cK0iBx17tf+PaItQLtcYJY8lHjHyO3qvQIOAOp3iRwku4BHzz39bpzTuQ23akQ/19jT8eUCnkXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775738743; c=relaxed/simple;
	bh=uDYeBqG1pZWecDWl2DJkWpYEoVM2UWgZGXsu2/NoVT8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XlvOi0pFQQZsnvTuPrD5UNUx5ZEJR/3ZiN/AgLhie3RqnqNTonM8M9OVAVDOS49HC0hRRnhXkKmComxqzx2bFMCCQ0/U1lzI1OgeCuJypUNxuJEIjpEv2c0tDzI7R/7gvI/xzB1pmr25PwZNhRH1fChmr6zOGC2jyOklGmnyI4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j3yVDDgu; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j3yVDDgu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775738742; x=1807274742;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=uDYeBqG1pZWecDWl2DJkWpYEoVM2UWgZGXsu2/NoVT8=;
  b=j3yVDDguxniQnG++drdD9rM8oiuf5iI/1iLEwyL6zE33fwMFWsV0eTp5
   zmAuqmzUEfpEFvJF+37X7nGzZ8lmLuxPQ9tV1xeX0GgPyCDRBeYsC7mFT
   BY6H0E+A7/gxqHNQfjmIYXiU66oC7HnIvYIIDHF15kZFOYmyl7Iz2OOAe
   YvdlOWFBlTn4wfaKSFqbScBrgbUusp94oyi86zCBz6CsfTKYzqRCeAmO1
   cr1jb7BtTz+P+a6bX2F9ih0CCuoZzVPeQxJoPHZdm4+v71P3p9qZJsHM5
   GYNGLkRUDgCs/HviQZV59DSRazpWqnie85qgJJlucKFcvO/8Q0iTMYXpt
   Q==;
X-CSE-ConnectionGUID: 8lo+mgQVR5KJu65fHpMX8Q==
X-CSE-MsgGUID: o0zuu7BaQgOQKnjsIoOFlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="87030626"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="87030626"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 05:45:41 -0700
X-CSE-ConnectionGUID: fDn2yc36RNevGzWeJJLp+g==
X-CSE-MsgGUID: 7pDIgRmnSe+G221rZSVghA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="227915974"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.197])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 05:45:37 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 9 Apr 2026 15:45:29 +0300 (EEST)
To: =?ISO-8859-15?Q?Jos=E9_Guilherme_de_Castro_Rodrigues?= <jose.guilherme.cr.bh@gmail.com>
cc: Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D. Jones" <luke@ljones.dev>, Denis Benato <benato.denis96@gmail.com>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: asus-wmi: fix camera key led on Zenbook
 S14
In-Reply-To: <ac6xgsMxzpnU_8FA@djouze-zen>
Message-ID: <7db8d74a-e250-d790-aaca-d02a08a7c091@linux.intel.com>
References: <acxSW8FgXbnFiqIL@djouze-zen> <ac6xgsMxzpnU_8FA@djouze-zen>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1068670578-1775738729=:968"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1068670578-1775738729=:968
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 2 Apr 2026, Jos=E9 Guilherme de Castro Rodrigues wrote:

> On Tue, Mar 31, 2026 at 08:01:47PM -0300, Jos=E9 Guilherme de Castro Rodr=
igues wrote:
> >=20
> > This change is not visible to userspace, as no sysfs attribute for
> > ASUS_WMI_DEVID_CAMERA_LED_NEG exists.
> > =20
> > +=09if (is_camera_toggle(code) && asus->camera_neg_led_available) {
> > +=09=09camera_neg_led_trigger_update(asus);
> > +=09=09return;
> > +=09}
> > +
> >  =09if (!sparse_keymap_report_event(asus->inputdev, code,
> >  =09=09=09=09=09key_value, autorelease))
> >  =09=09pr_info("Unknown key code 0x%x\n", code);
>=20
> This change is actually visible to userspace because I'm early returning
> and that means the event for the camera key is not propagated to
> userspace. Sashiko correctly identified that, as well as another detail
> in formatting (using space instead of tab for indentation on the newly
> added macros). The event is currently not used on my system, so I didn't
> notice it before.
>=20
> Removing the return fixes this. I can send a new version of the patch if
> necessary.

Please just send a new version. It will be much easier for me when I don't=
=20
need to hunt down odd spaces or do multi-line code edits.

--=20
 i.

--8323328-1068670578-1775738729=:968--
