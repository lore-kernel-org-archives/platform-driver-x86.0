Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6723B3C12
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Jun 2026 09:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780909997; cv=none; b=q4+DCU8DAXvJsh2oM3Oc7+hFtr9XQtLgtNmtkcw9Qhs8U525AY9fzYWY7KUe/GdlmYI/DdWAr3PnXuzH384HfSevHv+a/wFSWRHpTOxBkNYI0EZ77pnilv4g/NublsS3vMqHUVA9N9Erlzs9sTR2g/gbNMmVYoJMP5bdQAOUE/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780909997; c=relaxed/simple;
	bh=oKyx5nH9Pxh3VxD2NMB1GPEwTenIPAIN9js+/h9CtLs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pv1p8fRtM/PCQioaByhd4ddHaR167Pmw9/D9M+EmqgiPtliWVfDxS0H/exE/0FWE4JOFYN7k98jmEtPVZ1Ri8eWWJAa4Lrwch+WfFS4z9XrXA2sALC6qFhkpqw2JmQjlWUtpdZ/uaUOCyX37w79cy3RQTnpnnjMa5bsj5hMemus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PgAPlu+y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RWqN6/jU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PgAPlu+y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RWqN6/jU"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OuM72832966
	for <platform-driver-x86@vger.kernel.org>; Mon, 8 Jun 2026 09:13:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZgBV1IwcE5W8Cd7QaW4AT0ncmT3PwshaRDNpf4W+Koc=; b=PgAPlu+yQ0gyK7hl
	0418MpkNhhibrz5AhD+U8vWBWWRREuJB7T6BhRmDGBUIl7kEkJ3AgZ46i21BS428
	IO3tyVjGHqbspU4hoZf1rFzZih5g35hU+OEmEijwnBl7/BFZY9rzk+sQcokEa+9r
	Y34AsBGI7XMPcQZx49kzHt18H4Y0Ssozak3496fP64MsjD4QVxSv9XOdbxo9s7FF
	3s0qIwcycm+W3sglklBx5k8fzR44NjOQ3jsBjeuWSJqxBSzqldo06oHiFIntRBmp
	updmec3UrjzBYQWQpFyHNSvcB5DKbExU01TSG5ZIS5GJJ+sKlp3WiJFlJhlA5mjL
	N0jk3g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmrf2u8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 08 Jun 2026 09:13:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5177b8df670so61295281cf.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Jun 2026 02:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780909993; x=1781514793; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZgBV1IwcE5W8Cd7QaW4AT0ncmT3PwshaRDNpf4W+Koc=;
        b=RWqN6/jUrpL4KxHPqti7gSJq5r83GJo/hIDjWGqnseGTV+0pDWVdggqmiItQCafaTR
         TTnuNKkslBb4cql2dKJGNJBPc6LPXQTxuKYjAqZ+Syz6p2UdV6mQBYGNfF4L7oVvIs9G
         EjcLg10Tb3yrwf7v/Quv/foR0Mqi8l9+6O9Bb7id/ZJuPP3gJerpk7tNYfVcSDKy63sZ
         4RGZFs2gkZTzSjVhVCHOSeRx4sK7bK44HN3YlNxi0wZUgxkLBm0t/kr7ctJOKofWSAi6
         Ik3aq+hgSWOtSTmAUMF4STf800NjsnvIzerIChfXCWvJWSoZi2h6qB0370dxo4m0mbC7
         3+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780909993; x=1781514793;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZgBV1IwcE5W8Cd7QaW4AT0ncmT3PwshaRDNpf4W+Koc=;
        b=VlLMjhVQPeOXIx/i65bTWB1xAew7h6VPUFYP/AhI8lcYwqAwNy0nkggd9v+35Y1a+F
         /PStRSGSjClUUfGdi8OPWumCqcyQGVn24OMfX55I7jrhWqcRgmkJcRe88JKD6J6MY4G4
         HAP3vKVD+csVpjo3iUkx9JXtcT77e9uK8sOCVKbMeBjaAzK+QIpEQMO9nF/JI4x6cT2m
         XO5ysIh6BMPNfH9r46lBFibPXqq9FzRgtT1BvoULMC+nfrzAmK4R3hMgtMTpkLi2m2dn
         g93mqtSqt/OZf66AKHdMOjcZREnVEE4HDDIGG8ibZ31tZyEetJRxZy1Lk/ExawLMQMA+
         vr6Q==
