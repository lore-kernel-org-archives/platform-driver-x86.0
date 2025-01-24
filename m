Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEC21C5F1C;
	Fri, 24 Jan 2025 08:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737708375; cv=none; b=hpBGJNRuCESf6HdOnbQNCm6ELlajlSFbrt5cVOPQY3tadb8ZVCN4q/VosuSAlTTFf9qPhLtBl7vSb2VpSYUHYuvkiz26+yQTBtNIjkxiAlhnBT+I4MiJh0eRZNfRSFk+bMTvhIXbxsTPQqZdQqoUgt9XfomS2COVWv+Hu5XZ/SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737708375; c=relaxed/simple;
	bh=UeB5bDnphMZx1Fcj5aHRY682G3sj6agHqNH0pRXHGvo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=IogaOFtwA5cBStVxG8VexSgG5LbIuHly3N4pBQEYBoZiY+xTIzZf0BgpDzid9BJSXSVvP+HPRDBITnjkWedJ0yZcmmUmOS9e2dXdqs5t7qXFvWIlxQZ61o/VytFAbG65G21DtZe8ugaj4TorFSszCBgGNMFo+2ygPv885zNWtEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vd5OfyXk; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vd5OfyXk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737708374; x=1769244374;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=UeB5bDnphMZx1Fcj5aHRY682G3sj6agHqNH0pRXHGvo=;
  b=Vd5OfyXklfyh25uDAU8N5ezCT70yUT+rdzin2fJ6YrcbniCSBLUNevyI
   r66TeZQLkG+tcV1/MZ3VDmOkIkiZ45vfhRs7l+eyOlSNlNUOrZJmanu9f
   BbbeqqQWYL+0lngIATarxN8WwLaB/XEDV+4f/Ri+Uf7TCXOxd4Ahk9Y1T
   BhsUdOL/F1qyVoIoijXmOte1qpqhvnzyF3w66tUzniDBe8uElV/PeU77f
   Wdf/fwwwXixYJVVTUXeAVfbtzxSqJR/vqtzavL6F3DHkUORZjShFhVkjZ
   RnNG2waSY7xr+iVL+xB71jT2DPIuczLXyht8HXuqKNLwFZevVtBno5jnm
   g==;
X-CSE-ConnectionGUID: RTXobOiTT7qLjosT5e+qEA==
X-CSE-MsgGUID: xGgiqfduQeeRJyF6Hn7VMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="25840864"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="25840864"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 00:46:13 -0800
X-CSE-ConnectionGUID: PtxNtY3LRLmxn/6R1lsW8Q==
X-CSE-MsgGUID: B33WFlU0Scu1HYMutpzrqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108601176"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.158])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 00:46:09 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 24 Jan 2025 10:46:06 +0200 (EET)
To: Xiangrong Li <xiangrongl@nvidia.com>
cc: vadimp@nvidia.com, Hans de Goede <hdegoede@redhat.com>, 
    davthompson@nvidia.com, asmaa@nvidia.com, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] mlxbf-bootctl: Support sysfs entries for RTC battery
 status
In-Reply-To: <20250116173326.48532-1-xiangrongl@nvidia.com>
Message-ID: <0ef7acb8-7e63-2ed2-6848-87412ff9f219@linux.intel.com>
References: <20250116173326.48532-1-xiangrongl@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-842724765-1737708366=:931"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-842724765-1737708366=:931
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 16 Jan 2025, Xiangrong Li wrote:

> This patch extends the mlxbf-bootctl driver's sysfs entries
> to support read access for the board's RTC battery status.
> A successful read from this attribute returns the status of
> the board's RTC battery. The RTC battery status register is
> also cleared upon successful read operation.
>=20
> Signed-off-by: Xiangrong Li <xiangrongl@nvidia.com>
> Reviewed-by: David Thompson <davthompson@nvidia.com>
> ---
>  .../testing/sysfs-platform-mellanox-bootctl   | 10 ++++++++++
>  drivers/platform/mellanox/mlxbf-bootctl.c     | 20 +++++++++++++++++++
>  drivers/platform/mellanox/mlxbf-bootctl.h     |  5 +++++
>  3 files changed, 35 insertions(+)
>=20
> diff --git a/Documentation/ABI/testing/sysfs-platform-mellanox-bootctl b/=
Documentation/ABI/testing/sysfs-platform-mellanox-bootctl
> index 65ed3865da62..65614fba62b8 100644
> --- a/Documentation/ABI/testing/sysfs-platform-mellanox-bootctl
> +++ b/Documentation/ABI/testing/sysfs-platform-mellanox-bootctl
> @@ -150,3 +150,13 @@ Description:
>  =09=09The "mfg_lock" sysfs attribute is write-only.
>                  A successful write to this attribute will latch the
>                  board-level attributes into EEPROM, making them read-onl=
y.
> +
> +What:=09=09/sys/bus/platform/devices/MLNXBF04:00/rtc_battery
> +Date:=09=09January 2025
> +KernelVersion:=096.14

