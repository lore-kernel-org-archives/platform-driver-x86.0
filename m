Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794625445;
	b=ws+JWHZTxHDNUfDeSKfaKRtNfOpv1DxQH9q7Xu5DzPPrfiYSQ3G7nKLuFBinZS0NhWZe
	 ZhB6bK5qwdF6cLuUXQsOLWbs8/7U2u6Mwv2PocU7uX5KMMm0mxOF/Ijd6UG0NFEUItN76
	 OrU9Ge+uAuyBPO1qwKM524nVZWjShiMBR7nZPFKHyavu0OEAp+C4zReEx9QwUSFDajupT
	 FcI8aB+70cBMEgWU97Y6Qh4oJljpaTgCBKMTys7XQAvPAbDEYNx20CZHSRDrTEnoaAsOC
	 xFkRpDdVH4YEjafhj3Js2RUOZ3K944GIY4ogWnQWEEJTTdZsVDo3ffWlSTtv9FT8epQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794625445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=XWwADe8GLoNoLjF/oyz1/OFei2FLfxnSw0Wa2LHuGjY=;
	b=poGm1x131BGc6zVlWXX1IABxI+CZu9TWn1Bw5X2RZ8zvfAi/1OcZKXqOMh7ODhlPlBhJ
	 GKKHvX/9yi36olq4VDvtGrg6YAL12O6bIvvTCf90XhI0NSk2dXPxBwitmGeNomla2vvfe
	 IwQUdSPm99UbTOVSN8eER9i0xym7vbQw7Bk38VL9WSWX860abWzKXrtrBso9RM47yluFh
	 KiyVndglKbv93UgX0Y45XBCCcYpPeoJfEBvbeCVih2qmVGFS2mNR7yASwoKDL0Z2Ttxvr
	 il9xoFrDqykjTV/JJlTReK8V+sNr6ArmQ5ADR2v/YWepdPtzI19m25rKn1QVosyAM/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rPIZp877;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.172
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE85606A332
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 03:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FE85606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rPIZp877
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5ec20398b05so2131035e0c.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Nov 2026 19:04:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794625443; cv=none;
        d=google.com; s=arc-20260327;
        b=PKtz0zCEuGbw3xCTvFUygiFm/n/jCsOizaEfvFK2yCT/6TerVS0BnCF83iPA4hMxZ/
         gO6Bp167ffPxouH+jVr2xXqbeORMXVE87uQ4f7Mwul/71M5x0/qWxVT1KzbbpCD91C76
         LPIuGplF3vlEwr21DZA0+UuKsY8KKZnT+jfXQlCoAqeqPUXFntOlQB1l2BEYtdpeKHBa
         YNsri1/vVM07a+LoNT6MFsdNpIKRC+7NqtR3T/77s0ZZi9K2g4fd1SWOfip0MSaI0sm0
         VOwk4UCDg2E2xWfmgDgTC37ldJHq/rH9SPdq714NLbd4Ks4Q/l2XXUpuR8/V92vrRqOb
         u1JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XWwADe8GLoNoLjF/oyz1/OFei2FLfxnSw0Wa2LHuGjY=;
        fh=RVaMn3nwghRFtcHHddGojN1ahqDsLA4QSZXgICo4AFY=;
        b=EI3J9ECZPOOA3ma890WXTFDI425QMlq7IOkydZmN8P7gax/FNkA76RMco/iYCKb59e
         23YaV5ypn3vUkXRipyQViocHT4Ud+3UrELg3bXftqelj1SWY02rsTEkWLd2x5PydfRh8
         BthvF99Ye5CXIFM2lo9nLgx8jeBnvJG1fxc1HfGj9d5w8QWPVs8bi+VewjZcZTcj7tcw
         mV6HOhcFSLTtAfSBY+OsehVe91Z0qw+RiH8UIjGqG1l+Dz3GURUiB62Cs/cgjMurCmf6
         +NlaAtfG0mL16PeCyRSzSgpd5IWaif8p+ml7BYbOIGdhM+/eT0pp0CFKnvf0hyRMse/T
         +H4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794625443; x=1795230243; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XWwADe8GLoNoLjF/oyz1/OFei2FLfxnSw0Wa2LHuGjY=;
        b=rPIZp877tbQadrv2K4Vdny2mnTvgojabbH0pC89G2N2VXWK2UblCcwVNZnefVmWrsh
         qi8EocyWwaeNwOMdyUWP+CMR+ku25SIAled6uR8iy9DP4MHF9U5TCuPjhrRzqbwjStN8
         GI3bvyaEYihscGofjMcWbaNmgumQwpVRxWrz4qHFkL5tDUvP31SR66hWFe1cjadhMbF/
         PXus2w3cNWiXDNJyZU+rTznOBnwZNnJmrf7JieXiAiuPR7kcwwfZYPSu08DxR7LYMTlI
         ogsqbdxph1x2Ux63+q5OdhjCFUQQdY3KwtXvW5PQCaQFRT4erJTdDyehBBT2tVJTj1jw
         KuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794625443; x=1795230243;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XWwADe8GLoNoLjF/oyz1/OFei2FLfxnSw0Wa2LHuGjY=;
        b=Vh0Ru1pjZN27NWq/05kXMhyWkFmo/enNPux0nMAwfz95N6r1lrlkNLbEpy3d8QJxvf
         3sscCzEENHILgcHpaqzNK4Jw09hMiMAxvdlCtzzq6foB6n+xGaW7bVhdJ+U00jhOjujX
         zOYxx3TalLPn1/zMpYQL4RkZuIY9k9Dja13s7vo/Tl0KBw9EkV+ExCclmaSv1LAs3nUY
         LMzytxbr2AedT+XbQS38GBL2ScViHheDTVAEuAl7e6P+/rpOi2DlbabfsPBN1pUj2SC9
         BODlExwNNW0dRSJ6SSX7RwvIBhtvo84KOVW3fu00LzuyJ21Nb0i13rdTd1RyHWbSHIxL
         ncNA==
