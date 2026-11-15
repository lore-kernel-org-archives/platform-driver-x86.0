Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794785941;
	b=EloPpMZjc9O6eUlna1LMEI2XOa2DWhQ7YJrIaYY5GG5Vj2pXRju9NMYkjWOESpdpBYly
	 R5YYBsW2LIAm4Q+OJsjjUIU4OUW72tYEyTjZWKzgYwK0v+8GknbO9ehgpgldsg+uiP1rT
	 vwdeCtPYeWdyIG681H7wjp7+JL9ofpbNxLkFkg+67j1CwsBS4l3QvUp8HtR/BERlimkx5
	 6wU+kpi4galeJWQXPQBxT8fDR6wzeG4F0w7ZaPzZfFZzmG90HISpBbRNAW9dv+y+/K0sx
	 WJlFHDxQTusDfaCqq6bOJrGONYpzbaSATeTaCMf0HPRy1twWj4K7haPmwoU+KXAfPcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794785941;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=hvFz7CLPMIoBRJnpWjDK8whhkYM7A17nF2SBX6BHWNo=;
	b=bw4d3CBvD1axZwy+VmP47LMdV8JoJ96Q+7SzkJ0G0loi8+eUvY0/bsgYhzuQ2k0XRyDK
	 Xm3I3xHEVpbkB/pS0n7EgAoRliiL8InknD4dzhI+Uc8rvesSVFQXD3Q852I8MqLb5onf8
	 bl8Ba0By2TObaq94z5cennjiPs2YeaFau4UUuTjhBdQJo6J80QV8UqP0kcmu0Bqp5faUJ
	 84/z2+AewWqh5644UQwPCd6LoBwyGNuM0ryRFLoYssp8snn8bcKJQ8/pNaipRJC4GFZst
	 /rZ+64E5JBO/jFG4gHdkeS3c8TRNRR0WUR/OQjOCtEAvUtybzHGEE1t1dPCkQpV0C2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b="AoG9/Y/C";
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7C5606A323
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Nov 2026 23:38:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE7C5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=AoG9/Y/C
DKIM2-Signature:  i=1; m=1; t=1794785937;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:sqZ9ZKP4KOPVI3Q8h+6BruTwiJHt
   0qhgPY0LT7JmK9VxzIC22lm561CHllOpislWDFCNFYhBBBXOfdwHBUPbtxqtfaxk41Gsr5itn+R
   br3CFsq+VsKYMf3dGTSYgaY4HU4sXZdgfoilI4567zS6LqgFQiy1B0GJ9TbHmcMI2tNDFfLonii
   E5ZWoytqaR9C0YDyV9I7O8k2lXbgeD4W3HFOej+ybrEA5BQBCBrgxuFfKW1wswtDI6/PKtOo29M
   Cir9geC3sfA1EUyQagDkvAqUJEmCKSLvTHEz3zhfW9dIZjylcVBqjebBKkBn9JZ7qkrbmSKprdq
   ABxTFccfrJZzwQ==;
Message-Instance:  m=1;
 h=sha256:
   gnk20Lb7JupD+NXOW67JfX6DpcOI94nQu+GAue3wgGU=:
   hvFz7CLPMIoBRJnpWjDK8whhkYM7A17nF2SBX6BHWNo=,
  sha512:
   WPvu5lb5YaO0qVpOS3XbzIXZY5FUrFJs4QJSm3lx8Za59K4PTyBxSDTwjYDhF+kfslZmeArW0wrtuqTkp+D8mg==:
   xGrDfsCcBcfZ6reVDQVBK4hYNTS2Dy5q6SXtO8oR7cZ0ze0LXm0tBgsKQIQdMPHfbqzyfgOIG2AIU349at1cqw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1794785937; x=1795390737; i=w_armin@gmx.de;
	bh=hvFz7CLPMIoBRJnpWjDK8whhkYM7A17nF2SBX6BHWNo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=AoG9/Y/COVMS7UAXEWSlxQzneuXb8YemvYutGCd+Qt1yvqBTYFdaapHp8gpJM/1Y
	 doUfRA39wK43Or11f7G/sHUaP3A+XAyg0+swa3DAEKa5HjFB0+8fJXAZ58I4sUS+5
	 DH9Jb5AN08sR6UOBitnS30GmkFaQO/dMU4w/VGtGlrMKlDCbZHgMjcdA6UutqskYq
	 RAUi0Z9vWMfnnovaBNSxKW+sk37hNr9jV9/zWFdFO2XWkfnsuPoJT9zehsLQsY96y
	 l5B9shad0VeAiD8y9W+5+l96G5jPqbNZKnapEkGG4MoqxbVSooC3QlEBpVsxGxUnj
	 ZQEcDJdUYPWtcJB+WA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPokN-1x6Pb93qAl-00UGq6; Mon, 16
 Nov 2026 00:38:57 +0100
