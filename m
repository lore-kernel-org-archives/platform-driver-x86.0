Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D008533A9EB
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 May 2026 09:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777974781; cv=none; b=TN+eBPXMbiFtJSqQ+yDMIF6QAmVnQ64tVR86YCx6W0BRNFSgmVy2Llvyd42iggx2PpsGr/WJs/JDKUtsXmtiN93R/vlqWPYgxDXP02Be/uOih6Ytlm36kIGlry0rSe1OvzOOHGHcI5jPEqKZvy0k845gNfFooLTA54jzFQLpI/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777974781; c=relaxed/simple;
	bh=4iPppo2ySxxvyZPF9M4kzFa3748LIB8tWCe9fhXp9sE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=W755/JWXmPjMho3vDqrn9sphdYJy6jPsw0I4RKPKD2DX6nbfi7XY84sl8vGbjVejtS1FLrntnMmh+75hN9p7udAHhnmcxXa7nf96DHNfNvildsDb8SxMNA465gHfc4lmrLwp1KJzYlHmZcLomVVBjk8NWhxgrUy5/MV4RMIlbpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b0qZ3ilX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NbOYcNxT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b0qZ3ilX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NbOYcNxT"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64595YUe4028241
	for <platform-driver-x86@vger.kernel.org>; Tue, 5 May 2026 09:52:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4iPppo2ySxxvyZPF9M4kzF
	a3748LIB8tWCe9fhXp9sE=; b=b0qZ3ilXaGU5mRLT6Ywli/N8RTUNj0yFQSRw/S
	B/dhR18t8n6BLOI3y4bzXQJBI70T0Op0Ga4OMPHJXTVkYvgAp+cKHMOOvJfxMLfO
	SwVViBlA9dP4c17Y/Uc2mQIPc1Q+0AAFsiUkPnh3h1Q9wFJfaZDGRlvD99egwPqL
	X0glxxScCvQghPnL8fzoE4R4UDF5vQJQtdlxF5M2Ee4+HfN2uRjaa5+zR7N96lO7
	LTL6oYVEtAxHg/LN4zJE/03d7PUEBGiUsaYNg66LWKttT0n4huuHucasS2SpN5fe
	7J/FZRfIFaotQbSDWBa570Rz/P16SZje/6vFARLKXHBUYQ5g==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dydm6r5nu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 05 May 2026 09:52:58 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56b6751339fso12253708e0c.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 May 2026 02:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777974777; x=1778579577; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4iPppo2ySxxvyZPF9M4kzFa3748LIB8tWCe9fhXp9sE=;
        b=NbOYcNxTOsJ9bDwzrGyGlr1ElR4/FEvTZqYSHavdyYwQ+qsU2ajUyP3JlXOyq4K/t0
         iC36Xn7Te9dx4qrn3VD0GoifAuisxIukQVauETGtIhQ7P6h5WgFGBdXVg468FGSUJOls
         hud/5DJdjMfP7b+2X+DFTshOOekiD9CzGA2CNVwNYaN27ovjtB8Z13/6unliOo1WAnkx
         VYZHsdGsw9DIu+gHNhrV/PvWSxWyt7Ql1oaeI35z3FvmeSsZDTRAEZrU7/o50T2Fli+X
         C9nZugMskkHPfNh+l4P4fX97VPsc4DTS08hUjWnDCLKXbq3F2k0N950NQptRXE5mvoud
         W20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777974777; x=1778579577;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4iPppo2ySxxvyZPF9M4kzFa3748LIB8tWCe9fhXp9sE=;
        b=U/4laj4UKDIaTVa8fV/DGhdENNxt/9t3Xn9IcMRaq89KWqrUJ8Al7a4mdDZB/8gF7n
         ePJ3EhE6wdpE3oiNVp8mwlmUIl1zK/sL/KNRsij3RIq6DEKjTRcD6s7FdWUCuWAhfGZU
         OKMIBG2L0kAKU5ypGskEuZU1itdSxezaXA8BPWbXfNbhW01m1QfQtGwwSXVA82/7QT+6
         H6RvI84g8tHZjNUJZRRviZcJ64HLtz5iuPhd7nmU79bh8pecE8PCIunSqOgD0VLY9at6
         dtlb9BCerV84FZr5HsMnp60K/Rmt1Uz8CygfR2V31NlIXy1jZBChN76fSB6hgMjtU9lC
         JuAA==
