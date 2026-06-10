Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BC03AB260
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jun 2026 08:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080577; cv=none; b=VvXigHWlVsezkg1KQSMF5qDr3mxJZ+pEjEdlECXYHNzckmgVZj59yf0vqocPqPK6DBx31bDiFZ/ERJTqHqVkSm4JyGiXL4Oiw2Jn+yRtcn7dikOyv/32SWKgvOPArhZv4J+bR9KE0pp8cBYThzJC/WXp9kCyQ4R89nIYBAnjAHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080577; c=relaxed/simple;
	bh=SfceraAdP2aODYP+wlyuyReHr6AfAyIzU2TMc3nVOZk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=TaNludeGsnBj50fiMkAx4c8efVNSWWd17jybf0eQMhEeX9GkrhDqOunyCjcbCmlN4WRjwahX6H7Aklr1n0Vhbs4Bt0zAtYKcR3OzaxDxIISYQP9ctNWCZI95DcP95sK122tBParpqtPk1rXQL2Q95UymFPOMNiHJPy3MApuvE+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gSqn6wIi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QnMsww3k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gSqn6wIi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QnMsww3k"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hheQ531383
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jun 2026 08:36:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hn0+C20Vzo65KtwAY9JcBcrjEh/bnupgmEpmHOFgE/s=; b=gSqn6wIiK1kjCeoe
	+OA0nms1ncmp6hU1Ali+DmSIBTnxqZ53iwve/C3BSLC33KP/3YDMrYkEiEMoB8t1
	SywEqV3UWzgRNuZHM8/eg3Qee8oiitNxxFiZDntt2hijttMrVI+PbUGzS1RzRvRE
	EFg7cZ0jfRD1NqlVB77AMyY2/EedNL1aPBbkcJuzelRS5D5mZmo/ROTNdj/NVRVj
	E7h+V12MXsAKTDDtS7uHkhj/ez0siN/FUvclrzf6i3sJtnD1Kwx8eWnMsw7AV38V
	GkEZcVLeeILy49vtmHbeQIahJoi4NYInO91+e0fjf3bpwcuUx6bTev5UdmaT3tkD
	/Utqmw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0m1rwkn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jun 2026 08:36:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915f7c37734so106263085a.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jun 2026 01:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781080571; x=1781685371; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hn0+C20Vzo65KtwAY9JcBcrjEh/bnupgmEpmHOFgE/s=;
        b=QnMsww3kQNH3Kqft1OPTXueCFUUUAF7gn9l4MWkk7G2J8YhCmVS6dZPPNbHLGVu2li
         QodZm9LM2+ew1YR+Dp/CJpY4V5SSP+mBldG330xhGiM2R3nVig2idr8X485pBqpvOW+C
         nrGQ5GyFaC+ZwZzWxIyAdI/PDI/FqccNK/krKsrPoH70xSK4WgDMlxS1JJYfznFcqNRI
         GOcZFpToRl64Rpr6Iu8BL9x+NaOiFCVwVOoU3PSjBYtFqgFVkbQiiqFzdGTThD0Yovx7
         yo2ro9rUzYLgbd2Vl3uZye3TG2oPzW8KSk2F8VsDFhA/6bS3vicj4fQNXQ/xMhcTc5cV
         +K4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080571; x=1781685371;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hn0+C20Vzo65KtwAY9JcBcrjEh/bnupgmEpmHOFgE/s=;
        b=kCcveZhH1DeHEdr7YRjXwrE7vTcDRd9yWG4GWtmeIbWA8mLid3oHSa+ekkNJrs0TRw
         TVOiElXcs0Mh45AGceLgzqu1iHlTligpKzMoXnZDXAKzzuWhAhPyX+OO3TNQgK/A9NHX
         mNamotCWs99aWRMeIJKhE/0wLO0Z9IVBXffzrA1Nbw1t+RZ5dxjJQ9Y4lClVT8SQU7ez
         9FthNVC8KuEZIA2vk/NDD+xM/CWRvli3phETvTLO9TOAbdVe7E8qZkANCoD+qfv67XCA
         DW/vSecV/Ln07x/ezLuMmolGfuG8K/la6ZqVnJLCTlBlQQJ3ZAL7tdcFvgrIGt+s2wxd
         t7Hw==
