Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6261A2F532C
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Mar 2026 14:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773154356; cv=none; b=Ktyxeph3Ot2qsYHQEdTPACEyUco4BfcMlWx6u+NDcbnwF+8gC39X80iRQoGKPN6BVmi9t8xVUOvHxDGlDzVjnJE1541AHV+3I+xyertyXDWocfmycRqYVl02fuLn2eLrHAgiChb84quc3vOgcWgHcv56QCVz+Cc9DQ5cXfYJgi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773154356; c=relaxed/simple;
	bh=/TqgvRBkevBU5M5YIWX7VwgIwq1rVTzIvz69IqN6JQE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=rTihNAZPIRaGeMNMzfTHB9hPasYNsbTS9EFXJDA6Ty0QvkoxFq2PsNkdAW9CUPZHqlgtUe5j+UmVFew+VpI33KXee/rdsfUwGzmuPqdX4XRp9dV6crz1C6fCEqW5F/2DfSdEkOFpBfwLyHpZ1ymkdyv0FC76IB9VdyuUDUo5+y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kANq5SpN; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kANq5SpN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773154356; x=1804690356;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=/TqgvRBkevBU5M5YIWX7VwgIwq1rVTzIvz69IqN6JQE=;
  b=kANq5SpNYhCrk3P9XugQO/UTYMyK/hWkOclARG/zpMWoAhoutn6cIVx9
   F3ZEVP98OlZWKLUuaiULq4WQ2DcpybuaKcoIA0jPEBfIVprYd/dpAyLq8
   2W9Of1TITlQ6nuo7ggS6gvwBbOsU/nAsTerOO7aPq4hB/hIDE5dxz7fYB
   A/e0j+O+CQOGTSb0tUZWU95zdf/QG+mYimUl0fWEVOI0zSpiQvtG58+i8
   47PHKTY8vzr1H92lzaCAfJEAUPH2OA3q9dCpyQlKr+7PIMXUxUXJvlCgv
   X1PcGogXNN0P9WOOn2QJe5kiquoiSYnhXC/l87kEc67cJ7qrtIZpSHfCY
   A==;
X-CSE-ConnectionGUID: XO4UPVTsTkaoEOX3XC7qVg==
X-CSE-MsgGUID: FGF+B6gDTzywzUYoPRgs4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="78083341"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="78083341"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 07:52:35 -0700
X-CSE-ConnectionGUID: UnwR37UuQ+KRL1CcFU6sZw==
X-CSE-MsgGUID: l7X73rS1Tk2WR7vEpOwLYA==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.55])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 07:52:31 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 10 Mar 2026 16:52:23 +0200 (EET)
To: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
cc: Alok Tiwari <alok.a.tiwari@oracle.com>, Hans de Goede <hansg@kernel.org>, 
    carlos.bilbao@kernel.org, naveenkrishna.chatradhi@amd.com, 
    platform-driver-x86@vger.kernel.org, alok.a.tiwarilinux@gmail.com
Subject: Re: [PATCH] platform/x86/amd/hsmp: Fix typo in error message
In-Reply-To: <CAOc0ha+Z3yrtpasrgPo3ZPCmBy9_N-fxzqgRqnxpmRV+q+PH=g@mail.gmail.com>
Message-ID: <4685a998-5817-2ef8-c46f-f7967836f1b4@linux.intel.com>
References: <20260310125307.700108-1-alok.a.tiwari@oracle.com> <CAOc0ha+Z3yrtpasrgPo3ZPCmBy9_N-fxzqgRqnxpmRV+q+PH=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-2020628314-1773154343=:975"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2020628314-1773154343=:975
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 10 Mar 2026, Carlos Bilbao wrote:

> On Tue, Mar 10, 2026 at 5:53=E2=80=AFAM Alok Tiwari <alok.a.tiwari@oracle=
=2Ecom> wrote:
>       Fix a typo in the HSMP error message where "tmeout" should be "time=
out".
>=20
>       Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
>       ---
>       =C2=A0drivers/platform/x86/amd/hsmp/hsmp.c | 2 +-
>       =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
>       diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c
>       b/drivers/platform/x86/amd/hsmp/hsmp.c
>       index 19f82c1d3090..631ffc0978d1 100644
>       --- a/drivers/platform/x86/amd/hsmp/hsmp.c
>       +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
>       @@ -117,7 +117,7 @@ static int __hsmp_send_message(struct hsmp_sock=
et
>       *sock, struct hsmp_message *ms
>       =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>=20
>       =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (unlikely(mbox_status =3D=3D HSMP_ST=
ATUS_NOT_READY)) {
>       -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(soc=
k->dev, "Message ID 0x%X failure : SMU tmeout
>       (status =3D 0x%X)\n",
>       +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(soc=
k->dev, "Message ID 0x%X failure : SMU timeout
>       (status =3D 0x%X)\n",
>       =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 msg->msg_id, mbox_status);
>       =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ETI=
MEDOUT;
>       =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (unlikely(mbox_status =3D=3D =
HSMP_ERR_INVALID_MSG)) {
>       --
>       2.50.1
>=20
>=20
> Signed-off-by: Carlos Bilbao <carlos.bilbao@kernel.org>

Hi,

Did you perhaps mean a Reviewed-by tag instead?

--=20
 i.

--8323328-2020628314-1773154343=:975--
