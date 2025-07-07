Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E17617BA1
	for <platform-driver-x86@vger.kernel.org>; Mon,  7 Jul 2025 13:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751894943; cv=none; b=dqJs15MiuQgA+meh9a/ubtiEDnG90m0wNYxVlFho53Y9/ufsyqo3Jfv2WJbwpnDRdcZ095Nsjvrw0VpJwzF4ADyiTtg/aUHFn2XRxg+CM3ZLu4j7RiXcXth/orXxDn8e7mjfO0X52veK/LNM6XpheE7Qb5gyTki+jlNM9pPHfVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751894943; c=relaxed/simple;
	bh=PUg0Us2e1hGu9NBm7yY2dY/aThQzZUybWQVcjP8W9hA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=OoEdPaxabSHJZrnrID1O3HFaheMV2+J4DaxnxgR/QDM9aXnEPw9gZ84Wft38f02xQ0IaOyXUYkTN94k+PJkVBNvVJKJLImiTUPtqavwj4bgHbiD8jxgpYkoLS3k4ckgjHXM5jnPd/UTh++EW7mcUcdMTf2puQAr+r0PR57qqyo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YL4Jjyeh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YL4Jjyeh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751894942; x=1783430942;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=PUg0Us2e1hGu9NBm7yY2dY/aThQzZUybWQVcjP8W9hA=;
  b=YL4Jjyehqt0w4LEXoCrFSW8isExZJ4hgdp8XiEJzXvBSVAF3rxR+t1l5
   tq18Z/33UjhW4lfyMDyWIPDtd61cE0T7ea/ViY5oKXFrMZF5VtDfw5PIW
   Sx344wh5GzklbiOaPT7kb8xL0XX8l5Wv6EvsSOTDfLSdBwfyofzylH6JP
   UHmDFpV5Lt6Op15aajB0gysdYD8S3Ugn96cMmpWClCZu5W/mBkVjz5X/D
   HT0SMhwl4U7yACJTN4v+ECXL1DxyBSqeP6m6oD+5qMliQgG6J6QNHjih1
   Z9Mnub480NLqPZSmL4wKhb3aVu45LgJtKtuzvp6RMwC9IthXMLqUTu68R
   Q==;
X-CSE-ConnectionGUID: P3DA1AYiRx2aXwKdjzSWvA==
X-CSE-MsgGUID: ZZmhzAVmRcSXoWP+1nsvQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54039054"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; 
   d="scan'208";a="54039054"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 06:29:01 -0700
X-CSE-ConnectionGUID: 3fij4cOzScaTUVsbQ6ksdw==
X-CSE-MsgGUID: t+6+2PDfSFOtMKpvCm6aBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; 
   d="scan'208";a="155701850"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.104])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 06:28:57 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 7 Jul 2025 16:28:53 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
    Hans de Goede <hdegoede@redhat.com>, lucas.demarchi@intel.com, 
    rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
    airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com
Subject: Re: [PATCH v6 10/12] platform/x86/intel/pmt: refactor base
 parameter
In-Reply-To: <20250703211150.135320-11-michael.j.ruhl@intel.com>
Message-ID: <9cced82f-c968-4b67-1148-a04775f9361b@linux.intel.com>
References: <20250703211150.135320-1-michael.j.ruhl@intel.com> <20250703211150.135320-11-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-802878596-1751894933=:941"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-802878596-1751894933=:941
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 3 Jul 2025, Michael J. Ruhl wrote:

> For the crashlog driver, struct crashlog_entry is the parent of
> struct intel_pmt_entry. To support multiple crashlog versions, most

To support an upcoming change ...

> accesses will be to the struct crashlog_entry.

I don't understand the meaning of the part after the comma as "most=20
accesses" is extremely vague, could you please rephrase it.

Jumping directly to the itemized list at this point feels a bit clumsy as=
=20
they don't really connect well.