X-Forwarded-Encrypted: i=1; AFNElJ8u9ZTxBJpYQjIWzsFnn2SpCB79QycsDFnA435Zyj/kbQJogQPCQWLXfHsejPUHJNUyTYBk4CJrndMSF5w9/6DIw76y@vger.kernel.org
X-Gm-Message-State: AOJu0YwkdkXXYkG95OLLuPZ+jAXq+zTXOYjs9mkk6Xu7A6Y7tL96GJqj
	ooFdmHmT2oQst0uMwobm15SGF4BIMNTiIdoV99uKkPxL08eiuTO5Gw+AcT9PCVL9To62HYfCxmQ
	IId5PgPzGdZ3BckeFDMnfuZZjR2mGaCzXc3GgrAS8eAHLWUffuVW439vkli4Wy6JYebsx2Upezl
	31
X-Gm-Gg: Acq92OFXrEMFLfuChA8IaOSegEFTpegbiUGbnR2ZdGQalAmq95xgzK/6sNQY3J+I0ZX
	ZGWmEXb78cne40Xt/leQt+oVzitjc9l/cHVUNxUcfzlonUbsip5eoCou30dkVaOIpg6OUaOe5vd
	NErOkEHvpFFPs8TZd0Nl7KO95i2cRKJMV4xeQkHwdQng+Pbs9bpBVY6dLF0dlmWcoNBUUmVvAke
	/TlFW1p5cbeOdKAikijo58WJDwKUYCFO4B1jZhW+cV3PcgoILiCuODbfmP/9p9OeYIGJN+2e2CL
	DhIBvQABeUxGE3wA6KPZ4yNKLtR8CvvdIZHpWa4bUg4SYBGrOZWqBV12Q6yzVSy8G8sOf7GYT2+
	lMBmiVRxkiGtT8G4895MRkaI3v2V78CjMQq8utTAwuxvvv2Cx3xY=
X-Received: by 2002:a05:622a:4cf:b0:50d:82db:773e with SMTP id d75a77b69052e-51795b60f16mr212537651cf.47.1780909992469;
        Mon, 08 Jun 2026 02:13:12 -0700 (PDT)
X-Received: by 2002:a05:622a:4cf:b0:50d:82db:773e with SMTP id d75a77b69052e-51795b60f16mr212537261cf.47.1780909991893;
        Mon, 08 Jun 2026 02:13:11 -0700 (PDT)
Received: from [10.40.99.10] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0559f35c2sm846455466b.61.2026.06.08.02.13.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:13:10 -0700 (PDT)
Message-ID: <78833ba9-7ea0-4c7f-8d41-ac0fd64ba15c@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:13:09 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH v5] platform/x86/lenovo: Add Yoga Book 9 keyboard dock
 detection driver
To: Dave Carey <carvsdriver@gmail.com>, platform-driver-x86@vger.kernel.org,
        Pit Henrich <pithenrich2d@googlemail.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, armin.wolf@outlook.de,
        linux-kernel@vger.kernel.org
