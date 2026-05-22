Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673E8343899;
	Fri, 22 May 2026 11:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779449235; cv=none; b=dXxqJIntQndoPPQAeqgnaCkmuXDemz9YNhuXgWDU3f+9F13QKMUYKeIWriBn4K2DF6Uf6CVpZ+JTmHjxKRf1NF5gaEpJV/J0LuMB0nzbi4l/zh+yoxoiTWUc8A6g+qtHSVKg8Ni754Q72zyG5kr99vR6XbOQ3hq1/h9mrX+sgA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779449235; c=relaxed/simple;
	bh=m19sw/Zki2MjAcYEmvwmgct0jzwzjWqDzt1zokPvaVQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ToQTR3YVho7mqWK+TvUWyEUVew2kej7vRtPdBYBlQF2mUV65esingfJbxz8QkOBwnM1Ju9w0yYNPNvKD9maqlSblkHyEIP7rdTscGAj+U9bXsZtHh1NZHPjvaicKd6hNmzlzm+LtfW2g1EJplmbiyXICrPHTjvTjubW/ZOsCkbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VnofAAJ3; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VnofAAJ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779449233; x=1810985233;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=m19sw/Zki2MjAcYEmvwmgct0jzwzjWqDzt1zokPvaVQ=;
  b=VnofAAJ3sguKR9fRuH/WjVTChl4hqe0sCSOW2ifHhgme6e7g9dvymrPe
   0bleEzNsDsvjV2BlBbXedwClDQnpqPb7bngDGGjLl0LQ6tCEIZyoZI1H8
   Cc2mKd0UrBbOvR8Kvr8Vg9/tJTzXdfcASjpbvUpBUHa4qH3C133wkuPRc
   ep5OHysgoDywTrvdqYjapOHsyPAfyKtRr7e5CmFput5pM1Uli+QWNiLTG
   YO9kgu8cRbii14aqSqkvr2GCeXWXYFjngHaSKIa77AqGYQu2VwyKh7yOi
   Xc16rwjtnA7BJLBQD1wyJ8kYTURqjDWeMoSmZodwNphgU7TN38AH2UbI8
   A==;
X-CSE-ConnectionGUID: TVvkG96dSBqLBbLgEwRORQ==
X-CSE-MsgGUID: +krOsCprQfeOkHdNPQNNNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="91067570"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="91067570"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 04:27:13 -0700
X-CSE-ConnectionGUID: 4ia6NgGjQPqTAbv4ZTG30g==
X-CSE-MsgGUID: FN0sXv3qQbOQIEENbnz5eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="244935372"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.16])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 04:27:11 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 22 May 2026 14:27:07 +0300 (EEST)
To: Muralidhara M K <muralidhara.mk@amd.com>
cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Subject: Re: [PATCH v3 5/7] platform/x86/amd/hsmp: Add IOCTL_GET_TELEMETRY_DATA
 for metric table reads
In-Reply-To: <cdab5033-0ad2-4ed8-ab19-cdac24c390da@linux.intel.com>
Message-ID: <240d43c2-de9b-330c-4c9e-f3f479243c0e@linux.intel.com>
References: <20260517151211.415627-1-muralidhara.mk@amd.com> <20260517151211.415627-6-muralidhara.mk@amd.com> <cdab5033-0ad2-4ed8-ab19-cdac24c390da@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-688437586-1779449227=:1157"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-688437586-1779449227=:1157
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 22 May 2026, Ilpo J=E4rvinen wrote:

