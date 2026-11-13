Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=134.95.86.58
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582281;
	b=WqOT8DFSDEp0Sy09DyS7bboZyQsVrV6GpbHs16TWdFIt0aweYXl39j4iKFEQ2nU0JjyN
	 7WTtFmeHjpYvKutq2HTqUbCgjPK38858TqDnR2cZeV8hSzVqZ3vctmAOYKSAR58U50md8
	 gs0zB++PFe+KlSvhbj7I28alZklnwLCrusVHeexte5ez4XIl7oBwwiCmah7z4CIrFVONe
	 mWH25SYTX/dnHXboKZJF7ENG0cGjcyA6TQ6Q2zSP0XnEuTm4e7IjILkK3pXFgo19urdDP
	 9pDpJ2OIiZ1CU/80gf27VlzergpBMgy86s9n0uA6VH48SIueLku8HSKz3c+un8NM9Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582281;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IPAS-Result:IronPort-Data:IronPort-HdrOrdr:X-Talos-CUID:
	 X-Talos-MUID:X-IronPort-Anti-Spam-Filtered:X-IronPort-AV:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:To:Cc:
	 References:Subject:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=I48ZfHOS9BJP4vzduWQIG8oFmvz0f4zxKM14ZpffZKo=;
	b=NIM5gYs1dmFmpFIPk+5bmB9r2p9SJbkAzsdffF5K44eGC0ik3V/KJgqLwXjIDfN5v0lo
	 RBDc9TYo3PqWj8hnzO/ZZqLyw2q5/7f3V0SRzeAXO39iXKm8e1cZSFwQe1t/1Elf/odux
	 g85Hqk4nXTY75PTzhIkR8lehKosmzfhRZHdz8XzsTwqHLfmHRuRTbei17Hk+nXVEnLwpG
	 cYxSPOJHQEZ+kWQOivqdps6xYJ5DvLd89nvcQsR2x/LStiXfc7ND2VYfZc8Xf49dpjnTn
	 VYC5uSMfFyGRRp6NDtZp91itSY6/WMHMN3trLwyz0o+/rHy0lGRCd9ggY9TTJFJ5mOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uni-koeln.de;
	spf=pass smtp.mailfrom=uni-koeln.de;
	dkim=pass header.d=uni-koeln.de header.i=@uni-koeln.de header.a=rsa-sha256 header.s=2023 header.b=izfbBsLy;
	arc=none smtp.remote-ip=134.95.86.58
Received: from mail-out-v1.uni-koeln.de (mail-out-v1.uni-koeln.de [134.95.86.58])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305CF606A884;
	Fri, 13 Nov 2026 15:04:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 305CF606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uni-koeln.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uni-koeln.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=uni-koeln.de header.i=@uni-koeln.de header.a=rsa-sha256 header.s=2023 header.b=izfbBsLy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=uni-koeln.de; i=@uni-koeln.de; q=dns/txt; s=2023;
  t=1794582280; x=1826118280;
  h=message-id:date:mime-version:to:cc:references:subject:
   from:in-reply-to:content-transfer-encoding;
  bh=I48ZfHOS9BJP4vzduWQIG8oFmvz0f4zxKM14ZpffZKo=;
  b=izfbBsLyGi3v3ep01VcbrhMo17U/HY9cJt9kQfmqGER4zXMDQaPzvTOI
   1LnI1jRP8d9EJfl92f/2eq8grJ/ThVhrMAWrZ8TL9fr5W2kqMYbl+pztC
   bkgcOLYTk2V2oRKUQUjDUdVWRRWk0gf+0k1IWvb6Po14n4ivg90vvmceH
   enozl8fHsBIdxYvMuhDijbVxfRHZesqXNmjvt4Brv+FOXeRHUOdP+RsoE
   fRj2UOCRBqEnry4tyJyTL0uJ8gkOURn9OKGY6V/qVpSw0wzq3qZXYwl6z
   RWpQUgte6Xb4ZN0Bv7YdKZeAJKjvGNTUiBxEJ2CS+Wrc1W/6eoO7MaocI
   w==;
