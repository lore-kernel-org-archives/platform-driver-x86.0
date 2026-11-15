Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794767996;
	b=KajDAHWvhZOPZlTjnA8ym861BmpswjyR3HxEceNkavk8hs2mLE2H++I85fedwe52cGpm
	 vkfOSR+CB5MwFSTq6oV9afe1frwrkOnVjUr55mKW4aELqTAL2ab5Hrejlr4Mo6IG7LtM/
	 hCrKd+BEAlPqX3cS4qRxxVRYy8A1w//Z2D6IKwBOBTUVKt3EQiall8SKoLlbSHYKOVsdI
	 RWutibXdP4s6M+6Gjkq24MHrz8+LRCB8Pv8BCoCkjaglTaUamk/kxB1BvaXfgG+Ay4NBh
	 KOch2eL+wH010uBCzvYTyHhRACUeYTT71jSkusvZBgObkQtunQ7xhu3yAR8P9S3kTXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794767996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:Subject:To:
	 Cc:Message-Id:In-Reply-To:References:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=DvcEs8+tNtMxEpIadS/DY+5fclfTzfrcUVt9TknWA/Q=;
	b=WxzS6sI9H06VXm50i6ZOLikpoBBjC/2qMitXHblJhTK4xndwI4KAMoI10XKSZHEuUYG9
	 I9dM+SJ23X70dQ3mz2OU0o52PRZOg9BauJK5b9Tf2TcIXjLR2geMEGcPCwdwqiMZCqk1R
	 I0L0gh2rTwOGoV75NT9kQHiDfVF5vt7auF99VVupWe4V5v6VG0DYXeSIVeaD29k4QmsQB
	 TBK/JK6vjpi5mXMk5cyrsawW48MhCOPDhm9qnjmfrr4stbvJz3MyLBGq6sd7txRe9W6ze
	 z/AnzWI/onmnzLJCtFBbBxD12Zl9JFQA9CX5Jf0gOWd9jsq6lIRGLnE2GPJqSo6r8nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WRiJAuHM;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A8F606A32F
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Nov 2026 18:39:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45A8F606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WRiJAuHM
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso19971335e9.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 15 Nov 2026 10:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794767995; x=1795372795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:cc:to:subject:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DvcEs8+tNtMxEpIadS/DY+5fclfTzfrcUVt9TknWA/Q=;
        b=WRiJAuHMQ1E6QPYIb4PG57LHrv587BdeLmWuPHwnV/zctscafk1l70dJIrm3LMmajp
         2pXoT6bA7KqdbbuP1101JU08/gshnx4p/1ntV3W/oSfVxJDJLDxK+4Zjn9hlYCCDyiE6
         twBSuC9YTcdVEIgxrOoWl7yZzssCPDnGPpRFdDYdQ0yguy28rLOF3bP8NpL559KOBE4G
         /zJOLKeLaqHqEG6og0x/eRU35Q55EBhEoFyCoWlsbqL5Y++BsmBlaqmSlGNKaI403pR1
         8MHClwHOCv7PboOIDtJ807gsaCcMJ6Jr/N3zhylQ8w3vVfnmd7rJIjLf7ukfytVky48F
         M8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794767995; x=1795372795;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:cc:to:subject:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DvcEs8+tNtMxEpIadS/DY+5fclfTzfrcUVt9TknWA/Q=;
        b=Rib2eHYxhkXMAweAUjUsQaA6LdU9v1l6cdts5v4Sn+S/LT8w2Sr5hQIIY2Hx3dbNzk
         OHTZBaS0wx7OlEBpFZi86BPtSSRIhIqV6fMBhI1yoDz76duXWf2c3DABvbxVwH3UDXwB
         jevsTNFUklU9I6lvEJbMX6dc3tmpmoWqdWZaFnYsoBpbsAOv9YKqo1OtAv08FKRCXCFK
         CCsI6XW2UAOxnesl99nRpCjSn38YGf5Y7bsKD+vf6wcqA9T0P6yNyJIZmevLJH6tZBbU
         T35cyb7rc6yXaXjCNj7cj0Ugn6j2rN3gJ6YFOOLYk7U3Xculqa0z4VdA4C1cOioQsj8z
         G4CA==
X-Gm-Message-State: APuU4Z8NwqO3bzI8C9ww2/XThe5fYYFMT/3y+LkESpKBDrAZixDzY7FK
	myq2yBNRt0/wI4fwFfZw2b0Vh8Kr+5YCeF61YvWl+677ELbnQjPatRPA0lO/x/xQ
