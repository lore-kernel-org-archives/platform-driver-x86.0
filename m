Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99021514F8
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Apr 2026 18:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775844042; cv=none; b=IQYcy63mS+D1qP2U/Meclhi1xf213s95JUwhyegKMmZdEne/9rA0hiuYk8SMD5+1wxrH8UNqcDDZHM43opGDZETBNj0kaST6LLHs30Ic7RTV+P+NIA6PPyu+F3GSBfuOAuHgdJiOmgH6V47W6Eupr1Gw8hnWtLKQiA9gt98xPaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775844042; c=relaxed/simple;
	bh=H2RZIzbIDZJk597igH7hAjtJ9BegW0q39jX5l+mN+hE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TIJilKIfP1NsFi4dGFjOTLV1F4oJjdnR0holieJOx6YQkdI9mdSDlq/Bwg4rUZH0kv96kRPLeBTC4mTGT0yMCzlPAvHw/pfk8/t+pr+yzviMl62/8NBabSL6a5fYBO4ZqegnapeDfRgQV0OlzxUoBVozYVBNMTglmpikOGdMhM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=csR+4xYB; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="csR+4xYB"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82cef263bedso1177835b3a.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Apr 2026 11:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775844041; x=1776448841; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FlEmyexTO2RDck5s0MiJQuaNVdk07ePYu9rIZ6wphuc=;
        b=csR+4xYBEBFxgFr4CnHlWdwIEBuogCX5pMPsqc4e2l+5vhF92xHJPtVxPIqz/t+Mip
         fS6fIuEzghHUyg/QPLUQmx3rVYOPgqZHoFIePii34uoU47AEA1kxVKgKpEUiqLpuaMj7
         qwJS5Q+4X6R5GQdjqV8rCyZvMEIO3owRWHoKpieXo6a8/mZLctzN+pPkUCq79KSL4zXU
         6KKjDzxmvC+6txQbCYynxaKPdoMhHgmRrTsUxSHUz7OPkR9Eo2dicbZbEw5k7DC5hYKb
         E5FTUhBJEMos0PJos6RqmKbMb91GCTs2FXys84eDOgRh3ElccnOOexotgcPD+ZBdfWsY
         1Zzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775844041; x=1776448841;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FlEmyexTO2RDck5s0MiJQuaNVdk07ePYu9rIZ6wphuc=;
        b=REDz46Qii6/D+zfXpHJVudhM6PUuT5DRF/GQ71fu97LOGBUeiRil6tB/E9OZqPuhPe
         R6xpTxfew+INpmczu0giLDWUyEsjBwiLLe/7aI6LudcuGXLub/NiSR3665/sJB7zfwR5
         991C9piA+9RQe+0sYWKv15ZYs+Fcgq82MrUjLz7Gcc05DfoYYdg4mgkyCEroE2XZbEAM
         Vcu63LGqZ1jxz5z7wrjw05K9akuE+iqezQ/A49YHiIQPAdyrifKe0eWbBnc2c6z7zujr
         vYUhTxPues6Usv/2tGRZcWEf3DGtLoD0CaRoPiyfTbfeqj8Rq8eWU7OxZpA7POyWS1yn
         x2uA==
X-Forwarded-Encrypted: i=1; AJvYcCX7HKNhEwGDSNUGzY0htvCsw3X4MwJa6qkP1LWGBxtx6C657x5TGOP9zPjYx/5yWQMn1VeTR4nMzE1tSAaGLM04ahYY@vger.kernel.org
X-Gm-Message-State: AOJu0YziB6Ez2b5qyRnlZ+gr5bNvS/ANSiqQDrxmiMek5F2WUHmPmGJq
	ZnIR6nx3G4IpmehI7488XZoK6IDYtyYYvWNuH4UvS/dnxIcof0DQAKZK
X-Gm-Gg: AeBDieu8mJilr7eg50b2/8hyWuq9bVeW8f5gq1PYCA0I2vu2RziSC4P9ncZ+eq/RGg1
	ikgNt2onW4U1mkBQatuOsuFin7/YT4WIkP/CcUgzVHFlk92+VAE7RqwrDaUqiFGAVMGcA/44+8s
	v6TERnOKnUyhUC3BgnQwyK4AYN88q9MJBIVRinXcTzNDpO/1+CTEVn2pRqEPn+quHyJSD8JjS73
	TI1LS3mABqhR7PIyQ7VL3rp5rwjhmfDzo2RHY5S14Bn9gN2G3Dguo6piTFPgOMr0fGCRfz1xizR
	7WiLS7vBpm3lHrp9ePofACp7EX8AZ7phMdIHNdtymef9dhaUSZkUyTAwfCay+32VyDQ5O0aWpX7
	AGbT6joJ1J9+DiurmnwsSN6YP7gF005UV6byjwt1TMV2d72Qxu9pG/my2SkQE0Und3KNqNyTQGE
	lQvKTh9lswpUTNvG1pdJH8mBjmciKxa1RqiZTLFmHIf/jo1vyflyrm/ESRiWQom2AHKZyWd1Vhx
	XAFNoV0iGJ1xz6ihgfN
X-Received: by 2002:a05:6a00:1994:b0:82c:d6d3:31a1 with SMTP id d2e1a72fcca58-82f0c302eb3mr4526985b3a.29.1775844041104;
        Fri, 10 Apr 2026 11:00:41 -0700 (PDT)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c4b6dd7sm3607837b3a.29.2026.04.10.11.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:00:40 -0700 (PDT)
Date: Fri, 10 Apr 2026 23:30:35 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, Jakie101@proton.me, prasoon5050@outlook.com, 
	absolute3d86@gmail.com
Subject: Re: [PATCH 0/4] platform/x86: hp-wmi: Improve support for some HP
 boards
Message-ID: <adk5pIJbw5p5W54v@archlinux>
References: <20260401111748.106970-1-krishna.chomal108@gmail.com>
 <2e795162-af64-93a5-73a8-a6153ce6d396@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2e795162-af64-93a5-73a8-a6153ce6d396@linux.intel.com>

On Fri, Apr 10, 2026 at 04:52:25PM +0300, Ilpo Järvinen wrote:
>On Wed, 1 Apr 2026, Krishna Chomal wrote:
>
>> This series improves support for some HP boards.
>>
>> The first patch fixes an incorrect assumption in the fan table header
>> which leads to a parsing error and eventually failure to load the driver
>> in some devices.
>>
>> The second patch adds support for board 8D87 by adding it to Victus S
>> list. Unlike other boards, here the EC does not expose platform profile
>> value, so EC readback is disabled.
>>
>> The third patch adds support for board 8A44 by adding to Victus S list.
>>
>> The fourth patch adds support for board 8C77 by adding to Victus S list.
>>
>> Krishna Chomal (4):
>>   platform/x86: hp-wmi: fix fan table parsing
>>   platform/x86: hp-wmi: Add support for OMEN MAX 16-ak0xxx (8D87)
>>   platform/x86: hp-wmi: Add support for Omen 16-n0xxx (8A44)
>>   platform/x86: hp-wmi: Add support for Omen 16-wf1xxx (8C77)
>>
>>  drivers/platform/x86/hp/hp-wmi.c | 74 +++++++++++++++++++++++++++-----
>>  1 file changed, 64 insertions(+), 10 deletions(-)
>
>Hi Krishna,
>
>Could you please respin this series.
>
>I tried to apply it on top of review-ilpo-next but it got so messy I lost
>confidence in being able to  reproduce the changes correctly.
>
>-- 
> i.
>

Sure, I will respin on review-ilpo-next and send as v2 soon.
