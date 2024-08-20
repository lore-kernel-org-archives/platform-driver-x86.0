Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EEE18E048
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Aug 2024 11:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724153302; cv=none; b=rVQ3mHNbDG5iU8+NvFHgpT0iwysrvXdRQb27eQZtvBcUbodMxydqwUStB05f7g0lHQTf1IdAq1LOouhmiC+47M/GTjlHBD9whZEKC6S5/4MEfglr8OUWNJrOXEqWmPNACXByD/UGcFKTXbuMb9tRj/YqKUD50rMQjNQQ5te34aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724153302; c=relaxed/simple;
	bh=VvXkxbbKn+lj9ipXB2coR1UaIXY7Yv+o5/nwuP0MDMk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=lMs85uI6aCizNECG9IA5sh7WUyeI6vSfctVOn0WMKurgxmuHGWQsf2IZI4tCC/yo/QRuuSqzHiCGcvZcerPjv0vSf+vQo9xtuq6cvJACYg7muNPP5E6i5tNPg66IAnPoWnrw2oLAwO2YJX4Y8Q+xNZB6ruwjJU8yrdREmFQ0KDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NlNjskIo; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NlNjskIo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724153301; x=1755689301;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=VvXkxbbKn+lj9ipXB2coR1UaIXY7Yv+o5/nwuP0MDMk=;
  b=NlNjskIoc1x8y3noFRv8rtNw9Z+xwPJE8mgPVNcngEcxRVDAVkQIHv9a
   C1EPoyZnAt5K5blXuieqaxFPJftVe3RveOnWhHQAaRzT82pvlqTAS8SNX
   vvwLbdhSV85UxMNxT1OUhZF6Nt18fiMuvpc0/f1/4ht15PqiHFyF6zjXV
   slTgg3jlkaMJO8hirTN2YTUE8xR6LQjFkjPfIhbJ9oSarjcIkdUYxKfck
   0diNBMKy1LRXQNyj3VUKcN5w6TgMy81QNBCmeRQOpibvHuo7YpZQOTFHT
   ExkU+VA95/uK0Fs5yBOd5stAT57iqjzTotV3LN551wiYjYEYD1ghkwM5u
   Q==;
X-CSE-ConnectionGUID: 12PCd1WESTKZcDteqy3NCw==
X-CSE-MsgGUID: 9wPfQH2OS8mgPE4qvG4yhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="39902418"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="39902418"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 04:28:20 -0700
X-CSE-ConnectionGUID: Ewt1692HQx6mGpUKooGeGQ==
X-CSE-MsgGUID: rsS83ZqKS3OS4BJ+9EuS9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="83905154"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.102])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 04:28:18 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 Aug 2024 14:28:14 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [v4 03/11] platform/x86/amd/hsmp: Convert amd_hsmp_rdwr() to a
 function pointer
In-Reply-To: <20240820102941.1813163-3-suma.hegde@amd.com>
Message-ID: <d56a94d6-2123-37ab-dd8b-f936d7048389@linux.intel.com>
References: <20240820102941.1813163-1-suma.hegde@amd.com> <20240820102941.1813163-3-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1422615559-1724153294=:1119"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1422615559-1724153294=:1119
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 20 Aug 2024, Suma Hegde wrote:

> This is in preparation to ACPI, Non-ACPI split.
> amd_hsmp_rdwr() is used to access HSMP protocol registers.
> ACPI and Non-ACPI use different methods to access these registers.
> Now that code is split and common functionality is kept in hsmp.c
> we need to define a function pointer to handle these functions separately=
=2E
>=20
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> ---
> Changes since v3:
> New patch created out of 7th patch in v3 series, to address the review co=
mment.

Thanks.

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

>=20
>  drivers/platform/x86/amd/hsmp/hsmp.c | 30 +++++++++++-----------------
>  1 file changed, 12 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/=
amd/hsmp/hsmp.c
> index 10ab9b2437f1..6d0c58c6a82f 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -82,6 +82,7 @@ struct hsmp_socket {
>  =09struct pci_dev *root;
>  =09struct device *dev;
>  =09u16 sock_ind;
> +=09int (*amd_hsmp_rdwr)(struct hsmp_socket *sock, u32 off, u32 *val, boo=
l rw);
>  };
> =20
>  struct hsmp_plat_device {
> @@ -114,22 +115,13 @@ static int amd_hsmp_pci_rdwr(struct hsmp_socket *so=
ck, u32 offset,
>  =09return ret;
>  }
> =20
> -static void amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
> -=09=09=09       u32 *value, bool write)
> +static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
> +=09=09=09      u32 *value, bool write)
>  {
>  =09if (write)
>  =09=09iowrite32(*value, sock->virt_base_addr + offset);
>  =09else
>  =09=09*value =3D ioread32(sock->virt_base_addr + offset);
> -}
> -
> -static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 offset,
> -=09=09=09 u32 *value, bool write)
> -{
> -=09if (plat_dev.is_acpi_device)
> -=09=09amd_hsmp_acpi_rdwr(sock, offset, value, write);
> -=09else
> -=09=09return amd_hsmp_pci_rdwr(sock, offset, value, write);
> =20
>  =09return 0;
>  }
> @@ -156,7 +148,7 @@ static int __hsmp_send_message(struct hsmp_socket *so=
ck, struct hsmp_message *ms
> =20
>  =09/* Clear the status register */
>  =09mbox_status =3D HSMP_STATUS_NOT_READY;
> -=09ret =3D amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_=
WR);
> +=09ret =3D sock->amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status,=
 HSMP_WR);
