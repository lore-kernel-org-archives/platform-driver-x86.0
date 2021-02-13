Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8DABC433DB
	for <platform-driver-x86@archiver.kernel.org>; Sat, 13 Feb 2021 15:06:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95CA164DCE
	for <platform-driver-x86@archiver.kernel.org>; Sat, 13 Feb 2021 15:06:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbhBMPGV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 13 Feb 2021 10:06:21 -0500
Received: from ganymed.uberspace.de ([185.26.156.242]:56934 "EHLO
        ganymed.uberspace.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbhBMPGS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 13 Feb 2021 10:06:18 -0500
Received: (qmail 28790 invoked from network); 13 Feb 2021 15:05:31 -0000
Received: from localhost (HELO localhost) (127.0.0.1)
  by ganymed.uberspace.de with SMTP; 13 Feb 2021 15:05:31 -0000
From:   Alexander Kobel <a-kobel@a-kobel.de>
Subject: Re: [External] Re: [PATCH] platform/x86: thinkpad_acpi: handle HKEY
 0x4012, 0x4013 events
To:     Hans de Goede <hdegoede@redhat.com>,
        Nitin Joshi1 <njoshi1@lenovo.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Mark Pearson <mpearson@lenovo.com>
References: <53abdd94-8df4-cc1c-84e9-221face6b07c@a-kobel.de>
 <9d133a27-751a-a436-d255-3dd4a7d411d8@redhat.com>
 <TY2PR03MB3645D33506D85E1EECD6DABA8C8F9@TY2PR03MB3645.apcprd03.prod.outlook.com>
 <0e85bd26-bf2f-734c-1334-15ad591ec811@redhat.com>
 <499bd1fb-159b-53b0-173e-90167a2d23fa@a-kobel.de>
 <7f40435e-4287-fc67-55d1-52ee41efcbf0@redhat.com>
 <dcd315d6-2aa6-a4ab-6346-d6b2199c2878@a-kobel.de>
 <9f1229ab-41d1-440a-5843-6a026bb418fb@redhat.com>
Message-ID: <07148bfc-726d-8267-f36f-9a5f19f6c434@a-kobel.de>
Date:   Sat, 13 Feb 2021 16:05:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <9f1229ab-41d1-440a-5843-6a026bb418fb@redhat.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256; boundary="------------ms070004010503030605040504"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This is a cryptographically signed message in MIME format.

--------------ms070004010503030605040504
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

On 2/12/21 12:51 AM, Hans de Goede wrote:
> Hi,
>=20
> On 2/12/21 12:07 AM, Alexander Kobel wrote:
>> Hi Hans,
>>
>> and thanks also for the source code review. I will address those valid=
 points once I know whether the patch might be accepted, see below.
>>
>>
>> On 2/11/21 5:24 PM, Hans de Goede wrote:
>>> Hi Alexander,
>>>
>>> On 2/10/21 6:51 PM, Alexander Kobel wrote:
>>>> <snip>>> Works like a charm.
>>>> I realized that the device also emits 0x60c0 (TP_HKEY_EV_TABLET_CHAN=
GED) when the keyboard cover is attached or detached, yet *not* when it's=
 folded. I don't quite get why I nevertheless receive only one notificati=
on to userspace according to acpi_listen, despite the fact that the 0x60c=
0 handler also calls tpacpi_input_send_tabletsw and hotkey_tablet_mode_no=
tify_change. Is there a deduplication behind the scenes?
>>>
>>> Yes the input subsystem layer will not send events when nothing has c=
hanged.
>>
>> I see, thanks for the confirmation.
>>
>>>> I also realized that intel_vbtn reports the change, too. Would it be=
 in order to modify intel_vbtn in a next step and blacklist this device t=
o avoid duplicates?
>>>
>>> Hmm, that is a bit of a problem I would prefer to avoid having to den=
y-list things in intel_vbtn.
>>
>> Agreed.
>>
>>> So do the 2 behave exactly the same? Also wrt when the kbd is folded =
behind the kbd. IOW
>>> are the 2 SW_TABLET_MODE reports fully in sync in all possible states=
:
>>>
>>> 1. Just the tablet
>>> 2. Tablet + keyboard attached, keyboard in use
>>> 3. Tablet + keyboard attached, keyboard folded away behind tablet=20
>>>
>>> ?
>>
>> They are in sync, at least as soon as the state changes and an event i=
s emitted. The only functional difference seems to be that thinkpad_acpi =
offers the sysfs entry hotkey_tablet_mode to read the current state, that=
's it.
>> This is nice after bootup or for scripts started at random time withou=
t the chance of observing state changes. E.g., I'd like to have autorotat=
ion triggered via the orientation sensor, but only if the device is in ta=
blet mode; so my autorotation handler would read that sysfs entry as the =
first thing. If there's no way to read the state, I have to resort to wat=
ching the state toggle and cache it for myself in userspace.
>> But perhaps intel-vbtn offers a similar interface for that purpose tha=
t I don't know?
>=20
> No, but you can query the switch state with the evtest util.

Ah! Great, thanks for the hint. This also reports the correct state with =
just intel-vbtn, so really no point in pursuing my patch (unless someone/=
me eventually bothers with other attachments).


>> I can almost work around that by checking for the existence of the "PR=
IMAX ThinkPad X1 Tablet Thin Keyboard Gen 2" input. But that's not a nice=
 workaround, and it doesn't detect the folding away (input is still regis=
tered, although the firmware doesn't send key presses anymore).
>>
>> So, indeed the benefit of my patch is rather minor. If that means it s=
hould be discarded, that's fine for me (I learned a lot while writing and=
 refining it, always nice). If someone can give me a hint on how to read =
