Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F11B360ED8;
	Tue, 12 May 2026 11:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778586251; cv=none; b=O5FqmAnXq/JKi+kjOdJcnvHh02kE95TGww2lYT0f63UVbTdErX0wBStB/5NOLjPp2OXqXltyM9rdtmh3Mg5aSpiVQ8ZaKB8EvUX5C6JXRCL6ZBQ1kxSE4ioUE7wipp9UJp2xmqyGS//hwzHkMdUUxUa7hdZyH1ScjlVqPGyTXq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778586251; c=relaxed/simple;
	bh=uAvaqa1KNi6OV2RqXx7H2u2WDoQ6v+Z2nJ7wFUgfp2M=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=bNz7j9SAgswvE6yR7z4aKQUwev59wwsoevsEnnUDkwzMIhG9ZZtZy7exKmlJeA/eFjKKK3QvgsO8r2SJC1J2dCs9OpiqYfI0WvtDTu5kzRRxJNzt4uI4ADk33NRAK9L2ky1WAp2jt5BJOG+hT/1PgQ7L952cTujjxS/F1VbWteg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eplXsrpM; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eplXsrpM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778586249; x=1810122249;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=uAvaqa1KNi6OV2RqXx7H2u2WDoQ6v+Z2nJ7wFUgfp2M=;
  b=eplXsrpMABJA8arW0CzZuuJ0p2tNqAq69ujHPCQHdMdfvkW6TsIp7vBz
   Zje6K64JYYU+xA5u89s+8+45BM86zasYk0hqWXx55u55271J4vIX5nEAG
   M5hhORFQe315HaOsuFdXMpVpfRaq2P4roaO16n1NzO0ejpjIXV+pSJKS4
   /+gvdenhUvNxFwR5Ti4Xoz8WWWKGSbnzjj5p3ekSFcG8wfpOL3v2p61CJ
   pjIDANUqdWPA23lzrTfwPPEDOlchHvNZsa7h/D+3w4Y02p5BsVuv6rUXv
   Hd+IzXl7Zd7i9Rz7Y63B+V4wnJA33ffPQVu0fXeaQb/jN8iOV0oK18b7T
   A==;
X-CSE-ConnectionGUID: 1hatgPqQRVWPinKj79x+HA==
X-CSE-MsgGUID: KYp3+nZFShOrNngchSibWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79209615"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="79209615"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 04:44:08 -0700
X-CSE-ConnectionGUID: V6cKCQp5T0C0u7mIiBAsMA==
X-CSE-MsgGUID: 2XNJ+K96QtmX0ICOQ/0Fug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="233438855"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.190])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 04:44:04 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 12 May 2026 14:44:01 +0300 (EEST)
To: Muralidhara M K <muralidhara.mk@amd.com>, 
    Danilo Krummrich <dakr@kernel.org>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    "Rafael J. Wysocki" <rafael@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    driver-core@lists.linux.dev, Nayak K Prateek <kprateek.nayak@amd.com>
Subject: Re: [PATCH v2 4/7] sysfs: Add SYSFS_HUGE_BIN_FILE flag for binary
 attributes larger than PAGE_SIZE
In-Reply-To: <20260427155129.545327-5-muralidhara.mk@amd.com>
Message-ID: <c288b106-b8fb-bd4c-fd47-062cd03cd337@linux.intel.com>
References: <20260427155129.545327-1-muralidhara.mk@amd.com> <20260427155129.545327-5-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1646307465-1778585693=:11125"
Content-ID: <9422f24f-3d97-62ff-1f13-05d80ec3240c@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1646307465-1778585693=:11125
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <0a2a38db-660b-12d8-d59b-d1f96c20a200@linux.intel.com>

On Mon, 27 Apr 2026, Muralidhara M K wrote:

It would be really nice to have sysfs comment on this approach, as we'll=20
need their Ack for this (or a suggestion what would be more appropriate=20
than this if this is not acceptable to them).

Please try to make sure you Cc all the relevant people for the next=20
version right from the start.

