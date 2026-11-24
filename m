Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795533136;
	b=QTrEJTU2ksw9ln+a1poVTWZSxADk4J5FWWUI6dXjtW0urkP15/pkE+0hEXN9LTVv6t6I
	 jsfFmzXSHAFJhUMeg4M/lqDkolyNUjM77uzOX13XEptCP/8f9GLdOM/QtlG0Da1LPwc0h
	 YrLgxXERkLdrXGv5vHdKIHfN2BTanovM12YmFPht07ZoF30nfKpcyktM94a9BbNAd7U4c
	 W+6AamtWkdqYkxOikxlD6xMwDNmyTOPlR4ElqAZmFIcsgkO69YY7afhSW5UOIWC8HM5QU
	 d6HcmC0iolRfzcjZCx/5VfykiJ5CZRvDoQM6E/gdrHWBQ61RBdXiw8/IhfYVlblvqkw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795533136;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=vcHFZWa5sEjZR4uixpqN7VW4XhMZHoN1fCuTYjNwSpk=;
	b=HlBgkMIt0XA5tMfAQokPXuZfcVRFJJ7IcTCofnzi/EtjzQktRmLxpntcmlIkp4zd7ErT
	 6u1mgYysWpK1qmyNQVKLePNNO/rCgMGRnxW2rPZmpGnOkafglHVkdFhZjJb36MNPH7L+j
	 54Omc3OsDqxM8wrpiz9g9V/2Tda3d39Elffi+4yAzVDBuIaEgxCZyZ/7i8mJkZlJVaO9q
	 oy2vyK7JRzq59Id6Hsfj/Q1UmngjFqBt+X3e/M0vkd7/oWxQbyuq4e3gurGghi000QzJy
	 JFes4S721MrRpkywsz919hbx3VelTMlrs6Yc74mMWRmFZV+9Zz031LleUoHg804xsSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=htNEGTY+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
