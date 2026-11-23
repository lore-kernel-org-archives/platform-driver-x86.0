Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795448689;
	b=Zm2I9eGv6qyQuS24UGXkptV97h+ooCDustf33/IvYGqeDUahN40WmtmauuHvJtsXBMRm
	 /K0kzKSkS7BJLBFh+kAACYh5ZRzeiFS14WJhkdGry5NILVUeIilWAEh0fI/g1HHepAzIn
	 axvVEBleYoMv/sPNfi8C/psx64svIIJ1rl9MzBt1RwhRb583Zyi7vRUtlM8ylAsEXm4Bg
	 UjwaYC18a8BR8ZjOOvpL9smZFfSU/71fYxmzOucZILHO4Ium2nQZh1vo3G8gaMtpivE4B
	 fG5g500O/PX+kENTB9hrXXB/62I8iqBMSddZHtNwnyucC9CCKYiCGjWHstLj62gqTJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448689;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=9bx7AmN4D5CPnoyA1ARgCa7I6Wc1e4dw5Qji5fzus58=;
	b=UiMaE0Dm/LRVMJ+n8TcgJFJ4bQ2znQiaWjNrAnlK5gvD0as+vADP0Ri6x3ciAB7OVRjX
	 lNVn/2+0yPczNU8LpWcEI1pch7PNulfwpFmbQ1Uinkr0He9E/LbC77/Tc4UZKUoEUFLeC
	 smiLvk9STqt8JsrYLvgOzazLg6XOAPY9fLNqIT+3aJge2UWbGA0WlbHqljO1xZKGlbnOU
	 3lgTLN+8dd/po4blAx3XGa7ucl3gt7gWwW6xfyTd56h4XjRJ1+4qxUFn0mnfvSRDVfc0o
	 IrxcX3weCOhT7Y/JiFg9u+2K8Mv6i+sL/PcPc9hns6JWd+QtcFwZBRQBS3myRi2j3/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=F0kD9jHT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.15
Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7063F606A31A;
	Mon, 23 Nov 2026 15:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7063F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=F0kD9jHT
ARC-Seal: i=1; a=rsa-sha256; t=1795448559; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=D//5VDo48JFhX2lpMt/nEjcFRd0ruwamqA/JdIzAblCaL+ha1pbtDodhpX3Iy90Twl3PW0k0lCHwZ6yNrzWvizEV7osA59PITzr0tCYyEwrx5HwLWUdY4UCp2aPplloxwyXFFQth4GtmSFYa2tFfPyGJqNQUkc76jJ7oWuwl0hc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795448559; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9bx7AmN4D5CPnoyA1ARgCa7I6Wc1e4dw5Qji5fzus58=; 
	b=BQaS9Slo19IDBNnULGxBUXugIEI2fDG8GlS0olvV5+3xo/ZlK8Bz8Bpwn5Y8EQJnTHiL/BTHPDHo4cBhI1uHpscWm28Kgzd6sVM0p1U91S0/bbNN8Wq9XJzJTrxdhOJRIOZfJS0RUCbtguXlApTR3EQkPSnX11JwF5EMCz+jiMI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=F0kD9jHTeTqy7kGnRpYKkcYvsfnsoccLPz9agStNznZwJCTj6Pnov0QLclRYdL7PGO7dezL227z5e+jKOPiZhoae6+fTVC1Lr1a6eUKDRRu7g2i/im0nuP672mqEwL97/uL6V+QY699WSEgUZE7s2j0aRaXaeYWagw+HgG7zYiJ9kBLfamxRM7kedq0Jdfxn820veuOH8yPYDb1xQ/leMHQjr10lMWvjhL9R1xv9KEMDn2o8OyvLH6GEabaRwZug8PfO2uN7nS0l+8N8paXGQIA1hKIcJLwl0A9VoaQ+cCLibhBADrlk4GNJUzAfbo1tBn/YCsHiW+rlx1Pm1ywUuw==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=9bx7AmN4D5CPnoyA1ARgCa7I6Wc1e4dw5Qji5fzus58=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795448555388493.31707467120486;
	Mon, 23 Nov 2026 07:42:35 -0800 (PST)