X-Forwarded-Encrypted: i=1; AFNElJ+4yKqf1/B+BKtiPmpwiyvG+0hqGnvgh65nmPcfOSGj0W6rynOHz1iFsxT2S/sA/57QOgA4YC/AvSuys/s3TRQVLpPx@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk16hkpSfGGct/e+Zjt0Tus93KfuzT4X96yJqSrmdgC5Q9mTFE
	SfMaZfoxG1LCHGrxIQjDslu76bWuxxRPbB/cCOA19A17IXEZzkl0xRuLAy/ugGWoFDMYUwdMUcR
	A67UDDKHaxdv/7QAjRPznyynXgr2bpNw4j0qpIaF3qI05gFgY5OZIm13L4o1qgfBclckHQr0d/8
	56
X-Gm-Gg: Acq92OGnCySpkGJXGxtFOYfBb6Qb9QssOEdnPe9jjeV3px0jji5UksZKDAlejsoDKcg
	X+HnkDlB9Xo+p/mxMzu9LCqfHUkoRvUCwO3K/WtyouSr4oatWQn54HaZLsXnBKhU1YfkXjFo20w
	F5koSu3VkMT/FMOQnycTcV63tgXwJWYNN5DjlkHpYFHv5FIKI7gAzn5LJz9ii+rJrrrlY/xcf1y
	fjl8LSVrVKDCZ2PHTXsp2mZrqKr5/fwh5pgA950DacyCK7h5sPrGYeVznSHtg5fL/jJOo8bSgfv
	3PkQYD3F8WaiQ6NjmSYzoME6+OK0VxSHISb67U44moDW/UgXyK0F6SznPMosu2iHzJB4CtPd6A5
	vPu0IH4DxEMglBStY4q4tQONIcgExvCaXMLyYSnZMLCCLJueGnUATIJU1Nwf2lhihlH4KYdsZ44
	Xq3eJcKbEvCojZkvlaJhZN7/oyCakL8DVftvcEbvn7t7Q8Xt/otlyrMmcIsH53m9yUvyPEzz9dJ
	bBCgbHwZ6LachnjRH10SOwCvFs=
X-Received: by 2002:a05:620a:688d:b0:915:b506:56cc with SMTP id af79cd13be357-915e822cacdmr969050785a.7.1781080570476;
        Wed, 10 Jun 2026 01:36:10 -0700 (PDT)
X-Received: by 2002:a05:620a:688d:b0:915:b506:56cc with SMTP id af79cd13be357-915e822cacdmr969047485a.7.1781080569770;
        Wed, 10 Jun 2026 01:36:09 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e051a5sm1159582266b.35.2026.06.10.01.36.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 01:36:08 -0700 (PDT)
Message-ID: <2728f244-0e89-4eee-b143-95b535cbb7d6@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 10:36:07 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH v7 2/2] platform/x86/lenovo: Add Yoga Book 9 keyboard dock
 detection driver
To: Dave Carey <carvsdriver@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: mpearson-lenovo@squebb.ca, ilpo.jarvinen@linux.intel.com,
        armin.wolf@outlook.de, linux-kernel@vger.kernel.org
