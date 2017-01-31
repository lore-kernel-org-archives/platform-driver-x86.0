From: Ritesh Raj Sarraf <rrs@debian.org>
Subject: Re: [PATCH] Add sysfs interface for touchpad state
Date: Tue, 31 Jan 2017 17:17:45 +0530
Message-ID: <1485863265.11199.3.camel@debian.org>
References: <20170130105749.17338-1-rrs@debian.org>
         <CAHp75VcekiLxkGbHFXbPvTX7SwBHobQFmnx5Y-uFWXZSEN9ujA@mail.gmail.com>
Reply-To: rrs@debian.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-PMzwAABtUIfizfIBcPxK"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:33636 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751042AbdAaLsx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 31 Jan 2017 06:48:53 -0500
Received: by mail-pf0-f195.google.com with SMTP id e4so27414566pfg.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Jan 2017 03:47:50 -0800 (PST)
In-Reply-To: <CAHp75VcekiLxkGbHFXbPvTX7SwBHobQFmnx5Y-uFWXZSEN9ujA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>


--=-PMzwAABtUIfizfIBcPxK
Content-Type: multipart/mixed; boundary="=-+k0X21NBoOxAvATWw0Bi"


--=-+k0X21NBoOxAvATWw0Bi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Andy,

On Mon, 2017-01-30 at 22:25 +0200, Andy Shevchenko wrote:
> On Mon, Jan 30, 2017 at 12:57 PM, Ritesh Raj Sarraf <rrs@debian.org> wrot=
e:
> > Lenovo Yoga (many variants: Yoga, Yoga2 Pro, Yoga2 13, Yoga3 Pro, Yoga =
3
> > 14 etc) has multiple modles that are a hybrid laptop, working in laptop
> > mode as well as tablet mode.
>=20
> The main question is who is the initiator of the mode change? Do you
> need to do anything in UI to prepare OS for such switch?
>=20

The human user is the only initiator. The hardware has 360 degree rotation.
There is nothing special needed in the UI, or the OS, to get into tablet mo=
de.
Just flip the hardware 360 degree into tablet mode.

More details on the hardware series can be found at:
http://shop.lenovo.com/us/en/laptops/lenovo/yoga-laptop-series/yoga-laptop-=
2-13/


> > There is no interface available to query the physical state of these
> > devices. Also, from the driver, it doesn't look to be having an EC
> > command to get that information from the acpi driver.
> >=20
> > When in tablet mode, the hardware keyboard and touchpad get disabled.
> > This could be one sub-optimal way to assume that under such condition
> > (touchpad disabled) the machine is in Tablet-Mode. Other than this, I'v=
e
> > not come across another way to determine the physical state of the
> > hardware.
> >=20
> > Currently, some of the hardware status is provided through debugfs,
> > which is useless for unprivileged processes. (This already has many
> > broken reports: radio and wifi, which are active/on as I write this)
>=20
> This should be fixed.
>=20

Thanks.

> > This patch adds a sysfs interface for unprivileged process access under=
:
> > /sys/bus/platform/devices/VPC2004\:00/touchpad_state
> >=20
> > rrs@learner:/sys/bus/platform/devices/VPC2004:00$ cat touchpad_state
> > 1
> > 2017-01-30 / 16:12:00 =E2=99=92=E2=99=92=E2=99=92=C2=A0=C2=A0=E2=98=BA
> > rrs@learner:/sys/bus/platform/devices/VPC2004:00$ cat touchpad_state
> > 0
> > 2017-01-30 / 16:12:06 =E2=99=92=E2=99=92=E2=99=92=C2=A0=C2=A0=E2=98=BA
>=20
> You introduce an ABI without documenting it.
>=20

Sorry about that. I am no kernel developer, just wanting to fix my hardware=
.

I looked into the doc. The documentation mentions the sysfs path:
'/sys/devices/platform/ideapad/fan_mode', which is what we would also want =
to
use.

But the driver only shows the interface through:
'/sys/devices/platform/devices/VPC2004:00/'

Is this an expected behavior ?

> >=20
> >=20
> > +
> > +static ssize_t show_touchpad_state(struct device *dev,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct device_attribute *attr,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0char *buf)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned long result;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct ideapad_private *priv=
 =3D dev_get_drvdata(dev);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (read_ec_data(priv->adev-=
>handle, VPCCMD_R_TOUCHPAD, &result))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return sprintf(buf, "-1\n");
>=20
> That is bad. Return the error code what read_ec_data() returns. If it
> is not suitable convert it here.
>=20

All that read_ec_data() can return are 0 and -1.

The other 2 consumers, show_ideapad_cam() and show_ideapad_fan() are doing =
the
same.=20

> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return sprintf(buf, "%lu\n",=
 result);
> > +}
> > +
> > +static ssize_t store_touchpad_state(struct device *dev,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct device_attribute *at=
tr,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const char *buf, size_t cou=
nt)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Don't enable writin=
g here */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -1;
>=20
> And why you can't just drop this completely?
>=20

I did that. But it was failing to build. But anyways, please see my revised
patch along with write support.

> > +}
> > +
> > +static DEVICE_ATTR(touchpad_state, 0644, show_touchpad_state,
> > store_touchpad_state);
> > +
> > =C2=A0static struct attribute *ideapad_attributes[] =3D {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&dev_attr_camera_power.=
attr,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&dev_attr_fan_mode.attr=
,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&dev_attr_touchpad_state.att=
r,
>=20
> Is it really state, btw? Reading your commit message I would assume
> this is also "mode" for touchpad.
>=20

Actually, yes. It'd be better to have it as a mode, along with allowing to
write. That way it will be consistent with the other 2 (cam and fan) interf=
aces.

Please find attached revised patch along with write support and ABI
Documentation changes.

Thanks,
Ritesh

--=20
Ritesh Raj Sarraf | http://people.debian.org/~rrs
Debian - The Universal Operating System
--=-+k0X21NBoOxAvATWw0Bi
Content-Disposition: attachment; filename="0001-Add-sysfs-interface-for-touchpad-state.patch"
Content-Type: text/x-patch; name="0001-Add-sysfs-interface-for-touchpad-state.patch";
	charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSA4YTM5ODBiYjE1ZTMxYTVjMTdlNzU0MWJjNjBjYmU0YmM1NmJmNjA0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBSaXRlc2ggUmFqIFNhcnJhZiA8cnJzQGRlYmlhbi5vcmc+CkRh
dGU6IE1vbiwgMzAgSmFuIDIwMTcgMTU6MDU6NDggKzA1MzAKU3ViamVjdDogW1BBVENIXSBBZGQg
c3lzZnMgaW50ZXJmYWNlIGZvciB0b3VjaHBhZCBzdGF0ZQpNSU1FLVZlcnNpb246IDEuMApDb250
ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKQ29udGVudC1UcmFuc2Zlci1FbmNv
ZGluZzogOGJpdAoKTGVub3ZvIFlvZ2EgKG1hbnkgdmFyaWFudHM6IFlvZ2EsIFlvZ2EyIFBybywg
WW9nYTIgMTMsIFlvZ2EzIFBybywgWW9nYSAzCjE0IGV0YykgaGFzIG11bHRpcGxlIG1vZGxlcyB0
aGF0IGFyZSBhIGh5YnJpZCBsYXB0b3AsIHdvcmtpbmcgaW4gbGFwdG9wCm1vZGUgYXMgd2VsbCBh
cyB0YWJsZXQgbW9kZS4KClRoaXMgcGF0Y2ggYWRkcyBhIHN5c2ZzIGludGVyZmFjZSBmb3IgcmVh
ZC93cml0ZSBhY2Nlc3MgdW5kZXI6Ci9zeXMvYnVzL3BsYXRmb3JtL2RldmljZXMvVlBDMjAwNFw6
MDAvdG91Y2hwYWRfbW9kZQoKcnJzQGxlYXJuZXI6fiQgY2F0IC9zeXMvYnVzL3BsYXRmb3JtL2Rl
dmljZXMvVlBDMjAwNFw6MDAvdG91Y2hwYWRfbW9kZQoxCjIwMTctMDEtMzEgLyAxNjo1ODo0NiDi
mZLimZLimZIgIOKYugpycnNAbGVhcm5lcjp+JCBzdQpQYXNzd29yZDoKcm9vdEBsZWFybmVyOi9o
b21lL3JycyMgZWNobyAwID4gL3N5cy9idXMvcGxhdGZvcm0vZGV2aWNlcy9WUEMyMDA0XDowMC90
b3VjaHBhZF9tb2RlCnJvb3RAbGVhcm5lcjovaG9tZS9ycnMjIGNhdCAgL3N5cy9idXMvcGxhdGZv
cm0vZGV2aWNlcy9WUEMyMDA0XDowMC90b3VjaHBhZF9tb2RlCjAKcm9vdEBsZWFybmVyOi9ob21l
L3JycyMgZWNobyAxID4gL3N5cy9idXMvcGxhdGZvcm0vZGV2aWNlcy9WUEMyMDA0XDowMC90b3Vj
aHBhZF9tb2RlCnJvb3RAbGVhcm5lcjovaG9tZS9ycnMjIGNhdCAgL3N5cy9idXMvcGxhdGZvcm0v
ZGV2aWNlcy9WUEMyMDA0XDowMC90b3VjaHBhZF9tb2RlCjEKcm9vdEBsZWFybmVyOi9ob21lL3Jy
cyMgZXhpdAoyMDE3LTAxLTMxIC8gMTY6NTk6MjYg4pmS4pmS4pmSICDimLoKcnJzQGxlYXJuZXI6
fiQKCkVuYWJsZSB3cml0ZS4gQ2hhbmdlIG5hbWUgdG8gX21vZGUKClVwZGF0ZSBBQkkgZG9jdW1l
bnRhdGlvbiBmb3IgaWRlYXBhZC1sYXB0b3AKClNpZ25lZC1vZmYtYnk6IFJpdGVzaCBSYWogU2Fy
cmFmIDxycnNAZGViaWFuLm9yZz4KLS0tCiAuLi4vQUJJL3Rlc3Rpbmcvc3lzZnMtcGxhdGZvcm0t
aWRlYXBhZC1sYXB0b3AgICAgICB8ICA5ICsrKysrKwogZHJpdmVycy9wbGF0Zm9ybS94ODYvaWRl
YXBhZC1sYXB0b3AuYyAgICAgICAgICAgICAgfCAzMyArKysrKysrKysrKysrKysrKysrKysrCiAy
IGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLXBsYXRmb3JtLWlkZWFwYWQtbGFwdG9wIGIvRG9jdW1lbnRh
dGlvbi9BQkkvdGVzdGluZy9zeXNmcy1wbGF0Zm9ybS1pZGVhcGFkLWxhcHRvcAppbmRleCBiMzFl
NzgyYmQ5ODUuLjQwMWUzN2U1YWNiZCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9BQkkvdGVz
dGluZy9zeXNmcy1wbGF0Zm9ybS1pZGVhcGFkLWxhcHRvcAorKysgYi9Eb2N1bWVudGF0aW9uL0FC
SS90ZXN0aW5nL3N5c2ZzLXBsYXRmb3JtLWlkZWFwYWQtbGFwdG9wCkBAIC0xNywzICsxNywxMiBA
QCBEZXNjcmlwdGlvbjoKIAkJCSogMiAtPiBEdXN0IENsZWFuaW5nCiAJCQkqIDQgLT4gRWZmaWNp
ZW50IFRoZXJtYWwgRGlzc2lwYXRpb24gTW9kZQogCitXaGF0OgkJL3N5cy9kZXZpY2VzL3BsYXRm
b3JtL2lkZWFwYWQvdG91Y2hwYWRfbW9kZQorRGF0ZToJCUphbiAyMDE3CitLZXJuZWxWZXJzaW9u
Ogk0LjExCitDb250YWN0OgkiUml0ZXNoIFJhaiBTYXJyYWYgPHJyc0BkZWJpYW4ub3JnPiIKK0Rl
c2NyaXB0aW9uOgorCQlDb250cm9sIHRvdWNocGFkIG1vZGUuCisgICAgICAgICAgICAgICAgICAg
ICAgICAqIDEgLT4gU3dpdGNoZWQgT24KKyAgICAgICAgICAgICAgICAgICAgICAgICogMCAtPiBT
d2l0Y2hlZCBPZmYKKwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvaWRlYXBhZC1s
YXB0b3AuYyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2lkZWFwYWQtbGFwdG9wLmMKaW5kZXggYTc2
MTRmYzU0MmI1Li5lNjEyZTA3NjRiYTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGxhdGZvcm0veDg2
L2lkZWFwYWQtbGFwdG9wLmMKKysrIGIvZHJpdmVycy9wbGF0Zm9ybS94ODYvaWRlYXBhZC1sYXB0
b3AuYwpAQCAtNDIzLDkgKzQyMyw0MiBAQCBzdGF0aWMgc3NpemVfdCBzdG9yZV9pZGVhcGFkX2Zh
bihzdHJ1Y3QgZGV2aWNlICpkZXYsCiAKIHN0YXRpYyBERVZJQ0VfQVRUUihmYW5fbW9kZSwgMDY0
NCwgc2hvd19pZGVhcGFkX2Zhbiwgc3RvcmVfaWRlYXBhZF9mYW4pOwogCisKK3N0YXRpYyBzc2l6
ZV90IHNob3dfdG91Y2hwYWRfbW9kZShzdHJ1Y3QgZGV2aWNlICpkZXYsCisJCQkJc3RydWN0IGRl
dmljZV9hdHRyaWJ1dGUgKmF0dHIsCisJCQkJY2hhciAqYnVmKQoreworCXVuc2lnbmVkIGxvbmcg
cmVzdWx0OworCXN0cnVjdCBpZGVhcGFkX3ByaXZhdGUgKnByaXYgPSBkZXZfZ2V0X2RydmRhdGEo
ZGV2KTsKKworCWlmIChyZWFkX2VjX2RhdGEocHJpdi0+YWRldi0+aGFuZGxlLCBWUENDTURfUl9U
T1VDSFBBRCwgJnJlc3VsdCkpCisJCXJldHVybiBzcHJpbnRmKGJ1ZiwgIi0xXG4iKTsKKwlyZXR1
cm4gc3ByaW50ZihidWYsICIlbHVcbiIsIHJlc3VsdCk7Cit9CisKK3N0YXRpYyBzc2l6ZV90IHN0
b3JlX3RvdWNocGFkX21vZGUoc3RydWN0IGRldmljZSAqZGV2LAorCQkJCSBzdHJ1Y3QgZGV2aWNl
X2F0dHJpYnV0ZSAqYXR0ciwKKwkJCQkgY29uc3QgY2hhciAqYnVmLCBzaXplX3QgY291bnQpCit7
CisJaW50IHJldCwgc3RhdGU7CisJc3RydWN0IGlkZWFwYWRfcHJpdmF0ZSAqcHJpdiA9IGRldl9n
ZXRfZHJ2ZGF0YShkZXYpOworCisJaWYgKCFjb3VudCkKKwkJcmV0dXJuIDA7CisJaWYgKHNzY2Fu
ZihidWYsICIlaSIsICZzdGF0ZSkgIT0gMSkKKwkJcmV0dXJuIC1FSU5WQUw7CisJcmV0ID0gd3Jp
dGVfZWNfY21kKHByaXYtPmFkZXYtPmhhbmRsZSwgVlBDQ01EX1dfVE9VQ0hQQUQsIHN0YXRlKTsK
KwlpZiAocmV0IDwgMCkKKwkJcmV0dXJuIC1FSU87CisJcmV0dXJuIGNvdW50OworfQorCitzdGF0
aWMgREVWSUNFX0FUVFIodG91Y2hwYWRfbW9kZSwgMDY0NCwgc2hvd190b3VjaHBhZF9tb2RlLCBz
dG9yZV90b3VjaHBhZF9tb2RlKTsKKwogc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUgKmlkZWFwYWRf
YXR0cmlidXRlc1tdID0gewogCSZkZXZfYXR0cl9jYW1lcmFfcG93ZXIuYXR0ciwKIAkmZGV2X2F0
dHJfZmFuX21vZGUuYXR0ciwKKwkmZGV2X2F0dHJfdG91Y2hwYWRfbW9kZS5hdHRyLAogCU5VTEwK
IH07CiAKLS0gCjIuMTEuMAoK


--=-+k0X21NBoOxAvATWw0Bi--

--=-PMzwAABtUIfizfIBcPxK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQCVDstmIVAB/Yn02pjpYo/LhdWkFAliQeWIACgkQpjpYo/Lh
dWmN0xAAlNe69QBnmIQ/7HnEwME12WwOAScnrPYjpie6aN/ypt1roqXey6QALb2R
I/4jhJbhkYoxW3T8fld4wSFIzRMqBKwCtB4SMbwhJPUAFFD30mrge9TEatuCSkRR
mCLxUATVBA9pljkfL0gV8hdIr1gbS7FfreWVcRCCjMvpTZkervgC4uHvCDVZ/Bqu
qrG25RN6jF4NliYwpwD+YIZ7YC/WZV2JYZebu0NtB9YkKVN6/0r2CZX/PXIC//uj
6yZSU0UJnGqOCiMz/lONBQ2lopHrGbN0kUWYSipW+Brx9Q/tBebn3rjoInAN1vy3
0b7ZIMu/bMKyhwpKUBwHtaLPi/rsxHODm4+MfemJXAY5tVNzMW7GuLWeM/yc2Lub
G3+3Bu5hEveKbPV9u68N/kHzuUU8YO4wILmMDkuCT2/3zH3fwqo78ak3z1l1PTDz
VVVIsvZwZpqE6oIa5ydFs42CpZ2uTHxUMkdEw63V+GhztRDzfsmUwPGhxi2QORgq
SrPv2Dj7/M5IHWsff4YchVKAMzx9InzZwKGLfABdqVm3+hP9x55RAVwYh/p9qlrJ
pgzVRawelJO2KMCl0N/7a1YOb3BQSdq99fY5TasGclkYbocS4H7nKK60CZqguq0x
T/pv2Or3ro9rxWusBJJSneWGqH44gya4+eeNkbLFjI72FJ6ij68=
=sonL
-----END PGP SIGNATURE-----

--=-PMzwAABtUIfizfIBcPxK--
