Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793134669;
	b=5BM2qBsFwn0Bja3khnO7TTJ4xoYSfZFZKtnJY67EHtAMWPkBbKk38l6K8Od2RmRC90Af
	 lYlAmRsnXYza6k7XWpxuEvK/heH8RHmUhcNqjBvav5SPooSQyKbC/imwbFBZb4q4Udx6j
	 z0ybKodXcgWGhhtIn4/aCXPkMtUgs3jCUTYWgTYmdseMhZpxwftCcax+ik4rrOcQUtMkA
	 ODIjREI95p4QEVmgUvdeCgPwGDKlK436qPE1nFHN2QcwUYILNORkq+vp9hghQN2kxsIJd
	 ScsA9YH62c1pAKDAMzfiHd2YCWKV/vR11R3tfREQgm1revc0VE6UWE//HB0uOWDGifg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793134669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 Content-Transfer-Encoding:From:Mime-Version:Subject:Date:Message-Id:
	 References:Cc:In-Reply-To:To:X-Mailer;
	bh=NJuVm2kraehRgbOFyp7PhNR2mUwRQs3cgqifeShuECk=;
	b=u7f2s5mUghgXi5Vn4vDFlP6rNRkVLGe1APMCufzKS8YD5tcxShtIcrCDex82nYVCM0tG
	 oEW+Ba0MBuU6EcLzYya5nZtJvLOy3MesxrMKff5HAjSSDVTfcGFGjW+VZOmtjJ7zsVomd
	 1AK1j45Qa7MTyrlZvFnURO0XmO+E8Uc/T4IX2mZQ90ZSNHZdR9uZuNnR+GqWsPr2XT+Lp
	 2a1BVNMcoXyiFOBPYg+cdsO8EMDQx1To+5Wpdd/nybHNaGiYGTI/aMij8FIcFlP/+fHCe
	 GmgYfo5AxaA3Fe2ii/cLdgjMbf3kRJUI/jBE6scd3kMgw1lmxgFLU28vgWzOFl7PDxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ypx+ZiAm;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1C3606A31A
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Oct 2026 20:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F1C3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ypx+ZiAm
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so239804f8f.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Oct 2026 13:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793134667; x=1793739467; darn=vger.kernel.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NJuVm2kraehRgbOFyp7PhNR2mUwRQs3cgqifeShuECk=;
        b=Ypx+ZiAmfWVLatY+kajNOIaYMCd3bENcdXlAIFW5utQNunna0GQGi8eqk26tvU1Md/
         xGGfl29S1yS61HeHnn/lU8M3huXlXLtbKQJltspA3pqK3O5edKUn6wM/YwQFsMf9mKVY
         Ml5O9AJeYuRiX+41mXj6yiMt1QDB2xwzywRBUzQfKQWbgXXsbFAvsX1fkJJ8T+aCAe0S
         uCvjNe0Y09DzpSh3l6d6sWvq0VQoOC4D+LkhbN+SVU/RZV1ylJv+KhdZUmeDY3ckxpPW
         6XbdVmIq2aoghe5YA8HAAd9EP4/GlRDLDy+gKjm0XUW5ajtfaL6Mg+65iIZE/WLYCCWk
         fyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793134667; x=1793739467;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NJuVm2kraehRgbOFyp7PhNR2mUwRQs3cgqifeShuECk=;
        b=l90DWDTn/66BtwOF8uesEU167dgCeG0wP4T4Yxzdk9q4fZf1y4NZxCBqd4ynxVaN8h
         UvnctcnYE75yTc5/j7/drdQFilyD5BtRtqQTw18YBYX1jOQwh9v4w4fpiq3DmrkIq7j8
         koMVYKYMhd+uZ5XlxiRlLh91UykHDjqgc/kgM+5AFWLlUhUZEq8KSy65s5AyjHXOb4kC
         5o3BPzMMImb6O6GrA9O0dbBty+Kajn/25tpvZP4vrnh/rMltAE/IiR7har3j6wwn7uuD
         n2472CMZbTG0sS1VdPicUgoTuVXO+ikG3ou490KLgPgxyPBfoPmdCZGQDoy1oSVYsTI/
         3ORg==
