Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=134.95.86.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794671547;
	b=N0WDc1fKsc10iaSpPZ52ulB0WkKglfZZ/6t+ZzJz3FwNNI9vBAeUeIvPddFaK+Uf0tH5
	 9ofRYLdIBySjuNRLbJrKoAj3X43w9zmcIEAt/yHoJCPQwLtOTtKB4BqFl/E2Dwl2rq3ru
	 AKCG1f7py6TycWfhtOrq6v+/DhrcXjtc2lfhcsbjK9DjqEEWNEzXrpz4oI8Gk7F+JC8wy
	 OP60mjYzwhZR0SlUkOb711L931KiSVpQ8N1wJZ0RxlAsxH2M5aIBb6zoP+Cy2cvkK228i
	 DVX7K6dLntjLiM6LFnwIU9od9OBpD+VGWYsazxPLb11+MxNPoxY6yIQxYbmQhhy5Lgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794671547;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IPAS-Result:IronPort-Data:IronPort-HdrOrdr:X-Talos-CUID:
	 X-Talos-MUID:X-IronPort-Anti-Spam-Filtered:X-IronPort-AV:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:
	 Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=L4/gJCvYZu8b2gumACcxHfq6IilOehFxXpDFdZhpliA=;
	b=ep4wi1+q1QOzlHZxwc6SiDloHlT1yMxN4esbfcAW+/krTFnljGeqe4IW2wvngM4+9ktG
	 P18VTzGq7H3jZhmmkwpMzItc8bsl7gbmZ60e9jzWyj/7P766hi4PZJ18adxECtERffKL0
	 XKRspIjQu/fZPlKu/vzK1HP0ho7NzvASC1J/Ath0ScPhIUzKp1pvswr+Dabwx2y0MqElJ
	 fwyLwkBKvB3Vc7iyeP8CUTr9kpOdpSDeXevlfJgZ4g590oXlhdtmREbbcDLlTt+flDIp3
	 Wju7UA3HsH6Gv1B2zHGqw+/hZu4q3K710OcR/mQZZLkzflzwQwcdBUobRpND+OeK16Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uni-koeln.de;
	spf=pass smtp.mailfrom=uni-koeln.de;
	dkim=pass header.d=uni-koeln.de header.i=@uni-koeln.de header.a=rsa-sha256 header.s=2023 header.b=R34zROys;
	arc=none smtp.remote-ip=134.95.86.59
Received: from mail-out-v2.uni-koeln.de (mail-out-v2.uni-koeln.de [134.95.86.59])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B38606A323;
	Sat, 14 Nov 2026 15:52:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40B38606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uni-koeln.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uni-koeln.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=uni-koeln.de header.i=@uni-koeln.de header.a=rsa-sha256 header.s=2023 header.b=R34zROys
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=uni-koeln.de; i=@uni-koeln.de; q=dns/txt; s=2023;
  t=1794671546; x=1826207546;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=L4/gJCvYZu8b2gumACcxHfq6IilOehFxXpDFdZhpliA=;
  b=R34zROysljKpMRewf3RSVXkXIVrG3KEi9zL0JY1CslPosMPnyR8H8mvE
   WTAhwwfghL86h1BD6WzYS8yleAkq0K1arr1is/GT8vbGn4ky7XhaSworq
   tA+Eno/ovj5KpRJLUe9tLGfiLKx6jFo+/FL0FE+lIDH/armWfprhnuiWB
   HvyN8c8hgBIFhHcInmWhA4HESW4fbxVX7yu+7WXh6aghM40uggmky9b1c
   gcxTEnzxFXilJg+CVAQZF4Cy+lBeuhxD/9fZI+DnF/t/En6LGq1deKbYg
   B/YNPC1lviYWDqkC9Z/0gXucFvI5PJg4M2J8Cqq1H+LFbQaY4kKy120dX
   w==;