X-Gm-Gg: AYBFou3Lc0/3VqQV0uBYuOIcy/Z/ZdTVPly2QqrNqZOJeDEMo+peBg6BNJExbdlnSGM
	aSd279dU9Ma8DQQfrbYSVQ58pAtLGTykI4wGjcMhpJGAwcif+oEsS/s9Tunfst8rTe/hb33tdFJ
	fXY+ZkmJEBsgi4jZkQkDj+y4p+oxy2ltMASQLoKuNq6tdrmSzZSKM1VuDVohnwwdXDazZN7seSt
	eQmbcOaKfDLjvEehOohAhWoLGfX8cndlRk8vU10RDyEbAalS0tWug8eOkPS1Pzf/52wgcWbybHU
	LXuiPfOe1S4fjFFbQ5nwW9Uo6veuHoTOwRGH8idkAFK3PrYq49ux2Q3fwh1aRtWMBNnJB1pUIGf
	ILMqjsNvnq8C0hxmqOBhVz86PFljaEI3DB/KvG9ozGOouLEXOVLAbQIiaHOT7JqlN198NraAcFR
	665CW15pJlB4N78xq5XaVCq/hVdrauMVIrGNRdrFC+bSO+BXRb7se2xNtE5FyakTOhFyCAQIGgu
	sSuVRbocDRb1/RwiYzR4zCXvcnjhQhzoTiTnoSW0qbV+EO6Oh/P3zk0fE6b1KWtfkjWkrVAWgDj
	K36hxNIbpVoLtIx22UzGPP13ejPHQer3ZKaNUQfZ6/2wfHoE74rQITA1SOlTJh7nTu+SOv3OvVz
	kguxVvY2l3u+Xc0xbCKo9N2a018NnlA==
X-Received: by 2002:a05:600c:3f0a:b0:4a4:3a2d:15da with SMTP id 5b1f17b1804b1-4bb55a702femr172797015e9.15.1794767994528;
        Sun, 15 Nov 2026 10:39:54 -0800 (PST)
