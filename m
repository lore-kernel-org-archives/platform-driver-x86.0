Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793124294;
	b=kD5gi1AaWMIx2DaTJI4CGC+GMhLPfXzC5m9YbvKt0XTgXumOpUCBiF9+HaGFpvHAkLrs
	 pxrC/9psH6FqiSbytn8BwVLuBKMfPfpjRe9Bpp5iPFQeZ9XaC9muGip4lzIHB3CLV6q5C
	 UsjT/SMbEZcPyRsh6y3Whxyvj2tl7QNRX51+tlFS4Oer5EKUZVMA9Ceu/xU/AvzKxYF3d
	 Wxg7lI2AmDZ5a97y4OfV7iMAqmo8y83N1oof9LnOq0Adn6VxG8LT3pNoGU82AWkBUBy/S
	 LP69c2K3CtNpm2SCKeaH2+lhqMUeI4if35n5Lh/El+XcCAdW1bWR2QycR3gbg4c0mow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793124294;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Content-Type:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=h0FCmsyiiVgLuOQIBGV/kTxVQ+JYXdk4kyhKejHG2sU=;
	b=dzxPQjILBVvOjJrzS4KZaETbUCDWzYGrkhWKaFrHQSH4hbOTuN9hK8kTQlTYJSrHVBf6
	 lUENdgaJR1XBe+5fXTvf5XOPsIiFa019cYsZO4nga7eDp45Gh1APIg19fre9ewqnLDLNJ
	 FMEiEZD0xY5wH1e0RrttfCrhNCggcS8Ls4gxmepBAqKtMQvG3eoDtJqSGI8qBLbwkcLi4
	 uIf2bSgoTHnknML0vduZpRlnEZ7BSkDXN/EYtMrJExO2kB/9063xT+JkvCUOaGn/6HiG7
	 TDRpE2Pnq7nGAf1mseeSBOkKOQ2cQc21AO0g6MX+InIpAyEaAJRO8qfdDrbYlYZ9vNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=F6MLjx0H;
	arc=none smtp.remote-ip=212.227.15.15
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A15606A31F
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Oct 2026 18:04:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1A15606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=F6MLjx0H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1793124291; x=1793729091; i=w_armin@gmx.de;
	bh=h0FCmsyiiVgLuOQIBGV/kTxVQ+JYXdk4kyhKejHG2sU=;
	h=X-UI-Sender-Class:Content-Type:Message-ID:Date:MIME-Version:
	 Subject:From:To:Cc:References:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=F6MLjx0He3zpu+6WLvuqZbyzFc/+A4u4peGWMrq3T5YrTGCquJLEWno33wM12dhq
	 eHpLrlKCWlHD/0EyNJcNGFtosI/SoW6waRBQkSYZHMWOlN7J9EEKJjiacXJN3S0pf
	 tKEBA3UmeuciQB7VBp7jWW7At7bvvtvmvUJ5kFigcAAErVdvNyslgpDUjyH1igedT
	 9OimKqS8ICWswq8hDbgLBZwtzYJw8Hu2IoHoo6tK9G/0IuJGYA1UFYO2b01zuGRsS
	 BX89p0vZeFg80mA8RE/ihmt7Kt9Yh6JHR69XgscAWW5nbVQeMQw9lcdesZ0StI2tK
	 z/yJr2GE9SfErnPWkQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M4axg-1xNPQz0aAA-00Fdjk; Tue, 27
 Oct 2026 19:04:51 +0100
Content-Type: multipart/mixed; boundary="------------FMngD4mXJHrNLAm0hEr4xXt0"
Message-ID: <ba5c9e70-7454-47b1-a49f-e4c9a5bebde4@gmx.de>
Date: Tue, 27 Oct 2026 19:04:50 +0100
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: OptiPlex 7400 AIO HDMI-IN button requires WMI startup method
From: Armin Wolf <W_Armin@gmx.de>
To: Teodora <teolyub@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
References: <OOZENT.01UBB4ITK3LK2@gmail.com>
 <e0d0d6a5-105e-403d-876b-ab87f0f7e5bc@gmx.de> <GKEFNT.S9KM2CS7X855@gmail.com>
 <721a18ba-d35c-4376-9e16-07739979387c@gmx.de>
 <5bf98aa7-ed41-4711-bbac-82a03ae97b87@gmx.de>