intel-vbtn state one-shot, even better, then it'd be mostly obsolete.
>=20
> I was surprised that your device supports intel-vbtn, there might very =
well be other X1 tablet generations / models which support GTOP but not i=
ntel-vbtn...

We'll have the code in the archive for easy access, no problem.


>> What might be more interesting is the potential handling different att=
achable devices, such as the portable dock (I guess this is the "Pico Car=
tridge", since it comes with another battery). For this one, I would actu=
ally expect an SW_DOCK event, and via the GTOP queries, this could be det=
ected and distinguished from other attachment options. I assume intel-vbt=
n can't cover that case out-of-the-box.
>=20
> Right, that would be another case where having GTOP support would be he=
lpful.

It's on my watchlist for cheap finds on eBay, so this might happen at som=
e point.


>> Unfortunately, I don't have such a dock (yet), so that's just guessing=
=2E
>>
>>
>> Out of curiosity: is your ThinkPad 10 fully handled by intel-vbtn?
>=20
>=20
> I've the first generation ThinkPad 10 with a Bay Trail SoC. Not only do=
es it not have intel-vbtn support, it also does not have GTOP support.
>=20
> I just checked and currently thinkpad_acpi does not even load on my Thi=
nkPad 10. It does a "HKEY" device, but with a HID of LEN0168, where as th=
inkpad_acpi only binds to=20
> LEN0068 and LEN0268. I could make thinkpad_acpi bind, but it won't do a=
nything useful. I just checked and there is nothing useful in the whole L=
EN0168 HKEY device.

I see, thanks.

>>>> On the other hand, userspace should expect duplicate messages to som=
e degree and use a hysteresis approach anyway. Every now and then, the co=
ntact of the magnetic plug is not established perfectly on the first atte=
mpt. So perhaps not really an issue.
>>>
>>> The only userspace consumer of this which I know is mutter (part of g=
nome-shell) and it
>>> will just take the value from the last event. So if the 2 are always =
in sync then
>>> the event send by the second input-dev will essentially be a no-op si=
nce the value will
>>> be the same as the other event.
>>
>> Well, naturally another consumer is the acpi framework, e.g., acpi_lis=
ten or acpid. There, we have the possibility to install user-defined hand=
lers. The same holds for window manager handlers such as sway's bindswitc=
h tablet:{on,off,toggle} or, I presume, xbindkeys.
>>
>> IMHO all reasonable handlers are idempotent, but users can be arbitrar=
ily crazy. As mentioned, even if events are emitted exactly once on the s=
oftware side, non-idempotent behavior will still occasionally be buggy, b=
ecause the hardware connection is dodgy at times.
>>
>>> We do need to resolve the question of how to handle this before I can=
 merge the patch,
>>> atm I think that just having it reported twice is fine (as long as bo=
th reports are in
>>> sync).
>>
>> They are in sync, that much I can confirm. But as mentioned, if you re=
frain from integrating the patch, I'm fine with that.
>> In that case, we should probably just add a dummy handler for HKEYs 0x=
4012 and 0x4013 with comments towards intel-vbtn, to avoid the unknown HK=
EY warning cluttering the system log.
>=20
> Hmm, I'm honestly not sure what to do here...
>=20
> I guess we can always grab your patch from the archives if it turns out=
 to be useful on another device.
>=20
> And until then a dummy handler indeed is probably best.

I think so, too.

> Can you do a v2 of your original patch with:
>=20
> 1. A comment about SW_TABLET_MODE being handled by intel-vbtn
> 2. In that comment also put a link to this mailinglist discussion:
> https://lore.kernel.org/platform-driver-x86/38cb8265-1e30-d547-9e12-b4a=
e290be737@a-kobel.de/

Will be on the list in few minutes.

Note that I added send_acpi_ev=3Dfalse and ignore_acpi_ev=3Dtrue.  I gues=
s that's correct?
Also, I did not bother to add the pr_info.  Mostly because, after the con=
siderations of the week, I don't know whether the message should be "keyb=
oard cover attached" or "something attached".  Same for the names in the =
enum, too - it could be that "TP_HKEY_EV_ATTACH_SOMETHING" would be more =
apt, but I don't know when exactly the HKEY is sent.


Cheers,
Alex


--------------ms070004010503030605040504
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
CwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yMTAyMTMxNTA1MjlaMC8GCSqGSIb3DQEJ
BDEiBCD6tq+y/Jv2O62J/vufeQy0gAkpMMuAkCXnuiTq2YJIjjBsBgkqhkiG9w0BCQ8xXzBd
MAsGCWCGSAFlAwQBKjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCA
MA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0GCCqGSIb3DQMCAgEoMHAGCSsGAQQBgjcQBDFj
MGEwVTELMAkGA1UEBhMCREUxFzAVBgNVBAoMDkZyYXVuaG9mZXIgU0lUMS0wKwYDVQQDDCRW
b2xrc3ZlcnNjaGx1ZXNzZWx1bmcgUHJpdmF0ZSBDQSBHMDICCGRFBiAAmYjgMHIGCyqGSIb3
DQEJEAILMWOgYTBVMQswCQYDVQQGEwJERTEXMBUGA1UECgwORnJhdW5ob2ZlciBTSVQxLTAr
BgNVBAMMJFZvbGtzdmVyc2NobHVlc3NlbHVuZyBQcml2YXRlIENBIEcwMgIIZEUGIACZiOAw
DQYJKoZIhvcNAQEBBQAEggGAjpuadtJzSNhdaVJCwcJKkEHhy8A50rw7xVs0fztlk/p7P4UM
893HN4yUZqYy3yHkDCi4bfn1riP5jBju4uFkT98o6Q/9CRf7z4UPvITSdB3OxS3K0V5ammig
Asnr4M1L35+PloMgFrH9sI3dQAim57y1bTAUU8m4DURtVp2dO3v+C1omlRMdf2e4IvbSxge4
t/CWY9Juu7CeXQI2FgyYNQ2myW8EN6uMLs0s7fBYarWc64R1+x3NxsAe6qPGnPEGDXZ2Bm/e
oUaLWIWOolkdMWXQRbnDiWTljT6DPp2gx0wn4eJGtWtGry390ZesTlSNddTLmslozkVKXFwS
8pC7TI9NoBX74KBJCD2Qh932nbmOexLijLwC83vrudHYYg2+6J2sLnJfJN1DJhUkPRhfAa+V
0XJ9fAz9Jn9+QEMuJuQyzdDrbYGNv44r+cNUJWNgVuSL/RDssLxSt58xiLZ+B0UuHp9n9zSj
UTuR7LU3R09kSdMd7QY6ZmY3+x6W0MYgAAAAAAAA
--------------ms070004010503030605040504--
