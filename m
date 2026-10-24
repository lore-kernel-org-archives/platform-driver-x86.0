Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792867950;
	b=1kwUp33UXWMcQjA34Oi7bd5bqgEcSZM3yTt+139ccTPKKkXNSzTCpLCxJS4hd/RQM8gI
	 MA4xJ7gInz+pJ/E5DPxbSh4fQV9up4dE4uCpP+8vdzPYfxYRXiLQiRjwDeZCPPFKDVrMb
	 AkFJODrjnKqd6C0qhMkCz8ftaeJKd8pVfBWpF51/Khp4rttdK0MnxML0NU/phJ6XjJFMq
	 lsI/x860q8o2eyos1U/VEFfIfnnKZ1sDmcKj07ls/J6j2OKdWwhLkdd19CvRCR+c2mEaS
	 GtPiXbKXSFKZJ11krM/zP0mka3Oem0iyG+b3BkQfB2Uj4hA613CttMUnY9Xk0Hpr6lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792867950;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Provags-ID:
	 X-Spam-Flag:UI-OutboundReport;
	bh=qYdQ5+jFUOYVmPvX+w4jFo5RmSursn7nw6d0fv6FfFg=;
	b=uddP9E5mBK0/RM1b7ggKYF6hsKRcA6ZG0l6dskeLoXIu6fVf1ziydZpq2Jq8oYlMDHkL
	 d8J42s7Li/ys/b/WDP2Flbs/6zd9Kafg5RaGWcZYtdute1uSGgQEeFKC+VJVvdLdHxvKp
	 Dm+2vjFE48WX82xBx9Nt7l+D2tn2woq6CmFu8A5WLV6Yq/htZwobomRClNmV3NwxjkhKG
	 hpBjQKl95JBZUcxhDk53K4pNZ7lS3QK/ZextiXGh0u5Jtb+SHy9GBY5yAqksO85sat1xv
	 /4lv3FbD7Iwv1iXDUvx4F7jm0oxI/ckPnD2jo9YWCkmFRGz7YN+AHAtbZkbhyuNkSMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=fJpKBuAF;
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4D4606A31A
	for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 18:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B4D4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=fJpKBuAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1792867946; x=1793472746; i=w_armin@gmx.de;
	bh=qYdQ5+jFUOYVmPvX+w4jFo5RmSursn7nw6d0fv6FfFg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=fJpKBuAFcyBtsHOTrHiODS2emdnrFuhttC+U4iEax+1OHgnft9/naSYLQ2MSj60h
	 n4utsjnBmLvOiWU1rwiXlHqjkHOmXHwZx8C/NNIpRLXnAkShirqRwF5B0lq7O5NV9
	 YARgtWflBkJmJVlOOPMUhV5MymvcBog7kIyUQ1lTla8YkLcgV7qxlg9+ABDMwQ92P
	 DP0AByOGnVcu4HB+OrwQ6yKfy/jRTxv0e9QWFsTv0p8Sj4N7b4II1QAVN42IaYtJy
	 5w9xs7QVR1VpCAYpAvi16RRMyE2DbNirlsyuunmjgX5I1A51UAI3FDu4IZDAduskv
	 FRkFQEtZnzx0rRRyzg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N5VD8-1wWNJQ24ra-00s55Z; Sat, 24
 Oct 2026 20:52:26 +0200
Message-ID: <e0d0d6a5-105e-403d-876b-ab87f0f7e5bc@gmx.de>
Date: Sat, 24 Oct 2026 20:52:25 +0200
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
To: Teodora <teolyub@gmail.com>, platform-driver-x86@vger.kernel.org
References: <OOZENT.01UBB4ITK3LK2@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <OOZENT.01UBB4ITK3LK2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HjgUVqbuIseYDDZ6/X9bs55o3zunovXs45iqh8Gn8ostThPRCpq
 6OrXdQDDbKj3ci/oXAuJ73wxdblScB6/epWEg+fTh5MYO6YVDXu4HGWyzx+Jr3A5DqL7tKu
 8Iv4LI59JeuZFv78bCoCK/Cm6DM5SQypkBw2TpCzuPrwPIEYfUsbQtfpbqrzmCifcwmELFe
 4BQZa+4oTyC/YhoQQZLBA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:u7I5xvGSohI=;5BLsvFzuhgW2u4wma29JlLLbX7k
 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