Content-Language: en-US
In-Reply-To: <5bf98aa7-ed41-4711-bbac-82a03ae97b87@gmx.de>
X-Provags-ID: V03:K1:JdGeTEfNNdcBDTCtAT6+y6BYkt9CssSO4etS8IU+wSwQY8t4i2s
 TWStgrQJJNkGXrBO2ZUki1i0vrjEiOzFxqEf4VUY1tb3j+PO6Xyxyz0SWNdbzNwxMo5EXyw
 ZkxhBxukqESjsR84ZB36XbIGUuqCFs3MUg2TCB/AE7gkR5WFB6QAOTfO04kQHQLqmz7gWwL
 a3tUPpNyDplATudhbCWHQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YF27aw3nUT4=;cS74ULUE8S+HGjiblHVFzL3BXNq
 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
 3jxeiPHAjIstixB

This is a multi-part message in MIME format.
--------------FMngD4mXJHrNLAm0hEr4xXt0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Am 27.10.26 um 18:12 schrieb Armin Wolf:
> Am 24.10.26 um 21:14 schrieb Armin Wolf:
>> Am 24.10.26 um 21:09 schrieb Teodora:
>>> Hi Armin,
>>>
>>> Thanks for your response. Attached is the requested acpidump.
>>>
>>> Regarding the other methods on the same WMI interface:=20
>>> DellOSDService.exe appears to invoke=20
>>> AcpiOSD_WMBC_method::PegaOemNotificationStartUp. The companion=20
>>> MediaButtons.exe also has WMI execution paths for=20
>>> PegaOemNotificationBrightnessUP and=20
>>> PegaOemNotificationBrightnessDown. I did not find call paths for=20
>>> PegaOemNotificationStop, PegaOemNotificationRSVD1, or=20
>>> PegaOemNotificationRSVD2, however.
>>>
>>> There is also a separate AcpiOSD_WMBB_method interface used by=20
>>> DellOSDService.exe for a method named PegaOemReturnUBFR, but that=20
>>> appears to be a different WMI interface.
>>>
>>> I can boot back into Windows and retrieve the WmiMethodId qualifiers=
=20
>>> for all of the WMBC methods if that would be useful, but I have not=20
>>> done that yet.
>>>
>>> Thanks
>>
>> Thanks, but i do not think that this will be necessary, the ACPI=20
>> tables should already contain the necessary data. I will check=20
>> tomorrow and report back if i need any additional data from you.
>>
>> Armin Wolf
>=20
> I have written a experimental kernel patch based on your custom kernel=
=20
> module, check the attached zip file. Can you check if building and=20
> loading this kernel module correctly enables notifications? Please also=
=20
> check that unloading said module produces no warnings in dmesg.
>=20
> Thanks,
> Armin Wolf

Forgot to attach the zip file, sorry.