> On Sun, 17 May 2026, Muralidhara M K wrote:
>=20
> > The metric table for Family 1Ah Model 50h-5Fh
> > (struct hsmp_metric_table_zen6) is approximately 13 KB, exceeding the
> > PAGE_SIZE (4 KB) cap imposed on the standard sysfs binary attribute
> > read path.  Rather than introduce new sysfs infrastructure to support
> > binary attributes larger than PAGE_SIZE, expose the metric table
> > through the existing HSMP character device using a new ioctl.
> >=20
> > Add struct hsmp_telemetry_data and HSMP_IOCTL_GET_TELEMETRY_DATA to
> > the UAPI header.  The request structure carries the socket index, the
> > required buffer size and a __u64-encoded user pointer to the
> > destination buffer, so the same layout works for 32-bit and 64-bit
> > callers.  Fields are ordered with the __u64 user pointer first so all
> > members fall on their natural alignment under #pragma pack(4), giving
> > a tight 16-byte struct with no implicit padding; the trailing
> > reserved __u16 is documented as "set to zero" so future kernels can
> > attach meaning to it.  Userspace sizes its buffer using the matching
> > UAPI metric table struct (hsmp_metric_table or hsmp_metric_table_zen6)
> > for the running platform; sizes that disagree with the firmware-
> > reported table size are rejected with -EINVAL so a short copy can
> > never silently truncate the snapshot.
> >=20
> > Dispatch hsmp_ioctl() on the ioctl command, route HSMP_IOCTL_CMD to
> > the existing message handler (factored out as hsmp_ioctl_msg()) and
> > HSMP_IOCTL_GET_TELEMETRY_DATA to a new hsmp_ioctl_get_telemetry()
> > helper.  The new helper validates the request, allocates a kernel
> > bounce buffer with kvmalloc() so it can hold the full table even
> > when it exceeds a single page (zeroing is skipped because the buffer
> > is overwritten in full by memcpy_fromio()), calls hsmp_metric_tbl_read(=
)
> > to refresh and copy the table from the SMU DRAM region (under the
> > per-socket mutex introduced in a follow-up patch), and copies the
> > table to userspace.  Unknown ioctl commands now return -ENOTTY instead
> > of falling through.
> >=20
> > Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
> > Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
> > Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
> > ---
> > Changes:
> > v1->v2: New patch based on bin sysfs
> > v2->v3: Replace with IOCTL method
> >=20
> >  arch/x86/include/uapi/asm/amd_hsmp.h | 43 ++++++++++++++
> >  drivers/platform/x86/amd/hsmp/hsmp.c | 85 +++++++++++++++++++++++++++-
> >  2 files changed, 127 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/ua=
pi/asm/amd_hsmp.h
> > index b86bbc929395..3d085298dd52 100644
> > --- a/arch/x86/include/uapi/asm/amd_hsmp.h
> > +++ b/arch/x86/include/uapi/asm/amd_hsmp.h
> > @@ -664,6 +664,40 @@ struct hsmp_metric_table_zen6 {
> >  =09struct hsmp_metric_table_zen6_ccd ccd[F1A_M50_M5F_MAX_CCD];
> >  };
> > =20
> > +/**
> > + * struct hsmp_telemetry_data - Request descriptor for HSMP telemetry =
IOCTL
> > + * @buf:       Input. Userspace pointer (encoded as __u64 to keep the =
layout
> > + *             stable between 32-bit and 64-bit callers) to the destin=
ation
> > + *             buffer that receives the metric table.
> > + * @size:      Input. Size in bytes of the buffer pointed to by @buf. =
 Must
> > + *             match the firmware-reported metric table size for the r=
unning
> > + *             HSMP protocol version (see below); any other value resu=
lts in
> > + *             -EINVAL.  The kernel does not write this field back.
> > + * @sock_ind:  Input. Socket index from which the metric table is read=
=2E
> > + * @reserved:  Reserved for future use.  Callers should set this to ze=
ro;
> > + *             future kernels may begin interpreting the field, so pas=
sing
> > + *             a non-zero value today is not forwards compatible.
> > + *
> > + * Placing @buf first lets all fields fall on their natural alignment =
under
> > + * the surrounding #pragma pack(4), so the struct is a tight 16 bytes =
with
> > + * the same wire layout on 32-bit and 64-bit userspace.
> > + *
> > + * The exact metric table layout depends on the HSMP protocol version =
reported
> > + * by the firmware:
> > + *   - Protocol version 6 -> struct hsmp_metric_table
> > + *   - Protocol version 7 -> struct hsmp_metric_table_zen6
> > + *
> > + * Userspace queries the protocol version (e.g. via the protocol_versi=
on sysfs
> > + * attribute) and uses sizeof() on the matching UAPI structure for bot=
h @size
> > + * and the allocation backing @buf.
> > + */
> > +struct hsmp_telemetry_data {
> > +=09__u64=09buf;
> > +=09__u32=09size;
> > +=09__u16=09sock_ind;
> > +=09__u16=09reserved;
> > +};
> > +
> >  /* Reset to default packing */
> >  #pragma pack()
> > =20
> > @@ -671,4 +705,13 @@ struct hsmp_metric_table_zen6 {
> >  #define HSMP_BASE_IOCTL_NR=090xF8
> >  #define HSMP_IOCTL_CMD=09=09_IOWR(HSMP_BASE_IOCTL_NR, 0, struct hsmp_m=
essage)
> > =20
> > +/*
> > + * Fetch the firmware metric (telemetry) table for a given socket via =
the
> > + * HSMP character device.  This avoids the PAGE_SIZE limitation of the
> > + * sysfs binary attribute path for tables larger than one page (such a=
s the
> > + * ~13 KB hsmp_metric_table_zen6 used on Family 1Ah Model 50h-5Fh).
> > + */
> > +#define HSMP_IOCTL_GET_TELEMETRY_DATA \
> > +=09_IOWR(HSMP_BASE_IOCTL_NR, 1, struct hsmp_telemetry_data)
> > +
> >  #endif /*_ASM_X86_AMD_HSMP_H_*/
> > diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x8=
6/amd/hsmp/hsmp.c
> > index cf9392f99298..3a02d683dea0 100644
> > --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> > +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> > @@ -13,7 +13,9 @@
> >  #include <linux/delay.h>
> >  #include <linux/device.h>
> >  #include <linux/semaphore.h>
> > +#include <linux/slab.h>
> >  #include <linux/sysfs.h>
> > +#include <linux/uaccess.h>
> > =20
> >  #include "hsmp.h"
> > =20
> > @@ -287,7 +289,7 @@ static bool is_get_msg(struct hsmp_message *msg)
> >  =09return false;
> >  }
> > =20
> > -long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
> > +static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
> >  {
> >  =09int __user *arguser =3D (int  __user *)arg;
> >  =09struct hsmp_message msg =3D { 0 };
> > @@ -343,6 +345,87 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd,=
 unsigned long arg)
