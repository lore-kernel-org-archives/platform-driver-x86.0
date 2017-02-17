From: Ritesh Raj Sarraf <rrs@debian.org>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Add sysfs interface for
 touchpad state
Date: Fri, 17 Feb 2017 20:23:57 +0530
Message-ID: <1487343237.10735.3.camel@debian.org>
References: <20170214141612.16913-1-rrs@debian.org>
         <20170217033301.GI6814@wisp> <1487322305.6980.14.camel@debian.org>
Reply-To: rrs@debian.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-zkcIdYe+DOJ13OHZ/K4d"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:36049 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934028AbdBQOyD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Feb 2017 09:54:03 -0500
Received: by mail-pg0-f65.google.com with SMTP id a123so2351776pgc.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Feb 2017 06:54:03 -0800 (PST)
In-Reply-To: <1487322305.6980.14.camel@debian.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Rafael Wysocki <rjw@rjwysocki.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, Ike Panhc <ike.pan@canonical.com>, Andy Shevchenko <andy@infradead.org>, linux-kernel@vger.kernel.org


--=-zkcIdYe+DOJ13OHZ/K4d
Content-Type: multipart/mixed; boundary="=-B+ri0U8pfzqPdJr0CH8N"


--=-B+ri0U8pfzqPdJr0CH8N
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-02-17 at 14:35 +0530, Ritesh Raj Sarraf wrote:
> > Please use:
> >=20
> > static DEVICE_ATTR_RW(touchpad_mode);
> >=20
> > You'll need to move the show_ and store_ prefixes to be postfixes, see
> > toshiba-acpi.c for several examples.
> >=20
>=20
> Thank you. I am building the kernel the test/verify the changes. Will pos=
t the
> revised patch soon.


I have included the changes you mentioned, built and tested locally on my L=
enovo
Yoga2 13, and posted (git send-email) to all involved parties.

I have also attached the patch in this reply.


--=20
Ritesh Raj Sarraf | http://people.debian.org/~rrs
Debian - The Universal Operating System
--=-B+ri0U8pfzqPdJr0CH8N
Content-Description: 
Content-Disposition: attachment; filename="0000-Add-sysfs-interface-for-touchpad-state.patch"
Content-Type: text/x-patch; name="0000-Add-sysfs-interface-for-touchpad-state.patch";
	charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSA2Yjg3NGQ0Zjc4NmExYTEwODYyZjg0M2RhNDU4MDQ0ODViNmQwZTcyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBSaXRlc2ggUmFqIFNhcnJhZiA8cnJzQGRlYmlhbi5vcmc+CkRh