X-Gm-Message-State: AFq9FYIZwioK7bnSb7qiud0W39SGU3WTi7OZxl3f0rYGxtbeCjUrEqUB
	w1lVR56vy3p8160EAKmhSu2W+pcYICMFXyyZbGIl99HymC7V0CvsczMXdJfxtw==
X-Gm-Gg: AYBFou3ZFSg4G9EddkvS3n2J1js7XffCbgQxzNbk1vTnCb58Mpp4ghjgSxTRvZUae5J
	zVYH418rI9jQOrKP+8w506Kj6wFNRS2OYu/89VjsCMs+3+KKQY8q80Ux4cNzL9kioFMf0AQEgXd
	kAQz5mvZyG8X8xFaRbora1/7eBf/wl8bxIfOpP12eaHKjo3gF1JKwnK6G60o98D4Mmwm59yh2uz
	S9UhLeky0gpkD+pO2k8KN1wN68jaySjI0PP473iEyBh7+VAzHCby4OfTva71Bd+glNjdrEzF+gB
	RnS3czzssulvOY2MoAoD72J1r8ZIQ7nO+DVEZmoP5MluhmiS2/QpBuXQpNPYRqakUsKKLfInV3i
	MCJgbRVBHAvAr7NokibzxWvRv3KzXyBOwn9CmojoLKolZ0QzaVEUXOp0ZC7dRUmBc78xVwZFUY/
	2Tm1u2a8IYAyR+rDpF1C4nhfVUxB/HzwvGwvou/F2GH7oia4RlTytd3H1kjVmNLyBTCs/xAlUJJ
	bu/3j23yS8WLRTqC1qspiAROpeI+5IyJkscLKV/L73KbLwWG55wELY5dVPalt8SL+Mnn368Fg/+
	DU0mXg3EbVC419KwOLvKDUHvDJDfXSYZbnML9831
X-Received: by 2002:a05:6000:2611:b0:48d:f99d:a0d3 with SMTP id ffacd0b85a97d-48e5d312a6dmr1732156f8f.46.1793134667270;
        Tue, 27 Oct 2026 13:57:47 -0700 (PDT)