X-CSE-ConnectionGUID: Iq6FXI9ARJW4fNhqlfUiOA==
X-CSE-MsgGUID: wknFR3J5S5uCn37DZuAeYA==
X-IPAS-Result: =?us-ascii?q?A+CBCQD2gfhq/wCiACoSAIIYWh4BAQsSDIIFCwKCFoMgh?=
 =?us-ascii?q?FeQKgEDAQEGgREtA4t1ki2Bfg8BDwEBUQQBAYUFAo4fKDYHDgECBAMCAwEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQoBAQYBAQEBAQEGBYEhhglTSQGJSAGGAAEBAQMjFUEQCw4KA?=
 =?us-ascii?q?gImAgJWBhMCAQGCfoJ1ulmBMoEB3kmBdBWBCi6IYgGFeAEbhGKBP4EQgRUng?=
 =?us-ascii?q?gNRMT6IH4JqBIIigQyCXIU6iCyHUlJ4eCwBVRMXCwcFgSVDA4EGI0sFLR2BI?=
 =?us-ascii?q?yEdFxEeWBsGBRIgKkBDW4ESgQVdgSsoXQECH0YtFYF1AoJRgSMCWwIBSUEOB?=
 =?us-ascii?q?0VTCSVDEkckIggSCQETGiwKgRo1PAkmBDsVDFsMCxoFGkcIAgsCDHQoERATH?=
 =?us-ascii?q?R4kLwUaJj4bCoEOKW09NwoLGQQ9lAODDmcbGxyBGUkoEQEeAQoLL1cBkguDN?=
 =?us-ascii?q?Y4ogiCfXAaCOoFqoWMGQoQEjRSGPBCRaIEmmQikJIR1AgoHGYFvDoIAcYFtg?=
 =?us-ascii?q?UlTGQ+OLhaBFAEI0H54PQEBBwIHDgMLgWiLM4RPLYFPAQE?=
IronPort-Data: A9a23:HiXi+aP1c9gqyGfvrR2Gl8FynXyQoLVcMsEvi/4bfWQNrUp03mYGz
 DYdUW+APvjbazP3edB/PoS19k1XupHUyoRqTXM5pCpnJ55oRWgpJvzCdxutYHnCRiHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn/SMhvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRWmthg
 vus5ZeAULOZ82QsaDxNsvvf8EoHUMna4Vv0gHRuPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WT1cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqU547hZMUAf3
 MY6F2wDSBCag+yLwZWSH7wEasQLdKEHPasEv214iDbEEbM8Qc+FWb/Yo8Je3XIzgc1KG7DSa
 qL1axI1ZUyYMRQVYg9FUMBnxrX63yCvG9FbgAv9Sa4f5mXS1wF32eLFLdzUP9+NSMFT2EqVz
 o7D1z+gW0BKaIfEodaD2m2vgMH1xgGmY98PP7vjqdJYnXSe90VGXXX6UnP++5FVkHWWR9lfI
 lAd4CYGoq079UjtRd74NzWxpnKevw9aQNpdDeY65QeOzYLV5RqUAi4PSTspQNAkrtQ9TDgux
 3eGmtroAXpkt7j9YXKU8KybhTC/Iy4YKSkFfyBsZQoB+96loogpkBPJQ9BLFK+zk82zGDfsz
 jTMpy87750RhMUMz6L9+FfBjzOEp5TERxUy4A/QV3ipqAh+YeaNY4GlwVvW9/BNKMCeVFbpl
 HwFndWOqeMDF5eAkASTT+gXWrKk/fCINHvbm1EHN50g8Sm9vnuucYFZyC9xKV0vMcsefzLtJ
 kjJtmt54ZRTMXujZ4d0bpi3BsBsyrLvffzjV/vUad5HebBrcxOH8SRnZErW2W3x+GA0lagjN
 5CBdIOgF3cEBL4i3Grob/kS3KVtxS0kw27XA5fhwHyPyrOdbWSUD74ENEaVRuQ46r6U5gTT7
 9tbccCNzn13TqvgYzXQ75I7IlUDLHx9Dpfzw/G7bcaYJxZ+XWY8F7rLwexnYZZ32blTl6LL+
 Xy5XAlUxTITmEH6FOlDUVg7AJuHYHq1hStT0fAEVbpw50UeXA==