References: <20260521144034.282419-1-carvsdriver@gmail.com>
 <20260527122701.242907-1-carvsdriver@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260527122701.242907-1-carvsdriver@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4NSBTYWx0ZWRfX7f1mT473GfEy
 HLR2fmH9tphQbYOeFlAZOE3kH+t/1oBUOk9KfxQfGnRDmoAJXjIZlwz6b42GrfMN/q0HqNDwZRQ
 19tigDCj30nuPp1qHTjEVutbX1chorY/Lc0tZ6TP/UJ9k1mIFeaNp3wjeYk9Aj2fe7/z1wEvNpZ
 1NOBSlKBU/O3kSBG2hSaHjQ4YBm+haFnXTWZMBs3thpmKk2XfHoT4+vE9yVJQ1RpZaJD6OqE5S7
 +W6/mZ7PkElLqBnfk5KqWuhBn20qJYO6CYSJ5RHypZ1BHkX51TDDA7yrfio7KIoXxTesR9nTJZD
 d/NalCvAt3gI2Vi0K4ixJZ0khMAk4L95+f46g2SijF+wV8CW//q/UyoptoqeHmnDem/p3v7PgUH
 Y3aP6PU/sgK2Gh/pbJN0E7U+siJTJuyJtRsgHCB8yqdQlTLCwUmFpb+HDPwfYO5u9ICR0eB9QOD
 BNym/AhOldElr/kVlWg==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a2687a9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=rrvG0T/C2D967D07Ol03YQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=SNcLAUb0IowDOXlfhYsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 5VbSL47kLY9l9UEHJUDahrDN3UXv0V9i
X-Proofpoint-ORIG-GUID: 5VbSL47kLY9l9UEHJUDahrDN3UXv0V9i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080085

On 27-May-26 2:27 PM, Dave Carey wrote:
> The Lenovo Yoga Book 9 14IAH10 ships with a detachable Bluetooth keyboard
> that magnetically attaches to the bottom (secondary) screen in one of two
> positions.  The Embedded Controller tracks the attachment state in a 2-bit
> field called BKBD and signals changes via WMI event GUID
> 806BD2A2-177B-481D-BFB5-3BA0BB4A2285 (notify ID 0xEB on the WM10 ACPI
> device, _UID "GMZN").
> 
> The device contains embedded BMOF data (WQDD, 20705 bytes) documenting
> both WMI interfaces used by this driver:
> 
>   LENOVO_BTKBD_EVENT (event GUID): WmiDataId(1) uint32 Status.
>   The ACPI _WED(0xEB) method returns EC.BKBD directly as an integer,
>   so the notify callback receives BKBD without a separate query.
> 
>   LENOVO_FEATURE_STATUS_DATA (block GUID, WQAF method): returns an
>   8-byte buffer {uint32 IDs=0x00060000, uint32 Status=BKBD}.
>   Used for the initial state read on probe and after resume.
> 
> BKBD encoding:
>   0 = keyboard detached
>   1 = keyboard docked on top half of bottom screen
>   2 = keyboard docked on bottom half of bottom screen
>   3 = reserved (not observed in practice)
> 
> This driver:
>   - Registers two WMI drivers: one on the event GUID (LENOVO_BTKBD_EVENT)
>     and one on the block GUID (LENOVO_FEATURE_STATUS_DATA).
>   - On probe, reads initial BKBD state via wmidev_block_query() on the
>     block device; whichever driver probes last triggers the initial read.
>   - On WMI notification, reads BKBD directly from the event data integer
>     (ACPI _WED(0xEB) returns EC.BKBD) without a redundant WQAF call.
>   - Reports SW_TABLET_MODE=1 when detached, SW_TABLET_MODE=0 when docked
>     in either position (a physical keyboard is present in both cases).
>   - Exposes the raw BKBD value via read-only sysfs attribute
>     "keyboard_position".
>   - Re-reads BKBD state on resume from suspend or hibernation.
> 
> Tested on: Lenovo Yoga Book 9 14IAH10 (model 83KJ), kernel 7.0.
> 
> Signed-off-by: Dave Carey <carvsdriver@gmail.com>

Thank you for your patch. It seems that a second patch adding the same functionality
by extending the thinkpad_acpi driver has been developed in parallel :

https://patchwork.kernel.org/project/platform-driver-x86/patch/20260419102724.91451-1-pithenrich2d@gmail.com/

+Cc Pit Henrich (author of that patch) and Mark Pearson (Lenovo)

Mark do you know what Windows is using to access this info, is the Windows sw
using WMI like this driver or making direct ACPI calls ? (or maybe different
pieces of Windows use different paths?) 

