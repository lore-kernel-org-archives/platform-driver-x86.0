From: Ritesh Raj Sarraf <rrs@debian.org>
Subject: Re: [PATCH v4] platform/x86: ideapad-laptop: Add sysfs interface
 for touchpad state
Date: Wed, 03 May 2017 20:06:36 +0530
Message-ID: <1493822196.17987.3.camel@debian.org>
References: <20170217184756.15181-1-rrs@debian.org>
         <1487759058.9334.7.camel@debian.org>
         <CAHp75VcGYLSsnDgb_dzD0NVCK+aR6w7jZWfR+4nN-BfnAcdRWA@mail.gmail.com>
         <1493448775.9725.5.camel@debian.org>
         <CAHp75Vds7Vc3aJWpOO8uqo-y+PzUO+PNrhsjnHxGRs4WXt935A@mail.gmail.com>
Reply-To: rrs@debian.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-tzOjiKRgw6ZCF0e9EER+"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:32830 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753133AbdECOgl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 May 2017 10:36:41 -0400
Received: by mail-pg0-f68.google.com with SMTP id s62so17021050pgc.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 03 May 2017 07:36:41 -0700 (PDT)
In-Reply-To: <CAHp75Vds7Vc3aJWpOO8uqo-y+PzUO+PNrhsjnHxGRs4WXt935A@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Ike Panhc <ike.pan@canonical.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>


--=-tzOjiKRgw6ZCF0e9EER+
Content-Type: multipart/mixed; boundary="=-jiNyl5PaAmvVA29LNgge"


--=-jiNyl5PaAmvVA29LNgge
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Resending again, as Google servers are behaving weird lately.

On Sun, 2017-04-30 at 15:54 +0300, Andy Shevchenko wrote:
> > > the main issue that driver doesn't
> > > send SW_TABLET_MODE event through input device.
> >=20
> > Well. Yes. That is one part. If SW_TABLET_MODE is done in the driver, m=
uch
> > better. My patch was simply in line with some of the other drivers (hp-=
wmi
> > and
> > thinkpad_acpi) to get it working for Lenovo Yoga series.
>=20
> sysfs ABI for drivers that provide input interface is quite strong for
> my opinion. It means I'm not totally objecting, but I would accept it
> if and only if there is nothing else could be done.

The need we have in the user application is for read-only access.=C2=A0

I have attached the same old patch with just the minor file attribute chang=
e,
which would make the sysfs interface to read-only. If in future, there are =
good
reasons to expose that interface as read/write, updating that attribute can=
 be
revisited.

Can this now be included in your tree ? This minor patch may be helpful to =
many
Ideapad users with a Hybrid machine.


PS: Given how minimal the change is, I just hand updated the patch. If you =
want
it in the proper git send-email flow, please let me know.

--=20
Ritesh Raj Sarraf | http://people.debian.org/~rrs
Debian - The Universal Operating System
--=-jiNyl5PaAmvVA29LNgge
Content-Disposition: attachment; filename="0001-Add-sysfs-interface-for-touchpad-state.patch"
Content-Type: text/x-patch; name="0001-Add-sysfs-interface-for-touchpad-state.patch";
	charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSBmMTg5MTFjMWVlMDcxNDk0M2EwMjNkYjhhZTQzYmY4NGEzODczZDk4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBSaXRlc2ggUmFqIFNhcnJhZiA8cnJzQGRlYmlhbi5vcmc+CkRh