X-Forwarded-Encrypted: i=1; AL+hErEDpopSTOZ0R8JR9aYVJAUbZCFvyWw9fBVgV4w52QCg9g16fOOT3onFrmo5NGzRJmIsi2wwFHBcaU1IJSU36v7L3JCB@vger.kernel.org
X-Gm-Message-State: APuU4Z91K1NyxVCH+Mf9u39d+jXAcQSMCqmYbv1AMp1mnylHR39TaZpJ
	gYDjYKQsv81GdN9tHZf+cnDp/ntYc/F8OlPXXeNMC4OuIuxrLfcJXdG6GpneB0iwsN6TfHzo7lL
	9Wy8pQfOdpbz6h+eXAe7FFh4EJtVspjQ=
X-Gm-Gg: AYBFou2oq7q2fFPZbRCNXUHUZ8baeaZbUIBjaAVGoV35PHctOWrGpmX+7eNlJPG/Kqi
	KHFBiFat3azcNqbFmRBSEn01iK/BdbaM/q8P+Wd16ozTVpoq+HVB8bBW7re78ySGz6uy6VYzwM7
	T+1par6rZ0uUmQ+1QzCQK4mFBG/5fz0x8fyccmNghdxatpiB2zcQSLqdptBS+XWIvBOEBOjeQcD
	rAQ11EVr5A0LN97lbS7Bw5MWpgzIHkeqAQyRNQGs07P/b2IHdodkXuJgsMe71y2Lqww1aqlB3wQ
	jpZ8JTG2pci4LQMscPMcz2CDnmBelYywXBY1gSmKtZLRNLXIMkMxL10VBPJygQuORIdIbO7RbOn
	QGf/KHQdbqoX/pmTz286DwHl40V+haxnP8/g=
X-Received: by 2002:a05:6122:62a6:b0:5e5:1be6:e12c with SMTP id
 71dfb90a1353d-5ee34adabf7mr1759772e0c.21.1794625443218; Fri, 13 Nov 2026
 19:04:03 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260827201611.99825-1-tchatard@gmail.com> <be6f70a3-5792-4a4b-9f03-591869fb9786@uni-koeln.de>