X-Forwarded-Encrypted: i=1; AFNElJ9MsB0WCK5QQ2NP50uzMm60iELJEB44qGEul1k/TpNQsvpWkcmrRXYjSGGLB4WKKXEnAnptgUXo1hHVcJOlwsHQdfJq@vger.kernel.org
X-Gm-Message-State: AOJu0YzzQcK7ZXFbfk/8jyZBhHJyNBFrZOxHx+jG+xX75cwo6aJtFxR9
	11S3Ez6VRWL5Uvf+WmozuSitD9uCH6wfzMyQTEiavKm12wZGn32b39TrlTeI0fnr/v8mBkD668n
	CV5mci9YWE/N3GDxt56070hlxNx7kZqTR7ccmSF8qBPOFoDeL8UUve02j24ZMBYguwPylvTJXGT
	cKl58AxSQ3
X-Gm-Gg: AeBDieugx8+sgY2+WIiwvsvIXfyfK7IC619PFpUk86J6Lo8FCMrhatcramRz/4hkchz
	2uohVhV3pxY+0egoZcTBzjsC4B5YFW9x6AW60W5r8CJJ+k2rcgibQLBskZHwuPh2CEy79pd6p8S
	ux7yPSBM9W2a8A8ppMSmVfOLCfEqzKLUz/cLgNGpDMdnc73ny+F5ZIizncYHuoY3m74c1IqHSt4
	i6uC4pxGaDbUBuSyb8+gF8fSxP4uu1KslsGFCYGAd2G2mB+tBUaDM/uNYG+NyL+UzuUqbDDMWp6
	i1HzlxM9rzXkmYP+/p6dZblap/xV6V9vfusj2IUinf0ude4Gk9y4yckwH3UDUH7eid+zHYqtGcQ
	EN000gJcXlOa0xs8zy1pQB4cLnia3MFK4apz5U2uGMcpek9svsrUlmIEULJwDW7iV9qcUgp8Hv3
	y4lH2M5vWksx3XypUwkymOLYZeSMBHju/OW+FvaOwuYHgd1oVoUv2GMgY//M17mEVU27qIhdrrF
	GAyrs6kNJhbw8qV6K5LC3mnY6M=
X-Received: by 2002:a05:6122:1d4c:b0:56c:f222:7d7e with SMTP id 71dfb90a1353d-57544892cc5mr1074439e0c.10.1777974777383;
        Tue, 05 May 2026 02:52:57 -0700 (PDT)
X-Received: by 2002:a05:6122:1d4c:b0:56c:f222:7d7e with SMTP id 71dfb90a1353d-57544892cc5mr1074429e0c.10.1777974776959;
        Tue, 05 May 2026 02:52:56 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6d97db6dsm474656466b.51.2026.05.05.02.52.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 02:52:55 -0700 (PDT)
Message-ID: <f10c039b-e9ef-4aae-8291-8f1e71074586@oss.qualcomm.com>
Date: Tue, 5 May 2026 11:52:55 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Plan to fix nvidia_wmi_ec backlight issues, help wanted
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Daniel Dadap <ddadap@nvidia.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        linux-fbdev@vger.kernel.org, linux-acpi <linux-acpi@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA5MiBTYWx0ZWRfX8+AJXvxzqcJP
 ss7k8YgxHoE66Xw6gdLAnNUVWzFSnaQNP8l3swcQKhbKLBXLMythHri6HmyCDphGbI+QfXuCvpr
 pYBp/oJKxgM0iUjFPGDO+jYAE6FHNSTg3W21pS1lHZjjhMTOEBSulH7mojIo/71u3VhNE7XKaN3
 gHMruYsqrn4Kxn4W8hZn4QhIcrJRV6eC0TGVoEjYFUkjmySkmHrRwiZPoyqPcGfJM6dKBxQicXU
 oAOikXG3fGGTXAMpWQ1AVopLfBCrJsfV7fg0zhxqrRQrkNtIm1PT+FuKiSdiuqX8Y8uxb5j4Jwk
 P4bmqD0H+GLF7rEhrrN85GUSysJgGQpujpbZrHZgOLGeGKviXsYH6wo/4Qkb9nmJhkwFaOoOqvU
 +18GyInYnXIHC30gPDhZRhs3vPEDku8rC1Vn7Nl2EZTQaM7T1aYfPwCnr1o8v7gYNPlxmjU8XGz
 7NtfgdQYPP4iRIRxOOQ==