Am 24.10.26 um 15:48 schrieb Teodora:
> Hi,
>=20
> I have a Dell OptiPlex 7400 All-in-One machine and have been=20
> investigating why its physical HDMI-In/source button works under Windows=
=20
> but not under Linux. I wanted to flag a potential solution, though I am=
=20
> not a kernel developer but was hoping that perhaps this could help the=
=20
> community.
>=20
> So, my system details are:
>=20
> - Dell OptiPlex 7400 All-in-One
> - Fedora 44
> - Kernel: 7.2.11-200.fc44.x86_64
> - dell-wmi-aio is present and loaded
>=20
> While investigating the Dell Windows OSD software, I found that the=20
> button generates a WMI event through Acpi_OSD_event, GUID:=20
> 02314822-307C-4F66-BF0E-48AEAEB26CC8. The GDat payload generated when=20
> pressing the source button begins 02 00 00 00 F2 DD which corresponds to=
=20
> event/scancode 0xDDF2.
>=20
> More importantly, Dell's OSD service invokes another WMI method during=
=20
> startup:
>=20
>  =C2=A0 =C2=A0 Class: AcpiOSD_WMBC_method
>  =C2=A0 =C2=A0 GUID: 2D703EE8-36AC-4F88-BDB5-7556CE6B2946
>=20
>  =C2=A0 =C2=A0 Method: PegaOemNotificationStartUp
>  =C2=A0 =C2=A0 WmiMethodId: 1
>  =C2=A0 =C2=A0 Description: "Invoked by AP when system up."
>=20
> Linux exposes this WMI interface on the machine, with instance_count =3D=
=20
> 1. I wrote a minimal test WMI driver which binds only to this GUID and=
=20
> invokes: wmidev_invoke_procedure(wdev, 0, 1, &input); using an empty=20
> input buffer.
>=20
> The result is reproducible: After a normal Linux boot, the HDMI/source=
=20
> button does not switch the display. Then loading the test driver invokes=
=20
> WMI method 1 and the firmware reports success. Immediately after, the=20
> physical source button works correctly and switches the panel to HDMI-=
=20
> In. The test module can then be unloaded and the physical button=20
> continues to work.
>=20
> After rebooting, the problem returns until method 1 is invoked again.=20
> This suggests that PegaOemNotificationStartUp is a one-shot firmware=20
> initialization which Dell's Windows software performs at startup but=20
> Linux currently does not.

Interesting, can you share the output of acpidump?

>=20
> Below I am sharing the small module I use as a workaround; this is=20
> loaded once on boot.
>=20
> // SPDX-License-Identifier: GPL-2.0
>=20
> #include <linux/module.h>
> #include <linux/kernel.h>
> #include <linux/wmi.h>
>=20
> #define DELL_OSD_WMI_GUID "2D703EE8-36AC-4F88-BDB5-7556CE6B2946"
> #define DELL_OSD_STARTUP_METHOD 1
>=20
> static int dell_osd_probe(struct wmi_device *wdev, const void *context)
> {
>  =C2=A0struct wmi_buffer input =3D {
>  =C2=A0 .length =3D 0,
>  =C2=A0 .data =3D NULL,
>  =C2=A0};
>=20
>  =C2=A0u8 instances;
>  =C2=A0int ret;
>=20
>  =C2=A0(void)context;
>=20
>  =C2=A0instances =3D wmidev_instance_count(wdev);
>=20
>  =C2=A0dev_info(&wdev->dev,
>  =C2=A0 =C2=A0"Dell OSD test: WMI device found, instance count =3D %u\n"=
,
>  =C2=A0 =C2=A0instances);
>=20
>  =C2=A0if (instances < 1) {
>  =C2=A0 dev_err(&wdev->dev,
>  =C2=A0 =C2=A0"Dell OSD test: no WMI instance 0 available\n");
>  =C2=A0 return -ENODEV;
>  =C2=A0}
>=20
>  =C2=A0dev_info(&wdev->dev,
>  =C2=A0 =C2=A0"Dell OSD test: calling PegaOemNotificationStartUp, method=
 ID 1\n");
>=20
>  =C2=A0ret =3D wmidev_invoke_procedure(
>  =C2=A0 wdev,
>  =C2=A0 0,
>  =C2=A0 DELL_OSD_STARTUP_METHOD,
>  =C2=A0 &input
>  =C2=A0);
>=20
>  =C2=A0if (ret < 0) {
>  =C2=A0 dev_err(&wdev->dev,
>  =C2=A0 =C2=A0"Dell OSD test: startup method failed: %d\n",
>  =C2=A0 =C2=A0ret);
>  =C2=A0 return ret;
>  =C2=A0}
>=20
>  =C2=A0dev_info(&wdev->dev,
>  =C2=A0 =C2=A0"Dell OSD test: startup method returned success\n");
>=20
>  =C2=A0return 0;
> }
>=20
> static const struct wmi_device_id dell_osd_id_table[] =3D {
>  =C2=A0{
>  =C2=A0 .guid_string =3D DELL_OSD_WMI_GUID,
>  =C2=A0},
>  =C2=A0{ }
> };
>=20
> MODULE_DEVICE_TABLE(wmi, dell_osd_id_table);
>=20
> static struct wmi_driver dell_osd_driver =3D {
>  =C2=A0.driver =3D {
>  =C2=A0 .name =3D "dell-osd-wmi-test",
>  =C2=A0},
>  =C2=A0.id_table =3D dell_osd_id_table,
>  =C2=A0.probe =3D dell_osd_probe,
>  =C2=A0.no_singleton =3D true,
> };
>=20
> module_wmi_driver(dell_osd_driver);
>=20
> MODULE_AUTHOR("Dell OptiPlex 7400 AIO experimental test");
> MODULE_DESCRIPTION("Experimental Dell OSD WMI startup-method test");
> MODULE_LICENSE("GPL");
>=20
> I hope this would be useful as not having this function has been such a=
=20
> bugbear for me over the years, especially on a business machine.
>=20
> Thanks,
> Teodora

Nice work, i will try to check if other devices expose the same firmware=
=20
interface. If yes then we can for sure have a small driver initializing=20
this during probe.

Does the OEM software invoke any other methods on this WMI device?

Thanks,
Armin Wolf