dGU6IE1vbiwgMzAgSmFuIDIwMTcgMTU6MDU6NDggKzA1MzAKU3ViamVjdDogW1BBVENIIHY0XSBw
bGF0Zm9ybS94ODY6IGlkZWFwYWQtbGFwdG9wOiBBZGQgc3lzZnMgaW50ZXJmYWNlIGZvciB0b3Vj
aHBhZCBzdGF0ZQoKTGVub3ZvIFlvZ2EgKG1hbnkgdmFyaWFudHM6IFlvZ2EsIFlvZ2EyIFBybywg
WW9nYTIgMTMsIFlvZ2EzIFBybywgWW9nYSAzCjE0IGV0YykgaGFzIG11bHRpcGxlIG1vZGxlcyB0
aGF0IGFyZSBhIGh5YnJpZCBsYXB0b3AsIHdvcmtpbmcgaW4gbGFwdG9wCm1vZGUgYXMgd2VsbCBh
cyB0YWJsZXQgbW9kZS4KCkN1cnJlbnRseSwgdGhlcmUgaXMgbm8gZWFzeSBpbnRlcmZhY2UgdG8g
ZGV0ZXJtaW5lIHRoZSB0b3VjaHBhZCBzdGF0dXMsCndoaWNoIGluIGNhc2Ugb2YgdGhlIFlvZ2Eg
ZmFtaWx5IG9mIG1hY2hpbmVzLCBjYW4gYWxzbyBiZSB1c2VmdWwgdG8KYXNzdW1lIHRhYmxldCBt
b2RlIHN0YXR1cy4KTm90ZTogVGhlIGlkZWFwYWQtbGFwdG9wIGRyaXZlciBkb2VzIG5vdCBwcm92
aWRlIGEgU1dfVEFCTEVUX01PREUgZWl0aGVyCgpGb3IgYSBkZXRhaWxlZCBkaXNjdXNzaW9uICBv
biB3aHkgd2Ugd2FudCBlaXRoZXIgb2YgdGhlIGludGVyZmFjZXMsCnBsZWFzZSBzZWU6Cmh0dHBz
Oi8vYnVncy5sYXVuY2hwYWQubmV0L29uYm9hcmQvK2J1Zy8xMzY2NDIxL2NvbW1lbnRzLzQzCgpU
aGlzIHBhdGNoIGFkZHMgYSBzeXNmcyBpbnRlcmZhY2UgZm9yIHJlYWQgYWNjZXNzIHVuZGVyOgov
c3lzL2J1cy9wbGF0Zm9ybS9kZXZpY2VzL1ZQQzIwMDRcOjAwL3RvdWNocGFkCgp2NToKU2V0IGZp
bGUgYXR0cmlidXRlIHRvIHJlYWQtb25seQoKdjQ6ClVzZSBrc3RydG9ib29sIGJlY2F1c2Ugc3Vw
cG9ydGVkIHZhbHVlcyBhcmUgYm9vbGVhbgoKdjM6CkluY2x1ZGUgRGFycmVuIEhhcnQncyBjb21t
ZW50cwpDaGFuZ2VkIHN5c2ZzIGludGVmYWNlIGZyb20gInRvdWNocGFkX21vZGUiIHRvICJ0b3Vj
aHBhZCIKCnYyOgpJbmNsdWRlIEFuZHkgU2hldmNoZW5rbydzIGNvbW1lbnRzCgpTaWduZWQtb2Zm
LWJ5OiBSaXRlc2ggUmFqIFNhcnJhZiA8cnJzQGRlYmlhbi5vcmc+Ci0tLQogLi4uL0FCSS90ZXN0
aW5nL3N5c2ZzLXBsYXRmb3JtLWlkZWFwYWQtbGFwdG9wICAgICAgfCAgOCArKysrKwogZHJpdmVy
cy9wbGF0Zm9ybS94ODYvaWRlYXBhZC1sYXB0b3AuYyAgICAgICAgICAgICAgfCAzNCArKysrKysr
KysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLXBsYXRmb3JtLWlkZWFwYWQt
bGFwdG9wIGIvRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1wbGF0Zm9ybS1pZGVhcGFk
LWxhcHRvcAppbmRleCBiMzFlNzgyYmQ5ODUuLjVkMjRmMWU4ZTZlZiAxMDA2NDQKLS0tIGEvRG9j
dW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1wbGF0Zm9ybS1pZGVhcGFkLWxhcHRvcAorKysg
Yi9Eb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLXBsYXRmb3JtLWlkZWFwYWQtbGFwdG9w
CkBAIC0xNywzICsxNywxMSBAQCBEZXNjcmlwdGlvbjoKIAkJCSogMiAtPiBEdXN0IENsZWFuaW5n
CiAJCQkqIDQgLT4gRWZmaWNpZW50IFRoZXJtYWwgRGlzc2lwYXRpb24gTW9kZQogCitXaGF0OgkJ
L3N5cy9kZXZpY2VzL3BsYXRmb3JtL2lkZWFwYWQvdG91Y2hwYWQKK0RhdGU6CQlGZWIgMjAxNwor
S2VybmVsVmVyc2lvbjoJNC4xMgorQ29udGFjdDoJIlJpdGVzaCBSYWogU2FycmFmIDxycnNAZGVi
aWFuLm9yZz4iCitEZXNjcmlwdGlvbjoKKwkJUmVhZCB0b3VjaHBhZCBzdGF0dXMuCisJCQkqIDEg
LT4gU3dpdGNoZWQgT24KKwkJCSogMCAtPiBTd2l0Y2hlZCBPZmYKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvcGxhdGZvcm0veDg2L2lkZWFwYWQtbGFwdG9wLmMgYi9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9p
ZGVhcGFkLWxhcHRvcC5jCmluZGV4IGY0NmVjZTJjZTNjNC4uYjM1OTU0NzA3ZTExIDEwMDY0NAot
LS0gYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9pZGVhcGFkLWxhcHRvcC5jCisrKyBiL2RyaXZlcnMv
cGxhdGZvcm0veDg2L2lkZWFwYWQtbGFwdG9wLmMKQEAgLTQyMyw5ICs0MjMsNDMgQEAgc3RhdGlj
IHNzaXplX3Qgc3RvcmVfaWRlYXBhZF9mYW4oc3RydWN0IGRldmljZSAqZGV2LAogCiBzdGF0aWMg
REVWSUNFX0FUVFIoZmFuX21vZGUsIDA2NDQsIHNob3dfaWRlYXBhZF9mYW4sIHN0b3JlX2lkZWFw
YWRfZmFuKTsKIAorCitzdGF0aWMgc3NpemVfdCB0b3VjaHBhZF9zaG93KHN0cnVjdCBkZXZpY2Ug
KmRldiwKKwkJCQlzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwKKwkJCQljaGFyICpidWYp
Cit7CisJc3RydWN0IGlkZWFwYWRfcHJpdmF0ZSAqcHJpdiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYp
OworCXVuc2lnbmVkIGxvbmcgcmVzdWx0OworCisJaWYgKHJlYWRfZWNfZGF0YShwcml2LT5hZGV2
LT5oYW5kbGUsIFZQQ0NNRF9SX1RPVUNIUEFELCAmcmVzdWx0KSkKKwkJcmV0dXJuIHNwcmludGYo
YnVmLCAiLTFcbiIpOworCXJldHVybiBzcHJpbnRmKGJ1ZiwgIiVsdVxuIiwgcmVzdWx0KTsKK30K
Kworc3RhdGljIHNzaXplX3QgdG91Y2hwYWRfc3RvcmUoc3RydWN0IGRldmljZSAqZGV2LAorCQkJ
CSBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwKKwkJCQkgY29uc3QgY2hhciAqYnVmLCBz
aXplX3QgY291bnQpCit7CisJc3RydWN0IGlkZWFwYWRfcHJpdmF0ZSAqcHJpdiA9IGRldl9nZXRf
ZHJ2ZGF0YShkZXYpOworCWludCByZXQ7CisJYm9vbCBzdGF0ZTsKKworCXJldCA9IGtzdHJ0b2Jv
b2woYnVmLCAmc3RhdGUpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CisKKwlyZXQgPSB3cml0
ZV9lY19jbWQocHJpdi0+YWRldi0+aGFuZGxlLCBWUENDTURfV19UT1VDSFBBRCwgc3RhdGUpOwor
CWlmIChyZXQgPCAwKQorCQlyZXR1cm4gLUVJTzsKKwlyZXR1cm4gY291bnQ7Cit9CisKK3N0YXRp
YyBERVZJQ0VfQVRUUl9STyh0b3VjaHBhZCk7CisKIHN0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICpp
ZGVhcGFkX2F0dHJpYnV0ZXNbXSA9IHsKIAkmZGV2X2F0dHJfY2FtZXJhX3Bvd2VyLmF0dHIsCiAJ
JmRldl9hdHRyX2Zhbl9tb2RlLmF0dHIsCisJJmRldl9hdHRyX3RvdWNocGFkLmF0dHIsCiAJTlVM
TAogfTsKIAotLSAKMi4xMS4wCgo=


