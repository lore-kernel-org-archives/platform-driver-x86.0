Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792869247;
	b=BK7sfugnopG0CwcbTo0JXD7t55BEXQOPMBfR3VAPPhZuSw2Mg9mqGeqdz7SKc3U99NQ6
	 VA+VpjaRdl19oRUugTMCIidnO7Jt3qMUVOBdO8sIAUg+nV6u5Uc2tcCbP+MzKFq9arWyj
	 67GtAnRMj3s5CmtS/IwmQsSXBnIt44TrRUtdFZXqSr2lh1ZAmChz2B8pXg/ehiwH0AXs0
	 grOU9WXEFD8/sxHCfvGzI0gpHAF0ooLIW6EC9OIDxOOQc8sO/FW6n0mjCpIhsXlemTfCu
	 D4gEdLyRcYSMAlpes3YTbhF3d/1vvjG2S0LSWhIy13W0tN6RsTexl0l38h98fH5q1sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792869247;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=tqSZiLaKdhPF/Oq7KF+pB6XSuRkyrezz5DzuKngzODM=;
	b=Q/QVoyXEgqgyXvEnJ6y2GSguPzD14xFiS3w6aQpgCINsOwnmHpEu+Q8on4ZQDXGhvFEq
	 TSzsDjHsGf5p3swWgOXHWj1MJQkUn3Q+0/izL87cpVaLC2nH9l/PCVEKPixKvvOm7ZQC0
	 ULPzCy5GPQs8ccMFz/NBGEX9PFtTpaxS7vP2QRip26LWKVLuswwWhjFZ+BqfXThiHBl8O
	 ZNMxgdkKrE+qsGDSYva8mr2KhRr7Sly6U5ZLjFvWwtQNYoCCzCCVYD2MR3SllhuqxxdRm
	 udetJzn1NP6T4rbPXz4zKACsWdElwzq4XzHurC4TsK4i9Bd1bgp2NS58VcfKRP47MoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b="R/Xc90I/";
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C68F606A31D
	for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 19:14:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C68F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=R/Xc90I/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1792869243; x=1793474043; i=w_armin@gmx.de;
	bh=tqSZiLaKdhPF/Oq7KF+pB6XSuRkyrezz5DzuKngzODM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=R/Xc90I/6oF3IhcnuL9RefM7XqMzYxFU7kI6SJIVi2HCt4eCeaNH15WK50yNDLfw
	 R4bGulaxQwhlebOb6YcSlXT9jJRmm5jQWEqjBpPNP9jv+9sCkTyCtsBqbWAsDWrdF
	 +Eb6DV9KLtP0K5siAGbDKTB9+GoHYBt9r/2D2YavsCMtx/NfY2h8UcJw0R7z8iP6D
	 HA8LK0PFqfai6CNMvhuATv786COUEP3Qx8EXK6TK/JjczeI4EKmojxgCOuwvacXkX
	 aLeVVM9Jae7+WaeIQVDsYo+pH7PzMjJcDguAdJC3nS1E01e7ZCnuLb8ADNqpmfFpr
	 99g14ll2FJtt2o7aSw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N1wll-1waTJa2Qhd-00zpmw; Sat, 24
 Oct 2026 21:14:03 +0200
Message-ID: <721a18ba-d35c-4376-9e16-07739979387c@gmx.de>
Date: Sat, 24 Oct 2026 21:14:02 +0200
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
To: Teodora <teolyub@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
References: <OOZENT.01UBB4ITK3LK2@gmail.com>
 <e0d0d6a5-105e-403d-876b-ab87f0f7e5bc@gmx.de> <GKEFNT.S9KM2CS7X855@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <GKEFNT.S9KM2CS7X855@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8JXyZ/4Va7+Fo6Ilumj6s3MELqOaUt1VzOdIMWW/z5nTToez9AD
 WgArPtC8OGDmKvceA8cM2gcDKitM4ih7LS2+24yhwBDk3yQYuoMOXiLoppZi707feuaemy/
 c/IkLkgS711vDV5NggoykyT5TAu1tKuXGZ/q4H6RMTz8gioHNWcDYGlN7BmHVP2DafKr7/C
 DrZUfwD9fEMat0cOVH0LA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:88JuLAVytwk=;2QgBwo4Z1T2X/mEB6W9CMpIp9Zb
 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
 ==

