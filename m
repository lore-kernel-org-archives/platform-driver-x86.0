Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACB154652
	for <platform-driver-x86@vger.kernel.org>; Sat, 31 May 2025 05:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748668761; cv=none; b=kSQRmbPw6AuyANp7PdleVGa69o32fN+cTPkI4rp5NlrVStPAE2ttNOwmhJUl/27gjmrMtwa+IFUrvvpHPYJKKSflHKQL8G6RiZTAArLHG6+cpjNNge+wIIscSkIfRJhST6+IuwgtFSJ6fMAVKdowixX6T06KUI9oSwWVWmYS2aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748668761; c=relaxed/simple;
	bh=LZfhHf3shbz/AJHKGDKDL3O8LWYkEAABvMj3JNXts80=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=lz6t27i8kewz5iWE5Pt5xI9yGLk1G0WiZ9vam2cMfZAb4zdd5ODFojIO9ovNsdqlCjSlMKwAhTfKH71IoiOPfGeEQtMrR5sbDRp39pJIMjFZBBOXRcNEXKUmFcs18JtxfHvUWP/pmtYNKclrGyCC6OWlo2uIqG9QzanWcXCa3zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D7T8Ev38; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D7T8Ev38"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748668759; x=1780204759;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=LZfhHf3shbz/AJHKGDKDL3O8LWYkEAABvMj3JNXts80=;
  b=D7T8Ev387rlFXCd2OV0mK/UEpkgRhpaSXzPMeZZMbzV8Pq+p1/DHv3l0
   k6BjRMo3x2E1sC7rPQVngePf5z6zFvOSn0QMmIFZIvjM/GJCWydfJfEyV
   gCGifm/EM7BnIu8vyaqQvVxdYQGowX05aj7lOAErhRSKsphjmGmwODqs/
   9puwLEGx2YaLE3WuMQBA7ZinVab/zwqIIK3Ua7I1qlltYJZBXrO+349nD
   2lPAIwFSlJPPRo3DXdYAcNjvXEVHrIyzGYrvAhWr/zFP4H7YalDZUhaT4
   54GEKqM1bPMVf/FMzeAhyiKnaoGSDiZvt9SrsQAK/+4/ENj9Kb8Y9hOXT
   Q==;
X-CSE-ConnectionGUID: 8N2mLmT4TsyRp1C7Ve3euQ==
X-CSE-MsgGUID: 82QTKJU+S1uQvY4E4kd8TA==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="54556994"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="54556994"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 22:19:14 -0700
X-CSE-ConnectionGUID: 0A10xtbtTkewl6O4GyBrFQ==
X-CSE-MsgGUID: mGt0qhYUTZm9eZDWzaYXQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="144530347"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.71])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 22:19:13 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Sat, 31 May 2025 08:19:08 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
    Hans de Goede <hdegoede@redhat.com>, lucas.demarchi@intel.com, 
    rodrigo.vivi@intel.com
Subject: Re: [PATCH 02/10] platform/x86/intel/pmt: white space cleanup
In-Reply-To: <20250530203356.190234-2-michael.j.ruhl@intel.com>
Message-ID: <5f5ca773-5c6d-f020-e8a4-1fb0020e4119@linux.intel.com>
References: <20250530203356.190234-1-michael.j.ruhl@intel.com> <20250530203356.190234-2-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-2006411038-1748668748=:937"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2006411038-1748668748=:937
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 30 May 2025, Michael J. Ruhl wrote:

> Noticed two white space issues; cleaned them.
>=20
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/platform/x86/intel/pmt/crashlog.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform=
/x86/intel/pmt/crashlog.c
> index 6a9eb3c4b313..d40c8e212733 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -143,7 +143,7 @@ enable_show(struct device *dev, struct device_attribu=
te *attr, char *buf)
> =20
>  static ssize_t
>  enable_store(struct device *dev, struct device_attribute *attr,
> -=09    const char *buf, size_t count)
> +=09     const char *buf, size_t count)
>  {
>  =09struct crashlog_entry *entry;
>  =09bool enabled;
> @@ -177,7 +177,7 @@ trigger_show(struct device *dev, struct device_attrib=
ute *attr, char *buf)
> =20
>  static ssize_t
>  trigger_store(struct device *dev, struct device_attribute *attr,
> -=09    const char *buf, size_t count)
> +=09      const char *buf, size_t count)
>  {
>  =09struct crashlog_entry *entry;
>  =09bool trigger;
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-2006411038-1748668748=:937--