References: <20260608215205.678182-1-carvsdriver@gmail.com>
 <20260609212631.925943-1-carvsdriver@gmail.com>
 <20260609212631.925943-3-carvsdriver@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260609212631.925943-3-carvsdriver@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4MCBTYWx0ZWRfX5zIAQM1PWM3r
 Xz7sbikJEN9hId6eUhpL0hjTPTH8btrEU+nnyEnP3xulZowRTo/bKPCDcYIZfzvT4OoxaMqrtN+
 /QeSCYVqyDb/+TyNT4i0KUKxevGvahr6XFbROvkUJqQLYRZr7Wckl34+j5JYclKUv3JI08rDsgx
 1fG9vUCSaEJYpLf2KJor2ZkYB6BEz2nCKF5h2OUNZ3cmxj9sEt1M8R/eQUdKNAQFt9cdStN6GGr
 1amAjSt2o0d2s4JWT20iftY1s54mWX0psxi9okH9aIGCAXiy6fgOvz0LBmId7zw9d+5YdcNIDuR
 9tL615XMONi5J4BGlZ9eQ+HFuZoJC6qOsPsOQrznpnOxEwVLJMRq0EB5v36rZfNYJfeqs4NErlF
 XZ6ydIMMvLK8Dgvg4snWSsKVoTuG15hnbstW727HEl83dwlYBTqUDIyR06mzRAIKL+9/7jHdq5U
 isV0fY12BHBcatrBuKg==
X-Proofpoint-GUID: qzHIkqv0ifH65OsOe7JLvne68OcbE-oC
X-Authority-Analysis: v=2.4 cv=UdJhjqSN c=1 sm=1 tr=0 ts=6a2921fb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=iA6xBcjsEZ82MVPbCNUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: qzHIkqv0ifH65OsOe7JLvne68OcbE-oC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100080

Hi,

On 9-Jun-26 23:26, Dave Carey wrote:
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
>   - On probe, reads initial BKBD state via wmidev_query_block() on the
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

For the user-space API and DMI table usage:

Acked-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans


> ---
> v7:
> - Use wmidev_query_block() in place of deprecated wmidev_block_query().
>   Use __free(kfree) to manage the output buffer; simplify the parsing
>   to a single length check now that the WMI core handles type conversion.
> - Define BKBD_FIELD with GENMASK() and extract the field with FIELD_GET()
>   instead of open-coded masking.
> - Use guard(mutex) for all lock/unlock pairs.
> - Add yb9_kbdock_sync_locked() helper to consolidate the duplicated
>   initial-state read pattern in event_probe, block_probe, and resume.
> - Add linux/bitfield.h, linux/cleanup.h, linux/slab.h includes.
> - Fix comment on struct mutex field; use Context:/Returns: sections in
>   the kerneldoc comment for yb9_kbdock_query_locked().
> 
> v6:
> - Submitted as 2/2; patch 1/2 adds a DMI early-exit to lenovo-ymc to
>   prevent duplicate SW_TABLET_MODE input nodes on the YB9.
> 
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
>  drivers/platform/x86/lenovo/yb9-kbdock.c      | 317 ++++++++++++++++++
>  5 files changed, 358 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
>  create mode 100644 drivers/platform/x86/lenovo/yb9-kbdock.c
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock b/Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
> new file mode 100644
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
> --- a/drivers/platform/x86/lenovo/Kconfig
> +++ b/drivers/platform/x86/lenovo/Kconfig
> @@ -43,6 +43,20 @@ config LENOVO_WMI_CAMERA
>  	      To compile this driver as a module, choose M here: the module
>  	      will be called lenovo-wmi-camera.
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
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo/yb9-kbdock.c
> @@ -0,0 +1,317 @@
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
> +#include <linux/bitfield.h>
> +#include <linux/cleanup.h>
> +#include <linux/dmi.h>
> +#include <linux/input.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/pm.h>
> +#include <linux/slab.h>
> +#include <linux/wmi.h>
> +
> +#define YB9_KBDOCK_EVENT_GUID	"806BD2A2-177B-481D-BFB5-3BA0BB4A2285"
> +#define YB9_KBDOCK_QUERY_GUID	"E7F300FA-21CD-4003-ADAC-2696135982E6"
> +
> +/* 2-bit EC field encoding the keyboard dock position */
> +#define BKBD_FIELD		GENMASK(1, 0)
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
> +	struct mutex lock; /* protects input_dev and block_wdev */
> +	struct input_dev *input_dev;	/* set by event probe */
> +	struct wmi_device *block_wdev;	/* set by block probe */
> +} yb9;
> +
> +/**
> + * yb9_kbdock_query_locked() - Read BKBD from the block device.
> + * @log_dev: Device for logging.
> + *
> + * Context: Caller must hold yb9.lock.
> + * Returns: 0-3 on success, -errno on failure.
> + */
> +static int yb9_kbdock_query_locked(struct device *log_dev)
> +{
> +	struct wmi_buffer out = {};
> +	void *data __free(kfree) = NULL;
> +	u32 bkbd;
> +	int ret;
> +
> +	if (!yb9.block_wdev)
> +		return -ENODEV;
> +
> +	ret = wmidev_query_block(yb9.block_wdev, 0, &out);
> +	if (ret) {
> +		dev_warn(log_dev, "WQAF failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	data = out.data;
> +
> +	/*
> +	 * LENOVO_FEATURE_STATUS_DATA: 8-byte buffer {IDs=0x00060000, Status=BKBD}.
> +	 * BKBD is at bytes 4-7.
> +	 */
> +	if (out.length < 8) {
> +		dev_warn(log_dev, "WQAF: buffer too short (%zu)\n", out.length);
> +		return -EIO;
> +	}
> +
> +	memcpy(&bkbd, (u8 *)data + 4, sizeof(bkbd));
> +	return (int)FIELD_GET(BKBD_FIELD, bkbd);
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
> +/* Read BKBD and report if both WMI devices are ready.  Caller must hold yb9.lock. */
> +static void yb9_kbdock_sync_locked(struct device *log_dev)
> +{
> +	int bkbd;
> +
> +	if (!yb9.input_dev || !yb9.block_wdev)
> +		return;
> +
> +	bkbd = yb9_kbdock_query_locked(log_dev);
> +	if (bkbd >= 0)
> +		yb9_kbdock_report_locked(bkbd, log_dev);
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
> +	guard(mutex)(&yb9.lock);
> +	bkbd = yb9_kbdock_query_locked(dev);
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
> +	bkbd = FIELD_GET(BKBD_FIELD, data->integer.value);
> +
> +	guard(mutex)(&yb9.lock);
> +	if (yb9.input_dev)
> +		yb9_kbdock_report_locked(bkbd, &wdev->dev);
> +}
> +
> +static int yb9_kbdock_event_probe(struct wmi_device *wdev, const void *ctx)
> +{
> +	struct input_dev *input_dev;
> +	int err;
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
> +	guard(mutex)(&yb9.lock);
> +	yb9.input_dev = input_dev;
> +	yb9_kbdock_sync_locked(&wdev->dev);
> +	return 0;
> +}
> +
> +static void yb9_kbdock_event_remove(struct wmi_device *wdev)
> +{
> +	guard(mutex)(&yb9.lock);
> +	yb9.input_dev = NULL;
> +}
> +
> +static int yb9_kbdock_resume(struct device *dev)
> +{
> +	guard(mutex)(&yb9.lock);
> +	yb9_kbdock_sync_locked(dev);
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
> +	if (!dmi_check_system(yb9_kbdock_dmi_table))
> +		return -ENODEV;
> +
> +	guard(mutex)(&yb9.lock);
> +	yb9.block_wdev = wdev;
> +	yb9_kbdock_sync_locked(&wdev->dev);
> +	return 0;
> +}
> +
> +static void yb9_kbdock_block_remove(struct wmi_device *wdev)
> +{
> +	guard(mutex)(&yb9.lock);
> +	yb9.block_wdev = NULL;
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
> 
> --
> 2.54.0