The ship for 6.14 has sailed so this should be changed to 6.15, and please=
=20
also estimate the date of the release which is not same as date of=20
submission of the patch.

When you have fixed those, feel free to add:

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

> +Contact:=09"Xiangrong Li <xiangrongl@nvidia.com>"
> +Description:
> +=09=09The "rtc_battery" sysfs attribute is read-only.
> +=09=09A successful read from this attribute returns the status of
> +=09=09the board's RTC battery. The RTC battery status register is
> +=09=09also cleared upon successful read operation.
> diff --git a/drivers/platform/mellanox/mlxbf-bootctl.c b/drivers/platform=
/mellanox/mlxbf-bootctl.c
> index c5b36837e694..bc31061f779c 100644
> --- a/drivers/platform/mellanox/mlxbf-bootctl.c
> +++ b/drivers/platform/mellanox/mlxbf-bootctl.c
> @@ -91,6 +91,7 @@ static const char * const mlxbf_rsh_log_level[] =3D {
>  static DEFINE_MUTEX(icm_ops_lock);
>  static DEFINE_MUTEX(os_up_lock);
>  static DEFINE_MUTEX(mfg_ops_lock);
> +static DEFINE_MUTEX(rtc_ops_lock);
> =20
>  /*
>   * Objects are stored within the MFG partition per type.
> @@ -489,6 +490,23 @@ static ssize_t large_icm_store(struct device *dev,
>  =09return res.a0 ? -EPERM : count;
>  }
> =20
> +static ssize_t rtc_battery_show(struct device *dev,
> +=09=09=09=09struct device_attribute *attr,
> +=09=09=09=09char *buf)
> +{
> +=09struct arm_smccc_res res;
> +
> +=09mutex_lock(&rtc_ops_lock);
> +=09arm_smccc_smc(MLNX_HANDLE_GET_RTC_LOW_BATT, 0, 0, 0, 0,
> +=09=09      0, 0, 0, &res);
> +=09mutex_unlock(&rtc_ops_lock);
> +
> +=09if (res.a0)
> +=09=09return -EPERM;
> +
> +=09return sysfs_emit(buf, "0x%lx\n", res.a1);
> +}
> +
>  static ssize_t os_up_store(struct device *dev,
>  =09=09=09   struct device_attribute *attr,
>  =09=09=09   const char *buf, size_t count)
> @@ -906,6 +924,7 @@ static DEVICE_ATTR_RW(sn);
>  static DEVICE_ATTR_RW(uuid);
>  static DEVICE_ATTR_RW(rev);
>  static DEVICE_ATTR_WO(mfg_lock);
> +static DEVICE_ATTR_RO(rtc_battery);
> =20
>  static struct attribute *mlxbf_bootctl_attrs[] =3D {
>  =09&dev_attr_post_reset_wdog.attr,
> @@ -925,6 +944,7 @@ static struct attribute *mlxbf_bootctl_attrs[] =3D {
>  =09&dev_attr_uuid.attr,
>  =09&dev_attr_rev.attr,
>  =09&dev_attr_mfg_lock.attr,
> +=09&dev_attr_rtc_battery.attr,
>  =09NULL
>  };
> =20
> diff --git a/drivers/platform/mellanox/mlxbf-bootctl.h b/drivers/platform=
/mellanox/mlxbf-bootctl.h
> index 1299750a8661..90bbbdc65879 100644
> --- a/drivers/platform/mellanox/mlxbf-bootctl.h
> +++ b/drivers/platform/mellanox/mlxbf-bootctl.h
> @@ -103,6 +103,11 @@
>   */
>  #define MLNX_HANDLE_OS_UP    0x82000014
> =20
> +/*
> + * SMC function ID to get and clear the RTC low voltage bit
> + */
> +#define MLNX_HANDLE_GET_RTC_LOW_BATT   0x82000023
> +
>  /* SMC function IDs for SiP Service queries */
>  #define MLXBF_BOOTCTL_SIP_SVC_CALL_COUNT=090x8200ff00
>  #define MLXBF_BOOTCTL_SIP_SVC_UID=09=090x8200ff01
>=20
--8323328-842724765-1737708366=:931--