Message-ID: <7442b878b63d67c44af0bdb379a9de04dae76669.camel@rong.moe>
Subject: Re: [PATCH v2] platform/x86: lenovo-wmi-other: Add raw
 GetDataByPackage interface
From: Rong Zhang <i@rong.moe>
To: Alan Pluto <alanpluto@163.com>, platform-driver-x86@vger.kernel.org
Cc: mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com, W_Armin@gmx.de, 
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 hansg@kernel.org, 	ilpo.jarvinen@linux.intel.com,
 linux-doc@vger.kernel.org, 	linux-kernel@vger.kernel.org
In-Reply-To: <5b327bf279357b68b91ec66b465501a2760b23eb.camel@rong.moe>
References: <20261116040532.154928-1-alanpluto@163.com>
			 <20261123061120.18740-1-alanpluto@163.com>
		 <fcabaf8647e0c1ab487cd612d5a290082613ec0b.camel@rong.moe>
	 <5b327bf279357b68b91ec66b465501a2760b23eb.camel@rong.moe>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 23:36:57 +0800
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

On Mon, 2026-11-23 at 20:34 +0800, Rong Zhang wrote:
> Hi Alan,
>=20
> On Mon, 2026-11-23 at 20:21 +0800, Rong Zhang wrote:
> > Hi Alan,
> >=20
> > On Mon, 2026-11-23 at 14:11 +0800, Alan Pluto wrote:
> > > Lenovo's userspace utility uses the Other Mode WMI GetDataByPackage
> >=20
> > What's the purpose of the utility? Could you provide some context? You
> > can ignore this question if it's confidential, but in general providing
> > necessary context can help maintainers and reviewers learn about the
> > intent.
> >=20
> > > method (99) to check device readiness. Expose the method through debu=
gfs
> > > so the firmware request and response can be inspected on Linux withou=
t
> > > adding a stable userspace ABI.
> > >=20
> > > The interface is disabled by default and can be enabled by passing
> > > enable_get_data_by_package=3D1 when loading the module.
> > >=20
> > > Signed-off-by: Alan Pluto <alanpluto@163.com>
> > > ---
> > > Changes in v2:
> > > - Replace the character device with a debugfs file, disabled by defau=
lt.
> > > - Allow one open per WMI device and require a single read for the res=
ponse.
> > > - Use scoped locks, lockdep checks, automatic buffer cleanup, and the
> > >   WMI helper's minimum response size check.
> > >=20
> > >  Documentation/wmi/devices/lenovo-wmi-other.rst |  12 +-
> > >  drivers/platform/x86/lenovo/wmi-other.c        | 208 +++++++++++++++=
++++++++++
> > >  2 files changed, 219 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documen=
tation/wmi/devices/lenovo-wmi-other.rst
> > > index 011054d64eac5b601333373c4d405f9c5117ffc2..42e1525a8852bd7c8ddc0=
4cc4047b1f09c5b770f 100644
> > > --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> > > +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> > > @@ -33,6 +33,15 @@ under the following path:
> > > =20
> > >  Additionally, this driver also exports attributes to HWMON.
> > > =20
> > > +GetDataByPackage diagnostics
> > > +~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >=20
> > Missing a ~
> >=20
> > > +
> > > +The driver does not create the diagnostic file by default. To enable=
 it,
> > > +pass ``enable_get_data_by_package=3D1`` when loading ``lenovo-wmi-ot=
her``.
> > > +The file is at ``lenovo_wmi/<WMI device>/get_data_by_package``.
> > > +Not all devices support the method. Use only commands whose behavior=
 and