> Historically, sysfs read buffers were allocated with get_zeroed_page(),
> limiting reads to PAGE_SIZE.  Commit 13c589d5b0ac ("sysfs: use seq_file
> when reading regular files") transitioned regular (text) attribute reads
> to seq_file, which can dynamically grow buffers beyond PAGE_SIZE.


> However, the PAGE_SIZE limit was intentionally preserved for
> compatibility. When binary attribute handling was later unified into
> the same codebase, the non-seq_file read path (kernfs_file_read_iter)
> retained this PAGE_SIZE cap for binary files as well.

I tried to investigate these claims but with the lack of references,
I didn't get very far. At least the thread where 13c589d5b0ac came from=20
didn't seem to clearly say the things claimed here (assuming I managed=20
to find all its emails from the archives).

> Drivers that expose binary attributes larger than PAGE_SIZE =E2=80=94 suc=
h as
> the AMD HSMP metric table (~13 KB) =E2=80=94 cannot deliver the full cont=
ent
> in a single read() call through the existing path.
>=20
> Introduce a new opt-in flag SYSFS_HUGE_BIN_FILE (040000)

> that drivers can OR into their bin_attribute mode.

Simplify to:

for bin_attribute mode.

?

> When set, sysfs selects a new
> kernfs_ops (sysfs_bin_kfops_huge_file_ro) whose .seq_show callback
> pipes the bin_attribute ->read() result through seq_file, allowing
> reads of arbitrary size in one shot.  Existing binary attributes
> without the flag continue using the legacy capped path.

I suggest you avoid using "legacy" as a term for anything that is in use=20
in any way or still exists. I've seen people to jump on that particular=20
word enough times, it can sidetrack discussions.

--=20
 i.