As I wrote in reply to the thinkpad_acpi patch:

Since doing this in thinkpad_acpi requires adding a DMI match and directly calling
an APCI method which name may change I believe that the WMI approach may be better.
There we can rely on only the Fold exposing the WMI GUID for this functionality.

Dave, I see that your "[PATCH v5] platform/x86/lenovo: Add Yoga Book 9 keyboard
dock detection driver" patch also uses a DMI match, is that necessary ?

If we need the DMI match because the GUID is not unique enough, then we might
just as well add this functionality here as this patch is doing ...

I do wonder since this seems to emit TP_HKEY_EV_TABLET_CHANGED thinkpad_acpi
events if the existing thinkpad_acpi support does not already provide working
SW_TABLET_MODE input  ?

If it does then also having the WMI driver emit SW_TABLET_MODE events seems
to be undesirable duplicate functionality.

Regards,

Hans



> ---
> v5:
> - Rewrote as two WMI drivers (event + block) to avoid the deprecated
>   wmi_query_block() API: event driver owns the GUID that delivers
>   notifications, block driver owns the GUID used for querying state.
>   Either can probe first; both probe callbacks check whether the other
>   has already probed and fire the initial read when both are ready.
> - Use wmidev_block_query() on the block wmi_device directly (replaces
>   the deprecated wmi_query_block()).
> - In the notify callback, read BKBD directly from the event data integer
>   passed by the WMI core (_WED(0xEB) returns EC.BKBD; confirmed by
>   decoding the embedded BMOF from WQDD).  Eliminates the redundant WQAF
>   call that v4 made on every notification.
> - Documented the two BMOF classes (LENOVO_BTKBD_EVENT and
>   LENOVO_FEATURE_STATUS_DATA) with field layouts in the commit message
>   and file header.
> - sysfs keyboard_position: output bare integer, drop the parenthetical
>   position-name suffix that a couple of reviewers found non-standard.
> - Set .no_singleton = true on both WMI drivers (was missing from block
>   driver in v4).
> - Add PM resume callback (yb9_kbdock_resume) to re-read BKBD state
>   after suspend/hibernation.
> 
> v4:
> - Dropped module_wmi_driver(); registered two WMI drivers manually to
>   allow sharing state.  module_init/exit pair registers/unregisters
>   both.
> - Added ATTRIBUTE_GROUPS() and .dev_groups for the sysfs attribute.
> - sysfs show: performed a live query instead of returning a cached value.
> 
> v3:
> - Switched to devm_input_allocate_device().
> - Added DMI guard (dmi_check_system) to reject non-YB9 machines.
> - Removed redundant MODULE_DEVICE_TABLE on block driver.
> 
> v2:
> - Added .no_singleton = true on the event WMI driver.
> - Added PM suspend/resume skeleton.
> - Fixed MODULE_LICENSE to "GPL" (was "GPL v2").
> 
>  .../testing/sysfs-driver-lenovo-yb9-kbdock    |  19 +
>  MAINTAINERS                                   |   7 +
>  drivers/platform/x86/lenovo/Kconfig           |  14 +
>  drivers/platform/x86/lenovo/Makefile          |   1 +
>  drivers/platform/x86/lenovo/yb9-kbdock.c      | 324 ++++++++++++++++++
>  5 files changed, 365 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
>  create mode 100644 drivers/platform/x86/lenovo/yb9-kbdock.c
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock b/Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
> new file mode 100644
> index 0000000..04e5293
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
> @@ -0,0 +1,19 @@
> +What:		/sys/bus/wmi/drivers/lenovo-yb9-kbdock/<guid>/keyboard_position
> +Date:		April 2026
> +KernelVersion:	6.10
> +Contact:	Dave Carey <carvsdriver@gmail.com>
> +Description:
> +		Read-only attribute reporting the current keyboard dock position
> +		as reported by the Embedded Controller on the Lenovo Yoga Book 9
> +		14IAH10.
> +
> +		Possible values:
> +
> +		==  =============================================================
> +		0   keyboard is not docked to any screen (detached)
> +		1   keyboard docked on the top half of the bottom screen
> +		2   keyboard docked on the bottom half of the bottom screen
> +		==  =============================================================
> +
> +		SW_TABLET_MODE input events are also emitted: 0 when the keyboard
> +		is docked (either position), 1 when detached.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d1cc0e1..00e8275 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14479,6 +14479,13 @@ L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  F:	drivers/platform/x86/lenovo/wmi-hotkey-utilities.c
>  
> +LENOVO YOGA BOOK 9 KEYBOARD DOCK DRIVER
> +M:	Dave Carey <carvsdriver@gmail.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
> +F:	drivers/platform/x86/lenovo/yb9-kbdock.c
> +
>  LETSKETCH HID TABLET DRIVER
>  M:	Hans de Goede <hansg@kernel.org>
>  L:	linux-input@vger.kernel.org
> diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/lenovo/Kconfig
> index 9c48487..938b361 100644
> --- a/drivers/platform/x86/lenovo/Kconfig
> +++ b/drivers/platform/x86/lenovo/Kconfig
> @@ -43,6 +43,20 @@ config LENOVO_WMI_CAMERA
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called lenovo-wmi-camera.
>  
> +config LENOVO_YB9_KBDOCK
> +	tristate "Lenovo Yoga Book 9 keyboard dock detection"
> +	depends on ACPI_WMI
> +	depends on DMI
> +	depends on INPUT
> +	help
> +	  Say Y here to enable keyboard dock detection on the Lenovo Yoga Book 9
> +	  14IAH10.  The detachable Bluetooth keyboard magnetically attaches to
> +	  either screen; this driver reports SW_TABLET_MODE input events based
> +	  on the attachment state and exposes the raw position in sysfs.
> +
> +	  To compile this driver as a module, choose M here: the module will be
> +	  called lenovo-yb9-kbdock.
> +
>  config LENOVO_YMC
>  	tristate "Lenovo Yoga Tablet Mode Control"
>  	depends on ACPI_WMI
> diff --git a/drivers/platform/x86/lenovo/Makefile b/drivers/platform/x86/lenovo/Makefile
> index 7b2128e..2842d7d 100644
> --- a/drivers/platform/x86/lenovo/Makefile
> +++ b/drivers/platform/x86/lenovo/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
>  obj-$(CONFIG_THINKPAD_ACPI)	+= thinkpad_acpi.o
>  
>  lenovo-target-$(CONFIG_LENOVO_WMI_HOTKEY_UTILITIES)	+= wmi-hotkey-utilities.o
> +lenovo-target-$(CONFIG_LENOVO_YB9_KBDOCK)	+= yb9-kbdock.o
>  lenovo-target-$(CONFIG_LENOVO_YMC)	+= ymc.o
>  lenovo-target-$(CONFIG_YOGABOOK)	+= yogabook.o
>  lenovo-target-$(CONFIG_YT2_1380)	+= yoga-tab2-pro-1380-fastcharger.o
> diff --git a/drivers/platform/x86/lenovo/yb9-kbdock.c b/drivers/platform/x86/lenovo/yb9-kbdock.c
> new file mode 100644
> index 0000000..28a3ec7
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo/yb9-kbdock.c
> @@ -0,0 +1,324 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Lenovo Yoga Book 9 keyboard-dock detection
> + *
> + * The Yoga Book 9 ships with a detachable Bluetooth keyboard that magnetically
> + * attaches to the bottom screen in one of two positions.  The EC tracks
> + * attachment state in a 2-bit field called BKBD and signals changes via WMI
> + * event 0xEB on the WM10 ACPI device (_UID "GMZN").
> + *
> + * BKBD values:
> + *   0 = keyboard detached
> + *   1 = keyboard docked on the top half of the bottom screen
> + *   2 = keyboard docked on the bottom half of the bottom screen
> + *   3 = reserved / not observed
> + *
> + * Two WMI interfaces are used (documented in embedded BMOF, WQDD, 20705 bytes):
> + *
> + *   LENOVO_BTKBD_EVENT (event GUID, 806BD2A2-...)
> + *     WmiDataId(1) uint32 Status — _WED(0xEB) returns EC.BKBD directly.
> + *     The notify callback receives BKBD as an integer; no separate query needed.
> + *
> + *   LENOVO_FEATURE_STATUS_DATA (block GUID, E7F300FA-...)
> + *     WmiDataId(1) uint32 IDs   = 0x00060000 (feature selector)
> + *     WmiDataId(2) uint32 Status = BKBD value
> + *     Used on probe and resume to read initial state.
> + *
> + * SW_TABLET_MODE=1 is reported when the keyboard is detached;
> + * SW_TABLET_MODE=0 when docked in either position (keyboard present).
> + * The raw BKBD value is exposed via the sysfs attribute "keyboard_position".
> + *
> + * Copyright (C) 2026 Dave Carey <carvsdriver@gmail.com>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/dmi.h>
> +#include <linux/input.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/pm.h>
> +#include <linux/wmi.h>
> +
> +#define YB9_KBDOCK_EVENT_GUID	"806BD2A2-177B-481D-BFB5-3BA0BB4A2285"
> +#define YB9_KBDOCK_QUERY_GUID	"E7F300FA-21CD-4003-ADAC-2696135982E6"
> +
> +/* BKBD encoding */
> +#define BKBD_DETACHED		0
> +#define BKBD_TOP_HALF		1
> +#define BKBD_BOTTOM_HALF	2
> +
> +static const struct dmi_system_id yb9_kbdock_dmi_table[] = {
> +	{
> +		/* Lenovo Yoga Book 9 14IAH10 */
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR,   "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "83KJ"),
> +		},
> +	},
> +	{ }
> +};
> +
> +/*
> + * Shared state between the event and block WMI drivers.  Protected by lock.
> + * The lock may be held across wmidev_query_block() calls (which can sleep);
> + * block_remove() acquires the lock before clearing block_wdev, ensuring
> + * block_wdev remains valid for the duration of any in-progress query.
> + */
> +static struct {
> +	struct mutex lock;
> +	struct input_dev *input_dev;	/* set by event probe */
> +	struct wmi_device *block_wdev;	/* set by block probe */
> +} yb9;
> +
> +/*
> + * Read BKBD from the block device via wmidev_block_query().
> + * Returns 0-3 on success, -errno on failure.  Caller must hold yb9.lock.
> + */
> +static int yb9_kbdock_query_locked(struct device *log_dev)
> +{
> +	union acpi_object *obj;
> +	u32 bkbd;
> +
> +	if (!yb9.block_wdev)
> +		return -ENODEV;
> +
> +	obj = wmidev_block_query(yb9.block_wdev, 0);
> +	if (!obj) {
> +		dev_warn(log_dev, "WQAF returned NULL\n");
> +		return -EIO;
> +	}
> +
> +	/*
> +	 * LENOVO_FEATURE_STATUS_DATA: 8-byte buffer {IDs=0x00060000, Status=BKBD}.
> +	 */
> +	if (obj->type == ACPI_TYPE_BUFFER && obj->buffer.length >= 8) {
> +		memcpy(&bkbd, obj->buffer.pointer + 4, sizeof(bkbd));
> +		bkbd &= 0x3;
> +	} else if (obj->type == ACPI_TYPE_INTEGER) {
> +		bkbd = obj->integer.value & 0x3;
> +	} else {
> +		dev_warn(log_dev, "WQAF: unexpected type %d len %u\n",
> +			 obj->type,
> +			 obj->type == ACPI_TYPE_BUFFER ? obj->buffer.length : 0);
> +		kfree(obj);
> +		return -EIO;
> +	}
> +
> +	kfree(obj);
> +	return (int)bkbd;
> +}
> +
> +/* Report SW_TABLET_MODE from BKBD.  Caller must hold yb9.lock. */
> +static void yb9_kbdock_report_locked(int bkbd, struct device *log_dev)
> +{
> +	int tablet = (bkbd == BKBD_DETACHED) ? 1 : 0;
> +
> +	input_report_switch(yb9.input_dev, SW_TABLET_MODE, tablet);
> +	input_sync(yb9.input_dev);
> +	dev_dbg(log_dev, "BKBD=%d SW_TABLET_MODE=%d\n", bkbd, tablet);
> +}
> +
> +/* ------------------------------------------------------------------
> + * sysfs
> + * ------------------------------------------------------------------ */
> +
> +static ssize_t keyboard_position_show(struct device *dev,
> +				      struct device_attribute *attr, char *buf)
> +{
> +	int bkbd;
> +
> +	mutex_lock(&yb9.lock);
> +	bkbd = yb9_kbdock_query_locked(dev);
> +	mutex_unlock(&yb9.lock);
> +
> +	if (bkbd < 0)
> +		return bkbd;
> +	return sysfs_emit(buf, "%u\n", (unsigned int)bkbd);
> +}
> +static DEVICE_ATTR_RO(keyboard_position);
> +
> +static struct attribute *yb9_kbdock_attrs[] = {
> +	&dev_attr_keyboard_position.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(yb9_kbdock);
> +
> +/* ------------------------------------------------------------------
> + * Event WMI driver — LENOVO_BTKBD_EVENT
> + * ------------------------------------------------------------------ */
> +
> +static void yb9_kbdock_notify(struct wmi_device *wdev, union acpi_object *data)
> +{
> +	u32 bkbd;
> +
> +	/*
> +	 * _WED(0xEB) returns EC.BKBD directly as an integer
> +	 * (LENOVO_BTKBD_EVENT WmiDataId(1) uint32 Status).
> +	 */
> +	if (!data || data->type != ACPI_TYPE_INTEGER) {
> +		dev_warn(&wdev->dev, "unexpected event data type %d\n",
> +			 data ? data->type : -1);
> +		return;
> +	}
> +	bkbd = data->integer.value & 0x3;
> +
> +	mutex_lock(&yb9.lock);
> +	if (yb9.input_dev)
> +		yb9_kbdock_report_locked(bkbd, &wdev->dev);
> +	mutex_unlock(&yb9.lock);
> +}
> +
> +static int yb9_kbdock_event_probe(struct wmi_device *wdev, const void *ctx)
> +{
> +	struct input_dev *input_dev;
> +	int bkbd, err;
> +
> +	if (!dmi_check_system(yb9_kbdock_dmi_table))
> +		return -ENODEV;
> +
> +	input_dev = devm_input_allocate_device(&wdev->dev);
> +	if (!input_dev)
> +		return -ENOMEM;
> +
> +	input_dev->name = "Lenovo Yoga Book 9 keyboard dock switch";
> +	input_dev->phys = YB9_KBDOCK_EVENT_GUID "/input0";
> +	input_dev->id.bustype = BUS_HOST;
> +	input_set_capability(input_dev, EV_SW, SW_TABLET_MODE);
> +
> +	err = input_register_device(input_dev);
> +	if (err)
> +		return err;
> +
> +	mutex_lock(&yb9.lock);
> +	yb9.input_dev = input_dev;
> +	/* Read initial state if the block device has already probed. */
> +	if (yb9.block_wdev) {
> +		bkbd = yb9_kbdock_query_locked(&wdev->dev);
> +		if (bkbd >= 0)
> +			yb9_kbdock_report_locked(bkbd, &wdev->dev);
> +	}
> +	mutex_unlock(&yb9.lock);
> +
> +	return 0;
> +}
> +
> +static void yb9_kbdock_event_remove(struct wmi_device *wdev)
> +{
> +	mutex_lock(&yb9.lock);
> +	yb9.input_dev = NULL;
> +	mutex_unlock(&yb9.lock);
> +}
> +
> +static int yb9_kbdock_resume(struct device *dev)
> +{
> +	int bkbd;
> +
> +	mutex_lock(&yb9.lock);
> +	if (yb9.input_dev && yb9.block_wdev) {
> +		bkbd = yb9_kbdock_query_locked(dev);
> +		if (bkbd >= 0)
> +			yb9_kbdock_report_locked(bkbd, dev);
> +	}
> +	mutex_unlock(&yb9.lock);
> +	return 0;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(yb9_kbdock_pm_ops, NULL, yb9_kbdock_resume);
> +
> +static const struct wmi_device_id yb9_kbdock_event_id_table[] = {
> +	{ .guid_string = YB9_KBDOCK_EVENT_GUID },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(wmi, yb9_kbdock_event_id_table);
> +
> +static struct wmi_driver yb9_kbdock_event_driver = {
> +	.driver = {
> +		.name = "lenovo-yb9-kbdock",
> +		.dev_groups = yb9_kbdock_groups,
> +		.pm = pm_sleep_ptr(&yb9_kbdock_pm_ops),
> +	},
> +	.id_table = yb9_kbdock_event_id_table,
> +	.no_singleton = true,
> +	.probe = yb9_kbdock_event_probe,
> +	.remove = yb9_kbdock_event_remove,
> +	.notify = yb9_kbdock_notify,
> +};
> +
> +/* ------------------------------------------------------------------
> + * Block WMI driver — LENOVO_FEATURE_STATUS_DATA
> + * ------------------------------------------------------------------ */
> +
> +static int yb9_kbdock_block_probe(struct wmi_device *wdev, const void *ctx)
> +{
> +	int bkbd;
> +
> +	if (!dmi_check_system(yb9_kbdock_dmi_table))
> +		return -ENODEV;
> +
> +	mutex_lock(&yb9.lock);
> +	yb9.block_wdev = wdev;
> +	/* Read initial state if the event device has already probed. */
> +	if (yb9.input_dev) {
> +		bkbd = yb9_kbdock_query_locked(&wdev->dev);
> +		if (bkbd >= 0)
> +			yb9_kbdock_report_locked(bkbd, &wdev->dev);
> +	}
> +	mutex_unlock(&yb9.lock);
> +	return 0;
> +}
> +
> +static void yb9_kbdock_block_remove(struct wmi_device *wdev)
> +{
> +	mutex_lock(&yb9.lock);
> +	yb9.block_wdev = NULL;
> +	mutex_unlock(&yb9.lock);
> +}
> +
> +static const struct wmi_device_id yb9_kbdock_block_id_table[] = {
> +	{ .guid_string = YB9_KBDOCK_QUERY_GUID },
> +	{ }
> +};
> +
> +static struct wmi_driver yb9_kbdock_block_driver = {
> +	.driver = {
> +		.name = "lenovo-yb9-kbdock-block",
> +	},
> +	.id_table = yb9_kbdock_block_id_table,
> +	.no_singleton = true,
> +	.probe = yb9_kbdock_block_probe,
> +	.remove = yb9_kbdock_block_remove,
> +};
> +
> +/* ------------------------------------------------------------------
> + * Module init / exit
> + * ------------------------------------------------------------------ */
> +
> +static int __init yb9_kbdock_init(void)
> +{
> +	int ret;
> +
> +	mutex_init(&yb9.lock);
> +
> +	ret = wmi_driver_register(&yb9_kbdock_event_driver);
> +	if (ret)
> +		return ret;
> +
> +	ret = wmi_driver_register(&yb9_kbdock_block_driver);
> +	if (ret) {
> +		wmi_driver_unregister(&yb9_kbdock_event_driver);
> +		return ret;
> +	}
> +	return 0;
> +}
> +module_init(yb9_kbdock_init);
> +
> +static void __exit yb9_kbdock_exit(void)
> +{
> +	wmi_driver_unregister(&yb9_kbdock_block_driver);
> +	wmi_driver_unregister(&yb9_kbdock_event_driver);
> +}
> +module_exit(yb9_kbdock_exit);
> +
> +MODULE_AUTHOR("Dave Carey <carvsdriver@gmail.com>");
> +MODULE_DESCRIPTION("Lenovo Yoga Book 9 keyboard dock detection");
> +MODULE_LICENSE("GPL");

