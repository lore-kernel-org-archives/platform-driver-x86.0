Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E1F4DE703
	for <platform-driver-x86@vger.kernel.org>; Tue, 22 Sep 2026 09:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070709; cv=none; b=TwbTyKqmGYnFP4MjuiejdHBMeAQtq9CChHJdWjxfCMvC68cA/zJwRYid8nFnoPUy3JBndI8ovNOhcgPWQHTvueobWi/117g3tMFsBWiWcZW07WCpt6Hdfhq3Q4fZVcPryec08ZmaNcWrNX5s89hdMjPzx/8WCNltMsTCd32DzY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070709; c=relaxed/simple;
	bh=ZBPCUNSzlh8OrE7I3vX7kLf5GHZkpBuPSmSzeXxhF/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DUEm6h/rUwsfvmUVyPMjL3XigFbUdV0ippsH8JrH8WqCDu6FNbaXsuDkx4vOCZ/1I0ffr/rvUUjf/1X57POCscRkib6SGUeqghgXmY8S0mqlE2t4P+tHui8XFb6A1PmtcooCObSSQXAa7vsOuVy5LIEowy5GiY3BmylYRoLAyBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JV+oi2st; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JV+oi2st"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a985fba28bso4754280a12.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Sep 2026 02:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790070701; x=1790675501; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0ojJwuub1Y4MtscC/4lreaXIfEEy9YAbRM1nlvmy108=;
        b=JV+oi2st557afPOPicddWXalRHHtnM7WNv5Mq4UzWwFx/9wBUdQWoUQmG08EIBEJts
         5h0R3ALakbAEj7Ee6JDQSEFLbaaNTlh7Nd9OVhO35kf4Zf8eG6fSSYw2R7Ff/0XA34wB
         Ahkki4Mobza8/mbhuR7r/NrM126sPnYsQslvRL4OdlkhgqpH9a0/pcDXYkXGlRR2ksv3
         TSzQ6/E2FJUlgcdboaAiWYLgyJ/3vVo+pgbZBtzQz+1o9yPj/i5ydqDyZvN8iL60PSHH
         BCVbdVHFIMhnLdgjmfvEMFcucqQUP/e9H3BqEYEWr8t86ektI4vAPeKu5ynUQx2QAkta
         HRcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790070701; x=1790675501;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ojJwuub1Y4MtscC/4lreaXIfEEy9YAbRM1nlvmy108=;
        b=tpC4xL2xYZ07S/lkeA+80H9yItXFg5dCtJcI36YxN1FxRACHRDNdHTZgvjoeKtDvUC
         j9TbGbLJwG0WAtgPICyk7WTrMcivm6DF5T4qe539b6+B7Q74RAxQnx+qJey/HuHXCDbB
         iNwdV8KxKZxWPO8EoptR2Q/M5KIpnsloXx7o3dOvQT/mck3mycs/JxPP4wJMbVtz+Kf5
         MNym70MxQEEk/GZEu72DlAkUP8F8mdimPYFFItxGE4oUWocpAL9BiOloxASR1cWPUIwD
         h/Gcrw/76/9PmL+zwCv7Da4IZu7dA4neBN1UmDRgTGTqBwJW0Le9z6Fr7P73sSUxum2c
         xoiw==
X-Forwarded-Encrypted: i=1; AKwUvBzmVYlsIY17UzBIjQx6f9O1DBfgoB9m3aLODxtZLOopp3kA5TI8mbSozy+1KIKzkvHPfT6eKT6hGljGv1xMGGGrsfWM@vger.kernel.org
X-Gm-Message-State: AFuF++nMXS+wJpL/R4dZz3uORQoEsgAh+Vuq9KY8hEeW7YwFkW5sGPqK
	cc0fFVNv8AexuaEDThYvm1vo4KtIcay0DvVSRT9jJbrzUjaGZPnKKM4m
X-Gm-Gg: AYBFou1XYInP9qyofFWX0ibnAXpO6Y0AgLks+d4ktB7yliT/FshKm1TaHQC3JqKcIQ/
	U5ntHnZ1kqCxhnOehbF4om07b3cM3W55Im71TZvkTaacqwHkYwd1z5tG4yPM8P3xEScdfLh3mMl
	W3kIc2EFQqPiEpRHPoy2C6l2bWnO2C/tiMA3pnCGKeq8Ciba4lXBOLAggBiRE02qOALTTilIRiU
	5NsVhFQvt1RL5g1k10UTF3eotCaOYhtV46LiS96P+BteQ52lqX6tDsHdelnzghzdZKOHdYo7/Y7
	miqPcosyrGTrm5zAkaZznNIxu4tQP4g7VflyIH2Vn5BdxyubHc/D5UnYXL6smtg3stK89QUN8Un
	2CPE5aAqqnlAowba8dcZcRem9qV68Bu6H+Eju0xHX/ksU+6S987yTqWNuF9gGOOSFkNuzoE5Jr3
	20BOsd46QkxMi/kXm+WTDerN3bk3gh58B61ti/dR9j6R1Ni20ZMUr87La5MI46xjFZysgmdKc7f
	7M5tA==
X-Received: by 2002:a05:6402:e04:b0:6a9:946a:d085 with SMTP id 4fb4d7f45d1cf-6aa53142126mr11493309a12.19.1790070700342;
        Tue, 22 Sep 2026 02:51:40 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa4510c0fsm709687a12.23.2026.09.22.02.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 02:51:39 -0700 (PDT)
Date: Tue, 22 Sep 2026 12:51:36 +0300
From: Dan Carpenter <error27@gmail.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Markus Elfring <Markus.Elfring@web.de>,
	platform-driver-x86@vger.kernel.org,
	Bao Cheng Su <baocheng.su@siemens.com>,
	Benedikt Niedermayr <benedikt.niedermayr@siemens.com>,
	Hans de Goede <hansg@kernel.org>,
	Henning Schild <henning.schild@siemens.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Tobias Schaffner <tobias.schaffner@siemens.com>,
	stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] platform/x86: simatic-ipc: fix platform device leak on
 registration failure
Message-ID: <arJPqCrNK-NR41uU@stanley.mountain>
References: <20260921075312.120983-1-lgs201920130244@gmail.com>
 <cdb67eed-9e75-4310-ae4f-21ca67f20bd2@web.de>
 <CANUHTR9+rLuPrd1aifKws++POOKSm+2jxBaJaC1iF5z5x0e13Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANUHTR9+rLuPrd1aifKws++POOKSm+2jxBaJaC1iF5z5x0e13Q@mail.gmail.com>

On Tue, Sep 22, 2026 at 04:13:17PM +0800, Guangshuo Li wrote:
> 
> Would it make sense to share the cleanup path and rely on
> platform_device_unregister() handling NULL/ERR_PTR, like this?
> 
> +static void unregister_platform_devices(void)
> +{
> +        platform_device_unregister(ipc_wdt_platform_device);
> +        platform_device_unregister(ipc_led_platform_device);
> +        platform_device_unregister(ipc_batt_platform_device);
> +}

Having one magical cleanup function is the most bug prone way to
write cleanup.  Use an unwind ladder.

https://staticthinking.wordpress.com/2022/04/28/free-the-last-thing-style/

regards,
dan carpenter