>=20
>>>
>>> On Sat, Oct 24 2026 at 20:52:25 +02:00:00, Armin Wolf=20
>>> <W_Armin@gmx.de> wrote:
>>>> Am 24.10.26 um 15:48 schrieb Teodora:
>>>>> Hi,
>>>>>
>>>>> I have a Dell OptiPlex 7400 All-in-One machine and have been=20
>>>>> =7Finvestigating why its physical HDMI-In/source button works under=
=20
>>>>> Windows =7Fbut not under Linux. I wanted to flag a potential=20
>>>>> solution, though I am =7Fnot a kernel developer but was hoping that=
=20
>>>>> perhaps this could help the =7Fcommunity.
>>>>>
>>>>> So, my system details are:
>>>>>
>>>>> - Dell OptiPlex 7400 All-in-One
>>>>> - Fedora 44
>>>>> - Kernel: 7.2.11-200.fc44.x86_64
>>>>> - dell-wmi-aio is present and loaded
>>>>>
>>>>> While investigating the Dell Windows OSD software, I found that the=
=20
>>>>> =7Fbutton generates a WMI event through Acpi_OSD_event, GUID:=20
>>>>> =7F02314822-307C-4F66-BF0E-48AEAEB26CC8. The GDat payload generated=
=20
>>>>> when =7Fpressing the source button begins 02 00 00 00 F2 DD which=20
>>>>> corresponds to =7Fevent/scancode 0xDDF2.
>>>>>
>>>>> More importantly, Dell's OSD service invokes another WMI method=20
>>>>> during =7Fstartup:
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Class: AcpiOSD_WMBC_method
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 GUID: 2D703EE8-36AC-4F88-BDB5-7556CE6B2946
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Method: PegaOemNotificationStartUp
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 WmiMethodId: 1
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Description: "Invoked by AP when system up.=
"
>>>>>
>>>>> Linux exposes this WMI interface on the machine, with=20
>>>>> instance_count =3D =7F1. I wrote a minimal test WMI driver which bin=
ds=20
>>>>> only to this GUID and =7Finvokes: wmidev_invoke_procedure(wdev, 0, 1=
,=20
>>>>> &input); using an empty =7Finput buffer.
>>>>>
>>>>> The result is reproducible: After a normal Linux boot, the HDMI/=20
>>>>> source =7Fbutton does not switch the display. Then loading the test=
=20
>>>>> driver invokes =7FWMI method 1 and the firmware reports success.=20
>>>>> Immediately after, the =7Fphysical source button works correctly and=
=20
>>>>> switches the panel to HDMI- =7FIn. The test module can then be=20
>>>>> unloaded and the physical button =7Fcontinues to work.
>>>>>
>>>>> After rebooting, the problem returns until method 1 is invoked=20
>>>>> again. =7FThis suggests that PegaOemNotificationStartUp is a one-sho=
t=20
>>>>> firmware =7Finitialization which Dell's Windows software performs at=
=20
>>>>> startup but =7FLinux currently does not.
>>>>
>>>> Interesting, can you share the output of acpidump?
>>>>
>>>>>
>>>>> Below I am sharing the small module I use as a workaround; this is=
=20
>>>>> =7Floaded once on boot.
>>>>>
>>>>> // SPDX-License-Identifier: GPL-2.0
>>>>>
>>>>> #include <linux/module.h>
>>>>> #include <linux/kernel.h>
>>>>> #include <linux/wmi.h>
>>>>>
>>>>> #define DELL_OSD_WMI_GUID "2D703EE8-36AC-4F88-BDB5-7556CE6B2946"
>>>>> #define DELL_OSD_STARTUP_METHOD 1
>>>>>
>>>>> static int dell_osd_probe(struct wmi_device *wdev, const void=20
>>>>> *context)
>>>>> {
>>>>> =C2=A0 struct wmi_buffer input =3D {
>>>>> =C2=A0=C2=A0 .length =3D 0,
>>>>> =C2=A0=C2=A0 .data =3D NULL,
>>>>> =C2=A0 };
>>>>>
>>>>> =C2=A0 u8 instances;
>>>>> =C2=A0 int ret;
>>>>>
>>>>> =C2=A0 (void)context;
>>>>>
>>>>> =C2=A0 instances =3D wmidev_instance_count(wdev);
>>>>>
>>>>> =C2=A0 dev_info(&wdev->dev,
>>>>> =C2=A0=C2=A0=C2=A0 "Dell OSD test: WMI device found, instance count =
=3D %u\n",
>>>>> =C2=A0=C2=A0=C2=A0 instances);
>>>>>
>>>>> =C2=A0 if (instances < 1) {
>>>>> =C2=A0=C2=A0 dev_err(&wdev->dev,
>>>>> =C2=A0=C2=A0=C2=A0 "Dell OSD test: no WMI instance 0 available\n");
>>>>> =C2=A0=C2=A0 return -ENODEV;
>>>>> =C2=A0 }
>>>>>
>>>>> =C2=A0 dev_info(&wdev->dev,
>>>>> =C2=A0=C2=A0=C2=A0 "Dell OSD test: calling PegaOemNotificationStartU=
p, method ID=20
>>>>> 1\n");
>>>>>
>>>>> =C2=A0 ret =3D wmidev_invoke_procedure(
>>>>> =C2=A0=C2=A0 wdev,
>>>>> =C2=A0=C2=A0 0,
>>>>> =C2=A0=C2=A0 DELL_OSD_STARTUP_METHOD,
>>>>> =C2=A0=C2=A0 &input
>>>>> =C2=A0 );
>>>>>
>>>>> =C2=A0 if (ret < 0) {
>>>>> =C2=A0=C2=A0 dev_err(&wdev->dev,
>>>>> =C2=A0=C2=A0=C2=A0 "Dell OSD test: startup method failed: %d\n",
>>>>> =C2=A0=C2=A0=C2=A0 ret);
>>>>> =C2=A0=C2=A0 return ret;
>>>>> =C2=A0 }
>>>>>
>>>>> =C2=A0 dev_info(&wdev->dev,
>>>>> =C2=A0=C2=A0=C2=A0 "Dell OSD test: startup method returned success\n=
");
>>>>>
>>>>> =C2=A0 return 0;
>>>>> }
>>>>>
>>>>> static const struct wmi_device_id dell_osd_id_table[] =3D {
>>>>> =C2=A0 {
>>>>> =C2=A0=C2=A0 .guid_string =3D DELL_OSD_WMI_GUID,
>>>>> =C2=A0 },
>>>>> =C2=A0 { }
>>>>> };
>>>>>
>>>>> MODULE_DEVICE_TABLE(wmi, dell_osd_id_table);
>>>>>
>>>>> static struct wmi_driver dell_osd_driver =3D {
>>>>> =C2=A0 .driver =3D {
>>>>> =C2=A0=C2=A0 .name =3D "dell-osd-wmi-test",
>>>>> =C2=A0 },
>>>>> =C2=A0 .id_table =3D dell_osd_id_table,
>>>>> =C2=A0 .probe =3D dell_osd_probe,
>>>>> =C2=A0 .no_singleton =3D true,
>>>>> };
>>>>>
>>>>> module_wmi_driver(dell_osd_driver);
>>>>>
>>>>> MODULE_AUTHOR("Dell OptiPlex 7400 AIO experimental test");
>>>>> MODULE_DESCRIPTION("Experimental Dell OSD WMI startup-method test");
>>>>> MODULE_LICENSE("GPL");
>>>>>
>>>>> I hope this would be useful as not having this function has been=20
>>>>> such a =7Fbugbear for me over the years, especially on a business=20
>>>>> machine.
>>>>>
>>>>> Thanks,
>>>>> Teodora
>>>>
>>>> Nice work, i will try to check if other devices expose the same=20
>>>> firmware interface. If yes then we can for sure have a small driver=
=20
>>>> initializing this during probe.
>>>>
>>>> Does the OEM software invoke any other methods on this WMI device?
>>>>
>>>> Thanks,
>>>> Armin Wolf
>>>>
>>>
>>
>>
>=20

--------------FMngD4mXJHrNLAm0hEr4xXt0
Content-Type: application/zip; name="dell-wmi-pega.zip"
Content-Disposition: attachment; filename="dell-wmi-pega.zip"
Content-Transfer-Encoding: base64

UEsDBBQAAAAAACeRW10AAAAAAAAAAAAAAAAOACAAZGVsbC13bWktcGVnYS91eAsAAQToAwAA
BOgDAABVVA0AB7va4GrV2uBqu9rgalBLAwQUAAgACACwkFtdAAAAAAAAAAAAAAAAHQAgAGRl
bGwtd21pLXBlZ2EvZGVsbC13bWktcGVnYS5jdXgLAAEE6AMAAAToAwAAVVQNAAfc2eBqCNrg
atzZ4GqtVm1z4jYQ/ox/xdaduTEMBo68XHqXZArYSTwlmOHl0k7b0ThYDh5kiZNlSJrJf+/K
JoEWk96HfgDLu8++PbuS3GzCeOj8avfjGeUptb2QchVHMZWf4XrYt9uNli2kzQJFpdGsGVCD
u1sPliiIhEwg5oo+yEDFggMKwKGMQYcx2+O2zymkVMY0baBd0zB+DGkUo3ApSZQoC39V+KU7
9foOufWdQefWBfMzmIAKBMd8xrKQwjmLefbYnDEa8GzZmF/uqUK6wvQPa5qhjFdUHgCQpcQq
FmXaBZWcsjJNIsKMlYZMWXBfJldPSySiRLFOYi1+Y2foXnfI9dRzKmbb+dQ6ct0z++i007OP
r87O7K7TPbE/nZyc9tzTbvun41PTMCjPEgiRebKkDwFJqJqLEJ6NiuP2+yT3N/An3pXX60w8
f0DGk85oMh1WKhfQemx9rL8D9F9R7cOo7si7vpkM3PGYoNMcffRdaMe/GxT448P4kTt2R19d
h3wsoCffAW0X0NO68fLFMFKF8znTo1qQhIQXRMV8JRbUSpXMZgq0uJgXqK1xUYdyXotH1UB+
dyzvsyiiEoMsMwUX8AwYuUQvMoUAVOlsJMWVUcEHWiBID2OR0yaWVeSBpdQ3YevwIQ+Bz8JV
HdL4LyoiixBGj9rVqvYdgaWdnkOralS0/0zy12gFDmqSphlTQEgkKbUW+r+KaRReG2GgAvTU
rMFkTmHjYRWwDLf0XGQshICtg6cU7inQb1nAQAlQCNWnw4Yoz9G7Ps9GhyRKkNkyszaRq/DD
xRuXb0narudvONGvrS/GyzsNXEpx/07/ZoKnClYiDqGGa0UfVd62Pe5Lx6Lw8f4WKmFbN5FK
aX3Q9valdoLSinkVxIyGmiYu8IR92p6hIgKsUKpsic0UCYW5UAuK3Cbxw1xpOKyFXPzBzeoO
NXkBW3LyKv9ZRzrPVCjW/BBB/x8X/iEi1oHku0zAf9CwybgodVtc0ci9MsheyXFIVHDP6O9/
6j1oVJ63p2kdBtN+H17qWvqiDwa8c6Z9lzjuV6/nkkmn23ct9FQ/4LO6PUp2M8mvln+ZbIR5
Co3dl0qDB9jgCzC1gY0GtjYw9Yg08mkm+p5AwHDkd10yHLlX7oh0xr8Nejcjf+BPxwjVNTRe
09pv2UahQbnLPUQu1WpJE7Ha17+2QUNe1++CuCBpzB8YVUIDkR2aH73FLUm2PFllPGliN73o
TCc3/sgyOzKJOdwJFsH5Hcnffn5IHhshvdST8da5cW/kDfUQWmb5l0fpl8qOiz62fjB2LRM/
drT4b1BLBwhSS7HqywMAABAJAABQSwMEFAAIAAgAx5BbXQAAAAAAAAAAAAAAABYAIABkZWxs
LXdtaS1wZWdhL01ha2VmaWxldXgLAAEE6AMAAAToAwAAVVQNAAcH2uBqB9rgagfa4GpzdvNx
dA+OT0nNydEtz83ULUhNT9TLV7CyVdB1cXF1CnXnyk/K0s1V0LZVQFPDxZWYk2PFxZmbmJ2q
oOusoJ+TmaSfm59SmpNarJ9QmpeYCxQuStBPKs3MSVHwtU0oKE9JUIAq4OJKzklNzCNZO1gX
FwBQSwcIZ79Q03IAAAC1AAAAUEsBAhQDFAAAAAAAJ5FbXQAAAAAAAAAAAAAAAA4AGAAAAAAA
AAAAAO1BAAAAAGRlbGwtd21pLXBlZ2EvdXgLAAEE6AMAAAToAwAAVVQFAAG72uBqUEsBAhQD
FAAIAAgAsJBbXVJLserLAwAAEAkAAB0AGAAAAAAAAAAAAKSBTAAAAGRlbGwtd21pLXBlZ2Ev
ZGVsbC13bWktcGVnYS5jdXgLAAEE6AMAAAToAwAAVVQFAAHc2eBqUEsBAhQDFAAIAAgAx5Bb
XWe/UNNyAAAAtQAAABYAGAAAAAAAAAAAAO2BggQAAGRlbGwtd21pLXBlZ2EvTWFrZWZpbGV1
eAsAAQToAwAABOgDAABVVAUAAQfa4GpQSwUGAAAAAAMAAwATAQAAWAUAAAAA

--------------FMngD4mXJHrNLAm0hEr4xXt0--