X-CSE-ConnectionGUID: 76Eze8kmThO6vYap5AEjDg==
X-CSE-MsgGUID: w+BTNXzmQq2NB5jilYqvTg==
X-IPAS-Result: =?us-ascii?q?A+B/BQDcJfdq/wCiACoSAIIYWh4BAQsSDIIFC4oPkCoBA?=
 =?us-ascii?q?QEBAQEGgT6LeJQrDwEPAQFRBAEBhQUCjh8oNwYOAQIEAwIDAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBCgEBBgEBAQEBAQYFgSGGCVOQEwIBAyMPAQVBEAsaAiYCAlYbAQGCfoJ1u?=
 =?us-ascii?q?zqBMoEB3kmBdBWBCi6IYgGFeAEbhGKBP4EQgRUnC4JJMT6FEIMPgmoEgiKBD?=
 =?us-ascii?q?IJchTqILIc1Unh4LAFVExcLBwWBJUMDgQYjSwUtHYEjIR0XER5YGwYFEiAqQ?=
 =?us-ascii?q?ENbgRKBBV2BKyhdAQIfRi0VgXUCglGBIwJbAgFJQQ4HRVMJJUMSRyQiCBIJA?=
 =?us-ascii?q?RMaLAqBGjU8CSYEOxUMWwwLGgUaRwgCCwIMdCgREBMdHiQvBRomPhsKgQ4Fb?=
 =?us-ascii?q?T03CgsZBD2WfIECGxyCf1cBkguDNZBIn1wGgjqBaqFjBkKXVBCRaIEmmQikJ?=
 =?us-ascii?q?IR1AgoHGYF+gX9xgW2BSlIZD44uFtIbgTUBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:wA5msakvQo5BwXPSiptHnqjo5gyiJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJJUTqBafreYGakfd11O9m/80hTvZ7Xz9BqQVM+rntmQ1tH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48z8hk/nOGeqkYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArlV
 ena+qUzA3f7nWQrWo4ow/jb8k025a2p4GpwUmEWPJingneOzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlkvF/w0gA8+Sib3ydEsHWNb6ZWBiXVIPBsBOKjAbzsAD+v5T2Mg0MC+7uB3V9zxF8
 +ihgLTrIesf0gwgr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCAWluVbD09NqbDkkRq
 9EKJWAOayyDoLyo8bujF8BBhOgseZyD0IM34hmMzBnCCOo+BJfeX+DQ5YAexi0iwN1IHLPdY
 Mcdb3xjYXwsYTUVMw9PWptkxL/63iumKW8K8QvFzUY0yzG7IAhZ1bXsK9fTc4aiWMNU20Wfq
 2bAuWj0av0fHIfGkmLdqyn87gPJtTy4cr40JK+9z+cwpnfOxG0XOQQIaVTu9JFVjWb7AbqzM
 Xc85iEupLQ77kCDQdz0Xhn+q3mB1jYVXdZKEvx88wGA1KHU7gCaAUAFSCJMbJots8pebTAoz
 ESCltftFBRgtbSUTTSW8bL8hTO7PzMaBWwPfykJSU0C+daLiIA3lhWJTN95Dq+zg9vdHTD23
 iDMrS4iirFVhskOv4259FvAmzXqo5/PQg8d5wnaV3mi6Al+bZSpIYev7DDz6ftNBIWUVF+Mu
 D4Dgcf2xOQPC4yd0S+AWuMAGJm36Pufdj7Rm1hiG98m7TvF03qie51ApTRzKEZgGtgLdCWvY
 0LJvw5VophJMxOCaKR3boK4AewpwLLmGNCjUerbBvJIY5NxcwuO5wl0YlKQ0mXkkUxql6wjU
 b+Ddc+wA3EADOFr1juoSv1Ywe917j4xyHmVRp3hyRmjl72Eaxa9Ur4GOUGPKOk46L6fiAHU9
 ctPccqM1xhbFub5Z0H/78gNLEwNM2QTCpX/qsgRfemGSjeKA0k6DuPJhLQ8Z8l/n/sTjP3au
 Gy7Wwpbz1f7gzvLJG1md0xeVV8mZr4nxVpTAMDmFQ/AN6QLCWp30JoiSg==
IronPort-HdrOrdr: A9a23:zStah68/zp80i+IneDluk+DjI+orL9Y04lQ7vn2ZLiYlFfBw9v
 re+MjzuiWVtN98Yh0dcLO7WZVoI0msl6KdiLN5VdzOYOCMghrKEGgN1+TfKnHbdRHWx6p06Z
 pAN5JfMbTLZ2ST/K3BkWyF+7pM+qjgzJyV