IronPort-HdrOrdr: A9a23:ytMeA62Mjqj9BQcUwbYHnAqjBLEkLtp133Aq2lEZdPU1SL39qy
 nKpp9w6faaskdyZJheo6HmBEDtexzhHOdOjLX5ZI3PYOCEghrMEGgB1/qA/9SIIUSXygc678
 ZdmsNFaOEYY2IVsS/y2njfL+od
X-Talos-CUID: 9a23:7+VIvmHby2jGd2+6qmJG7RA6KuF0W0f/8yveBU+hDWhUSZq8HAo=
X-Talos-MUID: =?us-ascii?q?9a23=3Aa3kA2A9peYec2XN/TZpU5aOQf9hr5YqUU2JQqsg?=
 =?us-ascii?q?bkM/fagBCJh6QvR3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,213,1787004000"; 
   d="scan'208";a="31198433"
Received: from smtp-out-rh7.rrz.uni-koeln.de ([IPv6:2a00:a200:0:12::118])
  by mail-out-v2.uni-koeln.de with ESMTP/TLS/ECDHE-ECDSA-AES256-GCM-SHA384; 14 Nov 2026 16:52:16 +0100
Received: from smtp-auth-rh8.rrz.uni-koeln.de (smtp-auth-rh8.rrz.uni-koeln.de [IPv6:2a00:a200:0:10::196])
	by smtp-out.rrz.uni-koeln.de (8.14.7/8.14.7) with ESMTP id 6AEFqFIW003885;
	Sat, 14 Nov 2026 16:52:15 +0100
Received: from [IPV6:2a00:a200:0:e00::69] ([IPv6:2a00:a200:0:e00:0:0:0:69])
	(authenticated as user meisena2 using CRAM-MD5 bits=0)
	by smtp-auth.uni-koeln.de (8.15.2/8.15.2) with ESMTPSA id 6AEFqEVf1854920
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 14 Nov 2026 16:52:14 +0100
Message-ID: <13d8e30b-79e1-40ab-9d06-03993004b814@uni-koeln.de>
Date: Sat, 14 Nov 2026 16:52:14 +0100
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
Subject: Re: [PATCH v9 0/6] Enable cameras on Dell Latitude 5285 2-in-1
To: Thierry Chatard <tchatard@gmail.com>
Cc: andriy.shevchenko@intel.com, djrscally@gmail.com, hansg@kernel.org,
        ilpo.jarvinen@linux.intel.com, jacopo.mondi@ideasonboard.com,
        lee@kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        nicholas@rothemail.net, platform-driver-x86@vger.kernel.org,
        sakari.ailus@linux.intel.com, v.vitovt@gmail.com
References: <20260827201611.99825-1-tchatard@gmail.com>
 <be6f70a3-5792-4a4b-9f03-591869fb9786@uni-koeln.de>
 <CAB9TEqztrZ5TqRd3-iJpYiHBzK2rCh-jC9=XkTut1OV+Jf4Qag@mail.gmail.com>
Content-Language: de-DE
From: Matthias Eisenacher <meisena2@uni-koeln.de>
In-Reply-To: <CAB9TEqztrZ5TqRd3-iJpYiHBzK2rCh-jC9=XkTut1OV+Jf4Qag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.3

Hi Thierry, Vitalii,

Thanks for the quick and helpful reply, and congratulations on getting
the 5285 series merged.

I should be upfront: I'm a user rather than a kernel developer, and my
5290 is a daily-use machine on a distribution kernel (7.0), so I can't
easily run and test a 7.4-rc mainline kernel on it at the moment. I
also only use the front camera.

Vitalii, since your tree already has 5290 board data covering both
cameras, you are probably in a much better position to send the two
follow-up patches Thierry suggested. My report above at least confirms
that the 5290 shows the same INT3446 resource conflict and needs board
data, and that the front camera works once both are addressed.