X-Authority-Analysis: v=2.4 cv=K4AS2SWI c=1 sm=1 tr=0 ts=69f9bdfa cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=GHR8O2WEAAAA:20 a=e5mUnYsNAAAA:8 a=iox4zFpeAAAA:8 a=FQzLeyTS56HO1ZxThNwA:9
 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-GUID: 9lyuRXJucivFSGvv9JzL4BdOGfdG9kw8
X-Proofpoint-ORIG-GUID: 9lyuRXJucivFSGvv9JzL4BdOGfdG9kw8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050092

<resend adding pdx86 list, sorry>

Hi All,

A while ago Nvidia introduced a new Nvidia specific firmware method
for controlling the backlight on laptops with runtime switchable
Nvidia hybrid graphics.

This is supported through the nvidia-wmi-ec-backlight driver, but has
never worked 100%.

The new WMI firmware interface has a method to ask the firmware if
the backlight is controlled though the EC and this the new WMI interface
should be used; or if it is directly controlled by the GPU and the GPU
driver's native backlight support should be used.

There are several bugs in the implementation of this on various laptops:

1. The method to get the backlight control source sometimes does not
report the correct value.

2. On some laptop models which method (native-gpu vs nvidia-wmi) works
changes at runtime, e.g. when plugging in a charger.

Known affected laptop models/bug reports about this:
- Acer Predator PH315-55: needs acpi_backlight=native
- Dell G15 5515 with RTX 3050: *needs* acpi_backlight=native
- Dell G15 5515 with RTX 3060: *breaks* with acpi_backlight=native
- Lenovo Legion Slim 7 2021
- https://bugzilla.kernel.org/show_bug.cgi?id=217026
- https://gitlab.gnome.org/GNOME/gnome-settings-daemon/-/work_items/784
- https://gitlab.freedesktop.org/drm/amd/-/issues/4512
- https://bugzilla.suse.com/show_bug.cgi?id=1217750

It turns out that under Windows both a WMI backlight driver and a GPU
native backlight driver get installed and Windows simply always calls
both when the backlight changes working around these kind of firmware
bugs.

When this first came up, about 2 years ago, I came up with the below
plan to fix this. Nvidia was supposed to work in implementing this,
but so far an implementation of this plan has not happened.

Note I do not have time to work on this myself. I'm posting this here
in the hope that either Nvidia will pick this up after all; or that
someone else can make this happen.

I'm more then happy to help answering any questions which may come up
while implementing this; and to review the resulting patches.


The plan
========

1. Modify the core backlight code to allow registering a backlight-device
for in kernel use only, disabling the registering of a class device under
/sys/class/backlight .

2. Add a new backlight-aggregate.c backlight driver, which exports a
devm_backlight_aggregate_register_or_add() function. Drivers can call
this passing in an existing backlight-device (with its sysfs interface
disabled). This either creates a singleton /sys/class/backlight/aggregate
device, or adds the passed in backlight to the existing singleton instance
if it already exists.

This new driver always exposes a range of 0-255 to userspace. This acts
as a proxie for any backlight-devices registered to be part of
the aggregate, forwarding any brightness set calls to all backlights,
scaled to their actual range. For reads this will report the last set
brightness value (starting with the value of the first registered
backlight-device).

3. Add a new nvidia_wmi_ec_and_native type to drivers/acpi/video_detect.c
for both DMI quirks and commandline handling.

4. Modify acpi_video_backlight_use_native() to also return true if
the __acpi_video_get_backlight_type() call there returns the new
acpi_backlight_nvidia_wmi_ec_and_native.

5. Add a new devm_backlight_device_register_native() helper which
calls __acpi_video_get_backlight_type(true, NULL) and if that returns
the new nvidia_wmi_ec_and_native type then registers the passed in
backlight with the flag to not register a sysfs class interface and
then on success calls the new devm_backlight_aggregate_register_or_add()
with the just registered backlight device; and if the returned type
instead is acpi_backlight_native register the passed in backlight
normally through devm_backlight_device_register()

5. Modify the i915 and amdgpu drivers to use the new
devm_backlight_device_register_native() helper. Since this new helper
checks the backlight-type itself, drop acpi_video_backlight_use_native()
checks *if* the registration is the only thing guarded by that check.

6. drivers/platform/x86/nvidia-wmi-ec-backlight.c to not return
early from probe when acpi_video_get_backlight_type() returns
the new nvidia_wmi_ec_and_native type and for that type make it
registers its backlight with the flag to not register a sysfs class
interface and then on success calls the new
devm_backlight_aggregate_register_or_add().

Regards,

Hans