Am 24.10.26 um 21:09 schrieb Teodora:
> Hi Armin,
>=20
> Thanks for your response. Attached is the requested acpidump.
>=20
> Regarding the other methods on the same WMI interface:=20
> DellOSDService.exe appears to invoke=20
> AcpiOSD_WMBC_method::PegaOemNotificationStartUp. The companion=20
> MediaButtons.exe also has WMI execution paths for=20
> PegaOemNotificationBrightnessUP and PegaOemNotificationBrightnessDown. I=
=20
> did not find call paths for PegaOemNotificationStop,=20
> PegaOemNotificationRSVD1, or PegaOemNotificationRSVD2, however.
>=20
> There is also a separate AcpiOSD_WMBB_method interface used by=20
> DellOSDService.exe for a method named PegaOemReturnUBFR, but that=20
> appears to be a different WMI interface.
>=20
> I can boot back into Windows and retrieve the WmiMethodId qualifiers for=
=20
> all of the WMBC methods if that would be useful, but I have not done=20
> that yet.
>=20
> Thanks

Thanks, but i do not think that this will be necessary, the ACPI tables=20
should already contain the necessary data. I will check tomorrow and=20
report back if i need any additional data from you.

Armin Wolf

>=20
> On Sat, Oct 24 2026 at 20:52:25 +02:00:00, Armin Wolf <W_Armin@gmx.de>=
=20
> wrote:
>> Am 24.10.26 um 15:48 schrieb Teodora:
>>> Hi,
>>>
>>> I have a Dell OptiPlex 7400 All-in-One machine and have been=20
>>> =7Finvestigating why its physical HDMI-In/source button works under=20
>>> Windows =7Fbut not under Linux. I wanted to flag a potential solution,=
=20
>>> though I am =7Fnot a kernel developer but was hoping that perhaps this=
=20
>>> could help the =7Fcommunity.
>>>
>>> So, my system details are:
>>>
>>> - Dell OptiPlex 7400 All-in-One
>>> - Fedora 44
>>> - Kernel: 7.2.11-200.fc44.x86_64
>>> - dell-wmi-aio is present and loaded
>>>
>>> While investigating the Dell Windows OSD software, I found that the=20
>>> =7Fbutton generates a WMI event through Acpi_OSD_event, GUID:=20
>>> =7F02314822-307C-4F66-BF0E-48AEAEB26CC8. The GDat payload generated=20
>>> when =7Fpressing the source button begins 02 00 00 00 F2 DD which=20
>>> corresponds to =7Fevent/scancode 0xDDF2.
>>>
>>> More importantly, Dell's OSD service invokes another WMI method=20
>>> during =7Fstartup:
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0 Class: AcpiOSD_WMBC_method
>>> =C2=A0=C2=A0=C2=A0=C2=A0 GUID: 2D703EE8-36AC-4F88-BDB5-7556CE6B2946
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0 Method: PegaOemNotificationStartUp
>>> =C2=A0=C2=A0=C2=A0=C2=A0 WmiMethodId: 1
>>> =C2=A0=C2=A0=C2=A0=C2=A0 Description: "Invoked by AP when system up."
>>>
>>> Linux exposes this WMI interface on the machine, with instance_count=
=20
>>> =3D =7F1. I wrote a minimal test WMI driver which binds only to this G=
UID=20
>>> and =7Finvokes: wmidev_invoke_procedure(wdev, 0, 1, &input); using an=
=20
>>> empty =7Finput buffer.
>>>
>>> The result is reproducible: After a normal Linux boot, the HDMI/=20
>>> source =7Fbutton does not switch the display. Then loading the test=20
>>> driver invokes =7FWMI method 1 and the firmware reports success.=20
>>> Immediately after, the =7Fphysical source button works correctly and=
=20
>>> switches the panel to HDMI- =7FIn. The test module can then be unloade=
d=20
>>> and the physical button =7Fcontinues to work.
>>>
>>> After rebooting, the problem returns until method 1 is invoked again.=
=20
>>> =7FThis suggests that PegaOemNotificationStartUp is a one-shot firmwar=
e=20
>>> =7Finitialization which Dell's Windows software performs at startup bu=
t=20
>>> =7FLinux currently does not.
>>
>> Interesting, can you share the output of acpidump?
>>
>>>
>>> Below I am sharing the small module I use as a workaround; this is=20
>>> =7Floaded once on boot.
>>>
>>> // SPDX-License-Identifier: GPL-2.0
>>>
>>> #include <linux/module.h>
>>> #include <linux/kernel.h>
>>> #include <linux/wmi.h>
>>>
>>> #define DELL_OSD_WMI_GUID "2D703EE8-36AC-4F88-BDB5-7556CE6B2946"
>>> #define DELL_OSD_STARTUP_METHOD 1
>>>
>>> static int dell_osd_probe(struct wmi_device *wdev, const void *context=
)
>>> {
>>> =C2=A0 struct wmi_buffer input =3D {
>>> =C2=A0=C2=A0 .length =3D 0,
>>> =C2=A0=C2=A0 .data =3D NULL,
>>> =C2=A0 };
>>>
>>> =C2=A0 u8 instances;
>>> =C2=A0 int ret;
>>>
>>> =C2=A0 (void)context;
>>>
>>> =C2=A0 instances =3D wmidev_instance_count(wdev);
>>>
>>> =C2=A0 dev_info(&wdev->dev,
>>> =C2=A0=C2=A0=C2=A0 "Dell OSD test: WMI device found, instance count =
=3D %u\n",
>>> =C2=A0=C2=A0=C2=A0 instances);
>>>
>>> =C2=A0 if (instances < 1) {
>>> =C2=A0=C2=A0 dev_err(&wdev->dev,
>>> =C2=A0=C2=A0=C2=A0 "Dell OSD test: no WMI instance 0 available\n");
>>> =C2=A0=C2=A0 return -ENODEV;
>>> =C2=A0 }
>>>
>>> =C2=A0 dev_info(&wdev->dev,
>>> =C2=A0=C2=A0=C2=A0 "Dell OSD test: calling PegaOemNotificationStartUp,=
 method ID 1\n");
>>>
>>> =C2=A0 ret =3D wmidev_invoke_procedure(
>>> =C2=A0=C2=A0 wdev,
>>> =C2=A0=C2=A0 0,
>>> =C2=A0=C2=A0 DELL_OSD_STARTUP_METHOD,
>>> =C2=A0=C2=A0 &input
>>> =C2=A0 );
>>>
>>> =C2=A0 if (ret < 0) {
>>> =C2=A0=C2=A0 dev_err(&wdev->dev,
>>> =C2=A0=C2=A0=C2=A0 "Dell OSD test: startup method failed: %d\n",
>>> =C2=A0=C2=A0=C2=A0 ret);
>>> =C2=A0=C2=A0 return ret;
>>> =C2=A0 }
>>>
>>> =C2=A0 dev_info(&wdev->dev,
>>> =C2=A0=C2=A0=C2=A0 "Dell OSD test: startup method returned success\n")=
;
>>>
>>> =C2=A0 return 0;
>>> }
>>>
>>> static const struct wmi_device_id dell_osd_id_table[] =3D {
>>> =C2=A0 {
>>> =C2=A0=C2=A0 .guid_string =3D DELL_OSD_WMI_GUID,
>>> =C2=A0 },
>>> =C2=A0 { }
>>> };
>>>
>>> MODULE_DEVICE_TABLE(wmi, dell_osd_id_table);
>>>
>>> static struct wmi_driver dell_osd_driver =3D {
>>> =C2=A0 .driver =3D {
>>> =C2=A0=C2=A0 .name =3D "dell-osd-wmi-test",
>>> =C2=A0 },
>>> =C2=A0 .id_table =3D dell_osd_id_table,
>>> =C2=A0 .probe =3D dell_osd_probe,
>>> =C2=A0 .no_singleton =3D true,
>>> };
>>>
>>> module_wmi_driver(dell_osd_driver);
>>>
>>> MODULE_AUTHOR("Dell OptiPlex 7400 AIO experimental test");
>>> MODULE_DESCRIPTION("Experimental Dell OSD WMI startup-method test");
>>> MODULE_LICENSE("GPL");
>>>
>>> I hope this would be useful as not having this function has been such=
=20
>>> a =7Fbugbear for me over the years, especially on a business machine.
>>>
>>> Thanks,
>>> Teodora
>>
>> Nice work, i will try to check if other devices expose the same=20
>> firmware interface. If yes then we can for sure have a small driver=20
>> initializing this during probe.
>>
>> Does the OEM software invoke any other methods on this WMI device?
>>
>> Thanks,
>> Armin Wolf
>>
>=20