Message-ID: <ae50771b-ceda-4ae9-8474-1509e02da75f@gmx.de>
Date: Mon, 16 Nov 2026 00:38:55 +0100
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
References: <ba5c9e70-7454-47b1-a49f-e4c9a5bebde4@gmx.de>
 <F26BC6F5-2D62-4138-A29C-CD5D2C60F25A@gmail.com>
 <CU3KOT.CWM5ZIG9MX4P1@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CU3KOT.CWM5ZIG9MX4P1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Gs6jirrkoCpXtNHbmtfaZzo5YFyBMJ8KX55lO3oxAQnyRX5s2ge
 y935Qp3miF4AFwBgNuAVQZLkoU5nNKSoVPVFp4IYxkxBXIpBYb7BCBzvTzYxitAsx5Q+DHx
 KxGjFGr2bWOwm1J0HKkpF0voMq5Zl/HRK06G+/fLkne7YF6VBkItKphu0BxJJ1DKGKD1arY
 pEgBIBCI1X/CiIeChKhYA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:g0o700ttqf0=;X8GV2YCH7XLIIgeT/D7rOISGLiE
 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
 /zOns6Cfg==

Am 15.11.26 um 19:39 schrieb Teodora:

> Hi Armin,
>
> Apologies for the delay in getting back to you. I finally had some=20
> time to test your module, and have some good news.
>
> I first disabled my original DKMS module and rebuilt the initramfs to=20
> ensure it wasn't loaded during boot. After a clean boot without either=
=20
> module, the HDMI/source button did not work. I built and signed your=20
> module, then loaded it using insmod; the physical HDMI/source button=20
> immediately started working. I unloaded your module using rmmod, which=
=20
> completed without errors. The HDMI/source button continued working=20
> after the module was unloaded.
>
> The only warming message associated with your module was=20
> "dell_wmi_pega: loading out-of-tree module taints kernel".
>
> So the startup initialization works correctly on my hardware, and=20
> module removal appears clean. The STOP method doesn't appear to=20
> reverse HDMI switching, at least on this machine.
>
> Thanks for working on this - happy to test any further revisions.
>
> Teodora

Nice, i will prepare a patch then.

Thanks,
Armin Wolf

