Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397AD3A0B12;
	Thu, 26 Feb 2026 09:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772097510; cv=none; b=pJBdvmwr5OLRTcZbAJcFpiNoq8dtLx6BSzT1YX06FePeV4RAvinrhtq7jhLzWsVhxG1nvnR3fCMbe2uNL9y2K3pCNJlFoNUApzjab7ksaaSKAimMmuLARbKdO+0sygIramO+beqH07JxkoAWCJ5txO2xdAf19Drppkm31BuArME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772097510; c=relaxed/simple;
	bh=Wq/h6T6nfHUtSPqvKkuCx5aeAtIYD+SUgY/q2Vt/j14=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hvYbjB4NTIf5NhTQMEXd+1JJigbJvWK2HIbdIWQlGdZtHj4HqC8vCQkCZwQsL2Pz5tL5uCCxMF8h7yc/GbN21MbO4SnbC5Fz18hFNf0j2zJkvX8IXL5GfCNZUvIdI4l2zQYgTasAzMYwTOePTp771SNUUVD8wWlKVloXdCDbC24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WYDw12iZ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WYDw12iZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772097503; x=1803633503;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Wq/h6T6nfHUtSPqvKkuCx5aeAtIYD+SUgY/q2Vt/j14=;
  b=WYDw12iZ7J7bYD3E+Nu1skSttjIJ5+oQM616RaSJ27ltDQC6NRUoHBRS
   WJv1YLrTaImwE91qGi7EGN4SRhLaZXPVWYoMQaHRAqOw73MOAGg5euyS5
   i0hwS88EDAUvOxbqKUx+BtweH5RAE2SquBhsqvuidWu4hI7MbUXHvncnk
   5dmHHG2wlGcqqtdy5rdBtaG33ax9Bn9BahbgR2a0o3Fre4LnbDSZqgh/A
   xsoHGn44drZZPy/CrW0xo97HBYT48ZPVoFdzUnZhUgPh+NSgh9UAGPOfZ
   AEX+iCpyEP+HLG8JppsS/nrVyzmfdI+Jy7WiKMqzDRPK1L4mbMVADFpnw
   Q==;
X-CSE-ConnectionGUID: qzDbno1pRA68oQ5dQnHbSw==
X-CSE-MsgGUID: pr6FPWymSp6FLwm5U6YF/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73256512"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="73256512"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 01:18:22 -0800
X-CSE-ConnectionGUID: KE2u8VLTRJmS5mT97uRWJw==
X-CSE-MsgGUID: 3I9KmGJFRiC1hwRiQD1hjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="221012904"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.188])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 01:18:19 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 26 Feb 2026 11:18:15 +0200 (EET)
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
    Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>, 
    Rong Zhang <i@rong.moe>, Kurt Borja <kuurtb@gmail.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/6] platform/x86: lenovo-wmi-other: Add LWMI_ATTR_ID
 Macro
In-Reply-To: <947F9B21-0300-4C2A-A8DB-DC190DCE7004@gmail.com>
Message-ID: <c3a56c8a-b28a-1f48-c834-e34933158c24@linux.intel.com>
References: <20260224043200.2680384-1-derekjohn.clark@gmail.com> <20260224043200.2680384-2-derekjohn.clark@gmail.com> <c8031935-0dab-59d0-a23f-b93c203ef95f@linux.intel.com> <947F9B21-0300-4C2A-A8DB-DC190DCE7004@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-514791438-1772097495=:11587"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-514791438-1772097495=:11587
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 25 Feb 2026, Derek J. Clark wrote:

> On February 24, 2026 12:42:08 AM PST, "Ilpo J=C3=A4rvinen" <ilpo.jarvinen=
@linux.intel.com> wrote:
> >On Tue, 24 Feb 2026, Derek J. Clark wrote:
> >
> >> Adds LWMI_ATTR_ID macro. In the same vein as LWMI_ATTR_ID_FAN_RPM,
> >> but as a generic, to de-duplicate attribute_id assignment biolerplate.
> >>=20
> >> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> >> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> >> ---
> >>  drivers/platform/x86/lenovo/wmi-capdata.h  |  6 ++++
> >>  drivers/platform/x86/lenovo/wmi-gamezone.h |  1 +
> >>  drivers/platform/x86/lenovo/wmi-other.c    | 36 ++++++---------------=
-
> >>  3 files changed, 17 insertions(+), 26 deletions(-)
> >>=20
> >> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platf=
orm/x86/lenovo/wmi-capdata.h
> >> index 8c1df3efcc55..27202e2dc8a5 100644
> >> --- a/drivers/platform/x86/lenovo/wmi-capdata.h
> >> +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
> >> @@ -17,6 +17,12 @@
> >>  #define LWMI_ATTR_MODE_ID_MASK=09GENMASK(15, 8)
> >>  #define LWMI_ATTR_TYPE_ID_MASK=09GENMASK(7, 0)
> >> =20
> >> +#define LWMI_ATTR_ID(dev, feat, mode, type) \
> >> +=09(FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, dev) | \
> >> +=09 FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, feat) | \
> >> +=09 FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) | \
> >> +=09 FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, type))
> >
> >Why does this need to be macro? Static inline would have proper types.
> >
>=20
> Hi Ilpo,
>=20
> It doesn't, I was just keeping it consistent with other previous uses.=20
> It's not a problem to change it. I'll need to move it somewhere else=20
> since this is a header.

Did you mean to some other file? (As you can have static inline=20
functions just fine in a header.)

--=20
 i.

--8323328-514791438-1772097495=:11587--