dGU6IE1vbiwgMzAgSmFuIDIwMTcgMTU6MDU6NDggKzA1MzAKU3ViamVjdDogW1BBVENIIHYzXSBB
ZGQgc3lzZnMgaW50ZXJmYWNlIGZvciB0b3VjaHBhZCBzdGF0ZQoKTGVub3ZvIFlvZ2EgKG1hbnkg
dmFyaWFudHM6IFlvZ2EsIFlvZ2EyIFBybywgWW9nYTIgMTMsIFlvZ2EzIFBybywgWW9nYSAzCjE0
IGV0YykgaGFzIG11bHRpcGxlIG1vZGxlcyB0aGF0IGFyZSBhIGh5YnJpZCBsYXB0b3AsIHdvcmtp
bmcgaW4gbGFwdG9wCm1vZGUgYXMgd2VsbCBhcyB0YWJsZXQgbW9kZS4KCkN1cnJlbnRseSwgdGhl
cmUgaXMgbm8gZWFzeSBpbnRlcmZhY2UgdG8gZGV0ZXJtaW5lIHRoZSB0b3VjaHBhZCBzdGF0dXMs
CndoaWNoIGluIGNhc2Ugb2YgdGhlIFlvZ2EgZmFtaWx5IG9mIG1hY2hpbmVzLCBjYW4gYWxzbyBi
ZSB1c2VmdWwgdG8KYXNzdW1lIHRhYmxldCBtb2RlIHN0YXR1cy4KTm90ZTogVGhlIGlkZWFwYWQt
bGFwdG9wIGRyaXZlciBkb2VzIG5vdCBwcm92aWRlIGEgU1dfVEFCTEVUX01PREUgZWl0aGVyCgpG
b3IgYSBkZXRhaWxlZCBkaXNjdXNzaW9uICBvbiB3aHkgd2Ugd2FudCBlaXRoZXIgb2YgdGhlIGlu
dGVyZmFjZXMsCnBsZWFzZSBzZWU6Cmh0dHBzOi8vYnVncy5sYXVuY2hwYWQubmV0L29uYm9hcmQv
K2J1Zy8xMzY2NDIxL2NvbW1lbnRzLzQzCgpUaGlzIHBhdGNoIGFkZHMgYSBzeXNmcyBpbnRlcmZh
Y2UgZm9yIHJlYWQvd3JpdGUgYWNjZXNzIHVuZGVyOgovc3lzL2J1cy9wbGF0Zm9ybS9kZXZpY2Vz
L1ZQQzIwMDRcOjAwL3RvdWNocGFkX21vZGUKCnYzOgpJbmNsdWRlIERhcnJlbiBIYXJ0J3MgY29t
bWVudHMKQ2hhbmdlZCBzeXNmcyBpbnRlZmFjZSBmcm9tICJ0b3VjaHBhZF9tb2RlIiB0byAidG91
Y2hwYWQiCgp2MjoKSW5jbHVkZSBBbmR5IFNoZXZjaGVua28ncyBjb21tZW50cwoKU2lnbmVkLW9m
Zi1ieTogUml0ZXNoIFJhaiBTYXJyYWYgPHJyc0BkZWJpYW4ub3JnPgotLS0KIC4uLi9BQkkvdGVz
dGluZy9zeXNmcy1wbGF0Zm9ybS1pZGVhcGFkLWxhcHRvcCAgICAgIHwgIDggKysrKysKIGRyaXZl
cnMvcGxhdGZvcm0veDg2L2lkZWFwYWQtbGFwdG9wLmMgICAgICAgICAgICAgIHwgMzYgKysrKysr
KysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1wbGF0Zm9ybS1pZGVhcGFk
LWxhcHRvcCBiL0RvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtcGxhdGZvcm0taWRlYXBh
ZC1sYXB0b3AKaW5kZXggYjMxZTc4MmJkOTg1Li41ZDI0ZjFlOGU2ZWYgMTAwNjQ0Ci0tLSBhL0Rv
Y3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtcGxhdGZvcm0taWRlYXBhZC1sYXB0b3AKKysr
IGIvRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1wbGF0Zm9ybS1pZGVhcGFkLWxhcHRv
cApAQCAtMTcsMyArMTcsMTEgQEAgRGVzY3JpcHRpb246CiAJCQkqIDIgLT4gRHVzdCBDbGVhbmlu
ZwogCQkJKiA0IC0+IEVmZmljaWVudCBUaGVybWFsIERpc3NpcGF0aW9uIE1vZGUKIAorV2hhdDoJ
CS9zeXMvZGV2aWNlcy9wbGF0Zm9ybS9pZGVhcGFkL3RvdWNocGFkCitEYXRlOgkJRmViIDIwMTcK
K0tlcm5lbFZlcnNpb246CTQuMTEKK0NvbnRhY3Q6CSJSaXRlc2ggUmFqIFNhcnJhZiA8cnJzQGRl
Ymlhbi5vcmc+IgorRGVzY3JpcHRpb246CisJCUNvbnRyb2wgdG91Y2hwYWQgbW9kZS4KKwkJCSog
MSAtPiBTd2l0Y2hlZCBPbgorCQkJKiAwIC0+IFN3aXRjaGVkIE9mZgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9wbGF0Zm9ybS94ODYvaWRlYXBhZC1sYXB0b3AuYyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2
L2lkZWFwYWQtbGFwdG9wLmMKaW5kZXggZjQ2ZWNlMmNlM2M0Li5hZmYxYTU2MWM5ZWMgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L2lkZWFwYWQtbGFwdG9wLmMKKysrIGIvZHJpdmVy
cy9wbGF0Zm9ybS94ODYvaWRlYXBhZC1sYXB0b3AuYwpAQCAtNDIzLDkgKzQyMyw0NSBAQCBzdGF0
aWMgc3NpemVfdCBzdG9yZV9pZGVhcGFkX2ZhbihzdHJ1Y3QgZGV2aWNlICpkZXYsCiAKIHN0YXRp
YyBERVZJQ0VfQVRUUihmYW5fbW9kZSwgMDY0NCwgc2hvd19pZGVhcGFkX2Zhbiwgc3RvcmVfaWRl
YXBhZF9mYW4pOwogCisKK3N0YXRpYyBzc2l6ZV90IHRvdWNocGFkX3Nob3coc3RydWN0IGRldmlj
ZSAqZGV2LAorCQkJCXN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLAorCQkJCWNoYXIgKmJ1
ZikKK3sKKwlzdHJ1Y3QgaWRlYXBhZF9wcml2YXRlICpwcml2ID0gZGV2X2dldF9kcnZkYXRhKGRl
dik7CisJdW5zaWduZWQgbG9uZyByZXN1bHQ7CisKKwlpZiAocmVhZF9lY19kYXRhKHByaXYtPmFk
ZXYtPmhhbmRsZSwgVlBDQ01EX1JfVE9VQ0hQQUQsICZyZXN1bHQpKQorCQlyZXR1cm4gc3ByaW50
ZihidWYsICItMVxuIik7CisJcmV0dXJuIHNwcmludGYoYnVmLCAiJWx1XG4iLCByZXN1bHQpOwor
fQorCitzdGF0aWMgc3NpemVfdCB0b3VjaHBhZF9zdG9yZShzdHJ1Y3QgZGV2aWNlICpkZXYsCisJ
CQkJIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLAorCQkJCSBjb25zdCBjaGFyICpidWYs
IHNpemVfdCBjb3VudCkKK3sKKwlzdHJ1Y3QgaWRlYXBhZF9wcml2YXRlICpwcml2ID0gZGV2X2dl
dF9kcnZkYXRhKGRldik7CisJaW50IHJldCwgc3RhdGU7CisKKwlyZXQgPSBrc3RydG9pbnQoYnVm
LCAwLCAmc3RhdGUpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CisKKwlpZiAoc3RhdGUgIT0g
MCAmJiBzdGF0ZSAhPSAxKQorCQlyZXR1cm4gLUVJTlZBTDsKKworCXJldCA9IHdyaXRlX2VjX2Nt
ZChwcml2LT5hZGV2LT5oYW5kbGUsIFZQQ0NNRF9XX1RPVUNIUEFELCBzdGF0ZSk7CisJaWYgKHJl
dCA8IDApCisJCXJldHVybiAtRUlPOworCXJldHVybiBjb3VudDsKK30KKworc3RhdGljIERFVklD
RV9BVFRSX1JXKHRvdWNocGFkKTsKKwogc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUgKmlkZWFwYWRf
YXR0cmlidXRlc1tdID0gewogCSZkZXZfYXR0cl9jYW1lcmFfcG93ZXIuYXR0ciwKIAkmZGV2X2F0
dHJfZmFuX21vZGUuYXR0ciwKKwkmZGV2X2F0dHJfdG91Y2hwYWQuYXR0ciwKIAlOVUxMCiB9Owog
Ci0tIAoyLjExLjAKCg==


