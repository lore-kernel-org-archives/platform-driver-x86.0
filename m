Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792582131;
	b=ZA84xMQ3iTs8tjwJyWWl5P3Ecdi9vEAiXIBlHa25gFw64z5esKndTJGyRdiREfYPVKR9
	 xqeUXB45KFPIVkwRdzM0fIsFTJ6d1PoRUxTX/Z1Y+mYRYGrmvZI6A6ZW7VhCKhQCquPlm
	 Vyix9ZFnF05hAm4W9DJrGlVzBxOCHPq6E51WfwwrJUNEA5pLp6qPUL8k0ZUUAIar2SyvK
	 jg0gtXuVDiNizHx0rEW/ee7WJQ4fZDNv/DBwvMlBhRkF7iAkccL5lvBUUj2I5QK/WfBDx
	 ubH4eZJwDh4mhEPKK7O3cGpRAIjoXvRUSDkrS9XVspv2PzAPqlKKsNlatyyQscLjUoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792582131;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=ZuSxD1pyasZnKf62G2LMw9pd6o6ZcVjSyiZOjSevMV8=;
	b=WAZUVro4eh/IgDafkiF5airlVhQTD079dUZw/r/xBB5IZ2nORzIMowf4xpbtpDEwN8BB
	 K7eMYoopn0P59/Vaoqs6iuO8IRiSQP+mFzcN7EA2tomxr14YRxBullw25p+vM7SzX7tzc
	 I3T3JU76PJ7/is2Cedbx79cb8ILKpA6w9uHJcDaNf4MvAHMTh0mp1NMmmNpDhI1O88mLS
	 tR3+F8fEjmoFW4BDo1aMLCy011n2zKxHSZ9meyh4fjIXsVbCQf+HMbp17oolODMjXX9o9
	 MdCDJi6OSQbjy+jtgItsMH91B5pnnjoWEtORlK6yVdXfzsmB2MzX7Rqu92l6rWuAIfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NbP2oCHC;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E94606A31A
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2026 11:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89E94606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NbP2oCHC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792582131; x=1824118131;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=OS8gC8ld1gK2bFk4LmdSZwHByrjHsiMgIQDiOA3cy98=;
  b=NbP2oCHCQzyIvvPGMcweatghxqNzUGKcuGO0U7geSzowBy9PWd5Ceqdn
   agnaki1hv7rht+ntWg7f+35o+wJU9sVD4zj/fFg374tfS1v2X+UiayGEN
   Re3fB2WMxTdu/lt+LShzP76AP70LDi2Rxypn2dMY/TBJQWNoFZZYzpK8M
   kvODO8RfjNuIlzF/wwp9xf48umOr2BPDgXjIpFjds8ejiJz1yGqi1e+D5
   mq6UOqOX7vzhYTvdscLjyQoyOjKC3OOHSGKHO4OSEfdhSCEGAr3hOLrG0
   stoy0AEjAZwsVufDPih/y62L3d2+Yhxkx0Zh+ogVdwm3RwNuktNO3fUe/
   g==;
X-CSE-ConnectionGUID: XJ4FvHQBSlWODh8MCT2QKA==
X-CSE-MsgGUID: m8f3OGymSXCtf6VqGRByFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1321019"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1321019"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 04:28:51 -0700
X-CSE-ConnectionGUID: A+28eXGoT3SEhr711vIg0w==
X-CSE-MsgGUID: Q3R4Jd78QyigVyWnCkHAGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3132118"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.75])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 04:28:47 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 21 Oct 2026 14:28:41 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, hdegoede@redhat.com, 
    Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>, 
    NaveenKrishna.Chatradhi@amd.com, Dhruv Gupta <dhruv.gupta@amd.com>, 
    Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Subject: Re: [PATCH 07/11] platform/x86/amd/hsmp: Add per-platform bitmap to
 validate HSMP messages
In-Reply-To: <5a6e8a43-ed7e-74fc-f83b-ec29352eaf92@linux.intel.com>
Message-ID: <9d6591cb-1423-00cb-e87c-80d5a44a8fa7@linux.intel.com>
References: <cover.1791446401.git.Suma.Hegde@amd.com> <497f394990dab5c089950a6ec83c70a512a5fab3.1791446401.git.Suma.Hegde@amd.com> <5a6e8a43-ed7e-74fc-f83b-ec29352eaf92@linux.intel.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-137596341-1792582121=:1258"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-137596341-1792582121=:1258
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 21 Oct 2026, Ilpo J=E4rvinen wrote:

> On Thu, 8 Oct 2026, Suma Hegde wrote:
>=20
> > From: Suma Hegde <Suma.Hegde@amd.com>
> >=20
> > The HSMP driver previously allowed sending any message defined in
> > amd_hsmp.h, including ones not supported on the running platform.
> >=20
> > Add read and write bitmaps per socket to store which HSMP messages
> > are enabled on the platform. Add validation in validate_message()
> > to reject unsupported messages before they reach the SMU.
> >=20
> > Key changes:
> > - Introduce enabled_read_msg_ids and enabled_write_msg_ids bitmaps in
> >   struct hsmp_socket.
> > - Add is_read_msg_enabled() and is_write_msg_enabled() helpers in
> >   hsmp.h.
> > - Use is_get_msg() to distinguish read and write HSMP messages.
> > - Mark HSMP_TEST, HSMP_GET_PROTO_VER, and HSMP_GET_SMU_VER as always
> >   enabled during bitmap initialization, as these cannot be masked by
> >   BIOS.
> > - Skip bitmap init, populate, and validation on client platforms; the
> >   client message set has no per-platform bitmaps yet.
> >=20
> > Co-developed-by: Dhruv Gupta <dhruv.gupta@amd.com>
> > Signed-off-by: Dhruv Gupta <dhruv.gupta@amd.com>
> > Co-developed-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
> > Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
> > Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
> > ---
> >  drivers/platform/x86/amd/hsmp/acpi.c | 13 ++++
> >  drivers/platform/x86/amd/hsmp/hsmp.c | 94 ++++++++++++++++++++++++++++
> >  drivers/platform/x86/amd/hsmp/hsmp.h | 27 ++++++++
> >  drivers/platform/x86/amd/hsmp/plat.c | 13 ++++
> >  4 files changed, 147 insertions(+)
> >=20
> > diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x8=
6/amd/hsmp/acpi.c
> > index b6f54e8b91663..0d3b324fe2244 100644
> > --- a/drivers/platform/x86/amd/hsmp/acpi.c
> > +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> > @@ -566,6 +566,11 @@ static int init_acpi(struct device *dev)
> > =20
> >  =09sock =3D &hsmp_pdev->sock[sock_ind];
> > =20
> > +=09if (!is_client_platform()) {
> > +=09=09init_read_enabled_msg_bitmap(sock);
> > +=09=09init_write_enabled_msg_bitmap(sock);
> > +=09}
> > +
> >  =09/* Test the hsmp interface */
> >  =09ret =3D hsmp_test(sock_ind, 0xDEADBEEF);
> >  =09if (ret) {
> > @@ -581,6 +586,14 @@ static int init_acpi(struct device *dev)
> >  =09=09return ret;
> >  =09}
> > =20
> > +=09if (!is_client_platform()) {
> > +=09=09ret =3D hsmp_populate_msg_bitmaps(sock_ind);
> > +=09=09if (ret) {
> > +=09=09=09dev_err(dev, "Failed to get enabled HSMP messages on this pla=
tform\n");
> > +=09=09=09return ret;
> > +=09=09}
> > +=09}
> > +
> >  =09if ((is_client_platform() &&
> >  =09     sock->proto_ver >=3D RYZEN_MASTER_PROTO_VER1) ||
> >  =09    (!is_client_platform() &&
> > diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x8=
6/amd/hsmp/hsmp.c
> > index 8dc1fc75bd9ba..89528632c9532 100644
> > --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> > +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> > @@ -11,6 +11,7 @@
> > =20
> >  #include <linux/acpi.h>
> >  #include <linux/array_size.h>
> > +#include <linux/bitmap.h>
> >  #include <linux/build_bug.h>
> >  #include <linux/cleanup.h>
> >  #include <linux/compiler.h>
> > @@ -285,6 +286,8 @@ static int validate_message(struct hsmp_message *ms=
g)
> >  {
> >  =09const struct hsmp_plat_desc *plat_desc =3D hsmp_desc();
> >  =09const struct hsmp_msg_desc *desc;
> > +=09struct hsmp_socket *sock;
> > +=09unsigned int sock_ind;
> > =20
> >  =09if (!plat_desc->msg_desc) {
> >  =09=09/*
> > @@ -294,6 +297,9 @@ static int validate_message(struct hsmp_message *ms=
g)
> >  =09=09 * supports in each direction and leave msg_id correctness,
> >  =09=09 * such as an unsupported or out-of-range value, to the SMU
> >  =09=09 * status code __hsmp_send_message() already translates.
> > +=09=09 *
> > +=09=09 * Client platforms also have no per-platform enabled-message
> > +=09=09 * bitmaps yet, so skip that check here.
>=20
> I'm unsure how to read this. This validation seems to be on driver side s=
o=20
> why cannot it be validated for client?
>=20
> >  =09=09 */
> >  =09=09if (msg->num_args > HSMP_CLIENT_MAX_MSG_LEN ||
> >  =09=09    msg->response_sz > HSMP_CLIENT_MAX_MSG_LEN)
> > @@ -307,6 +313,17 @@ static int validate_message(struct hsmp_message *m=
sg)
> >  =09if (!desc)
> >  =09=09return -ENOMSG;
> > =20
> > +=09sock_ind =3D array_index_nospec(msg->sock_ind, hsmp_pdev.num_socket=
s);
> > +=09sock =3D &hsmp_pdev.sock[sock_ind];
> > +
> > +=09if (is_get_msg(desc, msg)) {
> > +=09=09if (!is_read_msg_enabled(sock, msg->msg_id))
> > +=09=09=09return -ENOMSG;
> > +=09} else {
> > +=09=09if (!is_write_msg_enabled(sock, msg->msg_id))
> > +=09=09=09return -ENOMSG;
> > +=09}
> > +
> >  =09/*
> >  =09 * num_args passed by user should match the num_args specified in
> >  =09 * message description table.
> > @@ -822,6 +839,83 @@ int hsmp_cache_proto_ver(u16 sock_ind)
> >  }
> >  EXPORT_SYMBOL_NS_GPL(hsmp_cache_proto_ver, "AMD_HSMP");
> > =20
> > +/*
> > + * Predefine read and write enabled message bitmaps for use on platfor=
ms where
> > + * HSMP_GET_ENABLED_HSMP_CMDS (37h) is not available.
> > + */
> > +static const u32 read_bitmap_f19h_m00h_0fh[] =3D {0x001b8cde, 0x000000=
00, 0x00000000};
>=20
> These are just a combination of BIT(msg_id), right? If yes, these should=
=20
> be constructed from the named defines by OR'ing them together instead of=
=20
> using those obscure literals.
>=20
> > +static const u32 write_bitmap_f19h_m00h_0fh[] =3D {0x00047320, 0x00000=
000, 0x00000000};
> > +
> > +static const u32 read_bitmap_zen4_variants[] =3D {0x7fdb8cde, 0x000000=
00, 0x00000000};
> > +static const u32 write_bitmap_zen4_variants[] =3D {0x80047320, 0x00000=
007, 0x00000000};
> > +
> > +static const u32 read_bitmap_f19h_m80h_9fh[] =3D {0x7e0b8cde, 0x000000=
38, 0x00000000};
> > +static const u32 write_bitmap_f19h_m80h_9fh[] =3D {0x00040320, 0x00000=
000, 0x00000000};
> > +
> > +static const u32 read_bitmap_f1ah_m00h_1fh[] =3D {0x7fdb8cde, 0x000701=
82, 0x00000000};
> > +static const u32 write_bitmap_f1ah_m00h_1fh[] =3D {0x80047320, 0x00000=
1c6, 0x00000000};
>=20
> What's the general plan with these? Do we have to keep adding to them whe=
n=20
> more platforms appear?

Nevermind the question, I see the answer in patch 9.

Could you please add a note about the future platforms having automatic=20
way to acquire this into changelog of this patch as well.

--
 i.

> > +/*
> > + * Family 0x1A model 0x50-0x5f, family 0x1A model 0xC0-0xCF,
> > + * family 0x1A model 0x90-0x9B and family 0x1A model 0xA0-0xAB
> > + * belong to 6th Gen AMD EPYC Server family.
> > + */
> > +static const u32 read_bitmap_zen6_variants[] =3D {0x7fdbbcde, 0x05ff07=
fe, 0x00000000};
> > +static const u32 write_bitmap_zen6_variants[] =3D {0x00047320, 0x07000=
7c6, 0x00000000};
> > +
> > +#define set_read_enabled_msg_bitmap(sock, src)=09\
> > +=09bitmap_from_arr32((sock)->enabled_read_msg_ids, (src), HSMP_MAX_MSG=
S)
> > +#define set_write_enabled_msg_bitmap(sock, src)=09\
> > +=09bitmap_from_arr32((sock)->enabled_write_msg_ids, (src), HSMP_MAX_MS=
GS)
> > +
> > +int hsmp_populate_msg_bitmaps(u16 sock_ind)
> > +{
> > +=09struct hsmp_socket *sock =3D &hsmp_pdev.sock[sock_ind];
> > +
> > +=09switch (boot_cpu_data.x86) {
> > +=09case 0x19:
> > +=09=09switch (boot_cpu_data.x86_model) {
> > +=09=09case 0x00 ... 0x0F:
> > +=09=09=09set_read_enabled_msg_bitmap(sock, read_bitmap_f19h_m00h_0fh);
> > +=09=09=09set_write_enabled_msg_bitmap(sock, write_bitmap_f19h_m00h_0fh=
);
> > +=09=09=09return 0;
> > +=09=09case 0x10 ... 0x1F:
> > +=09=09case 0xA0 ... 0xAF:
> > +=09=09=09set_read_enabled_msg_bitmap(sock, read_bitmap_zen4_variants);
> > +=09=09=09set_write_enabled_msg_bitmap(sock, write_bitmap_zen4_variants=
);
> > +=09=09=09return 0;
> > +=09=09case 0x80 ... 0x9F:
> > +=09=09=09set_read_enabled_msg_bitmap(sock, read_bitmap_f19h_m80h_9fh);
> > +=09=09=09set_write_enabled_msg_bitmap(sock, write_bitmap_f19h_m80h_9fh=
);
> > +=09=09=09return 0;
> > +=09=09}
> > +=09=09break;
> > +=09case 0x1A:
> > +=09=09switch (boot_cpu_data.x86_model) {
> > +=09=09case 0x00 ... 0x1F:
> > +=09=09=09set_read_enabled_msg_bitmap(sock, read_bitmap_f1ah_m00h_1fh);
> > +=09=09=09set_write_enabled_msg_bitmap(sock, write_bitmap_f1ah_m00h_1fh=
);
> > +=09=09=09return 0;
> > +=09=09case 0x50 ... 0x5F:
> > +=09=09case 0x90 ... 0x9B:
> > +=09=09case 0xA0 ... 0xAB:
> > +=09=09case 0xC0 ... 0xCF:
> > +=09=09=09set_read_enabled_msg_bitmap(sock, read_bitmap_zen6_variants);
> > +=09=09=09set_write_enabled_msg_bitmap(sock, write_bitmap_zen6_variants=
);
> > +=09=09=09/*
> > +=09=09=09 * PC6 control (msg 0x29) is not supported from
> > +=09=09=09 * protocol 0x70002 onwards on these models.
> > +=09=09=09 */
> > +=09=09=09if (sock->proto_ver >=3D 0x70002) {
> > +=09=09=09=09clear_bit(HSMP_PC6_ENABLE, sock->enabled_read_msg_ids);
> > +=09=09=09=09clear_bit(HSMP_PC6_ENABLE, sock->enabled_write_msg_ids);
> > +=09=09=09}
> > +=09=09=09return 0;
> > +=09=09}
> > +=09}
> > +=09return -ENODEV;
> > +}
> > +EXPORT_SYMBOL_NS_GPL(hsmp_populate_msg_bitmaps, "AMD_HSMP");
> > +
> >  static const struct file_operations hsmp_fops =3D {
> >  =09.owner=09=09=3D THIS_MODULE,
> >  =09.unlocked_ioctl=09=3D hsmp_ioctl,
> > diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x8=
6/amd/hsmp/hsmp.h
> > index 6c850c91a51b1..e67bbdd2b9bee 100644
> > --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> > +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> > @@ -13,6 +13,8 @@
> >  #include <asm/amd/hsmp.h>
> > =20
> >  #include <linux/acpi.h>
> > +#include <linux/bitmap.h>
> > +#include <linux/bitops.h>
> >  #include <linux/compiler_types.h>
> >  #include <linux/device.h>
> >  #include <linux/hwmon.h>
> > @@ -26,6 +28,8 @@
> >  #include <linux/sysfs.h>
> >  #include <linux/types.h>
> > =20
> > +#define HSMP_MAX_MSGS=09=09=0996
> > +
> >  #define HSMP_METRICS_TABLE_NAME=09"metrics_bin"
> > =20
> >  #define HSMP_ATTR_GRP_NAME_SIZE=0910
> > @@ -77,6 +81,8 @@ struct hsmp_socket {
> >  =09struct device *dev;
> >  =09u16 sock_ind;
> >  =09u32 proto_ver;
> > +=09DECLARE_BITMAP(enabled_read_msg_ids, HSMP_MAX_MSGS);
> > +=09DECLARE_BITMAP(enabled_write_msg_ids, HSMP_MAX_MSGS);
> >  =09int (*amd_hsmp_rdwr)(struct hsmp_socket *sock, u32 off, u32 *val, b=
ool rw);
> >  };
> > =20
> > @@ -86,7 +92,28 @@ struct hsmp_plat_device {
> >  =09u16 num_sockets;
> >  };
> > =20
> > +/* HSMP_TEST, HSMP_GET_PROTO_VER, HSMP_GET_SMU_VER are always enabled =
in
> > + * all the platforms and can't be masked by BIOS. Set those bits in th=
e
> > + * bitmap during bitmap initialization.
> > + */
> > +#define init_read_enabled_msg_bitmap(sock)=09=09=09=09=09\
> > +=09do {=09=09=09=09=09=09=09=09=09\
> > +=09=09bitmap_zero((sock)->enabled_read_msg_ids, HSMP_MAX_MSGS);=09\
> > +=09=09bitmap_set((sock)->enabled_read_msg_ids, HSMP_TEST, 1);=09=09\
> > +=09=09bitmap_set((sock)->enabled_read_msg_ids, HSMP_GET_PROTO_VER, 1);=
\
> > +=09=09bitmap_set((sock)->enabled_read_msg_ids, HSMP_GET_SMU_VER, 1);=
=09\
> > +=09} while (0)
> > +
> > +#define init_write_enabled_msg_bitmap(sock)=09\
> > +=09bitmap_zero((sock)->enabled_write_msg_ids, HSMP_MAX_MSGS)
> > +
> > +#define is_read_msg_enabled(sock, msg_id)=09\
> > +=09test_bit((msg_id), (sock)->enabled_read_msg_ids)
> > +#define is_write_msg_enabled(sock, msg_id)=09\
> > +=09test_bit((msg_id), (sock)->enabled_write_msg_ids)
> > +
> >  int hsmp_cache_proto_ver(u16 sock_ind);
> > +int hsmp_populate_msg_bitmaps(u16 sock_ind);
> >  int hsmp_test(u16 sock_ind, u32 value);
> >  long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg);
> >  void hsmp_misc_deregister(void);
> > diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x8=
6/amd/hsmp/plat.c
> > index 40c98d9c66d4f..310a776125961 100644
> > --- a/drivers/platform/x86/amd/hsmp/plat.c
> > +++ b/drivers/platform/x86/amd/hsmp/plat.c
> > @@ -178,6 +178,11 @@ static int init_platform_device(struct device *dev=
)
> >  =09=09sock->mbinfo.msg_arg_off=09=3D SMN_HSMP_MSG_DATA;
> >  =09=09sema_init(&sock->hsmp_sem, 1);
> > =20
> > +=09=09if (!is_client_platform()) {
> > +=09=09=09init_read_enabled_msg_bitmap(sock);
> > +=09=09=09init_write_enabled_msg_bitmap(sock);
> > +=09=09}
> > +
> >  =09=09/* Test the hsmp interface on each socket */
> >  =09=09ret =3D hsmp_test(i, 0xDEADBEEF);
> >  =09=09if (ret) {
> > @@ -193,6 +198,14 @@ static int init_platform_device(struct device *dev=
)
> >  =09=09=09return ret;
> >  =09=09}
> > =20
> > +=09=09if (!is_client_platform()) {
> > +=09=09=09ret =3D hsmp_populate_msg_bitmaps(i);
> > +=09=09=09if (ret) {
> > +=09=09=09=09dev_err(dev, "Failed to get enabled HSMP messages on this =
platform\n");
> > +=09=09=09=09return ret;
> > +=09=09=09}
> > +=09=09}
> > +
> >  =09=09if (sock->proto_ver =3D=3D HSMP_PROTO_VER6) {
> >  =09=09=09ret =3D hsmp_get_tbl_dram_base(i);
> >  =09=09=09if (ret)
> >=20
>=20
>=20
--8323328-137596341-1792582121=:1258--