> Co-developed-by: Nayak K Prateek <kprateek.nayak@amd.com>
> Signed-off-by: Nayak K Prateek <kprateek.nayak@amd.com>
> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
> ---
> Changes v1->v2: New patch
>=20
>  fs/sysfs/file.c       | 45 +++++++++++++++++++++++++++++++++++++++++++
>  fs/sysfs/group.c      |  8 ++++----
>  include/linux/sysfs.h |  1 +
>  3 files changed, 50 insertions(+), 4 deletions(-)
>=20
> diff --git a/fs/sysfs/file.c b/fs/sysfs/file.c
> index 5709cede1d75..be42c3c1e056 100644
> --- a/fs/sysfs/file.c
> +++ b/fs/sysfs/file.c
> @@ -38,6 +38,45 @@ static const struct sysfs_ops *sysfs_file_ops(struct k=
ernfs_node *kn)
>  =09return kobj->ktype ? kobj->ktype->sysfs_ops : NULL;
>  }
> =20
> +/*
> + * Reads on huge sysfs bin files are handled through seq_file, which
> + * takes care of hairy details like buffering and seeking.  The
> + * following function pipes the bin_attribute ->read() result through
> + * seq_file so that reads larger than PAGE_SIZE work in one shot.
> + */
> +static int sysfs_kf_huge_file_seq_show(struct seq_file *sf, void *v)
> +{
> +=09struct kernfs_open_file *of =3D sf->private;
> +=09const struct bin_attribute *battr =3D of->kn->priv;
> +=09struct kobject *kobj =3D sysfs_file_kobj(of->kn);
> +=09loff_t size =3D file_inode(of->file)->i_size;
> +=09ssize_t count;
> +=09char *buf;
> +
> +=09if (!battr->read)
> +=09=09return -EIO;
> +
> +=09if (!size)
> +=09=09return -EIO;
> +
> +=09/* acquire buffer and ensure that it's >=3D size */
> +=09count =3D seq_get_buf(sf, &buf);
> +=09if (count < size) {
> +=09=09seq_commit(sf, -1);
> +=09=09return 0;
> +=09}
> +
> +=09memset(buf, 0, size);
> +
> +=09count =3D battr->read(of->file, kobj, battr, buf, 0, size);
> +=09if (count < 0)
> +=09=09return count;
> +
> +=09WARN_ON(count > size);
> +=09seq_commit(sf, min_t(ssize_t, count, size));
> +=09return 0;
> +}
> +
>  /*
>   * Reads on sysfs are handled through seq_file, which takes care of hair=
y
>   * details like buffering and seeking.  The following function pipes
> @@ -249,6 +288,10 @@ static const struct kernfs_ops sysfs_prealloc_kfops_=
rw =3D {
>  =09.prealloc=09=3D true,
>  };
> =20
> +static const struct kernfs_ops sysfs_bin_kfops_huge_file_ro =3D {
> +=09.seq_show=09=3D sysfs_kf_huge_file_seq_show,
> +};
> +
>  static const struct kernfs_ops sysfs_bin_kfops_ro =3D {
>  =09.read=09=09=3D sysfs_kf_bin_read,
>  };
> @@ -333,6 +376,8 @@ int sysfs_add_bin_file_mode_ns(struct kernfs_node *pa=
rent,
>  =09=09ops =3D &sysfs_bin_kfops_mmap;
>  =09else if (battr->read && battr->write)
>  =09=09ops =3D &sysfs_bin_kfops_rw;
> +=09else if (battr->read && (mode & SYSFS_HUGE_BIN_FILE))
> +=09=09ops =3D &sysfs_bin_kfops_huge_file_ro;
>  =09else if (battr->read)
>  =09=09ops =3D &sysfs_bin_kfops_ro;
>  =09else if (battr->write)
> diff --git a/fs/sysfs/group.c b/fs/sysfs/group.c
> index b3edae0578c0..2d0b01c00a97 100644
> --- a/fs/sysfs/group.c
> +++ b/fs/sysfs/group.c
> @@ -74,11 +74,11 @@ static int create_files(struct kernfs_node *parent, s=
truct kobject *kobj,
>  =09=09=09=09=09continue;
>  =09=09=09}
> =20
> -=09=09=09WARN(mode & ~(SYSFS_PREALLOC | 0664),
> +=09=09=09WARN(mode & ~(SYSFS_PREALLOC | SYSFS_HUGE_BIN_FILE | 0664),
>  =09=09=09     "Attribute %s: Invalid permissions 0%o\n",
>  =09=09=09     (*attr)->name, mode);
> =20
> -=09=09=09mode &=3D SYSFS_PREALLOC | 0664;
> +=09=09=09mode &=3D SYSFS_PREALLOC | SYSFS_HUGE_BIN_FILE | 0664;
>  =09=09=09error =3D sysfs_add_file_mode_ns(parent, *attr, mode, uid,
>  =09=09=09=09=09=09       gid, NULL);
>  =09=09=09if (unlikely(error))
> @@ -107,11 +107,11 @@ static int create_files(struct kernfs_node *parent,=
 struct kobject *kobj,
>  =09=09=09if (grp->bin_size)
>  =09=09=09=09size =3D grp->bin_size(kobj, *bin_attr, i);
> =20
> -=09=09=09WARN(mode & ~(SYSFS_PREALLOC | 0664),
> +=09=09=09WARN(mode & ~(SYSFS_PREALLOC | SYSFS_HUGE_BIN_FILE | 0664),
>  =09=09=09     "Attribute %s: Invalid permissions 0%o\n",
>  =09=09=09     (*bin_attr)->attr.name, mode);
> =20
> -=09=09=09mode &=3D SYSFS_PREALLOC | 0664;
> +=09=09=09mode &=3D SYSFS_PREALLOC | SYSFS_HUGE_BIN_FILE | 0664;
>  =09=09=09error =3D sysfs_add_bin_file_mode_ns(parent, *bin_attr,
>  =09=09=09=09=09=09=09   mode, size, uid, gid,
>  =09=09=09=09=09=09=09   NULL);
> diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
> index b1a3a1e6ad09..78f6c6252cf9 100644
> --- a/include/linux/sysfs.h
> +++ b/include/linux/sysfs.h
> @@ -124,6 +124,7 @@ struct attribute_group {
> =20
>  #define SYSFS_PREALLOC=09=09010000
>  #define SYSFS_GROUP_INVISIBLE=09020000
> +#define SYSFS_HUGE_BIN_FILE=09=09040000
> =20
>  /*
>   * DEFINE_SYSFS_GROUP_VISIBLE(name):
>=20
--8323328-1646307465-1778585693=:11125--