> - Refactor to use struct crashlog_entry in place of
>   struct intel_pmt_entry
> - Rename some usages (auto-variables) from entry to crashlog
>
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/platform/x86/intel/pmt/crashlog.c | 59 ++++++++++++-----------
>  1 file changed, 30 insertions(+), 29 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform=
/x86/intel/pmt/crashlog.c
> index 888946a8ba46..8cca520c5a1c 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -68,8 +68,9 @@ struct pmt_crashlog_priv {
>  #define CRASHLOG_CLEAR_BIT=09false
> =20
>  /* read/modify/write */
> -static void pmt_crashlog_rmw(struct intel_pmt_entry *entry, u32 bit, boo=
l set)
> +static void pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, b=
ool set)
>  {
> +=09struct intel_pmt_entry *entry =3D &crashlog->entry;
>  =09u32 reg =3D readl(entry->disc_table + CONTROL_OFFSET);
> =20
>  =09reg &=3D ~CRASHLOG_FLAG_TRIGGER_MASK;
> @@ -83,23 +84,24 @@ static void pmt_crashlog_rmw(struct intel_pmt_entry *=
entry, u32 bit, bool set)
>  }
> =20
>  /* read/check */
> -static bool pmt_crashlog_rc(struct intel_pmt_entry *entry, u32 bit)
> +static bool pmt_crashlog_rc(struct crashlog_entry *crashlog, u32 bit)
>  {
> +=09struct intel_pmt_entry *entry =3D &crashlog->entry;
>  =09u32 reg =3D readl(entry->disc_table + CONTROL_OFFSET);
> =20
>  =09return !!(reg & bit);
>  }
> =20
> -static bool pmt_crashlog_complete(struct intel_pmt_entry *entry)
> +static bool pmt_crashlog_complete(struct crashlog_entry *crashlog)
>  {
>  =09/* return current value of the crashlog complete flag */
> -=09return pmt_crashlog_rc(entry, CRASHLOG_FLAG_TRIGGER_COMPLETE);
> +=09return pmt_crashlog_rc(crashlog, CRASHLOG_FLAG_TRIGGER_COMPLETE);
>  }
> =20
> -static bool pmt_crashlog_disabled(struct intel_pmt_entry *entry)
> +static bool pmt_crashlog_disabled(struct crashlog_entry *crashlog)
>  {
>  =09/* return current value of the crashlog disabled flag */
> -=09return pmt_crashlog_rc(entry, CRASHLOG_FLAG_DISABLE);
> +=09return pmt_crashlog_rc(crashlog, CRASHLOG_FLAG_DISABLE);
>  }
> =20
>  static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
> @@ -117,20 +119,19 @@ static bool pmt_crashlog_supported(struct intel_pmt=
_entry *entry)
>  =09return crash_type =3D=3D CRASH_TYPE_OOBMSM && version =3D=3D 0;
>  }
> =20
> -static void pmt_crashlog_set_disable(struct intel_pmt_entry *entry,
> -=09=09=09=09     bool disable)
> +static void pmt_crashlog_set_disable(struct crashlog_entry *crashlog, bo=
ol disable)
>  {
> -=09pmt_crashlog_rmw(entry, CRASHLOG_FLAG_DISABLE, disable);
> +=09pmt_crashlog_rmw(crashlog, CRASHLOG_FLAG_DISABLE, disable);
>  }
> =20
> -static void pmt_crashlog_set_clear(struct intel_pmt_entry *entry)
> +static void pmt_crashlog_set_clear(struct crashlog_entry *crashlog)
>  {
> -=09pmt_crashlog_rmw(entry, CRASHLOG_FLAG_TRIGGER_CLEAR, CRASHLOG_SET_BIT=
);
> +=09pmt_crashlog_rmw(crashlog, CRASHLOG_FLAG_TRIGGER_CLEAR, CRASHLOG_SET_=
BIT);
>  }
> =20
> -static void pmt_crashlog_set_execute(struct intel_pmt_entry *entry)
> +static void pmt_crashlog_set_execute(struct crashlog_entry *crashlog)
>  {
> -=09pmt_crashlog_rmw(entry, CRASHLOG_FLAG_TRIGGER_EXECUTE, CRASHLOG_SET_B=
IT);
> +=09pmt_crashlog_rmw(crashlog, CRASHLOG_FLAG_TRIGGER_EXECUTE, CRASHLOG_SE=
T_BIT);
>  }
> =20
>  /*
> @@ -139,8 +140,8 @@ static void pmt_crashlog_set_execute(struct intel_pmt=
_entry *entry)
>  static ssize_t
>  enable_show(struct device *dev, struct device_attribute *attr, char *buf=
)
>  {
> -=09struct intel_pmt_entry *entry =3D dev_get_drvdata(dev);
> -=09bool enabled =3D !pmt_crashlog_disabled(entry);
> +=09struct crashlog_entry *crashlog =3D dev_get_drvdata(dev);
> +=09bool enabled =3D !pmt_crashlog_disabled(crashlog);
> =20
>  =09return sprintf(buf, "%d\n", enabled);
>  }
> @@ -149,19 +150,19 @@ static ssize_t
>  enable_store(struct device *dev, struct device_attribute *attr,
>  =09     const char *buf, size_t count)
>  {
> -=09struct crashlog_entry *entry;
> +=09struct crashlog_entry *crashlog;
>  =09bool enabled;
>  =09int result;
> =20
> -=09entry =3D dev_get_drvdata(dev);
> +=09crashlog =3D dev_get_drvdata(dev);
> =20
>  =09result =3D kstrtobool(buf, &enabled);
>  =09if (result)
>  =09=09return result;
> =20
> -=09guard(mutex)(&entry->control_mutex);
> +=09guard(mutex)(&crashlog->control_mutex);
> =20
> -=09pmt_crashlog_set_disable(&entry->entry, !enabled);
> +=09pmt_crashlog_set_disable(crashlog, !enabled);
> =20
>  =09return count;
>  }
> @@ -170,11 +171,11 @@ static DEVICE_ATTR_RW(enable);
>  static ssize_t
>  trigger_show(struct device *dev, struct device_attribute *attr, char *bu=
f)
>  {
> -=09struct intel_pmt_entry *entry;
> +=09struct crashlog_entry *crashlog;
>  =09bool trigger;
> =20
> -=09entry =3D dev_get_drvdata(dev);
> -=09trigger =3D pmt_crashlog_complete(entry);
> +=09crashlog =3D dev_get_drvdata(dev);
> +=09trigger =3D pmt_crashlog_complete(crashlog);
> =20
>  =09return sprintf(buf, "%d\n", trigger);
>  }
> @@ -183,32 +184,32 @@ static ssize_t
>  trigger_store(struct device *dev, struct device_attribute *attr,
>  =09      const char *buf, size_t count)
>  {
> -=09struct crashlog_entry *entry;
> +=09struct crashlog_entry *crashlog;
>  =09bool trigger;
>  =09int result;
> =20
> -=09entry =3D dev_get_drvdata(dev);
> +=09crashlog =3D dev_get_drvdata(dev);
> =20
>  =09result =3D kstrtobool(buf, &trigger);
>  =09if (result)
>  =09=09return result;
> =20
> -=09guard(mutex)(&entry->control_mutex);
> +=09guard(mutex)(&crashlog->control_mutex);
> =20
>  =09/* if device is currently disabled, return busy */
> -=09if (pmt_crashlog_disabled(&entry->entry))
> +=09if (pmt_crashlog_disabled(crashlog))
>  =09=09return -EBUSY;
> =20
>  =09if (!trigger) {
> -=09=09pmt_crashlog_set_clear(&entry->entry);
> +=09=09pmt_crashlog_set_clear(crashlog);
>  =09=09return count;
>  =09}
> =20
>  =09/* we cannot trigger a new crash if one is still pending */
> -=09if (pmt_crashlog_complete(&entry->entry))
> +=09if (pmt_crashlog_complete(crashlog))
>  =09=09return -EEXIST;
> =20
> -=09pmt_crashlog_set_execute(&entry->entry);
> +=09pmt_crashlog_set_execute(crashlog);
> =20
>  =09return count;
>  }
>=20

Once you've improved the changelog, feel free to add:

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-802878596-1751894933=:941--