If DMI data, an acpidump or other information from my machine would
help, I'm happy to provide it.

Thanks again,
Matthias Eisenacher

Am 14.11.26 um 04:03 schrieb Thierry Chatard:
> Hi Matthias,
>
> Thanks a lot for testing on the 5290 and for the detailed report - great
> that the front camera already comes up.
>
> One thing worth flagging: the 5285 series has since been merged upstream
> (mainline as of 7.4-rc1 - the mfd quirks via Lee's tree, the int3472 board
> data and the media bits via the media tree). So there's no open series to
> extend anymore; 5290 support would be a small follow-up on top of mainline
> rather than an addition to this thread.
>
>  From your report the 5290 needs the same two pieces the 5285 did, so I
> suggest two short patches:
>
> 1) mfd: intel-lpss: add Dell Latitude 5290 to the resource conflict quirk
> - just another DMI entry in intel_lpss_quirk_dmi[]. This replaces the
> acpi_enforce_resources=lax stand-in you used, so please test with the
> real quirk entry rather than the boot parameter. Goes via Lee's tree.
> Template: the 7275 commit that did exactly this,
> 495d5f41a6161dffafe61ac458459c62d440344a.
>
> 2) platform/x86: int3472: tps68470: add board data for Dell Latitude 5290
> - a DMI entry in int3472_tps68470_board_data_table plus the board data.
> Template: the 5285 board-data commit e605a094ff7a.
>
> Two suggestions before sending:
>
> - Please coordinate with Vitalii Tytskyi (CC'd) - his 5290 tree already
> has 5290 board data and covers the rear camera (OV8858), so it is
> better to reuse/validate that than to reuse the 7212 data. That also
> gets the rear camera tested, which I think is still open on your side.
>
> - Since you have the hardware, it is best that the patches come from you
> (and/or Vitalii) with a Tested-by on the actual 5290 - board-data and
> quirk patches really want to be tested on the machine, and I cannot do
> that for the 5290.
>
> I'm happy to review and give a Reviewed-by on the mfd quirk.
>
> Thanks again,
> Thierry
>
> On Fri, Nov 13, 2026 04:04 PM, Matthias Eisenacher
> <meisena2@uni-koeln.de> wrote:
>> Hi Thierry,
>>
>> Thanks for this work. A short report from a Dell Latitude 5290 2-in-1
>> (same platform as the 5285), in case it helps to extend this series
>> to the 5290.
>>
>> I did not apply this series. Instead I tested the minimal changes
>> needed for the front camera on the 5290:
>>
>> - Linux Mint 22 (Ubuntu 24.04 base), kernel 7.0.0-43-generic (HWE)
>> - Added a DMI entry for "Latitude 5290 2-in-1" to
>>     int3472_tps68470_board_data_table, reusing
>>     dell_7212_tps68470_board_data
>> - Booted with acpi_enforce_resources=lax as a stand-in for your
>>     intel-lpss quirk. Without it I get the same I2C4 conflict as on
>>     the 5285:
>>
>>     ACPI Warning: SystemMemory range 0x00000000FE028000-0x00000000FE0281FF
>>     conflicts with OpRegion 0x00000000FE028000-0x00000000FE028207
>>     (\_SB.PCI0.GEXP.BAR0)
>>     intel-lpss INT3446:00: probe with driver intel-lpss failed with error -16
>>
>> With both changes the front camera (OV5670/INT3479) works: cam -l
>> lists "Internal front camera (\_SB_.PCI0.LNK0)", and I get video via
>> libcamerasrc/GStreamer and in Zoom (via libcamerify). The rear camera
>> was not tested.
>>
>> DMI: sys_vendor "Dell Inc.", product_name "Latitude 5290 2-in-1",
>> board 09WJPW.
>>
>> So the 5290 seems to need the same intel-lpss quirk plus board data.
>> Vitalii's tree has 5290 board data; would it make sense to add the
>> 5290 DMI matches to this series or to a follow-up? I'm happy to test
>> patches on the 5290.
>>
>> Thanks,
>> Matthias