In-Reply-To: <be6f70a3-5792-4a4b-9f03-591869fb9786@uni-koeln.de>
From: Thierry Chatard <tchatard@gmail.com>
Date: Fri, 13 Nov 2026 19:03:52 -0800
X-Gm-Features: AclHuK_QHGedDaTSz4ALKjerOXJxyF7FrgwajFWtVN2oN2T1srpeliyS_lJ87qM
Message-ID: <CAB9TEqztrZ5TqRd3-iJpYiHBzK2rCh-jC9=XkTut1OV+Jf4Qag@mail.gmail.com>
Subject: Re: [PATCH v9 0/6] Enable cameras on Dell Latitude 5285 2-in-1
To: meisena2@uni-koeln.de
Cc: andriy.shevchenko@intel.com, djrscally@gmail.com, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com, jacopo.mondi@ideasonboard.com, lee@kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, mchehab@kernel.org, 
	nicholas@rothemail.net, platform-driver-x86@vger.kernel.org, 
	sakari.ailus@linux.intel.com, v.vitovt@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Matthias,

Thanks a lot for testing on the 5290 and for the detailed report - great
that the front camera already comes up.

One thing worth flagging: the 5285 series has since been merged upstream
(mainline as of 7.4-rc1 - the mfd quirks via Lee's tree, the int3472 board
data and the media bits via the media tree). So there's no open series to
extend anymore; 5290 support would be a small follow-up on top of mainline
rather than an addition to this thread.

From your report the 5290 needs the same two pieces the 5285 did, so I
suggest two short patches:

1) mfd: intel-lpss: add Dell Latitude 5290 to the resource conflict quirk
- just another DMI entry in intel_lpss_quirk_dmi[]. This replaces the
acpi_enforce_resources=lax stand-in you used, so please test with the
real quirk entry rather than the boot parameter. Goes via Lee's tree.
Template: the 7275 commit that did exactly this,
495d5f41a6161dffafe61ac458459c62d440344a.

2) platform/x86: int3472: tps68470: add board data for Dell Latitude 5290
- a DMI entry in int3472_tps68470_board_data_table plus the board data.
Template: the 5285 board-data commit e605a094ff7a.

Two suggestions before sending:

- Please coordinate with Vitalii Tytskyi (CC'd) - his 5290 tree already
has 5290 board data and covers the rear camera (OV8858), so it is
better to reuse/validate that than to reuse the 7212 data. That also
gets the rear camera tested, which I think is still open on your side.

- Since you have the hardware, it is best that the patches come from you
(and/or Vitalii) with a Tested-by on the actual 5290 - board-data and
quirk patches really want to be tested on the machine, and I cannot do
that for the 5290.

I'm happy to review and give a Reviewed-by on the mfd quirk.

Thanks again,
Thierry

On Fri, Nov 13, 2026 04:04 PM, Matthias Eisenacher
<meisena2@uni-koeln.de> wrote:
>
> Hi Thierry,
>
> Thanks for this work. A short report from a Dell Latitude 5290 2-in-1
> (same platform as the 5285), in case it helps to extend this series
> to the 5290.
>
> I did not apply this series. Instead I tested the minimal changes
> needed for the front camera on the 5290:
>
> - Linux Mint 22 (Ubuntu 24.04 base), kernel 7.0.0-43-generic (HWE)
> - Added a DMI entry for "Latitude 5290 2-in-1" to
>    int3472_tps68470_board_data_table, reusing
>    dell_7212_tps68470_board_data
> - Booted with acpi_enforce_resources=lax as a stand-in for your
>    intel-lpss quirk. Without it I get the same I2C4 conflict as on
>    the 5285:
>
>    ACPI Warning: SystemMemory range 0x00000000FE028000-0x00000000FE0281FF
>    conflicts with OpRegion 0x00000000FE028000-0x00000000FE028207
>    (\_SB.PCI0.GEXP.BAR0)
>    intel-lpss INT3446:00: probe with driver intel-lpss failed with error -16
>
> With both changes the front camera (OV5670/INT3479) works: cam -l
> lists "Internal front camera (\_SB_.PCI0.LNK0)", and I get video via
> libcamerasrc/GStreamer and in Zoom (via libcamerify). The rear camera
> was not tested.
>
> DMI: sys_vendor "Dell Inc.", product_name "Latitude 5290 2-in-1",
> board 09WJPW.
>
> So the 5290 seems to need the same intel-lpss quirk plus board data.
> Vitalii's tree has 5290 board data; would it make sense to add the
> 5290 DMI matches to this series or to a follow-up? I'm happy to test
> patches on the 5290.
>
> Thanks,
> Matthias
