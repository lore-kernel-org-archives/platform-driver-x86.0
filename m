Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC20E134CCF
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Jun 2026 15:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780934117; cv=none; b=PFChVF+lT1DuWCXkbhTpHBnzKm7MGoy5FLUJjw7T9aGstQo1e6YGwT+Pj2OSABic3oF65WEA0tLf9LMRViE2jOLGw8cE8fPZ2HgIG2p++Qa6IThLrsBdUHBgpqgPGU9Ccw+Lgi3QO0k4gJEHs+2B+A8XgwMr3CEV1GAAlW5m6U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780934117; c=relaxed/simple;
	bh=LsqKS4ubzb23EAlPdYX3nLWBEhaeoVJ2WqIdxxY+So4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=H8Ks+JcQbpmrb5rKcr37N/HEIk2GY+1PChO2AZjHfG1GZ2RANYgk8ESefWJRY/3NNWzvymndAnfiCqaTGU7IKnwOdXdpK/AXYYKDL9fSMFVQjFBsUPGYx7Mw6JCrbQRNIMqbIxHhwM14R0Q++evdUf4vD6Z0L2iwnVvc9A7EVRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XeQhoNYP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KDy078lu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XeQhoNYP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KDy078lu"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFei74008673
	for <platform-driver-x86@vger.kernel.org>; Mon, 8 Jun 2026 15:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LMoEYMeiANnStHjlH2AoSWfQajtKiihJfChAlYfR1Us=; b=XeQhoNYPtHx7mXA/
	9aGDqdIICzP6fgkGz0Tf3rhRsRq9m2WE1xRbkDWxtyBdZGHqY8S13fp54MyUM+Xh
	kVfQTZ/wcD8j919Ye6/pJGdFwlbCgMK6yj072f4L7lpJeehE6wl4lcXL1Gq8Qurs
	mz4FWFgyl7pHDPZOAwYpukmE6Dfd92g82GEXM6NqY9lRr456NR/VQiZT83zbfdSb
	HevKKQwZhm4i7R2HJ/8swIp2SXPANJkx7MyTjzfr6HtL0ShXhye2JTTEO9iYRPaM
	ulyaBezrKG10kFB1p7FfXeuuIZ1X/oltl8DboiQkzypJLBdQS8pENnLTUEdKWtFR
	YzAJog==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entr0hvts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 08 Jun 2026 15:55:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5177f07ea82so113078801cf.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Jun 2026 08:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780934114; x=1781538914; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LMoEYMeiANnStHjlH2AoSWfQajtKiihJfChAlYfR1Us=;
        b=KDy078luZkOzi9y13CH1rZ1d6eBjtzdvooqYILP7tw4u0Tzwt2T7wxwJo2HXymbOkE
         DeVCYccDPdK7TJajUADuuD1cUi8eX/0DhtNurPt2x1HI8ckr+FM9E5BLoyTRwYuchGwe
         ARSs0m/YlrVkuNwHT23wQEkxAA+efoz8tQiLr+71x6qiRRyb/dUqymHwdoq3RQxkCka1
         ge0nEVZaVN3OoXinzUcrgAEqyysDG9WMHiPmBfpNLywCb+qu+lp+Nml4EYqrp5C1etIp
         laaK1NrXYoSxKaMMt9KyO/N6cQ1FD1BGxN0XDEZr2mal5ZgXkfl4sBd3c7hBXc1L+hNa
         qM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780934114; x=1781538914;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LMoEYMeiANnStHjlH2AoSWfQajtKiihJfChAlYfR1Us=;
        b=lckgchEePO18IS/fz/LGRkcOVQVnqxiPmlh+rDLrNmfDGpfqGeTJnwh6LF+haSgugL
         1eg3xRmZex++PzIAssCOybFLMd5GVhMYhP8t/zSt8kX1JdsIoZt11mbuC7FvIIX0wsFQ
         A+PpEKEGJZpAqG2mHaFK1xkjlKulezV5olihuTgKYdC9vvnVpPcShWRpKnnBiVEhPeoF
         +KqGNIE/gidNkRZlom+W4x99YBJUTSdBkCEmPFiZK+F1Bp+iBYJAdyZfmAcKyCyH3Oq0
         /6Z9EC6M/fzJQ9KjUf2Ulo8rGOjcIjebuYiCVn3pRoDkdKbzCWNEo8lmvaX1qHQEkARw
         rtFw==