> > > +side effects are understood.
> > > +
> > >  LENOVO_CAPABILITY_DATA_00
> > >  -------------------------
> > > =20
> > > @@ -107,7 +116,8 @@ WMI interface description
> > >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > > =20
> > >  The WMI interface description can be decoded from the embedded binar=
y MOF (bmof)
> > > -data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
> > > +data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility. T=
his older
> > > +example lists ``Max(40)`` for GetDataByPackage; newer firmware uses =
100 bytes.
> >=20
> > ??? Could you move the sentence to the right place?
> >=20
> > > =20
> > >  ::
> > > =20
> > > diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platfo=
rm/x86/lenovo/wmi-other.c
> > > index bd64e7b44669db684145298ae088dd2c7f539d29..827b4215c612fbfc052bb=
adff0672e68e65517f0 100644
> > > --- a/drivers/platform/x86/lenovo/wmi-other.c
> > > +++ b/drivers/platform/x86/lenovo/wmi-other.c
> > > @@ -27,13 +27,16 @@
> > >   */
> > > =20
> > >  #include <linux/acpi.h>
> > > +#include <linux/atomic.h>
> > >  #include <linux/bitfield.h>
> > >  #include <linux/cleanup.h>
> > >  #include <linux/component.h>
> > >  #include <linux/container_of.h>
> > > +#include <linux/debugfs.h>
> > >  #include <linux/device.h>
> > >  #include <linux/export.h>
> > >  #include <linux/firmware_attributes.h>
> > > +#include <linux/fs.h>
> > >  #include <linux/gfp_types.h>
> > >  #include <linux/hwmon.h>
> > >  #include <linux/idr.h>
> > > @@ -41,9 +44,12 @@
> > >  #include <linux/kobject.h>
> > >  #include <linux/limits.h>
> > >  #include <linux/module.h>
> > > +#include <linux/mutex.h>
> > >  #include <linux/platform_profile.h>
> > >  #include <linux/power_supply.h>
> > > +#include <linux/slab.h>
> > >  #include <linux/types.h>
> > > +#include <linux/uaccess.h>
> > >  #include <linux/wmi.h>
> > > =20
> > >  #include <acpi/battery.h>
> > > @@ -90,6 +96,8 @@ enum lwmi_feature_id_psu {
> > > =20
> > >  #define LWMI_FEATURE_VALUE_GET 17
> > >  #define LWMI_FEATURE_VALUE_SET 18
> > > +#define LWMI_DATA_PACKAGE_GET 99
> > > +#define LWMI_DATA_PACKAGE_INPUT_MAX 100
> > > =20
> > >  #define LWMI_FAN_ID_BASE 1
> > >  #define LWMI_FAN_NR 4
> > > @@ -141,6 +149,8 @@ struct lwmi_om_priv {
> > >  =09struct device *fw_attr_dev;
> > >  =09struct kset *fw_attr_kset;
> > >  =09struct wmi_device *wdev;
> > > +=09struct dentry *debugfs_dir;
> > > +=09atomic_t package_opened;
> > >  =09int ida_id;
> > > =20
> > >  =09struct lwmi_fan_info fan_info[LWMI_FAN_NR];
> > > @@ -156,6 +166,23 @@ struct lwmi_om_priv {
> > >  =09bool bh_registered;
> > >  };
> > > =20
> > > +struct lwmi_package_response {
> > > +=09__le32 data_size;
> > > +=09u8 data[];
> > > +};
> >=20
> > Even though there is no gap between data_size and data, please add a
> > __packed annotation to clearly indicate your intent.
> >=20
> > > +
> > > +struct lwmi_package_file {
> > > +=09struct lwmi_om_priv *priv;
> > > +=09/* Protects the pending response on shared descriptors. */
> > > +=09struct mutex lock;
> > > +=09struct lwmi_package_response *response;
> > > +=09size_t response_len;
> > > +};
> > > +
> > > +static bool enable_get_data_by_package;
> > > +module_param(enable_get_data_by_package, bool, 0400);
> > > +MODULE_PARM_DESC(enable_get_data_by_package, "Enable the GetDataByPa=
ckage debugfs interface");
> > > +
> > >  /*
> > >   * Visibility of fan channels:
> > >   *
> > > @@ -1611,6 +1638,174 @@ static void lwmi_om_fw_attr_remove(struct lwm=
i_om_priv *priv)
> > > =20
> > >  /* =3D=3D=3D=3D=3D=3D=3D=3D Self (master: lenovo-wmi-other) =3D=3D=
=3D=3D=3D=3D=3D=3D */
> > > =20
> > > +static int lwmi_package_open(struct inode *inode, struct file *file)
> > > +{
> > > +=09struct lwmi_om_priv *priv =3D inode->i_private;
> > > +=09struct lwmi_package_file *state __free(kfree) =3D NULL;
> >=20
> > The declarations of __free() pointers should be placed at where it's
> > allocated, i.e., ...
> >=20
> > > +
> > > +=09if ((file->f_mode & (FMODE_READ | FMODE_WRITE)) !=3D (FMODE_READ =
| FMODE_WRITE))
> > > +=09=09return -EINVAL;
> > > +
> > > +=09state =3D kzalloc_obj(*state);
> >=20
> > ...here.
> >=20
> > Meanwhile,=C2=A0opening the file while priv->package_opened =3D=3D 1 al=
locates
> > memory in vain. Could you move it below the package_opened check? In th=
is
> > manner you don't need the __free() either.
> >=20
> > > +=09if (!state)
> > > +=09=09return -ENOMEM;
> > > +
> > > +=09if (atomic_cmpxchg(&priv->package_opened, 0, 1))
> >=20
> > atomic_cmpxchg_acquire()
> >=20
> > > +=09=09return -EBUSY;
> > > +
> > > +=09mutex_init(&state->lock);
> > > +=09state->priv =3D priv;
> > > +=09file->private_data =3D no_free_ptr(state);
> > > +
> > > +=09return stream_open(inode, file);
> > > +}
> > > +
> > > +static int lwmi_package_release(struct inode *inode, struct file *fi=
le)
> > > +{
> > > +=09struct lwmi_package_file *state =3D file->private_data;
> > > +=09struct dentry *dentry =3D file->f_path.dentry;
> > > +
> > > +=09kfree_sensitive(state->response);
> >=20
> > You didn't explain what data it is in your replies. "Can contain
> > sensitive data" is not an acceptable explanation.
> >=20
> > Please grep the occurrence of kfree_sensitive() in the kernel tree, and
> > you'll find that they are mostly credentials. Does the data passed by t=
he
> > interface fall into the same category?=20
> >=20
> > TBH, anything goes through WMI is *never* secret. If a manufacturer eve=
r
> > decided to use it to deliver "sensitive" data, it either misunderstood
> > the word or chose the wrong interface.
> >=20
> > An ACPI-WMI method goes through the ACPICA, then the WMI core, and
> > finally here. The former two's temporary buffers are either on stack or
> > freed by the vanilla kfree(). If leaking "sensitive" response were real=
ly
> > a concern, it must had been leaked before it reached your code.
> >=20
> > Please don't use kfree_sensitive() unless you really understand the dat=
a
> > flow path and have a strong reason to use it. If you insist on it, plea=
se
> > answer both questions.
> >=20
> > > +=09mutex_destroy(&state->lock);
> > > +
> > > +=09/* Unlike read and write, release can run after debugfs removal. =
*/
> >=20
> > The comment is not helpful, as it's just repeating well-known knowledge=
.
> > Please explain what it protects:
> >=20
> >    The release() callback may be called after state->priv has been free=
d.
> >    Only when the debugfs file hasn't been removed is the pointer valid.
> >=20
> > > +=09if (!debugfs_file_get(dentry)) {
> > > +=09=09atomic_set(&state->priv->package_opened, 0);
> >=20
> > atomic_set_release()
> >=20
> > > +=09=09debugfs_file_put(dentry);
> > > +=09}
> > > +
> > > +=09kfree(state);
> > > +=09return 0;
> > > +}
> > > +
> > > +static int lwmi_package_invoke(struct lwmi_package_file *state, u8 *=
data)
> > > +{
> > > +=09struct lwmi_om_priv *priv =3D state->priv;
> > > +=09struct wmi_buffer input =3D { .length =3D LWMI_DATA_PACKAGE_INPUT=
_MAX, .data =3D data };
> > > +=09struct wmi_buffer output;
> > > +=09u32 data_size;
> > > +=09int ret;
> > > +
> > > +=09lockdep_assert_held(&state->lock);
> > > +
> > > +=09/* The tested firmware needs two calls before its response is usa=
ble. */
> > > +=09ret =3D wmidev_invoke_method(priv->wdev, 0, LWMI_DATA_PACKAGE_GET=
,
> > > +=09=09=09=09   &input, &output, 0);
> > > +=09if (ret)
> > > +=09=09return ret;
>=20
> If you don't care about the first call's response, use
> wmidev_invoke_procedure().
>=20
> Thanks,
> Rong
>=20
> > > +
> > > +=09kfree_sensitive(output.data);
> > > +
> > > +=09ret =3D wmidev_invoke_method(priv->wdev, 0, LWMI_DATA_PACKAGE_GET=
,
> > > +=09=09=09=09   &input, &output, sizeof(struct lwmi_package_response)=
);
> > > +=09if (ret)
> > > +=09=09return ret;
> > > +
> > > +=09struct lwmi_package_response *response __free(kfree_sensitive) =
=3D output.data;
> > > +
> > > +=09data_size =3D le32_to_cpu(response->data_size);
> > > +=09if (data_size > output.length - sizeof(*response))
> >=20
> > Why not use struct_size() here? Considering that...
> >=20
> > > +=09=09return -EPROTO;
> > > +
> > > +=09state->response_len =3D struct_size(response, data, data_size);
> >=20
> > ...you've used it here, you may introduce a on-stack variable to
> > temporarily store the calculated size and use it here and there.
> >=20
> > > +=09state->response =3D no_free_ptr(response);
> > > +=09return 0;
> > > +}
> > > +
> > > +static ssize_t lwmi_package_write(struct file *file, const char __us=
er *buffer,
> > > +=09=09=09=09  size_t count, loff_t *ppos)
> > > +{
> > > +=09struct lwmi_package_file *state =3D file->private_data;
> > > +=09u8 input[LWMI_DATA_PACKAGE_INPUT_MAX] =3D {};
> > > +=09int ret;
> > > +
> > > +=09if (!count || count > sizeof(input))
> > > +=09=09return -EINVAL;
> > > +
> > > +=09ACQUIRE(mutex_try, state_guard)(&state->lock);
> > > +=09if (ACQUIRE_ERR(mutex_try, &state_guard) || state->response)
> > > +=09=09return -EBUSY;
> >=20
> > I don't think it's a good idea to share the same errno between the two
> > cases.
> >=20
> > While ACQUIRE_ERR(mutex_try, &state_guard) should return -EBUSY, a
> > pending state->response should return something like -EALREADY or
> > -ENOTEMPTY.
> >=20
> > > +
> > > +=09if (copy_from_user(input, buffer, count))
> > > +=09=09return -EFAULT;
> > > +
> > > +=09ret =3D lwmi_package_invoke(state, input);
> > > +=09if (ret)
> > > +=09=09return ret;
> > > +
> > > +=09return count;
> > > +}
> > > +
> > > +static ssize_t lwmi_package_read(struct file *file, char __user *buf=
fer,
> > > +=09=09=09=09 size_t count, loff_t *ppos)
> > > +{
> > > +=09struct lwmi_package_file *state =3D file->private_data;
> > > +=09size_t len;
> > > +
> > > +=09if (!count)
> > > +=09=09return 0;
> > > +
> > > +=09ACQUIRE(mutex_try, state_guard)(&state->lock);
> > > +=09if (ACQUIRE_ERR(mutex_try, &state_guard))
> > > +=09=09return -EBUSY;
> > > +
> > > +=09if (!state->response)
> > > +=09=09return 0;
> >=20
> > Reading the file without writing to it in prior is a mistake, isn't it?
> > Thus:
> >=20
> > =09=09return -ENODATA;
> >=20
> > > +
> > > +=09len =3D state->response_len;
> > > +=09if (len > count)
> > > +=09=09return -ENOSPC;
> >=20
> > Returning -ENOSPC is confusing as there is nothing to allocate during
> > read. How about -ENOBUFS?
> >=20
> > > +
> > > +=09if (copy_to_user(buffer, state->response, len))
> > > +=09=09return -EFAULT;
> > > +
> > > +=09kfree_sensitive(state->response);
> > > +=09state->response =3D NULL;
> > > +=09return len;
> > > +}
> > > +
> > > +static const struct file_operations lwmi_package_fops =3D {
> > > +=09.owner =3D THIS_MODULE,
> > > +=09.open =3D lwmi_package_open,
> > > +=09.release =3D lwmi_package_release,
> > > +=09.read =3D lwmi_package_read,
> > > +=09.write =3D lwmi_package_write,
> > > +};
> > > +
> > > +static void lwmi_package_debugfs_remove(void *data)
> > > +{
> > > +=09debugfs_remove_recursive(data);
> > > +}
> > > +
> > > +static int devm_lwmi_package_debugfs_add(struct lwmi_om_priv *priv)
> > > +{
> > > +=09struct device *dev =3D &priv->wdev->dev;
> > > +=09struct dentry *dir, *entry;
> > > +=09int ret;
> > > +
> > > +=09if (!wmidev_instance_count(priv->wdev))
> > > +=09=09return 0;

Is the bail-out reachable? See commit cbf54f37600e ("platform/x86: wmi:
Skip blocks with zero instances").

> > > +
> > > +=09dir =3D lwmi_debugfs_create_dir(priv->wdev);
> > > +=09if (IS_ERR(dir))
> > > +=09=09return PTR_ERR(dir);

IIRC, usually any error returned by debugfs methods can (and should) be
blindly (yeah!) ignored by passing the returned pointer to the next
debugfs method regardless.

See the kdoc of debugfs_create_dir() and debugfs_create_file().

> > > +
> > > +=09atomic_set(&priv->package_opened, 0);
> >=20
> > Why would you need this? The struct is kzalloc()-allocated.
> >=20
> > > +
> > > +=09ret =3D devm_add_action_or_reset(dev, lwmi_package_debugfs_remove=
, dir);
> > > +=09if (ret)
> > > +=09=09return ret;

Technically, by postponing devm_add_action_or_reset() after
debugfs_create_file(), we can blindly ignore the former's error, too.
Several drivers have already been doing so.

That being said, if doing so seems weird, it's also acceptable to store a
pointer in priv and manage it manually instead of using devres.

> > > +
> > > +=09entry =3D debugfs_create_file("get_data_by_package", 0600, dir, p=
riv, &lwmi_package_fops);
> > > +=09if (IS_ERR(entry)) {
> > > +=09=09devm_release_action(dev, lwmi_package_debugfs_remove, dir);
> > > +=09=09return PTR_ERR(entry);

This error should also be ignored.

> > > +=09}
> > > +
> > > +=09priv->debugfs_dir =3D dir;
> >=20
> > Why would you need this? The dir is devm-managed.
> >=20
> > > +=09return 0;
> > > +}
> > > +
> > >  /**
> > >   * lwmi_om_master_bind() - Bind all components of the other mode dri=
ver
> > >   * @dev: The lenovo-wmi-other driver basic device.
> > > @@ -1693,6 +1888,7 @@ static int lwmi_other_probe(struct wmi_device *=
wdev, const void *context)
> > >  {
> > >  =09struct component_match *master_match =3D NULL;
> > >  =09struct lwmi_om_priv *priv;
> > > +=09int ret;
> > > =20
> > >  =09priv =3D devm_kzalloc_obj(&wdev->dev, *priv);
> > >  =09if (!priv)
> > > @@ -1708,12 +1904,24 @@ static int lwmi_other_probe(struct wmi_device=
 *wdev, const void *context)
> > >  =09if (IS_ERR(master_match))
> > >  =09=09return PTR_ERR(master_match);
> > > =20
> > > +=09if (enable_get_data_by_package) {

It'd be better to move the check inside the helper function.

> > > +=09=09ret =3D devm_lwmi_package_debugfs_add(priv);
> > > +=09=09if (ret)
> > > +=09=09=09dev_warn(&wdev->dev, "failed to create GetDataByPackage deb=
ugfs files: %d\n",
> >=20
> > The file is named get_data_by_package.
> >=20
> > > +=09=09=09=09 ret);

With error paths removed, the dev_warn() is no longer needed.

Thanks,
Rong

> > > +=09}
> > > +
> > >  =09return component_master_add_with_match(&wdev->dev, &lwmi_om_maste=
r_ops,
> > >  =09=09=09=09=09       master_match);
> > >  }
> > > =20
> > >  static void lwmi_other_remove(struct wmi_device *wdev)
> > >  {
> > > +=09struct lwmi_om_priv *priv =3D dev_get_drvdata(&wdev->dev);
> > > +
> > > +=09if (priv->debugfs_dir)
> > > +=09=09devm_release_action(&wdev->dev, lwmi_package_debugfs_remove, p=
riv->debugfs_dir);
> >=20
> > Why would you need this? The interface does not depend on the component=
s.
> >=20
> > Thanks,
> > Rong
> >=20
> > > +
> > >  =09component_master_del(&wdev->dev, &lwmi_om_master_ops);
> > >  }
> > > =20
