Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437329;
	b=HMRbMC+3ZXkgIhh1kxdxjAsSdxXK0fnMqvGjbQd1o6wU1PO/xTUwm2C1F/5cn4iY4iEh
	 yacide33BckjqVNEhjBFtkFeMWz/yO/dVYN6W4Gddk2mR2P97x3cXgqGwduclsLkxHlej
	 aI8fsr8ib7JCFORl84509XvezWzbIfKuasAuUgVuQENIYeNoA1BY4wbwR/H4oL58EtB7N
	 a0Mkd7itOtkFj71yt0LmGWL6Je17QO68q20xklFl0Y/4t1xnxmI1sCxN+s9o/C+VS4fen
	 l6gqb1bomPtvK5BJiAb6Z0K6voCkA/EGkVMBiHkyDc4YOAEAqGNCpnYVQLoELNlRHKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437329;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=ApFgw7+o3U9zs2dyYUlSp5SAIMfdWHuDTcKP7e9pINk=;
	b=MVsxSfj2U6FterVKXdhZysIf6HKGXSyfba731sE0/3Cq19tC/X1mREF+MTeMrQXE2WT6
	 zJ/ETXO8jX4O8AB9YjHZfGk2gFXFyff5ilUnffk4Efjp/xzua+HbJoj6gtzO+hCbgRs9i
	 TAf8sDZdxFIMWjXmydgKYAV9YjYl1LqfdaDPCRkJDieSTf66GedZ71FAErnfGx8ACshl7
	 xETfPFlXZifg4bmOp4QuWY6hUaozHyEzR4X6BcY3wcE8rSQbpRKacDlJwUA/ymorJ6m7n
	 ZJBFpW526jRj7kslaLKW0k4Mg88XJ+aflpByhO0p28Ox8BIvz1Ik4ERvLyIO7a7JZIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hZnoisja;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4616D606A31A;
	Mon, 23 Nov 2026 12:35:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4616D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hZnoisja
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795437330; x=1826973330;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=JMzHUPNU5wsmSvP3Lub0OYgKpsZUan5IFXp32manYDM=;
  b=hZnoisjaKXL5t54dQv17t+ccGBdvesRMOEv/ZLad4XAc9V2tN6mKkXhr
   oRocgaUT4iaTsZkZ3BFUpuBcQH0CogU7n9yn4ECMbHElLlY6hX1aC2w2W
   sQ2o+jOxg08TEXMk3nC1A5FZax2cH63LSgAjfXBmUOOBdc5rMt/qxNhsT
   R+5if36Uex4FyatvpN6KX+V0rpVk71UI+Qdwx6E1PD5e7Ap3MKGqULhaW
   +RLXP6eixBen6FrIQMwvwCaqii7Up6hUUCpUH/qTPi0FCKkc6XN9kzcVi
   rIPxtaIa8cEyVGkK+attMjPXUXWkyupirl3A8GI3CHZUBWE65wVy33hw/
   Q==;
X-CSE-ConnectionGUID: whn3luujQTWwdgoKVavivQ==
X-CSE-MsgGUID: gxRPB7v+S+KSgMUzgCsbHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4224070"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4224070"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 04:35:29 -0800
X-CSE-ConnectionGUID: GvW2UXRUS2Ka1XD4Msxv8A==
X-CSE-MsgGUID: Xw/RlPSlTpunuAHDMMEhYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11704730"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.225])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 04:35:24 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 23 Nov 2026 14:35:20 +0200 (EET)
To: Rong Zhang <i@rong.moe>
cc: Alan Pluto <alanpluto@163.com>, platform-driver-x86@vger.kernel.org, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, derekjohn.clark@gmail.com, 
    W_Armin@gmx.de, corbet@lwn.net, skhan@linuxfoundation.org, 
    rdunlap@infradead.org, Hans de Goede <hansg@kernel.org>, 
    linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] platform/x86: lenovo-wmi-other: Add raw GetDataByPackage
 interface
In-Reply-To: <fcabaf8647e0c1ab487cd612d5a290082613ec0b.camel@rong.moe>
Message-ID: <983f2e32-cc6e-fa3f-3aee-6aad1e5fa7c8@linux.intel.com>
References: <20261116040532.154928-1-alanpluto@163.com>  <20261123061120.18740-1-alanpluto@163.com> <fcabaf8647e0c1ab487cd612d5a290082613ec0b.camel@rong.moe>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-731521474-1795437320=:1065"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-731521474-1795437320=:1065
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 23 Nov 2026, Rong Zhang wrote:

> Hi Alan,
>=20
> On Mon, 2026-11-23 at 14:11 +0800, Alan Pluto wrote:
> > Lenovo's userspace utility uses the Other Mode WMI GetDataByPackage
>=20
> What's the purpose of the utility? Could you provide some context? You
> can ignore this question if it's confidential, but in general providing
> necessary context can help maintainers and reviewers learn about the
> intent.
>=20
> > method (99) to check device readiness. Expose the method through debugf=
s
> > so the firmware request and response can be inspected on Linux without
> > adding a stable userspace ABI.
> >=20
> > The interface is disabled by default and can be enabled by passing
> > enable_get_data_by_package=3D1 when loading the module.
> >=20
> > Signed-off-by: Alan Pluto <alanpluto@163.com>
> > ---
> > Changes in v2:
> > - Replace the character device with a debugfs file, disabled by default=
=2E
> > - Allow one open per WMI device and require a single read for the respo=
nse.
> > - Use scoped locks, lockdep checks, automatic buffer cleanup, and the
> >   WMI helper's minimum response size check.
> >=20
> >  Documentation/wmi/devices/lenovo-wmi-other.rst |  12 +-
> >  drivers/platform/x86/lenovo/wmi-other.c        | 208 +++++++++++++++++=
++++++++
> >  2 files changed, 219 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documenta=
tion/wmi/devices/lenovo-wmi-other.rst
> > index 011054d64eac5b601333373c4d405f9c5117ffc2..42e1525a8852bd7c8ddc04c=
c4047b1f09c5b770f 100644
> > --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> > +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> > @@ -33,6 +33,15 @@ under the following path:
> > =20
> >  Additionally, this driver also exports attributes to HWMON.
> > =20
> > +GetDataByPackage diagnostics
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> Missing a ~
>=20
> > +
> > +The driver does not create the diagnostic file by default. To enable i=
t,
> > +pass ``enable_get_data_by_package=3D1`` when loading ``lenovo-wmi-othe=
r``.
> > +The file is at ``lenovo_wmi/<WMI device>/get_data_by_package``.
> > +Not all devices support the method. Use only commands whose behavior a=
nd
> > +side effects are understood.
> > +
> >  LENOVO_CAPABILITY_DATA_00
> >  -------------------------
> > =20
> > @@ -107,7 +116,8 @@ WMI interface description
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > =20
> >  The WMI interface description can be decoded from the embedded binary =
MOF (bmof)
> > -data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
> > +data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility. Thi=
s older
> > +example lists ``Max(40)`` for GetDataByPackage; newer firmware uses 10=
0 bytes.
>=20
> ??? Could you move the sentence to the right place?
>=20
> > =20
> >  ::
> > =20
> > diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform=
/x86/lenovo/wmi-other.c
> > index bd64e7b44669db684145298ae088dd2c7f539d29..827b4215c612fbfc052bbad=
ff0672e68e65517f0 100644
> > --- a/drivers/platform/x86/lenovo/wmi-other.c
> > +++ b/drivers/platform/x86/lenovo/wmi-other.c
> > @@ -27,13 +27,16 @@
> >   */
> > =20
> >  #include <linux/acpi.h>
> > +#include <linux/atomic.h>
> >  #include <linux/bitfield.h>
> >  #include <linux/cleanup.h>
> >  #include <linux/component.h>
> >  #include <linux/container_of.h>
> > +#include <linux/debugfs.h>
> >  #include <linux/device.h>
> >  #include <linux/export.h>
> >  #include <linux/firmware_attributes.h>
> > +#include <linux/fs.h>
> >  #include <linux/gfp_types.h>
> >  #include <linux/hwmon.h>
> >  #include <linux/idr.h>
> > @@ -41,9 +44,12 @@
> >  #include <linux/kobject.h>
> >  #include <linux/limits.h>
> >  #include <linux/module.h>
> > +#include <linux/mutex.h>
> >  #include <linux/platform_profile.h>
> >  #include <linux/power_supply.h>
> > +#include <linux/slab.h>
> >  #include <linux/types.h>
> > +#include <linux/uaccess.h>
> >  #include <linux/wmi.h>
> > =20
> >  #include <acpi/battery.h>
> > @@ -90,6 +96,8 @@ enum lwmi_feature_id_psu {
> > =20
> >  #define LWMI_FEATURE_VALUE_GET 17
> >  #define LWMI_FEATURE_VALUE_SET 18
> > +#define LWMI_DATA_PACKAGE_GET 99
> > +#define LWMI_DATA_PACKAGE_INPUT_MAX 100
> > =20
> >  #define LWMI_FAN_ID_BASE 1
> >  #define LWMI_FAN_NR 4
> > @@ -141,6 +149,8 @@ struct lwmi_om_priv {
> >  =09struct device *fw_attr_dev;
> >  =09struct kset *fw_attr_kset;
> >  =09struct wmi_device *wdev;
> > +=09struct dentry *debugfs_dir;
> > +=09atomic_t package_opened;
> >  =09int ida_id;
> > =20
> >  =09struct lwmi_fan_info fan_info[LWMI_FAN_NR];
> > @@ -156,6 +166,23 @@ struct lwmi_om_priv {
> >  =09bool bh_registered;
> >  };
> > =20
> > +struct lwmi_package_response {
> > +=09__le32 data_size;
> > +=09u8 data[];
> > +};
>=20
> Even though there is no gap between data_size and data, please add a
> __packed annotation to clearly indicate your intent.
>=20
> > +
> > +struct lwmi_package_file {
> > +=09struct lwmi_om_priv *priv;
> > +=09/* Protects the pending response on shared descriptors. */
> > +=09struct mutex lock;
> > +=09struct lwmi_package_response *response;
> > +=09size_t response_len;
> > +};
> > +
> > +static bool enable_get_data_by_package;
> > +module_param(enable_get_data_by_package, bool, 0400);
> > +MODULE_PARM_DESC(enable_get_data_by_package, "Enable the GetDataByPack=
age debugfs interface");
> > +
> >  /*
> >   * Visibility of fan channels:
> >   *
> > @@ -1611,6 +1638,174 @@ static void lwmi_om_fw_attr_remove(struct lwmi_=
om_priv *priv)
> > =20
> >  /* =3D=3D=3D=3D=3D=3D=3D=3D Self (master: lenovo-wmi-other) =3D=3D=3D=
=3D=3D=3D=3D=3D */
> > =20
> > +static int lwmi_package_open(struct inode *inode, struct file *file)
> > +{
> > +=09struct lwmi_om_priv *priv =3D inode->i_private;
> > +=09struct lwmi_package_file *state __free(kfree) =3D NULL;
>=20
> The declarations of __free() pointers should be placed at where it's
> allocated, i.e., ...
>=20
> > +
> > +=09if ((file->f_mode & (FMODE_READ | FMODE_WRITE)) !=3D (FMODE_READ | =
FMODE_WRITE))
> > +=09=09return -EINVAL;
> > +
> > +=09state =3D kzalloc_obj(*state);
>=20
> ...here.
>=20
> Meanwhile,=C2=A0opening the file while priv->package_opened =3D=3D 1 allo=
cates
> memory in vain. Could you move it below the package_opened check? In this
> manner you don't need the __free() either.
>=20
> > +=09if (!state)
> > +=09=09return -ENOMEM;
> > +
> > +=09if (atomic_cmpxchg(&priv->package_opened, 0, 1))
>=20
> atomic_cmpxchg_acquire()
>=20
> > +=09=09return -EBUSY;
> > +
> > +=09mutex_init(&state->lock);
> > +=09state->priv =3D priv;
> > +=09file->private_data =3D no_free_ptr(state);
> > +
> > +=09return stream_open(inode, file);
> > +}
> > +
> > +static int lwmi_package_release(struct inode *inode, struct file *file=
)
> > +{
> > +=09struct lwmi_package_file *state =3D file->private_data;
> > +=09struct dentry *dentry =3D file->f_path.dentry;
> > +
> > +=09kfree_sensitive(state->response);
>=20
> You didn't explain what data it is in your replies. "Can contain
> sensitive data" is not an acceptable explanation.
>=20
> Please grep the occurrence of kfree_sensitive() in the kernel tree, and
> you'll find that they are mostly credentials. Does the data passed by the
> interface fall into the same category?=20
>=20
> TBH, anything goes through WMI is *never* secret. If a manufacturer ever
> decided to use it to deliver "sensitive" data, it either misunderstood
> the word or chose the wrong interface.
>=20
> An ACPI-WMI method goes through the ACPICA, then the WMI core, and
> finally here. The former two's temporary buffers are either on stack or
> freed by the vanilla kfree(). If leaking "sensitive" response were really
> a concern, it must had been leaked before it reached your code.
>=20
> Please don't use kfree_sensitive() unless you really understand the data
> flow path and have a strong reason to use it. If you insist on it, please
> answer both questions.
>=20
> > +=09mutex_destroy(&state->lock);
> > +
> > +=09/* Unlike read and write, release can run after debugfs removal. */
>=20
> The comment is not helpful, as it's just repeating well-known knowledge.
> Please explain what it protects:
>=20
>    The release() callback may be called after state->priv has been freed.
>    Only when the debugfs file hasn't been removed is the pointer valid.
>=20
> > +=09if (!debugfs_file_get(dentry)) {
> > +=09=09atomic_set(&state->priv->package_opened, 0);
>=20
> atomic_set_release()
>=20
> > +=09=09debugfs_file_put(dentry);
> > +=09}
> > +
> > +=09kfree(state);
> > +=09return 0;
> > +}
> > +
> > +static int lwmi_package_invoke(struct lwmi_package_file *state, u8 *da=
ta)
> > +{
> > +=09struct lwmi_om_priv *priv =3D state->priv;
> > +=09struct wmi_buffer input =3D { .length =3D LWMI_DATA_PACKAGE_INPUT_M=
AX, .data =3D data };
> > +=09struct wmi_buffer output;
> > +=09u32 data_size;
> > +=09int ret;
> > +
> > +=09lockdep_assert_held(&state->lock);
> > +
> > +=09/* The tested firmware needs two calls before its response is usabl=
e. */
> > +=09ret =3D wmidev_invoke_method(priv->wdev, 0, LWMI_DATA_PACKAGE_GET,
> > +=09=09=09=09   &input, &output, 0);
> > +=09if (ret)
> > +=09=09return ret;
> > +
> > +=09kfree_sensitive(output.data);
> > +
> > +=09ret =3D wmidev_invoke_method(priv->wdev, 0, LWMI_DATA_PACKAGE_GET,
> > +=09=09=09=09   &input, &output, sizeof(struct lwmi_package_response));
> > +=09if (ret)
> > +=09=09return ret;
> > +
> > +=09struct lwmi_package_response *response __free(kfree_sensitive) =3D =
output.data;
> > +
> > +=09data_size =3D le32_to_cpu(response->data_size);
> > +=09if (data_size > output.length - sizeof(*response))
>=20
> Why not use struct_size() here? Considering that...
>=20
> > +=09=09return -EPROTO;
> > +
> > +=09state->response_len =3D struct_size(response, data, data_size);
>=20
> ...you've used it here, you may introduce a on-stack variable to
> temporarily store the calculated size and use it here and there.
>=20
> > +=09state->response =3D no_free_ptr(response);
> > +=09return 0;
> > +}
> > +
> > +static ssize_t lwmi_package_write(struct file *file, const char __user=
 *buffer,
> > +=09=09=09=09  size_t count, loff_t *ppos)
> > +{
> > +=09struct lwmi_package_file *state =3D file->private_data;
> > +=09u8 input[LWMI_DATA_PACKAGE_INPUT_MAX] =3D {};
> > +=09int ret;
> > +
> > +=09if (!count || count > sizeof(input))
> > +=09=09return -EINVAL;
> > +
> > +=09ACQUIRE(mutex_try, state_guard)(&state->lock);
> > +=09if (ACQUIRE_ERR(mutex_try, &state_guard) || state->response)
> > +=09=09return -EBUSY;
>=20
> I don't think it's a good idea to share the same errno between the two
> cases.
>=20
> While ACQUIRE_ERR(mutex_try, &state_guard) should return -EBUSY, a
> pending state->response should return something like -EALREADY or
> -ENOTEMPTY.

Generally, one should be mostly be returning the error from ACQUIRE_ERR()=
=20
for that case.

=09ret =3D ACQUIRE_ERR(..);
=09if (ret)
=09=09return ret;

--=20
 i.

--8323328-731521474-1795437320=:1065--
