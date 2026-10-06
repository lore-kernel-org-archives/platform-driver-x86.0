Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3AD35F5ED
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 Oct 2026 04:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791262195; cv=none; b=VeSlnDK2WRPDHxchkTsv7I05oWfzVFGBtppZgllAzetEkW/VPCcwcRDEeNKKgewjFnvaxxY2QN/umWEQJkemrKGTJNH6bnae6jBca2qGi2AOQvhQRt3Dz3OeGVag2/GLFRbDgp9yZmcL3XAv59rxwffIrYWgw9g5TXhSEW4XFO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791262195; c=relaxed/simple;
	bh=AuKSq5zNoEPdcTVeayPv4nEkgGoFgwVt4mAnVV9DlsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=upzRAyl/vRjOyvMC0ayxnKwG1iIhvwBDPG5q57Dz4/ZijfAgA7MHpmQKkvLPkB0Ov9TDhuZBraVcsZshLq75iiDF1hX55FAbQUJhLRX+iO4UkU6n7H5z/cjtDOzx4nHddeE68Ok++zp+yJHVEKHAwxvezYtRxaBGtcR+G5lYueI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rYSiGKkW; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rYSiGKkW"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-31490970b97so173069eec.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 05 Oct 2026 21:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791262193; x=1791866993; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YrEcoU9FcHdWMW/WvsPqp/tm10NVhSMWvPzpSIVGh4U=;
        b=rYSiGKkW9Zg1QiIvUQZbBbwvqUxoMH1rCicktV6hbOBX6jtsUZaHzkC/xVWIVCmD9H
         GvCDFkvBcJ+BEanOBx0cevccynvToIJBC7by63nan9UdZfGpMDOGmv/RdrfgCc4GX2tq
         DlZDbmOcHhRIIGtfqI+kH7sHtQCdTJoAERKDViebOWXrIWBWPXGMDaJsb5ullbxvT3A0
         Opnlu6hcRYCpzPB1q+Cq+4z80i0jsrKR1Mih8I8g+UON32iv2TFW9F9hjp2ioxWPJB03
         cpKF9bTkV4JgnksFAvniSlgBRau41Pqwcr9SxxoZrT9lrjh7jCyX6L6yn++lcoyU21Pu
         TdCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791262193; x=1791866993;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YrEcoU9FcHdWMW/WvsPqp/tm10NVhSMWvPzpSIVGh4U=;
        b=RMDvQfrCjU2kATpCIDIHMWkX/+XId5VI4uTrWUiLifbK262rsa3HhFXqcUKZuWpCif
         3vdb+ZHwTkvnCDU0gr0YWt5qSwDlkk0YzuCzMM7MoJSZokR5QqhkvpfhSfm/OkM+eBrh
         of4M38O4tadDgNkvoKIbJOcZlm+dGUScriGrFGsU9Nf6UcSroLqdVls1rK2X2D6RiHcV
         tCn2hpq6pKvQU+U87b63TpOoigPS6hK3+013GmDQtYkviCb064NBH6qGxWrdDn7TGV/3
         xNLgIlO0Caa7nrqxdJT9i6u54/4vtha6KvUf76fD3b6NfL8RvZPvdKMufSXL7JCZY3PO
         RTlA==
X-Forwarded-Encrypted: i=1; AKwUvBySB5VIDwV+FZJ6KseI34DcCO1jKapGjg4VB0cQsdRAAHXP08GhuprFsn/l3am6dn0BU9ACV9vMBwEkpSQvshuGBNUG@vger.kernel.org
X-Gm-Message-State: AFq9FYJuxlRTArhf9SaKKB9Yg5bcgcPU9Vp1dTQr65AhnjVSazMqYj1f
	/lTKPKVjyrad9dzTH/csCBgg7I2OI5b1wzKnoy1NFIjBhxTsu/xL8Y4l
X-Gm-Gg: AYBFou1PFR5UVTi6EsJy6/oNl7GDDFiHLH3lT0x7hD85G05oe9q3CPS9zM32jxmNM6A
	GxwgUm3yJxcLfDvZCoLU+eoiNfNhbzo6h4eG7qvgGwq5RypahfOrdEBUmoEuSHPeB1KAS104/Pk
	h5BRUOZGQYNpDn9ZbDlfc5yPwfANyiOYXWlvAC9GNZGM010aW6pRe3csmgpZJ07cRP1nKH07rgH
	/oVJ+gjWpbQrVNs8wRIcONJeQ18balovgm5Zvgs8bU+4Km0lcLFMJRcqFIq9Q4V2dgma6KkhVMh
	fgDkf9/C3Z2V+6qgWuBRO/vhoUECiqvvGqPERDV+dL7BgXoORMGjIb8zYn1YqpSc+b20vX8OCup
	mb9UHR+gj0BzrKahoL0G5E6msAm/Rxer9Oc1ZivR8Kg6896E6a450D8L3lkP+Clw16HTw2WcUJr
	32ral9oKCTi64noTdiGpsQ5osQ0Hybzx8vdSn85ctD4S56JbsjMZt0OL0kaiqgXKwe4l5fQANfd
	E2Q42TRKHP+3vpBo5e3hQM9zbBE52DpPL4ZInJ3pkgmJYbsfvO9EOz19IYO6ui8rPw=