> On Tue, Oct 27 2026 at 20:57:36 +00:00:00, teolyub@gmail.com wrote:
>> Got it, thanks! I am away at the moment but will test it on the=20
>> weekend and get back to you as soon as I can.
>>
>>
>>> =C2=A0On 27 Oct 2026, at 18:04, Armin Wolf <W_Armin@gmx.de> wrote:
>>>
>>> =C2=A0=EF=BB=BFAm 27.10.26 um 18:12 schrieb Armin Wolf:
>>>>> =C2=A0Am 24.10.26 um 21:14 schrieb Armin Wolf:
>>>>> =C2=A0Am 24.10.26 um 21:09 schrieb Teodora:
>>>>>> =C2=A0Hi Armin,
>>>>>>
>>>>>> =C2=A0Thanks for your response. Attached is the requested acpidump.
>>>>>>
>>>>>> =C2=A0Regarding the other methods on the same WMI interface:=20
>>>>>> DellOSDService.exe appears to invoke=20
>>>>>> AcpiOSD_WMBC_method::PegaOemNotificationStartUp. The companion=20
>>>>>> MediaButtons.exe also has WMI execution paths for=20
>>>>>> PegaOemNotificationBrightnessUP and=20
>>>>>> PegaOemNotificationBrightnessDown. I did not find call paths for=20
>>>>>> PegaOemNotificationStop, PegaOemNotificationRSVD1, or=20
>>>>>> PegaOemNotificationRSVD2, however.
>>>>>>
>>>>>> =C2=A0There is also a separate AcpiOSD_WMBB_method interface used b=
y=20
>>>>>> DellOSDService.exe for a method named PegaOemReturnUBFR, but that=
=20
>>>>>> appears to be a different WMI interface.
>>>>>>
>>>>>> =C2=A0I can boot back into Windows and retrieve the WmiMethodId=20
>>>>>> qualifiers for all of the WMBC methods if that would be useful,=20
>>>>>> but I have not done that yet.
>>>>>>
>>>>>> =C2=A0Thanks
>>>>>
>>>>> =C2=A0Thanks, but i do not think that this will be necessary, the AC=
PI=20
>>>>> tables should already contain the necessary data. I will check=20
>>>>> tomorrow and report back if i need any additional data from you.
>>>>>
>>>>> =C2=A0Armin Wolf
>>>> =C2=A0I have written a experimental kernel patch based on your custom=
=20
>>>> kernel module, check the attached zip file. Can you check if=20
>>>> building and loading this kernel module correctly enables=20
>>>> notifications? Please also check that unloading said module=20
>>>> produces no warnings in dmesg.
>>>> =C2=A0Thanks,
>>>> =C2=A0Armin Wolf
>>>
>>> =C2=A0Forgot to attach the zip file, sorry.
>>>
>>>>>>
>>>>>> =C2=A0On Sat, Oct 24 2026 at 20:52:25 +02:00:00, Armin Wolf=20
>>>>>> <W_Armin@gmx.de> wrote:
>>>>>>> =C2=A0Am 24.10.26 um 15:48 schrieb Teodora:
>>>>>>>> =C2=A0Hi,
>>>>>>>>
>>>>>>>> =C2=A0I have a Dell OptiPlex 7400 All-in-One machine and have bee=
n=20
>>>>>>>> =7Finvestigating why its physical HDMI-In/source button works=20
>>>>>>>> under Windows =7Fbut not under Linux. I wanted to flag a=20
>>>>>>>> potential solution, though I am =7Fnot a kernel developer but was=
=20
>>>>>>>> hoping that perhaps this could help the =7Fcommunity.
>>>>>>>>
>>>>>>>> =C2=A0So, my system details are:
>>>>>>>>
>>>>>>>> =C2=A0- Dell OptiPlex 7400 All-in-One
>>>>>>>> =C2=A0- Fedora 44
>>>>>>>> =C2=A0- Kernel: 7.2.11-200.fc44.x86_64
>>>>>>>> =C2=A0- dell-wmi-aio is present and loaded
>>>>>>>>
>>>>>>>> =C2=A0While investigating the Dell Windows OSD software, I found=
=20
>>>>>>>> that the =7Fbutton generates a WMI event through Acpi_OSD_event,=
=20
>>>>>>>> GUID: =7F02314822-307C-4F66-BF0E-48AEAEB26CC8. The GDat payload=
=20
>>>>>>>> generated when =7Fpressing the source button begins 02 00 00 00=
=20
>>>>>>>> F2 DD which corresponds to =7Fevent/scancode 0xDDF2.
>>>>>>>>
>>>>>>>> =C2=A0More importantly, Dell's OSD service invokes another WMI=20
>>>>>>>> method during =7Fstartup:
>>>>>>>>
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Class: AcpiOSD_WMBC_method
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GUID: 2D703EE8-36AC-4F88-BDB5-7556=
CE6B2946
>>>>>>>>
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Method: PegaOemNotificationStartUp
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WmiMethodId: 1
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Description: "Invoked by AP when s=
ystem up."
>>>>>>>>
>>>>>>>> =C2=A0Linux exposes this WMI interface on the machine, with=20
>>>>>>>> instance_count =3D =7F1. I wrote a minimal test WMI driver which=
=20
>>>>>>>> binds only to this GUID and =7Finvokes:=20
>>>>>>>> wmidev_invoke_procedure(wdev, 0, 1, &input); using an empty=20
>>>>>>>> =7Finput buffer.
>>>>>>>>
>>>>>>>> =C2=A0The result is reproducible: After a normal Linux boot, the=
=20
>>>>>>>> HDMI/ source =7Fbutton does not switch the display. Then loading=
=20
>>>>>>>> the test driver invokes =7FWMI method 1 and the firmware reports=
=20
>>>>>>>> success. Immediately after, the =7Fphysical source button works=
=20
>>>>>>>> correctly and switches the panel to HDMI- =7FIn. The test module=
=20
>>>>>>>> can then be unloaded and the physical button =7Fcontinues to work=
.
>>>>>>>>
>>>>>>>> =C2=A0After rebooting, the problem returns until method 1 is invo=
ked=20
>>>>>>>> again. =7FThis suggests that PegaOemNotificationStartUp is a=20
>>>>>>>> one-shot firmware =7Finitialization which Dell's Windows software=
=20
>>>>>>>> performs at startup but =7FLinux currently does not.
>>>>>>>
>>>>>>> =C2=A0Interesting, can you share the output of acpidump?
>>>>>>>
>>>>>>>>
>>>>>>>> =C2=A0Below I am sharing the small module I use as a workaround;=
=20
>>>>>>>> this is =7Floaded once on boot.
>>>>>>>>
>>>>>>>> =C2=A0// SPDX-License-Identifier: GPL-2.0
>>>>>>>>
>>>>>>>> =C2=A0#include <linux/module.h>
>>>>>>>> =C2=A0#include <linux/kernel.h>
>>>>>>>> =C2=A0#include <linux/wmi.h>
>>>>>>>>
>>>>>>>> =C2=A0#define DELL_OSD_WMI_GUID "2D703EE8-36AC-4F88-BDB5-7556CE6B=
2946"
>>>>>>>> =C2=A0#define DELL_OSD_STARTUP_METHOD 1
>>>>>>>>
>>>>>>>> =C2=A0static int dell_osd_probe(struct wmi_device *wdev, const vo=
id=20
>>>>>>>> *context)
>>>>>>>> =C2=A0{
>>>>>>>> =C2=A0=C2=A0 struct wmi_buffer input =3D {
>>>>>>>> =C2=A0=C2=A0=C2=A0 .length =3D 0,
>>>>>>>> =C2=A0=C2=A0=C2=A0 .data =3D NULL,
>>>>>>>> =C2=A0=C2=A0 };
>>>>>>>>
>>>>>>>> =C2=A0=C2=A0 u8 instances;
>>>>>>>> =C2=A0=C2=A0 int ret;
>>>>>>>>
>>>>>>>> =C2=A0=C2=A0 (void)context;
>>>>>>>>
>>>>>>>> =C2=A0=C2=A0 instances =3D wmidev_instance_count(wdev);
>>>>>>>>
>>>>>>>> =C2=A0=C2=A0 dev_info(&wdev->dev,
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 "Dell OSD test: WMI device found, instan=
ce count =3D %u\n",
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 instances);
>>>>>>>>
>>>>>>>> =C2=A0=C2=A0 if (instances < 1) {
>>>>>>>> =C2=A0=C2=A0=C2=A0 dev_err(&wdev->dev,
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 "Dell OSD test: no WMI instance 0 availa=
ble\n");
>>>>>>>> =C2=A0=C2=A0=C2=A0 return -ENODEV;
>>>>>>>> =C2=A0=C2=A0 }
>>>>>>>>
>>>>>>>> =C2=A0=C2=A0 dev_info(&wdev->dev,
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 "Dell OSD test: calling PegaOemNotificat=
ionStartUp, method=20
>>>>>>>> ID 1\n");
>>>>>>>>
>>>>>>>> =C2=A0=C2=A0 ret =3D wmidev_invoke_procedure(
>>>>>>>> =C2=A0=C2=A0=C2=A0 wdev,
>>>>>>>> =C2=A0=C2=A0=C2=A0 0,
>>>>>>>> =C2=A0=C2=A0=C2=A0 DELL_OSD_STARTUP_METHOD,
>>>>>>>> =C2=A0=C2=A0=C2=A0 &input
>>>>>>>> =C2=A0=C2=A0 );
>>>>>>>>
>>>>>>>> =C2=A0=C2=A0 if (ret < 0) {
>>>>>>>> =C2=A0=C2=A0=C2=A0 dev_err(&wdev->dev,
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 "Dell OSD test: startup method failed: %=
d\n",
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 ret);
>>>>>>>> =C2=A0=C2=A0=C2=A0 return ret;
>>>>>>>> =C2=A0=C2=A0 }
>>>>>>>>
>>>>>>>> =C2=A0=C2=A0 dev_info(&wdev->dev,
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 "Dell OSD test: startup method returned =
success\n");
>>>>>>>>
>>>>>>>> =C2=A0=C2=A0 return 0;
>>>>>>>> =C2=A0}
>>>>>>>>
>>>>>>>> =C2=A0static const struct wmi_device_id dell_osd_id_table[] =3D {
>>>>>>>> =C2=A0=C2=A0 {
>>>>>>>> =C2=A0=C2=A0=C2=A0 .guid_string =3D DELL_OSD_WMI_GUID,
>>>>>>>> =C2=A0=C2=A0 },
>>>>>>>> =C2=A0=C2=A0 { }
>>>>>>>> =C2=A0};
>>>>>>>>
>>>>>>>> =C2=A0MODULE_DEVICE_TABLE(wmi, dell_osd_id_table);
>>>>>>>>
>>>>>>>> =C2=A0static struct wmi_driver dell_osd_driver =3D {
>>>>>>>> =C2=A0=C2=A0 .driver =3D {
>>>>>>>> =C2=A0=C2=A0=C2=A0 .name =3D "dell-osd-wmi-test",
>>>>>>>> =C2=A0=C2=A0 },
>>>>>>>> =C2=A0=C2=A0 .id_table =3D dell_osd_id_table,
>>>>>>>> =C2=A0=C2=A0 .probe =3D dell_osd_probe,
>>>>>>>> =C2=A0=C2=A0 .no_singleton =3D true,
>>>>>>>> =C2=A0};
>>>>>>>>
>>>>>>>> =C2=A0module_wmi_driver(dell_osd_driver);
>>>>>>>>
>>>>>>>> =C2=A0MODULE_AUTHOR("Dell OptiPlex 7400 AIO experimental test");
>>>>>>>> =C2=A0MODULE_DESCRIPTION("Experimental Dell OSD WMI startup-metho=
d=20
>>>>>>>> test");
>>>>>>>> =C2=A0MODULE_LICENSE("GPL");
>>>>>>>>
>>>>>>>> =C2=A0I hope this would be useful as not having this function has=
=20
>>>>>>>> been such a =7Fbugbear for me over the years, especially on a=20
>>>>>>>> business machine.
>>>>>>>>
>>>>>>>> =C2=A0Thanks,
>>>>>>>> =C2=A0Teodora
>>>>>>>
>>>>>>> =C2=A0Nice work, i will try to check if other devices expose the s=
ame=20
>>>>>>> firmware interface. If yes then we can for sure have a small=20
>>>>>>> driver initializing this during probe.
>>>>>>>
>>>>>>> =C2=A0Does the OEM software invoke any other methods on this WMI d=
evice?
>>>>>>>
>>>>>>> =C2=A0Thanks,
>>>>>>> =C2=A0Armin Wolf
>>>>>>>
>>>>>>
>>>>>
>>>>>
>>> =C2=A0<dell-wmi-pega.zip>
>
>
>