X-Gm-Message-State: AOJu0Yy8SKhlz/o+Trf3fx5j3I8T4z2P6CUAdcl7fyGFL5nyjTUgbfqm
	6MmzhQqywb7X1OxTjCfX31IPxnPusztAqNh23DBy/Ps+/idiN4B2DJNEDbgTdAxFmAn3Og3ZI4N
	apLIYVlgB+h0JSSZHvbGw31SoHQisCnVk5Wp/DDeZb1hQlL1QBCYZYgyTOHMMUG45Az6cGsSoZr
	y2
X-Gm-Gg: Acq92OHVGVipOGN9aN6a1C/meNwhTjBJPyGaSiltxRaVJ6fM6EPu0T+voQoWdEOJzE3
	sV+vyYuovdfuMatce95RQCClbsTk6PoIW0sNLW3t7p6pnYMe29k6EB3e9SXXJSFP3TyKKFJ4NLG
	7KtosBF3DIf5ZPNsoJVn+kXICP8Tg0PfIyaexNM/P8TxZAQQ9wEqFdvFigRmoSlmKhtG1yPLBOQ
	FAfxSM35sYBocuVpQtJQeFi8ag0AstRM4rYh9p5lzf9WlxJdOItIHpiGS4z+lIakPBsBsBHjOZR
	xRcHtXYutsHT0CrNpE+KWlBhztUCNHxMjbevYxyZKDAzAIY0riyGTX5LbAu6kk45S87HRAjrkUW
	f1kRGG/2ap64SdJ+xOAcR1+0PsP9c95IZFVZPtoPEQTmDuqohlSDaoBDdbbTUlFTNUTbYiujMkS
	lJ0hN4pKlJQP8mZAqRlHcT8vWjEwCi7eJ/9c9b75HQ5IYpL13kvaFivO3AINB32EGaSBiiTJNDB
	NnAOXyt0x8B8nFlBKLDjB86H/Q=
X-Received: by 2002:ac8:7c46:0:b0:517:6dbe:4973 with SMTP id d75a77b69052e-51795a2c054mr223818801cf.14.1780934113956;
        Mon, 08 Jun 2026 08:55:13 -0700 (PDT)
X-Received: by 2002:ac8:7c46:0:b0:517:6dbe:4973 with SMTP id d75a77b69052e-51795a2c054mr223818041cf.14.1780934113248;
        Mon, 08 Jun 2026 08:55:13 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0517712a7sm897445766b.4.2026.06.08.08.55.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 08:55:12 -0700 (PDT)
Message-ID: <dda1efcd-f7f5-4ed5-9481-5047d43924cc@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 17:55:10 +0200
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
To: Dave Carey <carvsdriver@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, pithenrich2d@googlemail.com,
        mpearson-lenovo@squebb.ca, hdegoede@redhat.com,
        ilpo.jarvinen@linux.intel.com, armin.wolf@outlook.de,
        linux-kernel@vger.kernel.org
References: <20260521144034.282419-1-carvsdriver@gmail.com>
 <20260527122701.242907-1-carvsdriver@gmail.com>
 <78833ba9-7ea0-4c7f-8d41-ac0fd64ba15c@oss.qualcomm.com>
 <20260608125211.11957-1-carvsdriver@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260608125211.11957-1-carvsdriver@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE1MSBTYWx0ZWRfX7dyes88Cl824
 sMVvFfdSEre2aRfQMXMdsfJYunwwEBoj0Ls80DwVTeQtPo8pMNX7pQJdImDSwvYAcZ6ZJ7fD+EQ
 P90ruNEu8tP7lOr2IZ5LW/yCa9Zc6u4uWMc/6+yUMLiQ15kD2jtwkcI5WRsIC9u2s9eq5kO9egr
 FDdnQKI6hsb3AqbUIor+dpb5OZe0u1B0a4Y3KMOzuvnVQLUWBVjGoJngjXRg8lDafUt9PiHwDEM
 0OuOCDYBkprevPiBcd/udAfzAexbGF6aYXIgyHwYkt7yG5zj3Zpr6WGM0nTXrRauYzqDLvUczOK
 KTJTF9eKpx3y08ajtZLeliJLoPTZnd/4fdr7zvgWBKFlTL1686HPmJ+cT/LSEzyGzzXe9LfcOXm
 gpfafq5nkpT1Il4mxi/GqF68LjS853twuzpIk2miD6qqd+5H1O42akwMqUFU+DAOWKXvYUfBusq
 P8fYXFGhKZtDoqFOK0g==