--=-jiNyl5PaAmvVA29LNgge--

--=-tzOjiKRgw6ZCF0e9EER+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQCVDstmIVAB/Yn02pjpYo/LhdWkFAlkJ6vQACgkQpjpYo/Lh
dWmyShAAq4Cq9lN4CES+Be63J6Foav5eagZebr/7Ke5hy9MvpA1QUAqSOwnfoRyB
Mwg8t2eE/mRcVD2leWDk6zG8qal6aRFjdybtJJUn2GtadUj2ONaxJN05mDtVOzPc
Mkz8sVLOeZcSMtEshLjGgIuY+PBec9wF9QFGL9XnRmaVhjYxjCaL4glbuNRN4x9d
wstzf2/JZF7hmc7vMppZPC+Gh+jN2AjT6VQdQ7tuhjH9fmvrJFFmb6jQrnT5Wy4C
fLYfKsjH1F85YwjKhl2gEuwSQp1k76JgAdFx+1raQ7xzWW1SVa5eMTOhlwpiNC9I
4lJyHZlz6Rb5Gm7py5F2fVSaH/lng8R2TtjHVslc9X1WgkU2BpTskMbb2qZgCc74
jSvXz8Qh5suvWj3PT9y5AIUGRIKQtq5zme0xBWURFiGykQQpfp1PoMtheAdhTF8E
Hmm+5BAeQykv3LMd4NbtOAmVgXK4DClUspUFPqNmqha600XDZOK1iQqVCCT6+VoL
DljvthSYZYRo2nePIR76WZXpK80KVCeHzB25ii+ajjn4tUTY7oVt0QOvi6KMGc/8
GBfnrou5jOsuF5Ou0QXzTsZVfUqv1U5QqT7JngEoz6DkBRUmiUFRGYVnEO4TP/Kh
+9qVbXnm7bCz+ENKSKKvWrvcxgFAIbQ/Xbx/kKzk7TR5lgxIhMM=
=Bs5e
-----END PGP SIGNATURE-----

--=-tzOjiKRgw6ZCF0e9EER+--