X-Received: by 2002:a05:693c:26cb:b0:351:4b50:4063 with SMTP id 5a478bee46e88-3514e383ee3mr193472eec.37.1791262192567;
        Mon, 05 Oct 2026 21:49:52 -0700 (PDT)
Received: from archlinux ([2405:201:1b:20ef:de2d:6e5b:74df:ad41])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146abff39sm3568320eec.21.2026.10.05.21.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 21:49:52 -0700 (PDT)
Date: Tue, 6 Oct 2026 10:19:45 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Shuwen Bao <baoshuwen2013@outlook.com>
Cc: Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Emre Cecanpunar <emreleno@gmail.com>, 
	Suryansh Singh <technosfan14@gmail.com>, Radhey Kalra <radheykalra901@gmail.com>, 
	=?utf-8?B?S8O8csWfYXQgQWJheWzEsQ==?= <hello@kursatabayli.dev>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: hp-wmi: add support for OMEN 16-am2xxx
 boards
Message-ID: <asR9Q8Xia4ijLvXM@archlinux>
References: <SI2PR04MB58957D08A31E56D73C751885A2862@SI2PR04MB5895.apcprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <SI2PR04MB58957D08A31E56D73C751885A2862@SI2PR04MB5895.apcprd04.prod.outlook.com>

On Sat, Sep 19, 2026 at 09:24:25AM +0800, Shuwen Bao wrote:
>The HP HyperX OMEN 16-am2xxx (DMI board 8F1C, 26C1 platform cycle,
>Arrow Lake-HXR) is listed in the OMEN Command Center device
>capability table with DisplayName "HyperX OMEN 16" and the
>"PerformanceControl" feature, but is missing from the kernel's
>omen_thermal_profile_boards whitelist. The thermal profile path is
>therefore not enabled and the embedded controller keeps the CPU
>pinned at the default frequency cap while running Linux.
>
>Add 8F1C to the OMEN thermal profile board list. On this platform
>the EC firmware also arms its own thermal profile revert timer (EC
>offset 0x63, armed with 0x5a when performance is selected) and
>switches back to the balanced profile once it expires, so also add
>the board to omen_timed_thermal_profile_boards in order to have the
>driver clear the timer and set the NOTIMER|TURBO flags when
>switching to the performance profile. Testing further showed that
>this board uses v0 commands, so also add it to
>omen_thermal_profile_force_v0_boards.
>
>Tested on a HyperX OMEN 16-am2xxx: after loading the patched hp-wmi
>module the platform_profile interface is exposed, and switching to
>the performance profile raises the CPU from a ~2.9 GHz (P-core) /
>2.6 GHz (E-core) cap to ~4.8 GHz / ~4.3 GHz under a single-thread
>load. The EC then reports the performance profile (0x31) with the
>NOTIMER|TURBO flags set (0x62=0x06) and the revert timer cleared
>(0x63=0x00); a plain write of the profile without those flags
>instead arms the timer (0x63=0x5a) and the profile reverts to
>balanced when it expires.

Hi Shuwen Bao,

I was working a patch[1] involving omen_timed_thermal_profile_boards[]
and needed some diagostic info. Would you mind attaching the acpidump
for your board 8F1C?

Thanks!

[1]: https://lore.kernel.org/platform-driver-x86/asPy5Q5wNYaMzTqJ@archlinux/#m922ff6cf9a68285d2b0f64e578fd6d2d6fa573f4

>Signed-off-by: Shuwen Bao <baoshuwen2013@outlook.com>
>---
> drivers/platform/x86/hp/hp-wmi.c | 3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
>index 615b4cf6fc45..f229da54366a 100644
>--- a/drivers/platform/x86/hp/hp-wmi.c
>+++ b/drivers/platform/x86/hp/hp-wmi.c
>@@ -211,6 +211,7 @@ static const char * const omen_thermal_profile_boards[] = {
> 	"8BAD",
> 	"8C58",
> 	"8E41",
>+	"8F1C",
> };
>
> /* DMI Board names of Omen laptops that are specifically set to be thermal
>@@ -220,6 +221,7 @@ static const char * const omen_thermal_profile_boards[] = {
> static const char * const omen_thermal_profile_force_v0_boards[] = {
> 	"8607",
> 	"8746", "8747", "8748", "8749", "874A",
>+	"8F1C",
> };
>
> /* DMI board names of Omen laptops that have a thermal profile timer which will
>@@ -229,6 +231,7 @@ static const char * const omen_thermal_profile_force_v0_boards[] = {
> static const char * const omen_timed_thermal_profile_boards[] = {
> 	"8A15", "8A42",
> 	"8BAD",
>+	"8F1C",
> };
>
> /* DMI Board names of Victus 16-d laptops */
>-- 
>2.53.0
>