Received: from ?IPv6:2a05:b100:188e:3c00:4d27:e94f:1af:364b? ([2a05:b100:188e:3c00:4d27:e94f:1af:364b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2842e6sm334651775e9.4.2026.11.15.10.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 10:39:54 -0800 (PST)
Date: Sun, 15 Nov 2026 18:39:48 +0000
From: Teodora <teolyub@gmail.com>
Subject: Re: OptiPlex 7400 AIO HDMI-IN button requires WMI startup method
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org
Message-Id: <CU3KOT.CWM5ZIG9MX4P1@gmail.com>
In-Reply-To: <F26BC6F5-2D62-4138-A29C-CD5D2C60F25A@gmail.com>
References: <ba5c9e70-7454-47b1-a49f-e4c9a5bebde4@gmx.de>
	<F26BC6F5-2D62-4138-A29C-CD5D2C60F25A@gmail.com>
X-Mailer: geary/46.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Armin,

Apologies for the delay in getting back to you. I finally had some time=20
to test your module, and have some good news.

I first disabled my original DKMS module and rebuilt the initramfs to=20
ensure it wasn't loaded during boot. After a clean boot without either=20
module, the HDMI/source button did not work. I built and signed your=20
module, then loaded it using insmod; the physical HDMI/source button=20
immediately started working. I unloaded your module using rmmod, which=20
completed without errors. The HDMI/source button continued working=20
after the module was unloaded.

The only warming message associated with your module was=20
"dell_wmi_pega: loading out-of-tree module taints kernel".

So the startup initialization works correctly on my hardware, and=20
module removal appears clean. The STOP method doesn't appear to reverse=20
HDMI switching, at least on this machine.

Thanks for working on this - happy to test any further revisions.

Teodora



On Tue, Oct 27 2026 at 20:57:36 +00:00:00, teolyub@gmail.com wrote:
> Got it, thanks! I am away at the moment but will test it on the=20
> weekend and get back to you as soon as I can.
>=20
>=20
>>  On 27 Oct 2026, at 18:04, Armin Wolf <W_Armin@gmx.de> wrote:
>>=20
>>  =EF=BB=BFAm 27.10.26 um 18:12 schrieb Armin Wolf:
>>>>  Am 24.10.26 um 21:14 schrieb Armin Wolf:
>>>>  Am 24.10.26 um 21:09 schrieb Teodora:
>>>>>  Hi Armin,
>>>>>=20
>>>>>  Thanks for your response. Attached is the requested acpidump.
>>>>>=20
>>>>>  Regarding the other methods on the same WMI interface:=20
>>>>> DellOSDService.exe appears to invoke=20
>>>>> AcpiOSD_WMBC_method::PegaOemNotificationStartUp. The companion=20
>>>>> MediaButtons.exe also has WMI execution paths for=20
>>>>> PegaOemNotificationBrightnessUP and=20
>>>>> PegaOemNotificationBrightnessDown. I did not find call paths for=20
>>>>> PegaOemNotificationStop, PegaOemNotificationRSVD1, or=20
>>>>> PegaOemNotificationRSVD2, however.
>>>>>=20
>>>>>  There is also a separate AcpiOSD_WMBB_method interface used by=20
>>>>> DellOSDService.exe for a method named PegaOemReturnUBFR, but that=20
>>>>> appears to be a different WMI interface.
>>>>>=20
>>>>>  I can boot back into Windows and retrieve the WmiMethodId=20
>>>>> qualifiers for all of the WMBC methods if that would be useful,=20
>>>>> but I have not done that yet.
>>>>>=20
>>>>>  Thanks
>>>>=20
>>>>  Thanks, but i do not think that this will be necessary, the ACPI=20
>>>> tables should already contain the necessary data. I will check=20
>>>> tomorrow and report back if i need any additional data from you.
>>>>=20
>>>>  Armin Wolf
>>>  I have written a experimental kernel patch based on your custom=20
>>> kernel module, check the attached zip file. Can you check if=20
>>> building and loading this kernel module correctly enables=20
>>> notifications? Please also check that unloading said module=20
>>> produces no warnings in dmesg.
>>>  Thanks,
>>>  Armin Wolf
>>=20
>>  Forgot to attach the zip file, sorry.
>>=20
>>>>>=20
>>>>>  On Sat, Oct 24 2026 at 20:52:25 +02:00:00, Armin Wolf=20
>>>>> <W_Armin@gmx.de> wrote:
>>>>>>  Am 24.10.26 um 15:48 schrieb Teodora:
>>>>>>>  Hi,
>>>>>>>=20
>>>>>>>  I have a Dell OptiPlex 7400 All-in-One machine and have been=20
>>>>>>> =7Finvestigating why its physical HDMI-In/source button works=20
>>>>>>> under Windows =7Fbut not under Linux. I wanted to flag a=20
>>>>>>> potential solution, though I am =7Fnot a kernel developer but was=20
>>>>>>> hoping that perhaps this could help the =7Fcommunity.
>>>>>>>=20
>>>>>>>  So, my system details are:
>>>>>>>=20
>>>>>>>  - Dell OptiPlex 7400 All-in-One
>>>>>>>  - Fedora 44
>>>>>>>  - Kernel: 7.2.11-200.fc44.x86_64
>>>>>>>  - dell-wmi-aio is present and loaded
>>>>>>>=20
>>>>>>>  While investigating the Dell Windows OSD software, I found=20
>>>>>>> that the =7Fbutton generates a WMI event through Acpi_OSD_event,=20
>>>>>>> GUID: =7F02314822-307C-4F66-BF0E-48AEAEB26CC8. The GDat payload=20
>>>>>>> generated when =7Fpressing the source button begins 02 00 00 00=20
>>>>>>> F2 DD which corresponds to =7Fevent/scancode 0xDDF2.
>>>>>>>=20
>>>>>>>  More importantly, Dell's OSD service invokes another WMI=20
>>>>>>> method during =7Fstartup:
>>>>>>>=20
>>>>>>>       Class: AcpiOSD_WMBC_method
>>>>>>>       GUID: 2D703EE8-36AC-4F88-BDB5-7556CE6B2946
>>>>>>>=20
>>>>>>>       Method: PegaOemNotificationStartUp
>>>>>>>       WmiMethodId: 1
>>>>>>>       Description: "Invoked by AP when system up."
>>>>>>>=20
>>>>>>>  Linux exposes this WMI interface on the machine, with=20
>>>>>>> instance_count =3D =7F1. I wrote a minimal test WMI driver which=20
>>>>>>> binds only to this GUID and =7Finvokes:=20
>>>>>>> wmidev_invoke_procedure(wdev, 0, 1, &input); using an empty=20
>>>>>>> =7Finput buffer.
>>>>>>>=20
>>>>>>>  The result is reproducible: After a normal Linux boot, the=20
>>>>>>> HDMI/ source =7Fbutton does not switch the display. Then loading=20
>>>>>>> the test driver invokes =7FWMI method 1 and the firmware reports=20
>>>>>>> success. Immediately after, the =7Fphysical source button works=20
>>>>>>> correctly and switches the panel to HDMI- =7FIn. The test module=20
>>>>>>> can then be unloaded and the physical button =7Fcontinues to work.
>>>>>>>=20
>>>>>>>  After rebooting, the problem returns until method 1 is invoked=20
>>>>>>> again. =7FThis suggests that PegaOemNotificationStartUp is a=20
>>>>>>> one-shot firmware =7Finitialization which Dell's Windows software=20
>>>>>>> performs at startup but =7FLinux currently does not.
>>>>>>=20
>>>>>>  Interesting, can you share the output of acpidump?
>>>>>>=20
>>>>>>>=20
>>>>>>>  Below I am sharing the small module I use as a workaround;=20
>>>>>>> this is =7Floaded once on boot.
>>>>>>>=20
>>>>>>>  // SPDX-License-Identifier: GPL-2.0
>>>>>>>=20
>>>>>>>  #include <linux/module.h>
>>>>>>>  #include <linux/kernel.h>
>>>>>>>  #include <linux/wmi.h>
>>>>>>>=20
>>>>>>>  #define DELL_OSD_WMI_GUID=20
>>>>>>> "2D703EE8-36AC-4F88-BDB5-7556CE6B2946"
>>>>>>>  #define DELL_OSD_STARTUP_METHOD 1
>>>>>>>=20
>>>>>>>  static int dell_osd_probe(struct wmi_device *wdev, const void=20
>>>>>>> *context)
>>>>>>>  {
>>>>>>>    struct wmi_buffer input =3D {
>>>>>>>     .length =3D 0,
>>>>>>>     .data =3D NULL,
>>>>>>>    };
>>>>>>>=20
>>>>>>>    u8 instances;
>>>>>>>    int ret;
>>>>>>>=20
>>>>>>>    (void)context;
>>>>>>>=20
>>>>>>>    instances =3D wmidev_instance_count(wdev);
>>>>>>>=20
>>>>>>>    dev_info(&wdev->dev,
>>>>>>>      "Dell OSD test: WMI device found, instance count =3D %u\n",
>>>>>>>      instances);
>>>>>>>=20
>>>>>>>    if (instances < 1) {
>>>>>>>     dev_err(&wdev->dev,
>>>>>>>      "Dell OSD test: no WMI instance 0 available\n");
>>>>>>>     return -ENODEV;
>>>>>>>    }
>>>>>>>=20
>>>>>>>    dev_info(&wdev->dev,
>>>>>>>      "Dell OSD test: calling PegaOemNotificationStartUp, method=20
>>>>>>> ID 1\n");
>>>>>>>=20
>>>>>>>    ret =3D wmidev_invoke_procedure(
>>>>>>>     wdev,
>>>>>>>     0,
>>>>>>>     DELL_OSD_STARTUP_METHOD,
>>>>>>>     &input
>>>>>>>    );
>>>>>>>=20
>>>>>>>    if (ret < 0) {
>>>>>>>     dev_err(&wdev->dev,
>>>>>>>      "Dell OSD test: startup method failed: %d\n",
>>>>>>>      ret);
>>>>>>>     return ret;
>>>>>>>    }
>>>>>>>=20
>>>>>>>    dev_info(&wdev->dev,
>>>>>>>      "Dell OSD test: startup method returned success\n");
>>>>>>>=20
>>>>>>>    return 0;
>>>>>>>  }
>>>>>>>=20
>>>>>>>  static const struct wmi_device_id dell_osd_id_table[] =3D {
>>>>>>>    {
>>>>>>>     .guid_string =3D DELL_OSD_WMI_GUID,
>>>>>>>    },
>>>>>>>    { }
>>>>>>>  };
>>>>>>>=20
>>>>>>>  MODULE_DEVICE_TABLE(wmi, dell_osd_id_table);
>>>>>>>=20
>>>>>>>  static struct wmi_driver dell_osd_driver =3D {
>>>>>>>    .driver =3D {
>>>>>>>     .name =3D "dell-osd-wmi-test",
>>>>>>>    },
>>>>>>>    .id_table =3D dell_osd_id_table,
>>>>>>>    .probe =3D dell_osd_probe,
>>>>>>>    .no_singleton =3D true,
>>>>>>>  };
>>>>>>>=20
>>>>>>>  module_wmi_driver(dell_osd_driver);
>>>>>>>=20
>>>>>>>  MODULE_AUTHOR("Dell OptiPlex 7400 AIO experimental test");
>>>>>>>  MODULE_DESCRIPTION("Experimental Dell OSD WMI startup-method=20
>>>>>>> test");
>>>>>>>  MODULE_LICENSE("GPL");
>>>>>>>=20
>>>>>>>  I hope this would be useful as not having this function has=20
>>>>>>> been such a =7Fbugbear for me over the years, especially on a=20
>>>>>>> business machine.
>>>>>>>=20
>>>>>>>  Thanks,
>>>>>>>  Teodora
>>>>>>=20
>>>>>>  Nice work, i will try to check if other devices expose the same=20
>>>>>> firmware interface. If yes then we can for sure have a small=20
>>>>>> driver initializing this during probe.
>>>>>>=20
>>>>>>  Does the OEM software invoke any other methods on this WMI=20
>>>>>> device?
>>>>>>=20
>>>>>>  Thanks,
>>>>>>  Armin Wolf
>>>>>>=20
>>>>>=20
>>>>=20
>>>>=20
>>  <dell-wmi-pega.zip>