--=-B+ri0U8pfzqPdJr0CH8N--

--=-zkcIdYe+DOJ13OHZ/K4d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQCVDstmIVAB/Yn02pjpYo/LhdWkFAlinDoUACgkQpjpYo/Lh
dWmcJRAAmIDERd9G+FhAf/3Ghwzj3UUaOPbItdhS8QlLIk3j6i164e+hMp81BHPP
ssKPuWWhEsIPybg5dE2N/XGeLeGYDAcnuFk9FWNd8GDP+a56EPv5l4SoQgrP1Hx9
XT0og+4fcnPCUl4wcwJ2KO8kqjxCqy1c+rhBnpNUtIXhjwRhL/Cz7GZPBghZ/HR7
kY7ZiNrzwnz5MuJSKm9oGZDXEzPmL0ivW3A3H5du2kmqIyetyjI5j5+dcEIRUbCO
OMjxOrFXMw4IsWPpWKWnLAxPX6wuazTM8q3MOS/jAjU6Rzy++DUhqSHVAUC0jGS8
Tl5Zk6zn1w9Z4Leo5VPzEM4/k0iG6RPxGdcVzEOB/p/CoggBTnBUBSt4OLtB/nyh
Fv3NDQGNgQ1gTT4X78rT3jMykfaDJv2ehB5WuwLfry/RpRndwfH6V0J1L+8Jv5c7
yT/0a1vIAzOAx0h3ln1t/LWYLC9iPLuyz0z5GhbkOkLSa+LIYMACZXji1r4fhU1G
wvAXZT/p25xwg8eFJ2EyJ0KsmBOsvpZ4FH+c68VZ3tMsOt1vzyqKoAvTGohr7k/o
4CQql2DF4M9yzRxerAkzFWezmjQtGMZ85dgsAQNuvwMTiR8ioV5j3oJuQicddUzD
SCywDw5w2dFTL6t3GIz8Vqe6pyXEuTSEj7TCIjsb1PXqIaOyh34=
=imIL
-----END PGP SIGNATURE-----

--=-zkcIdYe+DOJ13OHZ/K4d--
