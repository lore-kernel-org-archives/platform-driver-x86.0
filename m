Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A2174068
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Nov 2024 11:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732187451; cv=none; b=TdLPbnmBsQNhMMXes6xMkrkx7pp5ZL74CKltLVPD1y1aGVwKmRh2fDFz2ftbetEjV0sM0BVdVI2yH5zgGbhbgM+s/1LYJWhTdKCDdiO+s/Jd59bg+3YSHX/Yuuczn8sKVLDEOStpHQD6ODueExE3+4wkxbLQNSlF8r1Mc4Amr70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732187451; c=relaxed/simple;
	bh=Ao9WnJcoSe+peuH1l/1kyDifnHvLGYhZO0lhHLMH77Y=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=EcC6V5v0OYbHSGElxJ46oGBPVV2HV1Ucsi8qp4ciThBA1XGIAehyI/wgZGO48NJyPCrBCmnfCqvaR66mRkxeEo/9P/VHwNGkDNwg+SrjBCfQ6K4qtDK/4h5PsAUHyHvLRQsq7rWP+KMp7XtNCrq8PmzElfefCPcof8JrfYxWfEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J+3lqXop; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J+3lqXop"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732187450; x=1763723450;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=Ao9WnJcoSe+peuH1l/1kyDifnHvLGYhZO0lhHLMH77Y=;
  b=J+3lqXopeWqETWNcy2b/mY9VLAFGZCDo7humRPrjMzPUPlI7/Wg/BavX
   sJf5a0yfq/3ICziKF4pSQY0BZBPG231FDEtThMFXAIeWH2YhOLUSgYxok
   wu0ooZiLfyeSl5rWyDJ50AZ1ggr/a4jEqalRyiZaQ+LSKch5y5XQBfzCv
   WPzY5CA8eafFAMZcia1qHlnIj7JK/4MAhpnueBaozFO5PKZybhU4pVLEA
   CVo1FeoNJOFUpuiqgcT4ik7mobTkzoYpU5H03tt9R9ODU0SG6cf8iJfeI
   6OAsE2nxaHbOhCK6qh2M3urO+SC2sIQDxjusSnvDfnv91I2QXGDd7kEKt
   A==;
X-CSE-ConnectionGUID: WuWziXHwTva3rL9seEksvQ==
X-CSE-MsgGUID: ECi2V9VnTTS2GgOIw+0o8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="31657878"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; 
   d="scan'208";a="31657878"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 03:10:48 -0800
X-CSE-ConnectionGUID: +pihi7jURPav4bpHx6sIzQ==
X-CSE-MsgGUID: hGVbHPIKRqC4TzOvn30/5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; 
   d="scan'208";a="95291375"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.115])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 03:10:47 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 21 Nov 2024 13:10:43 +0200 (EET)
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
    Mario Limonciello <mario.limonciello@amd.com>
cc: platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v7 13/22] ACPI: platform_profile: Add profile attribute
 for class interface
In-Reply-To: <080ad77b-aa87-4541-8aec-bc74a6c2c0a7@app.fastmail.com>
Message-ID: <42828c2f-4653-590f-0879-0ecdd00953ed@linux.intel.com>
References: <20241119171739.77028-1-mario.limonciello@amd.com> <20241119171739.77028-14-mario.limonciello@amd.com> <afff4d12-b611-68f0-07a0-2d22bc57fc06@linux.intel.com> <080ad77b-aa87-4541-8aec-bc74a6c2c0a7@app.fastmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-873040611-1732187327=:1130"
Content-ID: <93b00bd2-17fe-9f59-802b-88c67ee1d587@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-873040611-1732187327=:1130
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <5be4542b-eda7-19a2-ebfc-d5ece771797a@linux.intel.com>

I don't know why you dropped Mario and the list, I reinstanstated those=20
two.

On Wed, 20 Nov 2024, Mark Pearson wrote:
> On Wed, Nov 20, 2024, at 9:56 AM, Ilpo J=E4rvinen wrote:
> > On Tue, 19 Nov 2024, Mario Limonciello wrote:
> >
> >> Reading and writing the `profile` sysfs file will use the callbacks fo=
r
> >> the platform profile handler to read or set the given profile.
> >>=20
> >> Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> >> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> >> ---
> >> v7:
> >>  * Remove extra handler set
> >>  * Remove err variable
> >> v6:
> >>  * Fix return
> >> v5:
> >>  * Drop recovery flow
> >>  * Don't get profile before setting (not needed)
> >>  * Simplify casting for call to _store_class_profile()
> >>  * Only notify legacy interface of changes
> >>  * Adjust mutex use
> >> ---
> >>  drivers/acpi/platform_profile.c | 100 +++++++++++++++++++++++++++++++=
+
> >>  1 file changed, 100 insertions(+)
> >>=20
> >> diff --git a/drivers/acpi/platform_profile.c b/drivers/acpi/platform_p=
rofile.c
> >> index 9d6ead043994c..1530e6096cd39 100644
> >> --- a/drivers/acpi/platform_profile.c
> >> +++ b/drivers/acpi/platform_profile.c

> >>  static struct attribute *profile_attrs[] =3D {
> >>  =09&dev_attr_name.attr,
> >>  =09&dev_attr_choices.attr,
> >> +=09&dev_attr_profile.attr,
> >
> > I started to wonder if "choices" is good name for the other attribute a=
s=20
> > it is the set of values "profile" accepts? Should they be bound by the=
=20
> > naming too like "profile_choices" or something along those lines so the
> > connection between the two is very evident?
> >
> Wouldn't it be weird to not have it in sync with the main sysfs entry=20
> (which I don't think we can change at that point without messing up=20
> userspace).
>=20
> I think it would be more confusing to have different naming as it would=
=20
> imply they're different things.

Ah, I didn't realize there's a pre-existing convention. Then just=20
disregard what I suggested.

--=20
 i.
--8323328-873040611-1732187327=:1130--