> >  =09return 0;
> >  }
> > =20
> > +/*
> > + * Fetch the firmware metric (telemetry) table for the requested socke=
t and
> > + * copy it to the userspace buffer described by the request.
> > + *
> > + * The metric table size is variable across HSMP protocol versions and=
 on
> > + * Family 1Ah Model 50h-5Fh exceeds PAGE_SIZE.  Userspace must therefo=
re
> > + * supply a buffer at least the firmware-reported size in bytes.
> > + */
> > +static long hsmp_ioctl_get_telemetry(struct file *fp, unsigned long ar=
g)
> > +{
> > +=09void __user *arguser =3D (void __user *)arg;
> > +=09struct hsmp_telemetry_data req;
> > +=09struct hsmp_socket *sock;
> > +=09void __user *user_buf;
> > +=09size_t tbl_size;
> > +=09void *kbuf;
> > +=09int ret;
> > +
> > +=09/* Telemetry data is read-only; require read access on the fd. */
> > +=09if (!(fp->f_mode & FMODE_READ))
> > +=09=09return -EPERM;
> > +
> > +=09if (copy_from_user(&req, arguser, sizeof(req)))
> > +=09=09return -EFAULT;
> > +
> > +=09if (!hsmp_pdev.sock || req.sock_ind >=3D hsmp_pdev.num_sockets)
>=20
> Sashiko warns userspace can use this as a speculation device so it needs=
=20
> to be protected.

Hi again,

While looking at the other patches, I also noticed hsmp_ioctl() has a=20
similar userspace driver check (in pre-existing code):

=09if (msg.msg_id < HSMP_TEST || msg.msg_id >=3D HSMP_MSG_ID_MAX)

--
 i.

> Please also address the req.reserved check mentioned by it with -EINVAL s=
o=20
> it can actually be used safely in future.
>=20
> > +=09=09return -ENODEV;
> > +
> > +=09tbl_size =3D hsmp_pdev.hsmp_table_size;
> > +=09if (!tbl_size)
> > +=09=09return -ENODEV;
> > +
> > +=09/*
> > +=09 * Userspace must size its buffer using the appropriate UAPI metric
> > +=09 * table struct for the running protocol version.  Reject mismatche=
d
> > +=09 * sizes so we never silently truncate or short-write.
> > +=09 */
> > +=09if (req.size !=3D tbl_size)
> > +=09=09return -EINVAL;
> > +
> > +=09sock =3D &hsmp_pdev.sock[req.sock_ind];
> > +=09if (!sock->metric_tbl_addr)
> > +=09=09return -ENODEV;
> > +
> > +=09user_buf =3D u64_to_user_ptr(req.buf);
> > +
> > +=09/*
> > +=09 * The bounce buffer is overwritten in full by memcpy_fromio() insi=
de
> > +=09 * hsmp_metric_tbl_read(); use kvmalloc() to avoid the zeroing cost=
 of
> > +=09 * kvzalloc() on the ~13 KB allocation done on every ioctl call.
> > +=09 */
> > +=09kbuf =3D kvmalloc(tbl_size, GFP_KERNEL);
> > +=09if (!kbuf)
> > +=09=09return -ENOMEM;
> > +
> > +=09ret =3D hsmp_metric_tbl_read(sock, kbuf, tbl_size);
> > +=09if (ret < 0)
> > +=09=09goto out;
> > +
> > +=09if (copy_to_user(user_buf, kbuf, tbl_size))
> > +=09=09ret =3D -EFAULT;
> > +=09else
> > +=09=09ret =3D 0;
> > +
> > +out:
> > +=09kvfree(kbuf);
> > +=09return ret;
> > +}
> > +
> > +long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
> > +{
> > +=09switch (cmd) {
> > +=09case HSMP_IOCTL_CMD:
> > +=09=09return hsmp_ioctl_msg(fp, arg);
> > +=09case HSMP_IOCTL_GET_TELEMETRY_DATA:
> > +=09=09return hsmp_ioctl_get_telemetry(fp, arg);
> > +=09default:
> > +=09=09return -ENOTTY;
> > +=09}
> > +}
> > +
> >  ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size=
_t size)
> >  {
> >  =09struct hsmp_message msg =3D { 0 };
> >=20
>=20
>=20
--8323328-688437586-1779449227=:1157--