Received: from smtpclient.apple ([2a05:b100:188e:3c00:7594:686e:6359:1c50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ece5e4asm24248515f8f.59.2026.10.27.13.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 13:57:46 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: teolyub@gmail.com
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (1.0)
Subject: Re: OptiPlex 7400 AIO HDMI-IN button requires WMI startup method
Date: Tue, 27 Oct 2026 20:57:36 +0000
Message-Id: <F26BC6F5-2D62-4138-A29C-CD5D2C60F25A@gmail.com>
References: <ba5c9e70-7454-47b1-a49f-e4c9a5bebde4@gmx.de>
Cc: platform-driver-x86@vger.kernel.org
In-Reply-To: <ba5c9e70-7454-47b1-a49f-e4c9a5bebde4@gmx.de>
To: Armin Wolf <W_Armin@gmx.de>
X-Mailer: iPhone Mail (24A446)

Got it, thanks! I am away at the moment but will test it on the weekend and g=
et back to you as soon as I can.


> On 27 Oct 2026, at 18:04, Armin Wolf <W_Armin@gmx.de> wrote:
>=20
> =EF=BB=BFAm 27.10.26 um 18:12 schrieb Armin Wolf:
>>> Am 24.10.26 um 21:14 schrieb Armin Wolf:
>>> Am 24.10.26 um 21:09 schrieb Teodora:
>>>> Hi Armin,
>>>>=20
>>>> Thanks for your response. Attached is the requested acpidump.
>>>>=20
>>>> Regarding the other methods on the same WMI interface: DellOSDService.e=
xe appears to invoke AcpiOSD_WMBC_method::PegaOemNotificationStartUp. The co=
mpanion MediaButtons.exe also has WMI execution paths for PegaOemNotificatio=
nBrightnessUP and PegaOemNotificationBrightnessDown. I did not find call pat=
hs for PegaOemNotificationStop, PegaOemNotificationRSVD1, or PegaOemNotifica=
tionRSVD2, however.
>>>>=20
>>>> There is also a separate AcpiOSD_WMBB_method interface used by DellOSDS=
ervice.exe for a method named PegaOemReturnUBFR, but that appears to be a di=
fferent WMI interface.
>>>>=20
>>>> I can boot back into Windows and retrieve the WmiMethodId qualifiers fo=
r all of the WMBC methods if that would be useful, but I have not done that y=
et.
>>>>=20
>>>> Thanks
>>>=20
>>> Thanks, but i do not think that this will be necessary, the ACPI tables s=
hould already contain the necessary data. I will check tomorrow and report b=
ack if i need any additional data from you.
>>>=20
>>> Armin Wolf
>> I have written a experimental kernel patch based on your custom kernel mo=
dule, check the attached zip file. Can you check if building and loading thi=
s kernel module correctly enables notifications? Please also check that unlo=
ading said module produces no warnings in dmesg.
>> Thanks,
>> Armin Wolf
>=20
> Forgot to attach the zip file, sorry.
>=20
>>>>=20
>>>> On Sat, Oct 24 2026 at 20:52:25 +02:00:00, Armin Wolf <W_Armin@gmx.de> w=
rote:
>>>>> Am 24.10.26 um 15:48 schrieb Teodora:
>>>>>> Hi,
>>>>>>=20
>>>>>> I have a Dell OptiPlex 7400 All-in-One machine and have been =7Finves=
tigating why its physical HDMI-In/source button works under Windows =7Fbut n=
ot under Linux. I wanted to flag a potential solution, though I am =7Fnot a k=
ernel developer but was hoping that perhaps this could help the =7Fcommunity=
.
>>>>>>=20
>>>>>> So, my system details are:
>>>>>>=20
>>>>>> - Dell OptiPlex 7400 All-in-One
>>>>>> - Fedora 44
>>>>>> - Kernel: 7.2.11-200.fc44.x86_64
>>>>>> - dell-wmi-aio is present and loaded
>>>>>>=20
>>>>>> While investigating the Dell Windows OSD software, I found that the =7F=
button generates a WMI event through Acpi_OSD_event, GUID: =7F02314822-307C-=
4F66-BF0E-48AEAEB26CC8. The GDat payload generated when =7Fpressing the sour=
ce button begins 02 00 00 00 F2 DD which corresponds to =7Fevent/scancode 0x=
DDF2.
>>>>>>=20
>>>>>> More importantly, Dell's OSD service invokes another WMI method durin=
g =7Fstartup:
>>>>>>=20
>>>>>>      Class: AcpiOSD_WMBC_method
>>>>>>      GUID: 2D703EE8-36AC-4F88-BDB5-7556CE6B2946
>>>>>>=20
>>>>>>      Method: PegaOemNotificationStartUp
>>>>>>      WmiMethodId: 1
>>>>>>      Description: "Invoked by AP when system up."
>>>>>>=20
>>>>>> Linux exposes this WMI interface on the machine, with instance_count =3D=
 =7F1. I wrote a minimal test WMI driver which binds only to this GUID and =7F=
invokes: wmidev_invoke_procedure(wdev, 0, 1, &input); using an empty =7Finpu=
t buffer.
>>>>>>=20
>>>>>> The result is reproducible: After a normal Linux boot, the HDMI/ sour=
ce =7Fbutton does not switch the display. Then loading the test driver invok=
es =7FWMI method 1 and the firmware reports success. Immediately after, the =7F=
physical source button works correctly and switches the panel to HDMI- =7FIn=
. The test module can then be unloaded and the physical button =7Fcontinues t=
o work.
>>>>>>=20
>>>>>> After rebooting, the problem returns until method 1 is invoked again.=
 =7FThis suggests that PegaOemNotificationStartUp is a one-shot firmware =7F=
initialization which Dell's Windows software performs at startup but =7FLinu=
x currently does not.
>>>>>=20
>>>>> Interesting, can you share the output of acpidump?
>>>>>=20
>>>>>>=20
>>>>>> Below I am sharing the small module I use as a workaround; this is =7F=
loaded once on boot.
>>>>>>=20
>>>>>> // SPDX-License-Identifier: GPL-2.0
>>>>>>=20
>>>>>> #include <linux/module.h>
>>>>>> #include <linux/kernel.h>
>>>>>> #include <linux/wmi.h>
>>>>>>=20
>>>>>> #define DELL_OSD_WMI_GUID "2D703EE8-36AC-4F88-BDB5-7556CE6B2946"
>>>>>> #define DELL_OSD_STARTUP_METHOD 1
>>>>>>=20
>>>>>> static int dell_osd_probe(struct wmi_device *wdev, const void *contex=
t)
>>>>>> {
>>>>>>   struct wmi_buffer input =3D {
>>>>>>    .length =3D 0,
>>>>>>    .data =3D NULL,
>>>>>>   };
>>>>>>=20
>>>>>>   u8 instances;
>>>>>>   int ret;
>>>>>>=20
>>>>>>   (void)context;
>>>>>>=20
>>>>>>   instances =3D wmidev_instance_count(wdev);
>>>>>>=20
>>>>>>   dev_info(&wdev->dev,
>>>>>>     "Dell OSD test: WMI device found, instance count =3D %u\n",
>>>>>>     instances);
>>>>>>=20
>>>>>>   if (instances < 1) {
>>>>>>    dev_err(&wdev->dev,
>>>>>>     "Dell OSD test: no WMI instance 0 available\n");
>>>>>>    return -ENODEV;
>>>>>>   }
>>>>>>=20
>>>>>>   dev_info(&wdev->dev,
>>>>>>     "Dell OSD test: calling PegaOemNotificationStartUp, method ID 1\n=
");
>>>>>>=20
>>>>>>   ret =3D wmidev_invoke_procedure(
>>>>>>    wdev,
>>>>>>    0,
>>>>>>    DELL_OSD_STARTUP_METHOD,
>>>>>>    &input
>>>>>>   );
>>>>>>=20
>>>>>>   if (ret < 0) {
>>>>>>    dev_err(&wdev->dev,
>>>>>>     "Dell OSD test: startup method failed: %d\n",
>>>>>>     ret);
>>>>>>    return ret;
>>>>>>   }
>>>>>>=20
>>>>>>   dev_info(&wdev->dev,
>>>>>>     "Dell OSD test: startup method returned success\n");
>>>>>>=20
>>>>>>   return 0;
>>>>>> }
>>>>>>=20
>>>>>> static const struct wmi_device_id dell_osd_id_table[] =3D {
>>>>>>   {
>>>>>>    .guid_string =3D DELL_OSD_WMI_GUID,
>>>>>>   },
>>>>>>   { }
>>>>>> };
>>>>>>=20
>>>>>> MODULE_DEVICE_TABLE(wmi, dell_osd_id_table);
>>>>>>=20
>>>>>> static struct wmi_driver dell_osd_driver =3D {
>>>>>>   .driver =3D {
>>>>>>    .name =3D "dell-osd-wmi-test",
>>>>>>   },
>>>>>>   .id_table =3D dell_osd_id_table,
>>>>>>   .probe =3D dell_osd_probe,
>>>>>>   .no_singleton =3D true,
>>>>>> };
>>>>>>=20
>>>>>> module_wmi_driver(dell_osd_driver);
>>>>>>=20
>>>>>> MODULE_AUTHOR("Dell OptiPlex 7400 AIO experimental test");
>>>>>> MODULE_DESCRIPTION("Experimental Dell OSD WMI startup-method test");
>>>>>> MODULE_LICENSE("GPL");
>>>>>>=20
>>>>>> I hope this would be useful as not having this function has been such=
 a =7Fbugbear for me over the years, especially on a business machine.
>>>>>>=20
>>>>>> Thanks,
>>>>>> Teodora
>>>>>=20
>>>>> Nice work, i will try to check if other devices expose the same firmwa=
re interface. If yes then we can for sure have a small driver initializing t=
his during probe.
>>>>>=20
>>>>> Does the OEM software invoke any other methods on this WMI device?
>>>>>=20
>>>>> Thanks,
>>>>> Armin Wolf
>>>>>=20
>>>>=20
>>>=20
>>>=20
> <dell-wmi-pega.zip>
