Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E05D7B3D7
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Feb 2024 11:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709205925; cv=none; b=RrpYBwM00nKdBk9sW5v0rEt7B3HjoV5K22DNYtTSY3zYqmxgiDBoFA0IEYxHWmvCnvVUmbEiGWqdB7Pri+ljPLZl27kt6gUdV4L1uDzvs+nHtOuckqvqXWnux7xHfmxb0BXztst/+RXEQCzVpXIPm1RLo+j8b/DvfJNA9sMhmEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709205925; c=relaxed/simple;
	bh=8iqCfxBnCQ10q4oqLqIo1f377o+IP9KHznl2EfJ2jEE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=J9h8JZAKuGeN+GXfMVgk4vQHPc826BDE+VwSTyepRgbw0iMcv7E2U6yteFXtTm65ujxxkQJZNQmBpAwRaWQBPTqmJJNsNGoUNKoQwCCJXFqp7J+KujpbxygctvCgEo0Q2x0WTuPc9yWVeYA5y6bjrltsvoA8YhMjWWpFfo1aApE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ks0X/vPQ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ks0X/vPQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709205922; x=1740741922;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=8iqCfxBnCQ10q4oqLqIo1f377o+IP9KHznl2EfJ2jEE=;
  b=Ks0X/vPQ+jhyydhMmkDPHpA+PAKKwm+q0T+NVZ35bvoMtjNiOEAmnj6Q
   /CvAAeUrHOkyoEizxuZjR7vU3uaACmVQyWLJEDKqyy/fTs8J2RHOd+0mX
   MEJusoEWBJKk4D2VV6CxJ93CaK3adUONXkipKHSfYEa1hmllB8XeeU6VB
   zyscCHKqWZPdQuH3ttr7YX+ZuIn3yAJLQUpVwFnvHg9tnCC3O7yJJxbki
   RSLoqMA+5qZ9gd726uPBYnNN5mqQGUB7W8rXrEW+M+X9uqU1puShyoc0c
   9y3URafVWYEgkVGCRA8q+UnzywECpXs0/CItDlRp7QOQN6hpUygTW0AxM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3513465"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3513465"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 03:25:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7749868"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.246.51.250])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 03:25:19 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 29 Feb 2024 13:25:15 +0200 (EET)
To: Basavaraj Natikar <bnatikar@amd.com>
cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam-sundar.S-k@amd.com, 
    Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86/amd/pmc: Add AMD MP2 STB functionality
In-Reply-To: <a17f71c1-0084-4c64-b765-2f305662dc87@amd.com>
Message-ID: <3bd2b386-3047-e057-486b-7f7da0f64ce0@linux.intel.com>
References: <20240226151309.2147799-1-Basavaraj.Natikar@amd.com> <2294f1e9-2da3-aa07-dac1-02ffc402a424@linux.intel.com> <a17f71c1-0084-4c64-b765-2f305662dc87@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-642215446-1709205915=:1005"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-642215446-1709205915=:1005
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 28 Feb 2024, Basavaraj Natikar wrote:

>=20
> On 2/27/2024 4:18 PM, Ilpo J=C3=A4rvinen wrote:
> > On Mon, 26 Feb 2024, Basavaraj Natikar wrote:
> >
> >> AMD MP2 STB function provides a data buffer used to log debug informat=
ion
> >> about the system execution during S2Idle suspend/resume.
> >>
> >> A data buffer known as the STB (Smart Trace Buffer) is a circular buff=
er
> >> which is a low-level log to assist in debugging by providing insights
> >> into any potential hangs or stalls that may occur during the S2Idle
> >> suspend/resume processes.
> >>
> >> The current PMC driver retrieves STB data from MP1, but there can be
> >> scenarios where MP1 might hang or become unresponsive, leading to the
> >> loss of critical data present in the STB buffer. This defeats the purp=
ose
> >> of the STB buffer, which was originally meant to help identify system
> >> failures.
> >>
> >> This feature creates stb_read_previous_boot debugfs allows users to
> >> retrieve the STB log from MP2 specifically from the last occurrence of
> >> the S2Idle suspend/resume. A userspace daemon can access STB log of la=
st
> >> S2Idle suspend/resume which can help to troubleshoot potential issues
> >> related to hangs or stalls during the S2Idle suspend/resume sequence.
> >>
> >> Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>


> >> +{
> >> +=09struct mp2_cmd_base cmd_base;
> >> +
> >> +=09cmd_base.ul =3D 0;
> >> +=09cmd_base.cmd.cmd_id =3D cmd_id;
> >> +=09cmd_base.cmd.intr_disable =3D 1;
> >> +=09cmd_base.cmd.dma_addr =3D da;
> >> +
> >> +=09writeq(mp2->dma_addr, mp2->mmio + AMD_C2P_MSG1);
> >> +=09writel(cmd_base.ul, mp2->mmio + AMD_C2P_MSG0);
> > Please add the #include for writeq() and writel() like I already told y=
ou.
>=20
> Do you mean to add #include <asm/io.h>?

That or <linux/io.h> which includes the asm one.


--=20
 i.

--8323328-642215446-1709205915=:1005--