X-Proofpoint-ORIG-GUID: a3yoWaXU75BW6H1oBJmTTC_OTaEAJjjX
X-Proofpoint-GUID: a3yoWaXU75BW6H1oBJmTTC_OTaEAJjjX
X-Authority-Analysis: v=2.4 cv=VowTxe2n c=1 sm=1 tr=0 ts=6a26e5e2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=eF78JEezN1nfUyc3resA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080151

Hi Dave,

On 8-Jun-26 14:52, Dave Carey wrote:
> On 08-Jun-26 11:13, Hans de Goede wrote:
>> Dave, I see that your "[PATCH v5] platform/x86/lenovo: Add Yoga Book 9 keyboard
>> dock detection driver" patch also uses a DMI match, is that necessary ?
>>
>> If we need the DMI match because the GUID is not unique enough, then we might
>> just as well add this functionality here as this patch is doing ...
> 
> Yes, the DMI match is necessary, specifically for the block GUID
> (E7F300FA, LENOVO_FEATURE_STATUS_DATA). This is a generic Lenovo feature
> query interface that may appear on other Lenovo machines for unrelated
> purposes. Both GUIDs live under a PNP0C14 device with _UID "GMZN" on
> this machine, which is firmware-specific, but the WMI core matches by
> GUID alone — not by parent device UID. Without the DMI guard the block
> driver could bind on unrelated hardware and misinterpret WQAF's return
> value as a BKBD field.
> 
> The event GUID (806BD2A2, LENOVO_BTKBD_EVENT) is named specifically for
> Bluetooth keyboard events in the BMOF and is likely unique to BT keyboard
> dock hardware, but keeping the DMI guard on both drivers is the safe choice
> given we can't easily verify all Lenovo platforms.
> 
>> I do wonder since this seems to emit TP_HKEY_EV_TABLET_CHANGED thinkpad_acpi
>> events if the existing thinkpad_acpi support does not already provide working
>> SW_TABLET_MODE input ?
>>
>> If it does then also having the WMI driver emit SW_TABLET_MODE events seems
>> to be undesirable duplicate functionality.
> 
> Tested: no overlap. On the YB9 the existing SW_TABLET_MODE source is
> lenovo-ymc (not thinkpad_acpi).

Hmm, interesting not having thinkpad_acpi on a (non ThinkPad) Yoga makes
sense. Let me double check if this driver really is duplicate with
the thinkpad_acpi patch from pit:

https://patchwork.kernel.org/project/platform-driver-x86/patch/20260419102724.91451-1-pithenrich2d@gmail.com/

Ok, I should have looked closer, that one if for a "ThinkPad X1 Fold 16 Gen 1"
and yours is for the "Yoga Book 9" so I was mistaken that these drivers are
duplicate, we will need both, my bad.

That does bring the question if we want to unify the userspace interface,
but the 2 setups seem to be different enough that having a single unified
userspace interface also seems unnecessary.

The yoga book 9 has a keyboard which as your driver reports can either
cover the bottom or top half of the bottom screen, where as the
"ThinkPad X1 Fold 16 Gen 1" has a keyboard trackpad combo which covers
the whole bottom screen (*) when attached to the screen.

*) bottom screen half as it is a single big screen

> The YMC driver tracks hinge/orientation
> modes (clamshell=0, tent/tablet/stand=1) — it does not track BT keyboard
> attachment state. I ran evtest on both the lenovo-ymc and yb9-kbdock input
> devices while detaching and reattaching the keyboard: lenovo-ymc did not
> fire at all; only yb9-kbdock emitted SW_TABLET_MODE events. There is no
> duplicate functionality.

Hmm, so lenovo-ymc does load and create a /dev/input/event# nodes with
a SW_TABLET_MODE switch reported as being present ?

That is a problem because for switches unlike keys the mere presence
of them has meaning. E.g GNOME will read the SW_TABLET_MODE switch
value at GNOME start and use that to decide if it should start in tablet
or regular=clamshell/desktop mode. So the mere presence of a SW_* style
evdev node can cause behavior changes.

And userspace really does not expect there to be 2 evdev nodes which
both report SW_TABLET_MODE. So I think we need a patch to the lenovo-ymc
driver to exit probe() early (with return 0) when loading on the
yoga book 9 to avoid there being 2 SW_TABLET_MODE reporting input devices.

Regards,

Hans



