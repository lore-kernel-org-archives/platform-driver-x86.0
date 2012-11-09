From: Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [PATCH] asus-laptop: Do not call HWRS on init
Date: Fri, 09 Nov 2012 14:00:54 +0000
Message-ID: <1352469654.4728.74.camel@deadeye.wl.decadent.org.uk>
References: <1352430453.4728.59.camel@deadeye.wl.decadent.org.uk>
	 <CAHR064jyoG1A0NRpTPAqOF_1sVRdcM6kn0GQLx+j8UBY8kuaSw@mail.gmail.com>
	 <CAHR064joxpAWnEr-hcQektejHQRZret98M-+F5fP2mivG0QHmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-vJeDCpmxSarJZQrBBQxx"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:39550 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752342Ab2KIOBS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 9 Nov 2012 09:01:18 -0500
In-Reply-To: <CAHR064joxpAWnEr-hcQektejHQRZret98M-+F5fP2mivG0QHmg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: 692436@bugs.debian.org, ryan <draziw+deb@gmail.com>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, stable@vger.kernel.org, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Matthew Garrett <mjg@redhat.com>


--=-vJeDCpmxSarJZQrBBQxx
Content-Type: multipart/mixed; boundary="=-7kbdY2yDLbGbxwXxiUKD"


--=-7kbdY2yDLbGbxwXxiUKD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-11-09 at 09:20 +0000, Corentin Chary wrote:
> On Fri, Nov 9, 2012 at 9:12 AM, Corentin Chary <corentin.chary@gmail.com>=
 wrote:
> > On Fri, Nov 9, 2012 at 3:07 AM, Ben Hutchings <ben@decadent.org.uk> wro=
te:
> >> Since commit 8871e99f89b7 ('asus-laptop: HRWS/HWRS typo'), module
> >> initialisation is very slow on the Asus UL30A.  The HWRS method takes
> >> about 12 seconds to run, and subsequent initialisation also seems to
> >> be delayed.  Since we don't really need the result, don't bother
> >> calling it on init.  Those who are curious can still get the result
> >> through the 'infos' device attribute.
> >>
> >> Update the comment about HWRS in show_infos().
> >>
> >> Reported-by: ryan <draziw+deb@gmail.com>
> >> References: http://bugs.debian.org/692436
> >> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> >> Cc: <stable@vger.kernel.org> # v3.0+
> >> ---
> >>  drivers/platform/x86/asus-laptop.c |   17 ++++-------------
> >>  1 file changed, 4 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86=
/asus-laptop.c
> >> index 4b568df..a961156 100644
> >> --- a/drivers/platform/x86/asus-laptop.c
> >> +++ b/drivers/platform/x86/asus-laptop.c
> >> @@ -860,8 +860,10 @@ static ssize_t show_infos(struct device *dev,
> >>         /*
> >>          * The HWRS method return informations about the hardware.
> >>          * 0x80 bit is for WLAN, 0x100 for Bluetooth.
> >> +        * 0x40 for WWAN, 0x10 for WIMAX.
> >>          * The significance of others is yet to be found.
> >> -        * If we don't find the method, we assume the device are prese=
nt.
> >> +        * We don't currently use this for device detection, and it
> >> +        * takes several seconds to run on some systems.
> >>          */
> >>         rv =3D acpi_evaluate_integer(asus->handle, "HWRS", NULL, &temp=
);
> >>         if (!ACPI_FAILURE(rv))
> >> @@ -1682,7 +1684,7 @@ static int asus_laptop_get_info(struct asus_lapt=
op *asus)
> >>  {
> >>         struct acpi_buffer buffer =3D { ACPI_ALLOCATE_BUFFER, NULL };
> >>         union acpi_object *model =3D NULL;
> >> -       unsigned long long bsts_result, hwrs_result;
> >> +       unsigned long long bsts_result;
> >>         char *string =3D NULL;
> >>         acpi_status status;
> >>
> >> @@ -1744,17 +1746,6 @@ static int asus_laptop_get_info(struct asus_lap=
top *asus)
> >>         if (*string)
> >>                 pr_notice("  %s model detected\n", string);
> >>
> >> -       /*
> >> -        * The HWRS method return informations about the hardware.
> >> -        * 0x80 bit is for WLAN, 0x100 for Bluetooth,
> >> -        * 0x40 for WWAN, 0x10 for WIMAX.
> >> -        * The significance of others is yet to be found.
> >> -        */
> >> -       status =3D
> >> -           acpi_evaluate_integer(asus->handle, "HWRS", NULL, &hwrs_re=
sult);
> >> -       if (!ACPI_FAILURE(status))
> >> -               pr_notice("  HWRS returned %x", (int)hwrs_result);
> >> -
> >>         if (!acpi_check_handle(asus->handle, METHOD_WL_STATUS, NULL))
> >>                 asus->have_rsts =3D true;
> >>
> >>
> >>
> >
> > Acked-by: Corentin Chary <corentin.chary@gmail.com>
>=20
> Arg, at first I though it was another gmail quirk, but it seems that
> evolution broke your patch. Can you re-send it using git instead ?

It's not broken, it's just signed - 'git am' has no problem with this.
Well here it is again as an attachment.

Ben.

--=20
Ben Hutchings
The program is absolutely right; therefore, the computer must be wrong.

--=-7kbdY2yDLbGbxwXxiUKD
Content-Disposition: attachment; filename="0001-asus-laptop-Do-not-call-HWRS-on-init.patch"
Content-Transfer-Encoding: base64
Content-Type: text/x-patch; name="0001-asus-laptop-Do-not-call-HWRS-on-init.patch";
	charset="UTF-8"

RnJvbSA2OWM3OTQ2YzUwNTMzNTlkMzZlMDVkNDdlMDczMzZmZGJiYzY1YTBkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogQmVuIEh1dGNoaW5ncyA8YmVuQGRlY2FkZW50Lm9yZy51az4N
CkRhdGU6IEZyaSwgOSBOb3YgMjAxMiAwMjo0MzowMCArMDAwMA0KU3ViamVjdDogW1BBVENIXSBh
c3VzLWxhcHRvcDogRG8gbm90IGNhbGwgSFdSUyBvbiBpbml0DQoNClNpbmNlIGNvbW1pdCA4ODcx
ZTk5Zjg5YjcgKCdhc3VzLWxhcHRvcDogSFJXUy9IV1JTIHR5cG8nKSwgbW9kdWxlDQppbml0aWFs
aXNhdGlvbiBpcyB2ZXJ5IHNsb3cgb24gdGhlIEFzdXMgVUwzMEEuICBUaGUgSFdSUyBtZXRob2Qg
dGFrZXMNCmFib3V0IDEyIHNlY29uZHMgdG8gcnVuLCBhbmQgc3Vic2VxdWVudCBpbml0aWFsaXNh
dGlvbiBhbHNvIHNlZW1zIHRvDQpiZSBkZWxheWVkLiAgU2luY2Ugd2UgZG9uJ3QgcmVhbGx5IG5l
ZWQgdGhlIHJlc3VsdCwgZG9uJ3QgYm90aGVyDQpjYWxsaW5nIGl0IG9uIGluaXQuICBUaG9zZSB3
aG8gYXJlIGN1cmlvdXMgY2FuIHN0aWxsIGdldCB0aGUgcmVzdWx0DQp0aHJvdWdoIHRoZSAnaW5m
b3MnIGRldmljZSBhdHRyaWJ1dGUuDQoNClVwZGF0ZSB0aGUgY29tbWVudCBhYm91dCBIV1JTIGlu
IHNob3dfaW5mb3MoKS4NCg0KUmVwb3J0ZWQtYnk6IHJ5YW4gPGRyYXppdytkZWJAZ21haWwuY29t
Pg0KUmVmZXJlbmNlczogaHR0cDovL2J1Z3MuZGViaWFuLm9yZy82OTI0MzYNClNpZ25lZC1vZmYt
Ynk6IEJlbiBIdXRjaGluZ3MgPGJlbkBkZWNhZGVudC5vcmcudWs+DQotLS0NCiBkcml2ZXJzL3Bs
YXRmb3JtL3g4Ni9hc3VzLWxhcHRvcC5jIHwgICAxNyArKysrLS0tLS0tLS0tLS0tLQ0KIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvYXN1cy1sYXB0b3AuYyBiL2RyaXZlcnMvcGxhdGZvcm0v
eDg2L2FzdXMtbGFwdG9wLmMNCmluZGV4IDRiNTY4ZGYuLmE5NjExNTYgMTAwNjQ0DQotLS0gYS9k
cml2ZXJzL3BsYXRmb3JtL3g4Ni9hc3VzLWxhcHRvcC5jDQorKysgYi9kcml2ZXJzL3BsYXRmb3Jt
L3g4Ni9hc3VzLWxhcHRvcC5jDQpAQCAtODYwLDggKzg2MCwxMCBAQCBzdGF0aWMgc3NpemVfdCBz
aG93X2luZm9zKHN0cnVjdCBkZXZpY2UgKmRldiwNCiAJLyoNCiAJICogVGhlIEhXUlMgbWV0aG9k
IHJldHVybiBpbmZvcm1hdGlvbnMgYWJvdXQgdGhlIGhhcmR3YXJlLg0KIAkgKiAweDgwIGJpdCBp
cyBmb3IgV0xBTiwgMHgxMDAgZm9yIEJsdWV0b290aC4NCisJICogMHg0MCBmb3IgV1dBTiwgMHgx
MCBmb3IgV0lNQVguDQogCSAqIFRoZSBzaWduaWZpY2FuY2Ugb2Ygb3RoZXJzIGlzIHlldCB0byBi
ZSBmb3VuZC4NCi0JICogSWYgd2UgZG9uJ3QgZmluZCB0aGUgbWV0aG9kLCB3ZSBhc3N1bWUgdGhl
IGRldmljZSBhcmUgcHJlc2VudC4NCisJICogV2UgZG9uJ3QgY3VycmVudGx5IHVzZSB0aGlzIGZv
ciBkZXZpY2UgZGV0ZWN0aW9uLCBhbmQgaXQNCisJICogdGFrZXMgc2V2ZXJhbCBzZWNvbmRzIHRv
IHJ1biBvbiBzb21lIHN5c3RlbXMuDQogCSAqLw0KIAlydiA9IGFjcGlfZXZhbHVhdGVfaW50ZWdl
cihhc3VzLT5oYW5kbGUsICJIV1JTIiwgTlVMTCwgJnRlbXApOw0KIAlpZiAoIUFDUElfRkFJTFVS
RShydikpDQpAQCAtMTY4Miw3ICsxNjg0LDcgQEAgc3RhdGljIGludCBhc3VzX2xhcHRvcF9nZXRf
aW5mbyhzdHJ1Y3QgYXN1c19sYXB0b3AgKmFzdXMpDQogew0KIAlzdHJ1Y3QgYWNwaV9idWZmZXIg
YnVmZmVyID0geyBBQ1BJX0FMTE9DQVRFX0JVRkZFUiwgTlVMTCB9Ow0KIAl1bmlvbiBhY3BpX29i
amVjdCAqbW9kZWwgPSBOVUxMOw0KLQl1bnNpZ25lZCBsb25nIGxvbmcgYnN0c19yZXN1bHQsIGh3
cnNfcmVzdWx0Ow0KKwl1bnNpZ25lZCBsb25nIGxvbmcgYnN0c19yZXN1bHQ7DQogCWNoYXIgKnN0
cmluZyA9IE5VTEw7DQogCWFjcGlfc3RhdHVzIHN0YXR1czsNCiANCkBAIC0xNzQ0LDE3ICsxNzQ2
LDYgQEAgc3RhdGljIGludCBhc3VzX2xhcHRvcF9nZXRfaW5mbyhzdHJ1Y3QgYXN1c19sYXB0b3Ag
KmFzdXMpDQogCWlmICgqc3RyaW5nKQ0KIAkJcHJfbm90aWNlKCIgICVzIG1vZGVsIGRldGVjdGVk
XG4iLCBzdHJpbmcpOw0KIA0KLQkvKg0KLQkgKiBUaGUgSFdSUyBtZXRob2QgcmV0dXJuIGluZm9y
bWF0aW9ucyBhYm91dCB0aGUgaGFyZHdhcmUuDQotCSAqIDB4ODAgYml0IGlzIGZvciBXTEFOLCAw
eDEwMCBmb3IgQmx1ZXRvb3RoLA0KLQkgKiAweDQwIGZvciBXV0FOLCAweDEwIGZvciBXSU1BWC4N
Ci0JICogVGhlIHNpZ25pZmljYW5jZSBvZiBvdGhlcnMgaXMgeWV0IHRvIGJlIGZvdW5kLg0KLQkg
Ki8NCi0Jc3RhdHVzID0NCi0JICAgIGFjcGlfZXZhbHVhdGVfaW50ZWdlcihhc3VzLT5oYW5kbGUs
ICJIV1JTIiwgTlVMTCwgJmh3cnNfcmVzdWx0KTsNCi0JaWYgKCFBQ1BJX0ZBSUxVUkUoc3RhdHVz
KSkNCi0JCXByX25vdGljZSgiICBIV1JTIHJldHVybmVkICV4IiwgKGludClod3JzX3Jlc3VsdCk7
DQotDQogCWlmICghYWNwaV9jaGVja19oYW5kbGUoYXN1cy0+aGFuZGxlLCBNRVRIT0RfV0xfU1RB
VFVTLCBOVUxMKSkNCiAJCWFzdXMtPmhhdmVfcnN0cyA9IHRydWU7DQogDQo=


--=-7kbdY2yDLbGbxwXxiUKD--

--=-vJeDCpmxSarJZQrBBQxx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIVAwUAUJ0Mlue/yOyVhhEJAQocRA//awmePDlfAJBzWnJiJWbwhH7uEHKFGB8W
Z68P2Gvu47x0YQXyCfQYXaZco50/b8kgBVo+9VJko32rrGumnQlBJ0wTNY0qKfPf
Q/M9AlsBYECGDhxONb2D7NBaPCES0zzBMeushr61D5JJhM887BwEBvDTTQ355uOh
PuhSRb6wqgG2ZpfnZvFrxT6UKOpaOtZslh6PlIF38j5PJuoGcXzlyaDWbOW+uafw
nZIX2YEZUyLdJ+k4e10dzkmCkrdlrgfMNAiNfEtp05+QDDnth1cxPw0Jcy2PBY3H
wsDmz7D7H0Ah5pJadUeNBnmbn1PCLp5odLYeIRl9mJafEK+Fir5fHkzYZRyGWhBJ
WE9VjgcyDRzMb8upnjlvUmQnx3yFTDFcuXzAv799LVQKP1SjXyup962qy8vZMU5O
zteJqjWcSYJbw5A6HqxLiVSq6j1nCarScGgYM8I0sHWos0Nn4jn/Aqf4KDz4RIOS
yRAvHfcI2WRx69YrZf9QlfLr+IQlYYNo7zpL7s2X0k782v1W35/bR8yDrzyQi0rX
tFd7/zk+9Z8iLrEF2nFt9UU3y2Q3ao2oyTabs1UI08Ag0gkhxWmKCK+yVnnhE8l/
7wYRTDc5FbckKyGRd4MiFXC8DnvjTKq7gm0n/nV6CDTMJ2sTVFoj77VFB9gn/oyv
oI/6/cxS15A=
=BsCy
-----END PGP SIGNATURE-----

--=-vJeDCpmxSarJZQrBBQxx--