>  =09if (ret) {
>  =09=09pr_err("Error %d clearing mailbox status register\n", ret);
>  =09=09return ret;
> @@ -165,8 +157,8 @@ static int __hsmp_send_message(struct hsmp_socket *so=
ck, struct hsmp_message *ms
>  =09index =3D 0;
>  =09/* Write any message arguments */
>  =09while (index < msg->num_args) {
> -=09=09ret =3D amd_hsmp_rdwr(sock, mbinfo->msg_arg_off + (index << 2),
> -=09=09=09=09    &msg->args[index], HSMP_WR);
> +=09=09ret =3D sock->amd_hsmp_rdwr(sock, mbinfo->msg_arg_off + (index << =
2),
> +=09=09=09=09=09  &msg->args[index], HSMP_WR);
>  =09=09if (ret) {
>  =09=09=09pr_err("Error %d writing message argument %d\n", ret, index);
>  =09=09=09return ret;
> @@ -175,7 +167,7 @@ static int __hsmp_send_message(struct hsmp_socket *so=
ck, struct hsmp_message *ms
>  =09}
> =20
>  =09/* Write the message ID which starts the operation */
> -=09ret =3D amd_hsmp_rdwr(sock, mbinfo->msg_id_off, &msg->msg_id, HSMP_WR=
);
> +=09ret =3D sock->amd_hsmp_rdwr(sock, mbinfo->msg_id_off, &msg->msg_id, H=
SMP_WR);
>  =09if (ret) {
>  =09=09pr_err("Error %d writing message ID %u\n", ret, msg->msg_id);
>  =09=09return ret;
> @@ -192,7 +184,7 @@ static int __hsmp_send_message(struct hsmp_socket *so=
ck, struct hsmp_message *ms
>  =09timeout=09=3D jiffies + msecs_to_jiffies(HSMP_MSG_TIMEOUT);
> =20
>  =09while (time_before(jiffies, timeout)) {
> -=09=09ret =3D amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HS=
MP_RD);
> +=09=09ret =3D sock->amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_stat=
us, HSMP_RD);
>  =09=09if (ret) {
>  =09=09=09pr_err("Error %d reading mailbox status\n", ret);
>  =09=09=09return ret;
> @@ -227,8 +219,8 @@ static int __hsmp_send_message(struct hsmp_socket *so=
ck, struct hsmp_message *ms
>  =09 */
>  =09index =3D 0;
>  =09while (index < msg->response_sz) {
> -=09=09ret =3D amd_hsmp_rdwr(sock, mbinfo->msg_arg_off + (index << 2),
> -=09=09=09=09    &msg->args[index], HSMP_RD);
> +=09=09ret =3D sock->amd_hsmp_rdwr(sock, mbinfo->msg_arg_off + (index << =
2),
> +=09=09=09=09=09  &msg->args[index], HSMP_RD);
>  =09=09if (ret) {
>  =09=09=09pr_err("Error %d reading response %u for message ID:%u\n",
>  =09=09=09       ret, index, msg->msg_id);
> @@ -545,6 +537,7 @@ static int hsmp_parse_acpi_table(struct device *dev, =
u16 sock_ind)
> =20
>  =09sock->sock_ind=09=09=3D sock_ind;
>  =09sock->dev=09=09=3D dev;
> +=09sock->amd_hsmp_rdwr=09=3D amd_hsmp_acpi_rdwr;
>  =09plat_dev.is_acpi_device=09=3D true;
> =20
>  =09sema_init(&sock->hsmp_sem, 1);
> @@ -756,6 +749,7 @@ static int init_platform_device(struct device *dev)
>  =09=09sock->sock_ind=09=09=09=3D i;
>  =09=09sock->dev=09=09=09=3D dev;
>  =09=09sock->mbinfo.base_addr=09=09=3D SMN_HSMP_BASE;
> +=09=09sock->amd_hsmp_rdwr=09=09=3D amd_hsmp_pci_rdwr;
> =20
>  =09=09/*
>  =09=09 * This is a transitional change from non-ACPI to ACPI, only
>=20

--8323328-1422615559-1724153294=:1119--
