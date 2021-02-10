Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55ACEC43332
	for <platform-driver-x86@archiver.kernel.org>; Wed, 10 Feb 2021 23:46:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2AB1364E25
	for <platform-driver-x86@archiver.kernel.org>; Wed, 10 Feb 2021 23:46:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233490AbhBJXqt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 10 Feb 2021 18:46:49 -0500
Received: from ganymed.uberspace.de ([185.26.156.242]:60798 "EHLO
        ganymed.uberspace.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233948AbhBJXqs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 10 Feb 2021 18:46:48 -0500
Received: (qmail 32279 invoked from network); 10 Feb 2021 23:46:03 -0000
Received: from localhost (HELO localhost) (127.0.0.1)
  by ganymed.uberspace.de with SMTP; 10 Feb 2021 23:46:03 -0000
Subject: Re: [PATCH v2] platform/x86: thinkpad_acpi: Handle keyboard cover
 attach/detach events
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Nitin Joshi1 <njoshi1@lenovo.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Mark Pearson <mpearson@lenovo.com>
References: <00d3570a-8624-89ca-7216-7d648b0a2f0b@a-kobel.de>
 <984D5EJD7aHLu4SvKWlumE3xhawPAvBV3B9JezdQhjclDnufeiTOOMInBizd1p_rdhJBgOmjc2sW8Ji00gkmBY1NIMW_weIwVZfgSZefizA=@protonmail.com>
From:   Alexander Kobel <a-kobel@a-kobel.de>
Message-ID: <83a0b308-21b9-c30c-e3ef-982d36b30a17@a-kobel.de>
Date:   Thu, 11 Feb 2021 00:46:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <984D5EJD7aHLu4SvKWlumE3xhawPAvBV3B9JezdQhjclDnufeiTOOMInBizd1p_rdhJBgOmjc2sW8Ji00gkmBY1NIMW_weIwVZfgSZefizA=@protonmail.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256; boundary="------------ms020305080907050405020109"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This is a cryptographically signed message in MIME format.

--------------ms020305080907050405020109
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

thanks for reviewing.

On 2/10/21 10:48 PM, Barnab=C3=A1s P=C5=91cze wrote:
> Hi
>=20
> 2021. febru=C3=A1r 10., szerda 18:54 keltez=C3=A9ssel, Alexander Kobel =
=C3=ADrta:
>=20
>> @@ -174,6 +174,11 @@ enum tpacpi_hkey_event_t {
>>  						     or port replicator */
>>  	TP_HKEY_EV_HOTPLUG_UNDOCK	=3D 0x4011, /* undocked from hotplug
>>  						     dock or port replicator */
>> +	/* Thinkpad X1 Tablet series (and probably other GTOP type 4) emit 0=
x4012 and 0x4013
>=20
> The preferred style of multi-line comments is
>=20
> /* <note the empty line here>
>  * Lorem ipsum ...
>  */

Corrected.

>> @@ -2166,11 +2173,32 @@ static int hotkey_gmms_get_tablet_mode(int s, =
int *has_tablet_mode)
>>  	return !!(mode & TP_ACPI_MULTI_MODE_TABLET_LIKE);
>>  }
>>
>> +static int hotkey_gtop_any_type_get_tablet_mode(int s)
>> +{
>> +	return !(s & 0x1);
>> +}
>=20
> I believe it would be preferable to do something like
>=20
>   #define TP_GTOP_TYPE_ANY_ATTACH_STATE BIT(0)
>   /* or possibly use an enum */
>   ...
>   return !(s & TP_GTOP_TYPE_ANY_ATTACH_STATE);
>=20
> or let `s` be `unsigned long`, and then
>=20
>   #define TP_GTOP_TYPE_ANY_ATTACH_STATE_BIT 0
>   ...
>   return !test_bit(TP_GTOP_TYPE_ANY_ATTACH_STATE_BIT, &s);
>=20
> or something along these lines, and I also think the return type could =
be `bool`.

Indeed, thanks for the suggestion. I used the first variant.

>> +
>> +static int hotkey_gtop_x1_tablet_type_get_tablet_mode(int s)
>> +{
>> +	return (!(s & 0x1) /* keyboard NOT attached */
>> +		|| ((s >> 16) & 0x1) /* or folded onto the back */);
>> +}
>=20
> Same here, I suggest using the `BIT()` macro or `test_bit()` and prefer=
ably
> name the constants.

Ditto.

>> @@ -3213,7 +3241,62 @@ static int hotkey_init_tablet_mode(void)
>>  	int in_tablet_mode =3D 0, res;
>>  	char *type =3D NULL;
>>
>> -	if (acpi_evalf(hkey_handle, &res, "GMMS", "qdd", 0)) {
>> +	if (acpi_evalf(hkey_handle, &res, "GTOP", "qdd", 0x0000)
>> +	    && res >=3D 0x0103
>> +	    && acpi_evalf(hkey_handle, &res, "GTOP", "qdd", 0x0100)) {
>=20
> Minor thing, but checkpatch prefers `&&` at the end of the line. And th=
e rest of
> the code places them at the end, too.

Corrected, thanks.

>> +		/*
>> +		 * GTOP ("Get Tablet OPtion") state ASL method definition:
>> +		 * - Input: 0x0000: Query version
>> +		 *   Output: 0x0103 (version 1.03)
>> +		 * - Input: 0x0100: Query interface type
>> +		 *   Output: DWORD But 31-0 Interface type
>                                     ^
> Shouldn't that be "Bit"?

Of course. I effectively turned the entire comment into descriptive const=
ants, at the same time correcting the other issues.

>> +		switch (res) {
>> +		case 1:
>> +			tp_features.hotkey_tablet =3D TP_HOTKEY_TABLET_USES_GTOP_ANY_TYPE;=

>> +			if (acpi_evalf(hkey_handle, &res, "GTOP", "qdd", 0x200))
>=20
> Please name that `0x200` something like TP_GTOP_CMD_GET_ATTACH_STATE or=
 something
> you like. (Same for the rest of the GTOP calls.) I know it's just above=
 in the comment,
> but I still think it'd be better to have concrete, more or less self-ex=
planatory names
> in the actual command

Indeed. All magic constants are now collected at a single place before th=
e HKEY constants.


Thanks again,
Alex


> Regards,
> Barnab=C3=A1s P=C5=91cze
>=20


--------------ms020305080907050405020109
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
Ew0wggY9MIIEJaADAgECAgg3B676YzbKKTANBgkqhkiG9w0BAQsFADBSMQswCQYDVQQGEwJE
RTEXMBUGA1UECgwORnJhdW5ob2ZlciBTSVQxKjAoBgNVBAMMIVZvbGtzdmVyc2NobHVlc3Nl
bHVuZyBSb290IENBIEcwMjAeFw0yMDA1MjYxMzIxNDFaFw0zMDA1MjUxMzIxNDFaMFUxCzAJ
BgNVBAYTAkRFMRcwFQYDVQQKDA5GcmF1bmhvZmVyIFNJVDEtMCsGA1UEAwwkVm9sa3N2ZXJz
Y2hsdWVzc2VsdW5nIFByaXZhdGUgQ0EgRzAyMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIIC
CgKCAgEAzW9OcLabPtfz9rbgtyyuNQCQkmI8cPW39VGsXLX1J9EIcUPvp1ysi6kuqMfw+YOC
LjxopSIhpjhH/p84LzmcBJElRPkzWHJreZry+Lu5SDhOcOH49fNEo7UeYE0wkSJNv+jLMWwU
H93dPaSNeRN/5/Peq6tcKTx0FflS2ZScP9OcPvXgp1c/bXYoRyiOGSVR8/+7qlwNuku2px6f
0c6XOKOwkyTeSghmQ8vdfeqcMd9fNUhn/ijWFHahr0LUGB9We6SoxklOz9gfgSCjhInt+4qy
N6bHl/utH/vj1qnuhkaP25h1eCbz2WKqv0wKWwa/r4F0ItLYYP2YhwICTNLDDT8GmctRdt2S
yLmgXo9Gz0nrwrYuGMWcXNLm682Fgg3wQne0DTszFFUU8PrVOtgzB5Qm6DPrRSUHXQEfT7DY
ZzDA+FmSoTSiCe+aoNPbglta4gDar0B/gni15LtCzW4tNhk3fXkYxEWpbq32vNy3wCDOQazc
vxzko5Ior1iDZJNuzurtp5qRjAnOcUiKhNUJeBnmLDB/Di9XZHIQCD0EjiZzef0OR4+ZbPPM
xl6n9KHdrZ2c8r3yjGJtGkeMc0aMkBpvYNDy/s4fYnE5MRIOWdmMnq23/DvCpsQtF5UWZlF9
MaKVcjXmtGpnhpe0XOkFXvxd9PSM0Oe4uei+buhbF7ECAwEAAaOCARIwggEOMBIGA1UdEwEB
/wQIMAYBAf8CAQAwHwYDVR0jBBgwFoAUPnwBB805qJCxODW0j7v1rBeEocAwTQYIKwYBBQUH
AQEEQTA/MD0GCCsGAQUFBzAChjFodHRwOi8vdm9sa3N2ZXJzY2hsdWVzc2VsdW5nLmRlL2Nh
L3Jvb3RjYV9nMDIuY3J0MBQGA1UdIAQNMAswCQYHKyQPCQMBATBDBgNVHR8EPDA6MDigNqA0
hjJodHRwOi8vdm9sa3N2ZXJzY2hsdWVzc2VsdW5nLmRlL2NybC9yb290Y2FfZzAyLmNybDAd
BgNVHQ4EFgQUBNGCAAc5XwIAgrw4HtCXwN3HOwMwDgYDVR0PAQH/BAQDAgEGMA0GCSqGSIb3
DQEBCwUAA4ICAQAPsI1fETAPUfq7LoI2FxRDylRduC/nVhVca7ORxhZXrFmksT/q1jHU4eXK
IhcVms623/FHhcVHl1qB5G/cgU2OtjEP5/BXIRu4I78EZIhb8U3ZGe9gZql/RSOBD08lhmzv
fRz+nwE2Pl9stzXKohjGRWyfFfuaWKLXUZzCK/wYX6IqhTxjkoEFSgejoO41B886rrm3+aaO
5Db5EBW4gYWF9VCV3bmedmTJzbvOOYDxaVT1+O8E9Ym5BZL+qJNjgdjJXE1TUGyUg6ZweNHT
dse6xTc9KhfnAyppkMUu9AKT6jkloA6l0/T3zEMKhvtf9gLYWJ0zMwm1JfQk5mVMZtQoOPYI
Wj7IVUKPZJMizHoaAAIzi7C0w3XpN3xMDJOs5eRsRPk0qF8UulshIUA/6idOrg7eUY4WZGN1
RZsFYyhBg1sPaeFyFAUs0XJUrWLOKO5f9VZGbmEF6gqbTxdwMCJZzonwpUxVwxKLMa+Z4EMG
QoY1rLNPCRZlzhW+TRBsuy4tGN21PlhvcvEnxs8eHvqlwfM/KwYtXhLG8881KMMSzemRvX/c
pNCU2YlHpAwpdm6cAn60leS0WPfTb6QAqmtQTij6uAfFN46hQDLqpfTWnoPSMvbeyFwqP6Fv
V6RgquAIpe9p5daLY9M+Krkd7mH8QR2PN615TboR0ocoF4REdTCCBlwwggREoAMCAQICCBUM
N0NLozG+MA0GCSqGSIb3DQEBCwUAMFUxCzAJBgNVBAYTAkRFMRcwFQYDVQQKDA5GcmF1bmhv
ZmVyIFNJVDEtMCsGA1UEAwwkVm9sa3N2ZXJzY2hsdWVzc2VsdW5nIFByaXZhdGUgQ0EgRzAy
MB4XDTIwMTAxMTE2NTIzN1oXDTIzMTAxMDE2NTIzN1owgYkxGDAWBgNVBAMMD0FMRVhBTkRF
UiBLT0JFTDEOMAwGA1UEBAwFS09CRUwxEjAQBgNVBCoMCUFMRVhBTkRFUjFJMEcGA1UEBRNA
RDQwMDNFMTc4OTlGMTQzMTI2ODExMzM0OUY1N0M1QzU0NEQ5RjcwNDVCQTkyMEJEMzdDQURB
NTQzOEFGQ0EzODCCAaIwDQYJKoZIhvcNAQEBBQADggGPADCCAYoCggGBAM9yNVKr/cuT0WnJ
PLe7kmfd5Wo7rlb1F+harCy3OLgaTqkMI6j37OTXMAmdkZ0y7zrlhbEGCEpODaDPYwVSEb+s
Cv05n3SAMCdy9kQlnqP9We7C/2mbnuKYhpO5P6mUVdPoM+tfTM22YH7CzO8sa1Tq1s/DrIZs
NhXDRvWZEdDwUCjLPKVXGtTqHbUjs7OufxpbyzA7xHE5N7qRff1WrOuq/RS1OvGZVcUjLAmI
loYCvYm1Q3oBYuSZygOsawjmJQ14fh7dKkOjogx6byElWAVBkUQxud8CtBHW+L4VY35uinRJ
k81mwI8ac0zS5FEbYWoF9Gi5pWbCgoIvGXIMcPEQqu8mVBpN/CAMUOUlIkOPDvFqfiQ9TI2C
xnNih8csWwVInRS7m8itJrnlbVfDwdHMJhPT522gCDOC6lXaRUizwGqRh/26W1dJqA2SYmEn
EMH/TcP3eyiFLN5QDXm2odnh+rbvQbwEtlPxup24HGe8RqWFdiCOW1syM+V74lUn5wIDAQAB
o4IBeTCCAXUwHQYDVR0RBBYwFIESYS1rb2JlbEBhLWtvYmVsLmRlMA4GA1UdDwEB/wQEAwIG
wDATBgNVHSUEDDAKBggrBgEFBQcDBDAMBgNVHRMBAf8EAjAAMB8GA1UdIwQYMBaAFATRggAH
OV8CAIK8OB7Ql8DdxzsDMIGCBggrBgEFBQcBAQR2MHQwQAYIKwYBBQUHMAKGNGh0dHA6Ly92
b2xrc3ZlcnNjaGx1ZXNzZWx1bmcuZGUvY2EvcHJpdmF0ZWNhX2cwMi5jcnQwMAYIKwYBBQUH
MAGGJGh0dHA6Ly9vY3NwLnZvbGtzdmVyc2NobHVlc3NlbHVuZy5kZTAUBgNVHSAEDTALMAkG
ByskDwkDAQEwRgYDVR0fBD8wPTA7oDmgN4Y1aHR0cDovL3ZvbGtzdmVyc2NobHVlc3NlbHVu
Zy5kZS9jcmwvcHJpdmF0ZWNhX2cwMi5jcmwwHQYDVR0OBBYEFDadSlBdeaipQdbmS4vn439F
6fkNMA0GCSqGSIb3DQEBCwUAA4ICAQBUhcmTTecspwaSgUUlrG/gUPzDLM/Ty0Jpz4GvRbRn
kJxHlHAopkk8P1SXlnOy2kfC5LgFCRB9tJqSlXmIXwphm90fZKRGZU2dBgxGkDQppXGH6PjJ
P52QAhvpztJDPEqfqkzcpKdkYuFg+KEzqZmsu8Mvy4rqCTRIAtOX5zHVFEIarp7YUMNhzGxg
eQakmDjykC1Xksx/ULsX7r5QW5Fqp1ZL5obNmA2emJgn0VrKRIYY8vqnOwUi13G/lDa+fphz
PMhpIKOKQ9Wy0Wn8mBdSdIqmt2L58Pu14ygwOkK3vnb/QKqayhwme2uf4waXG5or3wZdSr39
SvvGZT8Z6cHw6n7Jw0+gRApkB1cUO7j1T/aHCBcZPJ5i6bBoGrT5E8IHIqj+oZXUCY7jxknL
aHaiOARg8fFkf8lp3uy7ay4WcDIorPa9ugNaCP3SnYvtKvk44ulgMIjhvkG1Mga/70SA9Evq
3cFUle3jaaEYujSxLnN8LVm39dR93QCqcdkIayPA9LT6vizlGoA6BdOMWDzKWWnoelYTb+Ip
iqpafot50MCUqf1e2T0z8Ygki1LLOxlpi/DWQApb/Qq9EomeEYMKm0aJc7166pLiWsk1fWOX
kwBa3phG+CbbUxqotGP++r39Dk8Diny+lYjkRXpoqggzF9g9uxARXBIw0H+G6XbgCzCCBmgw
ggRQoAMCAQICCGRFBiAAmYjgMA0GCSqGSIb3DQEBCwUAMFUxCzAJBgNVBAYTAkRFMRcwFQYD
VQQKDA5GcmF1bmhvZmVyIFNJVDEtMCsGA1UEAwwkVm9sa3N2ZXJzY2hsdWVzc2VsdW5nIFBy
aXZhdGUgQ0EgRzAyMB4XDTIwMTAxMTE2NTIyM1oXDTIzMTAxMDE2NTIyM1owgYkxGDAWBgNV
BAMMD0FMRVhBTkRFUiBLT0JFTDEOMAwGA1UEBAwFS09CRUwxEjAQBgNVBCoMCUFMRVhBTkRF
UjFJMEcGA1UEBRNARDQwMDNFMTc4OTlGMTQzMTI2ODExMzM0OUY1N0M1QzU0NEQ5RjcwNDVC
QTkyMEJEMzdDQURBNTQzOEFGQ0EzODCCAaIwDQYJKoZIhvcNAQEBBQADggGPADCCAYoCggGB
AIHe4er7YlQrv+fgKBYbb2FSJLtzoB9s4ZhYgIfQuR1x9+WJvj9EMne5rsHB+OJ5bwZQ1Fnh
qhJhtepikZhLDRVfRbzRdrOSzxnkePhH/SZ9VhtN6327PuSAwxe/te/DPDo6aWZj3d7RoioE
UgkyF5gNWYu082LeSHbvNpDcHUN2Rs7XgZi5uBUnHR1btXA7BOzUMfPhEIqwuCDKLZAGCc0q
2JKhKeOIOsoZ8lP2/HfW3Az1ij6xztb/HfoZnyZMpQC1ly7VgJU5rTLRJz39kscZSBcnxRqP
8cE9rrlPZOgRPK2NR4x+30Sr9sOtnbRYldKWT4uCtqrPrnxNKiDkv3P2h1yKYbCamlqwaoJW
cjrphzLycSGHitalla/f82xHSN+7gJHGp91WYIn+c6jPLcx0wmKUJBB1TIEaeh4izkqLwB0P
1HUBHo50OdmTnRGdnvNt/+Xsc9KetVnmJM2bqXXDlgYMfsULoe6Y0AVemQFvd1V49GePGpGT
NGMe5jf7NwIDAQABo4IBhTCCAYEwHQYDVR0RBBYwFIESYS1rb2JlbEBhLWtvYmVsLmRlMA4G
A1UdDwEB/wQEAwIEMDAfBgNVHSUEGDAWBgorBgEEAYI3CgMEBggrBgEFBQcDBDAMBgNVHRMB
Af8EAjAAMB8GA1UdIwQYMBaAFATRggAHOV8CAIK8OB7Ql8DdxzsDMIGCBggrBgEFBQcBAQR2
MHQwQAYIKwYBBQUHMAKGNGh0dHA6Ly92b2xrc3ZlcnNjaGx1ZXNzZWx1bmcuZGUvY2EvcHJp
dmF0ZWNhX2cwMi5jcnQwMAYIKwYBBQUHMAGGJGh0dHA6Ly9vY3NwLnZvbGtzdmVyc2NobHVl
c3NlbHVuZy5kZTAUBgNVHSAEDTALMAkGByskDwkDAQEwRgYDVR0fBD8wPTA7oDmgN4Y1aHR0
cDovL3ZvbGtzdmVyc2NobHVlc3NlbHVuZy5kZS9jcmwvcHJpdmF0ZWNhX2cwMi5jcmwwHQYD
VR0OBBYEFJiKTcJJSCtBVQS6oS4OSO8QKEWBMA0GCSqGSIb3DQEBCwUAA4ICAQBfdnVpzlnO
JupsJfdYW9xyt3lSky85oA1qPichmW6UjrnIZdunQPJrCTTM+7wUqeqwlhbRmwUKgAPH/5fc
cOnyMulgbvc50VV+mBK4ph/1/fhom7zJYEfvKEpPWg5tGx3/Mp6YIVvuhRnZ7vmodMGXgj/f
1D7yHFJib/430e6pcD76DPaAFA1cVVp5FUP+b0fBzvgYjsgSwL2GTXXaNGEaLqBuhtmInBh/
y4X2ZEz8kw6B2P0GpQ8jg+5I1tNM6vf/KH2FxDj/ykmSsgtyrQAddEjrNQbaQAzXTtHAPui/
6/wbgYfLp05aH7PsLsKGdDS9yb8UaWfWgwFuFz3dLXSdI3YYhXB2QnASX5RV3ndnu9vwGmns
c6iu4C9+h0hFdcWMIEso5K/mV/kXO31xzw7JLU2y5Nk7XEgrXwqFuX4ZruqCfw3EXP1hYnmt
OtfAaSLzTdBS0GskGGnWAs12dJrL8FysZbtX5cgWMyT1nun8ksvSodVgQ+7BA5YHTwfHussP
nPBDabaHmlOUVBi3IYZvoJ90XwuuMvVqcYeEzvuGDrssZHY2pG9DqTeXfzmUdpTfMy7zwu5K
jBPKilDLTXJkrA5wlQpSihjSQG/UPLP+YDsrEuwwBC1DbcSn5KOyMXFpfxsoSegFzb0lxPRc
6sScLr/v96FwvwWpL54Fp9dr0TGCA80wggPJAgEBMGEwVTELMAkGA1UEBhMCREUxFzAVBgNV
BAoMDkZyYXVuaG9mZXIgU0lUMS0wKwYDVQQDDCRWb2xrc3ZlcnNjaGx1ZXNzZWx1bmcgUHJp
dmF0ZSBDQSBHMDICCBUMN0NLozG+MA0GCWCGSAFlAwQCAQUAoIIBvTAYBgkqhkiG9w0BCQMx
CwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yMTAyMTAyMzQ2MDFaMC8GCSqGSIb3DQEJ
BDEiBCCFHW9d9yj5Gih+B02xgqqvfMvb2inSD+og6V0qWQhuUDBsBgkqhkiG9w0BCQ8xXzBd
MAsGCWCGSAFlAwQBKjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCA
MA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0GCCqGSIb3DQMCAgEoMHAGCSsGAQQBgjcQBDFj
MGEwVTELMAkGA1UEBhMCREUxFzAVBgNVBAoMDkZyYXVuaG9mZXIgU0lUMS0wKwYDVQQDDCRW
b2xrc3ZlcnNjaGx1ZXNzZWx1bmcgUHJpdmF0ZSBDQSBHMDICCGRFBiAAmYjgMHIGCyqGSIb3
DQEJEAILMWOgYTBVMQswCQYDVQQGEwJERTEXMBUGA1UECgwORnJhdW5ob2ZlciBTSVQxLTAr
BgNVBAMMJFZvbGtzdmVyc2NobHVlc3NlbHVuZyBQcml2YXRlIENBIEcwMgIIZEUGIACZiOAw
DQYJKoZIhvcNAQEBBQAEggGAezECyZTewkOL1vxvj56ZwHOEkHoDY/B9pJ9zexnibKPZxSo+
w6IE+sMVyElWsRsdL0g4ML87OR21RysDUk/7feoUgtbRpRpQs2At+8bWEzZ+HMygQUT+KG5T
xqjGdC6zf54qG2veJD1+y/fwya5TaRj0p9reGPW9ZhKeY/YdBaMXLhwZCC3OGET3hXARRWFr
STfKMf0TqIXmNjcQOsXch3kjGBW53YyyvdbW9VZWDUnlCDoqonuUIY/4LCTJ6gZWzhpPrL2g
yB+FnbXeczfljq7akKg0oDBYgVUQbhck2ELfi1nil3fOqdoKU1rVAxSa7GAoTItQnWoyfbDC
2v+3t1skPQNTp1ZYEcYTjwkduvKsulKwMxNyrSvmMQ0g1vxQwbP9hgUuTSdPhusW51uBwStH
ergyQ7caDjrP84n9ABjVHYRjLQ1N/uMRudBo9AIcuceFQOPtOeOgZEGlPAeceSqUgpgP69AB
QH/CYIFycN063WPgTFS4bDx32d037Id7AAAAAAAA
--------------ms020305080907050405020109--
