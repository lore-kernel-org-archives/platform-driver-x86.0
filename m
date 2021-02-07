Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 761F8C433DB
	for <platform-driver-x86@archiver.kernel.org>; Sun,  7 Feb 2021 17:56:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E46064E27
	for <platform-driver-x86@archiver.kernel.org>; Sun,  7 Feb 2021 17:56:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbhBGR4c (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 7 Feb 2021 12:56:32 -0500
Received: from ganymed.uberspace.de ([185.26.156.242]:55696 "EHLO
        ganymed.uberspace.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbhBGR4c (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 7 Feb 2021 12:56:32 -0500
Received: (qmail 23895 invoked from network); 7 Feb 2021 17:55:46 -0000
Received: from localhost (HELO localhost) (127.0.0.1)
  by ganymed.uberspace.de with SMTP; 7 Feb 2021 17:55:46 -0000
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: handle HKEY 0x4012, 0x4013
 events
To:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Mark Pearson <mpearson@lenovo.com>,
        Nitin Joshi1 <njoshi1@lenovo.com>
References: <53abdd94-8df4-cc1c-84e9-221face6b07c@a-kobel.de>
 <9d133a27-751a-a436-d255-3dd4a7d411d8@redhat.com>
From:   Alexander Kobel <a-kobel@a-kobel.de>
Message-ID: <38cb8265-1e30-d547-9e12-b4ae290be737@a-kobel.de>
Date:   Sun, 7 Feb 2021 18:55:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <9d133a27-751a-a436-d255-3dd4a7d411d8@redhat.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256; boundary="------------ms030002080405070002020309"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This is a cryptographically signed message in MIME format.

--------------ms030002080405070002020309
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

On 2/7/21 6:10 PM, Hans de Goede wrote:
> Hi,
>=20
> On 2/7/21 5:34 PM, Alexander Kobel wrote:
>> Those events occur when a keyboard cover is attached to a ThinkPad
>> Tablet device.  Typically, they are used to switch from normal to tabl=
et
>> mode in userspace; e.g., to offer touch keyboard choices when focus go=
es
>> to a text box and no keyboard is attached, or to enable autorotation o=
f
>> the display according to the builtin orientation sensor.
>=20
> Thank you for your patch.

Thank you for your swift response.

>> No attempt is taken to emit an EV_SW event for SW_TABLET_MODE; this is=

>> left to userspace.
>=20
> I don't understand this part, in order for userspace to respond to thes=
e
> events the thinkpad_acpi driver needs to emit events for this; and emit=
ting
> SW_TABLET_MODE seems like it is the right thing to do.
>=20
> Why are you not doing this ?

Quite frankly, because I did not know how to, reliably.  (First ever
patch attempt to the kernel here, so I'd rather err on the safe side.)

There are a number of events (e.g., TP_HKEY_EV_HOTPLUG_DOCK) that do not
propagate to userspace, but only report a specific message.  I figured
it's better to have a meaningful entry in the log rather than just the
warning about an unknown event.
But on second thought: pretending to react, but not actually doing
something, isn't too valuable.

I'll go off and try to improve.

> Note that it is important to only advertise SW_TABLET_MODE functionalit=
y
> on devices where it actually works. Which might be challenging I guess.=
=2E.

Right.  I only have a two devices to test, one of them a classic laptop,
so any input is greatly appreciated.

> But we have contacts inside Lenovo now, so perhaps they can help.
>=20
> Mark, Nitin, is there a way for the thinkpad_acpi code to figure out
> if 0x4012 / 0x4013 events will be send by a device?
>=20
> Also is there a way to get the current state of the
> keyboard-cover being attached at boot or not ?

IIUC, tpacpi_input_send_tabletsw() will not work as-is on this device,
as it should do for TP_HKEY_EV_TABLET_TABLET on X41t-X61t; mostly,
because I'm not aware of a method to read the current state.
Nevertheless, at least emitting events on change should be doable.


Finally, I mentioned some open ends already on a post to ibm-acpi-devel
at https://sourceforge.net/p/ibm-acpi/mailman/message/37200082/; this
very question is among them.
I will start tackling the SW_TABLET_MODE event issue first, but if Mark
and Nitin can already hint about the keyboard shortcuts, it'd be highly
appreciated:


This [patch] is pretty much trivial and conservative, I assume.
However, it's not 100% clear to me whether emitting a EV_SW event for
SW_TABLET_MODE would be in order, as mentioned in the description.  If
so, I'd have a deeper look on how to do that, and perhaps require some
hand-holding.


Besides, the X1 Tablet has a few Fn+smth combos that are not working
currently, and instead report (in evtest):

Input driver version is 1.0.1
Input device ID: bus 0x3 vendor 0x17ef product 0x60a3 version 0x111
Input device name: "PRIMAX ThinkPad X1 Tablet Thin Keyboard Gen 2
Consumer Control"
type 4 (EV_MSC), code 4 (MSC_SCAN), value c0001
type 1 (EV_KEY), code 240 (KEY_UNKNOWN), value 1

Keys affected are Fn+Esc (Fn lock) and Fn+F7 - Fn+F12 (various settings
like radio/bluetooth on/off).

Also, the mute and micmute leds are not working, and Fn lock led and
function is unavailable.


I'd love to give those minor issues a shot, too, but I'm not sure where
to start.  Would this go via thinkpad_acpi or hid_lenovo [or hid_primax]?=



Cheers,
Alex


> Regards,
>=20
> Hans
>=20
>=20
>=20
>> So this patch is mainly to avoid warnings about
>> unknown and unhandled events, which are now reported as:
>>
>> * Event 0x4012: attached keyboard cover
>> * Event 0x4013: detached keyboard cover
>>
>> Tested as working on a ThinkPad X1 Tablet Gen 2, 20JCS00C00, and as
>> non-interfering with a ThinkPad X1 Carbon 7th, 20QESABM02 (normal
>> clamshell, so it does not have a keyboard cover).
>>
>> Signed-off-by: Alexander Kobel <a-kobel@a-kobel.de>
>> ---
>>  drivers/platform/x86/thinkpad_acpi.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x=
86/thinkpad_acpi.c
>> index c404706379d9..fd5322b5bbbd 100644
>> --- a/drivers/platform/x86/thinkpad_acpi.c
>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>> @@ -174,6 +174,8 @@ enum tpacpi_hkey_event_t {
>>                                                      or port replicato=
r */
>>         TP_HKEY_EV_HOTPLUG_UNDOCK       =3D 0x4011, /* undocked from h=
otplug
>>                                                      dock or port repl=
icator */
>> +       TP_HKEY_EV_KBD_COVER_ATTACH     =3D 0x4012, /* attached keyboa=
rd cover */
>> +       TP_HKEY_EV_KBD_COVER_DETACH     =3D 0x4013, /* detached keyboa=
rd cover */
>>
>>         /* User-interface events */
>>         TP_HKEY_EV_LID_CLOSE            =3D 0x5001, /* laptop lid clos=
ed */
>> @@ -3989,6 +3991,12 @@ static bool hotkey_notify_dockevent(const u32 h=
key,
>>         case TP_HKEY_EV_HOTPLUG_UNDOCK: /* undocked from port replicat=
or */
>>                 pr_info("undocked from hotplug port replicator\n");
>>                 return true;
>> +       case TP_HKEY_EV_KBD_COVER_ATTACH:
>> +               pr_info("attached keyboard cover\n");
>> +               return true;
>> +       case TP_HKEY_EV_KBD_COVER_DETACH:
>> +               pr_info("detached keyboard cover\n");
>> +               return true;
>>
>>         default:
>>                 return false;
>> --
>> 2.30.0
>>
>=20


--------------ms030002080405070002020309
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
CwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yMTAyMDcxNzU1NDVaMC8GCSqGSIb3DQEJ
BDEiBCA7mf3okPbuEqdAxrqMCbLVoWxnhZpCcKLRy4KNMk4btjBsBgkqhkiG9w0BCQ8xXzBd
MAsGCWCGSAFlAwQBKjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCA
MA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0GCCqGSIb3DQMCAgEoMHAGCSsGAQQBgjcQBDFj
MGEwVTELMAkGA1UEBhMCREUxFzAVBgNVBAoMDkZyYXVuaG9mZXIgU0lUMS0wKwYDVQQDDCRW
b2xrc3ZlcnNjaGx1ZXNzZWx1bmcgUHJpdmF0ZSBDQSBHMDICCGRFBiAAmYjgMHIGCyqGSIb3
DQEJEAILMWOgYTBVMQswCQYDVQQGEwJERTEXMBUGA1UECgwORnJhdW5ob2ZlciBTSVQxLTAr
BgNVBAMMJFZvbGtzdmVyc2NobHVlc3NlbHVuZyBQcml2YXRlIENBIEcwMgIIZEUGIACZiOAw
DQYJKoZIhvcNAQEBBQAEggGACptrk1dOhk9Q5dHfcgEP/9+rBlFM+8ExARPVCovqCUXPNjbE
JA3AlKWmralc6VI50TveARSVFUJOK8IF29gFm0Mm2qwa90VgvQBcKGRPQOgt98yNUxVcDDY4
b+unf2MFi5nWtcjHEwuZW5vzOznrdUT6AWEJCU+PTCRybjG+bBYmezkrg90eiOq3rYC5Vtk+
r3iU05b0BJ3RHxx9uZD8VWEnSrzokMM/FzAH/u60WmiCVtnJabT+napzASfgvf7cB5p7cgmf
q2qAfkSf95mjh1RhwlEg+JReZLg8b5DdsylKrz0K1ZX85iThAst6NVUWBF0zJxJU6wNN3qcy
L9cDuabEgCHOQ7phu/d/9UZYBmC3u4vzAthQ8JyAnEGceFceu51Y4BrMOuVGFHQ2wcqzOmS6
FrAIZSExhh9yjC/L8A19z99sUQ81Yb19J1RVeNkuoGCVrA1cJpoPJw7Hf3XppkZGtDbom9mh
bf7NZSa9aWildk1DA4VFY/TCi/OAwUR/AAAAAAAA
--------------ms030002080405070002020309--