X-Talos-CUID: 9a23:78YEI29PgCkukAgjdteVvxFKN9IoIn7Y8Hf3fVGJAH40YZCXZVDFrQ==
X-Talos-MUID: 9a23:KfXyQAoAZiKVwPc7XH4ezy4hHvtO07arMVlXt79buciABDVuBzjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,211,1787004000"; 
   d="scan'208";a="31300138"
Received: from smtp-out-rh7.rrz.uni-koeln.de ([IPv6:2a00:a200:0:12::118])
  by mail-out-v1.uni-koeln.de with ESMTP/TLS/ECDHE-ECDSA-AES256-GCM-SHA384; 13 Nov 2026 16:04:31 +0100
Received: from smtp-auth-rh8.rrz.uni-koeln.de (smtp-auth-rh8.rrz.uni-koeln.de [IPv6:2a00:a200:0:10::196])
	by smtp-out.rrz.uni-koeln.de (8.14.7/8.14.7) with ESMTP id 6ADF4TjZ040570;
	Fri, 13 Nov 2026 16:04:29 +0100
Received: from [IPV6:2a00:6020:4cbb:ef00:67c9:8c15:7e4f:3b9d] ([IPv6:2a00:6020:4cbb:ef00:67c9:8c15:7e4f:3b9d])
	(authenticated as user meisena2 using CRAM-MD5 bits=0)
	by smtp-auth.uni-koeln.de (8.15.2/8.15.2) with ESMTPSA id 6ADF4SdN1399821
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 16:04:29 +0100
Message-ID: <be6f70a3-5792-4a4b-9f03-591869fb9786@uni-koeln.de>
Date: Fri, 13 Nov 2026 16:04:28 +0100
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
To: tchatard@gmail.com
Cc: andriy.shevchenko@intel.com, djrscally@gmail.com, hansg@kernel.org,
        ilpo.jarvinen@linux.intel.com, jacopo.mondi@ideasonboard.com,
        lee@kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        nicholas@rothemail.net, platform-driver-x86@vger.kernel.org,
        sakari.ailus@linux.intel.com, v.vitovt@gmail.com
References: <20260827201611.99825-1-tchatard@gmail.com>
Subject: Re: [PATCH v9 0/6] Enable cameras on Dell Latitude 5285 2-in-1
Content-Language: de-DE
From: Matthias Eisenacher <meisena2@uni-koeln.de>
In-Reply-To: <20260827201611.99825-1-tchatard@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.3

Hi Thierry,

Thanks for this work. A short report from a Dell Latitude 5290 2-in-1
(same platform as the 5285), in case it helps to extend this series
to the 5290.

I did not apply this series. Instead I tested the minimal changes
needed for the front camera on the 5290:

- Linux Mint 22 (Ubuntu 24.04 base), kernel 7.0.0-43-generic (HWE)
- Added a DMI entry for "Latitude 5290 2-in-1" to
   int3472_tps68470_board_data_table, reusing
   dell_7212_tps68470_board_data
- Booted with acpi_enforce_resources=lax as a stand-in for your
   intel-lpss quirk. Without it I get the same I2C4 conflict as on
   the 5285:

   ACPI Warning: SystemMemory range 0x00000000FE028000-0x00000000FE0281FF
   conflicts with OpRegion 0x00000000FE028000-0x00000000FE028207
   (\_SB.PCI0.GEXP.BAR0)
   intel-lpss INT3446:00: probe with driver intel-lpss failed with error -16

With both changes the front camera (OV5670/INT3479) works: cam -l
lists "Internal front camera (\_SB_.PCI0.LNK0)", and I get video via
libcamerasrc/GStreamer and in Zoom (via libcamerify). The rear camera
was not tested.

DMI: sys_vendor "Dell Inc.", product_name "Latitude 5290 2-in-1",
board 09WJPW.

So the 5290 seems to need the same intel-lpss quirk plus board data.
Vitalii's tree has 5290 board data; would it make sense to add the
5290 DMI matches to this series or to a follow-up? I'm happy to test
patches on the 5290.

Thanks,
Matthias