Received: from sender6-pp-f112.zoho.com (sender6-pp-f112.zoho.com [165.173.180.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC9B606A31E;
	Tue, 24 Nov 2026 15:12:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAC9B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=htNEGTY+
ARC-Seal: i=1; a=rsa-sha256; t=1795533097; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FOpODvSBCubD0eoKvqHpoP6aMPan024J+CElYzdDamcbDL/wHGjdzPs4B8MQNz1eu43792MzqvQg3/8ZCR42x/tsAnOWZEFxM+y1YQtxDbXiFwLzg4DWpPCKNy2ZTfVjDwanSvV/S2GnvwoxApEMqp1yF8DQoHVhdFYpVjE2Qsw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795533097; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vcHFZWa5sEjZR4uixpqN7VW4XhMZHoN1fCuTYjNwSpk=; 
	b=jaIvnGOBCxFlZ4eeD5TvTCqO2zqBwwIbNEccMGl50WvuyaoCwaJJfN+SLKV6t+QURlp9Ql0K2WyeY9ie92T8f+SLDACTLgAxfys2CBbm6uSz3sQR4/S3WmROMJf7n04lO/PedSwcH0aSCkEmVzRi22RPwkQA0VGzxgJD8vIPaZc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=htNEGTY+kF2QqRwkk02Bh5GdX4/j5YWL8JK1pn8nL6aJBe5pDZoZQEEBdiwraYl49e+AD9XkmRfa7YIyFWRPd8CeuyqdPWtB2ZxKCQIJCweFKvQPpuICxgHGOIMrcds55cZRm/GyG+l8wMcHCUAv7VR6qXgFDMnS4/OQla1vPf0/Vb1rFXet1Z86r/dCqtAZJqHMET3rzVxHTjQDeqtmP0jRM4403hSIxOLHOEgP+TvyfSTaPRMbf5RZZLoFj/xZTjwbgrK1AdD0usfgXzWKxXmZJwIXAQRlnsPi9aLryCKxL9sCij1QkK2LdWfJ8A4J462Ykh7L+s/9fuy0sfXeTg==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=vcHFZWa5sEjZR4uixpqN7VW4XhMZHoN1fCuTYjNwSpk=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795533093851277.1277137915863;
	Tue, 24 Nov 2026 07:11:33 -0800 (PST)
Message-ID: <3318369400ef4498abf984e53e0ffddbebefcd6a.camel@rong.moe>
Subject: Re: [PATCH v2] platform/x86: lenovo-wmi-other: Add raw
 GetDataByPackage interface
From: Rong Zhang <i@rong.moe>
To: Alan <alanpluto@163.com>, platform-driver-x86@vger.kernel.org
Cc: mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com, W_Armin@gmx.de, 
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 hansg@kernel.org, 	ilpo.jarvinen@linux.intel.com,
 linux-doc@vger.kernel.org, 	linux-kernel@vger.kernel.org
In-Reply-To: <f5b36363-45a8-43f6-863b-5c7df6cee7eb@163.com>
References: <20261116040532.154928-1-alanpluto@163.com>
	 <20261123061120.18740-1-alanpluto@163.com>
	 <fcabaf8647e0c1ab487cd612d5a290082613ec0b.camel@rong.moe>
	 <5b327bf279357b68b91ec66b465501a2760b23eb.camel@rong.moe>
	 <7442b878b63d67c44af0bdb379a9de04dae76669.camel@rong.moe>
	 <f5b36363-45a8-43f6-863b-5c7df6cee7eb@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 23:06:21 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.62.1-4 
X-ZohoMailClient: External

Hi Alan,

On Tue, 2026-11-24 at 16:05 +0800, Alan wrote:
> Hi Rong,
>=20
> On 11/23/2026 11:36 PM, Rong Zhang wrote:
> > Hi Alan,
> >=20
> > On Mon, 2026-11-23 at 20:34 +0800, Rong Zhang wrote:
> > > Hi Alan,
> > >=20
> > > On Mon, 2026-11-23 at 20:21 +0800, Rong Zhang wrote:
> > > > Hi Alan,
> > > >=20
> > > > On Mon, 2026-11-23 at 14:11 +0800, Alan Pluto wrote:
> > > > > Lenovo's userspace utility uses the Other Mode WMI GetDataByPacka=
ge
> > > >=20
> > > > What's the purpose of the utility? Could you provide some context? =
You
> > > > can ignore this question if it's confidential, but in general provi=
ding
> > > > necessary context can help maintainers and reviewers learn about th=
e
> > > > intent.
> > > >=20
> > > > > method (99) to check device readiness. Expose the method through =
debugfs
> > > > > so the firmware request and response can be inspected on Linux wi=
thout
> > > > > adding a stable userspace ABI.
> > > > >=20
> > > > > The interface is disabled by default and can be enabled by passin=
g
> > > > > enable_get_data_by_package=3D1 when loading the module.
> > > > >=20
> > > > > Signed-off-by: Alan Pluto <alanpluto@163.com>
> > > > > ---
> > > > > Changes in v2:
> > > > > - Replace the character device with a debugfs file, disabled by d=
efault.
> > > > > - Allow one open per WMI device and require a single read for the=
 response.
> > > > > - Use scoped locks, lockdep checks, automatic buffer cleanup, and=
 the
> > > > >   WMI helper's minimum response size check.
> > > > >=20
> > > > >  Documentation/wmi/devices/lenovo-wmi-other.rst |  12 +-
> > > > >  drivers/platform/x86/lenovo/wmi-other.c        | 208 +++++++++++=
++++++++++++++
> > > > >  2 files changed, 219 insertions(+), 1 deletion(-)
> > > > >=20
> > > > > diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Doc=
umentation/wmi/devices/lenovo-wmi-other.rst
> > > > > index 011054d64eac5b601333373c4d405f9c5117ffc2..42e1525a8852bd7c8=
ddc04cc4047b1f09c5b770f 100644
> > > > > --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> > > > > +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> > > > > @@ -33,6 +33,15 @@ under the following path:
> > > > > =20
> > > > >  Additionally, this driver also exports attributes to HWMON.
> > > > > =20
> > > > > +GetDataByPackage diagnostics
> > > > > +~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > >=20
> > > > Missing a ~
> > > >=20
> > > > > +
> > > > > +The driver does not create the diagnostic file by default. To en=
able it,
> > > > > +pass ``enable_get_data_by_package=3D1`` when loading ``lenovo-wm=
i-other``.
> > > > > +The file is at ``lenovo_wmi/<WMI device>/get_data_by_package``.
> > > > > +Not all devices support the method. Use only commands whose beha=
vior and
> > > > > +side effects are understood.
> > > > > +
> > > > >  LENOVO_CAPABILITY_DATA_00
> > > > >  -------------------------
> > > > > =20
> > > > > @@ -107,7 +116,8 @@ WMI interface description
> > > > >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> > > > > =20
> > > > >  The WMI interface description can be decoded from the embedded b=
inary MOF (bmof)
> > > > > -data using the `bmfdec <https://github.com/pali/bmfdec>`_ utilit=
y:
> > > > > +data using the `bmfdec <https://github.com/pali/bmfdec>`_ utilit=
y. This older
> > > > > +example lists ``Max(40)`` for GetDataByPackage; newer firmware u=
ses 100 bytes.
> > > >=20
> > > > ??? Could you move the sentence to the right place?
> > > >=20
> > > > > =20
> > > > >  ::
> > > > > =20
> > > > > diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/pl=
atform/x86/lenovo/wmi-other.c
> > > > > index bd64e7b44669db684145298ae088dd2c7f539d29..827b4215c612fbfc0=
52bbadff0672e68e65517f0 100644
> > > > > --- a/drivers/platform/x86/lenovo/wmi-other.c
> > > > > +++ b/drivers/platform/x86/lenovo/wmi-other.c
> > > > > @@ -27,13 +27,16 @@
> > > > >   */
> > > > > =20
> > > > >  #include <linux/acpi.h>
> > > > > +#include <linux/atomic.h>
> > > > >  #include <linux/bitfield.h>
> > > > >  #include <linux/cleanup.h>
> > > > >  #include <linux/component.h>
> > > > >  #include <linux/container_of.h>
> > > > > +#include <linux/debugfs.h>
> > > > >  #include <linux/device.h>
> > > > >  #include <linux/export.h>
> > > > >  #include <linux/firmware_attributes.h>
> > > > > +#include <linux/fs.h>
> > > > >  #include <linux/gfp_types.h>
> > > > >  #include <linux/hwmon.h>
> > > > >  #include <linux/idr.h>
> > > > > @@ -41,9 +44,12 @@
> > > > >  #include <linux/kobject.h>
> > > > >  #include <linux/limits.h>
> > > > >  #include <linux/module.h>
> > > > > +#include <linux/mutex.h>
> > > > >  #include <linux/platform_profile.h>
> > > > >  #include <linux/power_supply.h>
> > > > > +#include <linux/slab.h>
> > > > >  #include <linux/types.h>
> > > > > +#include <linux/uaccess.h>
> > > > >  #include <linux/wmi.h>
> > > > > =20
> > > > >  #include <acpi/battery.h>
> > > > > @@ -90,6 +96,8 @@ enum lwmi_feature_id_psu {
> > > > > =20
> > > > >  #define LWMI_FEATURE_VALUE_GET 17
> > > > >  #define LWMI_FEATURE_VALUE_SET 18
> > > > > +#define LWMI_DATA_PACKAGE_GET 99
> > > > > +#define LWMI_DATA_PACKAGE_INPUT_MAX 100
> > > > > =20
> > > > >  #define LWMI_FAN_ID_BASE 1
> > > > >  #define LWMI_FAN_NR 4
> > > > > @@ -141,6 +149,8 @@ struct lwmi_om_priv {
> > > > >  =09struct device *fw_attr_dev;
> > > > >  =09struct kset *fw_attr_kset;
> > > > >  =09struct wmi_device *wdev;
> > > > > +=09struct dentry *debugfs_dir;
> > > > > +=09atomic_t package_opened;
> > > > >  =09int ida_id;
> > > > > =20
> > > > >  =09struct lwmi_fan_info fan_info[LWMI_FAN_NR];
> > > > > @@ -156,6 +166,23 @@ struct lwmi_om_priv {
> > > > >  =09bool bh_registered;
> > > > >  };
> > > > > =20
> > > > > +struct lwmi_package_response {
> > > > > +=09__le32 data_size;
> > > > > +=09u8 data[];
> > > > > +};
> > > >=20
> > > > Even though there is no gap between data_size and data, please add =
a
> > > > __packed annotation to clearly indicate your intent.
> > > >=20
> > > > > +
> > > > > +struct lwmi_package_file {
> > > > > +=09struct lwmi_om_priv *priv;
> > > > > +=09/* Protects the pending response on shared descriptors. */
> > > > > +=09struct mutex lock;
> > > > > +=09struct lwmi_package_response *response;
> > > > > +=09size_t response_len;
> > > > > +};
> > > > > +
> > > > > +static bool enable_get_data_by_package;
> > > > > +module_param(enable_get_data_by_package, bool, 0400);
> > > > > +MODULE_PARM_DESC(enable_get_data_by_package, "Enable the GetData=
ByPackage debugfs interface");
> > > > > +
> > > > >  /*
> > > > >   * Visibility of fan channels:
> > > > >   *
> > > > > @@ -1611,6 +1638,174 @@ static void lwmi_om_fw_attr_remove(struct=
 lwmi_om_priv *priv)
> > > > > =20
> > > > >  /* =3D=3D=3D=3D=3D=3D=3D=3D Self (master: lenovo-wmi-other) =3D=
=3D=3D=3D=3D=3D=3D=3D */
> > > > > =20
> > > > > +static int lwmi_package_open(struct inode *inode, struct file *f=
ile)
> > > > > +{
> > > > > +=09struct lwmi_om_priv *priv =3D inode->i_private;
> > > > > +=09struct lwmi_package_file *state __free(kfree) =3D NULL;
> > > >=20
> > > > The declarations of __free() pointers should be placed at where it'=
s
> > > > allocated, i.e., ...
> > > >=20
> > > > > +
> > > > > +=09if ((file->f_mode & (FMODE_READ | FMODE_WRITE)) !=3D (FMODE_R=
EAD | FMODE_WRITE))
> > > > > +=09=09return -EINVAL;
> > > > > +
> > > > > +=09state =3D kzalloc_obj(*state);
> > > >=20
> > > > ...here.
> > > >=20
> > > > Meanwhile,=C2=A0opening the file while priv->package_opened =3D=3D =
1 allocates
> > > > memory in vain. Could you move it below the package_opened check? I=
n this
> > > > manner you don't need the __free() either.
> > > >=20
> > > > > +=09if (!state)
> > > > > +=09=09return -ENOMEM;
> > > > > +
> > > > > +=09if (atomic_cmpxchg(&priv->package_opened, 0, 1))
> > > >=20
> > > > atomic_cmpxchg_acquire()
> > > >=20
> > > > > +=09=09return -EBUSY;
> > > > > +
> > > > > +=09mutex_init(&state->lock);
> > > > > +=09state->priv =3D priv;
> > > > > +=09file->private_data =3D no_free_ptr(state);
> > > > > +
> > > > > +=09return stream_open(inode, file);
> > > > > +}
> > > > > +
> > > > > +static int lwmi_package_release(struct inode *inode, struct file=
 *file)
> > > > > +{
> > > > > +=09struct lwmi_package_file *state =3D file->private_data;
> > > > > +=09struct dentry *dentry =3D file->f_path.dentry;
> > > > > +
> > > > > +=09kfree_sensitive(state->response);
> > > >=20
> > > > You didn't explain what data it is in your replies. "Can contain
> > > > sensitive data" is not an acceptable explanation.
> > > >=20
> > > > Please grep the occurrence of kfree_sensitive() in the kernel tree,=
 and
> > > > you'll find that they are mostly credentials. Does the data passed =
by the
> > > > interface fall into the same category?=20
> > > >=20
> > > > TBH, anything goes through WMI is *never* secret. If a manufacturer=
 ever
> > > > decided to use it to deliver "sensitive" data, it either misunderst=
ood
> > > > the word or chose the wrong interface.
> > > >=20
> > > > An ACPI-WMI method goes through the ACPICA, then the WMI core, and
> > > > finally here. The former two's temporary buffers are either on stac=
k or
> > > > freed by the vanilla kfree(). If leaking "sensitive" response were =
really
> > > > a concern, it must had been leaked before it reached your code.
> > > >=20
> > > > Please don't use kfree_sensitive() unless you really understand the=
 data
> > > > flow path and have a strong reason to use it. If you insist on it, =
please
> > > > answer both questions.
> > > >=20
> > > > > +=09mutex_destroy(&state->lock);
> > > > > +
> > > > > +=09/* Unlike read and write, release can run after debugfs remov=
al. */
> > > >=20
> > > > The comment is not helpful, as it's just repeating well-known knowl=
edge.
> > > > Please explain what it protects:
> > > >=20
> > > >    The release() callback may be called after state->priv has been =
freed.
> > > >    Only when the debugfs file hasn't been removed is the pointer va=
lid.
> > > >=20
> > > > > +=09if (!debugfs_file_get(dentry)) {
> > > > > +=09=09atomic_set(&state->priv->package_opened, 0);
> > > >=20
> > > > atomic_set_release()
> > > >=20
> > > > > +=09=09debugfs_file_put(dentry);
> > > > > +=09}
> > > > > +
> > > > > +=09kfree(state);
> > > > > +=09return 0;
> > > > > +}
> > > > > +
> > > > > +static int lwmi_package_invoke(struct lwmi_package_file *state, =
u8 *data)
> > > > > +{
> > > > > +=09struct lwmi_om_priv *priv =3D state->priv;
> > > > > +=09struct wmi_buffer input =3D { .length =3D LWMI_DATA_PACKAGE_I=
NPUT_MAX, .data =3D data };
> > > > > +=09struct wmi_buffer output;
> > > > > +=09u32 data_size;
> > > > > +=09int ret;
> > > > > +
> > > > > +=09lockdep_assert_held(&state->lock);
> > > > > +
> > > > > +=09/* The tested firmware needs two calls before its response is=
 usable. */
> > > > > +=09ret =3D wmidev_invoke_method(priv->wdev, 0, LWMI_DATA_PACKAGE=
_GET,
> > > > > +=09=09=09=09   &input, &output, 0);
> > > > > +=09if (ret)
> > > > > +=09=09return ret;
> > >=20
> > > If you don't care about the first call's response, use
> > > wmidev_invoke_procedure().
> > >=20
> > > Thanks,
> > > Rong
> > >=20
> > > > > +
> > > > > +=09kfree_sensitive(output.data);
> > > > > +
> > > > > +=09ret =3D wmidev_invoke_method(priv->wdev, 0, LWMI_DATA_PACKAGE=
_GET,
> > > > > +=09=09=09=09   &input, &output, sizeof(struct lwmi_package_respo=
nse));
> > > > > +=09if (ret)
> > > > > +=09=09return ret;
> > > > > +
> > > > > +=09struct lwmi_package_response *response __free(kfree_sensitive=
) =3D output.data;
> > > > > +
> > > > > +=09data_size =3D le32_to_cpu(response->data_size);
> > > > > +=09if (data_size > output.length - sizeof(*response))
> > > >=20
> > > > Why not use struct_size() here? Considering that...
> > > >=20
> > > > > +=09=09return -EPROTO;
> > > > > +
> > > > > +=09state->response_len =3D struct_size(response, data, data_size=
);
> > > >=20
> > > > ...you've used it here, you may introduce a on-stack variable to
> > > > temporarily store the calculated size and use it here and there.
> > > >=20
> > > > > +=09state->response =3D no_free_ptr(response);
> > > > > +=09return 0;
> > > > > +}
> > > > > +
> > > > > +static ssize_t lwmi_package_write(struct file *file, const char =
__user *buffer,
> > > > > +=09=09=09=09  size_t count, loff_t *ppos)
> > > > > +{
> > > > > +=09struct lwmi_package_file *state =3D file->private_data;
> > > > > +=09u8 input[LWMI_DATA_PACKAGE_INPUT_MAX] =3D {};
> > > > > +=09int ret;
> > > > > +
> > > > > +=09if (!count || count > sizeof(input))
> > > > > +=09=09return -EINVAL;
> > > > > +
> > > > > +=09ACQUIRE(mutex_try, state_guard)(&state->lock);
> > > > > +=09if (ACQUIRE_ERR(mutex_try, &state_guard) || state->response)
> > > > > +=09=09return -EBUSY;
> > > >=20
> > > > I don't think it's a good idea to share the same errno between the =
two
> > > > cases.
> > > >=20
> > > > While ACQUIRE_ERR(mutex_try, &state_guard) should return -EBUSY, a
> > > > pending state->response should return something like -EALREADY or
> > > > -ENOTEMPTY.
> > > >=20
> > > > > +
> > > > > +=09if (copy_from_user(input, buffer, count))
> > > > > +=09=09return -EFAULT;
> > > > > +
> > > > > +=09ret =3D lwmi_package_invoke(state, input);
> > > > > +=09if (ret)
> > > > > +=09=09return ret;
> > > > > +
> > > > > +=09return count;
> > > > > +}
> > > > > +
> > > > > +static ssize_t lwmi_package_read(struct file *file, char __user =
*buffer,
> > > > > +=09=09=09=09 size_t count, loff_t *ppos)
> > > > > +{
> > > > > +=09struct lwmi_package_file *state =3D file->private_data;
> > > > > +=09size_t len;
> > > > > +
> > > > > +=09if (!count)
> > > > > +=09=09return 0;
> > > > > +
> > > > > +=09ACQUIRE(mutex_try, state_guard)(&state->lock);
> > > > > +=09if (ACQUIRE_ERR(mutex_try, &state_guard))
> > > > > +=09=09return -EBUSY;
> > > > > +
> > > > > +=09if (!state->response)
> > > > > +=09=09return 0;
> > > >=20
> > > > Reading the file without writing to it in prior is a mistake, isn't=
 it?
> > > > Thus:
> > > >=20
> > > > =09=09return -ENODATA;
> > > >=20
> > > > > +
> > > > > +=09len =3D state->response_len;
> > > > > +=09if (len > count)
> > > > > +=09=09return -ENOSPC;
> > > >=20
> > > > Returning -ENOSPC is confusing as there is nothing to allocate duri=
ng
> > > > read. How about -ENOBUFS?
> > > >=20
> > > > > +
> > > > > +=09if (copy_to_user(buffer, state->response, len))
> > > > > +=09=09return -EFAULT;
> > > > > +
> > > > > +=09kfree_sensitive(state->response);
> > > > > +=09state->response =3D NULL;
> > > > > +=09return len;
> > > > > +}
> > > > > +
> > > > > +static const struct file_operations lwmi_package_fops =3D {
> > > > > +=09.owner =3D THIS_MODULE,
> > > > > +=09.open =3D lwmi_package_open,
> > > > > +=09.release =3D lwmi_package_release,
> > > > > +=09.read =3D lwmi_package_read,
> > > > > +=09.write =3D lwmi_package_write,
> > > > > +};
> > > > > +
> > > > > +static void lwmi_package_debugfs_remove(void *data)
> > > > > +{
> > > > > +=09debugfs_remove_recursive(data);
> > > > > +}
> > > > > +
> > > > > +static int devm_lwmi_package_debugfs_add(struct lwmi_om_priv *pr=
iv)
> > > > > +{
> > > > > +=09struct device *dev =3D &priv->wdev->dev;
> > > > > +=09struct dentry *dir, *entry;
> > > > > +=09int ret;
> > > > > +
> > > > > +=09if (!wmidev_instance_count(priv->wdev))
> > > > > +=09=09return 0;
> >=20
> > Is the bail-out reachable? See commit cbf54f37600e ("platform/x86: wmi:
> > Skip blocks with zero instances").
> >=20
> > > > > +
> > > > > +=09dir =3D lwmi_debugfs_create_dir(priv->wdev);
> > > > > +=09if (IS_ERR(dir))
> > > > > +=09=09return PTR_ERR(dir);
> >=20
> > IIRC, usually any error returned by debugfs methods can (and should) be
> > blindly (yeah!) ignored by passing the returned pointer to the next
> > debugfs method regardless.
> >=20
> > See the kdoc of debugfs_create_dir() and debugfs_create_file().
> >=20
> > > > > +
> > > > > +=09atomic_set(&priv->package_opened, 0);
> > > >=20
> > > > Why would you need this? The struct is kzalloc()-allocated.
> > > >=20
> > > > > +
> > > > > +=09ret =3D devm_add_action_or_reset(dev, lwmi_package_debugfs_re=
move, dir);
> > > > > +=09if (ret)
> > > > > +=09=09return ret;
> >=20
> > Technically, by postponing devm_add_action_or_reset() after
> > debugfs_create_file(), we can blindly ignore the former's error, too.
> > Several drivers have already been doing so.
> >=20
> > That being said, if doing so seems weird, it's also acceptable to store=
 a
> > pointer in priv and manage it manually instead of using devres.
> >=20
> > > > > +
> > > > > +=09entry =3D debugfs_create_file("get_data_by_package", 0600, di=
r, priv, &lwmi_package_fops);
> > > > > +=09if (IS_ERR(entry)) {
> > > > > +=09=09devm_release_action(dev, lwmi_package_debugfs_remove, dir)=
;
> > > > > +=09=09return PTR_ERR(entry);
> >=20
> > This error should also be ignored.
> >=20
> > > > > +=09}
> > > > > +
> > > > > +=09priv->debugfs_dir =3D dir;
> > > >=20
> > > > Why would you need this? The dir is devm-managed.
> > > >=20
> > > > > +=09return 0;
> > > > > +}
> > > > > +
> > > > >  /**
> > > > >   * lwmi_om_master_bind() - Bind all components of the other mode=
 driver
> > > > >   * @dev: The lenovo-wmi-other driver basic device.
> > > > > @@ -1693,6 +1888,7 @@ static int lwmi_other_probe(struct wmi_devi=
ce *wdev, const void *context)
> > > > >  {
> > > > >  =09struct component_match *master_match =3D NULL;
> > > > >  =09struct lwmi_om_priv *priv;
> > > > > +=09int ret;
> > > > > =20
> > > > >  =09priv =3D devm_kzalloc_obj(&wdev->dev, *priv);
> > > > >  =09if (!priv)
> > > > > @@ -1708,12 +1904,24 @@ static int lwmi_other_probe(struct wmi_de=
vice *wdev, const void *context)
> > > > >  =09if (IS_ERR(master_match))
> > > > >  =09=09return PTR_ERR(master_match);
> > > > > =20
> > > > > +=09if (enable_get_data_by_package) {
> >=20
> > It'd be better to move the check inside the helper function.
> >=20
> > > > > +=09=09ret =3D devm_lwmi_package_debugfs_add(priv);
> > > > > +=09=09if (ret)
> > > > > +=09=09=09dev_warn(&wdev->dev, "failed to create GetDataByPackage=
 debugfs files: %d\n",
> > > >=20
> > > > The file is named get_data_by_package.
> > > >=20
> > > > > +=09=09=09=09 ret);
> >=20
> > With error paths removed, the dev_warn() is no longer needed.
> >=20
> > Thanks,
> > Rong
> >=20
> > > > > +=09}
> > > > > +
> > > > >  =09return component_master_add_with_match(&wdev->dev, &lwmi_om_m=
aster_ops,
> > > > >  =09=09=09=09=09       master_match);
> > > > >  }
> > > > > =20
> > > > >  static void lwmi_other_remove(struct wmi_device *wdev)
> > > > >  {
> > > > > +=09struct lwmi_om_priv *priv =3D dev_get_drvdata(&wdev->dev);
> > > > > +
> > > > > +=09if (priv->debugfs_dir)
> > > > > +=09=09devm_release_action(&wdev->dev, lwmi_package_debugfs_remov=
e, priv->debugfs_dir);
> > > >=20
> > > > Why would you need this? The interface does not depend on the compo=
nents.
> > > >=20
> > > > Thanks,
> > > > Rong
> > > >=20
> > > > > +
> > > > >  =09component_master_del(&wdev->dev, &lwmi_om_master_ops);
> > > > >  }
> > > > > =20
> Thanks a lot for the detailed suggestions. I need some more time to go
> through them carefully and respond.
>=20
> There is one important issue I'd like to discuss first: the userspace
> interface.
>=20
> V1 used a character device, and V2 switched to debugfs. However, we have
> since realized that debugfs is not suitable for our use case. We have a
> production userspace application that needs read/write access to this
> WMI interface, while access to debugfs is restricted when Secure Boot is
> enabled.

Well, that's a legit reason of using another interface instead of
debugfs.

OTOH, restricting access to sensitive data is the intentional behavior of
kernel lockdown mode. That is, if accessing the data in kernel lockdown
mode is acceptable, it must be non-sensitive.

>=20
> So we need to reconsider the interface. Would exposing it through sysfs
> be acceptable, for example as a binary attribute under
> /sys/bus/wmi/devices/DC2A8805-.../, similar to
> drivers/platform/x86/dell/dcdbas.c?
>=20
> What do you think?

ACK.

I originally suggested debugfs because you seemed to prefer a fine-
grained protocol, but sysfs is also OK as long as the protocol can be
simplified. IMO it's fine, as the original protocol seemed overdesigned.

Simplifying the protocol should may the patch easier to review, too.

Note that introducing a sysfs attribute usually needs a stronger reason
than introducing a debugfs one, so it's now more suggested to describe
the purpose of the "production userspace application".

Thanks,
Rong
